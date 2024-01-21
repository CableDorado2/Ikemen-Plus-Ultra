

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for activprof.idl:
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

#ifndef __activprof_h__
#define __activprof_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IActiveScriptProfilerControl_FWD_DEFINED__
#define __IActiveScriptProfilerControl_FWD_DEFINED__
typedef interface IActiveScriptProfilerControl IActiveScriptProfilerControl;
#endif 	/* __IActiveScriptProfilerControl_FWD_DEFINED__ */


#ifndef __IActiveScriptProfilerCallback_FWD_DEFINED__
#define __IActiveScriptProfilerCallback_FWD_DEFINED__
typedef interface IActiveScriptProfilerCallback IActiveScriptProfilerCallback;
#endif 	/* __IActiveScriptProfilerCallback_FWD_DEFINED__ */


/* header files for imported files */
#include "unknwn.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_activprof_0000_0000 */
/* [local] */ 

//=--------------------------------------------------------------------------=
// ActivProf.h
//=--------------------------------------------------------------------------=
// (C) Copyright 2000 Microsoft Corporation.  All Rights Reserved.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//=--------------------------------------------------------------------------=
//
#pragma comment(lib,"uuid.lib")
//
// Declarations for ActiveX Scripting profiling.
//

const HRESULT ACTIVPROF_E_PROFILER_PRESENT = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0200);
const HRESULT ACTIVPROF_E_PROFILER_ABSENT = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0201);
const HRESULT ACTIVPROF_E_UNABLE_TO_APPLY_ACTION = MAKE_HRESULT(SEVERITY_ERROR, FACILITY_ITF, 0x0202);

#ifndef __ActivProf_h
#define __ActivProf_h

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_activprof_0000_0000_0001
    {	PROFILER_SCRIPT_TYPE_USER	= 0,
	PROFILER_SCRIPT_TYPE_DYNAMIC	= ( PROFILER_SCRIPT_TYPE_USER + 1 ) ,
	PROFILER_SCRIPT_TYPE_NATIVE	= ( PROFILER_SCRIPT_TYPE_DYNAMIC + 1 ) 
    } 	PROFILER_SCRIPT_TYPE;

typedef /* [public] */ 
enum __MIDL___MIDL_itf_activprof_0000_0000_0002
    {	PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL	= 0x1,
	PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL	= 0x2,
	PROFILER_EVENT_MASK_TRACE_ALL	= ( PROFILER_EVENT_MASK_TRACE_SCRIPT_FUNCTION_CALL | PROFILER_EVENT_MASK_TRACE_NATIVE_FUNCTION_CALL ) 
    } 	PROFILER_EVENT_MASK;

typedef LONG PROFILER_TOKEN;



extern RPC_IF_HANDLE __MIDL_itf_activprof_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_activprof_0000_0000_v0_0_s_ifspec;

#ifndef __IActiveScriptProfilerControl_INTERFACE_DEFINED__
#define __IActiveScriptProfilerControl_INTERFACE_DEFINED__

/* interface IActiveScriptProfilerControl */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IActiveScriptProfilerControl;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("784b5ff0-69b0-47d1-a7dc-2518f4230e90")
    IActiveScriptProfilerControl : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE StartProfiling( 
            /* [in] */ __RPC__in REFCLSID clsidProfilerObject,
            /* [in] */ DWORD dwEventMask,
            /* [in] */ DWORD dwContext) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetProfilerEventMask( 
            /* [in] */ DWORD dwEventMask) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE StopProfiling( 
            /* [in] */ HRESULT hrShutdownReason) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IActiveScriptProfilerControlVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IActiveScriptProfilerControl * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IActiveScriptProfilerControl * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IActiveScriptProfilerControl * This);
        
        HRESULT ( STDMETHODCALLTYPE *StartProfiling )( 
            __RPC__in IActiveScriptProfilerControl * This,
            /* [in] */ __RPC__in REFCLSID clsidProfilerObject,
            /* [in] */ DWORD dwEventMask,
            /* [in] */ DWORD dwContext);
        
        HRESULT ( STDMETHODCALLTYPE *SetProfilerEventMask )( 
            __RPC__in IActiveScriptProfilerControl * This,
            /* [in] */ DWORD dwEventMask);
        
        HRESULT ( STDMETHODCALLTYPE *StopProfiling )( 
            __RPC__in IActiveScriptProfilerControl * This,
            /* [in] */ HRESULT hrShutdownReason);
        
        END_INTERFACE
    } IActiveScriptProfilerControlVtbl;

    interface IActiveScriptProfilerControl
    {
        CONST_VTBL struct IActiveScriptProfilerControlVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IActiveScriptProfilerControl_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IActiveScriptProfilerControl_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IActiveScriptProfilerControl_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IActiveScriptProfilerControl_StartProfiling(This,clsidProfilerObject,dwEventMask,dwContext)	\
    ( (This)->lpVtbl -> StartProfiling(This,clsidProfilerObject,dwEventMask,dwContext) ) 

#define IActiveScriptProfilerControl_SetProfilerEventMask(This,dwEventMask)	\
    ( (This)->lpVtbl -> SetProfilerEventMask(This,dwEventMask) ) 

#define IActiveScriptProfilerControl_StopProfiling(This,hrShutdownReason)	\
    ( (This)->lpVtbl -> StopProfiling(This,hrShutdownReason) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IActiveScriptProfilerControl_INTERFACE_DEFINED__ */


#ifndef __IActiveScriptProfilerCallback_INTERFACE_DEFINED__
#define __IActiveScriptProfilerCallback_INTERFACE_DEFINED__

/* interface IActiveScriptProfilerCallback */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IActiveScriptProfilerCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("740eca23-7d9d-42e5-ba9d-f8b24b1c7a9b")
    IActiveScriptProfilerCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Initialize( 
            /* [in] */ DWORD dwContext) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Shutdown( 
            /* [in] */ HRESULT hrReason) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ScriptCompiled( 
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [in] */ PROFILER_SCRIPT_TYPE type,
            /* [in] */ __RPC__in_opt IUnknown *pIDebugDocumentContext) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FunctionCompiled( 
            /* [in] */ PROFILER_TOKEN functionId,
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [string][in] */ __RPC__in_string const WCHAR *pwszFunctionName,
            /* [string][in] */ __RPC__in_string const WCHAR *pwszFunctionNameHint,
            /* [in] */ __RPC__in_opt IUnknown *pIDebugDocumentContext) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnFunctionEnter( 
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [in] */ PROFILER_TOKEN functionId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnFunctionExit( 
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [in] */ PROFILER_TOKEN functionId) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IActiveScriptProfilerCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IActiveScriptProfilerCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IActiveScriptProfilerCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ DWORD dwContext);
        
        HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ HRESULT hrReason);
        
        HRESULT ( STDMETHODCALLTYPE *ScriptCompiled )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [in] */ PROFILER_SCRIPT_TYPE type,
            /* [in] */ __RPC__in_opt IUnknown *pIDebugDocumentContext);
        
        HRESULT ( STDMETHODCALLTYPE *FunctionCompiled )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ PROFILER_TOKEN functionId,
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [string][in] */ __RPC__in_string const WCHAR *pwszFunctionName,
            /* [string][in] */ __RPC__in_string const WCHAR *pwszFunctionNameHint,
            /* [in] */ __RPC__in_opt IUnknown *pIDebugDocumentContext);
        
        HRESULT ( STDMETHODCALLTYPE *OnFunctionEnter )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [in] */ PROFILER_TOKEN functionId);
        
        HRESULT ( STDMETHODCALLTYPE *OnFunctionExit )( 
            __RPC__in IActiveScriptProfilerCallback * This,
            /* [in] */ PROFILER_TOKEN scriptId,
            /* [in] */ PROFILER_TOKEN functionId);
        
        END_INTERFACE
    } IActiveScriptProfilerCallbackVtbl;

    interface IActiveScriptProfilerCallback
    {
        CONST_VTBL struct IActiveScriptProfilerCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IActiveScriptProfilerCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IActiveScriptProfilerCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IActiveScriptProfilerCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IActiveScriptProfilerCallback_Initialize(This,dwContext)	\
    ( (This)->lpVtbl -> Initialize(This,dwContext) ) 

#define IActiveScriptProfilerCallback_Shutdown(This,hrReason)	\
    ( (This)->lpVtbl -> Shutdown(This,hrReason) ) 

#define IActiveScriptProfilerCallback_ScriptCompiled(This,scriptId,type,pIDebugDocumentContext)	\
    ( (This)->lpVtbl -> ScriptCompiled(This,scriptId,type,pIDebugDocumentContext) ) 

#define IActiveScriptProfilerCallback_FunctionCompiled(This,functionId,scriptId,pwszFunctionName,pwszFunctionNameHint,pIDebugDocumentContext)	\
    ( (This)->lpVtbl -> FunctionCompiled(This,functionId,scriptId,pwszFunctionName,pwszFunctionNameHint,pIDebugDocumentContext) ) 

#define IActiveScriptProfilerCallback_OnFunctionEnter(This,scriptId,functionId)	\
    ( (This)->lpVtbl -> OnFunctionEnter(This,scriptId,functionId) ) 

#define IActiveScriptProfilerCallback_OnFunctionExit(This,scriptId,functionId)	\
    ( (This)->lpVtbl -> OnFunctionExit(This,scriptId,functionId) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IActiveScriptProfilerCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_activprof_0000_0002 */
/* [local] */ 


#endif  // __ActivProf_h



extern RPC_IF_HANDLE __MIDL_itf_activprof_0000_0002_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_activprof_0000_0002_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



