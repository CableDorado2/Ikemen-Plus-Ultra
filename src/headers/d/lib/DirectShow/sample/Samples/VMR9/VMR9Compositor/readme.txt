---------------------------------------------------------------------
VMR9Compositor

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

This sample is a demonstration of the poorly documented VMR9 custom compositor feature.

The main feature of this sample is an implementation of the IVMRImageCompositor9 interface.
This interface is documented here : http://windowssdk.msdn.microsoft.com/en-us/library/ms787035.aspx

The purpose of the compositor object in the VMR9 filter is to composite multiple images coming from the input pins into one image that is next send to the Allocator/Presenter object.

As for most things related to the VMR9 filter, this sample make extensive use of the Managed DirectX. Basic knowledge is required to fully understand this sample.

This custom Compositor object from this sample just composite the images coming from the first pin but it also demonstrate how to add text or a moving watermark over the video. It can provide similar fonctionnality than the Bitmap Mixer sample.

This sample use a classic windowless configuration to display the composited video into a panel.

Finally, i want to thanks Daniel for his tutorial that greatly inspirated this sample : http://www.a2ii.com/tech/directx/tutorialDS10.htm (Daniel : Check how i have resolve the ref count problem)
