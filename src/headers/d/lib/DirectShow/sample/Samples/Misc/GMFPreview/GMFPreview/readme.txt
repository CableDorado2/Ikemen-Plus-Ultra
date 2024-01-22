/************************************************************************
GMFPreview - Showing how to use the GMFBridge filter in c#

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

**************************************************************************/

This sample started life as the c++ GMFPreview sample from http://www.gdcl.co.uk/.
I have converted it to c# to show how to use the GMFBridge in c#.  

You MUST install the GMFBridge filter for this code to work.

Normally if you have a graph that is capturing to disk and showing a preview window
at the same time, you have to stop BOTH parts of the graph to end the file capture.  
This causes flicker in the preview window that some people find unacceptable.

This sample creates a graph like this:

Video Capture Device -> Smart Tee --> Renderer
                                   \
                                    \-> GMF Bridge
                                    
And a second graph like this:

GMF Bridge -> AVI Mux -> File writer

The second graph can be stopped and started at will without affecting the rendering in
the first graph.

The key to using the bridge (other than installing it) is in GMFBridge.cs.  You should
include a copy of that file in your project if you are going to be using the bridge.

If you have questions about how to use the bridge, you should direct them to Geraint 
Davies, either at his web site, or at 
http://msdn.microsoft.com/newsgroups/default.aspx?dg=microsoft.public.win32.programmer.directx.video&lang=en&cr=US

If you have questions specific to using the library in c#, then you should ask
at http://sourceforge.net/forum/forum.php?forum_id=460697.