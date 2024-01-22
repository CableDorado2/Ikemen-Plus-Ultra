

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for iextag.idl:
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

#ifndef __iextag_h__
#define __iextag_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IPeerFactory_FWD_DEFINED__
#define __IPeerFactory_FWD_DEFINED__
typedef interface IPeerFactory IPeerFactory;
#endif 	/* __IPeerFactory_FWD_DEFINED__ */


#ifndef __IHomePage_FWD_DEFINED__
#define __IHomePage_FWD_DEFINED__
typedef interface IHomePage IHomePage;
#endif 	/* __IHomePage_FWD_DEFINED__ */


#ifndef __IClientCaps_FWD_DEFINED__
#define __IClientCaps_FWD_DEFINED__
typedef interface IClientCaps IClientCaps;
#endif 	/* __IClientCaps_FWD_DEFINED__ */


#ifndef __IIntelliForms_FWD_DEFINED__
#define __IIntelliForms_FWD_DEFINED__
typedef interface IIntelliForms IIntelliForms;
#endif 	/* __IIntelliForms_FWD_DEFINED__ */


#ifndef __Iwfolders_FWD_DEFINED__
#define __Iwfolders_FWD_DEFINED__
typedef interface Iwfolders Iwfolders;
#endif 	/* __Iwfolders_FWD_DEFINED__ */


#ifndef __IAnchorClick_FWD_DEFINED__
#define __IAnchorClick_FWD_DEFINED__
typedef interface IAnchorClick IAnchorClick;
#endif 	/* __IAnchorClick_FWD_DEFINED__ */


#ifndef __HTMLPersistEvents_FWD_DEFINED__
#define __HTMLPersistEvents_FWD_DEFINED__
typedef interface HTMLPersistEvents HTMLPersistEvents;
#endif 	/* __HTMLPersistEvents_FWD_DEFINED__ */


#ifndef __IHTMLUserDataOM_FWD_DEFINED__
#define __IHTMLUserDataOM_FWD_DEFINED__
typedef interface IHTMLUserDataOM IHTMLUserDataOM;
#endif 	/* __IHTMLUserDataOM_FWD_DEFINED__ */


#ifndef __IHTMLPersistDataOM_FWD_DEFINED__
#define __IHTMLPersistDataOM_FWD_DEFINED__
typedef interface IHTMLPersistDataOM IHTMLPersistDataOM;
#endif 	/* __IHTMLPersistDataOM_FWD_DEFINED__ */


#ifndef __IHTMLPersistData_FWD_DEFINED__
#define __IHTMLPersistData_FWD_DEFINED__
typedef interface IHTMLPersistData IHTMLPersistData;
#endif 	/* __IHTMLPersistData_FWD_DEFINED__ */


#ifndef __IDownloadBehavior_FWD_DEFINED__
#define __IDownloadBehavior_FWD_DEFINED__
typedef interface IDownloadBehavior IDownloadBehavior;
#endif 	/* __IDownloadBehavior_FWD_DEFINED__ */


#ifndef __LayoutRectEvents_FWD_DEFINED__
#define __LayoutRectEvents_FWD_DEFINED__
typedef interface LayoutRectEvents LayoutRectEvents;
#endif 	/* __LayoutRectEvents_FWD_DEFINED__ */


#ifndef __ILayoutRect_FWD_DEFINED__
#define __ILayoutRect_FWD_DEFINED__
typedef interface ILayoutRect ILayoutRect;
#endif 	/* __ILayoutRect_FWD_DEFINED__ */


#ifndef __IDeviceRect_FWD_DEFINED__
#define __IDeviceRect_FWD_DEFINED__
typedef interface IDeviceRect IDeviceRect;
#endif 	/* __IDeviceRect_FWD_DEFINED__ */


#ifndef __ITemplatePrinter_FWD_DEFINED__
#define __ITemplatePrinter_FWD_DEFINED__
typedef interface ITemplatePrinter ITemplatePrinter;
#endif 	/* __ITemplatePrinter_FWD_DEFINED__ */


#ifndef __ITemplatePrinter2_FWD_DEFINED__
#define __ITemplatePrinter2_FWD_DEFINED__
typedef interface ITemplatePrinter2 ITemplatePrinter2;
#endif 	/* __ITemplatePrinter2_FWD_DEFINED__ */


#ifndef __ITemplatePrinter3_FWD_DEFINED__
#define __ITemplatePrinter3_FWD_DEFINED__
typedef interface ITemplatePrinter3 ITemplatePrinter3;
#endif 	/* __ITemplatePrinter3_FWD_DEFINED__ */


#ifndef __IHeaderFooter_FWD_DEFINED__
#define __IHeaderFooter_FWD_DEFINED__
typedef interface IHeaderFooter IHeaderFooter;
#endif 	/* __IHeaderFooter_FWD_DEFINED__ */


#ifndef __IHeaderFooter2_FWD_DEFINED__
#define __IHeaderFooter2_FWD_DEFINED__
typedef interface IHeaderFooter2 IHeaderFooter2;
#endif 	/* __IHeaderFooter2_FWD_DEFINED__ */


#ifndef __PeerFactory_FWD_DEFINED__
#define __PeerFactory_FWD_DEFINED__

#ifdef __cplusplus
typedef class PeerFactory PeerFactory;
#else
typedef struct PeerFactory PeerFactory;
#endif /* __cplusplus */

#endif 	/* __PeerFactory_FWD_DEFINED__ */


#ifndef __ClientCaps_FWD_DEFINED__
#define __ClientCaps_FWD_DEFINED__

#ifdef __cplusplus
typedef class ClientCaps ClientCaps;
#else
typedef struct ClientCaps ClientCaps;
#endif /* __cplusplus */

#endif 	/* __ClientCaps_FWD_DEFINED__ */


#ifndef __IntelliForms_FWD_DEFINED__
#define __IntelliForms_FWD_DEFINED__

#ifdef __cplusplus
typedef class IntelliForms IntelliForms;
#else
typedef struct IntelliForms IntelliForms;
#endif /* __cplusplus */

#endif 	/* __IntelliForms_FWD_DEFINED__ */


#ifndef __HomePage_FWD_DEFINED__
#define __HomePage_FWD_DEFINED__

#ifdef __cplusplus
typedef class HomePage HomePage;
#else
typedef struct HomePage HomePage;
#endif /* __cplusplus */

#endif 	/* __HomePage_FWD_DEFINED__ */


#ifndef __CPersistUserData_FWD_DEFINED__
#define __CPersistUserData_FWD_DEFINED__

#ifdef __cplusplus
typedef class CPersistUserData CPersistUserData;
#else
typedef struct CPersistUserData CPersistUserData;
#endif /* __cplusplus */

#endif 	/* __CPersistUserData_FWD_DEFINED__ */


#ifndef __CPersistDataPeer_FWD_DEFINED__
#define __CPersistDataPeer_FWD_DEFINED__

#ifdef __cplusplus
typedef class CPersistDataPeer CPersistDataPeer;
#else
typedef struct CPersistDataPeer CPersistDataPeer;
#endif /* __cplusplus */

#endif 	/* __CPersistDataPeer_FWD_DEFINED__ */


#ifndef __CPersistShortcut_FWD_DEFINED__
#define __CPersistShortcut_FWD_DEFINED__

#ifdef __cplusplus
typedef class CPersistShortcut CPersistShortcut;
#else
typedef struct CPersistShortcut CPersistShortcut;
#endif /* __cplusplus */

#endif 	/* __CPersistShortcut_FWD_DEFINED__ */


#ifndef __CPersistHistory_FWD_DEFINED__
#define __CPersistHistory_FWD_DEFINED__

#ifdef __cplusplus
typedef class CPersistHistory CPersistHistory;
#else
typedef struct CPersistHistory CPersistHistory;
#endif /* __cplusplus */

#endif 	/* __CPersistHistory_FWD_DEFINED__ */


#ifndef __CPersistSnapshot_FWD_DEFINED__
#define __CPersistSnapshot_FWD_DEFINED__

#ifdef __cplusplus
typedef class CPersistSnapshot CPersistSnapshot;
#else
typedef struct CPersistSnapshot CPersistSnapshot;
#endif /* __cplusplus */

#endif 	/* __CPersistSnapshot_FWD_DEFINED__ */


#ifndef __CDownloadBehavior_FWD_DEFINED__
#define __CDownloadBehavior_FWD_DEFINED__

#ifdef __cplusplus
typedef class CDownloadBehavior CDownloadBehavior;
#else
typedef struct CDownloadBehavior CDownloadBehavior;
#endif /* __cplusplus */

#endif 	/* __CDownloadBehavior_FWD_DEFINED__ */


#ifndef __wfolders_FWD_DEFINED__
#define __wfolders_FWD_DEFINED__

#ifdef __cplusplus
typedef class wfolders wfolders;
#else
typedef struct wfolders wfolders;
#endif /* __cplusplus */

#endif 	/* __wfolders_FWD_DEFINED__ */


#ifndef __AnchorClick_FWD_DEFINED__
#define __AnchorClick_FWD_DEFINED__

#ifdef __cplusplus
typedef class AnchorClick AnchorClick;
#else
typedef struct AnchorClick AnchorClick;
#endif /* __cplusplus */

#endif 	/* __AnchorClick_FWD_DEFINED__ */


#ifndef __CLayoutRect_FWD_DEFINED__
#define __CLayoutRect_FWD_DEFINED__

#ifdef __cplusplus
typedef class CLayoutRect CLayoutRect;
#else
typedef struct CLayoutRect CLayoutRect;
#endif /* __cplusplus */

#endif 	/* __CLayoutRect_FWD_DEFINED__ */


#ifndef __CDeviceRect_FWD_DEFINED__
#define __CDeviceRect_FWD_DEFINED__

#ifdef __cplusplus
typedef class CDeviceRect CDeviceRect;
#else
typedef struct CDeviceRect CDeviceRect;
#endif /* __cplusplus */

#endif 	/* __CDeviceRect_FWD_DEFINED__ */


#ifndef __CTemplatePrinter_FWD_DEFINED__
#define __CTemplatePrinter_FWD_DEFINED__

#ifdef __cplusplus
typedef class CTemplatePrinter CTemplatePrinter;
#else
typedef struct CTemplatePrinter CTemplatePrinter;
#endif /* __cplusplus */

#endif 	/* __CTemplatePrinter_FWD_DEFINED__ */


#ifndef __CHeaderFooter_FWD_DEFINED__
#define __CHeaderFooter_FWD_DEFINED__

#ifdef __cplusplus
typedef class CHeaderFooter CHeaderFooter;
#else
typedef struct CHeaderFooter CHeaderFooter;
#endif /* __cplusplus */

#endif 	/* __CHeaderFooter_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_iextag_0000_0000 */
/* [local] */ 

//=--------------------------------------------------------------------------=
// iextag.h
//=--------------------------------------------------------------------------=
// (C) Copyright Microsoft Corporation.  All Rights Reserved.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//=--------------------------------------------------------------------------=



extern RPC_IF_HANDLE __MIDL_itf_iextag_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_iextag_0000_0000_v0_0_s_ifspec;

#ifndef __IPeerFactory_INTERFACE_DEFINED__
#define __IPeerFactory_INTERFACE_DEFINED__

/* interface IPeerFactory */
/* [object][unique][helpstring][uuid] */ 


EXTERN_C const IID IID_IPeerFactory;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6663F9D3-B482-11d1-89C6-00C04FB6BFC4")
    IPeerFactory : public IUnknown
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IPeerFactoryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IPeerFactory * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IPeerFactory * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IPeerFactory * This);
        
        END_INTERFACE
    } IPeerFactoryVtbl;

    interface IPeerFactory
    {
        CONST_VTBL struct IPeerFactoryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IPeerFactory_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IPeerFactory_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IPeerFactory_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IPeerFactory_INTERFACE_DEFINED__ */


#ifndef __IHomePage_INTERFACE_DEFINED__
#define __IHomePage_INTERFACE_DEFINED__

/* interface IHomePage */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IHomePage;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("766BF2AF-D650-11d1-9811-00C04FC31D2E")
    IHomePage : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE navigateHomePage( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE setHomePage( 
            /* [in] */ __RPC__in BSTR bstrURL) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE isHomePage( 
            /* [in] */ __RPC__in BSTR bstrURL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *p) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHomePageVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IHomePage * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IHomePage * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IHomePage * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IHomePage * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IHomePage * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IHomePage * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IHomePage * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *navigateHomePage )( 
            __RPC__in IHomePage * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *setHomePage )( 
            __RPC__in IHomePage * This,
            /* [in] */ __RPC__in BSTR bstrURL);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *isHomePage )( 
            __RPC__in IHomePage * This,
            /* [in] */ __RPC__in BSTR bstrURL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *p);
        
        END_INTERFACE
    } IHomePageVtbl;

    interface IHomePage
    {
        CONST_VTBL struct IHomePageVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHomePage_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHomePage_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHomePage_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHomePage_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IHomePage_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IHomePage_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IHomePage_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IHomePage_navigateHomePage(This)	\
    ( (This)->lpVtbl -> navigateHomePage(This) ) 

#define IHomePage_setHomePage(This,bstrURL)	\
    ( (This)->lpVtbl -> setHomePage(This,bstrURL) ) 

#define IHomePage_isHomePage(This,bstrURL,p)	\
    ( (This)->lpVtbl -> isHomePage(This,bstrURL,p) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHomePage_INTERFACE_DEFINED__ */


#ifndef __IClientCaps_INTERFACE_DEFINED__
#define __IClientCaps_INTERFACE_DEFINED__

/* interface IClientCaps */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IClientCaps;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("7E8BC44D-AEFF-11D1-89C2-00C04FB6BFC4")
    IClientCaps : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_javaEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_cookieEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_cpuClass( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_systemLanguage( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_userLanguage( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_platform( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_connectionSpeed( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_onLine( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_colorDepth( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_bufferDepth( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_width( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_height( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_availHeight( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_availWidth( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_connectionType( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE isComponentInstalled( 
            /* [in] */ __RPC__in BSTR bstrName,
            /* [in] */ __RPC__in BSTR bstrType,
            /* [in][defaultvalue] */ __RPC__in BSTR bStrVer,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getComponentVersion( 
            /* [in] */ __RPC__in BSTR bstrName,
            /* [in] */ __RPC__in BSTR bstrType,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pbstrVer) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE compareVersions( 
            /* [in] */ __RPC__in BSTR bstrVer1,
            /* [in] */ __RPC__in BSTR bstrVer2,
            /* [retval][out] */ __RPC__out long *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE addComponentRequest( 
            /* [in] */ __RPC__in BSTR bstrName,
            /* [in] */ __RPC__in BSTR bstrType,
            /* [in][defaultvalue] */ __RPC__in BSTR bstrVer = L"") = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE doComponentRequest( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE clearComponentRequest( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IClientCapsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IClientCaps * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IClientCaps * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IClientCaps * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IClientCaps * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IClientCaps * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IClientCaps * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IClientCaps * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_javaEnabled )( 
            __RPC__in IClientCaps * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_cookieEnabled )( 
            __RPC__in IClientCaps * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_cpuClass )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_systemLanguage )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_userLanguage )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_platform )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_connectionSpeed )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_onLine )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_colorDepth )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_bufferDepth )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_width )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_height )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_availHeight )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_availWidth )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_connectionType )( 
            __RPC__in IClientCaps * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *isComponentInstalled )( 
            __RPC__in IClientCaps * This,
            /* [in] */ __RPC__in BSTR bstrName,
            /* [in] */ __RPC__in BSTR bstrType,
            /* [in][defaultvalue] */ __RPC__in BSTR bStrVer,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getComponentVersion )( 
            __RPC__in IClientCaps * This,
            /* [in] */ __RPC__in BSTR bstrName,
            /* [in] */ __RPC__in BSTR bstrType,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pbstrVer);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *compareVersions )( 
            __RPC__in IClientCaps * This,
            /* [in] */ __RPC__in BSTR bstrVer1,
            /* [in] */ __RPC__in BSTR bstrVer2,
            /* [retval][out] */ __RPC__out long *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *addComponentRequest )( 
            __RPC__in IClientCaps * This,
            /* [in] */ __RPC__in BSTR bstrName,
            /* [in] */ __RPC__in BSTR bstrType,
            /* [in][defaultvalue] */ __RPC__in BSTR bstrVer);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *doComponentRequest )( 
            __RPC__in IClientCaps * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *clearComponentRequest )( 
            __RPC__in IClientCaps * This);
        
        END_INTERFACE
    } IClientCapsVtbl;

    interface IClientCaps
    {
        CONST_VTBL struct IClientCapsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IClientCaps_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IClientCaps_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IClientCaps_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IClientCaps_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IClientCaps_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IClientCaps_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IClientCaps_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IClientCaps_get_javaEnabled(This,pVal)	\
    ( (This)->lpVtbl -> get_javaEnabled(This,pVal) ) 

#define IClientCaps_get_cookieEnabled(This,pVal)	\
    ( (This)->lpVtbl -> get_cookieEnabled(This,pVal) ) 

#define IClientCaps_get_cpuClass(This,p)	\
    ( (This)->lpVtbl -> get_cpuClass(This,p) ) 

#define IClientCaps_get_systemLanguage(This,p)	\
    ( (This)->lpVtbl -> get_systemLanguage(This,p) ) 

#define IClientCaps_get_userLanguage(This,p)	\
    ( (This)->lpVtbl -> get_userLanguage(This,p) ) 

#define IClientCaps_get_platform(This,p)	\
    ( (This)->lpVtbl -> get_platform(This,p) ) 

#define IClientCaps_get_connectionSpeed(This,p)	\
    ( (This)->lpVtbl -> get_connectionSpeed(This,p) ) 

#define IClientCaps_get_onLine(This,p)	\
    ( (This)->lpVtbl -> get_onLine(This,p) ) 

#define IClientCaps_get_colorDepth(This,p)	\
    ( (This)->lpVtbl -> get_colorDepth(This,p) ) 

#define IClientCaps_get_bufferDepth(This,p)	\
    ( (This)->lpVtbl -> get_bufferDepth(This,p) ) 

#define IClientCaps_get_width(This,p)	\
    ( (This)->lpVtbl -> get_width(This,p) ) 

#define IClientCaps_get_height(This,p)	\
    ( (This)->lpVtbl -> get_height(This,p) ) 

#define IClientCaps_get_availHeight(This,p)	\
    ( (This)->lpVtbl -> get_availHeight(This,p) ) 

#define IClientCaps_get_availWidth(This,p)	\
    ( (This)->lpVtbl -> get_availWidth(This,p) ) 

#define IClientCaps_get_connectionType(This,p)	\
    ( (This)->lpVtbl -> get_connectionType(This,p) ) 

#define IClientCaps_isComponentInstalled(This,bstrName,bstrType,bStrVer,p)	\
    ( (This)->lpVtbl -> isComponentInstalled(This,bstrName,bstrType,bStrVer,p) ) 

#define IClientCaps_getComponentVersion(This,bstrName,bstrType,pbstrVer)	\
    ( (This)->lpVtbl -> getComponentVersion(This,bstrName,bstrType,pbstrVer) ) 

#define IClientCaps_compareVersions(This,bstrVer1,bstrVer2,p)	\
    ( (This)->lpVtbl -> compareVersions(This,bstrVer1,bstrVer2,p) ) 

#define IClientCaps_addComponentRequest(This,bstrName,bstrType,bstrVer)	\
    ( (This)->lpVtbl -> addComponentRequest(This,bstrName,bstrType,bstrVer) ) 

#define IClientCaps_doComponentRequest(This,p)	\
    ( (This)->lpVtbl -> doComponentRequest(This,p) ) 

#define IClientCaps_clearComponentRequest(This)	\
    ( (This)->lpVtbl -> clearComponentRequest(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IClientCaps_INTERFACE_DEFINED__ */


#ifndef __IIntelliForms_INTERFACE_DEFINED__
#define __IIntelliForms_INTERFACE_DEFINED__

/* interface IIntelliForms */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_IIntelliForms;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9B9F68E6-1AAA-11d2-BCA5-00C04FD929DB")
    IIntelliForms : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_enabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_enabled( 
            /* [in] */ VARIANT_BOOL bVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IIntelliFormsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IIntelliForms * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IIntelliForms * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IIntelliForms * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IIntelliForms * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IIntelliForms * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IIntelliForms * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IIntelliForms * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_enabled )( 
            __RPC__in IIntelliForms * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_enabled )( 
            __RPC__in IIntelliForms * This,
            /* [in] */ VARIANT_BOOL bVal);
        
        END_INTERFACE
    } IIntelliFormsVtbl;

    interface IIntelliForms
    {
        CONST_VTBL struct IIntelliFormsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IIntelliForms_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IIntelliForms_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IIntelliForms_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IIntelliForms_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IIntelliForms_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IIntelliForms_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IIntelliForms_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IIntelliForms_get_enabled(This,pVal)	\
    ( (This)->lpVtbl -> get_enabled(This,pVal) ) 

#define IIntelliForms_put_enabled(This,bVal)	\
    ( (This)->lpVtbl -> put_enabled(This,bVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IIntelliForms_INTERFACE_DEFINED__ */


#ifndef __Iwfolders_INTERFACE_DEFINED__
#define __Iwfolders_INTERFACE_DEFINED__

/* interface Iwfolders */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_Iwfolders;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BAE31F98-1B81-11D2-A97A-00C04F8ECB02")
    Iwfolders : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE navigate( 
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstrRetVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE navigateFrame( 
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [in] */ __RPC__in BSTR bstrTargetFrame,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstrRetVal) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE navigateNoSite( 
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [in] */ __RPC__in BSTR bstrTargetFrame,
            /* [in] */ DWORD dwhwnd,
            /* [in] */ __RPC__in_opt IUnknown *pwb) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IwfoldersVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in Iwfolders * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in Iwfolders * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in Iwfolders * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in Iwfolders * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in Iwfolders * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in Iwfolders * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            Iwfolders * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *navigate )( 
            __RPC__in Iwfolders * This,
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstrRetVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *navigateFrame )( 
            __RPC__in Iwfolders * This,
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [in] */ __RPC__in BSTR bstrTargetFrame,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstrRetVal);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *navigateNoSite )( 
            __RPC__in Iwfolders * This,
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [in] */ __RPC__in BSTR bstrTargetFrame,
            /* [in] */ DWORD dwhwnd,
            /* [in] */ __RPC__in_opt IUnknown *pwb);
        
        END_INTERFACE
    } IwfoldersVtbl;

    interface Iwfolders
    {
        CONST_VTBL struct IwfoldersVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define Iwfolders_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define Iwfolders_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define Iwfolders_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define Iwfolders_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define Iwfolders_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define Iwfolders_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define Iwfolders_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define Iwfolders_navigate(This,bstrUrl,pbstrRetVal)	\
    ( (This)->lpVtbl -> navigate(This,bstrUrl,pbstrRetVal) ) 

#define Iwfolders_navigateFrame(This,bstrUrl,bstrTargetFrame,pbstrRetVal)	\
    ( (This)->lpVtbl -> navigateFrame(This,bstrUrl,bstrTargetFrame,pbstrRetVal) ) 

#define Iwfolders_navigateNoSite(This,bstrUrl,bstrTargetFrame,dwhwnd,pwb)	\
    ( (This)->lpVtbl -> navigateNoSite(This,bstrUrl,bstrTargetFrame,dwhwnd,pwb) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __Iwfolders_INTERFACE_DEFINED__ */


#ifndef __IAnchorClick_INTERFACE_DEFINED__
#define __IAnchorClick_INTERFACE_DEFINED__

/* interface IAnchorClick */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IAnchorClick;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("13D5413B-33B9-11D2-95A7-00C04F8ECB02")
    IAnchorClick : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ProcOnClick( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnchorClickVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnchorClick * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnchorClick * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnchorClick * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IAnchorClick * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IAnchorClick * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IAnchorClick * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAnchorClick * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ProcOnClick )( 
            __RPC__in IAnchorClick * This);
        
        END_INTERFACE
    } IAnchorClickVtbl;

    interface IAnchorClick
    {
        CONST_VTBL struct IAnchorClickVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnchorClick_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnchorClick_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnchorClick_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnchorClick_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAnchorClick_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAnchorClick_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAnchorClick_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IAnchorClick_ProcOnClick(This)	\
    ( (This)->lpVtbl -> ProcOnClick(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnchorClick_INTERFACE_DEFINED__ */


#ifndef __IHTMLUserDataOM_INTERFACE_DEFINED__
#define __IHTMLUserDataOM_INTERFACE_DEFINED__

/* interface IHTMLUserDataOM */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IHTMLUserDataOM;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f48f-98b5-11cf-bb82-00aa00bdce0b")
    IHTMLUserDataOM : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_XMLDocument( 
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE save( 
            /* [in] */ __RPC__in BSTR strName) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE load( 
            /* [in] */ __RPC__in BSTR strName) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getAttribute( 
            /* [in] */ __RPC__in BSTR name,
            /* [out][retval] */ __RPC__out VARIANT *pValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE setAttribute( 
            /* [in] */ __RPC__in BSTR name,
            /* [in] */ VARIANT value) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE removeAttribute( 
            /* [in] */ __RPC__in BSTR name) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_expires( 
            /* [in] */ __RPC__in BSTR bstr) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_expires( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstr) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHTMLUserDataOMVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IHTMLUserDataOM * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IHTMLUserDataOM * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IHTMLUserDataOM * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_XMLDocument )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *save )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in BSTR strName);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *load )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in BSTR strName);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getAttribute )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in BSTR name,
            /* [out][retval] */ __RPC__out VARIANT *pValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *setAttribute )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in BSTR name,
            /* [in] */ VARIANT value);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *removeAttribute )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in BSTR name);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_expires )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [in] */ __RPC__in BSTR bstr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_expires )( 
            __RPC__in IHTMLUserDataOM * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstr);
        
        END_INTERFACE
    } IHTMLUserDataOMVtbl;

    interface IHTMLUserDataOM
    {
        CONST_VTBL struct IHTMLUserDataOMVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHTMLUserDataOM_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHTMLUserDataOM_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHTMLUserDataOM_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHTMLUserDataOM_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IHTMLUserDataOM_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IHTMLUserDataOM_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IHTMLUserDataOM_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IHTMLUserDataOM_get_XMLDocument(This,p)	\
    ( (This)->lpVtbl -> get_XMLDocument(This,p) ) 

#define IHTMLUserDataOM_save(This,strName)	\
    ( (This)->lpVtbl -> save(This,strName) ) 

#define IHTMLUserDataOM_load(This,strName)	\
    ( (This)->lpVtbl -> load(This,strName) ) 

#define IHTMLUserDataOM_getAttribute(This,name,pValue)	\
    ( (This)->lpVtbl -> getAttribute(This,name,pValue) ) 

#define IHTMLUserDataOM_setAttribute(This,name,value)	\
    ( (This)->lpVtbl -> setAttribute(This,name,value) ) 

#define IHTMLUserDataOM_removeAttribute(This,name)	\
    ( (This)->lpVtbl -> removeAttribute(This,name) ) 

#define IHTMLUserDataOM_put_expires(This,bstr)	\
    ( (This)->lpVtbl -> put_expires(This,bstr) ) 

#define IHTMLUserDataOM_get_expires(This,pbstr)	\
    ( (This)->lpVtbl -> get_expires(This,pbstr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHTMLUserDataOM_INTERFACE_DEFINED__ */


#ifndef __IHTMLPersistDataOM_INTERFACE_DEFINED__
#define __IHTMLPersistDataOM_INTERFACE_DEFINED__

/* interface IHTMLPersistDataOM */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IHTMLPersistDataOM;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f4c0-98b5-11cf-bb82-00aa00bdce0b")
    IHTMLPersistDataOM : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_XMLDocument( 
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getAttribute( 
            /* [in] */ __RPC__in BSTR name,
            /* [out][retval] */ __RPC__out VARIANT *pValue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE setAttribute( 
            /* [in] */ __RPC__in BSTR name,
            /* [in] */ VARIANT value) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE removeAttribute( 
            /* [in] */ __RPC__in BSTR name) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHTMLPersistDataOMVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IHTMLPersistDataOM * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IHTMLPersistDataOM * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IHTMLPersistDataOM * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_XMLDocument )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getAttribute )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [in] */ __RPC__in BSTR name,
            /* [out][retval] */ __RPC__out VARIANT *pValue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *setAttribute )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [in] */ __RPC__in BSTR name,
            /* [in] */ VARIANT value);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *removeAttribute )( 
            __RPC__in IHTMLPersistDataOM * This,
            /* [in] */ __RPC__in BSTR name);
        
        END_INTERFACE
    } IHTMLPersistDataOMVtbl;

    interface IHTMLPersistDataOM
    {
        CONST_VTBL struct IHTMLPersistDataOMVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHTMLPersistDataOM_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHTMLPersistDataOM_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHTMLPersistDataOM_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHTMLPersistDataOM_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IHTMLPersistDataOM_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IHTMLPersistDataOM_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IHTMLPersistDataOM_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IHTMLPersistDataOM_get_XMLDocument(This,p)	\
    ( (This)->lpVtbl -> get_XMLDocument(This,p) ) 

#define IHTMLPersistDataOM_getAttribute(This,name,pValue)	\
    ( (This)->lpVtbl -> getAttribute(This,name,pValue) ) 

#define IHTMLPersistDataOM_setAttribute(This,name,value)	\
    ( (This)->lpVtbl -> setAttribute(This,name,value) ) 

#define IHTMLPersistDataOM_removeAttribute(This,name)	\
    ( (This)->lpVtbl -> removeAttribute(This,name) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHTMLPersistDataOM_INTERFACE_DEFINED__ */


#ifndef __IHTMLPersistData_INTERFACE_DEFINED__
#define __IHTMLPersistData_INTERFACE_DEFINED__

/* interface IHTMLPersistData */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IHTMLPersistData;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f4c5-98b5-11cf-bb82-00aa00bdce0b")
    IHTMLPersistData : public IUnknown
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE save( 
            /* [in] */ __RPC__in_opt IUnknown *pUnk,
            /* [in] */ long lType,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *fContinueBroacast) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE load( 
            /* [in] */ __RPC__in_opt IUnknown *pUnk,
            /* [in] */ long lType,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *fDoDefault) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE queryType( 
            /* [in] */ long lType,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *pfSupportsType) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHTMLPersistDataVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IHTMLPersistData * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IHTMLPersistData * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IHTMLPersistData * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *save )( 
            __RPC__in IHTMLPersistData * This,
            /* [in] */ __RPC__in_opt IUnknown *pUnk,
            /* [in] */ long lType,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *fContinueBroacast);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *load )( 
            __RPC__in IHTMLPersistData * This,
            /* [in] */ __RPC__in_opt IUnknown *pUnk,
            /* [in] */ long lType,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *fDoDefault);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *queryType )( 
            __RPC__in IHTMLPersistData * This,
            /* [in] */ long lType,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *pfSupportsType);
        
        END_INTERFACE
    } IHTMLPersistDataVtbl;

    interface IHTMLPersistData
    {
        CONST_VTBL struct IHTMLPersistDataVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHTMLPersistData_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHTMLPersistData_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHTMLPersistData_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHTMLPersistData_save(This,pUnk,lType,fContinueBroacast)	\
    ( (This)->lpVtbl -> save(This,pUnk,lType,fContinueBroacast) ) 

#define IHTMLPersistData_load(This,pUnk,lType,fDoDefault)	\
    ( (This)->lpVtbl -> load(This,pUnk,lType,fDoDefault) ) 

#define IHTMLPersistData_queryType(This,lType,pfSupportsType)	\
    ( (This)->lpVtbl -> queryType(This,lType,pfSupportsType) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHTMLPersistData_INTERFACE_DEFINED__ */


#ifndef __IDownloadBehavior_INTERFACE_DEFINED__
#define __IDownloadBehavior_INTERFACE_DEFINED__

/* interface IDownloadBehavior */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IDownloadBehavior;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f5bd-98b5-11cf-bb82-00aa00bdce0b")
    IDownloadBehavior : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE startDownload( 
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [in] */ __RPC__in_opt IDispatch *pdispCallback) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDownloadBehaviorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IDownloadBehavior * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IDownloadBehavior * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IDownloadBehavior * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IDownloadBehavior * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IDownloadBehavior * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IDownloadBehavior * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IDownloadBehavior * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *startDownload )( 
            __RPC__in IDownloadBehavior * This,
            /* [in] */ __RPC__in BSTR bstrUrl,
            /* [in] */ __RPC__in_opt IDispatch *pdispCallback);
        
        END_INTERFACE
    } IDownloadBehaviorVtbl;

    interface IDownloadBehavior
    {
        CONST_VTBL struct IDownloadBehaviorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDownloadBehavior_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IDownloadBehavior_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IDownloadBehavior_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IDownloadBehavior_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IDownloadBehavior_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IDownloadBehavior_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IDownloadBehavior_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IDownloadBehavior_startDownload(This,bstrUrl,pdispCallback)	\
    ( (This)->lpVtbl -> startDownload(This,bstrUrl,pdispCallback) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IDownloadBehavior_INTERFACE_DEFINED__ */


#ifndef __ILayoutRect_INTERFACE_DEFINED__
#define __ILayoutRect_INTERFACE_DEFINED__

/* interface ILayoutRect */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_ILayoutRect;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f665-98b5-11cf-bb82-00aa00bdce0b")
    ILayoutRect : public IDispatch
    {
    public:
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_nextRect( 
            /* [in] */ __RPC__in BSTR bstrElementId) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nextRect( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstrElementId) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_contentSrc( 
            /* [in] */ VARIANT varContentSrc) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_contentSrc( 
            /* [out][retval] */ __RPC__out VARIANT *pvarContentSrc) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_honorPageBreaks( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_honorPageBreaks( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_honorPageRules( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_honorPageRules( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_nextRectElement( 
            /* [in] */ __RPC__in_opt IDispatch *pElem) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_nextRectElement( 
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **ppElem) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_contentDocument( 
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **pDoc) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ILayoutRectVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ILayoutRect * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ILayoutRect * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ILayoutRect * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ILayoutRect * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_nextRect )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ __RPC__in BSTR bstrElementId);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nextRect )( 
            __RPC__in ILayoutRect * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *pbstrElementId);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_contentSrc )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ VARIANT varContentSrc);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_contentSrc )( 
            __RPC__in ILayoutRect * This,
            /* [out][retval] */ __RPC__out VARIANT *pvarContentSrc);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_honorPageBreaks )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_honorPageBreaks )( 
            __RPC__in ILayoutRect * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_honorPageRules )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_honorPageRules )( 
            __RPC__in ILayoutRect * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_nextRectElement )( 
            __RPC__in ILayoutRect * This,
            /* [in] */ __RPC__in_opt IDispatch *pElem);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_nextRectElement )( 
            __RPC__in ILayoutRect * This,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **ppElem);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_contentDocument )( 
            __RPC__in ILayoutRect * This,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **pDoc);
        
        END_INTERFACE
    } ILayoutRectVtbl;

    interface ILayoutRect
    {
        CONST_VTBL struct ILayoutRectVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ILayoutRect_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ILayoutRect_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ILayoutRect_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ILayoutRect_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ILayoutRect_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ILayoutRect_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ILayoutRect_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ILayoutRect_put_nextRect(This,bstrElementId)	\
    ( (This)->lpVtbl -> put_nextRect(This,bstrElementId) ) 

#define ILayoutRect_get_nextRect(This,pbstrElementId)	\
    ( (This)->lpVtbl -> get_nextRect(This,pbstrElementId) ) 

#define ILayoutRect_put_contentSrc(This,varContentSrc)	\
    ( (This)->lpVtbl -> put_contentSrc(This,varContentSrc) ) 

#define ILayoutRect_get_contentSrc(This,pvarContentSrc)	\
    ( (This)->lpVtbl -> get_contentSrc(This,pvarContentSrc) ) 

#define ILayoutRect_put_honorPageBreaks(This,v)	\
    ( (This)->lpVtbl -> put_honorPageBreaks(This,v) ) 

#define ILayoutRect_get_honorPageBreaks(This,p)	\
    ( (This)->lpVtbl -> get_honorPageBreaks(This,p) ) 

#define ILayoutRect_put_honorPageRules(This,v)	\
    ( (This)->lpVtbl -> put_honorPageRules(This,v) ) 

#define ILayoutRect_get_honorPageRules(This,p)	\
    ( (This)->lpVtbl -> get_honorPageRules(This,p) ) 

#define ILayoutRect_put_nextRectElement(This,pElem)	\
    ( (This)->lpVtbl -> put_nextRectElement(This,pElem) ) 

#define ILayoutRect_get_nextRectElement(This,ppElem)	\
    ( (This)->lpVtbl -> get_nextRectElement(This,ppElem) ) 

#define ILayoutRect_get_contentDocument(This,pDoc)	\
    ( (This)->lpVtbl -> get_contentDocument(This,pDoc) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ILayoutRect_INTERFACE_DEFINED__ */


#ifndef __IDeviceRect_INTERFACE_DEFINED__
#define __IDeviceRect_INTERFACE_DEFINED__

/* interface IDeviceRect */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IDeviceRect;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f6d5-98b5-11cf-bb82-00aa00bdce0b")
    IDeviceRect : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IDeviceRectVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IDeviceRect * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IDeviceRect * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IDeviceRect * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IDeviceRect * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IDeviceRect * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IDeviceRect * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IDeviceRect * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IDeviceRectVtbl;

    interface IDeviceRect
    {
        CONST_VTBL struct IDeviceRectVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDeviceRect_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IDeviceRect_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IDeviceRect_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IDeviceRect_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IDeviceRect_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IDeviceRect_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IDeviceRect_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IDeviceRect_INTERFACE_DEFINED__ */


#ifndef __ITemplatePrinter_INTERFACE_DEFINED__
#define __ITemplatePrinter_INTERFACE_DEFINED__

/* interface ITemplatePrinter */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_ITemplatePrinter;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f6b4-98b5-11cf-bb82-00aa00bdce0b")
    ITemplatePrinter : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE startDoc( 
            /* [in] */ __RPC__in BSTR bstrTitle,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE stopDoc( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE printBlankPage( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE printPage( 
            /* [in] */ __RPC__in_opt IDispatch *pElemDisp) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE ensurePrintDialogDefaults( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE showPrintDialog( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE showPageSetupDialog( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE printNonNative( 
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE printNonNativeFrames( 
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [in] */ VARIANT_BOOL fActiveFrame) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_framesetDocument( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_framesetDocument( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_frameActive( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_frameActive( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_frameAsShown( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_frameAsShown( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_selection( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_selection( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_selectedPages( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_selectedPages( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_currentPage( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_currentPage( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_currentPageAvail( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_currentPageAvail( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_collate( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_collate( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_duplex( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_copies( 
            /* [in] */ WORD v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_copies( 
            /* [out][retval] */ __RPC__out WORD *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_pageFrom( 
            /* [in] */ WORD v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_pageFrom( 
            /* [out][retval] */ __RPC__out WORD *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_pageTo( 
            /* [in] */ WORD v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_pageTo( 
            /* [out][retval] */ __RPC__out WORD *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_tableOfLinks( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_tableOfLinks( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_allLinkedDocuments( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_allLinkedDocuments( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_header( 
            /* [in] */ __RPC__in BSTR bstrHeader) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_header( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrHeader) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_footer( 
            /* [in] */ __RPC__in BSTR bstrFooter) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_footer( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrFooter) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_marginLeft( 
            /* [in] */ long v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_marginLeft( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_marginRight( 
            /* [in] */ long v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_marginRight( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_marginTop( 
            /* [in] */ long v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_marginTop( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_marginBottom( 
            /* [in] */ long v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_marginBottom( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_pageWidth( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_pageHeight( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_unprintableLeft( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_unprintableTop( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_unprintableRight( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_unprintableBottom( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE updatePageStatus( 
            /* [in] */ __RPC__in long *p) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITemplatePrinterVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITemplatePrinter * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITemplatePrinter * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITemplatePrinter * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITemplatePrinter * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *startDoc )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in BSTR bstrTitle,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *stopDoc )( 
            __RPC__in ITemplatePrinter * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printBlankPage )( 
            __RPC__in ITemplatePrinter * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printPage )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in_opt IDispatch *pElemDisp);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ensurePrintDialogDefaults )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *showPrintDialog )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *showPageSetupDialog )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printNonNative )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printNonNativeFrames )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [in] */ VARIANT_BOOL fActiveFrame);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_framesetDocument )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_framesetDocument )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameActive )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameActive )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameAsShown )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameAsShown )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selection )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selection )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selectedPages )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selectedPages )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_currentPage )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentPage )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_currentPageAvail )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentPageAvail )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_collate )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_collate )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_duplex )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_copies )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copies )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageFrom )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageFrom )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageTo )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageTo )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_tableOfLinks )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_tableOfLinks )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_allLinkedDocuments )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_allLinkedDocuments )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_header )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in BSTR bstrHeader);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_header )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrHeader);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_footer )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in BSTR bstrFooter);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_footer )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrFooter);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginLeft )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginLeft )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginRight )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginRight )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginTop )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginTop )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginBottom )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginBottom )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageWidth )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageHeight )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableLeft )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableTop )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableRight )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableBottom )( 
            __RPC__in ITemplatePrinter * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *updatePageStatus )( 
            __RPC__in ITemplatePrinter * This,
            /* [in] */ __RPC__in long *p);
        
        END_INTERFACE
    } ITemplatePrinterVtbl;

    interface ITemplatePrinter
    {
        CONST_VTBL struct ITemplatePrinterVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITemplatePrinter_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITemplatePrinter_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITemplatePrinter_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITemplatePrinter_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITemplatePrinter_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITemplatePrinter_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITemplatePrinter_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITemplatePrinter_startDoc(This,bstrTitle,p)	\
    ( (This)->lpVtbl -> startDoc(This,bstrTitle,p) ) 

#define ITemplatePrinter_stopDoc(This)	\
    ( (This)->lpVtbl -> stopDoc(This) ) 

#define ITemplatePrinter_printBlankPage(This)	\
    ( (This)->lpVtbl -> printBlankPage(This) ) 

#define ITemplatePrinter_printPage(This,pElemDisp)	\
    ( (This)->lpVtbl -> printPage(This,pElemDisp) ) 

#define ITemplatePrinter_ensurePrintDialogDefaults(This,p)	\
    ( (This)->lpVtbl -> ensurePrintDialogDefaults(This,p) ) 

#define ITemplatePrinter_showPrintDialog(This,p)	\
    ( (This)->lpVtbl -> showPrintDialog(This,p) ) 

#define ITemplatePrinter_showPageSetupDialog(This,p)	\
    ( (This)->lpVtbl -> showPageSetupDialog(This,p) ) 

#define ITemplatePrinter_printNonNative(This,pMarkup,p)	\
    ( (This)->lpVtbl -> printNonNative(This,pMarkup,p) ) 

#define ITemplatePrinter_printNonNativeFrames(This,pMarkup,fActiveFrame)	\
    ( (This)->lpVtbl -> printNonNativeFrames(This,pMarkup,fActiveFrame) ) 

#define ITemplatePrinter_put_framesetDocument(This,v)	\
    ( (This)->lpVtbl -> put_framesetDocument(This,v) ) 

#define ITemplatePrinter_get_framesetDocument(This,p)	\
    ( (This)->lpVtbl -> get_framesetDocument(This,p) ) 

#define ITemplatePrinter_put_frameActive(This,v)	\
    ( (This)->lpVtbl -> put_frameActive(This,v) ) 

#define ITemplatePrinter_get_frameActive(This,p)	\
    ( (This)->lpVtbl -> get_frameActive(This,p) ) 

#define ITemplatePrinter_put_frameAsShown(This,v)	\
    ( (This)->lpVtbl -> put_frameAsShown(This,v) ) 

#define ITemplatePrinter_get_frameAsShown(This,p)	\
    ( (This)->lpVtbl -> get_frameAsShown(This,p) ) 

#define ITemplatePrinter_put_selection(This,v)	\
    ( (This)->lpVtbl -> put_selection(This,v) ) 

#define ITemplatePrinter_get_selection(This,p)	\
    ( (This)->lpVtbl -> get_selection(This,p) ) 

#define ITemplatePrinter_put_selectedPages(This,v)	\
    ( (This)->lpVtbl -> put_selectedPages(This,v) ) 

#define ITemplatePrinter_get_selectedPages(This,p)	\
    ( (This)->lpVtbl -> get_selectedPages(This,p) ) 

#define ITemplatePrinter_put_currentPage(This,v)	\
    ( (This)->lpVtbl -> put_currentPage(This,v) ) 

#define ITemplatePrinter_get_currentPage(This,p)	\
    ( (This)->lpVtbl -> get_currentPage(This,p) ) 

#define ITemplatePrinter_put_currentPageAvail(This,v)	\
    ( (This)->lpVtbl -> put_currentPageAvail(This,v) ) 

#define ITemplatePrinter_get_currentPageAvail(This,p)	\
    ( (This)->lpVtbl -> get_currentPageAvail(This,p) ) 

#define ITemplatePrinter_put_collate(This,v)	\
    ( (This)->lpVtbl -> put_collate(This,v) ) 

#define ITemplatePrinter_get_collate(This,p)	\
    ( (This)->lpVtbl -> get_collate(This,p) ) 

#define ITemplatePrinter_get_duplex(This,p)	\
    ( (This)->lpVtbl -> get_duplex(This,p) ) 

#define ITemplatePrinter_put_copies(This,v)	\
    ( (This)->lpVtbl -> put_copies(This,v) ) 

#define ITemplatePrinter_get_copies(This,p)	\
    ( (This)->lpVtbl -> get_copies(This,p) ) 

#define ITemplatePrinter_put_pageFrom(This,v)	\
    ( (This)->lpVtbl -> put_pageFrom(This,v) ) 

#define ITemplatePrinter_get_pageFrom(This,p)	\
    ( (This)->lpVtbl -> get_pageFrom(This,p) ) 

#define ITemplatePrinter_put_pageTo(This,v)	\
    ( (This)->lpVtbl -> put_pageTo(This,v) ) 

#define ITemplatePrinter_get_pageTo(This,p)	\
    ( (This)->lpVtbl -> get_pageTo(This,p) ) 

#define ITemplatePrinter_put_tableOfLinks(This,v)	\
    ( (This)->lpVtbl -> put_tableOfLinks(This,v) ) 

#define ITemplatePrinter_get_tableOfLinks(This,p)	\
    ( (This)->lpVtbl -> get_tableOfLinks(This,p) ) 

#define ITemplatePrinter_put_allLinkedDocuments(This,v)	\
    ( (This)->lpVtbl -> put_allLinkedDocuments(This,v) ) 

#define ITemplatePrinter_get_allLinkedDocuments(This,p)	\
    ( (This)->lpVtbl -> get_allLinkedDocuments(This,p) ) 

#define ITemplatePrinter_put_header(This,bstrHeader)	\
    ( (This)->lpVtbl -> put_header(This,bstrHeader) ) 

#define ITemplatePrinter_get_header(This,bstrHeader)	\
    ( (This)->lpVtbl -> get_header(This,bstrHeader) ) 

#define ITemplatePrinter_put_footer(This,bstrFooter)	\
    ( (This)->lpVtbl -> put_footer(This,bstrFooter) ) 

#define ITemplatePrinter_get_footer(This,bstrFooter)	\
    ( (This)->lpVtbl -> get_footer(This,bstrFooter) ) 

#define ITemplatePrinter_put_marginLeft(This,v)	\
    ( (This)->lpVtbl -> put_marginLeft(This,v) ) 

#define ITemplatePrinter_get_marginLeft(This,p)	\
    ( (This)->lpVtbl -> get_marginLeft(This,p) ) 

#define ITemplatePrinter_put_marginRight(This,v)	\
    ( (This)->lpVtbl -> put_marginRight(This,v) ) 

#define ITemplatePrinter_get_marginRight(This,p)	\
    ( (This)->lpVtbl -> get_marginRight(This,p) ) 

#define ITemplatePrinter_put_marginTop(This,v)	\
    ( (This)->lpVtbl -> put_marginTop(This,v) ) 

#define ITemplatePrinter_get_marginTop(This,p)	\
    ( (This)->lpVtbl -> get_marginTop(This,p) ) 

#define ITemplatePrinter_put_marginBottom(This,v)	\
    ( (This)->lpVtbl -> put_marginBottom(This,v) ) 

#define ITemplatePrinter_get_marginBottom(This,p)	\
    ( (This)->lpVtbl -> get_marginBottom(This,p) ) 

#define ITemplatePrinter_get_pageWidth(This,p)	\
    ( (This)->lpVtbl -> get_pageWidth(This,p) ) 

#define ITemplatePrinter_get_pageHeight(This,p)	\
    ( (This)->lpVtbl -> get_pageHeight(This,p) ) 

#define ITemplatePrinter_get_unprintableLeft(This,p)	\
    ( (This)->lpVtbl -> get_unprintableLeft(This,p) ) 

#define ITemplatePrinter_get_unprintableTop(This,p)	\
    ( (This)->lpVtbl -> get_unprintableTop(This,p) ) 

#define ITemplatePrinter_get_unprintableRight(This,p)	\
    ( (This)->lpVtbl -> get_unprintableRight(This,p) ) 

#define ITemplatePrinter_get_unprintableBottom(This,p)	\
    ( (This)->lpVtbl -> get_unprintableBottom(This,p) ) 

#define ITemplatePrinter_updatePageStatus(This,p)	\
    ( (This)->lpVtbl -> updatePageStatus(This,p) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITemplatePrinter_INTERFACE_DEFINED__ */


#ifndef __ITemplatePrinter2_INTERFACE_DEFINED__
#define __ITemplatePrinter2_INTERFACE_DEFINED__

/* interface ITemplatePrinter2 */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_ITemplatePrinter2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f83f-98b5-11cf-bb82-00aa00bdce0b")
    ITemplatePrinter2 : public ITemplatePrinter
    {
    public:
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_selectionEnabled( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_selectionEnabled( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_frameActiveEnabled( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_frameActiveEnabled( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_orientation( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_orientation( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_usePrinterCopyCollate( 
            /* [in] */ VARIANT_BOOL v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_usePrinterCopyCollate( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE deviceSupports( 
            /* [in] */ __RPC__in BSTR bstrProperty,
            /* [out][retval] */ __RPC__out VARIANT *pvar) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITemplatePrinter2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITemplatePrinter2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITemplatePrinter2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITemplatePrinter2 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *startDoc )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in BSTR bstrTitle,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *stopDoc )( 
            __RPC__in ITemplatePrinter2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printBlankPage )( 
            __RPC__in ITemplatePrinter2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printPage )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in_opt IDispatch *pElemDisp);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ensurePrintDialogDefaults )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *showPrintDialog )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *showPageSetupDialog )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printNonNative )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printNonNativeFrames )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [in] */ VARIANT_BOOL fActiveFrame);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_framesetDocument )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_framesetDocument )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameActive )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameActive )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameAsShown )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameAsShown )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selection )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selection )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selectedPages )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selectedPages )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_currentPage )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentPage )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_currentPageAvail )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentPageAvail )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_collate )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_collate )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_duplex )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_copies )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copies )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageFrom )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageFrom )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageTo )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageTo )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_tableOfLinks )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_tableOfLinks )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_allLinkedDocuments )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_allLinkedDocuments )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_header )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in BSTR bstrHeader);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_header )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrHeader);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_footer )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in BSTR bstrFooter);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_footer )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrFooter);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginLeft )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginLeft )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginRight )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginRight )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginTop )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginTop )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginBottom )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginBottom )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageWidth )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageHeight )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableLeft )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableTop )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableRight )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableBottom )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *updatePageStatus )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selectionEnabled )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selectionEnabled )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameActiveEnabled )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameActiveEnabled )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_orientation )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_orientation )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_usePrinterCopyCollate )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_usePrinterCopyCollate )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *deviceSupports )( 
            __RPC__in ITemplatePrinter2 * This,
            /* [in] */ __RPC__in BSTR bstrProperty,
            /* [out][retval] */ __RPC__out VARIANT *pvar);
        
        END_INTERFACE
    } ITemplatePrinter2Vtbl;

    interface ITemplatePrinter2
    {
        CONST_VTBL struct ITemplatePrinter2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITemplatePrinter2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITemplatePrinter2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITemplatePrinter2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITemplatePrinter2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITemplatePrinter2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITemplatePrinter2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITemplatePrinter2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITemplatePrinter2_startDoc(This,bstrTitle,p)	\
    ( (This)->lpVtbl -> startDoc(This,bstrTitle,p) ) 

#define ITemplatePrinter2_stopDoc(This)	\
    ( (This)->lpVtbl -> stopDoc(This) ) 

#define ITemplatePrinter2_printBlankPage(This)	\
    ( (This)->lpVtbl -> printBlankPage(This) ) 

#define ITemplatePrinter2_printPage(This,pElemDisp)	\
    ( (This)->lpVtbl -> printPage(This,pElemDisp) ) 

#define ITemplatePrinter2_ensurePrintDialogDefaults(This,p)	\
    ( (This)->lpVtbl -> ensurePrintDialogDefaults(This,p) ) 

#define ITemplatePrinter2_showPrintDialog(This,p)	\
    ( (This)->lpVtbl -> showPrintDialog(This,p) ) 

#define ITemplatePrinter2_showPageSetupDialog(This,p)	\
    ( (This)->lpVtbl -> showPageSetupDialog(This,p) ) 

#define ITemplatePrinter2_printNonNative(This,pMarkup,p)	\
    ( (This)->lpVtbl -> printNonNative(This,pMarkup,p) ) 

#define ITemplatePrinter2_printNonNativeFrames(This,pMarkup,fActiveFrame)	\
    ( (This)->lpVtbl -> printNonNativeFrames(This,pMarkup,fActiveFrame) ) 

#define ITemplatePrinter2_put_framesetDocument(This,v)	\
    ( (This)->lpVtbl -> put_framesetDocument(This,v) ) 

#define ITemplatePrinter2_get_framesetDocument(This,p)	\
    ( (This)->lpVtbl -> get_framesetDocument(This,p) ) 

#define ITemplatePrinter2_put_frameActive(This,v)	\
    ( (This)->lpVtbl -> put_frameActive(This,v) ) 

#define ITemplatePrinter2_get_frameActive(This,p)	\
    ( (This)->lpVtbl -> get_frameActive(This,p) ) 

#define ITemplatePrinter2_put_frameAsShown(This,v)	\
    ( (This)->lpVtbl -> put_frameAsShown(This,v) ) 

#define ITemplatePrinter2_get_frameAsShown(This,p)	\
    ( (This)->lpVtbl -> get_frameAsShown(This,p) ) 

#define ITemplatePrinter2_put_selection(This,v)	\
    ( (This)->lpVtbl -> put_selection(This,v) ) 

#define ITemplatePrinter2_get_selection(This,p)	\
    ( (This)->lpVtbl -> get_selection(This,p) ) 

#define ITemplatePrinter2_put_selectedPages(This,v)	\
    ( (This)->lpVtbl -> put_selectedPages(This,v) ) 

#define ITemplatePrinter2_get_selectedPages(This,p)	\
    ( (This)->lpVtbl -> get_selectedPages(This,p) ) 

#define ITemplatePrinter2_put_currentPage(This,v)	\
    ( (This)->lpVtbl -> put_currentPage(This,v) ) 

#define ITemplatePrinter2_get_currentPage(This,p)	\
    ( (This)->lpVtbl -> get_currentPage(This,p) ) 

#define ITemplatePrinter2_put_currentPageAvail(This,v)	\
    ( (This)->lpVtbl -> put_currentPageAvail(This,v) ) 

#define ITemplatePrinter2_get_currentPageAvail(This,p)	\
    ( (This)->lpVtbl -> get_currentPageAvail(This,p) ) 

#define ITemplatePrinter2_put_collate(This,v)	\
    ( (This)->lpVtbl -> put_collate(This,v) ) 

#define ITemplatePrinter2_get_collate(This,p)	\
    ( (This)->lpVtbl -> get_collate(This,p) ) 

#define ITemplatePrinter2_get_duplex(This,p)	\
    ( (This)->lpVtbl -> get_duplex(This,p) ) 

#define ITemplatePrinter2_put_copies(This,v)	\
    ( (This)->lpVtbl -> put_copies(This,v) ) 

#define ITemplatePrinter2_get_copies(This,p)	\
    ( (This)->lpVtbl -> get_copies(This,p) ) 

#define ITemplatePrinter2_put_pageFrom(This,v)	\
    ( (This)->lpVtbl -> put_pageFrom(This,v) ) 

#define ITemplatePrinter2_get_pageFrom(This,p)	\
    ( (This)->lpVtbl -> get_pageFrom(This,p) ) 

#define ITemplatePrinter2_put_pageTo(This,v)	\
    ( (This)->lpVtbl -> put_pageTo(This,v) ) 

#define ITemplatePrinter2_get_pageTo(This,p)	\
    ( (This)->lpVtbl -> get_pageTo(This,p) ) 

#define ITemplatePrinter2_put_tableOfLinks(This,v)	\
    ( (This)->lpVtbl -> put_tableOfLinks(This,v) ) 

#define ITemplatePrinter2_get_tableOfLinks(This,p)	\
    ( (This)->lpVtbl -> get_tableOfLinks(This,p) ) 

#define ITemplatePrinter2_put_allLinkedDocuments(This,v)	\
    ( (This)->lpVtbl -> put_allLinkedDocuments(This,v) ) 

#define ITemplatePrinter2_get_allLinkedDocuments(This,p)	\
    ( (This)->lpVtbl -> get_allLinkedDocuments(This,p) ) 

#define ITemplatePrinter2_put_header(This,bstrHeader)	\
    ( (This)->lpVtbl -> put_header(This,bstrHeader) ) 

#define ITemplatePrinter2_get_header(This,bstrHeader)	\
    ( (This)->lpVtbl -> get_header(This,bstrHeader) ) 

#define ITemplatePrinter2_put_footer(This,bstrFooter)	\
    ( (This)->lpVtbl -> put_footer(This,bstrFooter) ) 

#define ITemplatePrinter2_get_footer(This,bstrFooter)	\
    ( (This)->lpVtbl -> get_footer(This,bstrFooter) ) 

#define ITemplatePrinter2_put_marginLeft(This,v)	\
    ( (This)->lpVtbl -> put_marginLeft(This,v) ) 

#define ITemplatePrinter2_get_marginLeft(This,p)	\
    ( (This)->lpVtbl -> get_marginLeft(This,p) ) 

#define ITemplatePrinter2_put_marginRight(This,v)	\
    ( (This)->lpVtbl -> put_marginRight(This,v) ) 

#define ITemplatePrinter2_get_marginRight(This,p)	\
    ( (This)->lpVtbl -> get_marginRight(This,p) ) 

#define ITemplatePrinter2_put_marginTop(This,v)	\
    ( (This)->lpVtbl -> put_marginTop(This,v) ) 

#define ITemplatePrinter2_get_marginTop(This,p)	\
    ( (This)->lpVtbl -> get_marginTop(This,p) ) 

#define ITemplatePrinter2_put_marginBottom(This,v)	\
    ( (This)->lpVtbl -> put_marginBottom(This,v) ) 

#define ITemplatePrinter2_get_marginBottom(This,p)	\
    ( (This)->lpVtbl -> get_marginBottom(This,p) ) 

#define ITemplatePrinter2_get_pageWidth(This,p)	\
    ( (This)->lpVtbl -> get_pageWidth(This,p) ) 

#define ITemplatePrinter2_get_pageHeight(This,p)	\
    ( (This)->lpVtbl -> get_pageHeight(This,p) ) 

#define ITemplatePrinter2_get_unprintableLeft(This,p)	\
    ( (This)->lpVtbl -> get_unprintableLeft(This,p) ) 

#define ITemplatePrinter2_get_unprintableTop(This,p)	\
    ( (This)->lpVtbl -> get_unprintableTop(This,p) ) 

#define ITemplatePrinter2_get_unprintableRight(This,p)	\
    ( (This)->lpVtbl -> get_unprintableRight(This,p) ) 

#define ITemplatePrinter2_get_unprintableBottom(This,p)	\
    ( (This)->lpVtbl -> get_unprintableBottom(This,p) ) 

#define ITemplatePrinter2_updatePageStatus(This,p)	\
    ( (This)->lpVtbl -> updatePageStatus(This,p) ) 


#define ITemplatePrinter2_put_selectionEnabled(This,v)	\
    ( (This)->lpVtbl -> put_selectionEnabled(This,v) ) 

#define ITemplatePrinter2_get_selectionEnabled(This,p)	\
    ( (This)->lpVtbl -> get_selectionEnabled(This,p) ) 

#define ITemplatePrinter2_put_frameActiveEnabled(This,v)	\
    ( (This)->lpVtbl -> put_frameActiveEnabled(This,v) ) 

#define ITemplatePrinter2_get_frameActiveEnabled(This,p)	\
    ( (This)->lpVtbl -> get_frameActiveEnabled(This,p) ) 

#define ITemplatePrinter2_put_orientation(This,v)	\
    ( (This)->lpVtbl -> put_orientation(This,v) ) 

#define ITemplatePrinter2_get_orientation(This,p)	\
    ( (This)->lpVtbl -> get_orientation(This,p) ) 

#define ITemplatePrinter2_put_usePrinterCopyCollate(This,v)	\
    ( (This)->lpVtbl -> put_usePrinterCopyCollate(This,v) ) 

#define ITemplatePrinter2_get_usePrinterCopyCollate(This,p)	\
    ( (This)->lpVtbl -> get_usePrinterCopyCollate(This,p) ) 

#define ITemplatePrinter2_deviceSupports(This,bstrProperty,pvar)	\
    ( (This)->lpVtbl -> deviceSupports(This,bstrProperty,pvar) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITemplatePrinter2_INTERFACE_DEFINED__ */


#ifndef __ITemplatePrinter3_INTERFACE_DEFINED__
#define __ITemplatePrinter3_INTERFACE_DEFINED__

/* interface ITemplatePrinter3 */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_ITemplatePrinter3;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("305104a3-98b5-11cf-bb82-00aa00bdce0b")
    ITemplatePrinter3 : public ITemplatePrinter2
    {
    public:
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_headerFooterFont( 
            /* [in] */ __RPC__in BSTR bstrFooter) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_headerFooterFont( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrFooter) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginTop( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginRight( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginBottom( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginLeft( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginTopImportant( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginRightImportant( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginBottomImportant( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getPageMarginLeftImportant( 
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITemplatePrinter3Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITemplatePrinter3 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITemplatePrinter3 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITemplatePrinter3 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *startDoc )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in BSTR bstrTitle,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *stopDoc )( 
            __RPC__in ITemplatePrinter3 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printBlankPage )( 
            __RPC__in ITemplatePrinter3 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printPage )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pElemDisp);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *ensurePrintDialogDefaults )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *showPrintDialog )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *showPageSetupDialog )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printNonNative )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *printNonNativeFrames )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IUnknown *pMarkup,
            /* [in] */ VARIANT_BOOL fActiveFrame);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_framesetDocument )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_framesetDocument )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameActive )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameActive )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameAsShown )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameAsShown )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selection )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selection )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selectedPages )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selectedPages )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_currentPage )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentPage )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_currentPageAvail )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentPageAvail )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_collate )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_collate )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_duplex )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_copies )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copies )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageFrom )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageFrom )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageTo )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ WORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageTo )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out WORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_tableOfLinks )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_tableOfLinks )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_allLinkedDocuments )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_allLinkedDocuments )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_header )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in BSTR bstrHeader);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_header )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrHeader);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_footer )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in BSTR bstrFooter);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_footer )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrFooter);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginLeft )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginLeft )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginRight )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginRight )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginTop )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginTop )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_marginBottom )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_marginBottom )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageWidth )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageHeight )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableLeft )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableTop )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableRight )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_unprintableBottom )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *updatePageStatus )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in long *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_selectionEnabled )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_selectionEnabled )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_frameActiveEnabled )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_frameActiveEnabled )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_orientation )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_orientation )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_usePrinterCopyCollate )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ VARIANT_BOOL v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_usePrinterCopyCollate )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *deviceSupports )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in BSTR bstrProperty,
            /* [out][retval] */ __RPC__out VARIANT *pvar);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_headerFooterFont )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in BSTR bstrFooter);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_headerFooterFont )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *bstrFooter);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginTop )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginRight )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginBottom )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginLeft )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [in] */ long pageWidth,
            /* [in] */ long pageHeight,
            /* [retval][out] */ __RPC__out VARIANT *pMargin);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginTopImportant )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginRightImportant )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginBottomImportant )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getPageMarginLeftImportant )( 
            __RPC__in ITemplatePrinter3 * This,
            /* [in] */ __RPC__in_opt IDispatch *pageRule,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImportant);
        
        END_INTERFACE
    } ITemplatePrinter3Vtbl;

    interface ITemplatePrinter3
    {
        CONST_VTBL struct ITemplatePrinter3Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITemplatePrinter3_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITemplatePrinter3_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITemplatePrinter3_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITemplatePrinter3_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITemplatePrinter3_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITemplatePrinter3_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITemplatePrinter3_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITemplatePrinter3_startDoc(This,bstrTitle,p)	\
    ( (This)->lpVtbl -> startDoc(This,bstrTitle,p) ) 

#define ITemplatePrinter3_stopDoc(This)	\
    ( (This)->lpVtbl -> stopDoc(This) ) 

#define ITemplatePrinter3_printBlankPage(This)	\
    ( (This)->lpVtbl -> printBlankPage(This) ) 

#define ITemplatePrinter3_printPage(This,pElemDisp)	\
    ( (This)->lpVtbl -> printPage(This,pElemDisp) ) 

#define ITemplatePrinter3_ensurePrintDialogDefaults(This,p)	\
    ( (This)->lpVtbl -> ensurePrintDialogDefaults(This,p) ) 

#define ITemplatePrinter3_showPrintDialog(This,p)	\
    ( (This)->lpVtbl -> showPrintDialog(This,p) ) 

#define ITemplatePrinter3_showPageSetupDialog(This,p)	\
    ( (This)->lpVtbl -> showPageSetupDialog(This,p) ) 

#define ITemplatePrinter3_printNonNative(This,pMarkup,p)	\
    ( (This)->lpVtbl -> printNonNative(This,pMarkup,p) ) 

#define ITemplatePrinter3_printNonNativeFrames(This,pMarkup,fActiveFrame)	\
    ( (This)->lpVtbl -> printNonNativeFrames(This,pMarkup,fActiveFrame) ) 

#define ITemplatePrinter3_put_framesetDocument(This,v)	\
    ( (This)->lpVtbl -> put_framesetDocument(This,v) ) 

#define ITemplatePrinter3_get_framesetDocument(This,p)	\
    ( (This)->lpVtbl -> get_framesetDocument(This,p) ) 

#define ITemplatePrinter3_put_frameActive(This,v)	\
    ( (This)->lpVtbl -> put_frameActive(This,v) ) 

#define ITemplatePrinter3_get_frameActive(This,p)	\
    ( (This)->lpVtbl -> get_frameActive(This,p) ) 

#define ITemplatePrinter3_put_frameAsShown(This,v)	\
    ( (This)->lpVtbl -> put_frameAsShown(This,v) ) 

#define ITemplatePrinter3_get_frameAsShown(This,p)	\
    ( (This)->lpVtbl -> get_frameAsShown(This,p) ) 

#define ITemplatePrinter3_put_selection(This,v)	\
    ( (This)->lpVtbl -> put_selection(This,v) ) 

#define ITemplatePrinter3_get_selection(This,p)	\
    ( (This)->lpVtbl -> get_selection(This,p) ) 

#define ITemplatePrinter3_put_selectedPages(This,v)	\
    ( (This)->lpVtbl -> put_selectedPages(This,v) ) 

#define ITemplatePrinter3_get_selectedPages(This,p)	\
    ( (This)->lpVtbl -> get_selectedPages(This,p) ) 

#define ITemplatePrinter3_put_currentPage(This,v)	\
    ( (This)->lpVtbl -> put_currentPage(This,v) ) 

#define ITemplatePrinter3_get_currentPage(This,p)	\
    ( (This)->lpVtbl -> get_currentPage(This,p) ) 

#define ITemplatePrinter3_put_currentPageAvail(This,v)	\
    ( (This)->lpVtbl -> put_currentPageAvail(This,v) ) 

#define ITemplatePrinter3_get_currentPageAvail(This,p)	\
    ( (This)->lpVtbl -> get_currentPageAvail(This,p) ) 

#define ITemplatePrinter3_put_collate(This,v)	\
    ( (This)->lpVtbl -> put_collate(This,v) ) 

#define ITemplatePrinter3_get_collate(This,p)	\
    ( (This)->lpVtbl -> get_collate(This,p) ) 

#define ITemplatePrinter3_get_duplex(This,p)	\
    ( (This)->lpVtbl -> get_duplex(This,p) ) 

#define ITemplatePrinter3_put_copies(This,v)	\
    ( (This)->lpVtbl -> put_copies(This,v) ) 

#define ITemplatePrinter3_get_copies(This,p)	\
    ( (This)->lpVtbl -> get_copies(This,p) ) 

#define ITemplatePrinter3_put_pageFrom(This,v)	\
    ( (This)->lpVtbl -> put_pageFrom(This,v) ) 

#define ITemplatePrinter3_get_pageFrom(This,p)	\
    ( (This)->lpVtbl -> get_pageFrom(This,p) ) 

#define ITemplatePrinter3_put_pageTo(This,v)	\
    ( (This)->lpVtbl -> put_pageTo(This,v) ) 

#define ITemplatePrinter3_get_pageTo(This,p)	\
    ( (This)->lpVtbl -> get_pageTo(This,p) ) 

#define ITemplatePrinter3_put_tableOfLinks(This,v)	\
    ( (This)->lpVtbl -> put_tableOfLinks(This,v) ) 

#define ITemplatePrinter3_get_tableOfLinks(This,p)	\
    ( (This)->lpVtbl -> get_tableOfLinks(This,p) ) 

#define ITemplatePrinter3_put_allLinkedDocuments(This,v)	\
    ( (This)->lpVtbl -> put_allLinkedDocuments(This,v) ) 

#define ITemplatePrinter3_get_allLinkedDocuments(This,p)	\
    ( (This)->lpVtbl -> get_allLinkedDocuments(This,p) ) 

#define ITemplatePrinter3_put_header(This,bstrHeader)	\
    ( (This)->lpVtbl -> put_header(This,bstrHeader) ) 

#define ITemplatePrinter3_get_header(This,bstrHeader)	\
    ( (This)->lpVtbl -> get_header(This,bstrHeader) ) 

#define ITemplatePrinter3_put_footer(This,bstrFooter)	\
    ( (This)->lpVtbl -> put_footer(This,bstrFooter) ) 

#define ITemplatePrinter3_get_footer(This,bstrFooter)	\
    ( (This)->lpVtbl -> get_footer(This,bstrFooter) ) 

#define ITemplatePrinter3_put_marginLeft(This,v)	\
    ( (This)->lpVtbl -> put_marginLeft(This,v) ) 

#define ITemplatePrinter3_get_marginLeft(This,p)	\
    ( (This)->lpVtbl -> get_marginLeft(This,p) ) 

#define ITemplatePrinter3_put_marginRight(This,v)	\
    ( (This)->lpVtbl -> put_marginRight(This,v) ) 

#define ITemplatePrinter3_get_marginRight(This,p)	\
    ( (This)->lpVtbl -> get_marginRight(This,p) ) 

#define ITemplatePrinter3_put_marginTop(This,v)	\
    ( (This)->lpVtbl -> put_marginTop(This,v) ) 

#define ITemplatePrinter3_get_marginTop(This,p)	\
    ( (This)->lpVtbl -> get_marginTop(This,p) ) 

#define ITemplatePrinter3_put_marginBottom(This,v)	\
    ( (This)->lpVtbl -> put_marginBottom(This,v) ) 

#define ITemplatePrinter3_get_marginBottom(This,p)	\
    ( (This)->lpVtbl -> get_marginBottom(This,p) ) 

#define ITemplatePrinter3_get_pageWidth(This,p)	\
    ( (This)->lpVtbl -> get_pageWidth(This,p) ) 

#define ITemplatePrinter3_get_pageHeight(This,p)	\
    ( (This)->lpVtbl -> get_pageHeight(This,p) ) 

#define ITemplatePrinter3_get_unprintableLeft(This,p)	\
    ( (This)->lpVtbl -> get_unprintableLeft(This,p) ) 

#define ITemplatePrinter3_get_unprintableTop(This,p)	\
    ( (This)->lpVtbl -> get_unprintableTop(This,p) ) 

#define ITemplatePrinter3_get_unprintableRight(This,p)	\
    ( (This)->lpVtbl -> get_unprintableRight(This,p) ) 

#define ITemplatePrinter3_get_unprintableBottom(This,p)	\
    ( (This)->lpVtbl -> get_unprintableBottom(This,p) ) 

#define ITemplatePrinter3_updatePageStatus(This,p)	\
    ( (This)->lpVtbl -> updatePageStatus(This,p) ) 


#define ITemplatePrinter3_put_selectionEnabled(This,v)	\
    ( (This)->lpVtbl -> put_selectionEnabled(This,v) ) 

#define ITemplatePrinter3_get_selectionEnabled(This,p)	\
    ( (This)->lpVtbl -> get_selectionEnabled(This,p) ) 

#define ITemplatePrinter3_put_frameActiveEnabled(This,v)	\
    ( (This)->lpVtbl -> put_frameActiveEnabled(This,v) ) 

#define ITemplatePrinter3_get_frameActiveEnabled(This,p)	\
    ( (This)->lpVtbl -> get_frameActiveEnabled(This,p) ) 

#define ITemplatePrinter3_put_orientation(This,v)	\
    ( (This)->lpVtbl -> put_orientation(This,v) ) 

#define ITemplatePrinter3_get_orientation(This,p)	\
    ( (This)->lpVtbl -> get_orientation(This,p) ) 

#define ITemplatePrinter3_put_usePrinterCopyCollate(This,v)	\
    ( (This)->lpVtbl -> put_usePrinterCopyCollate(This,v) ) 

#define ITemplatePrinter3_get_usePrinterCopyCollate(This,p)	\
    ( (This)->lpVtbl -> get_usePrinterCopyCollate(This,p) ) 

#define ITemplatePrinter3_deviceSupports(This,bstrProperty,pvar)	\
    ( (This)->lpVtbl -> deviceSupports(This,bstrProperty,pvar) ) 


#define ITemplatePrinter3_put_headerFooterFont(This,bstrFooter)	\
    ( (This)->lpVtbl -> put_headerFooterFont(This,bstrFooter) ) 

#define ITemplatePrinter3_get_headerFooterFont(This,bstrFooter)	\
    ( (This)->lpVtbl -> get_headerFooterFont(This,bstrFooter) ) 

#define ITemplatePrinter3_getPageMarginTop(This,pageRule,pageWidth,pageHeight,pMargin)	\
    ( (This)->lpVtbl -> getPageMarginTop(This,pageRule,pageWidth,pageHeight,pMargin) ) 

#define ITemplatePrinter3_getPageMarginRight(This,pageRule,pageWidth,pageHeight,pMargin)	\
    ( (This)->lpVtbl -> getPageMarginRight(This,pageRule,pageWidth,pageHeight,pMargin) ) 

#define ITemplatePrinter3_getPageMarginBottom(This,pageRule,pageWidth,pageHeight,pMargin)	\
    ( (This)->lpVtbl -> getPageMarginBottom(This,pageRule,pageWidth,pageHeight,pMargin) ) 

#define ITemplatePrinter3_getPageMarginLeft(This,pageRule,pageWidth,pageHeight,pMargin)	\
    ( (This)->lpVtbl -> getPageMarginLeft(This,pageRule,pageWidth,pageHeight,pMargin) ) 

#define ITemplatePrinter3_getPageMarginTopImportant(This,pageRule,pbImportant)	\
    ( (This)->lpVtbl -> getPageMarginTopImportant(This,pageRule,pbImportant) ) 

#define ITemplatePrinter3_getPageMarginRightImportant(This,pageRule,pbImportant)	\
    ( (This)->lpVtbl -> getPageMarginRightImportant(This,pageRule,pbImportant) ) 

#define ITemplatePrinter3_getPageMarginBottomImportant(This,pageRule,pbImportant)	\
    ( (This)->lpVtbl -> getPageMarginBottomImportant(This,pageRule,pbImportant) ) 

#define ITemplatePrinter3_getPageMarginLeftImportant(This,pageRule,pbImportant)	\
    ( (This)->lpVtbl -> getPageMarginLeftImportant(This,pageRule,pbImportant) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITemplatePrinter3_INTERFACE_DEFINED__ */


#ifndef __IHeaderFooter_INTERFACE_DEFINED__
#define __IHeaderFooter_INTERFACE_DEFINED__

/* interface IHeaderFooter */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IHeaderFooter;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3050f6ce-98b5-11cf-bb82-00aa00bdce0b")
    IHeaderFooter : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_htmlHead( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_htmlFoot( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_textHead( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_textHead( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_textFoot( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_textFoot( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_page( 
            /* [in] */ DWORD v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_page( 
            /* [out][retval] */ __RPC__out DWORD *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_pageTotal( 
            /* [in] */ DWORD v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_pageTotal( 
            /* [out][retval] */ __RPC__out DWORD *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_URL( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_URL( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_title( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_title( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_dateShort( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_dateShort( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_dateLong( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_dateLong( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_timeShort( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeShort( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_timeLong( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeLong( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHeaderFooterVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IHeaderFooter * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IHeaderFooter * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IHeaderFooter * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IHeaderFooter * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_htmlHead )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_htmlFoot )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_textHead )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_textHead )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_textFoot )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_textFoot )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_page )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ DWORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_page )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__out DWORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageTotal )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ DWORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageTotal )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__out DWORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_URL )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_URL )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_title )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dateShort )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dateShort )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dateLong )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dateLong )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeShort )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeShort )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeLong )( 
            __RPC__in IHeaderFooter * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeLong )( 
            __RPC__in IHeaderFooter * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        END_INTERFACE
    } IHeaderFooterVtbl;

    interface IHeaderFooter
    {
        CONST_VTBL struct IHeaderFooterVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHeaderFooter_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHeaderFooter_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHeaderFooter_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHeaderFooter_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IHeaderFooter_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IHeaderFooter_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IHeaderFooter_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IHeaderFooter_get_htmlHead(This,p)	\
    ( (This)->lpVtbl -> get_htmlHead(This,p) ) 

#define IHeaderFooter_get_htmlFoot(This,p)	\
    ( (This)->lpVtbl -> get_htmlFoot(This,p) ) 

#define IHeaderFooter_put_textHead(This,v)	\
    ( (This)->lpVtbl -> put_textHead(This,v) ) 

#define IHeaderFooter_get_textHead(This,p)	\
    ( (This)->lpVtbl -> get_textHead(This,p) ) 

#define IHeaderFooter_put_textFoot(This,v)	\
    ( (This)->lpVtbl -> put_textFoot(This,v) ) 

#define IHeaderFooter_get_textFoot(This,p)	\
    ( (This)->lpVtbl -> get_textFoot(This,p) ) 

#define IHeaderFooter_put_page(This,v)	\
    ( (This)->lpVtbl -> put_page(This,v) ) 

#define IHeaderFooter_get_page(This,p)	\
    ( (This)->lpVtbl -> get_page(This,p) ) 

#define IHeaderFooter_put_pageTotal(This,v)	\
    ( (This)->lpVtbl -> put_pageTotal(This,v) ) 

#define IHeaderFooter_get_pageTotal(This,p)	\
    ( (This)->lpVtbl -> get_pageTotal(This,p) ) 

#define IHeaderFooter_put_URL(This,v)	\
    ( (This)->lpVtbl -> put_URL(This,v) ) 

#define IHeaderFooter_get_URL(This,p)	\
    ( (This)->lpVtbl -> get_URL(This,p) ) 

#define IHeaderFooter_put_title(This,v)	\
    ( (This)->lpVtbl -> put_title(This,v) ) 

#define IHeaderFooter_get_title(This,p)	\
    ( (This)->lpVtbl -> get_title(This,p) ) 

#define IHeaderFooter_put_dateShort(This,v)	\
    ( (This)->lpVtbl -> put_dateShort(This,v) ) 

#define IHeaderFooter_get_dateShort(This,p)	\
    ( (This)->lpVtbl -> get_dateShort(This,p) ) 

#define IHeaderFooter_put_dateLong(This,v)	\
    ( (This)->lpVtbl -> put_dateLong(This,v) ) 

#define IHeaderFooter_get_dateLong(This,p)	\
    ( (This)->lpVtbl -> get_dateLong(This,p) ) 

#define IHeaderFooter_put_timeShort(This,v)	\
    ( (This)->lpVtbl -> put_timeShort(This,v) ) 

#define IHeaderFooter_get_timeShort(This,p)	\
    ( (This)->lpVtbl -> get_timeShort(This,p) ) 

#define IHeaderFooter_put_timeLong(This,v)	\
    ( (This)->lpVtbl -> put_timeLong(This,v) ) 

#define IHeaderFooter_get_timeLong(This,p)	\
    ( (This)->lpVtbl -> get_timeLong(This,p) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHeaderFooter_INTERFACE_DEFINED__ */


#ifndef __IHeaderFooter2_INTERFACE_DEFINED__
#define __IHeaderFooter2_INTERFACE_DEFINED__

/* interface IHeaderFooter2 */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_IHeaderFooter2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("305104a5-98b5-11cf-bb82-00aa00bdce0b")
    IHeaderFooter2 : public IHeaderFooter
    {
    public:
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_font( 
            /* [in] */ __RPC__in BSTR v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_font( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IHeaderFooter2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IHeaderFooter2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IHeaderFooter2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IHeaderFooter2 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_htmlHead )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_htmlFoot )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_textHead )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_textHead )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_textFoot )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_textFoot )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_page )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ DWORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_page )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__out DWORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_pageTotal )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ DWORD v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_pageTotal )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__out DWORD *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_URL )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_URL )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_title )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dateShort )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dateShort )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dateLong )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dateLong )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeShort )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeShort )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeLong )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeLong )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_font )( 
            __RPC__in IHeaderFooter2 * This,
            /* [in] */ __RPC__in BSTR v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_font )( 
            __RPC__in IHeaderFooter2 * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *p);
        
        END_INTERFACE
    } IHeaderFooter2Vtbl;

    interface IHeaderFooter2
    {
        CONST_VTBL struct IHeaderFooter2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IHeaderFooter2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IHeaderFooter2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IHeaderFooter2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IHeaderFooter2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IHeaderFooter2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IHeaderFooter2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IHeaderFooter2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IHeaderFooter2_get_htmlHead(This,p)	\
    ( (This)->lpVtbl -> get_htmlHead(This,p) ) 

#define IHeaderFooter2_get_htmlFoot(This,p)	\
    ( (This)->lpVtbl -> get_htmlFoot(This,p) ) 

#define IHeaderFooter2_put_textHead(This,v)	\
    ( (This)->lpVtbl -> put_textHead(This,v) ) 

#define IHeaderFooter2_get_textHead(This,p)	\
    ( (This)->lpVtbl -> get_textHead(This,p) ) 

#define IHeaderFooter2_put_textFoot(This,v)	\
    ( (This)->lpVtbl -> put_textFoot(This,v) ) 

#define IHeaderFooter2_get_textFoot(This,p)	\
    ( (This)->lpVtbl -> get_textFoot(This,p) ) 

#define IHeaderFooter2_put_page(This,v)	\
    ( (This)->lpVtbl -> put_page(This,v) ) 

#define IHeaderFooter2_get_page(This,p)	\
    ( (This)->lpVtbl -> get_page(This,p) ) 

#define IHeaderFooter2_put_pageTotal(This,v)	\
    ( (This)->lpVtbl -> put_pageTotal(This,v) ) 

#define IHeaderFooter2_get_pageTotal(This,p)	\
    ( (This)->lpVtbl -> get_pageTotal(This,p) ) 

#define IHeaderFooter2_put_URL(This,v)	\
    ( (This)->lpVtbl -> put_URL(This,v) ) 

#define IHeaderFooter2_get_URL(This,p)	\
    ( (This)->lpVtbl -> get_URL(This,p) ) 

#define IHeaderFooter2_put_title(This,v)	\
    ( (This)->lpVtbl -> put_title(This,v) ) 

#define IHeaderFooter2_get_title(This,p)	\
    ( (This)->lpVtbl -> get_title(This,p) ) 

#define IHeaderFooter2_put_dateShort(This,v)	\
    ( (This)->lpVtbl -> put_dateShort(This,v) ) 

#define IHeaderFooter2_get_dateShort(This,p)	\
    ( (This)->lpVtbl -> get_dateShort(This,p) ) 

#define IHeaderFooter2_put_dateLong(This,v)	\
    ( (This)->lpVtbl -> put_dateLong(This,v) ) 

#define IHeaderFooter2_get_dateLong(This,p)	\
    ( (This)->lpVtbl -> get_dateLong(This,p) ) 

#define IHeaderFooter2_put_timeShort(This,v)	\
    ( (This)->lpVtbl -> put_timeShort(This,v) ) 

#define IHeaderFooter2_get_timeShort(This,p)	\
    ( (This)->lpVtbl -> get_timeShort(This,p) ) 

#define IHeaderFooter2_put_timeLong(This,v)	\
    ( (This)->lpVtbl -> put_timeLong(This,v) ) 

#define IHeaderFooter2_get_timeLong(This,p)	\
    ( (This)->lpVtbl -> get_timeLong(This,p) ) 


#define IHeaderFooter2_put_font(This,v)	\
    ( (This)->lpVtbl -> put_font(This,v) ) 

#define IHeaderFooter2_get_font(This,p)	\
    ( (This)->lpVtbl -> get_font(This,p) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IHeaderFooter2_INTERFACE_DEFINED__ */



#ifndef __IEXTagLib_LIBRARY_DEFINED__
#define __IEXTagLib_LIBRARY_DEFINED__

/* library IEXTagLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_IEXTagLib;

EXTERN_C const CLSID CLSID_PeerFactory;

#ifdef __cplusplus

class DECLSPEC_UUID("3050F4CF-98B5-11CF-BB82-00AA00BDCE0B")
PeerFactory;
#endif

EXTERN_C const CLSID CLSID_ClientCaps;

#ifdef __cplusplus

class DECLSPEC_UUID("7E8BC44E-AEFF-11D1-89C2-00C04FB6BFC4")
ClientCaps;
#endif

EXTERN_C const CLSID CLSID_IntelliForms;

#ifdef __cplusplus

class DECLSPEC_UUID("613AB92E-16BF-11d2-BCA5-00C04FD929DB")
IntelliForms;
#endif

EXTERN_C const CLSID CLSID_HomePage;

#ifdef __cplusplus

class DECLSPEC_UUID("766BF2AE-D650-11d1-9811-00C04FC31D2E")
HomePage;
#endif

EXTERN_C const CLSID CLSID_CPersistUserData;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f48e-98b5-11cf-bb82-00aa00bdce0b")
CPersistUserData;
#endif

EXTERN_C const CLSID CLSID_CPersistDataPeer;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f487-98b5-11cf-bb82-00aa00bdce0b")
CPersistDataPeer;
#endif

EXTERN_C const CLSID CLSID_CPersistShortcut;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f4c6-98b5-11cf-bb82-00aa00bdce0b")
CPersistShortcut;
#endif

EXTERN_C const CLSID CLSID_CPersistHistory;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f4c8-98b5-11cf-bb82-00aa00bdce0b")
CPersistHistory;
#endif

EXTERN_C const CLSID CLSID_CPersistSnapshot;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f4c9-98b5-11cf-bb82-00aa00bdce0b")
CPersistSnapshot;
#endif

EXTERN_C const CLSID CLSID_CDownloadBehavior;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f5be-98b5-11cf-bb82-00aa00bdce0b")
CDownloadBehavior;
#endif

EXTERN_C const CLSID CLSID_wfolders;

#ifdef __cplusplus

class DECLSPEC_UUID("BAE31F9A-1B81-11D2-A97A-00C04F8ECB02")
wfolders;
#endif

EXTERN_C const CLSID CLSID_AnchorClick;

#ifdef __cplusplus

class DECLSPEC_UUID("13D5413C-33B9-11D2-95A7-00C04F8ECB02")
AnchorClick;
#endif

EXTERN_C const CLSID CLSID_CLayoutRect;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f664-98b5-11cf-bb82-00aa00bdce0b")
CLayoutRect;
#endif

EXTERN_C const CLSID CLSID_CDeviceRect;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f6d4-98b5-11cf-bb82-00aa00bdce0b")
CDeviceRect;
#endif

EXTERN_C const CLSID CLSID_CTemplatePrinter;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f6b3-98b5-11cf-bb82-00aa00bdce0b")
CTemplatePrinter;
#endif

EXTERN_C const CLSID CLSID_CHeaderFooter;

#ifdef __cplusplus

class DECLSPEC_UUID("3050f6cd-98b5-11cf-bb82-00aa00bdce0b")
CHeaderFooter;
#endif
#endif /* __IEXTagLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  VARIANT_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree(     __RPC__in unsigned long *, __RPC__in VARIANT * ); 

unsigned long             __RPC_USER  BSTR_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree64(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  VARIANT_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree64(     __RPC__in unsigned long *, __RPC__in VARIANT * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



