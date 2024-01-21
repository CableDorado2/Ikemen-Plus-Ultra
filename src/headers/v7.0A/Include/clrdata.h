

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0499 */
/* Compiler settings for clrdata.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
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

#ifndef __clrdata_h__
#define __clrdata_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ICLRDataTarget_FWD_DEFINED__
#define __ICLRDataTarget_FWD_DEFINED__
typedef interface ICLRDataTarget ICLRDataTarget;
#endif 	/* __ICLRDataTarget_FWD_DEFINED__ */


#ifndef __ICLRDataTarget2_FWD_DEFINED__
#define __ICLRDataTarget2_FWD_DEFINED__
typedef interface ICLRDataTarget2 ICLRDataTarget2;
#endif 	/* __ICLRDataTarget2_FWD_DEFINED__ */


#ifndef __ICLRMetadataLocator_FWD_DEFINED__
#define __ICLRMetadataLocator_FWD_DEFINED__
typedef interface ICLRMetadataLocator ICLRMetadataLocator;
#endif 	/* __ICLRMetadataLocator_FWD_DEFINED__ */


#ifndef __ICLRDataEnumMemoryRegionsCallback_FWD_DEFINED__
#define __ICLRDataEnumMemoryRegionsCallback_FWD_DEFINED__
typedef interface ICLRDataEnumMemoryRegionsCallback ICLRDataEnumMemoryRegionsCallback;
#endif 	/* __ICLRDataEnumMemoryRegionsCallback_FWD_DEFINED__ */


#ifndef __ICLRDataEnumMemoryRegions_FWD_DEFINED__
#define __ICLRDataEnumMemoryRegions_FWD_DEFINED__
typedef interface ICLRDataEnumMemoryRegions ICLRDataEnumMemoryRegions;
#endif 	/* __ICLRDataEnumMemoryRegions_FWD_DEFINED__ */


/* header files for imported files */
#include "unknwn.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_clrdata_0000_0000 */
/* [local] */ 






typedef ULONG64 CLRDATA_ADDRESS;

STDAPI CLRDataCreateInstance(REFIID iid, ICLRDataTarget* target, void** iface);
typedef HRESULT (STDAPICALLTYPE* PFN_CLRDataCreateInstance)(REFIID iid, ICLRDataTarget* target, void** iface);


extern RPC_IF_HANDLE __MIDL_itf_clrdata_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_clrdata_0000_0000_v0_0_s_ifspec;

#ifndef __ICLRDataTarget_INTERFACE_DEFINED__
#define __ICLRDataTarget_INTERFACE_DEFINED__

/* interface ICLRDataTarget */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ICLRDataTarget;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3E11CCEE-D08B-43e5-AF01-32717A64DA03")
    ICLRDataTarget : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetMachineType( 
            /* [out] */ ULONG32 *machineType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetPointerSize( 
            /* [out] */ ULONG32 *pointerSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetImageBase( 
            /* [string][in] */ LPCWSTR imagePath,
            /* [out] */ CLRDATA_ADDRESS *baseAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ReadVirtual( 
            /* [in] */ CLRDATA_ADDRESS address,
            /* [length_is][size_is][out] */ BYTE *buffer,
            /* [in] */ ULONG32 bytesRequested,
            /* [out] */ ULONG32 *bytesRead) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE WriteVirtual( 
            /* [in] */ CLRDATA_ADDRESS address,
            /* [size_is][in] */ BYTE *buffer,
            /* [in] */ ULONG32 bytesRequested,
            /* [out] */ ULONG32 *bytesWritten) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetTLSValue( 
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 index,
            /* [out] */ CLRDATA_ADDRESS *value) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetTLSValue( 
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 index,
            /* [in] */ CLRDATA_ADDRESS value) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetCurrentThreadID( 
            /* [out] */ ULONG32 *threadID) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetThreadContext( 
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 contextFlags,
            /* [in] */ ULONG32 contextSize,
            /* [size_is][out] */ BYTE *context) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetThreadContext( 
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 contextSize,
            /* [size_is][in] */ BYTE *context) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Request( 
            /* [in] */ ULONG32 reqCode,
            /* [in] */ ULONG32 inBufferSize,
            /* [size_is][in] */ BYTE *inBuffer,
            /* [in] */ ULONG32 outBufferSize,
            /* [size_is][out] */ BYTE *outBuffer) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICLRDataTargetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICLRDataTarget * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICLRDataTarget * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICLRDataTarget * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetMachineType )( 
            ICLRDataTarget * This,
            /* [out] */ ULONG32 *machineType);
        
        HRESULT ( STDMETHODCALLTYPE *GetPointerSize )( 
            ICLRDataTarget * This,
            /* [out] */ ULONG32 *pointerSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetImageBase )( 
            ICLRDataTarget * This,
            /* [string][in] */ LPCWSTR imagePath,
            /* [out] */ CLRDATA_ADDRESS *baseAddress);
        
        HRESULT ( STDMETHODCALLTYPE *ReadVirtual )( 
            ICLRDataTarget * This,
            /* [in] */ CLRDATA_ADDRESS address,
            /* [length_is][size_is][out] */ BYTE *buffer,
            /* [in] */ ULONG32 bytesRequested,
            /* [out] */ ULONG32 *bytesRead);
        
        HRESULT ( STDMETHODCALLTYPE *WriteVirtual )( 
            ICLRDataTarget * This,
            /* [in] */ CLRDATA_ADDRESS address,
            /* [size_is][in] */ BYTE *buffer,
            /* [in] */ ULONG32 bytesRequested,
            /* [out] */ ULONG32 *bytesWritten);
        
        HRESULT ( STDMETHODCALLTYPE *GetTLSValue )( 
            ICLRDataTarget * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 index,
            /* [out] */ CLRDATA_ADDRESS *value);
        
        HRESULT ( STDMETHODCALLTYPE *SetTLSValue )( 
            ICLRDataTarget * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 index,
            /* [in] */ CLRDATA_ADDRESS value);
        
        HRESULT ( STDMETHODCALLTYPE *GetCurrentThreadID )( 
            ICLRDataTarget * This,
            /* [out] */ ULONG32 *threadID);
        
        HRESULT ( STDMETHODCALLTYPE *GetThreadContext )( 
            ICLRDataTarget * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 contextFlags,
            /* [in] */ ULONG32 contextSize,
            /* [size_is][out] */ BYTE *context);
        
        HRESULT ( STDMETHODCALLTYPE *SetThreadContext )( 
            ICLRDataTarget * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 contextSize,
            /* [size_is][in] */ BYTE *context);
        
        HRESULT ( STDMETHODCALLTYPE *Request )( 
            ICLRDataTarget * This,
            /* [in] */ ULONG32 reqCode,
            /* [in] */ ULONG32 inBufferSize,
            /* [size_is][in] */ BYTE *inBuffer,
            /* [in] */ ULONG32 outBufferSize,
            /* [size_is][out] */ BYTE *outBuffer);
        
        END_INTERFACE
    } ICLRDataTargetVtbl;

    interface ICLRDataTarget
    {
        CONST_VTBL struct ICLRDataTargetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICLRDataTarget_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICLRDataTarget_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICLRDataTarget_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICLRDataTarget_GetMachineType(This,machineType)	\
    ( (This)->lpVtbl -> GetMachineType(This,machineType) ) 

#define ICLRDataTarget_GetPointerSize(This,pointerSize)	\
    ( (This)->lpVtbl -> GetPointerSize(This,pointerSize) ) 

#define ICLRDataTarget_GetImageBase(This,imagePath,baseAddress)	\
    ( (This)->lpVtbl -> GetImageBase(This,imagePath,baseAddress) ) 

#define ICLRDataTarget_ReadVirtual(This,address,buffer,bytesRequested,bytesRead)	\
    ( (This)->lpVtbl -> ReadVirtual(This,address,buffer,bytesRequested,bytesRead) ) 

#define ICLRDataTarget_WriteVirtual(This,address,buffer,bytesRequested,bytesWritten)	\
    ( (This)->lpVtbl -> WriteVirtual(This,address,buffer,bytesRequested,bytesWritten) ) 

#define ICLRDataTarget_GetTLSValue(This,threadID,index,value)	\
    ( (This)->lpVtbl -> GetTLSValue(This,threadID,index,value) ) 

#define ICLRDataTarget_SetTLSValue(This,threadID,index,value)	\
    ( (This)->lpVtbl -> SetTLSValue(This,threadID,index,value) ) 

#define ICLRDataTarget_GetCurrentThreadID(This,threadID)	\
    ( (This)->lpVtbl -> GetCurrentThreadID(This,threadID) ) 

#define ICLRDataTarget_GetThreadContext(This,threadID,contextFlags,contextSize,context)	\
    ( (This)->lpVtbl -> GetThreadContext(This,threadID,contextFlags,contextSize,context) ) 

#define ICLRDataTarget_SetThreadContext(This,threadID,contextSize,context)	\
    ( (This)->lpVtbl -> SetThreadContext(This,threadID,contextSize,context) ) 

#define ICLRDataTarget_Request(This,reqCode,inBufferSize,inBuffer,outBufferSize,outBuffer)	\
    ( (This)->lpVtbl -> Request(This,reqCode,inBufferSize,inBuffer,outBufferSize,outBuffer) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICLRDataTarget_INTERFACE_DEFINED__ */


#ifndef __ICLRDataTarget2_INTERFACE_DEFINED__
#define __ICLRDataTarget2_INTERFACE_DEFINED__

/* interface ICLRDataTarget2 */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ICLRDataTarget2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6d05fae3-189c-4630-a6dc-1c251e1c01ab")
    ICLRDataTarget2 : public ICLRDataTarget
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE AllocVirtual( 
            /* [in] */ CLRDATA_ADDRESS addr,
            /* [in] */ ULONG32 size,
            /* [in] */ ULONG32 typeFlags,
            /* [in] */ ULONG32 protectFlags,
            /* [out] */ CLRDATA_ADDRESS *virt) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FreeVirtual( 
            /* [in] */ CLRDATA_ADDRESS addr,
            /* [in] */ ULONG32 size,
            /* [in] */ ULONG32 typeFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICLRDataTarget2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICLRDataTarget2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICLRDataTarget2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICLRDataTarget2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetMachineType )( 
            ICLRDataTarget2 * This,
            /* [out] */ ULONG32 *machineType);
        
        HRESULT ( STDMETHODCALLTYPE *GetPointerSize )( 
            ICLRDataTarget2 * This,
            /* [out] */ ULONG32 *pointerSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetImageBase )( 
            ICLRDataTarget2 * This,
            /* [string][in] */ LPCWSTR imagePath,
            /* [out] */ CLRDATA_ADDRESS *baseAddress);
        
        HRESULT ( STDMETHODCALLTYPE *ReadVirtual )( 
            ICLRDataTarget2 * This,
            /* [in] */ CLRDATA_ADDRESS address,
            /* [length_is][size_is][out] */ BYTE *buffer,
            /* [in] */ ULONG32 bytesRequested,
            /* [out] */ ULONG32 *bytesRead);
        
        HRESULT ( STDMETHODCALLTYPE *WriteVirtual )( 
            ICLRDataTarget2 * This,
            /* [in] */ CLRDATA_ADDRESS address,
            /* [size_is][in] */ BYTE *buffer,
            /* [in] */ ULONG32 bytesRequested,
            /* [out] */ ULONG32 *bytesWritten);
        
        HRESULT ( STDMETHODCALLTYPE *GetTLSValue )( 
            ICLRDataTarget2 * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 index,
            /* [out] */ CLRDATA_ADDRESS *value);
        
        HRESULT ( STDMETHODCALLTYPE *SetTLSValue )( 
            ICLRDataTarget2 * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 index,
            /* [in] */ CLRDATA_ADDRESS value);
        
        HRESULT ( STDMETHODCALLTYPE *GetCurrentThreadID )( 
            ICLRDataTarget2 * This,
            /* [out] */ ULONG32 *threadID);
        
        HRESULT ( STDMETHODCALLTYPE *GetThreadContext )( 
            ICLRDataTarget2 * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 contextFlags,
            /* [in] */ ULONG32 contextSize,
            /* [size_is][out] */ BYTE *context);
        
        HRESULT ( STDMETHODCALLTYPE *SetThreadContext )( 
            ICLRDataTarget2 * This,
            /* [in] */ ULONG32 threadID,
            /* [in] */ ULONG32 contextSize,
            /* [size_is][in] */ BYTE *context);
        
        HRESULT ( STDMETHODCALLTYPE *Request )( 
            ICLRDataTarget2 * This,
            /* [in] */ ULONG32 reqCode,
            /* [in] */ ULONG32 inBufferSize,
            /* [size_is][in] */ BYTE *inBuffer,
            /* [in] */ ULONG32 outBufferSize,
            /* [size_is][out] */ BYTE *outBuffer);
        
        HRESULT ( STDMETHODCALLTYPE *AllocVirtual )( 
            ICLRDataTarget2 * This,
            /* [in] */ CLRDATA_ADDRESS addr,
            /* [in] */ ULONG32 size,
            /* [in] */ ULONG32 typeFlags,
            /* [in] */ ULONG32 protectFlags,
            /* [out] */ CLRDATA_ADDRESS *virt);
        
        HRESULT ( STDMETHODCALLTYPE *FreeVirtual )( 
            ICLRDataTarget2 * This,
            /* [in] */ CLRDATA_ADDRESS addr,
            /* [in] */ ULONG32 size,
            /* [in] */ ULONG32 typeFlags);
        
        END_INTERFACE
    } ICLRDataTarget2Vtbl;

    interface ICLRDataTarget2
    {
        CONST_VTBL struct ICLRDataTarget2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICLRDataTarget2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICLRDataTarget2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICLRDataTarget2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICLRDataTarget2_GetMachineType(This,machineType)	\
    ( (This)->lpVtbl -> GetMachineType(This,machineType) ) 

#define ICLRDataTarget2_GetPointerSize(This,pointerSize)	\
    ( (This)->lpVtbl -> GetPointerSize(This,pointerSize) ) 

#define ICLRDataTarget2_GetImageBase(This,imagePath,baseAddress)	\
    ( (This)->lpVtbl -> GetImageBase(This,imagePath,baseAddress) ) 

#define ICLRDataTarget2_ReadVirtual(This,address,buffer,bytesRequested,bytesRead)	\
    ( (This)->lpVtbl -> ReadVirtual(This,address,buffer,bytesRequested,bytesRead) ) 

#define ICLRDataTarget2_WriteVirtual(This,address,buffer,bytesRequested,bytesWritten)	\
    ( (This)->lpVtbl -> WriteVirtual(This,address,buffer,bytesRequested,bytesWritten) ) 

#define ICLRDataTarget2_GetTLSValue(This,threadID,index,value)	\
    ( (This)->lpVtbl -> GetTLSValue(This,threadID,index,value) ) 

#define ICLRDataTarget2_SetTLSValue(This,threadID,index,value)	\
    ( (This)->lpVtbl -> SetTLSValue(This,threadID,index,value) ) 

#define ICLRDataTarget2_GetCurrentThreadID(This,threadID)	\
    ( (This)->lpVtbl -> GetCurrentThreadID(This,threadID) ) 

#define ICLRDataTarget2_GetThreadContext(This,threadID,contextFlags,contextSize,context)	\
    ( (This)->lpVtbl -> GetThreadContext(This,threadID,contextFlags,contextSize,context) ) 

#define ICLRDataTarget2_SetThreadContext(This,threadID,contextSize,context)	\
    ( (This)->lpVtbl -> SetThreadContext(This,threadID,contextSize,context) ) 

#define ICLRDataTarget2_Request(This,reqCode,inBufferSize,inBuffer,outBufferSize,outBuffer)	\
    ( (This)->lpVtbl -> Request(This,reqCode,inBufferSize,inBuffer,outBufferSize,outBuffer) ) 


#define ICLRDataTarget2_AllocVirtual(This,addr,size,typeFlags,protectFlags,virt)	\
    ( (This)->lpVtbl -> AllocVirtual(This,addr,size,typeFlags,protectFlags,virt) ) 

#define ICLRDataTarget2_FreeVirtual(This,addr,size,typeFlags)	\
    ( (This)->lpVtbl -> FreeVirtual(This,addr,size,typeFlags) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICLRDataTarget2_INTERFACE_DEFINED__ */


#ifndef __ICLRMetadataLocator_INTERFACE_DEFINED__
#define __ICLRMetadataLocator_INTERFACE_DEFINED__

/* interface ICLRMetadataLocator */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ICLRMetadataLocator;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("aa8fa804-bc05-4642-b2c5-c353ed22fc63")
    ICLRMetadataLocator : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetMetadata( 
            /* [in] */ LPCWSTR imagePath,
            /* [in] */ ULONG32 imageTimestamp,
            /* [in] */ ULONG32 imageSize,
            /* [in] */ GUID *mvid,
            /* [in] */ ULONG32 mdRva,
            /* [in] */ ULONG32 flags,
            /* [in] */ ULONG32 bufferSize,
            /* [length_is][size_is][out] */ BYTE *buffer,
            /* [out] */ ULONG32 *dataSize) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICLRMetadataLocatorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICLRMetadataLocator * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICLRMetadataLocator * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICLRMetadataLocator * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetMetadata )( 
            ICLRMetadataLocator * This,
            /* [in] */ LPCWSTR imagePath,
            /* [in] */ ULONG32 imageTimestamp,
            /* [in] */ ULONG32 imageSize,
            /* [in] */ GUID *mvid,
            /* [in] */ ULONG32 mdRva,
            /* [in] */ ULONG32 flags,
            /* [in] */ ULONG32 bufferSize,
            /* [length_is][size_is][out] */ BYTE *buffer,
            /* [out] */ ULONG32 *dataSize);
        
        END_INTERFACE
    } ICLRMetadataLocatorVtbl;

    interface ICLRMetadataLocator
    {
        CONST_VTBL struct ICLRMetadataLocatorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICLRMetadataLocator_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICLRMetadataLocator_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICLRMetadataLocator_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICLRMetadataLocator_GetMetadata(This,imagePath,imageTimestamp,imageSize,mvid,mdRva,flags,bufferSize,buffer,dataSize)	\
    ( (This)->lpVtbl -> GetMetadata(This,imagePath,imageTimestamp,imageSize,mvid,mdRva,flags,bufferSize,buffer,dataSize) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICLRMetadataLocator_INTERFACE_DEFINED__ */


#ifndef __ICLRDataEnumMemoryRegionsCallback_INTERFACE_DEFINED__
#define __ICLRDataEnumMemoryRegionsCallback_INTERFACE_DEFINED__

/* interface ICLRDataEnumMemoryRegionsCallback */
/* [uuid][local][object] */ 


EXTERN_C const IID IID_ICLRDataEnumMemoryRegionsCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BCDD6908-BA2D-4ec5-96CF-DF4D5CDCB4A4")
    ICLRDataEnumMemoryRegionsCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE EnumMemoryRegion( 
            /* [in] */ CLRDATA_ADDRESS address,
            /* [in] */ ULONG32 size) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICLRDataEnumMemoryRegionsCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICLRDataEnumMemoryRegionsCallback * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICLRDataEnumMemoryRegionsCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICLRDataEnumMemoryRegionsCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *EnumMemoryRegion )( 
            ICLRDataEnumMemoryRegionsCallback * This,
            /* [in] */ CLRDATA_ADDRESS address,
            /* [in] */ ULONG32 size);
        
        END_INTERFACE
    } ICLRDataEnumMemoryRegionsCallbackVtbl;

    interface ICLRDataEnumMemoryRegionsCallback
    {
        CONST_VTBL struct ICLRDataEnumMemoryRegionsCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICLRDataEnumMemoryRegionsCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICLRDataEnumMemoryRegionsCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICLRDataEnumMemoryRegionsCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICLRDataEnumMemoryRegionsCallback_EnumMemoryRegion(This,address,size)	\
    ( (This)->lpVtbl -> EnumMemoryRegion(This,address,size) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICLRDataEnumMemoryRegionsCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_clrdata_0000_0004 */
/* [local] */ 

typedef 
enum CLRDataEnumMemoryFlags
    {	CLRDATA_ENUM_MEM_DEFAULT	= 0,
	CLRDATA_ENUM_MEM_MINI	= CLRDATA_ENUM_MEM_DEFAULT,
	CLRDATA_ENUM_MEM_HEAP	= 0x1
    } 	CLRDataEnumMemoryFlags;



extern RPC_IF_HANDLE __MIDL_itf_clrdata_0000_0004_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_clrdata_0000_0004_v0_0_s_ifspec;

#ifndef __ICLRDataEnumMemoryRegions_INTERFACE_DEFINED__
#define __ICLRDataEnumMemoryRegions_INTERFACE_DEFINED__

/* interface ICLRDataEnumMemoryRegions */
/* [uuid][local][object] */ 


EXTERN_C const IID IID_ICLRDataEnumMemoryRegions;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("471c35b4-7c2f-4ef0-a945-00f8c38056f1")
    ICLRDataEnumMemoryRegions : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE EnumMemoryRegions( 
            /* [in] */ ICLRDataEnumMemoryRegionsCallback *callback,
            /* [in] */ ULONG32 miniDumpFlags,
            /* [in] */ CLRDataEnumMemoryFlags clrFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICLRDataEnumMemoryRegionsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICLRDataEnumMemoryRegions * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICLRDataEnumMemoryRegions * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICLRDataEnumMemoryRegions * This);
        
        HRESULT ( STDMETHODCALLTYPE *EnumMemoryRegions )( 
            ICLRDataEnumMemoryRegions * This,
            /* [in] */ ICLRDataEnumMemoryRegionsCallback *callback,
            /* [in] */ ULONG32 miniDumpFlags,
            /* [in] */ CLRDataEnumMemoryFlags clrFlags);
        
        END_INTERFACE
    } ICLRDataEnumMemoryRegionsVtbl;

    interface ICLRDataEnumMemoryRegions
    {
        CONST_VTBL struct ICLRDataEnumMemoryRegionsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICLRDataEnumMemoryRegions_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICLRDataEnumMemoryRegions_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICLRDataEnumMemoryRegions_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICLRDataEnumMemoryRegions_EnumMemoryRegions(This,callback,miniDumpFlags,clrFlags)	\
    ( (This)->lpVtbl -> EnumMemoryRegions(This,callback,miniDumpFlags,clrFlags) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICLRDataEnumMemoryRegions_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


