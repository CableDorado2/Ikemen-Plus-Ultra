

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for mfreadwrite.idl:
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

#ifndef __mfreadwrite_h__
#define __mfreadwrite_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IMFReadWriteClassFactory_FWD_DEFINED__
#define __IMFReadWriteClassFactory_FWD_DEFINED__
typedef interface IMFReadWriteClassFactory IMFReadWriteClassFactory;
#endif 	/* __IMFReadWriteClassFactory_FWD_DEFINED__ */


#ifndef __IMFSourceReader_FWD_DEFINED__
#define __IMFSourceReader_FWD_DEFINED__
typedef interface IMFSourceReader IMFSourceReader;
#endif 	/* __IMFSourceReader_FWD_DEFINED__ */


#ifndef __IMFSourceReaderCallback_FWD_DEFINED__
#define __IMFSourceReaderCallback_FWD_DEFINED__
typedef interface IMFSourceReaderCallback IMFSourceReaderCallback;
#endif 	/* __IMFSourceReaderCallback_FWD_DEFINED__ */


#ifndef __IMFSinkWriter_FWD_DEFINED__
#define __IMFSinkWriter_FWD_DEFINED__
typedef interface IMFSinkWriter IMFSinkWriter;
#endif 	/* __IMFSinkWriter_FWD_DEFINED__ */


#ifndef __IMFSinkWriterCallback_FWD_DEFINED__
#define __IMFSinkWriterCallback_FWD_DEFINED__
typedef interface IMFSinkWriterCallback IMFSinkWriterCallback;
#endif 	/* __IMFSinkWriterCallback_FWD_DEFINED__ */


/* header files for imported files */
#include "mfobjects.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_mfreadwrite_0000_0000 */
/* [local] */ 

#if (WINVER >= _WIN32_WINNT_WIN7) 
EXTERN_GUID(CLSID_MFReadWriteClassFactory, 0x48e2ed0f, 0x98c2, 0x4a37, 0xbe, 0xd5, 0x16, 0x63, 0x12, 0xdd, 0xd8, 0x3f);


extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0000_v0_0_s_ifspec;

#ifndef __IMFReadWriteClassFactory_INTERFACE_DEFINED__
#define __IMFReadWriteClassFactory_INTERFACE_DEFINED__

/* interface IMFReadWriteClassFactory */
/* [local][uuid][object] */ 


EXTERN_C const IID IID_IMFReadWriteClassFactory;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("E7FE2E12-661C-40DA-92F9-4F002AB67627")
    IMFReadWriteClassFactory : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE CreateInstanceFromURL( 
            /* [annotation][in] */ 
            __in  REFCLSID clsid,
            /* [annotation][in] */ 
            __in  LPCWSTR pwszURL,
            /* [annotation][in] */ 
            __in_opt  IMFAttributes *pAttributes,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][iid_is][out] */ 
            __out  LPVOID *ppvObject) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CreateInstanceFromObject( 
            /* [annotation][in] */ 
            __in  REFCLSID clsid,
            /* [annotation][in] */ 
            __in  IUnknown *punkObject,
            /* [annotation][in] */ 
            __in_opt  IMFAttributes *pAttributes,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][iid_is][out] */ 
            __out  LPVOID *ppvObject) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFReadWriteClassFactoryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFReadWriteClassFactory * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFReadWriteClassFactory * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFReadWriteClassFactory * This);
        
        HRESULT ( STDMETHODCALLTYPE *CreateInstanceFromURL )( 
            IMFReadWriteClassFactory * This,
            /* [annotation][in] */ 
            __in  REFCLSID clsid,
            /* [annotation][in] */ 
            __in  LPCWSTR pwszURL,
            /* [annotation][in] */ 
            __in_opt  IMFAttributes *pAttributes,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][iid_is][out] */ 
            __out  LPVOID *ppvObject);
        
        HRESULT ( STDMETHODCALLTYPE *CreateInstanceFromObject )( 
            IMFReadWriteClassFactory * This,
            /* [annotation][in] */ 
            __in  REFCLSID clsid,
            /* [annotation][in] */ 
            __in  IUnknown *punkObject,
            /* [annotation][in] */ 
            __in_opt  IMFAttributes *pAttributes,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][iid_is][out] */ 
            __out  LPVOID *ppvObject);
        
        END_INTERFACE
    } IMFReadWriteClassFactoryVtbl;

    interface IMFReadWriteClassFactory
    {
        CONST_VTBL struct IMFReadWriteClassFactoryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFReadWriteClassFactory_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFReadWriteClassFactory_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFReadWriteClassFactory_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFReadWriteClassFactory_CreateInstanceFromURL(This,clsid,pwszURL,pAttributes,riid,ppvObject)	\
    ( (This)->lpVtbl -> CreateInstanceFromURL(This,clsid,pwszURL,pAttributes,riid,ppvObject) ) 

#define IMFReadWriteClassFactory_CreateInstanceFromObject(This,clsid,punkObject,pAttributes,riid,ppvObject)	\
    ( (This)->lpVtbl -> CreateInstanceFromObject(This,clsid,punkObject,pAttributes,riid,ppvObject) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFReadWriteClassFactory_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_mfreadwrite_0000_0001 */
/* [local] */ 

EXTERN_GUID(CLSID_MFSourceReader, 0x1777133c, 0x0881, 0x411b, 0xa5, 0x77, 0xad, 0x54, 0x5f, 0x07, 0x14, 0xc4);
STDAPI MFCreateSourceReaderFromURL(
    __in LPCWSTR pwszURL,
    __in_opt IMFAttributes *pAttributes,
    __out IMFSourceReader **ppSourceReader );
STDAPI MFCreateSourceReaderFromByteStream(
    __in IMFByteStream *pByteStream,
    __in_opt IMFAttributes *pAttributes,
    __out IMFSourceReader **ppSourceReader );
STDAPI MFCreateSourceReaderFromMediaSource(
    __in IMFMediaSource *pMediaSource,
    __in_opt IMFAttributes *pAttributes,
    __out IMFSourceReader **ppSourceReader );
EXTERN_GUID( MF_SOURCE_READER_ASYNC_CALLBACK, 0x1e3dbeac, 0xbb43, 0x4c35, 0xb5, 0x07, 0xcd, 0x64, 0x44, 0x64, 0xc9, 0x65);
EXTERN_GUID( MF_SOURCE_READER_D3D_MANAGER, 0xec822da2, 0xe1e9, 0x4b29, 0xa0, 0xd8, 0x56, 0x3c, 0x71, 0x9f, 0x52, 0x69);
EXTERN_GUID( MF_SOURCE_READER_DISABLE_DXVA, 0xaa456cfd, 0x3943, 0x4a1e, 0xa7, 0x7d, 0x18, 0x38, 0xc0, 0xea, 0x2e, 0x35);
EXTERN_GUID( MF_SOURCE_READER_MEDIASOURCE_CONFIG, 0x9085abeb, 0x0354, 0x48f9, 0xab, 0xb5, 0x20, 0x0d, 0xf8, 0x38, 0xc6, 0x8e);
EXTERN_GUID( MF_SOURCE_READER_MEDIASOURCE_CHARACTERISTICS, 0x6d23f5c8, 0xc5d7, 0x4a9b, 0x99, 0x71, 0x5d, 0x11, 0xf8, 0xbc, 0xa8, 0x80);
EXTERN_GUID( MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING, 0xfb394f3d, 0xccf1, 0x42ee, 0xbb, 0xb3, 0xf9, 0xb8, 0x45, 0xd5, 0x68, 0x1d);
EXTERN_GUID( MF_SOURCE_READER_DISCONNECT_MEDIASOURCE_ON_SHUTDOWN, 0x56b67165, 0x219e, 0x456d, 0xa2, 0x2e, 0x2d, 0x30, 0x04, 0xc7, 0xfe, 0x56);
typedef /* [v1_enum] */ 
enum MF_SOURCE_READER_FLAG
    {	MF_SOURCE_READERF_ERROR	= 0x1,
	MF_SOURCE_READERF_ENDOFSTREAM	= 0x2,
	MF_SOURCE_READERF_NEWSTREAM	= 0x4,
	MF_SOURCE_READERF_NATIVEMEDIATYPECHANGED	= 0x10,
	MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED	= 0x20,
	MF_SOURCE_READERF_STREAMTICK	= 0x100
    } 	MF_SOURCE_READER_FLAG;

DEFINE_ENUM_FLAG_OPERATORS(MF_SOURCE_READER_FLAG)
typedef /* [v1_enum] */ 
enum MF_SOURCE_READER_CONTROL_FLAG
    {	MF_SOURCE_READER_CONTROLF_DRAIN	= 0x1
    } 	MF_SOURCE_READER_CONTROL_FLAG;

DEFINE_ENUM_FLAG_OPERATORS(MF_SOURCE_READER_CONTROL_FLAG)

enum __MIDL___MIDL_itf_mfreadwrite_0000_0001_0001
    {	MF_SOURCE_READER_INVALID_STREAM_INDEX	= 0xffffffff,
	MF_SOURCE_READER_ALL_STREAMS	= 0xfffffffe,
	MF_SOURCE_READER_ANY_STREAM	= 0xfffffffe,
	MF_SOURCE_READER_FIRST_AUDIO_STREAM	= 0xfffffffd,
	MF_SOURCE_READER_FIRST_VIDEO_STREAM	= 0xfffffffc,
	MF_SOURCE_READER_MEDIASOURCE	= 0xffffffff
    } ;


extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0001_v0_0_s_ifspec;

#ifndef __IMFSourceReader_INTERFACE_DEFINED__
#define __IMFSourceReader_INTERFACE_DEFINED__

/* interface IMFSourceReader */
/* [local][uuid][object] */ 


EXTERN_C const IID IID_IMFSourceReader;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("70ae66f2-c809-4e4f-8915-bdcb406b7993")
    IMFSourceReader : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetStreamSelection( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  BOOL *pfSelected) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetStreamSelection( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  BOOL fSelected) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetNativeMediaType( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  DWORD dwMediaTypeIndex,
            /* [annotation][out] */ 
            __out  IMFMediaType **ppMediaType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetCurrentMediaType( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  IMFMediaType **ppMediaType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetCurrentMediaType( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out][in] */ 
            __reserved  DWORD *pdwReserved,
            /* [annotation][in] */ 
            __in  IMFMediaType *pMediaType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetCurrentPosition( 
            /* [annotation][in] */ 
            __in  REFGUID guidTimeFormat,
            /* [annotation][in] */ 
            __in  REFPROPVARIANT varPosition) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ReadSample( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  DWORD dwControlFlags,
            /* [annotation][out] */ 
            __out_opt  DWORD *pdwActualStreamIndex,
            /* [annotation][out] */ 
            __out_opt  DWORD *pdwStreamFlags,
            /* [annotation][out] */ 
            __out_opt  LONGLONG *pllTimestamp,
            /* [annotation][out] */ 
            __out_opt  IMFSample **ppSample) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Flush( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetServiceForStream( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidService,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][out] */ 
            __out  LPVOID *ppvObject) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetPresentationAttribute( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidAttribute,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvarAttribute) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFSourceReaderVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFSourceReader * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFSourceReader * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFSourceReader * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetStreamSelection )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  BOOL *pfSelected);
        
        HRESULT ( STDMETHODCALLTYPE *SetStreamSelection )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  BOOL fSelected);
        
        HRESULT ( STDMETHODCALLTYPE *GetNativeMediaType )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  DWORD dwMediaTypeIndex,
            /* [annotation][out] */ 
            __out  IMFMediaType **ppMediaType);
        
        HRESULT ( STDMETHODCALLTYPE *GetCurrentMediaType )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  IMFMediaType **ppMediaType);
        
        HRESULT ( STDMETHODCALLTYPE *SetCurrentMediaType )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out][in] */ 
            __reserved  DWORD *pdwReserved,
            /* [annotation][in] */ 
            __in  IMFMediaType *pMediaType);
        
        HRESULT ( STDMETHODCALLTYPE *SetCurrentPosition )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  REFGUID guidTimeFormat,
            /* [annotation][in] */ 
            __in  REFPROPVARIANT varPosition);
        
        HRESULT ( STDMETHODCALLTYPE *ReadSample )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  DWORD dwControlFlags,
            /* [annotation][out] */ 
            __out_opt  DWORD *pdwActualStreamIndex,
            /* [annotation][out] */ 
            __out_opt  DWORD *pdwStreamFlags,
            /* [annotation][out] */ 
            __out_opt  LONGLONG *pllTimestamp,
            /* [annotation][out] */ 
            __out_opt  IMFSample **ppSample);
        
        HRESULT ( STDMETHODCALLTYPE *Flush )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex);
        
        HRESULT ( STDMETHODCALLTYPE *GetServiceForStream )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidService,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][out] */ 
            __out  LPVOID *ppvObject);
        
        HRESULT ( STDMETHODCALLTYPE *GetPresentationAttribute )( 
            IMFSourceReader * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidAttribute,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvarAttribute);
        
        END_INTERFACE
    } IMFSourceReaderVtbl;

    interface IMFSourceReader
    {
        CONST_VTBL struct IMFSourceReaderVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFSourceReader_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFSourceReader_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFSourceReader_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFSourceReader_GetStreamSelection(This,dwStreamIndex,pfSelected)	\
    ( (This)->lpVtbl -> GetStreamSelection(This,dwStreamIndex,pfSelected) ) 

#define IMFSourceReader_SetStreamSelection(This,dwStreamIndex,fSelected)	\
    ( (This)->lpVtbl -> SetStreamSelection(This,dwStreamIndex,fSelected) ) 

#define IMFSourceReader_GetNativeMediaType(This,dwStreamIndex,dwMediaTypeIndex,ppMediaType)	\
    ( (This)->lpVtbl -> GetNativeMediaType(This,dwStreamIndex,dwMediaTypeIndex,ppMediaType) ) 

#define IMFSourceReader_GetCurrentMediaType(This,dwStreamIndex,ppMediaType)	\
    ( (This)->lpVtbl -> GetCurrentMediaType(This,dwStreamIndex,ppMediaType) ) 

#define IMFSourceReader_SetCurrentMediaType(This,dwStreamIndex,pdwReserved,pMediaType)	\
    ( (This)->lpVtbl -> SetCurrentMediaType(This,dwStreamIndex,pdwReserved,pMediaType) ) 

#define IMFSourceReader_SetCurrentPosition(This,guidTimeFormat,varPosition)	\
    ( (This)->lpVtbl -> SetCurrentPosition(This,guidTimeFormat,varPosition) ) 

#define IMFSourceReader_ReadSample(This,dwStreamIndex,dwControlFlags,pdwActualStreamIndex,pdwStreamFlags,pllTimestamp,ppSample)	\
    ( (This)->lpVtbl -> ReadSample(This,dwStreamIndex,dwControlFlags,pdwActualStreamIndex,pdwStreamFlags,pllTimestamp,ppSample) ) 

#define IMFSourceReader_Flush(This,dwStreamIndex)	\
    ( (This)->lpVtbl -> Flush(This,dwStreamIndex) ) 

#define IMFSourceReader_GetServiceForStream(This,dwStreamIndex,guidService,riid,ppvObject)	\
    ( (This)->lpVtbl -> GetServiceForStream(This,dwStreamIndex,guidService,riid,ppvObject) ) 

#define IMFSourceReader_GetPresentationAttribute(This,dwStreamIndex,guidAttribute,pvarAttribute)	\
    ( (This)->lpVtbl -> GetPresentationAttribute(This,dwStreamIndex,guidAttribute,pvarAttribute) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFSourceReader_INTERFACE_DEFINED__ */


#ifndef __IMFSourceReaderCallback_INTERFACE_DEFINED__
#define __IMFSourceReaderCallback_INTERFACE_DEFINED__

/* interface IMFSourceReaderCallback */
/* [local][uuid][object] */ 


EXTERN_C const IID IID_IMFSourceReaderCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("deec8d99-fa1d-4d82-84c2-2c8969944867")
    IMFSourceReaderCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE OnReadSample( 
            /* [annotation][in] */ 
            __in  HRESULT hrStatus,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  DWORD dwStreamFlags,
            /* [annotation][in] */ 
            __in  LONGLONG llTimestamp,
            /* [annotation][in] */ 
            __in_opt  IMFSample *pSample) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnFlush( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnEvent( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  IMFMediaEvent *pEvent) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFSourceReaderCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFSourceReaderCallback * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFSourceReaderCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFSourceReaderCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *OnReadSample )( 
            IMFSourceReaderCallback * This,
            /* [annotation][in] */ 
            __in  HRESULT hrStatus,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  DWORD dwStreamFlags,
            /* [annotation][in] */ 
            __in  LONGLONG llTimestamp,
            /* [annotation][in] */ 
            __in_opt  IMFSample *pSample);
        
        HRESULT ( STDMETHODCALLTYPE *OnFlush )( 
            IMFSourceReaderCallback * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex);
        
        HRESULT ( STDMETHODCALLTYPE *OnEvent )( 
            IMFSourceReaderCallback * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  IMFMediaEvent *pEvent);
        
        END_INTERFACE
    } IMFSourceReaderCallbackVtbl;

    interface IMFSourceReaderCallback
    {
        CONST_VTBL struct IMFSourceReaderCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFSourceReaderCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFSourceReaderCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFSourceReaderCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFSourceReaderCallback_OnReadSample(This,hrStatus,dwStreamIndex,dwStreamFlags,llTimestamp,pSample)	\
    ( (This)->lpVtbl -> OnReadSample(This,hrStatus,dwStreamIndex,dwStreamFlags,llTimestamp,pSample) ) 

#define IMFSourceReaderCallback_OnFlush(This,dwStreamIndex)	\
    ( (This)->lpVtbl -> OnFlush(This,dwStreamIndex) ) 

#define IMFSourceReaderCallback_OnEvent(This,dwStreamIndex,pEvent)	\
    ( (This)->lpVtbl -> OnEvent(This,dwStreamIndex,pEvent) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFSourceReaderCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_mfreadwrite_0000_0003 */
/* [local] */ 

EXTERN_GUID(CLSID_MFSinkWriter, 0xa3bbfb17, 0x8273, 0x4e52, 0x9e, 0x0e, 0x97, 0x39, 0xdc, 0x88, 0x79, 0x90);
STDAPI MFCreateSinkWriterFromURL(
    __in_opt LPCWSTR pwszOutputURL,
    __in_opt IMFByteStream *pByteStream,
    __in_opt IMFAttributes *pAttributes,
    __out IMFSinkWriter **ppSinkWriter );
STDAPI MFCreateSinkWriterFromMediaSink(
    __in IMFMediaSink *pMediaSink,
    __in_opt IMFAttributes *pAttributes,
    __out IMFSinkWriter **ppSinkWriter );
EXTERN_GUID( MF_SINK_WRITER_ASYNC_CALLBACK, 0x48cb183e, 0x7b0b, 0x46f4, 0x82, 0x2e, 0x5e, 0x1d, 0x2d, 0xda, 0x43, 0x54);
EXTERN_GUID( MF_SINK_WRITER_DISABLE_THROTTLING, 0x08b845d8, 0x2b74, 0x4afe, 0x9d, 0x53, 0xbe, 0x16, 0xd2, 0xd5, 0xae, 0x4f);

enum __MIDL___MIDL_itf_mfreadwrite_0000_0003_0001
    {	MF_SINK_WRITER_INVALID_STREAM_INDEX	= 0xffffffff,
	MF_SINK_WRITER_ALL_STREAMS	= 0xfffffffe,
	MF_SINK_WRITER_MEDIASINK	= 0xffffffff
    } ;
typedef struct _MF_SINK_WRITER_STATISTICS
    {
    DWORD cb;
    LONGLONG llLastTimestampReceived;
    LONGLONG llLastTimestampEncoded;
    LONGLONG llLastTimestampProcessed;
    LONGLONG llLastStreamTickReceived;
    LONGLONG llLastSinkSampleRequest;
    QWORD qwNumSamplesReceived;
    QWORD qwNumSamplesEncoded;
    QWORD qwNumSamplesProcessed;
    QWORD qwNumStreamTicksReceived;
    DWORD dwByteCountQueued;
    QWORD qwByteCountProcessed;
    DWORD dwNumOutstandingSinkSampleRequests;
    DWORD dwAverageSampleRateReceived;
    DWORD dwAverageSampleRateEncoded;
    DWORD dwAverageSampleRateProcessed;
    } 	MF_SINK_WRITER_STATISTICS;



extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0003_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0003_v0_0_s_ifspec;

#ifndef __IMFSinkWriter_INTERFACE_DEFINED__
#define __IMFSinkWriter_INTERFACE_DEFINED__

/* interface IMFSinkWriter */
/* [local][uuid][object] */ 


EXTERN_C const IID IID_IMFSinkWriter;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3137f1cd-fe5e-4805-a5d8-fb477448cb3d")
    IMFSinkWriter : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE AddStream( 
            /* [annotation][in] */ 
            __in  IMFMediaType *pTargetMediaType,
            /* [annotation][out] */ 
            __out  DWORD *pdwStreamIndex) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetInputMediaType( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  IMFMediaType *pInputMediaType,
            /* [annotation][in] */ 
            __in_opt  IMFAttributes *pEncodingParameters) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE BeginWriting( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE WriteSample( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  IMFSample *pSample) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SendStreamTick( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  LONGLONG llTimestamp) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE PlaceMarker( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  LPVOID pvContext) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE NotifyEndOfSegment( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Flush( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Finalize( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetServiceForStream( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidService,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][out] */ 
            __out  LPVOID *ppvObject) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStatistics( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  MF_SINK_WRITER_STATISTICS *pStats) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFSinkWriterVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFSinkWriter * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFSinkWriter * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFSinkWriter * This);
        
        HRESULT ( STDMETHODCALLTYPE *AddStream )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  IMFMediaType *pTargetMediaType,
            /* [annotation][out] */ 
            __out  DWORD *pdwStreamIndex);
        
        HRESULT ( STDMETHODCALLTYPE *SetInputMediaType )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  IMFMediaType *pInputMediaType,
            /* [annotation][in] */ 
            __in_opt  IMFAttributes *pEncodingParameters);
        
        HRESULT ( STDMETHODCALLTYPE *BeginWriting )( 
            IMFSinkWriter * This);
        
        HRESULT ( STDMETHODCALLTYPE *WriteSample )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  IMFSample *pSample);
        
        HRESULT ( STDMETHODCALLTYPE *SendStreamTick )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  LONGLONG llTimestamp);
        
        HRESULT ( STDMETHODCALLTYPE *PlaceMarker )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  LPVOID pvContext);
        
        HRESULT ( STDMETHODCALLTYPE *NotifyEndOfSegment )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex);
        
        HRESULT ( STDMETHODCALLTYPE *Flush )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex);
        
        HRESULT ( STDMETHODCALLTYPE *Finalize )( 
            IMFSinkWriter * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetServiceForStream )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidService,
            /* [annotation][in] */ 
            __in  REFIID riid,
            /* [annotation][out] */ 
            __out  LPVOID *ppvObject);
        
        HRESULT ( STDMETHODCALLTYPE *GetStatistics )( 
            IMFSinkWriter * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  MF_SINK_WRITER_STATISTICS *pStats);
        
        END_INTERFACE
    } IMFSinkWriterVtbl;

    interface IMFSinkWriter
    {
        CONST_VTBL struct IMFSinkWriterVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFSinkWriter_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFSinkWriter_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFSinkWriter_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFSinkWriter_AddStream(This,pTargetMediaType,pdwStreamIndex)	\
    ( (This)->lpVtbl -> AddStream(This,pTargetMediaType,pdwStreamIndex) ) 

#define IMFSinkWriter_SetInputMediaType(This,dwStreamIndex,pInputMediaType,pEncodingParameters)	\
    ( (This)->lpVtbl -> SetInputMediaType(This,dwStreamIndex,pInputMediaType,pEncodingParameters) ) 

#define IMFSinkWriter_BeginWriting(This)	\
    ( (This)->lpVtbl -> BeginWriting(This) ) 

#define IMFSinkWriter_WriteSample(This,dwStreamIndex,pSample)	\
    ( (This)->lpVtbl -> WriteSample(This,dwStreamIndex,pSample) ) 

#define IMFSinkWriter_SendStreamTick(This,dwStreamIndex,llTimestamp)	\
    ( (This)->lpVtbl -> SendStreamTick(This,dwStreamIndex,llTimestamp) ) 

#define IMFSinkWriter_PlaceMarker(This,dwStreamIndex,pvContext)	\
    ( (This)->lpVtbl -> PlaceMarker(This,dwStreamIndex,pvContext) ) 

#define IMFSinkWriter_NotifyEndOfSegment(This,dwStreamIndex)	\
    ( (This)->lpVtbl -> NotifyEndOfSegment(This,dwStreamIndex) ) 

#define IMFSinkWriter_Flush(This,dwStreamIndex)	\
    ( (This)->lpVtbl -> Flush(This,dwStreamIndex) ) 

#define IMFSinkWriter_Finalize(This)	\
    ( (This)->lpVtbl -> Finalize(This) ) 

#define IMFSinkWriter_GetServiceForStream(This,dwStreamIndex,guidService,riid,ppvObject)	\
    ( (This)->lpVtbl -> GetServiceForStream(This,dwStreamIndex,guidService,riid,ppvObject) ) 

#define IMFSinkWriter_GetStatistics(This,dwStreamIndex,pStats)	\
    ( (This)->lpVtbl -> GetStatistics(This,dwStreamIndex,pStats) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFSinkWriter_INTERFACE_DEFINED__ */


#ifndef __IMFSinkWriterCallback_INTERFACE_DEFINED__
#define __IMFSinkWriterCallback_INTERFACE_DEFINED__

/* interface IMFSinkWriterCallback */
/* [local][uuid][object] */ 


EXTERN_C const IID IID_IMFSinkWriterCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("666f76de-33d2-41b9-a458-29ed0a972c58")
    IMFSinkWriterCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE OnFinalize( 
            /* [annotation][in] */ 
            __in  HRESULT hrStatus) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnMarker( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  LPVOID pvContext) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFSinkWriterCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFSinkWriterCallback * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFSinkWriterCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFSinkWriterCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *OnFinalize )( 
            IMFSinkWriterCallback * This,
            /* [annotation][in] */ 
            __in  HRESULT hrStatus);
        
        HRESULT ( STDMETHODCALLTYPE *OnMarker )( 
            IMFSinkWriterCallback * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  LPVOID pvContext);
        
        END_INTERFACE
    } IMFSinkWriterCallbackVtbl;

    interface IMFSinkWriterCallback
    {
        CONST_VTBL struct IMFSinkWriterCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFSinkWriterCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFSinkWriterCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFSinkWriterCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFSinkWriterCallback_OnFinalize(This,hrStatus)	\
    ( (This)->lpVtbl -> OnFinalize(This,hrStatus) ) 

#define IMFSinkWriterCallback_OnMarker(This,dwStreamIndex,pvContext)	\
    ( (This)->lpVtbl -> OnMarker(This,dwStreamIndex,pvContext) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFSinkWriterCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_mfreadwrite_0000_0005 */
/* [local] */ 

EXTERN_GUID( MF_READWRITE_DISABLE_CONVERTERS, 0x98d5b065, 0x1374, 0x4847, 0x8d, 0x5d, 0x31, 0x52, 0x0f, 0xee, 0x71, 0x56);
EXTERN_GUID( MF_READWRITE_ENABLE_HARDWARE_TRANSFORMS, 0xa634a91c, 0x822b, 0x41b9, 0xa4, 0x94, 0x4d, 0xe4, 0x64, 0x36, 0x12, 0xb0);
#endif // (WINVER >= _WIN32_WINNT_WIN7) 


extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0005_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfreadwrite_0000_0005_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



