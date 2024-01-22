/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released
as public domain.  It is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
*****************************************************************************/

// This file has the c# declarations needed to call the GSSF2 filter.

using System;
using System.Runtime.InteropServices;

using DirectShowLib;

namespace GenericSampleSourceFilterClasses
{
    [ComImport, Guid("E6409B54-52E6-40fb-B075-2AAF35EDF751")]
    public class GenericSampleSourceFilter2
    {
    }

    [ComVisible(true), InterfaceType(ComInterfaceType.InterfaceIsIUnknown),
    Guid("37E2B3ED-5E24-4528-AEBA-20269A592E1E")]
    public interface IGenericSampleCB2
    {
        [PreserveSig]
        int CheckMediaType([In, MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt);

        [PreserveSig]
        int OnMediaTypeChanged([In, MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt);

        [PreserveSig]
        int SampleCallback(IMediaSample pSample);

        #region Support for seeking

        [PreserveSig]
        int OnThreadCreate();

        [PreserveSig]
        int OnThreadDestroy();

        [PreserveSig]
        int Startup(out AMSeekingSeekingCapabilities sc, out long lDuration);

        [PreserveSig]
        int ChangeStart(long rtStart);

        [PreserveSig]
        int ChangeStop(long rtStop);

        [PreserveSig]
        int GetCurrentPosition(out long lPosition);

        #endregion
    }

    [ComVisible(true), Guid("B8F15920-95BB-4305-A29C-6D96AD017815"),
    InterfaceType(ComInterfaceType.InterfaceIsIUnknown)]
    public interface IGenericSampleConfig2
    {
        [PreserveSig]
        int SetPinMediaType([In, MarshalAs(UnmanagedType.LPStruct)] AMMediaType amt);

        [PreserveSig]
        int SetBitmapCB(IGenericSampleCB2 pfn);
    }
}
