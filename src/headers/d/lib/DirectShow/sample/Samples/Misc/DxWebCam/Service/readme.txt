---------------------------------------------------------------------
WebCamService

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

A poor man's web cam program. This application runs as a Win32 Service.  
It takes the output of a capture graph, turns it into a stream of JPEG 
files, and sends it thru TCP/IP to a client application.

Vista warnings:

The debug version of the server tries to create a log file at c:\.  Vista doesn't allow
this.  Either build retail, or change the location of the file.

Also, TcpServer.GetAddresses()[0] on vista doesn't always give the ip address of the local 
machine.  This may require adjustment as well.