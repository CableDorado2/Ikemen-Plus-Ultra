/****************************************************************************
While the underlying libraries are covered by LGPL, this sample is released 
as public domain.  It is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  
*****************************************************************************/

// These definitions are for use with the GMFBridge filter, which is available
// at http://www.gdcl.co.uk/.  Please check out the information there for
// descriptions of how to use these interfaces.

using System;
using System.Runtime.InteropServices;

using DirectShowLib;

namespace DirectShowLib.GDCL
{
    public enum eFormatType
    {
        Uncompressed,
        MuxInputs,
        Any,
    }

    [ComImport, Guid("08E3287F-3A5C-47e9-8179-A9E9221A5CDE")]
    public class GMFBridgeController
    {
    }

    [Guid("8C4D8054-FCBA-4783-865A-7E8B3C814011"),
    InterfaceType(ComInterfaceType.InterfaceIsDual)]
    public interface IGMFBridgeController
    {
        [PreserveSig]
        int AddStream(
            [In, MarshalAs(UnmanagedType.Bool)] bool bVideo,
            [In] eFormatType AllowedTypes, 
            [In, MarshalAs(UnmanagedType.Bool)] bool bDiscardUnconnected
            );

        [PreserveSig]
        int InsertSinkFilter(
            [In] IFilterGraph pGraph, 
            out IBaseFilter ppFilter
            );

        [PreserveSig]
        int InsertSourceFilter( 
            [In] IBaseFilter pUnkSourceGraphSinkFilter,
            [In] IGraphBuilder pRenderGraph,
            out IBaseFilter ppFilter
            );

        [PreserveSig]
        int CreateSourceGraph( 
            [In, MarshalAs(UnmanagedType.BStr)] string strFile, 
            [In] IFilterGraph pGraph,
            out IBaseFilter pSinkFilter
            );

        [PreserveSig]
        int CreateRenderGraph(  
            [In] IBaseFilter pSourceGraphSinkFilter,
            [In] IGraphBuilder pRenderGraph,
            out IBaseFilter pRenderGraphSourceFilter
            );

        [PreserveSig]
        int BridgeGraphs(	
            [In] IBaseFilter pSourceGraphSinkFilter,
            [In] IBaseFilter pRenderGraphSourceFilter
            );

        [PreserveSig]
        int SetNotify(  
            [In] IntPtr hwnd,
            [In] int msg
            );

        [PreserveSig]
        int SetBufferMinimum( 
            [In] int nMillisecs 
            );

        [PreserveSig]
        int GetSegmentTime( 
            out double pdSeconds 
            );

        [PreserveSig]
        int NoMoreSegments();

        [PreserveSig]
        int GetSegmentOffset(
            out double pdOffset
            );
    }
}
