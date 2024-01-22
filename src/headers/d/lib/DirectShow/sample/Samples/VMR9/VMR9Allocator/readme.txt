---------------------------------------------------------------------
VMR9Allocator

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

A translation of the DirectShow VMR9Allocator program to show how this would
appear in c#.

VMR9Allocator is an example of a custom VMR9's Allocator / Presenter. 
It takes a video file provided by the user and displays it in a rotating quad. 
This sample is also an illustration of how to mix unmanaged Direct3D with managed.

This sample uses the following DirectShow Interfaces:

	IGraphBuilder
	IBaseFilter
	IMediaControl
	IVMRFilterConfig9
	IVMRSurfaceAllocatorNotify9
	IVMRSurfaceAllocator9
	IVMRImagePresenter9

Managed DirectX must be installed to run this sample.

