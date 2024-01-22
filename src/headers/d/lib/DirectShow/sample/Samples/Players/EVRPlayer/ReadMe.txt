As with any code that is labeled "sample," you should be clear about what level of quality you are expecting.
While there are no bugs or gotchas in this code TO MY KNOWLEDGE, that doesn't mean there aren't any.  You should
review the code yourself, and test it for your specific purposes.

To use option 2, you must register the GSSF2 provider.

To use option 3, you must register the EVRPresenter, which in turn requires the Hack project.  The
EVRPresenter and Hack projects are part of MFNet, and can be found at http://MFNet.SourceForge.Net


This project is a c# translation of the c++ EVRPlayer sample that ships with the Windows SDK.

It has 3 different operations

1) Open File - This is just building your basic DirectShow graph.  There isn't much here that's interesting
   to long-time DirectShow users.  It does show how to configure the number of input pins on the EVR.
   
2) SubPicture - This one is more interesting.  The EVR is able to perform overlays using up to 16 video
   streams.  However, in order to show how that works, you need to have something that generates multiple
   video streams, and those streams must be in formats that the EVR is willing to mix (a short list).
   The code here uses the GSSF2 to produce a YUY2 and a AYUV stream.  It overlays the AYUV on top of the YUY2.
   After you have chosen this menu option, hit play, then drag the box (the AYUV video) around the screen.  And
   use the "Size %" slider to shrink or grow this size of the window.  The guts of the video generating are in 
   Overlay.cs (see ImageFromPixels.PopulateSample) and ConvertImage.cs.  Pretty cool stuff.
   
3) EVR Presenter - Here's were things get serious.  While the code here isn't much different from Open File, it
   instructs the EVR to use a presenter that we specify.  Check out the code in the EVR Presenter project.  Be
   aware the in order to use the c# presenter, the caller must be MTA (see MTAThread).
   

