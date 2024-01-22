---------------------------------------------------------------------
VMR9Allocator2 (second try)

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

This sample is an alternative to the DirectShow VMR9Allocator program.
Minimal knowledge in Managed Direct3D is required to understand this sample!

The original VMR9Allocator has some drawbacks.

1) The render loop is in the PresentImage method. Most real-life Direct3D 
applications handle the render loop themselves and some developers found that it's
difficult to use VMR9Allocator in an existing engine.

2) The InitializeDevice method uses IVMRSurfaceAllocatorNotify9.AllocateSurfaceHelper
to allocate the VMR9 surface. This method works well in C++ but in the managed world, 
you have to deal with unmanaged surfaces and create the managed representation 
of this surface. All those complications make the source more complicated.

What this sample is and what it is not!

The purpose of this sample is to illustrate how an allocator / presenter can be 
rewriten to just provide a texture to a client application. In this version, the 
presenter draws nothing!

In this sample, the A/P part is almost complete but has some limitations:
	- Only one pin connected to the VMR9 filter
	- Direct3D errors are not checked. 
	- In a real-life application, D3D resources should be handled by the 3D 
	engine's resources manager to aid in "Device Lost" situations.
	
The sample's Managed Direct3D engine is reduced to the minimal. This part absolutely 
doesn't have production quality. It doesn't handle Direct3D exceptions and resize 
events (You are warned).

What's wrong with AllocateSurfaceHelper?

Nothing but its use is not necessary if you don't want it.

The VMR9 filter calls the InitializeDevice method once for each media type 
supported by the down-stream filter. So if you don't like the first one 
(or more likely because your hardware don't like it) it's perfectly valid to 
refuse it!

VMR9Allocator2 allocates a managed surface then retrieves its unmanaged pointer 
so source code is less tainted by unmanaged code pieces and it is also more 
readable.

Why are YUV and RGB media types handled differently?

This is a common hardware limitation. Most video boards (even the latest ones)
don't allow building a 3D texture from an YUV off screen surface. So YUV surfaces 
must be converted to an RGB surface before being used in a 3D engine. 

YUV to RGB conversions are generally very fast on DirectX 9 class hardware. 
During my tests I found that with my Geforce FX 5900, YUV rendering is as fast 
as RGB rendering even with the extra copy...

This sample uses the following DirectShow Interfaces:

	IGraphBuilder
	IBaseFilter
	IMediaControl
	IMediaEventEx
	IVMRFilterConfig9
	IVMRMixerControl9
	IVMRSurfaceAllocatorNotify9
	IVMRSurfaceAllocator9
	IVMRImagePresenter9

Managed DirectX must be installed to run this sample.
