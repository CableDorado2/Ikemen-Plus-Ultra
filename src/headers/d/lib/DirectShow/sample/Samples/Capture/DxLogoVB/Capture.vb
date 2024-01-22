'****************************************************************************
'While the underlying libraries are covered by LGPL, this sample is released 
'as public domain.  It is distributed in the hope that it will be useful, but 
'WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
'or FITNESS FOR A PARTICULAR PURPOSE.  
'*****************************************************************************/

Imports System
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Runtime.InteropServices
Imports System.Diagnostics

Imports DirectShowLib

Public Class Capture
    Implements ISampleGrabberCB
    Implements IDisposable

#Region "Member variables"

    ' <summary> graph builder interface. </summary>
    Private m_graphBuilder As IFilterGraph2 = Nothing
    Private m_mediaCtrl As IMediaControl = Nothing

    ' <summary> Set by async routine when it captures an image </summary>
    Private m_bRunning As Boolean = False

    ' <summary> Dimensions of the image, calculated once in constructor. </summary>
    Private m_videoWidth As Integer
    Private m_videoHeight As Integer
    Private m_stride As Integer

    Private m_bmdLogo As BitmapData = Nothing
    Private m_Bitmap As Bitmap = Nothing

#If Debug Then
    ' Allow you to "Connect to remote graph" from GraphEdit
    Private m_rot As DsROTEntry = Nothing
#End If

#End Region

#Region "API"

    Declare Sub CopyMemory Lib "Kernel32.dll" Alias "RtlMoveMemory" (ByVal Destination As IntPtr, ByVal Source As IntPtr, <MarshalAs(UnmanagedType.U4)> ByVal Length As Integer)

#End Region

    ' zero based device index, and some device parms, plus the file name to save to
    Public Sub New(ByVal iDeviceNum As Integer, ByVal iFrameRate As Integer, ByVal iWidth As Integer, ByVal iHeight As Integer, ByVal FileName As String)
        Dim capDevices As DsDevice()

        ' Get the collection of video devices
        capDevices = DsDevice.GetDevicesOfCat(FilterCategory.VideoInputDevice)

        If (iDeviceNum + 1 > capDevices.Length) Then
            Throw New Exception("No video capture devices found at that index!")
        End If

        Dim dev As DsDevice = capDevices(iDeviceNum)

        Try
            ' Set up the capture graph
            SetupGraph(dev, iFrameRate, iWidth, iHeight, FileName)
        Catch
            Dispose()
            Throw
        End Try
    End Sub
    ' <summary> release everything. </summary>
    Public Sub Dispose() Implements IDisposable.Dispose
        CloseInterfaces()
        If (Not m_Bitmap Is Nothing) Then
            m_Bitmap.UnlockBits(m_bmdLogo)
            m_Bitmap = Nothing
            m_bmdLogo = Nothing
        End If
    End Sub
    Protected Overloads Overrides Sub finalize()
        CloseInterfaces()
    End Sub

    ' <summary> capture the next image </summary>
    Public Sub Start()
        If (m_bRunning = False) Then
            Dim hr As Integer = m_mediaCtrl.Run()
            DsError.ThrowExceptionForHR(hr)

            m_bRunning = True
        End If
    End Sub
    ' Pause the capture graph.
    ' Running the graph takes up a lot of resources.  Pause it when it
    ' isn't needed.
    Public Sub Pause()
        If (m_bRunning) Then
            Dim hr As Integer = m_mediaCtrl.Pause()
            DsError.ThrowExceptionForHR(hr)

            m_bRunning = False
        End If
    End Sub

    ' <summary> Specify the logo file to write onto each frame </summary>
    Public Sub SetLogo(ByVal fileName As String)
        SyncLock Me
            If (fileName.Length > 0) Then
                m_Bitmap = New Bitmap(fileName)

                Dim r As Rectangle = New Rectangle(0, 0, m_Bitmap.Width, m_Bitmap.Height)
                m_bmdLogo = m_Bitmap.LockBits(r, ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb)
            Else
                If Not m_Bitmap Is Nothing Then
                    m_Bitmap.UnlockBits(m_bmdLogo)
                    m_Bitmap = Nothing
                    m_bmdLogo = Nothing
                End If
            End If
        End SyncLock
    End Sub

    ' <summary> build the capture graph for grabber. </summary>
    Private Sub SetupGraph(ByVal dev As DsDevice, ByVal iFrameRate As Integer, ByVal iWidth As Integer, ByVal iHeight As Integer, ByVal FileName As String)

        Dim hr As Integer

        Dim sampGrabber As ISampleGrabber = Nothing
        Dim baseGrabFlt As IBaseFilter = Nothing
        Dim capFilter As IBaseFilter = Nothing
        Dim muxFilter As IBaseFilter = Nothing
        Dim fileWriterFilter As IFileSinkFilter = Nothing
        Dim capGraph As ICaptureGraphBuilder2 = Nothing

        ' Get the graphbuilder object
        m_graphBuilder = DirectCast(New FilterGraph(), IFilterGraph2)
        m_mediaCtrl = DirectCast(m_graphBuilder, IMediaControl)

#If Debug Then
        m_rot = New DsROTEntry(m_graphBuilder)
#End If

        Try
            ' Get the ICaptureGraphBuilder2
            capGraph = DirectCast(New CaptureGraphBuilder2(), ICaptureGraphBuilder2)

            ' Get the SampleGrabber interface
            sampGrabber = DirectCast(New SampleGrabber(), ISampleGrabber)

            ' Start building the graph
            hr = capGraph.SetFiltergraph(DirectCast(m_graphBuilder, IGraphBuilder))
            DsError.ThrowExceptionForHR(hr)

            ' Add the video device
            hr = m_graphBuilder.AddSourceFilterForMoniker(dev.Mon, Nothing, dev.Name, capFilter)
            DsError.ThrowExceptionForHR(hr)

            baseGrabFlt = DirectCast(sampGrabber, IBaseFilter)
            ConfigureSampleGrabber(sampGrabber)

            ' Add the frame grabber to the graph
            hr = m_graphBuilder.AddFilter(baseGrabFlt, "Ds.NET Grabber")
            DsError.ThrowExceptionForHR(hr)

            ' If any of the default config items are set
            If (iFrameRate + iHeight + iWidth > 0) Then

                SetConfigParms(capGraph, capFilter, iFrameRate, iWidth, iHeight)
            End If

            hr = capGraph.SetOutputFileName(MediaSubType.Avi, FileName, muxFilter, fileWriterFilter)
            DsError.ThrowExceptionForHR(hr)

            hr = capGraph.RenderStream(PinCategory.Capture, MediaType.Video, capFilter, baseGrabFlt, muxFilter)
            DsError.ThrowExceptionForHR(hr)

            SaveSizeInfo(sampGrabber)

        Finally

            If (Not fileWriterFilter Is Nothing) Then
                Marshal.ReleaseComObject(fileWriterFilter)
                fileWriterFilter = Nothing
            End If
            If (Not muxFilter Is Nothing) Then
                Marshal.ReleaseComObject(muxFilter)
                muxFilter = Nothing
            End If
            If (Not capFilter Is Nothing) Then
                Marshal.ReleaseComObject(capFilter)
                capFilter = Nothing
            End If
            If (Not sampGrabber Is Nothing) Then
                Marshal.ReleaseComObject(sampGrabber)
                sampGrabber = Nothing
            End If
        End Try
    End Sub

    ' <summary> Read and store the properties </summary>
    Private Sub SaveSizeInfo(ByVal sampGrabber As ISampleGrabber)

        Dim hr As Integer

        ' Get the media type from the SampleGrabber
        Dim media As AMMediaType = New AMMediaType()
        hr = sampGrabber.GetConnectedMediaType(media)
        DsError.ThrowExceptionForHR(hr)

        If (Not (media.formatType.Equals(FormatType.VideoInfo)) AndAlso Not (media.formatPtr.Equals(IntPtr.Zero))) Then
            Throw New NotSupportedException("Unknown Grabber Media Format")
        End If

        ' Grab the size info
        Dim vInfoHeader As VideoInfoHeader = New VideoInfoHeader()
        Marshal.PtrToStructure(media.formatPtr, vInfoHeader)
        m_videoWidth = vInfoHeader.BmiHeader.Width
        m_videoHeight = vInfoHeader.BmiHeader.Height
        m_stride = m_videoWidth * (vInfoHeader.BmiHeader.BitCount / 8)

        DsUtils.FreeAMMediaType(media)
        media = Nothing
    End Sub
    ' <summary> Set the options on the sample grabber </summary>
    Private Sub ConfigureSampleGrabber(ByVal sampGrabber As ISampleGrabber)
        Dim hr As Integer
        Dim media As AMMediaType = New AMMediaType()

        media.majorType = MediaType.Video
        media.subType = MediaSubType.RGB24
        media.formatType = FormatType.VideoInfo
        hr = sampGrabber.SetMediaType(media)
        DsError.ThrowExceptionForHR(hr)

        DsUtils.FreeAMMediaType(media)
        media = Nothing

        ' Configure the samplegrabber callback
        hr = sampGrabber.SetCallback(Me, 1)
        DsError.ThrowExceptionForHR(hr)
    End Sub

    ' Set the Framerate, and video size
    Private Sub SetConfigParms(ByVal capGraph As ICaptureGraphBuilder2, ByVal capFilter As IBaseFilter, ByVal iFrameRate As Integer, ByVal iWidth As Integer, ByVal iHeight As Integer)
        Dim hr As Integer

        Dim o As Object = Nothing
        Dim media As AMMediaType = Nothing
        Dim videoStreamConfig As IAMStreamConfig
        Dim videoControl As IAMVideoControl = DirectCast(capFilter, IAMVideoControl)

        ' Find the stream config interface
        hr = capGraph.FindInterface(PinCategory.Capture, MediaType.Video, capFilter, GetType(IAMStreamConfig).GUID, o)

        videoStreamConfig = DirectCast(o, IAMStreamConfig)
        Try
            If (videoStreamConfig Is Nothing) Then
                Throw New Exception("Failed to get IAMStreamConfig")
            End If

            ' Get the existing format block
            hr = videoStreamConfig.GetFormat(media)
            DsError.ThrowExceptionForHR(hr)

            ' copy out the videoinfoheader
            Dim v As VideoInfoHeader = New VideoInfoHeader()
            Marshal.PtrToStructure(media.formatPtr, v)

            ' if overriding the framerate, set the frame rate
            If (iFrameRate > 0) Then
                v.AvgTimePerFrame = 10000000 / iFrameRate
            End If

            ' if overriding the width, set the width
            If (iWidth > 0) Then
                v.BmiHeader.Width = iWidth
            End If

            ' if overriding the Height, set the Height
            If (iHeight > 0) Then
                v.BmiHeader.Height = iHeight
            End If

            ' Copy the media structure back
            Marshal.StructureToPtr(v, media.formatPtr, False)

            ' Set the new format
            hr = videoStreamConfig.SetFormat(media)
            DsError.ThrowExceptionForHR(hr)

            DsUtils.FreeAMMediaType(media)
            media = Nothing

            ' Fix upsidedown video
            If (Not videoControl Is Nothing) Then
                Dim pCapsFlags As VideoControlFlags

                Dim pPin As IPin = DsFindPin.ByCategory(capFilter, PinCategory.Capture, 0)
                hr = videoControl.GetCaps(pPin, pCapsFlags)
                DsError.ThrowExceptionForHR(hr)

                If ((pCapsFlags & VideoControlFlags.FlipVertical) > 0) Then
                    hr = videoControl.GetMode(pPin, pCapsFlags)
                    DsError.ThrowExceptionForHR(hr)

                    hr = videoControl.SetMode(pPin, 0)
                End If
            End If
        Finally
            Marshal.ReleaseComObject(videoStreamConfig)
        End Try
    End Sub

    ' <summary> Shut down capture </summary>
    Private Sub CloseInterfaces()
        Dim hr As Integer

        Try
            If (Not m_mediaCtrl Is Nothing) Then

                ' Stop the graph
                hr = m_mediaCtrl.Stop()
                m_mediaCtrl = Nothing
                m_bRunning = False
            End If
        Catch ex As Exception
            Debug.WriteLine(ex)
        End Try

#If Debug Then
        If (Not m_rot Is Nothing) Then
            m_rot.Dispose()
            m_rot = Nothing
        End If
#End If

        If (Not m_graphBuilder Is Nothing) Then
            Marshal.ReleaseComObject(m_graphBuilder)
            m_graphBuilder = Nothing
        End If
        GC.Collect()
    End Sub

    ' <summary> sample callback, NOT USED. </summary>
    Function SampleCB(ByVal SampleTime As Double, ByVal pSample As IMediaSample) As Integer Implements ISampleGrabberCB.SampleCB
        Marshal.ReleaseComObject(pSample)
        Return 0
    End Function

    ' <summary> buffer callback, COULD BE FROM FOREIGN THREAD. </summary>
    Function BufferCB(ByVal SampleTime As Double, ByVal pBuffer As IntPtr, ByVal BufferLen As Integer) As Integer Implements ISampleGrabberCB.BufferCB
        SyncLock Me
            If (Not m_bmdLogo Is Nothing) Then
                Dim ipSource As IntPtr = m_bmdLogo.Scan0
                Dim ipDest As IntPtr = pBuffer
                Dim x As Integer
                For x = 0 To m_bmdLogo.Height - 1
                    CopyMemory(ipDest, ipSource, m_bmdLogo.Stride)
                    ipDest = New IntPtr(ipDest.ToInt32() + m_stride)
                    ipSource = New IntPtr(ipSource.ToInt32() + m_bmdLogo.Stride)
                Next x
            End If
        End SyncLock

        Return 0
    End Function
End Class
