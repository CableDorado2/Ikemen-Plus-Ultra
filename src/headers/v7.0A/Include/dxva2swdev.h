//------------------------------------------------------------------------------
// File: dxva2SWDev.h
//
// Desc: DirectX Video Acceleration 2 header file for software video
// processing devices
//
// Copyright (c) 1999 - 2002, Microsoft Corporation.  All rights reserved.
//------------------------------------------------------------------------------

#ifndef __inc_dxva2SWDev_h
#define __inc_dxva2SWDev_h

#ifdef __cplusplus
extern "C" {
#endif

typedef enum _DXVA2_SampleFlags
{
    DXVA2_SampleFlag_Palette_Changed         = 0x00000001,
    DXVA2_SampleFlag_SrcRect_Changed         = 0x00000002,
    DXVA2_SampleFlag_DstRect_Changed         = 0x00000004,
    DXVA2_SampleFlag_ColorData_Changed       = 0x00000008,
    DXVA2_SampleFlag_PlanarAlpha_Changed     = 0x00000010,
    DXVA2_SampleFlag_RFF                     = 0x00010000,
    DXVA2_SampleFlag_TFF                     = 0x00020000,
    DXVA2_SampleFlag_RFF_TFF_Present         = 0x00040000,
    DXVA2_SampleFlagsMask                    = 0xFFFF001F
} DXVA2_SampleFlags;

typedef enum _DXVA2_DestinationFlags
{
    DXVA2_DestinationFlag_Background_Changed = 0x00000001,
    DXVA2_DestinationFlag_TargetRect_Changed = 0x00000002,
    DXVA2_DestinationFlag_ColorData_Changed  = 0x00000004,
    DXVA2_DestinationFlag_Alpha_Changed      = 0x00000008,
    DXVA2_DestinationFlag_RFF                = 0x00010000,
    DXVA2_DestinationFlag_TFF                = 0x00020000,
    DXVA2_DestinationFlag_RFF_TFF_Present    = 0x00040000,
    DXVA2_DestinationFlagMask                = 0xFFFF000F
} DXVA2_DestinationFlags;

typedef struct _DXVA2_VIDEOSAMPLE
{
    REFERENCE_TIME           Start;
    REFERENCE_TIME           End;
    DXVA2_ExtendedFormat     SampleFormat;
    UINT                     SampleFlags;
    VOID*                    SrcResource;
    RECT                     SrcRect;
    RECT                     DstRect;
    DXVA2_AYUVSample8        Pal[16];
    DXVA2_Fixed32            PlanarAlpha;
} DXVA2_VIDEOSAMPLE;

typedef struct _DXVA2_VIDEOPROCESSBLT
{
    REFERENCE_TIME           TargetFrame;
    RECT                     TargetRect;
    SIZE                     ConstrictionSize;
    UINT                     StreamingFlags;
    DXVA2_AYUVSample16       BackgroundColor;
    DXVA2_ExtendedFormat     DestFormat;
    UINT                     DestFlags;
    DXVA2_ProcAmpValues      ProcAmpValues;
    DXVA2_Fixed32            Alpha;
    DXVA2_FilterValues       NoiseFilterLuma;
    DXVA2_FilterValues       NoiseFilterChroma;
    DXVA2_FilterValues       DetailFilterLuma;
    DXVA2_FilterValues       DetailFilterChroma;
    DXVA2_VIDEOSAMPLE*       pSrcSurfaces;
    UINT                     NumSrcSurfaces;
} DXVA2_VIDEOPROCESSBLT;

#if defined(_D3D9_H_) || defined(_d3d9P_H_)

typedef HRESULT (CALLBACK* PDXVA2SW_GETVIDEOPROCESSORRENDERTARGETCOUNT)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __out UINT* pCount
    );

typedef HRESULT (CALLBACK* PDXVA2SW_GETVIDEOPROCESSORRENDERTARGETS)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in UINT Count,
    __out_ecount(Count) D3DFORMAT* pFormats
    );

typedef HRESULT (CALLBACK* PDXVA2SW_GETVIDEOPROCESSORCAPS)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in D3DFORMAT RenderTargetFormat,
    __out DXVA2_VideoProcessorCaps* pCaps
    );

typedef HRESULT (CALLBACK* PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in D3DFORMAT RenderTargetFormat,
    __out UINT* pCount
    );

typedef HRESULT (CALLBACK* PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in D3DFORMAT RenderTargetFormat,
    __in UINT Count,
    __out_ecount(Count) D3DFORMAT* pFormats
    );

typedef HRESULT (CALLBACK* PDXVA2SW_GETPROCAMPRANGE)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in D3DFORMAT RenderTargetFormat,
    __in UINT ProcAmpCap,
    __out DXVA2_ValueRange* pRange
    );

typedef HRESULT (CALLBACK* PDXVA2SW_GETFILTERPROPERTYRANGE)(
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in D3DFORMAT RenderTargetFormat,
    __in UINT FilterSetting,
    __out DXVA2_ValueRange* pRange
    );

typedef HRESULT (CALLBACK* PDXVA2SW_CREATEVIDEOPROCESSDEVICE)(
    __in IDirect3DDevice9* pD3DD9,
    __in const DXVA2_VideoDesc* pVideoDesc,
    __in D3DFORMAT RenderTargetFormat,
    __in UINT MaxSubStreams,
    __out HANDLE* phDevice
    );

typedef HRESULT (CALLBACK* PDXVA2SW_DESTROYVIDEOPROCESSDEVICE)(
    __in HANDLE hDevice
    );

typedef HRESULT (CALLBACK* PDXVA2SW_VIDEOPROCESSBEGINFRAME)(
    __in HANDLE hDevice
    );

typedef HRESULT (CALLBACK* PDXVA2SW_VIDEOPROCESSENDFRAME)(
    __in HANDLE hDevice,
    __inout_opt HANDLE* pHandleComplete
    );

typedef HRESULT (CALLBACK* PDXVA2SW_VIDEOPROCESSSETRENDERTARGET)(
    __in HANDLE hDevice,
    __in IDirect3DSurface9* pRenderTarget
    );

typedef HRESULT (CALLBACK* PDXVA2SW_VIDEOPROCESSBLT)(
    __in HANDLE hDevice,
    __in const DXVA2_VIDEOPROCESSBLT* pBlt
    );

typedef struct _DXVA2SW_CALLBACKS
{
    UINT                                           Size;
    PDXVA2SW_GETVIDEOPROCESSORRENDERTARGETCOUNT    GetVideoProcessorRenderTargetCount;
    PDXVA2SW_GETVIDEOPROCESSORRENDERTARGETS        GetVideoProcessorRenderTargets;
    PDXVA2SW_GETVIDEOPROCESSORCAPS                 GetVideoProcessorCaps;
    PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT GetVideoProcessorSubStreamFormatCount;
    PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS     GetVideoProcessorSubStreamFormats;
    PDXVA2SW_GETPROCAMPRANGE                       GetProcAmpRange;
    PDXVA2SW_GETFILTERPROPERTYRANGE                GetFilterPropertyRange;
    PDXVA2SW_CREATEVIDEOPROCESSDEVICE              CreateVideoProcessDevice;
    PDXVA2SW_DESTROYVIDEOPROCESSDEVICE             DestroyVideoProcessDevice;
    PDXVA2SW_VIDEOPROCESSBEGINFRAME                VideoProcessBeginFrame;
    PDXVA2SW_VIDEOPROCESSENDFRAME                  VideoProcessEndFrame;
    PDXVA2SW_VIDEOPROCESSSETRENDERTARGET           VideoProcessSetRenderTarget;
    PDXVA2SW_VIDEOPROCESSBLT                       VideoProcessBlt;
} DXVA2SW_CALLBACKS, *PDXVA2SW_CALLBACKS;

#endif  // _D3D9_H_

#ifdef __cplusplus
}
#endif
#endif

