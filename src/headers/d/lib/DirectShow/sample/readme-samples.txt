DirectShowLib Samples 2010-02-21

http://DirectShowNet.SourceForge.net

This package contains a selection of samples.  These samples were formerly bundled 
with the DirectShowLib library, but as of version 1.4, they have been split out to 
this separate package.  

We have removed the build files for vs2003 in this release.  vs2005 has been available
(for free!) for 2 years now.  Besides, no one on our dev team still has it installed.

We have added two samples since the last release:

   BlackList
   EVRPlayer

See the descriptions below.

These samples should not be considered commercial quality applications.  They are just 
intended to illustrate how to use some particular feature, or group of features in 
DirectShow.  Feel free to polish them into applications of your own, or extract 
sections to use in your own code.  Each sample has (at least one) readme file.  
Several samples also have help files (.chm files).  If you are looking for info
regarding a sample, those are always a good place to start.

Also, while DirectShowLib is licensed under LGPL, these samples are public domain.  
Use them as you like.  Every one of these samples needs the DirectShowLib library
which is not included in this package.  Get the latest version from the SourceForge
website.

The people who wrote these samples usually hang out in 
http://sourceforge.net/forum/forum.php?forum_id=460697.  If you have questions, 
comments, or just want to say thanks to the people who have taken the time to
create these, feel free to stop by.

Also, if you have samples you think would be useful (or would like to write some), 
that would be the place to get started.

=====================================================================================

This is the current list of samples along with a short description.  See the
readme.txt in the individual samples for more details.


Samples\BDA\DTViewer
--------------------
Use BDA to display Digital TV into a Windows Form.


Samples\Capture\CapWMV
----------------------
Capture from video capture devices to WMV files.


Samples\Capture\DxLogo
----------------------
A sample application showing how to superimpose a logo on a data stream. It uses a 
capture device for the video source, and outputs the result to a file.


Samples\Capture\DxLogoVB
------------------------
This is precisely the same sample as DxLogo, except that it's written in Visual 
Basic. Other than the tediousness of converting C# to VB, this was a trivial 
exercise.


Samples\Capture\DxPropPages
---------------------------
Show how to add compression filters to video capture, and show how to invoke the 
property pages for capture devices, and video compressors.


Samples\Capture\DxSnap
----------------------
Use DirectShow to take snapshots from the Still pin of a capture device.  Note 
the MS encourages you to use WIA for this, but if you want to do in with 
DirectShow and C#, here's how.


Samples\Capture\DxTuner
-----------------------
Shows how to capture from TV Tuners, including how to change channels.


Samples\Capture\PlayCap
-----------------------
A translation of the DirectShow PlayCap program to show how this would appear in 
c#.  This application creates a preview window for the first video capture device 
that it locates on the user's system (if any). It demonstrates a simple example of 
using the ICaptureGraphBuilder2 and ICreateDevEnum interfaces to build a capture graph.


Samples\DMO\DMOFlip
-------------------
A DMO that can be used in a Directshow FilterGraph.  This DMO allows video to be 
flipped on the X or Y axis (or both).  There is a help file (IMediaObjectImpl.chm) 
showing how to write a DMO of your own.


Samples\DMO\DMOSplit
--------------------
A DMO that splits a stereo audio signal into two mono streams.


Samples\Editing\DESCombine
--------------------------
A class library that uses DirectShow Editing Services to combine video and audio 
files (or pieces of files) into a single output file.  A help file (DESCombine.chm) 
is provided for using the class.


Samples\Editing\DESCombineLib\DESCombineVB
------------------------------------------
Showing how to use the DESCombine sample (above) in VB.


Samples\Editing\DxScan
----------------------
A sample application scanning a media file looking for black frames.


Samples\Misc\BlackList
----------------------
This sample illustrate how to use the IAMGraphBuilderCallback interface to 
reject some filters during the graph creation. You can adapt this sample for 
your uses if some filters are known to break your application.


Samples\Misc\DxWebCam
---------------------
A poor man's web cam program. This application runs as a Win32 Service.  It 
takes the output of a capture graph, turns it into a stream of JPEG files, and 
sends it thru TCP/IP to a client application.


Samples\Misc\GMFPreview
-----------------------
A sample showing how to use Geraint's indispensible GMFBridge tool to allow part
of a graph to be stopped while another part keeps running.  This is useful to allow
preview windows to keep running while you start/stop capturing to disk.


Samples\Misc\GSSF
-----------------
A way to implement a source filter in c#.  If you have samples (for example video
frames from bitmap files) that you want to use as a source in a graph, this filter
will show you how.


Samples\Misc\Toolkit
--------------------
A collection of useful utilities.


Samples\Players\DvdPlay
-----------------------
A bare-bones sample showing how to play DVDs with DirectShow.


Samples\Players\DxPlay
----------------------
A sample application showing how to play media files (AVI, WMV, etc) and 
capture snapshots.


Samples\Players\DxText
----------------------
A sample application showing how to superimpose text strings on a datastream.  
The stream is read from an avi file.


Samples\Players\EVRPlayer
-------------------------
This project is a c# translation of the c++ EVRPlayer sample that ships with the Windows SDK.  It shows
how to use the EVR renderer from DirectShow.


Samples\Players\GMFPlay
-----------------------
A sample showing how to use Geraint's indispensible GMFBridge filter to play a collection
of media files one after another.


Samples\Players\PlayVB
----------------------
A simple player in VB.


Samples\Players\PlayWnd
-----------------------
A translation of the DirectShow PlayWnd program to show how this would appear in C#.  PlayWnd 
is a simple media player application with a minimal user interface.


Samples\SBE\DvrMsCutter
-----------------------
This sample extracts a segment of a dvr-ms file into another dvr-ms file.


Samples\SBE\DvrMsCutter2
------------------------
This sample extracts multiple segments of a dvr-ms file into another dvr-ms file.


Samples\VMR9\BitMapMixer
------------------------
BitmapMixer is an example of how to draw things over a video using VMR9.


Samples\VMR9\VMR9Allocator
--------------------------
A translation of the DirectShow VMR9Allocator program to show how this would appear in c#.


Samples\VMR9\VMR9Compositor
---------------------------
This sample shows how to use the VMR9 custom compositor feature.


Samples\VMR9\VMR9Allocator2
---------------------------
An alternative to the DirectShow VMR9Allocator program.


Samples\VMR9\vMR9Snapper
------------------------
This sample shows how to capture bitmaps from VMR9.

