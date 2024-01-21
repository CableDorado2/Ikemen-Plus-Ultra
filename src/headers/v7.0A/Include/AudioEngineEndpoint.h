

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for audioengineendpoint.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 7.00.0555 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 500
#endif

/* verify that the <rpcsal.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCSAL_H_VERSION__
#define __REQUIRED_RPCSAL_H_VERSION__ 100
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __audioengineendpoint_h__
#define __audioengineendpoint_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IAudioEndpoint_FWD_DEFINED__
#define __IAudioEndpoint_FWD_DEFINED__
typedef interface IAudioEndpoint IAudioEndpoint;
#endif 	/* __IAudioEndpoint_FWD_DEFINED__ */


#ifndef __IAudioEndpointRT_FWD_DEFINED__
#define __IAudioEndpointRT_FWD_DEFINED__
typedef interface IAudioEndpointRT IAudioEndpointRT;
#endif 	/* __IAudioEndpointRT_FWD_DEFINED__ */


#ifndef __IAudioInputEndpointRT_FWD_DEFINED__
#define __IAudioInputEndpointRT_FWD_DEFINED__
typedef interface IAudioInputEndpointRT IAudioInputEndpointRT;
#endif 	/* __IAudioInputEndpointRT_FWD_DEFINED__ */


#ifndef __IAudioOutputEndpointRT_FWD_DEFINED__
#define __IAudioOutputEndpointRT_FWD_DEFINED__
typedef interface IAudioOutputEndpointRT IAudioOutputEndpointRT;
#endif 	/* __IAudioOutputEndpointRT_FWD_DEFINED__ */


#ifndef __IAudioDeviceEndpoint_FWD_DEFINED__
#define __IAudioDeviceEndpoint_FWD_DEFINED__
typedef interface IAudioDeviceEndpoint IAudioDeviceEndpoint;
#endif 	/* __IAudioDeviceEndpoint_FWD_DEFINED__ */


#ifndef __IAudioEndpointControl_FWD_DEFINED__
#define __IAudioEndpointControl_FWD_DEFINED__
typedef interface IAudioEndpointControl IAudioEndpointControl;
#endif 	/* __IAudioEndpointControl_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"
#include "propidl.h"
#include "audioapotypes.h"
#include "mmreg.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_audioengineendpoint_0000_0000 */
/* [local] */ 

typedef struct AUDIO_ENDPOINT_EXCLUSIVE_CREATE_PARAMS
    {
    UINT32 u32Size;
    LONGLONG hConnection;
    BOOL bIsRtCapable;
    HNSTIME hnsBufferDuration;
    HNSTIME hnsPeriod;
    UINT32 u32LatencyCoefficient;
    WAVEFORMATEX wfxDeviceFormat;
    } 	AUDIO_ENDPOINT_EXCLUSIVE_CREATE_PARAMS;

typedef struct AUDIO_ENDPOINT_EXCLUSIVE_CREATE_PARAMS *PAUDIO_ENDPOINT_EXCLUSIVE_CREATE_PARAMS;

typedef struct AUDIO_ENDPOINT_SHARED_CREATE_PARAMS
    {
    UINT32 u32Size;
    UINT32 u32TSSessionId;
    WAVEFORMATEX wfxDeviceFormat;
    } 	AUDIO_ENDPOINT_SHARED_CREATE_PARAMS;

typedef struct AUDIO_ENDPOINT_SHARED_CREATE_PARAMS *PAUDIO_ENDPOINT_SHARED_CREATE_PARAMS;

typedef 
enum AE_POSITION_FLAGS
    {	POSITION_INVALID	= 0,
	POSITION_DISCONTINUOUS	= 1,
	POSITION_CONTINUOUS	= 2,
	POSITION_QPC_ERROR	= 4
    } 	AE_POSITION_FLAGS;

typedef struct AE_CURRENT_POSITION
    {
    UINT64 u64DevicePosition;
    UINT64 u64StreamPosition;
    UINT64 u64PaddingFrames;
    HNSTIME hnsQPCPosition;
    FLOAT32 f32FramesPerSecond;
    AE_POSITION_FLAGS Flag;
    } 	AE_CURRENT_POSITION;

typedef struct AE_CURRENT_POSITION *PAE_CURRENT_POSITION;



extern RPC_IF_HANDLE __MIDL_itf_audioengineendpoint_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_audioengineendpoint_0000_0000_v0_0_s_ifspec;

#ifndef __IAudioEndpoint_INTERFACE_DEFINED__
#define __IAudioEndpoint_INTERFACE_DEFINED__

/* interface IAudioEndpoint */
/* [local][unique][uuid][object] */ 


EXTERN_C const IID IID_IAudioEndpoint;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("30A99515-1527-4451-AF9F-00C5F0234DAF")
    IAudioEndpoint : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetFrameFormat( 
            /* [out] */ WAVEFORMATEX **ppFormat) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetFramesPerPacket( 
            /* [out] */ UINT32 *pFramesPerPacket) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLatency( 
            /* [out] */ HNSTIME *pLatency) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetStreamFlags( 
            /* [in] */ DWORD streamFlags) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetEventHandle( 
            /* [in] */ HANDLE eventHandle) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAudioEndpointVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAudioEndpoint * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAudioEndpoint * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAudioEndpoint * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetFrameFormat )( 
            IAudioEndpoint * This,
            /* [out] */ WAVEFORMATEX **ppFormat);
        
        HRESULT ( STDMETHODCALLTYPE *GetFramesPerPacket )( 
            IAudioEndpoint * This,
            /* [out] */ UINT32 *pFramesPerPacket);
        
        HRESULT ( STDMETHODCALLTYPE *GetLatency )( 
            IAudioEndpoint * This,
            /* [out] */ HNSTIME *pLatency);
        
        HRESULT ( STDMETHODCALLTYPE *SetStreamFlags )( 
            IAudioEndpoint * This,
            /* [in] */ DWORD streamFlags);
        
        HRESULT ( STDMETHODCALLTYPE *SetEventHandle )( 
            IAudioEndpoint * This,
            /* [in] */ HANDLE eventHandle);
        
        END_INTERFACE
    } IAudioEndpointVtbl;

    interface IAudioEndpoint
    {
        CONST_VTBL struct IAudioEndpointVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAudioEndpoint_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAudioEndpoint_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAudioEndpoint_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAudioEndpoint_GetFrameFormat(This,ppFormat)	\
    ( (This)->lpVtbl -> GetFrameFormat(This,ppFormat) ) 

#define IAudioEndpoint_GetFramesPerPacket(This,pFramesPerPacket)	\
    ( (This)->lpVtbl -> GetFramesPerPacket(This,pFramesPerPacket) ) 

#define IAudioEndpoint_GetLatency(This,pLatency)	\
    ( (This)->lpVtbl -> GetLatency(This,pLatency) ) 

#define IAudioEndpoint_SetStreamFlags(This,streamFlags)	\
    ( (This)->lpVtbl -> SetStreamFlags(This,streamFlags) ) 

#define IAudioEndpoint_SetEventHandle(This,eventHandle)	\
    ( (This)->lpVtbl -> SetEventHandle(This,eventHandle) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAudioEndpoint_INTERFACE_DEFINED__ */


#ifndef __IAudioEndpointRT_INTERFACE_DEFINED__
#define __IAudioEndpointRT_INTERFACE_DEFINED__

/* interface IAudioEndpointRT */
/* [local][unique][uuid][object] */ 


EXTERN_C const IID IID_IAudioEndpointRT;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("DFD2005F-A6E5-4d39-A265-939ADA9FBB4D")
    IAudioEndpointRT : public IUnknown
    {
    public:
        virtual void STDMETHODCALLTYPE GetCurrentPadding( 
            /* [out] */ HNSTIME *pPadding,
            /* [out] */ AE_CURRENT_POSITION *pAeCurrentPosition) = 0;
        
        virtual void STDMETHODCALLTYPE ProcessingComplete( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetPinInactive( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetPinActive( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAudioEndpointRTVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAudioEndpointRT * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAudioEndpointRT * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAudioEndpointRT * This);
        
        void ( STDMETHODCALLTYPE *GetCurrentPadding )( 
            IAudioEndpointRT * This,
            /* [out] */ HNSTIME *pPadding,
            /* [out] */ AE_CURRENT_POSITION *pAeCurrentPosition);
        
        void ( STDMETHODCALLTYPE *ProcessingComplete )( 
            IAudioEndpointRT * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetPinInactive )( 
            IAudioEndpointRT * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetPinActive )( 
            IAudioEndpointRT * This);
        
        END_INTERFACE
    } IAudioEndpointRTVtbl;

    interface IAudioEndpointRT
    {
        CONST_VTBL struct IAudioEndpointRTVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAudioEndpointRT_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAudioEndpointRT_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAudioEndpointRT_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAudioEndpointRT_GetCurrentPadding(This,pPadding,pAeCurrentPosition)	\
    ( (This)->lpVtbl -> GetCurrentPadding(This,pPadding,pAeCurrentPosition) ) 

#define IAudioEndpointRT_ProcessingComplete(This)	\
    ( (This)->lpVtbl -> ProcessingComplete(This) ) 

#define IAudioEndpointRT_SetPinInactive(This)	\
    ( (This)->lpVtbl -> SetPinInactive(This) ) 

#define IAudioEndpointRT_SetPinActive(This)	\
    ( (This)->lpVtbl -> SetPinActive(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAudioEndpointRT_INTERFACE_DEFINED__ */


#ifndef __IAudioInputEndpointRT_INTERFACE_DEFINED__
#define __IAudioInputEndpointRT_INTERFACE_DEFINED__

/* interface IAudioInputEndpointRT */
/* [local][unique][uuid][object] */ 


EXTERN_C const IID IID_IAudioInputEndpointRT;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8026AB61-92B2-43c1-A1DF-5C37EBD08D82")
    IAudioInputEndpointRT : public IUnknown
    {
    public:
        virtual void STDMETHODCALLTYPE GetInputDataPointer( 
            /* [out][in] */ APO_CONNECTION_PROPERTY *pConnectionProperty,
            /* [out][in] */ AE_CURRENT_POSITION *pAeTimeStamp) = 0;
        
        virtual void STDMETHODCALLTYPE ReleaseInputDataPointer( 
            /* [in] */ UINT32 u32FrameCount,
            /* [in] */ UINT_PTR pDataPointer) = 0;
        
        virtual void STDMETHODCALLTYPE PulseEndpoint( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAudioInputEndpointRTVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAudioInputEndpointRT * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAudioInputEndpointRT * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAudioInputEndpointRT * This);
        
        void ( STDMETHODCALLTYPE *GetInputDataPointer )( 
            IAudioInputEndpointRT * This,
            /* [out][in] */ APO_CONNECTION_PROPERTY *pConnectionProperty,
            /* [out][in] */ AE_CURRENT_POSITION *pAeTimeStamp);
        
        void ( STDMETHODCALLTYPE *ReleaseInputDataPointer )( 
            IAudioInputEndpointRT * This,
            /* [in] */ UINT32 u32FrameCount,
            /* [in] */ UINT_PTR pDataPointer);
        
        void ( STDMETHODCALLTYPE *PulseEndpoint )( 
            IAudioInputEndpointRT * This);
        
        END_INTERFACE
    } IAudioInputEndpointRTVtbl;

    interface IAudioInputEndpointRT
    {
        CONST_VTBL struct IAudioInputEndpointRTVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAudioInputEndpointRT_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAudioInputEndpointRT_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAudioInputEndpointRT_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAudioInputEndpointRT_GetInputDataPointer(This,pConnectionProperty,pAeTimeStamp)	\
    ( (This)->lpVtbl -> GetInputDataPointer(This,pConnectionProperty,pAeTimeStamp) ) 

#define IAudioInputEndpointRT_ReleaseInputDataPointer(This,u32FrameCount,pDataPointer)	\
    ( (This)->lpVtbl -> ReleaseInputDataPointer(This,u32FrameCount,pDataPointer) ) 

#define IAudioInputEndpointRT_PulseEndpoint(This)	\
    ( (This)->lpVtbl -> PulseEndpoint(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAudioInputEndpointRT_INTERFACE_DEFINED__ */


#ifndef __IAudioOutputEndpointRT_INTERFACE_DEFINED__
#define __IAudioOutputEndpointRT_INTERFACE_DEFINED__

/* interface IAudioOutputEndpointRT */
/* [local][unique][uuid][object] */ 


EXTERN_C const IID IID_IAudioOutputEndpointRT;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8FA906E4-C31C-4e31-932E-19A66385E9AA")
    IAudioOutputEndpointRT : public IUnknown
    {
    public:
        virtual UINT_PTR STDMETHODCALLTYPE GetOutputDataPointer( 
            /* [in] */ UINT32 u32FrameCount,
            /* [in] */ AE_CURRENT_POSITION *pAeTimeStamp) = 0;
        
        virtual void STDMETHODCALLTYPE ReleaseOutputDataPointer( 
            /* [in] */ const APO_CONNECTION_PROPERTY *pConnectionProperty) = 0;
        
        virtual void STDMETHODCALLTYPE PulseEndpoint( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAudioOutputEndpointRTVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAudioOutputEndpointRT * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAudioOutputEndpointRT * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAudioOutputEndpointRT * This);
        
        UINT_PTR ( STDMETHODCALLTYPE *GetOutputDataPointer )( 
            IAudioOutputEndpointRT * This,
            /* [in] */ UINT32 u32FrameCount,
            /* [in] */ AE_CURRENT_POSITION *pAeTimeStamp);
        
        void ( STDMETHODCALLTYPE *ReleaseOutputDataPointer )( 
            IAudioOutputEndpointRT * This,
            /* [in] */ const APO_CONNECTION_PROPERTY *pConnectionProperty);
        
        void ( STDMETHODCALLTYPE *PulseEndpoint )( 
            IAudioOutputEndpointRT * This);
        
        END_INTERFACE
    } IAudioOutputEndpointRTVtbl;

    interface IAudioOutputEndpointRT
    {
        CONST_VTBL struct IAudioOutputEndpointRTVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAudioOutputEndpointRT_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAudioOutputEndpointRT_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAudioOutputEndpointRT_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAudioOutputEndpointRT_GetOutputDataPointer(This,u32FrameCount,pAeTimeStamp)	\
    ( (This)->lpVtbl -> GetOutputDataPointer(This,u32FrameCount,pAeTimeStamp) ) 

#define IAudioOutputEndpointRT_ReleaseOutputDataPointer(This,pConnectionProperty)	\
    ( (This)->lpVtbl -> ReleaseOutputDataPointer(This,pConnectionProperty) ) 

#define IAudioOutputEndpointRT_PulseEndpoint(This)	\
    ( (This)->lpVtbl -> PulseEndpoint(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAudioOutputEndpointRT_INTERFACE_DEFINED__ */


#ifndef __IAudioDeviceEndpoint_INTERFACE_DEFINED__
#define __IAudioDeviceEndpoint_INTERFACE_DEFINED__

/* interface IAudioDeviceEndpoint */
/* [local][unique][uuid][object] */ 


EXTERN_C const IID IID_IAudioDeviceEndpoint;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D4952F5A-A0B2-4cc4-8B82-9358488DD8AC")
    IAudioDeviceEndpoint : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SetBuffer( 
            /* [in] */ HNSTIME MaxPeriod,
            /* [in] */ UINT32 u32LatencyCoefficient) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRTCaps( 
            /* [out] */ BOOL *pbIsRTCapable) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetEventDrivenCapable( 
            /* [out] */ BOOL *pbisEventCapable) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE WriteExclusiveModeParametersToSharedMemory( 
            /* [in] */ UINT_PTR hTargetProcess,
            /* [in] */ HNSTIME hnsPeriod,
            /* [in] */ HNSTIME hnsBufferDuration,
            /* [in] */ UINT32 u32LatencyCoefficient,
            /* [out] */ UINT32 *pu32SharedMemorySize,
            /* [out] */ UINT_PTR *phSharedMemory) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAudioDeviceEndpointVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAudioDeviceEndpoint * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAudioDeviceEndpoint * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAudioDeviceEndpoint * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetBuffer )( 
            IAudioDeviceEndpoint * This,
            /* [in] */ HNSTIME MaxPeriod,
            /* [in] */ UINT32 u32LatencyCoefficient);
        
        HRESULT ( STDMETHODCALLTYPE *GetRTCaps )( 
            IAudioDeviceEndpoint * This,
            /* [out] */ BOOL *pbIsRTCapable);
        
        HRESULT ( STDMETHODCALLTYPE *GetEventDrivenCapable )( 
            IAudioDeviceEndpoint * This,
            /* [out] */ BOOL *pbisEventCapable);
        
        HRESULT ( STDMETHODCALLTYPE *WriteExclusiveModeParametersToSharedMemory )( 
            IAudioDeviceEndpoint * This,
            /* [in] */ UINT_PTR hTargetProcess,
            /* [in] */ HNSTIME hnsPeriod,
            /* [in] */ HNSTIME hnsBufferDuration,
            /* [in] */ UINT32 u32LatencyCoefficient,
            /* [out] */ UINT32 *pu32SharedMemorySize,
            /* [out] */ UINT_PTR *phSharedMemory);
        
        END_INTERFACE
    } IAudioDeviceEndpointVtbl;

    interface IAudioDeviceEndpoint
    {
        CONST_VTBL struct IAudioDeviceEndpointVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAudioDeviceEndpoint_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAudioDeviceEndpoint_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAudioDeviceEndpoint_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAudioDeviceEndpoint_SetBuffer(This,MaxPeriod,u32LatencyCoefficient)	\
    ( (This)->lpVtbl -> SetBuffer(This,MaxPeriod,u32LatencyCoefficient) ) 

#define IAudioDeviceEndpoint_GetRTCaps(This,pbIsRTCapable)	\
    ( (This)->lpVtbl -> GetRTCaps(This,pbIsRTCapable) ) 

#define IAudioDeviceEndpoint_GetEventDrivenCapable(This,pbisEventCapable)	\
    ( (This)->lpVtbl -> GetEventDrivenCapable(This,pbisEventCapable) ) 

#define IAudioDeviceEndpoint_WriteExclusiveModeParametersToSharedMemory(This,hTargetProcess,hnsPeriod,hnsBufferDuration,u32LatencyCoefficient,pu32SharedMemorySize,phSharedMemory)	\
    ( (This)->lpVtbl -> WriteExclusiveModeParametersToSharedMemory(This,hTargetProcess,hnsPeriod,hnsBufferDuration,u32LatencyCoefficient,pu32SharedMemorySize,phSharedMemory) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAudioDeviceEndpoint_INTERFACE_DEFINED__ */


#ifndef __IAudioEndpointControl_INTERFACE_DEFINED__
#define __IAudioEndpointControl_INTERFACE_DEFINED__

/* interface IAudioEndpointControl */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IAudioEndpointControl;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("C684B72A-6DF4-4774-BDF9-76B77509B653")
    IAudioEndpointControl : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Start( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Stop( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAudioEndpointControlVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAudioEndpointControl * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAudioEndpointControl * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAudioEndpointControl * This);
        
        HRESULT ( STDMETHODCALLTYPE *Start )( 
            __RPC__in IAudioEndpointControl * This);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            __RPC__in IAudioEndpointControl * This);
        
        HRESULT ( STDMETHODCALLTYPE *Stop )( 
            __RPC__in IAudioEndpointControl * This);
        
        END_INTERFACE
    } IAudioEndpointControlVtbl;

    interface IAudioEndpointControl
    {
        CONST_VTBL struct IAudioEndpointControlVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAudioEndpointControl_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAudioEndpointControl_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAudioEndpointControl_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAudioEndpointControl_Start(This)	\
    ( (This)->lpVtbl -> Start(This) ) 

#define IAudioEndpointControl_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IAudioEndpointControl_Stop(This)	\
    ( (This)->lpVtbl -> Stop(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAudioEndpointControl_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



