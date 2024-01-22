/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

using System;
using System.Runtime.InteropServices;

using DirectShowLib;

namespace GenericSampleSourceFilterClasses
{
	[ComImport, Guid("6F7BCF72-D0C2-4449-BE0E-B12F580D056D")]
	public class GenericSampleSourceFilter
	{
	}

	[InterfaceType(ComInterfaceType.InterfaceIsIUnknown),
	Guid("33B9EE57-1067-45fa-B12D-C37517F09FC0")]
	public interface IGenericSampleCB
	{
		[PreserveSig]
		int SampleCallback(IMediaSample pSample);
	}

	[Guid("CE50FFF9-1BA8-4788-8131-BDE7D4FFC27F"),
	InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
	public interface IGenericSampleConfig
	{
		[PreserveSig]
		int SetMediaTypeFromBitmap(BitmapInfoHeader bmi, long lFPS);

		[PreserveSig]
		int SetMediaType([MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt);

		[PreserveSig]
		int SetMediaTypeEx([MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt, int lBufferSize);

		[PreserveSig]
		int SetBitmapCB(IGenericSampleCB pfn);
	}

}
