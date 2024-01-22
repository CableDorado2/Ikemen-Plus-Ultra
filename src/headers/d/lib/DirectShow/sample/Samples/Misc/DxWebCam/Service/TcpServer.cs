/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Diagnostics;
using System.Net.Sockets;
using System.Collections;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;

namespace TCP
{
    internal class TcpServer : IDisposable
    {
        // This is not the max number of connections you can have, it's the number
        // that can queue up waiting for you to Accept them.  If more than MAXCONNECTION
        // more clients try to connect while you are servicing another, OnConnect is
        // probably taking too long.
        const int MAXCONNECTIONS = 3;

        #region Member variables

        private ArrayList m_aryClients;
        private Socket m_sockListener;
        private volatile bool m_bShuttingDown;
        private ManualResetEvent ShutDownReady;

        #endregion

        // Return an array of the ip addresses assigned to this pc
        public static IPAddress [] GetAddresses()
        {
            IPAddress [] aryLocalAddr = null;
            string strHostName = "";

            // NOTE: DNS lookups are nice and all but quite time consuming.
            strHostName = Dns.GetHostName();
#if USING_NET11
            IPHostEntry ipEntry = Dns.GetHostByName( strHostName );
#else
            IPHostEntry ipEntry = Dns.GetHostEntry( strHostName );
#endif
            aryLocalAddr = ipEntry.AddressList;

            // Verify we got an IP address.
            if( aryLocalAddr == null || aryLocalAddr.Length < 1 )
            {
                throw new Exception( "Unable to get local address" );
            }

            return aryLocalAddr;
        }

        public TcpServer(int nPortListen)
        {
            _TcpServer(nPortListen, GetAddresses()[0]);
        }
        public TcpServer(int nPortListen, IPAddress ip)
        {
            _TcpServer(nPortListen, ip);
        }

        // Shut down the listener
        public void Dispose()
        {
            // Shutting down is a real PITA.  You can't close the listener
            // while there is an outstanding async call active.  And you can't
            // cancel the async call.  Grr.  As a workaround, this routine
            // makes a connection to the port.  The OnConnect routine, recognizing
            // that we are in shutdown, doesn't create a new async call.
            TcpClient t = null;

            // Only want one thread to be preforming shutdown at a time.
            lock (this)
            {
                // Have we already shutdown?
                if (!m_bShuttingDown)
                {
                    m_bShuttingDown = true;

                    // Disconnect each client
                    foreach (SockWrapper s in m_aryClients)
                    {
                        try
                        {
                            s.Client.Shutdown(SocketShutdown.Both);
                            s.Client.Close();
                        }
                        catch {}
                    }
                    m_aryClients = null;

                    // Connect to the port to trigger the async listener
                    IPEndPoint ep = (IPEndPoint)m_sockListener.LocalEndPoint;
                    t = new TcpClient(ep.Address.ToString(), ep.Port);
                }
            }

            if (t != null)
            {
                // Listen for the async listener to let go.  This must be done
                // outside the crit section since the listener needs to lock it.
                ShutDownReady.WaitOne(3000, false);

                lock (this)
                {
                    // close everything down
                    m_sockListener.Close();
                    m_sockListener = null;
                    t.Close();
                    ShutDownReady.Close();
                    ShutDownReady = null;
                }
            }
        }
        ~TcpServer()
        {
            // If Dispose is not called against our class and the destructor is 
            // called, some of the member variables in this class have already 
            // been disposed.  Such being the case, there's no way to clean up 
            // nicely.  Moral: Always call Dispose.

            //Dispose();
        }

        // Send to all connected clients
        public void SendToAll(MemoryStream m)
        {
            _SendToAll(m.GetBuffer(), (int)m.Length);
        }

        public void SendToAll(byte [] b)
        {
            _SendToAll(b, b.Length);
        }

        public int Connections
        {
            get { return m_aryClients.Count; }
        }


        public event TcpConnected Connected;
        public event TcpConnected Disconnected;
        public event TcpReceive DataReceived;
        public event TcpSend Send;

        private void _TcpServer(int nPortListen, IPAddress ip)
        {
            try
            {
                // Initialize member vars
                m_aryClients = new ArrayList(5);
                ShutDownReady = new ManualResetEvent(false);
                m_bShuttingDown = false;

                // Create the listener socket in this machine's IP address
                m_sockListener = new Socket( AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp );
                m_sockListener.Bind( new IPEndPoint( ip, nPortListen ) );
                m_sockListener.Listen( MAXCONNECTIONS );

                // Setup a callback to be notified of connection requests
                m_sockListener.BeginAccept( new AsyncCallback( OnConnectRequest ), m_sockListener );
            }
            catch
            {
                m_bShuttingDown = true;
                throw;
            }
        }

        private void _SendToAll(byte [] b, int iLength)
        {
            lock (this)
            {
                if (!m_bShuttingDown)
                {
                    foreach (SockWrapper s in m_aryClients)
                    {
                        _SendOne(s, b, iLength);
                    }
                }
            }
        }

        private void _SendOne(SockWrapper s, byte [] b, int iLength)
        {
            try
            {
                bool bSend = true;

                if (Send != null)
                    Send(this, ref s.obj, ref bSend);

                if (bSend)
                    s.Client.Send(b, iLength, SocketFlags.None);
            }
            catch
            {
                // Ignore the error.  If the client is dead, OnReceiveData
                // will be called to close the connection.  I would remove it
                // anyway, except bad things happen if you remove an entry
                // from a list while using foreach.
            }
        }

        // Client has connected
        private void OnConnectRequest( IAsyncResult ar )
        {
            // Get the listener and client
            Socket listener = (Socket)ar.AsyncState;
            Socket client = listener.EndAccept( ar );

            lock (this)
            {
                if (!m_bShuttingDown)
                {
                    // Wrap the client and add it to the array
                    SockWrapper s = new SockWrapper(client);
                    m_aryClients.Add( s );

                    // Fire the Connected event
                    if (Connected != null)
                        Connected(this, ref s.obj);

                    // Set up an async wait for packets from the client
                    AsyncCallback receiveData = new AsyncCallback( OnReceivedData );
                    s.Client.BeginReceive( s.byBuff, 0, s.byBuff.Length, SocketFlags.None, receiveData, s );

                    // (Re)Setup a callback to be notified of connection requests
                    listener.BeginAccept(new AsyncCallback( OnConnectRequest ) , listener );
                }
                else
                {
                    // If we are in shutdown mode, DON'T add
                    // the connection to the array, DON'T setup
                    // the async listen, and DO set the event
                    // to say we are done.
                    ShutDownReady.Set();
                }
            }
        }	

        // Client has sent data, or has disconnected
        private void OnReceivedData( IAsyncResult ar )
        {
            // Socket was the passed in object
            SockWrapper s = (SockWrapper)ar.AsyncState;

            lock (this)
            {
                if (!m_bShuttingDown)
                {
                    // Check if we got any data
                    try
                    {
                        int nBytesRec = s.Client.EndReceive( ar );
                        if( nBytesRec > 0 )
                        {
                            if (DataReceived != null)
                                DataReceived(this, ref s.obj, ref s.byBuff, nBytesRec);

                            // Restablish the callback
                            AsyncCallback receiveData = new AsyncCallback( OnReceivedData );
                            s.Client.BeginReceive( s.byBuff, 0, s.byBuff.Length, SocketFlags.None, receiveData, s );
                        }
                        else
                        {
                            // If no data was received then the connection is probably dead
                            RemoveConnection(s);
                        }
                    }
                    catch
                    {
                        RemoveConnection(s);
                    }
                }
            }
        }

        // Remove a connection from the list of active connections
        private void RemoveConnection(SockWrapper s)
        {
            try
            {
                s.Client.Shutdown( SocketShutdown.Both );
                s.Client.Close();
            }
            catch {}

            // Remove it from the array
            try
            {
                m_aryClients.Remove( s );
            }
            catch {}

            // Fire the Disconnected event
            if (Disconnected != null)
                Disconnected(this, ref s.obj);
        }


        // Wrapper for each client (stored in m_aryClients)
        internal class SockWrapper
        {
            // The buffer is used by receive
            public Socket Client;
            public byte [] byBuff;
            public object obj;

            public SockWrapper(Socket client)
            {
                Client = client;
                byBuff = new byte[256];
                obj = new object();
            }
        }
    }
    public delegate void TcpConnected(Object sender, ref object o);
    public delegate void TcpSend(Object sender, ref object o, ref bool b);
    public delegate void TcpReceive(Object sender, ref object o, ref byte [] b, int ByteCount);
}