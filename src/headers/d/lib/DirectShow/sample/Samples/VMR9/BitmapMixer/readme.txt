---------------------------------------------------------------------
BitmapMixer

While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  

---------------------------------------------------------------------

BitmapMixer is an example of how to draw things over a video using VMR9.

This sample is mainly built around the IVMRMixerBitmap9 interface. This interface
accept bitmaps as a GDI Device Context or as a Direct3D Surface. The main advantage 
of the Direct3D Surface is that it enables the use of true alpha transparency. GDI DC 
don't support alpha bitmap and transparency is accomplished by using color keying.

This sample dynamically generates bitmaps using GDI+.

This sample uses the following DirectShow Interfaces :

	IFilterGraph2
	IMediaControl
	IBaseFilter
	IVMRWindowlessControl9
	IVMRFilterConfig9

This sample is not the translation of the DirectShow's BitmapMix sample.

Managed DirectX must be installed to run this sample.