

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for sbtsv.idl:
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

#ifndef __sbtsv_h__
#define __sbtsv_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ITsSbPlugin_FWD_DEFINED__
#define __ITsSbPlugin_FWD_DEFINED__
typedef interface ITsSbPlugin ITsSbPlugin;
#endif 	/* __ITsSbPlugin_FWD_DEFINED__ */


#ifndef __ITsSbResourcePlugin_FWD_DEFINED__
#define __ITsSbResourcePlugin_FWD_DEFINED__
typedef interface ITsSbResourcePlugin ITsSbResourcePlugin;
#endif 	/* __ITsSbResourcePlugin_FWD_DEFINED__ */


#ifndef __ITsSbLoadBalancing_FWD_DEFINED__
#define __ITsSbLoadBalancing_FWD_DEFINED__
typedef interface ITsSbLoadBalancing ITsSbLoadBalancing;
#endif 	/* __ITsSbLoadBalancing_FWD_DEFINED__ */


#ifndef __ITsSbPlacement_FWD_DEFINED__
#define __ITsSbPlacement_FWD_DEFINED__
typedef interface ITsSbPlacement ITsSbPlacement;
#endif 	/* __ITsSbPlacement_FWD_DEFINED__ */


#ifndef __ITsSbOrchestration_FWD_DEFINED__
#define __ITsSbOrchestration_FWD_DEFINED__
typedef interface ITsSbOrchestration ITsSbOrchestration;
#endif 	/* __ITsSbOrchestration_FWD_DEFINED__ */


#ifndef __ITsSbEnvironment_FWD_DEFINED__
#define __ITsSbEnvironment_FWD_DEFINED__
typedef interface ITsSbEnvironment ITsSbEnvironment;
#endif 	/* __ITsSbEnvironment_FWD_DEFINED__ */


#ifndef __ITsSbLoadBalanceResult_FWD_DEFINED__
#define __ITsSbLoadBalanceResult_FWD_DEFINED__
typedef interface ITsSbLoadBalanceResult ITsSbLoadBalanceResult;
#endif 	/* __ITsSbLoadBalanceResult_FWD_DEFINED__ */


#ifndef __ITsSbTarget_FWD_DEFINED__
#define __ITsSbTarget_FWD_DEFINED__
typedef interface ITsSbTarget ITsSbTarget;
#endif 	/* __ITsSbTarget_FWD_DEFINED__ */


#ifndef __ITsSbSession_FWD_DEFINED__
#define __ITsSbSession_FWD_DEFINED__
typedef interface ITsSbSession ITsSbSession;
#endif 	/* __ITsSbSession_FWD_DEFINED__ */


#ifndef __ITsSbResourceNotification_FWD_DEFINED__
#define __ITsSbResourceNotification_FWD_DEFINED__
typedef interface ITsSbResourceNotification ITsSbResourceNotification;
#endif 	/* __ITsSbResourceNotification_FWD_DEFINED__ */


#ifndef __ITsSbPropertySet_FWD_DEFINED__
#define __ITsSbPropertySet_FWD_DEFINED__
typedef interface ITsSbPropertySet ITsSbPropertySet;
#endif 	/* __ITsSbPropertySet_FWD_DEFINED__ */


#ifndef __ITsSbPluginPropertySet_FWD_DEFINED__
#define __ITsSbPluginPropertySet_FWD_DEFINED__
typedef interface ITsSbPluginPropertySet ITsSbPluginPropertySet;
#endif 	/* __ITsSbPluginPropertySet_FWD_DEFINED__ */


#ifndef __ITsSbClientConnectionPropertySet_FWD_DEFINED__
#define __ITsSbClientConnectionPropertySet_FWD_DEFINED__
typedef interface ITsSbClientConnectionPropertySet ITsSbClientConnectionPropertySet;
#endif 	/* __ITsSbClientConnectionPropertySet_FWD_DEFINED__ */


#ifndef __ITsSbTargetPropertySet_FWD_DEFINED__
#define __ITsSbTargetPropertySet_FWD_DEFINED__
typedef interface ITsSbTargetPropertySet ITsSbTargetPropertySet;
#endif 	/* __ITsSbTargetPropertySet_FWD_DEFINED__ */


#ifndef __ITsSbEnvironmentPropertySet_FWD_DEFINED__
#define __ITsSbEnvironmentPropertySet_FWD_DEFINED__
typedef interface ITsSbEnvironmentPropertySet ITsSbEnvironmentPropertySet;
#endif 	/* __ITsSbEnvironmentPropertySet_FWD_DEFINED__ */


#ifndef __ITsSbBaseNotifySink_FWD_DEFINED__
#define __ITsSbBaseNotifySink_FWD_DEFINED__
typedef interface ITsSbBaseNotifySink ITsSbBaseNotifySink;
#endif 	/* __ITsSbBaseNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbPluginNotifySink_FWD_DEFINED__
#define __ITsSbPluginNotifySink_FWD_DEFINED__
typedef interface ITsSbPluginNotifySink ITsSbPluginNotifySink;
#endif 	/* __ITsSbPluginNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbTargetNotifySink_FWD_DEFINED__
#define __ITsSbTargetNotifySink_FWD_DEFINED__
typedef interface ITsSbTargetNotifySink ITsSbTargetNotifySink;
#endif 	/* __ITsSbTargetNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbSessionNotifySink_FWD_DEFINED__
#define __ITsSbSessionNotifySink_FWD_DEFINED__
typedef interface ITsSbSessionNotifySink ITsSbSessionNotifySink;
#endif 	/* __ITsSbSessionNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbLoadBalancingNotifySink_FWD_DEFINED__
#define __ITsSbLoadBalancingNotifySink_FWD_DEFINED__
typedef interface ITsSbLoadBalancingNotifySink ITsSbLoadBalancingNotifySink;
#endif 	/* __ITsSbLoadBalancingNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbPlacementNotifySink_FWD_DEFINED__
#define __ITsSbPlacementNotifySink_FWD_DEFINED__
typedef interface ITsSbPlacementNotifySink ITsSbPlacementNotifySink;
#endif 	/* __ITsSbPlacementNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbOrchestrationNotifySink_FWD_DEFINED__
#define __ITsSbOrchestrationNotifySink_FWD_DEFINED__
typedef interface ITsSbOrchestrationNotifySink ITsSbOrchestrationNotifySink;
#endif 	/* __ITsSbOrchestrationNotifySink_FWD_DEFINED__ */


#ifndef __ITsSbClientConnection_FWD_DEFINED__
#define __ITsSbClientConnection_FWD_DEFINED__
typedef interface ITsSbClientConnection ITsSbClientConnection;
#endif 	/* __ITsSbClientConnection_FWD_DEFINED__ */


#ifndef __ITsSbProvider_FWD_DEFINED__
#define __ITsSbProvider_FWD_DEFINED__
typedef interface ITsSbProvider ITsSbProvider;
#endif 	/* __ITsSbProvider_FWD_DEFINED__ */


#ifndef __ITsSbResourcePluginStore_FWD_DEFINED__
#define __ITsSbResourcePluginStore_FWD_DEFINED__
typedef interface ITsSbResourcePluginStore ITsSbResourcePluginStore;
#endif 	/* __ITsSbResourcePluginStore_FWD_DEFINED__ */


#ifndef __ITsSbGlobalStore_FWD_DEFINED__
#define __ITsSbGlobalStore_FWD_DEFINED__
typedef interface ITsSbGlobalStore ITsSbGlobalStore;
#endif 	/* __ITsSbGlobalStore_FWD_DEFINED__ */


/* header files for imported files */
#include "unknwn.h"
#include "oaidl.h"
#include "SessdirPublicTypes.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_sbtsv_0000_0000 */
/* [local] */ 

#pragma once




























extern RPC_IF_HANDLE __MIDL_itf_sbtsv_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_sbtsv_0000_0000_v0_0_s_ifspec;

#ifndef __ITsSbPlugin_INTERFACE_DEFINED__
#define __ITsSbPlugin_INTERFACE_DEFINED__

/* interface ITsSbPlugin */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbPlugin;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("48cd7406-caab-465f-a5d6-baa863b9ea4f")
    ITsSbPlugin : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Initialize( 
            /* [in] */ __RPC__in_opt ITsSbProvider *pProvider,
            /* [in] */ __RPC__in_opt ITsSbPluginNotifySink *pNotifySink,
            /* [in] */ __RPC__in_opt ITsSbPluginPropertySet *pPropertySet) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Terminate( 
            /* [in] */ HRESULT hr) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbPluginVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbPlugin * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbPlugin * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbPlugin * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in ITsSbPlugin * This,
            /* [in] */ __RPC__in_opt ITsSbProvider *pProvider,
            /* [in] */ __RPC__in_opt ITsSbPluginNotifySink *pNotifySink,
            /* [in] */ __RPC__in_opt ITsSbPluginPropertySet *pPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Terminate )( 
            __RPC__in ITsSbPlugin * This,
            /* [in] */ HRESULT hr);
        
        END_INTERFACE
    } ITsSbPluginVtbl;

    interface ITsSbPlugin
    {
        CONST_VTBL struct ITsSbPluginVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbPlugin_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbPlugin_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbPlugin_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbPlugin_Initialize(This,pProvider,pNotifySink,pPropertySet)	\
    ( (This)->lpVtbl -> Initialize(This,pProvider,pNotifySink,pPropertySet) ) 

#define ITsSbPlugin_Terminate(This,hr)	\
    ( (This)->lpVtbl -> Terminate(This,hr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbPlugin_INTERFACE_DEFINED__ */


#ifndef __ITsSbResourcePlugin_INTERFACE_DEFINED__
#define __ITsSbResourcePlugin_INTERFACE_DEFINED__

/* interface ITsSbResourcePlugin */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbResourcePlugin;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("7633f4e7-8a10-49a1-8413-e4783001b70e")
    ITsSbResourcePlugin : public ITsSbPlugin
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Refresh( 
            /* [in] */ DWORD dwFlags,
            /* [in] */ __RPC__in BSTR pEnvBindingStr) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbResourcePluginVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbResourcePlugin * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbResourcePlugin * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbResourcePlugin * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in ITsSbResourcePlugin * This,
            /* [in] */ __RPC__in_opt ITsSbProvider *pProvider,
            /* [in] */ __RPC__in_opt ITsSbPluginNotifySink *pNotifySink,
            /* [in] */ __RPC__in_opt ITsSbPluginPropertySet *pPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Terminate )( 
            __RPC__in ITsSbResourcePlugin * This,
            /* [in] */ HRESULT hr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Refresh )( 
            __RPC__in ITsSbResourcePlugin * This,
            /* [in] */ DWORD dwFlags,
            /* [in] */ __RPC__in BSTR pEnvBindingStr);
        
        END_INTERFACE
    } ITsSbResourcePluginVtbl;

    interface ITsSbResourcePlugin
    {
        CONST_VTBL struct ITsSbResourcePluginVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbResourcePlugin_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbResourcePlugin_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbResourcePlugin_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbResourcePlugin_Initialize(This,pProvider,pNotifySink,pPropertySet)	\
    ( (This)->lpVtbl -> Initialize(This,pProvider,pNotifySink,pPropertySet) ) 

#define ITsSbResourcePlugin_Terminate(This,hr)	\
    ( (This)->lpVtbl -> Terminate(This,hr) ) 


#define ITsSbResourcePlugin_Refresh(This,dwFlags,pEnvBindingStr)	\
    ( (This)->lpVtbl -> Refresh(This,dwFlags,pEnvBindingStr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbResourcePlugin_INTERFACE_DEFINED__ */


#ifndef __ITsSbLoadBalancing_INTERFACE_DEFINED__
#define __ITsSbLoadBalancing_INTERFACE_DEFINED__

/* interface ITsSbLoadBalancing */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbLoadBalancing;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("24329274-9EB7-11DC-AE98-F2B456D89593")
    ITsSbLoadBalancing : public ITsSbPlugin
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetMostSuitableTarget( 
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbLoadBalancingNotifySink *pLBSink) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbLoadBalancingVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbLoadBalancing * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbLoadBalancing * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbLoadBalancing * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in ITsSbLoadBalancing * This,
            /* [in] */ __RPC__in_opt ITsSbProvider *pProvider,
            /* [in] */ __RPC__in_opt ITsSbPluginNotifySink *pNotifySink,
            /* [in] */ __RPC__in_opt ITsSbPluginPropertySet *pPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Terminate )( 
            __RPC__in ITsSbLoadBalancing * This,
            /* [in] */ HRESULT hr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetMostSuitableTarget )( 
            __RPC__in ITsSbLoadBalancing * This,
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbLoadBalancingNotifySink *pLBSink);
        
        END_INTERFACE
    } ITsSbLoadBalancingVtbl;

    interface ITsSbLoadBalancing
    {
        CONST_VTBL struct ITsSbLoadBalancingVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbLoadBalancing_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbLoadBalancing_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbLoadBalancing_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbLoadBalancing_Initialize(This,pProvider,pNotifySink,pPropertySet)	\
    ( (This)->lpVtbl -> Initialize(This,pProvider,pNotifySink,pPropertySet) ) 

#define ITsSbLoadBalancing_Terminate(This,hr)	\
    ( (This)->lpVtbl -> Terminate(This,hr) ) 


#define ITsSbLoadBalancing_GetMostSuitableTarget(This,pConnection,pLBSink)	\
    ( (This)->lpVtbl -> GetMostSuitableTarget(This,pConnection,pLBSink) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbLoadBalancing_INTERFACE_DEFINED__ */


#ifndef __ITsSbPlacement_INTERFACE_DEFINED__
#define __ITsSbPlacement_INTERFACE_DEFINED__

/* interface ITsSbPlacement */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbPlacement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B937A478-9EB6-11DC-8377-D5B056D89593")
    ITsSbPlacement : public ITsSbPlugin
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueryEnvironmentForTarget( 
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbPlacementNotifySink *pPlacementSink) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateEnvironmentForTarget( 
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbPlacementNotifySink *pPlacementSink) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbPlacementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbPlacement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbPlacement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbPlacement * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in ITsSbPlacement * This,
            /* [in] */ __RPC__in_opt ITsSbProvider *pProvider,
            /* [in] */ __RPC__in_opt ITsSbPluginNotifySink *pNotifySink,
            /* [in] */ __RPC__in_opt ITsSbPluginPropertySet *pPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Terminate )( 
            __RPC__in ITsSbPlacement * This,
            /* [in] */ HRESULT hr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QueryEnvironmentForTarget )( 
            __RPC__in ITsSbPlacement * This,
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbPlacementNotifySink *pPlacementSink);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateEnvironmentForTarget )( 
            __RPC__in ITsSbPlacement * This,
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbPlacementNotifySink *pPlacementSink);
        
        END_INTERFACE
    } ITsSbPlacementVtbl;

    interface ITsSbPlacement
    {
        CONST_VTBL struct ITsSbPlacementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbPlacement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbPlacement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbPlacement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbPlacement_Initialize(This,pProvider,pNotifySink,pPropertySet)	\
    ( (This)->lpVtbl -> Initialize(This,pProvider,pNotifySink,pPropertySet) ) 

#define ITsSbPlacement_Terminate(This,hr)	\
    ( (This)->lpVtbl -> Terminate(This,hr) ) 


#define ITsSbPlacement_QueryEnvironmentForTarget(This,pConnection,pPlacementSink)	\
    ( (This)->lpVtbl -> QueryEnvironmentForTarget(This,pConnection,pPlacementSink) ) 

#define ITsSbPlacement_CreateEnvironmentForTarget(This,pConnection,pPlacementSink)	\
    ( (This)->lpVtbl -> CreateEnvironmentForTarget(This,pConnection,pPlacementSink) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbPlacement_INTERFACE_DEFINED__ */


#ifndef __ITsSbOrchestration_INTERFACE_DEFINED__
#define __ITsSbOrchestration_INTERFACE_DEFINED__

/* interface ITsSbOrchestration */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbOrchestration;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("64FC1172-9EB7-11DC-8B00-3ABA56D89593")
    ITsSbOrchestration : public ITsSbPlugin
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE PrepareTargetForConnect( 
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbOrchestrationNotifySink *pOrchestrationNotifySink) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbOrchestrationVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbOrchestration * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbOrchestration * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbOrchestration * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            __RPC__in ITsSbOrchestration * This,
            /* [in] */ __RPC__in_opt ITsSbProvider *pProvider,
            /* [in] */ __RPC__in_opt ITsSbPluginNotifySink *pNotifySink,
            /* [in] */ __RPC__in_opt ITsSbPluginPropertySet *pPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Terminate )( 
            __RPC__in ITsSbOrchestration * This,
            /* [in] */ HRESULT hr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *PrepareTargetForConnect )( 
            __RPC__in ITsSbOrchestration * This,
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection,
            /* [in] */ __RPC__in_opt ITsSbOrchestrationNotifySink *pOrchestrationNotifySink);
        
        END_INTERFACE
    } ITsSbOrchestrationVtbl;

    interface ITsSbOrchestration
    {
        CONST_VTBL struct ITsSbOrchestrationVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbOrchestration_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbOrchestration_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbOrchestration_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbOrchestration_Initialize(This,pProvider,pNotifySink,pPropertySet)	\
    ( (This)->lpVtbl -> Initialize(This,pProvider,pNotifySink,pPropertySet) ) 

#define ITsSbOrchestration_Terminate(This,hr)	\
    ( (This)->lpVtbl -> Terminate(This,hr) ) 


#define ITsSbOrchestration_PrepareTargetForConnect(This,pConnection,pOrchestrationNotifySink)	\
    ( (This)->lpVtbl -> PrepareTargetForConnect(This,pConnection,pOrchestrationNotifySink) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbOrchestration_INTERFACE_DEFINED__ */


#ifndef __ITsSbEnvironment_INTERFACE_DEFINED__
#define __ITsSbEnvironment_INTERFACE_DEFINED__

/* interface ITsSbEnvironment */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbEnvironment;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8c87f7f7-bf51-4a5c-87bf-8e94fb6e2256")
    ITsSbEnvironment : public IUnknown
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ServerWeight( 
            /* [retval][out] */ __RPC__out DWORD *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_EnvironmentPropertySet( 
            /* [retval][out] */ __RPC__deref_out_opt ITsSbEnvironmentPropertySet **ppPropertySet) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_EnvironmentPropertySet( 
            /* [in] */ __RPC__in_opt ITsSbEnvironmentPropertySet *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbEnvironmentVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbEnvironment * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbEnvironment * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbEnvironment * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            __RPC__in ITsSbEnvironment * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServerWeight )( 
            __RPC__in ITsSbEnvironment * This,
            /* [retval][out] */ __RPC__out DWORD *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EnvironmentPropertySet )( 
            __RPC__in ITsSbEnvironment * This,
            /* [retval][out] */ __RPC__deref_out_opt ITsSbEnvironmentPropertySet **ppPropertySet);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_EnvironmentPropertySet )( 
            __RPC__in ITsSbEnvironment * This,
            /* [in] */ __RPC__in_opt ITsSbEnvironmentPropertySet *pVal);
        
        END_INTERFACE
    } ITsSbEnvironmentVtbl;

    interface ITsSbEnvironment
    {
        CONST_VTBL struct ITsSbEnvironmentVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbEnvironment_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbEnvironment_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbEnvironment_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbEnvironment_get_Name(This,pVal)	\
    ( (This)->lpVtbl -> get_Name(This,pVal) ) 

#define ITsSbEnvironment_get_ServerWeight(This,pVal)	\
    ( (This)->lpVtbl -> get_ServerWeight(This,pVal) ) 

#define ITsSbEnvironment_get_EnvironmentPropertySet(This,ppPropertySet)	\
    ( (This)->lpVtbl -> get_EnvironmentPropertySet(This,ppPropertySet) ) 

#define ITsSbEnvironment_put_EnvironmentPropertySet(This,pVal)	\
    ( (This)->lpVtbl -> put_EnvironmentPropertySet(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbEnvironment_INTERFACE_DEFINED__ */


#ifndef __ITsSbLoadBalanceResult_INTERFACE_DEFINED__
#define __ITsSbLoadBalanceResult_INTERFACE_DEFINED__

/* interface ITsSbLoadBalanceResult */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbLoadBalanceResult;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("24FDB7AC-FEA6-11DC-9672-9A8956D89593")
    ITsSbLoadBalanceResult : public IUnknown
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbLoadBalanceResultVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbLoadBalanceResult * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbLoadBalanceResult * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbLoadBalanceResult * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetName )( 
            __RPC__in ITsSbLoadBalanceResult * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        END_INTERFACE
    } ITsSbLoadBalanceResultVtbl;

    interface ITsSbLoadBalanceResult
    {
        CONST_VTBL struct ITsSbLoadBalanceResultVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbLoadBalanceResult_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbLoadBalanceResult_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbLoadBalanceResult_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbLoadBalanceResult_get_TargetName(This,pVal)	\
    ( (This)->lpVtbl -> get_TargetName(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbLoadBalanceResult_INTERFACE_DEFINED__ */


#ifndef __ITsSbTarget_INTERFACE_DEFINED__
#define __ITsSbTarget_INTERFACE_DEFINED__

/* interface ITsSbTarget */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbTarget;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("e85e10ea-db0b-4752-b456-5fd5840901c0")
    ITsSbTarget : public IUnknown
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_FarmName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_FarmName( 
            /* [in] */ __RPC__in BSTR Val) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetFQDN( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *TargetFqdnName) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetFQDN( 
            /* [in] */ __RPC__in BSTR Val) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetNetbios( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *TargetNetbiosName) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetNetbios( 
            /* [in] */ __RPC__in BSTR Val) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetExternalIpAddresses( 
            /* [size_is][out] */ __RPC__out_ecount_full(*numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [out][in] */ __RPC__inout DWORD *numAddresses) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetExternalIpAddresses( 
            /* [size_is][in] */ __RPC__in_ecount_full(numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [in] */ DWORD numAddresses) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetInternalIpAddresses( 
            /* [size_is][out] */ __RPC__out_ecount_full(*numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [out][in] */ __RPC__inout DWORD *numAddresses) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetInternalIpAddresses( 
            /* [size_is][in] */ __RPC__in_ecount_full(numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [in] */ DWORD numAddresses) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetState( 
            /* [retval][out] */ __RPC__out TARGET_STATE *pState) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetState( 
            /* [in] */ TARGET_STATE State) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetPropertySet( 
            /* [retval][out] */ __RPC__deref_out_opt ITsSbTargetPropertySet **ppPropertySet) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_TargetPropertySet( 
            /* [in] */ __RPC__in_opt ITsSbTargetPropertySet *pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbTargetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbTarget * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbTarget * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbTarget * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetName )( 
            __RPC__in ITsSbTarget * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FarmName )( 
            __RPC__in ITsSbTarget * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_FarmName )( 
            __RPC__in ITsSbTarget * This,
            /* [in] */ __RPC__in BSTR Val);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetFQDN )( 
            __RPC__in ITsSbTarget * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *TargetFqdnName);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TargetFQDN )( 
            __RPC__in ITsSbTarget * This,
            /* [in] */ __RPC__in BSTR Val);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetNetbios )( 
            __RPC__in ITsSbTarget * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *TargetNetbiosName);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TargetNetbios )( 
            __RPC__in ITsSbTarget * This,
            /* [in] */ __RPC__in BSTR Val);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetExternalIpAddresses )( 
            __RPC__in ITsSbTarget * This,
            /* [size_is][out] */ __RPC__out_ecount_full(*numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [out][in] */ __RPC__inout DWORD *numAddresses);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TargetExternalIpAddresses )( 
            __RPC__in ITsSbTarget * This,
            /* [size_is][in] */ __RPC__in_ecount_full(numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [in] */ DWORD numAddresses);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetInternalIpAddresses )( 
            __RPC__in ITsSbTarget * This,
            /* [size_is][out] */ __RPC__out_ecount_full(*numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [out][in] */ __RPC__inout DWORD *numAddresses);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TargetInternalIpAddresses )( 
            __RPC__in ITsSbTarget * This,
            /* [size_is][in] */ __RPC__in_ecount_full(numAddresses) TSSD_ConnectionPoint *sockaddr,
            /* [in] */ DWORD numAddresses);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetState )( 
            __RPC__in ITsSbTarget * This,
            /* [retval][out] */ __RPC__out TARGET_STATE *pState);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TargetState )( 
            __RPC__in ITsSbTarget * This,
            /* [in] */ TARGET_STATE State);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetPropertySet )( 
            __RPC__in ITsSbTarget * This,
            /* [retval][out] */ __RPC__deref_out_opt ITsSbTargetPropertySet **ppPropertySet);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_TargetPropertySet )( 
            __RPC__in ITsSbTarget * This,
            /* [in] */ __RPC__in_opt ITsSbTargetPropertySet *pVal);
        
        END_INTERFACE
    } ITsSbTargetVtbl;

    interface ITsSbTarget
    {
        CONST_VTBL struct ITsSbTargetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbTarget_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbTarget_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbTarget_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbTarget_get_TargetName(This,pVal)	\
    ( (This)->lpVtbl -> get_TargetName(This,pVal) ) 

#define ITsSbTarget_get_FarmName(This,pVal)	\
    ( (This)->lpVtbl -> get_FarmName(This,pVal) ) 

#define ITsSbTarget_put_FarmName(This,Val)	\
    ( (This)->lpVtbl -> put_FarmName(This,Val) ) 

#define ITsSbTarget_get_TargetFQDN(This,TargetFqdnName)	\
    ( (This)->lpVtbl -> get_TargetFQDN(This,TargetFqdnName) ) 

#define ITsSbTarget_put_TargetFQDN(This,Val)	\
    ( (This)->lpVtbl -> put_TargetFQDN(This,Val) ) 

#define ITsSbTarget_get_TargetNetbios(This,TargetNetbiosName)	\
    ( (This)->lpVtbl -> get_TargetNetbios(This,TargetNetbiosName) ) 

#define ITsSbTarget_put_TargetNetbios(This,Val)	\
    ( (This)->lpVtbl -> put_TargetNetbios(This,Val) ) 

#define ITsSbTarget_get_TargetExternalIpAddresses(This,sockaddr,numAddresses)	\
    ( (This)->lpVtbl -> get_TargetExternalIpAddresses(This,sockaddr,numAddresses) ) 

#define ITsSbTarget_put_TargetExternalIpAddresses(This,sockaddr,numAddresses)	\
    ( (This)->lpVtbl -> put_TargetExternalIpAddresses(This,sockaddr,numAddresses) ) 

#define ITsSbTarget_get_TargetInternalIpAddresses(This,sockaddr,numAddresses)	\
    ( (This)->lpVtbl -> get_TargetInternalIpAddresses(This,sockaddr,numAddresses) ) 

#define ITsSbTarget_put_TargetInternalIpAddresses(This,sockaddr,numAddresses)	\
    ( (This)->lpVtbl -> put_TargetInternalIpAddresses(This,sockaddr,numAddresses) ) 

#define ITsSbTarget_get_TargetState(This,pState)	\
    ( (This)->lpVtbl -> get_TargetState(This,pState) ) 

#define ITsSbTarget_put_TargetState(This,State)	\
    ( (This)->lpVtbl -> put_TargetState(This,State) ) 

#define ITsSbTarget_get_TargetPropertySet(This,ppPropertySet)	\
    ( (This)->lpVtbl -> get_TargetPropertySet(This,ppPropertySet) ) 

#define ITsSbTarget_put_TargetPropertySet(This,pVal)	\
    ( (This)->lpVtbl -> put_TargetPropertySet(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbTarget_INTERFACE_DEFINED__ */


#ifndef __ITsSbSession_INTERFACE_DEFINED__
#define __ITsSbSession_INTERFACE_DEFINED__

/* interface ITsSbSession */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbSession;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1ef3d5cf-8fbb-4a5a-ab4a-7f85b218bd8d")
    ITsSbSession : public IUnknown
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SessionId( 
            /* [retval][out] */ __RPC__out DWORD *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *targetName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Username( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *userName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Domain( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *domain) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_State( 
            /* [retval][out] */ __RPC__out TSSESSION_STATE *pState) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_State( 
            /* [in] */ TSSESSION_STATE State) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CreateTime( 
            /* [retval][out] */ __RPC__out FILETIME *pTime) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_CreateTime( 
            /* [in] */ FILETIME Time) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DisconnectTime( 
            /* [retval][out] */ __RPC__out FILETIME *pTime) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_DisconnectTime( 
            /* [in] */ FILETIME Time) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InitialProgram( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *app) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_InitialProgram( 
            /* [in] */ __RPC__in BSTR Application) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ClientDisplay( 
            /* [retval][out] */ __RPC__out CLIENT_DISPLAY *pClientDisplay) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ClientDisplay( 
            /* [in] */ CLIENT_DISPLAY pClientDisplay) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ProtocolType( 
            /* [retval][out] */ __RPC__out DWORD *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_ProtocolType( 
            /* [in] */ DWORD Val) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbSessionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbSession * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbSession * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SessionId )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__out DWORD *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetName )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *targetName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Username )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *userName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Domain )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *domain);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_State )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__out TSSESSION_STATE *pState);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_State )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ TSSESSION_STATE State);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CreateTime )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__out FILETIME *pTime);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_CreateTime )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ FILETIME Time);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DisconnectTime )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__out FILETIME *pTime);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DisconnectTime )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ FILETIME Time);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_InitialProgram )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *app);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_InitialProgram )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ __RPC__in BSTR Application);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ClientDisplay )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__out CLIENT_DISPLAY *pClientDisplay);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ClientDisplay )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ CLIENT_DISPLAY pClientDisplay);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProtocolType )( 
            __RPC__in ITsSbSession * This,
            /* [retval][out] */ __RPC__out DWORD *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ProtocolType )( 
            __RPC__in ITsSbSession * This,
            /* [in] */ DWORD Val);
        
        END_INTERFACE
    } ITsSbSessionVtbl;

    interface ITsSbSession
    {
        CONST_VTBL struct ITsSbSessionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbSession_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbSession_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbSession_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbSession_get_SessionId(This,pVal)	\
    ( (This)->lpVtbl -> get_SessionId(This,pVal) ) 

#define ITsSbSession_get_TargetName(This,targetName)	\
    ( (This)->lpVtbl -> get_TargetName(This,targetName) ) 

#define ITsSbSession_get_Username(This,userName)	\
    ( (This)->lpVtbl -> get_Username(This,userName) ) 

#define ITsSbSession_get_Domain(This,domain)	\
    ( (This)->lpVtbl -> get_Domain(This,domain) ) 

#define ITsSbSession_get_State(This,pState)	\
    ( (This)->lpVtbl -> get_State(This,pState) ) 

#define ITsSbSession_put_State(This,State)	\
    ( (This)->lpVtbl -> put_State(This,State) ) 

#define ITsSbSession_get_CreateTime(This,pTime)	\
    ( (This)->lpVtbl -> get_CreateTime(This,pTime) ) 

#define ITsSbSession_put_CreateTime(This,Time)	\
    ( (This)->lpVtbl -> put_CreateTime(This,Time) ) 

#define ITsSbSession_get_DisconnectTime(This,pTime)	\
    ( (This)->lpVtbl -> get_DisconnectTime(This,pTime) ) 

#define ITsSbSession_put_DisconnectTime(This,Time)	\
    ( (This)->lpVtbl -> put_DisconnectTime(This,Time) ) 

#define ITsSbSession_get_InitialProgram(This,app)	\
    ( (This)->lpVtbl -> get_InitialProgram(This,app) ) 

#define ITsSbSession_put_InitialProgram(This,Application)	\
    ( (This)->lpVtbl -> put_InitialProgram(This,Application) ) 

#define ITsSbSession_get_ClientDisplay(This,pClientDisplay)	\
    ( (This)->lpVtbl -> get_ClientDisplay(This,pClientDisplay) ) 

#define ITsSbSession_put_ClientDisplay(This,pClientDisplay)	\
    ( (This)->lpVtbl -> put_ClientDisplay(This,pClientDisplay) ) 

#define ITsSbSession_get_ProtocolType(This,pVal)	\
    ( (This)->lpVtbl -> get_ProtocolType(This,pVal) ) 

#define ITsSbSession_put_ProtocolType(This,Val)	\
    ( (This)->lpVtbl -> put_ProtocolType(This,Val) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbSession_INTERFACE_DEFINED__ */


#ifndef __ITsSbResourceNotification_INTERFACE_DEFINED__
#define __ITsSbResourceNotification_INTERFACE_DEFINED__

/* interface ITsSbResourceNotification */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbResourceNotification;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("65D3E85A-C39B-11DC-B92D-3CD255D89593")
    ITsSbResourceNotification : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE NotifySessionChange( 
            /* [in] */ TSSESSION_STATE changeType,
            /* [in] */ __RPC__in_opt ITsSbSession *pSession) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE NotifyTargetChange( 
            /* [in] */ DWORD TargetChangeType,
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE NotifyClientConnectionStateChange( 
            /* [in] */ CONNECTION_CHANGE_NOTIFICATION ChangeType,
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbResourceNotificationVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbResourceNotification * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbResourceNotification * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbResourceNotification * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *NotifySessionChange )( 
            __RPC__in ITsSbResourceNotification * This,
            /* [in] */ TSSESSION_STATE changeType,
            /* [in] */ __RPC__in_opt ITsSbSession *pSession);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *NotifyTargetChange )( 
            __RPC__in ITsSbResourceNotification * This,
            /* [in] */ DWORD TargetChangeType,
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *NotifyClientConnectionStateChange )( 
            __RPC__in ITsSbResourceNotification * This,
            /* [in] */ CONNECTION_CHANGE_NOTIFICATION ChangeType,
            /* [in] */ __RPC__in_opt ITsSbClientConnection *pConnection);
        
        END_INTERFACE
    } ITsSbResourceNotificationVtbl;

    interface ITsSbResourceNotification
    {
        CONST_VTBL struct ITsSbResourceNotificationVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbResourceNotification_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbResourceNotification_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbResourceNotification_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbResourceNotification_NotifySessionChange(This,changeType,pSession)	\
    ( (This)->lpVtbl -> NotifySessionChange(This,changeType,pSession) ) 

#define ITsSbResourceNotification_NotifyTargetChange(This,TargetChangeType,pTarget)	\
    ( (This)->lpVtbl -> NotifyTargetChange(This,TargetChangeType,pTarget) ) 

#define ITsSbResourceNotification_NotifyClientConnectionStateChange(This,ChangeType,pConnection)	\
    ( (This)->lpVtbl -> NotifyClientConnectionStateChange(This,ChangeType,pConnection) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbResourceNotification_INTERFACE_DEFINED__ */


#ifndef __ITsSbPropertySet_INTERFACE_DEFINED__
#define __ITsSbPropertySet_INTERFACE_DEFINED__

/* interface ITsSbPropertySet */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbPropertySet;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5c025171-bb1e-4baf-a212-6d5e9774b33b")
    ITsSbPropertySet : public IPropertyBag
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITsSbPropertySetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbPropertySet * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbPropertySet * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbPropertySet * This);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Read )( 
            ITsSbPropertySet * This,
            /* [in] */ LPCOLESTR pszPropName,
            /* [out][in] */ VARIANT *pVar,
            /* [unique][in] */ IErrorLog *pErrorLog);
        
        HRESULT ( STDMETHODCALLTYPE *Write )( 
            __RPC__in ITsSbPropertySet * This,
            /* [in] */ __RPC__in LPCOLESTR pszPropName,
            /* [in] */ __RPC__in VARIANT *pVar);
        
        END_INTERFACE
    } ITsSbPropertySetVtbl;

    interface ITsSbPropertySet
    {
        CONST_VTBL struct ITsSbPropertySetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbPropertySet_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbPropertySet_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbPropertySet_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbPropertySet_Read(This,pszPropName,pVar,pErrorLog)	\
    ( (This)->lpVtbl -> Read(This,pszPropName,pVar,pErrorLog) ) 

#define ITsSbPropertySet_Write(This,pszPropName,pVar)	\
    ( (This)->lpVtbl -> Write(This,pszPropName,pVar) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbPropertySet_INTERFACE_DEFINED__ */


#ifndef __ITsSbPluginPropertySet_INTERFACE_DEFINED__
#define __ITsSbPluginPropertySet_INTERFACE_DEFINED__

/* interface ITsSbPluginPropertySet */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbPluginPropertySet;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("95006e34-7eff-4b6c-bb40-49a4fda7cea6")
    ITsSbPluginPropertySet : public ITsSbPropertySet
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITsSbPluginPropertySetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbPluginPropertySet * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbPluginPropertySet * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbPluginPropertySet * This);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Read )( 
            ITsSbPluginPropertySet * This,
            /* [in] */ LPCOLESTR pszPropName,
            /* [out][in] */ VARIANT *pVar,
            /* [unique][in] */ IErrorLog *pErrorLog);
        
        HRESULT ( STDMETHODCALLTYPE *Write )( 
            __RPC__in ITsSbPluginPropertySet * This,
            /* [in] */ __RPC__in LPCOLESTR pszPropName,
            /* [in] */ __RPC__in VARIANT *pVar);
        
        END_INTERFACE
    } ITsSbPluginPropertySetVtbl;

    interface ITsSbPluginPropertySet
    {
        CONST_VTBL struct ITsSbPluginPropertySetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbPluginPropertySet_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbPluginPropertySet_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbPluginPropertySet_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbPluginPropertySet_Read(This,pszPropName,pVar,pErrorLog)	\
    ( (This)->lpVtbl -> Read(This,pszPropName,pVar,pErrorLog) ) 

#define ITsSbPluginPropertySet_Write(This,pszPropName,pVar)	\
    ( (This)->lpVtbl -> Write(This,pszPropName,pVar) ) 



#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbPluginPropertySet_INTERFACE_DEFINED__ */


#ifndef __ITsSbClientConnectionPropertySet_INTERFACE_DEFINED__
#define __ITsSbClientConnectionPropertySet_INTERFACE_DEFINED__

/* interface ITsSbClientConnectionPropertySet */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbClientConnectionPropertySet;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("E51995B0-46D6-11DD-AA21-CEDC55D89593")
    ITsSbClientConnectionPropertySet : public ITsSbPropertySet
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITsSbClientConnectionPropertySetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbClientConnectionPropertySet * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbClientConnectionPropertySet * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbClientConnectionPropertySet * This);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Read )( 
            ITsSbClientConnectionPropertySet * This,
            /* [in] */ LPCOLESTR pszPropName,
            /* [out][in] */ VARIANT *pVar,
            /* [unique][in] */ IErrorLog *pErrorLog);
        
        HRESULT ( STDMETHODCALLTYPE *Write )( 
            __RPC__in ITsSbClientConnectionPropertySet * This,
            /* [in] */ __RPC__in LPCOLESTR pszPropName,
            /* [in] */ __RPC__in VARIANT *pVar);
        
        END_INTERFACE
    } ITsSbClientConnectionPropertySetVtbl;

    interface ITsSbClientConnectionPropertySet
    {
        CONST_VTBL struct ITsSbClientConnectionPropertySetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbClientConnectionPropertySet_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbClientConnectionPropertySet_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbClientConnectionPropertySet_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbClientConnectionPropertySet_Read(This,pszPropName,pVar,pErrorLog)	\
    ( (This)->lpVtbl -> Read(This,pszPropName,pVar,pErrorLog) ) 

#define ITsSbClientConnectionPropertySet_Write(This,pszPropName,pVar)	\
    ( (This)->lpVtbl -> Write(This,pszPropName,pVar) ) 



#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbClientConnectionPropertySet_INTERFACE_DEFINED__ */


#ifndef __ITsSbTargetPropertySet_INTERFACE_DEFINED__
#define __ITsSbTargetPropertySet_INTERFACE_DEFINED__

/* interface ITsSbTargetPropertySet */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbTargetPropertySet;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("f7bda5d6-994c-4e11-a079-2763b61830ac")
    ITsSbTargetPropertySet : public ITsSbPropertySet
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITsSbTargetPropertySetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbTargetPropertySet * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbTargetPropertySet * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbTargetPropertySet * This);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Read )( 
            ITsSbTargetPropertySet * This,
            /* [in] */ LPCOLESTR pszPropName,
            /* [out][in] */ VARIANT *pVar,
            /* [unique][in] */ IErrorLog *pErrorLog);
        
        HRESULT ( STDMETHODCALLTYPE *Write )( 
            __RPC__in ITsSbTargetPropertySet * This,
            /* [in] */ __RPC__in LPCOLESTR pszPropName,
            /* [in] */ __RPC__in VARIANT *pVar);
        
        END_INTERFACE
    } ITsSbTargetPropertySetVtbl;

    interface ITsSbTargetPropertySet
    {
        CONST_VTBL struct ITsSbTargetPropertySetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbTargetPropertySet_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbTargetPropertySet_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbTargetPropertySet_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbTargetPropertySet_Read(This,pszPropName,pVar,pErrorLog)	\
    ( (This)->lpVtbl -> Read(This,pszPropName,pVar,pErrorLog) ) 

#define ITsSbTargetPropertySet_Write(This,pszPropName,pVar)	\
    ( (This)->lpVtbl -> Write(This,pszPropName,pVar) ) 



#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbTargetPropertySet_INTERFACE_DEFINED__ */


#ifndef __ITsSbEnvironmentPropertySet_INTERFACE_DEFINED__
#define __ITsSbEnvironmentPropertySet_INTERFACE_DEFINED__

/* interface ITsSbEnvironmentPropertySet */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbEnvironmentPropertySet;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D0D1BF7E-7ACF-11DD-A243-E51156D89593")
    ITsSbEnvironmentPropertySet : public ITsSbPropertySet
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITsSbEnvironmentPropertySetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbEnvironmentPropertySet * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbEnvironmentPropertySet * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbEnvironmentPropertySet * This);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Read )( 
            ITsSbEnvironmentPropertySet * This,
            /* [in] */ LPCOLESTR pszPropName,
            /* [out][in] */ VARIANT *pVar,
            /* [unique][in] */ IErrorLog *pErrorLog);
        
        HRESULT ( STDMETHODCALLTYPE *Write )( 
            __RPC__in ITsSbEnvironmentPropertySet * This,
            /* [in] */ __RPC__in LPCOLESTR pszPropName,
            /* [in] */ __RPC__in VARIANT *pVar);
        
        END_INTERFACE
    } ITsSbEnvironmentPropertySetVtbl;

    interface ITsSbEnvironmentPropertySet
    {
        CONST_VTBL struct ITsSbEnvironmentPropertySetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbEnvironmentPropertySet_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbEnvironmentPropertySet_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbEnvironmentPropertySet_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbEnvironmentPropertySet_Read(This,pszPropName,pVar,pErrorLog)	\
    ( (This)->lpVtbl -> Read(This,pszPropName,pVar,pErrorLog) ) 

#define ITsSbEnvironmentPropertySet_Write(This,pszPropName,pVar)	\
    ( (This)->lpVtbl -> Write(This,pszPropName,pVar) ) 



#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbEnvironmentPropertySet_INTERFACE_DEFINED__ */


#ifndef __ITsSbBaseNotifySink_INTERFACE_DEFINED__
#define __ITsSbBaseNotifySink_INTERFACE_DEFINED__

/* interface ITsSbBaseNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbBaseNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("808a6537-1282-4989-9e09-f43938b71722")
    ITsSbBaseNotifySink : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnError( 
            /* [in] */ HRESULT hrError) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnReportStatus( 
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbBaseNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbBaseNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbBaseNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbBaseNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbBaseNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbBaseNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        END_INTERFACE
    } ITsSbBaseNotifySinkVtbl;

    interface ITsSbBaseNotifySink
    {
        CONST_VTBL struct ITsSbBaseNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbBaseNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbBaseNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbBaseNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbBaseNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbBaseNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbBaseNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbPluginNotifySink_INTERFACE_DEFINED__
#define __ITsSbPluginNotifySink_INTERFACE_DEFINED__

/* interface ITsSbPluginNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbPluginNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("44dfe30b-c3be-40f5-bf82-7a95bb795adf")
    ITsSbPluginNotifySink : public ITsSbBaseNotifySink
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnInitialized( 
            /* [in] */ HRESULT hr) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnTerminated( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbPluginNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbPluginNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbPluginNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbPluginNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbPluginNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbPluginNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnInitialized )( 
            __RPC__in ITsSbPluginNotifySink * This,
            /* [in] */ HRESULT hr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnTerminated )( 
            __RPC__in ITsSbPluginNotifySink * This);
        
        END_INTERFACE
    } ITsSbPluginNotifySinkVtbl;

    interface ITsSbPluginNotifySink
    {
        CONST_VTBL struct ITsSbPluginNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbPluginNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbPluginNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbPluginNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbPluginNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbPluginNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 


#define ITsSbPluginNotifySink_OnInitialized(This,hr)	\
    ( (This)->lpVtbl -> OnInitialized(This,hr) ) 

#define ITsSbPluginNotifySink_OnTerminated(This)	\
    ( (This)->lpVtbl -> OnTerminated(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbPluginNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbTargetNotifySink_INTERFACE_DEFINED__
#define __ITsSbTargetNotifySink_INTERFACE_DEFINED__

/* interface ITsSbTargetNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbTargetNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2be69924-ddf2-44b9-ab92-2c27aefb4379")
    ITsSbTargetNotifySink : public ITsSbBaseNotifySink
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnConfigChange( 
            /* [in] */ DWORD TargetConfigTypes) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnStateChange( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbTargetNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbTargetNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbTargetNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbTargetNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbTargetNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbTargetNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnConfigChange )( 
            __RPC__in ITsSbTargetNotifySink * This,
            /* [in] */ DWORD TargetConfigTypes);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnStateChange )( 
            __RPC__in ITsSbTargetNotifySink * This);
        
        END_INTERFACE
    } ITsSbTargetNotifySinkVtbl;

    interface ITsSbTargetNotifySink
    {
        CONST_VTBL struct ITsSbTargetNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbTargetNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbTargetNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbTargetNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbTargetNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbTargetNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 


#define ITsSbTargetNotifySink_OnConfigChange(This,TargetConfigTypes)	\
    ( (This)->lpVtbl -> OnConfigChange(This,TargetConfigTypes) ) 

#define ITsSbTargetNotifySink_OnStateChange(This)	\
    ( (This)->lpVtbl -> OnStateChange(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbTargetNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbSessionNotifySink_INTERFACE_DEFINED__
#define __ITsSbSessionNotifySink_INTERFACE_DEFINED__

/* interface ITsSbSessionNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbSessionNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("a821601f-d822-4fe2-a2a3-cd4b00652a1a")
    ITsSbSessionNotifySink : public ITsSbBaseNotifySink
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnStateChange( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbSessionNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbSessionNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbSessionNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbSessionNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbSessionNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbSessionNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnStateChange )( 
            __RPC__in ITsSbSessionNotifySink * This);
        
        END_INTERFACE
    } ITsSbSessionNotifySinkVtbl;

    interface ITsSbSessionNotifySink
    {
        CONST_VTBL struct ITsSbSessionNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbSessionNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbSessionNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbSessionNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbSessionNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbSessionNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 


#define ITsSbSessionNotifySink_OnStateChange(This)	\
    ( (This)->lpVtbl -> OnStateChange(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbSessionNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbLoadBalancingNotifySink_INTERFACE_DEFINED__
#define __ITsSbLoadBalancingNotifySink_INTERFACE_DEFINED__

/* interface ITsSbLoadBalancingNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbLoadBalancingNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("7f3fdb2f-c8dc-4873-a600-8580787baa64")
    ITsSbLoadBalancingNotifySink : public ITsSbBaseNotifySink
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnGetMostSuitableTarget( 
            /* [in] */ __RPC__in_opt ITsSbLoadBalanceResult *pLBResult) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbLoadBalancingNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbLoadBalancingNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbLoadBalancingNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbLoadBalancingNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbLoadBalancingNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbLoadBalancingNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnGetMostSuitableTarget )( 
            __RPC__in ITsSbLoadBalancingNotifySink * This,
            /* [in] */ __RPC__in_opt ITsSbLoadBalanceResult *pLBResult);
        
        END_INTERFACE
    } ITsSbLoadBalancingNotifySinkVtbl;

    interface ITsSbLoadBalancingNotifySink
    {
        CONST_VTBL struct ITsSbLoadBalancingNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbLoadBalancingNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbLoadBalancingNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbLoadBalancingNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbLoadBalancingNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbLoadBalancingNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 


#define ITsSbLoadBalancingNotifySink_OnGetMostSuitableTarget(This,pLBResult)	\
    ( (This)->lpVtbl -> OnGetMostSuitableTarget(This,pLBResult) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbLoadBalancingNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbPlacementNotifySink_INTERFACE_DEFINED__
#define __ITsSbPlacementNotifySink_INTERFACE_DEFINED__

/* interface ITsSbPlacementNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbPlacementNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3a2da1d1-1ad9-4248-ac21-13bbc273dd42")
    ITsSbPlacementNotifySink : public ITsSbBaseNotifySink
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnQueryEnvironmentCompleted( 
            /* [in] */ __RPC__in_opt ITsSbEnvironment *pEnvironment) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnEnvironmentReady( 
            /* [in] */ __RPC__in_opt ITsSbEnvironment *pEnvironment) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbPlacementNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbPlacementNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbPlacementNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbPlacementNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbPlacementNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbPlacementNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnQueryEnvironmentCompleted )( 
            __RPC__in ITsSbPlacementNotifySink * This,
            /* [in] */ __RPC__in_opt ITsSbEnvironment *pEnvironment);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnEnvironmentReady )( 
            __RPC__in ITsSbPlacementNotifySink * This,
            /* [in] */ __RPC__in_opt ITsSbEnvironment *pEnvironment);
        
        END_INTERFACE
    } ITsSbPlacementNotifySinkVtbl;

    interface ITsSbPlacementNotifySink
    {
        CONST_VTBL struct ITsSbPlacementNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbPlacementNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbPlacementNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbPlacementNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbPlacementNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbPlacementNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 


#define ITsSbPlacementNotifySink_OnQueryEnvironmentCompleted(This,pEnvironment)	\
    ( (This)->lpVtbl -> OnQueryEnvironmentCompleted(This,pEnvironment) ) 

#define ITsSbPlacementNotifySink_OnEnvironmentReady(This,pEnvironment)	\
    ( (This)->lpVtbl -> OnEnvironmentReady(This,pEnvironment) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbPlacementNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbOrchestrationNotifySink_INTERFACE_DEFINED__
#define __ITsSbOrchestrationNotifySink_INTERFACE_DEFINED__

/* interface ITsSbOrchestrationNotifySink */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbOrchestrationNotifySink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("36c37d61-926b-442f-bca5-118c6d50dcf2")
    ITsSbOrchestrationNotifySink : public ITsSbBaseNotifySink
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OnReadyToConnect( 
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbOrchestrationNotifySinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbOrchestrationNotifySink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbOrchestrationNotifySink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbOrchestrationNotifySink * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnError )( 
            __RPC__in ITsSbOrchestrationNotifySink * This,
            /* [in] */ HRESULT hrError);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReportStatus )( 
            __RPC__in ITsSbOrchestrationNotifySink * This,
            /* [in] */ CLIENT_MESSAGE_TYPE messageType,
            /* [in] */ DWORD messageID);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OnReadyToConnect )( 
            __RPC__in ITsSbOrchestrationNotifySink * This,
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget);
        
        END_INTERFACE
    } ITsSbOrchestrationNotifySinkVtbl;

    interface ITsSbOrchestrationNotifySink
    {
        CONST_VTBL struct ITsSbOrchestrationNotifySinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbOrchestrationNotifySink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbOrchestrationNotifySink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbOrchestrationNotifySink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbOrchestrationNotifySink_OnError(This,hrError)	\
    ( (This)->lpVtbl -> OnError(This,hrError) ) 

#define ITsSbOrchestrationNotifySink_OnReportStatus(This,messageType,messageID)	\
    ( (This)->lpVtbl -> OnReportStatus(This,messageType,messageID) ) 


#define ITsSbOrchestrationNotifySink_OnReadyToConnect(This,pTarget)	\
    ( (This)->lpVtbl -> OnReadyToConnect(This,pTarget) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbOrchestrationNotifySink_INTERFACE_DEFINED__ */


#ifndef __ITsSbClientConnection_INTERFACE_DEFINED__
#define __ITsSbClientConnection_INTERFACE_DEFINED__

/* interface ITsSbClientConnection */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbClientConnection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("da852238-59c8-481f-996b-301388d496d3")
    ITsSbClientConnection : public IUnknown
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_UserName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Domain( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InitialProgram( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_LoadBalanceResult( 
            /* [retval][out] */ __RPC__deref_out_opt ITsSbLoadBalanceResult **ppVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetType( 
            /* [retval][out] */ __RPC__out TARGET_TYPE *targetType) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_TargetName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][local] */ HRESULT STDMETHODCALLTYPE PutContext( 
            /* [annotation] */ 
            __in  BSTR contextId,
            /* [annotation] */ 
            __in  VARIANT context,
            /* [annotation] */ 
            __out_opt  VARIANT *existingContext) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetContext( 
            /* [in] */ __RPC__in BSTR contextId,
            /* [retval][out] */ __RPC__out VARIANT *context) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Environment( 
            /* [retval][out] */ __RPC__deref_out_opt ITsSbEnvironment **ppEnvironment) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDisconnectedSession( 
            /* [retval][out] */ __RPC__out BOOL *pIsDisconnectionSession) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ConnectionError( void) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_SamUserAccount( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ClientConnectionPropertySet( 
            /* [retval][out] */ __RPC__deref_out_opt ITsSbClientConnectionPropertySet **ppPropertySet) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbClientConnectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbClientConnection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbClientConnection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbClientConnection * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UserName )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Domain )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_InitialProgram )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LoadBalanceResult )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt ITsSbLoadBalanceResult **ppVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetType )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__out TARGET_TYPE *targetType);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TargetName )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][local] */ HRESULT ( STDMETHODCALLTYPE *PutContext )( 
            ITsSbClientConnection * This,
            /* [annotation] */ 
            __in  BSTR contextId,
            /* [annotation] */ 
            __in  VARIANT context,
            /* [annotation] */ 
            __out_opt  VARIANT *existingContext);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetContext )( 
            __RPC__in ITsSbClientConnection * This,
            /* [in] */ __RPC__in BSTR contextId,
            /* [retval][out] */ __RPC__out VARIANT *context);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Environment )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt ITsSbEnvironment **ppEnvironment);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDisconnectedSession )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__out BOOL *pIsDisconnectionSession);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ConnectionError )( 
            __RPC__in ITsSbClientConnection * This);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SamUserAccount )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ClientConnectionPropertySet )( 
            __RPC__in ITsSbClientConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt ITsSbClientConnectionPropertySet **ppPropertySet);
        
        END_INTERFACE
    } ITsSbClientConnectionVtbl;

    interface ITsSbClientConnection
    {
        CONST_VTBL struct ITsSbClientConnectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbClientConnection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbClientConnection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbClientConnection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbClientConnection_get_UserName(This,pVal)	\
    ( (This)->lpVtbl -> get_UserName(This,pVal) ) 

#define ITsSbClientConnection_get_Domain(This,pVal)	\
    ( (This)->lpVtbl -> get_Domain(This,pVal) ) 

#define ITsSbClientConnection_get_InitialProgram(This,pVal)	\
    ( (This)->lpVtbl -> get_InitialProgram(This,pVal) ) 

#define ITsSbClientConnection_get_LoadBalanceResult(This,ppVal)	\
    ( (This)->lpVtbl -> get_LoadBalanceResult(This,ppVal) ) 

#define ITsSbClientConnection_get_TargetType(This,targetType)	\
    ( (This)->lpVtbl -> get_TargetType(This,targetType) ) 

#define ITsSbClientConnection_get_TargetName(This,pVal)	\
    ( (This)->lpVtbl -> get_TargetName(This,pVal) ) 

#define ITsSbClientConnection_PutContext(This,contextId,context,existingContext)	\
    ( (This)->lpVtbl -> PutContext(This,contextId,context,existingContext) ) 

#define ITsSbClientConnection_GetContext(This,contextId,context)	\
    ( (This)->lpVtbl -> GetContext(This,contextId,context) ) 

#define ITsSbClientConnection_get_Environment(This,ppEnvironment)	\
    ( (This)->lpVtbl -> get_Environment(This,ppEnvironment) ) 

#define ITsSbClientConnection_get_IsDisconnectedSession(This,pIsDisconnectionSession)	\
    ( (This)->lpVtbl -> get_IsDisconnectedSession(This,pIsDisconnectionSession) ) 

#define ITsSbClientConnection_get_ConnectionError(This)	\
    ( (This)->lpVtbl -> get_ConnectionError(This) ) 

#define ITsSbClientConnection_get_SamUserAccount(This,pVal)	\
    ( (This)->lpVtbl -> get_SamUserAccount(This,pVal) ) 

#define ITsSbClientConnection_get_ClientConnectionPropertySet(This,ppPropertySet)	\
    ( (This)->lpVtbl -> get_ClientConnectionPropertySet(This,ppPropertySet) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbClientConnection_INTERFACE_DEFINED__ */


#ifndef __ITsSbProvider_INTERFACE_DEFINED__
#define __ITsSbProvider_INTERFACE_DEFINED__

/* interface ITsSbProvider */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbProvider;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("67199246-f3a4-4035-a1f2-be2f16afb1af")
    ITsSbProvider : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateTargetObject( 
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbTarget **ppTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateLoadBalanceResultObject( 
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbLoadBalanceResult **ppLBResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateSessionObject( 
            /* [in] */ __RPC__in BSTR TargetName,
            /* [in] */ __RPC__in BSTR UserName,
            /* [in] */ __RPC__in BSTR Domain,
            /* [in] */ DWORD SessionId,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreatePluginPropertySet( 
            /* [retval][out] */ __RPC__deref_out_opt ITsSbPluginPropertySet **ppPropertySet) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateTargetPropertySetObject( 
            /* [out] */ __RPC__deref_out_opt ITsSbTargetPropertySet **ppPropertySet) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateEnvironmentObject( 
            /* [in] */ __RPC__in BSTR Name,
            /* [in] */ DWORD ServerWeight,
            /* [out] */ __RPC__deref_out_opt ITsSbEnvironment **ppEnvironment) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetResourcePluginStore( 
            /* [in] */ __RPC__in_opt ITsSbResourcePlugin *pResourcePlugin,
            /* [out] */ __RPC__deref_out_opt ITsSbResourcePluginStore **ppStore) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RegisterForNotification( 
            /* [in] */ DWORD notificationType,
            /* [in] */ __RPC__in BSTR ResourceToMonitor,
            /* [in] */ __RPC__in_opt ITsSbResourceNotification *pPluginNotification) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE UnRegisterForNotification( 
            /* [in] */ DWORD notificationType,
            /* [in] */ __RPC__in BSTR ResourceToMonitor) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetInstanceOfGlobalStore( 
            /* [out] */ __RPC__deref_out_opt ITsSbGlobalStore **ppGlobalStore) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateEnvironmentPropertySetObject( 
            /* [out] */ __RPC__deref_out_opt ITsSbEnvironmentPropertySet **ppPropertySet) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbProviderVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbProvider * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbProvider * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateTargetObject )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbTarget **ppTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateLoadBalanceResultObject )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbLoadBalanceResult **ppLBResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateSessionObject )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [in] */ __RPC__in BSTR UserName,
            /* [in] */ __RPC__in BSTR Domain,
            /* [in] */ DWORD SessionId,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreatePluginPropertySet )( 
            __RPC__in ITsSbProvider * This,
            /* [retval][out] */ __RPC__deref_out_opt ITsSbPluginPropertySet **ppPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateTargetPropertySetObject )( 
            __RPC__in ITsSbProvider * This,
            /* [out] */ __RPC__deref_out_opt ITsSbTargetPropertySet **ppPropertySet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateEnvironmentObject )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ __RPC__in BSTR Name,
            /* [in] */ DWORD ServerWeight,
            /* [out] */ __RPC__deref_out_opt ITsSbEnvironment **ppEnvironment);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetResourcePluginStore )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ __RPC__in_opt ITsSbResourcePlugin *pResourcePlugin,
            /* [out] */ __RPC__deref_out_opt ITsSbResourcePluginStore **ppStore);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RegisterForNotification )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ DWORD notificationType,
            /* [in] */ __RPC__in BSTR ResourceToMonitor,
            /* [in] */ __RPC__in_opt ITsSbResourceNotification *pPluginNotification);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *UnRegisterForNotification )( 
            __RPC__in ITsSbProvider * This,
            /* [in] */ DWORD notificationType,
            /* [in] */ __RPC__in BSTR ResourceToMonitor);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetInstanceOfGlobalStore )( 
            __RPC__in ITsSbProvider * This,
            /* [out] */ __RPC__deref_out_opt ITsSbGlobalStore **ppGlobalStore);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateEnvironmentPropertySetObject )( 
            __RPC__in ITsSbProvider * This,
            /* [out] */ __RPC__deref_out_opt ITsSbEnvironmentPropertySet **ppPropertySet);
        
        END_INTERFACE
    } ITsSbProviderVtbl;

    interface ITsSbProvider
    {
        CONST_VTBL struct ITsSbProviderVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbProvider_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbProvider_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbProvider_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbProvider_CreateTargetObject(This,TargetName,ppTarget)	\
    ( (This)->lpVtbl -> CreateTargetObject(This,TargetName,ppTarget) ) 

#define ITsSbProvider_CreateLoadBalanceResultObject(This,TargetName,ppLBResult)	\
    ( (This)->lpVtbl -> CreateLoadBalanceResultObject(This,TargetName,ppLBResult) ) 

#define ITsSbProvider_CreateSessionObject(This,TargetName,UserName,Domain,SessionId,ppSession)	\
    ( (This)->lpVtbl -> CreateSessionObject(This,TargetName,UserName,Domain,SessionId,ppSession) ) 

#define ITsSbProvider_CreatePluginPropertySet(This,ppPropertySet)	\
    ( (This)->lpVtbl -> CreatePluginPropertySet(This,ppPropertySet) ) 

#define ITsSbProvider_CreateTargetPropertySetObject(This,ppPropertySet)	\
    ( (This)->lpVtbl -> CreateTargetPropertySetObject(This,ppPropertySet) ) 

#define ITsSbProvider_CreateEnvironmentObject(This,Name,ServerWeight,ppEnvironment)	\
    ( (This)->lpVtbl -> CreateEnvironmentObject(This,Name,ServerWeight,ppEnvironment) ) 

#define ITsSbProvider_GetResourcePluginStore(This,pResourcePlugin,ppStore)	\
    ( (This)->lpVtbl -> GetResourcePluginStore(This,pResourcePlugin,ppStore) ) 

#define ITsSbProvider_RegisterForNotification(This,notificationType,ResourceToMonitor,pPluginNotification)	\
    ( (This)->lpVtbl -> RegisterForNotification(This,notificationType,ResourceToMonitor,pPluginNotification) ) 

#define ITsSbProvider_UnRegisterForNotification(This,notificationType,ResourceToMonitor)	\
    ( (This)->lpVtbl -> UnRegisterForNotification(This,notificationType,ResourceToMonitor) ) 

#define ITsSbProvider_GetInstanceOfGlobalStore(This,ppGlobalStore)	\
    ( (This)->lpVtbl -> GetInstanceOfGlobalStore(This,ppGlobalStore) ) 

#define ITsSbProvider_CreateEnvironmentPropertySetObject(This,ppPropertySet)	\
    ( (This)->lpVtbl -> CreateEnvironmentPropertySetObject(This,ppPropertySet) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbProvider_INTERFACE_DEFINED__ */


#ifndef __ITsSbResourcePluginStore_INTERFACE_DEFINED__
#define __ITsSbResourcePluginStore_INTERFACE_DEFINED__

/* interface ITsSbResourcePluginStore */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbResourcePluginStore;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("03aba8da-3fdf-4c3f-9304-7842430cc606")
    ITsSbResourcePluginStore : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueryTarget( 
            /* [in] */ __RPC__in BSTR TargetName,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out] */ __RPC__deref_out_opt ITsSbTarget **ppTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetTargetNotifySink( 
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget,
            /* [out] */ __RPC__deref_out_opt ITsSbTargetNotifySink **ppTargetNotifySink) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QuerySessionByUserName( 
            /* [in] */ __RPC__in BSTR UserName,
            /* [in] */ TARGET_TYPE TargetType,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QuerySessionBySessionId( 
            /* [in] */ DWORD dwSessionId,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetSessionNotifySink( 
            /* [in] */ __RPC__in_opt ITsSbSession *pSession,
            /* [out] */ __RPC__deref_out_opt ITsSbSessionNotifySink **ppSessionNotifySink) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddTargetToStore( 
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget,
            /* [out] */ __RPC__deref_out_opt ITsSbTargetNotifySink **ppTargetNotifySink) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddSessionToStore( 
            /* [in] */ __RPC__in_opt ITsSbSession *pSession,
            /* [out] */ __RPC__deref_out_opt ITsSbSessionNotifySink **ppSessionNotifySink) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE AddEnvironmentToStore( 
            /* [in] */ __RPC__in_opt ITsSbEnvironment *pEnvironment) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RemoveEnvironmentFromStore( 
            /* [in] */ __RPC__in BSTR EnvironmentName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateFarms( 
            /* [out] */ __RPC__out DWORD *pdwCount,
            /* [out] */ __RPC__deref_out_opt SAFEARRAY * *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateTargetsByFarm( 
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateNonFarmTargets( 
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueryEnvironment( 
            /* [in] */ __RPC__in BSTR EnvironmentName,
            /* [out] */ __RPC__deref_out_opt ITsSbEnvironment **ppEnvironment) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateEnvironments( 
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) ITsSbEnvironment **pVal[  ]) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateSessionsByTargetName( 
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) ITsSbSession **ppVal[  ]) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbResourcePluginStoreVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbResourcePluginStore * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbResourcePluginStore * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QueryTarget )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out] */ __RPC__deref_out_opt ITsSbTarget **ppTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetTargetNotifySink )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget,
            /* [out] */ __RPC__deref_out_opt ITsSbTargetNotifySink **ppTargetNotifySink);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QuerySessionByUserName )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in BSTR UserName,
            /* [in] */ TARGET_TYPE TargetType,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QuerySessionBySessionId )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ DWORD dwSessionId,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetSessionNotifySink )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in_opt ITsSbSession *pSession,
            /* [out] */ __RPC__deref_out_opt ITsSbSessionNotifySink **ppSessionNotifySink);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddTargetToStore )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in_opt ITsSbTarget *pTarget,
            /* [out] */ __RPC__deref_out_opt ITsSbTargetNotifySink **ppTargetNotifySink);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddSessionToStore )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in_opt ITsSbSession *pSession,
            /* [out] */ __RPC__deref_out_opt ITsSbSessionNotifySink **ppSessionNotifySink);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *AddEnvironmentToStore )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in_opt ITsSbEnvironment *pEnvironment);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RemoveEnvironmentFromStore )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in BSTR EnvironmentName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateFarms )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [out] */ __RPC__out DWORD *pdwCount,
            /* [out] */ __RPC__deref_out_opt SAFEARRAY * *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateTargetsByFarm )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateNonFarmTargets )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QueryEnvironment )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in BSTR EnvironmentName,
            /* [out] */ __RPC__deref_out_opt ITsSbEnvironment **ppEnvironment);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateEnvironments )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) ITsSbEnvironment **pVal[  ]);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateSessionsByTargetName )( 
            __RPC__in ITsSbResourcePluginStore * This,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) ITsSbSession **ppVal[  ]);
        
        END_INTERFACE
    } ITsSbResourcePluginStoreVtbl;

    interface ITsSbResourcePluginStore
    {
        CONST_VTBL struct ITsSbResourcePluginStoreVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbResourcePluginStore_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbResourcePluginStore_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbResourcePluginStore_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbResourcePluginStore_QueryTarget(This,TargetName,FarmName,ppTarget)	\
    ( (This)->lpVtbl -> QueryTarget(This,TargetName,FarmName,ppTarget) ) 

#define ITsSbResourcePluginStore_GetTargetNotifySink(This,pTarget,ppTargetNotifySink)	\
    ( (This)->lpVtbl -> GetTargetNotifySink(This,pTarget,ppTargetNotifySink) ) 

#define ITsSbResourcePluginStore_QuerySessionByUserName(This,UserName,TargetType,TargetName,ppSession)	\
    ( (This)->lpVtbl -> QuerySessionByUserName(This,UserName,TargetType,TargetName,ppSession) ) 

#define ITsSbResourcePluginStore_QuerySessionBySessionId(This,dwSessionId,TargetName,ppSession)	\
    ( (This)->lpVtbl -> QuerySessionBySessionId(This,dwSessionId,TargetName,ppSession) ) 

#define ITsSbResourcePluginStore_GetSessionNotifySink(This,pSession,ppSessionNotifySink)	\
    ( (This)->lpVtbl -> GetSessionNotifySink(This,pSession,ppSessionNotifySink) ) 

#define ITsSbResourcePluginStore_AddTargetToStore(This,pTarget,ppTargetNotifySink)	\
    ( (This)->lpVtbl -> AddTargetToStore(This,pTarget,ppTargetNotifySink) ) 

#define ITsSbResourcePluginStore_AddSessionToStore(This,pSession,ppSessionNotifySink)	\
    ( (This)->lpVtbl -> AddSessionToStore(This,pSession,ppSessionNotifySink) ) 

#define ITsSbResourcePluginStore_AddEnvironmentToStore(This,pEnvironment)	\
    ( (This)->lpVtbl -> AddEnvironmentToStore(This,pEnvironment) ) 

#define ITsSbResourcePluginStore_RemoveEnvironmentFromStore(This,EnvironmentName)	\
    ( (This)->lpVtbl -> RemoveEnvironmentFromStore(This,EnvironmentName) ) 

#define ITsSbResourcePluginStore_EnumerateFarms(This,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateFarms(This,pdwCount,pVal) ) 

#define ITsSbResourcePluginStore_EnumerateTargetsByFarm(This,FarmName,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateTargetsByFarm(This,FarmName,pdwCount,pVal) ) 

#define ITsSbResourcePluginStore_EnumerateNonFarmTargets(This,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateNonFarmTargets(This,pdwCount,pVal) ) 

#define ITsSbResourcePluginStore_QueryEnvironment(This,EnvironmentName,ppEnvironment)	\
    ( (This)->lpVtbl -> QueryEnvironment(This,EnvironmentName,ppEnvironment) ) 

#define ITsSbResourcePluginStore_EnumerateEnvironments(This,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateEnvironments(This,pdwCount,pVal) ) 

#define ITsSbResourcePluginStore_EnumerateSessionsByTargetName(This,TargetName,pdwCount,ppVal)	\
    ( (This)->lpVtbl -> EnumerateSessionsByTargetName(This,TargetName,pdwCount,ppVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbResourcePluginStore_INTERFACE_DEFINED__ */


#ifndef __ITsSbGlobalStore_INTERFACE_DEFINED__
#define __ITsSbGlobalStore_INTERFACE_DEFINED__

/* interface ITsSbGlobalStore */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ITsSbGlobalStore;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("d521ad43-7123-49a2-8622-8871a147439e")
    ITsSbGlobalStore : public IUnknown
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QueryTarget( 
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out] */ __RPC__deref_out_opt ITsSbTarget **ppTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QuerySessionByUserName( 
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ __RPC__in BSTR UserName,
            /* [in] */ TARGET_TYPE TargetType,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QuerySessionBySessionId( 
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ DWORD dwSessionId,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateFarms( 
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [out] */ __RPC__out DWORD *pdwCount,
            /* [out] */ __RPC__deref_out_opt SAFEARRAY * *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateTargetsByFarm( 
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnumerateNonFarmTargets( 
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITsSbGlobalStoreVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITsSbGlobalStore * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITsSbGlobalStore * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QueryTarget )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out] */ __RPC__deref_out_opt ITsSbTarget **ppTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QuerySessionByUserName )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ __RPC__in BSTR UserName,
            /* [in] */ TARGET_TYPE TargetType,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QuerySessionBySessionId )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ DWORD dwSessionId,
            /* [in] */ __RPC__in BSTR TargetName,
            /* [out] */ __RPC__deref_out_opt ITsSbSession **ppSession);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateFarms )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [out] */ __RPC__out DWORD *pdwCount,
            /* [out] */ __RPC__deref_out_opt SAFEARRAY * *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateTargetsByFarm )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [in] */ __RPC__in BSTR FarmName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateNonFarmTargets )( 
            __RPC__in ITsSbGlobalStore * This,
            /* [in] */ __RPC__in BSTR ProviderName,
            /* [out][in] */ __RPC__inout DWORD *pdwCount,
            /* [size_is][out] */ __RPC__out_ecount_full(*pdwCount) IUnknown **pVal[  ]);
        
        END_INTERFACE
    } ITsSbGlobalStoreVtbl;

    interface ITsSbGlobalStore
    {
        CONST_VTBL struct ITsSbGlobalStoreVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITsSbGlobalStore_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITsSbGlobalStore_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITsSbGlobalStore_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITsSbGlobalStore_QueryTarget(This,ProviderName,TargetName,FarmName,ppTarget)	\
    ( (This)->lpVtbl -> QueryTarget(This,ProviderName,TargetName,FarmName,ppTarget) ) 

#define ITsSbGlobalStore_QuerySessionByUserName(This,ProviderName,UserName,TargetType,TargetName,ppSession)	\
    ( (This)->lpVtbl -> QuerySessionByUserName(This,ProviderName,UserName,TargetType,TargetName,ppSession) ) 

#define ITsSbGlobalStore_QuerySessionBySessionId(This,ProviderName,dwSessionId,TargetName,ppSession)	\
    ( (This)->lpVtbl -> QuerySessionBySessionId(This,ProviderName,dwSessionId,TargetName,ppSession) ) 

#define ITsSbGlobalStore_EnumerateFarms(This,ProviderName,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateFarms(This,ProviderName,pdwCount,pVal) ) 

#define ITsSbGlobalStore_EnumerateTargetsByFarm(This,ProviderName,FarmName,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateTargetsByFarm(This,ProviderName,FarmName,pdwCount,pVal) ) 

#define ITsSbGlobalStore_EnumerateNonFarmTargets(This,ProviderName,pdwCount,pVal)	\
    ( (This)->lpVtbl -> EnumerateNonFarmTargets(This,ProviderName,pdwCount,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITsSbGlobalStore_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  LPSAFEARRAY_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in LPSAFEARRAY * ); 
unsigned char * __RPC_USER  LPSAFEARRAY_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in LPSAFEARRAY * ); 
unsigned char * __RPC_USER  LPSAFEARRAY_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out LPSAFEARRAY * ); 
void                      __RPC_USER  LPSAFEARRAY_UserFree(     __RPC__in unsigned long *, __RPC__in LPSAFEARRAY * ); 

unsigned long             __RPC_USER  VARIANT_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree(     __RPC__in unsigned long *, __RPC__in VARIANT * ); 

unsigned long             __RPC_USER  BSTR_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree64(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  LPSAFEARRAY_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in LPSAFEARRAY * ); 
unsigned char * __RPC_USER  LPSAFEARRAY_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in LPSAFEARRAY * ); 
unsigned char * __RPC_USER  LPSAFEARRAY_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out LPSAFEARRAY * ); 
void                      __RPC_USER  LPSAFEARRAY_UserFree64(     __RPC__in unsigned long *, __RPC__in LPSAFEARRAY * ); 

unsigned long             __RPC_USER  VARIANT_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree64(     __RPC__in unsigned long *, __RPC__in VARIANT * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


