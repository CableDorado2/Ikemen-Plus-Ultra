

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0542 */
/* Compiler settings for winsatcominterfacei.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
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

#ifndef __winsatcominterfacei_h__
#define __winsatcominterfacei_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWinSATTaskMangerTask_FWD_DEFINED__
#define __IWinSATTaskMangerTask_FWD_DEFINED__
typedef interface IWinSATTaskMangerTask IWinSATTaskMangerTask;
#endif 	/* __IWinSATTaskMangerTask_FWD_DEFINED__ */


#ifndef __IProvideWinSATAssessmentInfo_FWD_DEFINED__
#define __IProvideWinSATAssessmentInfo_FWD_DEFINED__
typedef interface IProvideWinSATAssessmentInfo IProvideWinSATAssessmentInfo;
#endif 	/* __IProvideWinSATAssessmentInfo_FWD_DEFINED__ */


#ifndef __IProvideWinSATResultsInfo_FWD_DEFINED__
#define __IProvideWinSATResultsInfo_FWD_DEFINED__
typedef interface IProvideWinSATResultsInfo IProvideWinSATResultsInfo;
#endif 	/* __IProvideWinSATResultsInfo_FWD_DEFINED__ */


#ifndef __IQueryRecentWinSATAssessment_FWD_DEFINED__
#define __IQueryRecentWinSATAssessment_FWD_DEFINED__
typedef interface IQueryRecentWinSATAssessment IQueryRecentWinSATAssessment;
#endif 	/* __IQueryRecentWinSATAssessment_FWD_DEFINED__ */


#ifndef __IProvideWinSATVisuals_FWD_DEFINED__
#define __IProvideWinSATVisuals_FWD_DEFINED__
typedef interface IProvideWinSATVisuals IProvideWinSATVisuals;
#endif 	/* __IProvideWinSATVisuals_FWD_DEFINED__ */


#ifndef __IQueryAllWinSATAssessments_FWD_DEFINED__
#define __IQueryAllWinSATAssessments_FWD_DEFINED__
typedef interface IQueryAllWinSATAssessments IQueryAllWinSATAssessments;
#endif 	/* __IQueryAllWinSATAssessments_FWD_DEFINED__ */


#ifndef __IWinSATInitiateEvents_FWD_DEFINED__
#define __IWinSATInitiateEvents_FWD_DEFINED__
typedef interface IWinSATInitiateEvents IWinSATInitiateEvents;
#endif 	/* __IWinSATInitiateEvents_FWD_DEFINED__ */


#ifndef __IInitiateWinSATAssessment_FWD_DEFINED__
#define __IInitiateWinSATAssessment_FWD_DEFINED__
typedef interface IInitiateWinSATAssessment IInitiateWinSATAssessment;
#endif 	/* __IInitiateWinSATAssessment_FWD_DEFINED__ */


#ifndef __IAccessibleWinSAT_FWD_DEFINED__
#define __IAccessibleWinSAT_FWD_DEFINED__
typedef interface IAccessibleWinSAT IAccessibleWinSAT;
#endif 	/* __IAccessibleWinSAT_FWD_DEFINED__ */


#ifndef __IQueryOEMWinSATCustomization_FWD_DEFINED__
#define __IQueryOEMWinSATCustomization_FWD_DEFINED__
typedef interface IQueryOEMWinSATCustomization IQueryOEMWinSATCustomization;
#endif 	/* __IQueryOEMWinSATCustomization_FWD_DEFINED__ */


#ifndef __CWinSATTaskMangerTask_FWD_DEFINED__
#define __CWinSATTaskMangerTask_FWD_DEFINED__

#ifdef __cplusplus
typedef class CWinSATTaskMangerTask CWinSATTaskMangerTask;
#else
typedef struct CWinSATTaskMangerTask CWinSATTaskMangerTask;
#endif /* __cplusplus */

#endif 	/* __CWinSATTaskMangerTask_FWD_DEFINED__ */


#ifndef __CInitiateWinSAT_FWD_DEFINED__
#define __CInitiateWinSAT_FWD_DEFINED__

#ifdef __cplusplus
typedef class CInitiateWinSAT CInitiateWinSAT;
#else
typedef struct CInitiateWinSAT CInitiateWinSAT;
#endif /* __cplusplus */

#endif 	/* __CInitiateWinSAT_FWD_DEFINED__ */


#ifndef __CQueryWinSAT_FWD_DEFINED__
#define __CQueryWinSAT_FWD_DEFINED__

#ifdef __cplusplus
typedef class CQueryWinSAT CQueryWinSAT;
#else
typedef struct CQueryWinSAT CQueryWinSAT;
#endif /* __cplusplus */

#endif 	/* __CQueryWinSAT_FWD_DEFINED__ */


#ifndef __CQueryAllWinSAT_FWD_DEFINED__
#define __CQueryAllWinSAT_FWD_DEFINED__

#ifdef __cplusplus
typedef class CQueryAllWinSAT CQueryAllWinSAT;
#else
typedef struct CQueryAllWinSAT CQueryAllWinSAT;
#endif /* __cplusplus */

#endif 	/* __CQueryAllWinSAT_FWD_DEFINED__ */


#ifndef __CProvideWinSATVisuals_FWD_DEFINED__
#define __CProvideWinSATVisuals_FWD_DEFINED__

#ifdef __cplusplus
typedef class CProvideWinSATVisuals CProvideWinSATVisuals;
#else
typedef struct CProvideWinSATVisuals CProvideWinSATVisuals;
#endif /* __cplusplus */

#endif 	/* __CProvideWinSATVisuals_FWD_DEFINED__ */


#ifndef __CAccessiblityWinSAT_FWD_DEFINED__
#define __CAccessiblityWinSAT_FWD_DEFINED__

#ifdef __cplusplus
typedef class CAccessiblityWinSAT CAccessiblityWinSAT;
#else
typedef struct CAccessiblityWinSAT CAccessiblityWinSAT;
#endif /* __cplusplus */

#endif 	/* __CAccessiblityWinSAT_FWD_DEFINED__ */


#ifndef __CQueryOEMWinSATCustomization_FWD_DEFINED__
#define __CQueryOEMWinSATCustomization_FWD_DEFINED__

#ifdef __cplusplus
typedef class CQueryOEMWinSATCustomization CQueryOEMWinSATCustomization;
#else
typedef struct CQueryOEMWinSATCustomization CQueryOEMWinSATCustomization;
#endif /* __cplusplus */

#endif 	/* __CQueryOEMWinSATCustomization_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "msxml.h"
#include "oleacc.h"
#include "taskschd.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_winsatcominterfacei_0000_0000 */
/* [local] */ 

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_winsatcominterfacei_0000_0000_0001
    {	WINSAT_OEM_DATA_VALID	= 0,
	WINSAT_OEM_DATA_NON_SYS_CONFIG_MATCH	= 1,
	WINSAT_OEM_DATA_INVALID	= 2,
	WINSAT_OEM_NO_DATA_SUPPLIED	= 3
    } 	WINSAT_OEM_CUSTOMIZATION_STATE;

typedef /* [public][public][public] */ 
enum __MIDL___MIDL_itf_winsatcominterfacei_0000_0000_0002
    {	WINSAT_ASSESSMENT_STATE_MIN	= 0,
	WINSAT_ASSESSMENT_STATE_UNKNOWN	= 0,
	WINSAT_ASSESSMENT_STATE_VALID	= 1,
	WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE	= 2,
	WINSAT_ASSESSMENT_STATE_NOT_AVAILABLE	= 3,
	WINSAT_ASSESSMENT_STATE_INVALID	= 4,
	WINSAT_ASSESSMENT_STATE_MAX	= 4
    } 	WINSAT_ASSESSMENT_STATE;

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_winsatcominterfacei_0000_0000_0003
    {	WINSAT_ASSESSMENT_MEMORY	= 0,
	WINSAT_ASSESSMENT_CPU	= 1,
	WINSAT_ASSESSMENT_DISK	= 2,
	WINSAT_ASSESSMENT_D3D	= 3,
	WINSAT_ASSESSMENT_GRAPHICS	= 4
    } 	WINSAT_ASSESSMENT_TYPE;

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_winsatcominterfacei_0000_0000_0004
    {	WINSAT_BITMAP_SIZE_SMALL	= 0,
	WINSAT_BITMAP_SIZE_NORMAL	= 1
    } 	WINSAT_BITMAP_SIZE;



extern RPC_IF_HANDLE __MIDL_itf_winsatcominterfacei_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsatcominterfacei_0000_0000_v0_0_s_ifspec;

#ifndef __IWinSATTaskMangerTask_INTERFACE_DEFINED__
#define __IWinSATTaskMangerTask_INTERFACE_DEFINED__

/* interface IWinSATTaskMangerTask */
/* [unique][oleautomation][dual][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IWinSATTaskMangerTask;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("295D2F4E-0B80-4892-A6CE-78C6957BD75A")
    IWinSATTaskMangerTask : public ITaskHandler
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Start( 
            /* [in] */ __RPC__in_opt IUnknown *pHandlerServices,
            /* [in] */ __RPC__in BSTR data) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Stop( 
            /* [out] */ __RPC__out HRESULT *pRetCode) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Pause( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Resume( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IWinSATTaskMangerTaskVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IWinSATTaskMangerTask * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IWinSATTaskMangerTask * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IWinSATTaskMangerTask * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Start )( 
            IWinSATTaskMangerTask * This,
            /* [in] */ __RPC__in_opt IUnknown *pHandlerServices,
            /* [in] */ __RPC__in BSTR data);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Stop )( 
            IWinSATTaskMangerTask * This,
            /* [out] */ __RPC__out HRESULT *pRetCode);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Pause )( 
            IWinSATTaskMangerTask * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Resume )( 
            IWinSATTaskMangerTask * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Start )( 
            IWinSATTaskMangerTask * This,
            /* [in] */ __RPC__in_opt IUnknown *pHandlerServices,
            /* [in] */ __RPC__in BSTR data);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Stop )( 
            IWinSATTaskMangerTask * This,
            /* [out] */ __RPC__out HRESULT *pRetCode);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Pause )( 
            IWinSATTaskMangerTask * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Resume )( 
            IWinSATTaskMangerTask * This);
        
        END_INTERFACE
    } IWinSATTaskMangerTaskVtbl;

    interface IWinSATTaskMangerTask
    {
        CONST_VTBL struct IWinSATTaskMangerTaskVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWinSATTaskMangerTask_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWinSATTaskMangerTask_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWinSATTaskMangerTask_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWinSATTaskMangerTask_Start(This,pHandlerServices,data)	\
    ( (This)->lpVtbl -> Start(This,pHandlerServices,data) ) 

#define IWinSATTaskMangerTask_Stop(This,pRetCode)	\
    ( (This)->lpVtbl -> Stop(This,pRetCode) ) 

#define IWinSATTaskMangerTask_Pause(This)	\
    ( (This)->lpVtbl -> Pause(This) ) 

#define IWinSATTaskMangerTask_Resume(This)	\
    ( (This)->lpVtbl -> Resume(This) ) 


#define IWinSATTaskMangerTask_Start(This,pHandlerServices,data)	\
    ( (This)->lpVtbl -> Start(This,pHandlerServices,data) ) 

#define IWinSATTaskMangerTask_Stop(This,pRetCode)	\
    ( (This)->lpVtbl -> Stop(This,pRetCode) ) 

#define IWinSATTaskMangerTask_Pause(This)	\
    ( (This)->lpVtbl -> Pause(This) ) 

#define IWinSATTaskMangerTask_Resume(This)	\
    ( (This)->lpVtbl -> Resume(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWinSATTaskMangerTask_INTERFACE_DEFINED__ */


#ifndef __IProvideWinSATAssessmentInfo_INTERFACE_DEFINED__
#define __IProvideWinSATAssessmentInfo_INTERFACE_DEFINED__

/* interface IProvideWinSATAssessmentInfo */
/* [unique][oleautomation][dual][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IProvideWinSATAssessmentInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0CD1C380-52D3-4678-AC6F-E929E480BE9E")
    IProvideWinSATAssessmentInfo : public IDispatch
    {
    public:
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_Score( 
            /* [retval][out] */ __RPC__out float *score) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_Title( 
            /* [string][retval][out] */ __RPC__deref_out_opt_string BSTR *title) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_Description( 
            /* [string][retval][out] */ __RPC__deref_out_opt_string BSTR *description) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IProvideWinSATAssessmentInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IProvideWinSATAssessmentInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IProvideWinSATAssessmentInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IProvideWinSATAssessmentInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IProvideWinSATAssessmentInfo * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IProvideWinSATAssessmentInfo * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IProvideWinSATAssessmentInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IProvideWinSATAssessmentInfo * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Score )( 
            IProvideWinSATAssessmentInfo * This,
            /* [retval][out] */ __RPC__out float *score);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Title )( 
            IProvideWinSATAssessmentInfo * This,
            /* [string][retval][out] */ __RPC__deref_out_opt_string BSTR *title);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Description )( 
            IProvideWinSATAssessmentInfo * This,
            /* [string][retval][out] */ __RPC__deref_out_opt_string BSTR *description);
        
        END_INTERFACE
    } IProvideWinSATAssessmentInfoVtbl;

    interface IProvideWinSATAssessmentInfo
    {
        CONST_VTBL struct IProvideWinSATAssessmentInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IProvideWinSATAssessmentInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IProvideWinSATAssessmentInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IProvideWinSATAssessmentInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IProvideWinSATAssessmentInfo_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IProvideWinSATAssessmentInfo_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IProvideWinSATAssessmentInfo_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IProvideWinSATAssessmentInfo_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IProvideWinSATAssessmentInfo_get_Score(This,score)	\
    ( (This)->lpVtbl -> get_Score(This,score) ) 

#define IProvideWinSATAssessmentInfo_get_Title(This,title)	\
    ( (This)->lpVtbl -> get_Title(This,title) ) 

#define IProvideWinSATAssessmentInfo_get_Description(This,description)	\
    ( (This)->lpVtbl -> get_Description(This,description) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IProvideWinSATAssessmentInfo_INTERFACE_DEFINED__ */


#ifndef __IProvideWinSATResultsInfo_INTERFACE_DEFINED__
#define __IProvideWinSATResultsInfo_INTERFACE_DEFINED__

/* interface IProvideWinSATResultsInfo */
/* [unique][oleautomation][dual][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IProvideWinSATResultsInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("F8334D5D-568E-4075-875F-9DF341506640")
    IProvideWinSATResultsInfo : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE GetAssessmentInfo( 
            /* [in] */ WINSAT_ASSESSMENT_TYPE assessment,
            /* [retval][out] */ __RPC__deref_out_opt IProvideWinSATAssessmentInfo **ppinfo) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_AssessmentState( 
            /* [retval][out] */ __RPC__out WINSAT_ASSESSMENT_STATE *state) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_AssessmentDateTime( 
            /* [retval][out] */ __RPC__out VARIANT *fileTime) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_SystemRating( 
            /* [retval][out] */ __RPC__out float *level) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_RatingStateDesc( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *description) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IProvideWinSATResultsInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IProvideWinSATResultsInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IProvideWinSATResultsInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IProvideWinSATResultsInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IProvideWinSATResultsInfo * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IProvideWinSATResultsInfo * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IProvideWinSATResultsInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IProvideWinSATResultsInfo * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *GetAssessmentInfo )( 
            IProvideWinSATResultsInfo * This,
            /* [in] */ WINSAT_ASSESSMENT_TYPE assessment,
            /* [retval][out] */ __RPC__deref_out_opt IProvideWinSATAssessmentInfo **ppinfo);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_AssessmentState )( 
            IProvideWinSATResultsInfo * This,
            /* [retval][out] */ __RPC__out WINSAT_ASSESSMENT_STATE *state);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_AssessmentDateTime )( 
            IProvideWinSATResultsInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *fileTime);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_SystemRating )( 
            IProvideWinSATResultsInfo * This,
            /* [retval][out] */ __RPC__out float *level);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_RatingStateDesc )( 
            IProvideWinSATResultsInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *description);
        
        END_INTERFACE
    } IProvideWinSATResultsInfoVtbl;

    interface IProvideWinSATResultsInfo
    {
        CONST_VTBL struct IProvideWinSATResultsInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IProvideWinSATResultsInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IProvideWinSATResultsInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IProvideWinSATResultsInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IProvideWinSATResultsInfo_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IProvideWinSATResultsInfo_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IProvideWinSATResultsInfo_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IProvideWinSATResultsInfo_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IProvideWinSATResultsInfo_GetAssessmentInfo(This,assessment,ppinfo)	\
    ( (This)->lpVtbl -> GetAssessmentInfo(This,assessment,ppinfo) ) 

#define IProvideWinSATResultsInfo_get_AssessmentState(This,state)	\
    ( (This)->lpVtbl -> get_AssessmentState(This,state) ) 

#define IProvideWinSATResultsInfo_get_AssessmentDateTime(This,fileTime)	\
    ( (This)->lpVtbl -> get_AssessmentDateTime(This,fileTime) ) 

#define IProvideWinSATResultsInfo_get_SystemRating(This,level)	\
    ( (This)->lpVtbl -> get_SystemRating(This,level) ) 

#define IProvideWinSATResultsInfo_get_RatingStateDesc(This,description)	\
    ( (This)->lpVtbl -> get_RatingStateDesc(This,description) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IProvideWinSATResultsInfo_INTERFACE_DEFINED__ */


#ifndef __IQueryRecentWinSATAssessment_INTERFACE_DEFINED__
#define __IQueryRecentWinSATAssessment_INTERFACE_DEFINED__

/* interface IQueryRecentWinSATAssessment */
/* [unique][oleautomation][dual][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IQueryRecentWinSATAssessment;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("F8AD5D1F-3B47-4bdc-9375-7C6B1DA4ECA7")
    IQueryRecentWinSATAssessment : public IDispatch
    {
    public:
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_XML( 
            /* [string][in] */ __RPC__in_string BSTR xPath,
            /* [defaultvalue][string][in] */ __RPC__in_string BSTR namespaces,
            /* [retval][out] */ __RPC__deref_out_opt IXMLDOMNodeList **ppDomNodeList) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_Info( 
            /* [retval][out] */ __RPC__deref_out_opt IProvideWinSATResultsInfo **ppWinSATAssessmentInfo) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IQueryRecentWinSATAssessmentVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IQueryRecentWinSATAssessment * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IQueryRecentWinSATAssessment * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IQueryRecentWinSATAssessment * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IQueryRecentWinSATAssessment * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IQueryRecentWinSATAssessment * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IQueryRecentWinSATAssessment * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IQueryRecentWinSATAssessment * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_XML )( 
            IQueryRecentWinSATAssessment * This,
            /* [string][in] */ __RPC__in_string BSTR xPath,
            /* [defaultvalue][string][in] */ __RPC__in_string BSTR namespaces,
            /* [retval][out] */ __RPC__deref_out_opt IXMLDOMNodeList **ppDomNodeList);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Info )( 
            IQueryRecentWinSATAssessment * This,
            /* [retval][out] */ __RPC__deref_out_opt IProvideWinSATResultsInfo **ppWinSATAssessmentInfo);
        
        END_INTERFACE
    } IQueryRecentWinSATAssessmentVtbl;

    interface IQueryRecentWinSATAssessment
    {
        CONST_VTBL struct IQueryRecentWinSATAssessmentVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IQueryRecentWinSATAssessment_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IQueryRecentWinSATAssessment_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IQueryRecentWinSATAssessment_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IQueryRecentWinSATAssessment_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IQueryRecentWinSATAssessment_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IQueryRecentWinSATAssessment_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IQueryRecentWinSATAssessment_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IQueryRecentWinSATAssessment_get_XML(This,xPath,namespaces,ppDomNodeList)	\
    ( (This)->lpVtbl -> get_XML(This,xPath,namespaces,ppDomNodeList) ) 

#define IQueryRecentWinSATAssessment_get_Info(This,ppWinSATAssessmentInfo)	\
    ( (This)->lpVtbl -> get_Info(This,ppWinSATAssessmentInfo) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IQueryRecentWinSATAssessment_INTERFACE_DEFINED__ */


#ifndef __IProvideWinSATVisuals_INTERFACE_DEFINED__
#define __IProvideWinSATVisuals_INTERFACE_DEFINED__

/* interface IProvideWinSATVisuals */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IProvideWinSATVisuals;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("A9F4ADE0-871A-42a3-B813-3078D25162C9")
    IProvideWinSATVisuals : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE get_Bitmap( 
            /* [in] */ WINSAT_BITMAP_SIZE bitmapSize,
            WINSAT_ASSESSMENT_STATE state,
            float rating,
            /* [out] */ __RPC__deref_out_opt HBITMAP *pBitmap) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IProvideWinSATVisualsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IProvideWinSATVisuals * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IProvideWinSATVisuals * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IProvideWinSATVisuals * This);
        
        HRESULT ( STDMETHODCALLTYPE *get_Bitmap )( 
            IProvideWinSATVisuals * This,
            /* [in] */ WINSAT_BITMAP_SIZE bitmapSize,
            WINSAT_ASSESSMENT_STATE state,
            float rating,
            /* [out] */ __RPC__deref_out_opt HBITMAP *pBitmap);
        
        END_INTERFACE
    } IProvideWinSATVisualsVtbl;

    interface IProvideWinSATVisuals
    {
        CONST_VTBL struct IProvideWinSATVisualsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IProvideWinSATVisuals_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IProvideWinSATVisuals_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IProvideWinSATVisuals_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IProvideWinSATVisuals_get_Bitmap(This,bitmapSize,state,rating,pBitmap)	\
    ( (This)->lpVtbl -> get_Bitmap(This,bitmapSize,state,rating,pBitmap) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IProvideWinSATVisuals_INTERFACE_DEFINED__ */


#ifndef __IQueryAllWinSATAssessments_INTERFACE_DEFINED__
#define __IQueryAllWinSATAssessments_INTERFACE_DEFINED__

/* interface IQueryAllWinSATAssessments */
/* [unique][oleautomation][dual][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IQueryAllWinSATAssessments;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0B89ED1D-6398-4fea-87FC-567D8D19176F")
    IQueryAllWinSATAssessments : public IDispatch
    {
    public:
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_AllXML( 
            /* [string][in] */ __RPC__in_string BSTR xPath,
            /* [defaultvalue][string][in] */ __RPC__in_string BSTR namespaces,
            /* [retval][out] */ __RPC__deref_out_opt IXMLDOMNodeList **ppDomNodeList) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IQueryAllWinSATAssessmentsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IQueryAllWinSATAssessments * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IQueryAllWinSATAssessments * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IQueryAllWinSATAssessments * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IQueryAllWinSATAssessments * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IQueryAllWinSATAssessments * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IQueryAllWinSATAssessments * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IQueryAllWinSATAssessments * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_AllXML )( 
            IQueryAllWinSATAssessments * This,
            /* [string][in] */ __RPC__in_string BSTR xPath,
            /* [defaultvalue][string][in] */ __RPC__in_string BSTR namespaces,
            /* [retval][out] */ __RPC__deref_out_opt IXMLDOMNodeList **ppDomNodeList);
        
        END_INTERFACE
    } IQueryAllWinSATAssessmentsVtbl;

    interface IQueryAllWinSATAssessments
    {
        CONST_VTBL struct IQueryAllWinSATAssessmentsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IQueryAllWinSATAssessments_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IQueryAllWinSATAssessments_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IQueryAllWinSATAssessments_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IQueryAllWinSATAssessments_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IQueryAllWinSATAssessments_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IQueryAllWinSATAssessments_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IQueryAllWinSATAssessments_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IQueryAllWinSATAssessments_get_AllXML(This,xPath,namespaces,ppDomNodeList)	\
    ( (This)->lpVtbl -> get_AllXML(This,xPath,namespaces,ppDomNodeList) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IQueryAllWinSATAssessments_INTERFACE_DEFINED__ */


#ifndef __IWinSATInitiateEvents_INTERFACE_DEFINED__
#define __IWinSATInitiateEvents_INTERFACE_DEFINED__

/* interface IWinSATInitiateEvents */
/* [uuid][object] */ 


EXTERN_C const IID IID_IWinSATInitiateEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("262A1918-BA0D-41d5-92C2-FAB4633EE74F")
    IWinSATInitiateEvents : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE WinSATComplete( 
            /* [in] */ HRESULT hresult,
            /* [string][in] */ __RPC__in_string LPCWSTR strDescription) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE WinSATUpdate( 
            /* [in] */ UINT uCurrentTick,
            /* [in] */ UINT uTickTotal,
            /* [string][in] */ __RPC__in_string LPCWSTR strCurrentState) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IWinSATInitiateEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IWinSATInitiateEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IWinSATInitiateEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IWinSATInitiateEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *WinSATComplete )( 
            IWinSATInitiateEvents * This,
            /* [in] */ HRESULT hresult,
            /* [string][in] */ __RPC__in_string LPCWSTR strDescription);
        
        HRESULT ( STDMETHODCALLTYPE *WinSATUpdate )( 
            IWinSATInitiateEvents * This,
            /* [in] */ UINT uCurrentTick,
            /* [in] */ UINT uTickTotal,
            /* [string][in] */ __RPC__in_string LPCWSTR strCurrentState);
        
        END_INTERFACE
    } IWinSATInitiateEventsVtbl;

    interface IWinSATInitiateEvents
    {
        CONST_VTBL struct IWinSATInitiateEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWinSATInitiateEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWinSATInitiateEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWinSATInitiateEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWinSATInitiateEvents_WinSATComplete(This,hresult,strDescription)	\
    ( (This)->lpVtbl -> WinSATComplete(This,hresult,strDescription) ) 

#define IWinSATInitiateEvents_WinSATUpdate(This,uCurrentTick,uTickTotal,strCurrentState)	\
    ( (This)->lpVtbl -> WinSATUpdate(This,uCurrentTick,uTickTotal,strCurrentState) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWinSATInitiateEvents_INTERFACE_DEFINED__ */


#ifndef __IInitiateWinSATAssessment_INTERFACE_DEFINED__
#define __IInitiateWinSATAssessment_INTERFACE_DEFINED__

/* interface IInitiateWinSATAssessment */
/* [uuid][object] */ 


EXTERN_C const IID IID_IInitiateWinSATAssessment;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D983FC50-F5BF-49d5-B5ED-CCCB18AA7FC1")
    IInitiateWinSATAssessment : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE InitiateAssessment( 
            /* [string][in] */ __RPC__in_string LPCWSTR cmdLine,
            /* [unique][optional][in] */ __RPC__in_opt IWinSATInitiateEvents *pCallbacks,
            /* [unique][optional][in] */ __RPC__in_opt HWND callerHwnd) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE InitiateFormalAssessment( 
            /* [unique][optional][in] */ __RPC__in_opt IWinSATInitiateEvents *pCallbacks,
            /* [unique][optional][in] */ __RPC__in_opt HWND callerHwnd) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CancelAssessment( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IInitiateWinSATAssessmentVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IInitiateWinSATAssessment * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IInitiateWinSATAssessment * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IInitiateWinSATAssessment * This);
        
        HRESULT ( STDMETHODCALLTYPE *InitiateAssessment )( 
            IInitiateWinSATAssessment * This,
            /* [string][in] */ __RPC__in_string LPCWSTR cmdLine,
            /* [unique][optional][in] */ __RPC__in_opt IWinSATInitiateEvents *pCallbacks,
            /* [unique][optional][in] */ __RPC__in_opt HWND callerHwnd);
        
        HRESULT ( STDMETHODCALLTYPE *InitiateFormalAssessment )( 
            IInitiateWinSATAssessment * This,
            /* [unique][optional][in] */ __RPC__in_opt IWinSATInitiateEvents *pCallbacks,
            /* [unique][optional][in] */ __RPC__in_opt HWND callerHwnd);
        
        HRESULT ( STDMETHODCALLTYPE *CancelAssessment )( 
            IInitiateWinSATAssessment * This);
        
        END_INTERFACE
    } IInitiateWinSATAssessmentVtbl;

    interface IInitiateWinSATAssessment
    {
        CONST_VTBL struct IInitiateWinSATAssessmentVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IInitiateWinSATAssessment_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IInitiateWinSATAssessment_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IInitiateWinSATAssessment_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IInitiateWinSATAssessment_InitiateAssessment(This,cmdLine,pCallbacks,callerHwnd)	\
    ( (This)->lpVtbl -> InitiateAssessment(This,cmdLine,pCallbacks,callerHwnd) ) 

#define IInitiateWinSATAssessment_InitiateFormalAssessment(This,pCallbacks,callerHwnd)	\
    ( (This)->lpVtbl -> InitiateFormalAssessment(This,pCallbacks,callerHwnd) ) 

#define IInitiateWinSATAssessment_CancelAssessment(This)	\
    ( (This)->lpVtbl -> CancelAssessment(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IInitiateWinSATAssessment_INTERFACE_DEFINED__ */


#ifndef __IAccessibleWinSAT_INTERFACE_DEFINED__
#define __IAccessibleWinSAT_INTERFACE_DEFINED__

/* interface IAccessibleWinSAT */
/* [uuid][object] */ 


EXTERN_C const IID IID_IAccessibleWinSAT;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("30e6018a-94a8-4ff8-a69a-71b67413f07b")
    IAccessibleWinSAT : public IAccessible
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SetAccessiblityData( 
            /* [string][in] */ __RPC__in_string LPCWSTR wsName,
            /* [string][in] */ __RPC__in_string LPCWSTR wsValue,
            /* [string][in] */ __RPC__in_string LPCWSTR wsDesc) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAccessibleWinSATVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAccessibleWinSAT * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAccessibleWinSAT * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAccessibleWinSAT * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            IAccessibleWinSAT * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            IAccessibleWinSAT * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            IAccessibleWinSAT * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAccessibleWinSAT * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accParent )( 
            IAccessibleWinSAT * This,
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **ppdispParent);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accChildCount )( 
            IAccessibleWinSAT * This,
            /* [retval][out] */ __RPC__out long *pcountChildren);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accChild )( 
            IAccessibleWinSAT * This,
            /* [in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **ppdispChild);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accName )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pszName);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accValue )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pszValue);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accDescription )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pszDescription);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accRole )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__out VARIANT *pvarRole);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accState )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__out VARIANT *pvarState);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accHelp )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pszHelp);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accHelpTopic )( 
            IAccessibleWinSAT * This,
            /* [out] */ __RPC__deref_out_opt BSTR *pszHelpFile,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__out long *pidTopic);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accKeyboardShortcut )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pszKeyboardShortcut);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accFocus )( 
            IAccessibleWinSAT * This,
            /* [retval][out] */ __RPC__out VARIANT *pvarChild);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accSelection )( 
            IAccessibleWinSAT * This,
            /* [retval][out] */ __RPC__out VARIANT *pvarChildren);
        
        /* [id][propget][hidden] */ HRESULT ( STDMETHODCALLTYPE *get_accDefaultAction )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pszDefaultAction);
        
        /* [id][hidden] */ HRESULT ( STDMETHODCALLTYPE *accSelect )( 
            IAccessibleWinSAT * This,
            /* [in] */ long flagsSelect,
            /* [optional][in] */ VARIANT varChild);
        
        /* [id][hidden] */ HRESULT ( STDMETHODCALLTYPE *accLocation )( 
            IAccessibleWinSAT * This,
            /* [out] */ __RPC__out long *pxLeft,
            /* [out] */ __RPC__out long *pyTop,
            /* [out] */ __RPC__out long *pcxWidth,
            /* [out] */ __RPC__out long *pcyHeight,
            /* [optional][in] */ VARIANT varChild);
        
        /* [id][hidden] */ HRESULT ( STDMETHODCALLTYPE *accNavigate )( 
            IAccessibleWinSAT * This,
            /* [in] */ long navDir,
            /* [optional][in] */ VARIANT varStart,
            /* [retval][out] */ __RPC__out VARIANT *pvarEndUpAt);
        
        /* [id][hidden] */ HRESULT ( STDMETHODCALLTYPE *accHitTest )( 
            IAccessibleWinSAT * This,
            /* [in] */ long xLeft,
            /* [in] */ long yTop,
            /* [retval][out] */ __RPC__out VARIANT *pvarChild);
        
        /* [id][hidden] */ HRESULT ( STDMETHODCALLTYPE *accDoDefaultAction )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild);
        
        /* [id][propput][hidden] */ HRESULT ( STDMETHODCALLTYPE *put_accName )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [in] */ __RPC__in BSTR szName);
        
        /* [id][propput][hidden] */ HRESULT ( STDMETHODCALLTYPE *put_accValue )( 
            IAccessibleWinSAT * This,
            /* [optional][in] */ VARIANT varChild,
            /* [in] */ __RPC__in BSTR szValue);
        
        HRESULT ( STDMETHODCALLTYPE *SetAccessiblityData )( 
            IAccessibleWinSAT * This,
            /* [string][in] */ __RPC__in_string LPCWSTR wsName,
            /* [string][in] */ __RPC__in_string LPCWSTR wsValue,
            /* [string][in] */ __RPC__in_string LPCWSTR wsDesc);
        
        END_INTERFACE
    } IAccessibleWinSATVtbl;

    interface IAccessibleWinSAT
    {
        CONST_VTBL struct IAccessibleWinSATVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAccessibleWinSAT_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAccessibleWinSAT_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAccessibleWinSAT_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAccessibleWinSAT_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAccessibleWinSAT_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAccessibleWinSAT_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAccessibleWinSAT_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IAccessibleWinSAT_get_accParent(This,ppdispParent)	\
    ( (This)->lpVtbl -> get_accParent(This,ppdispParent) ) 

#define IAccessibleWinSAT_get_accChildCount(This,pcountChildren)	\
    ( (This)->lpVtbl -> get_accChildCount(This,pcountChildren) ) 

#define IAccessibleWinSAT_get_accChild(This,varChild,ppdispChild)	\
    ( (This)->lpVtbl -> get_accChild(This,varChild,ppdispChild) ) 

#define IAccessibleWinSAT_get_accName(This,varChild,pszName)	\
    ( (This)->lpVtbl -> get_accName(This,varChild,pszName) ) 

#define IAccessibleWinSAT_get_accValue(This,varChild,pszValue)	\
    ( (This)->lpVtbl -> get_accValue(This,varChild,pszValue) ) 

#define IAccessibleWinSAT_get_accDescription(This,varChild,pszDescription)	\
    ( (This)->lpVtbl -> get_accDescription(This,varChild,pszDescription) ) 

#define IAccessibleWinSAT_get_accRole(This,varChild,pvarRole)	\
    ( (This)->lpVtbl -> get_accRole(This,varChild,pvarRole) ) 

#define IAccessibleWinSAT_get_accState(This,varChild,pvarState)	\
    ( (This)->lpVtbl -> get_accState(This,varChild,pvarState) ) 

#define IAccessibleWinSAT_get_accHelp(This,varChild,pszHelp)	\
    ( (This)->lpVtbl -> get_accHelp(This,varChild,pszHelp) ) 

#define IAccessibleWinSAT_get_accHelpTopic(This,pszHelpFile,varChild,pidTopic)	\
    ( (This)->lpVtbl -> get_accHelpTopic(This,pszHelpFile,varChild,pidTopic) ) 

#define IAccessibleWinSAT_get_accKeyboardShortcut(This,varChild,pszKeyboardShortcut)	\
    ( (This)->lpVtbl -> get_accKeyboardShortcut(This,varChild,pszKeyboardShortcut) ) 

#define IAccessibleWinSAT_get_accFocus(This,pvarChild)	\
    ( (This)->lpVtbl -> get_accFocus(This,pvarChild) ) 

#define IAccessibleWinSAT_get_accSelection(This,pvarChildren)	\
    ( (This)->lpVtbl -> get_accSelection(This,pvarChildren) ) 

#define IAccessibleWinSAT_get_accDefaultAction(This,varChild,pszDefaultAction)	\
    ( (This)->lpVtbl -> get_accDefaultAction(This,varChild,pszDefaultAction) ) 

#define IAccessibleWinSAT_accSelect(This,flagsSelect,varChild)	\
    ( (This)->lpVtbl -> accSelect(This,flagsSelect,varChild) ) 

#define IAccessibleWinSAT_accLocation(This,pxLeft,pyTop,pcxWidth,pcyHeight,varChild)	\
    ( (This)->lpVtbl -> accLocation(This,pxLeft,pyTop,pcxWidth,pcyHeight,varChild) ) 

#define IAccessibleWinSAT_accNavigate(This,navDir,varStart,pvarEndUpAt)	\
    ( (This)->lpVtbl -> accNavigate(This,navDir,varStart,pvarEndUpAt) ) 

#define IAccessibleWinSAT_accHitTest(This,xLeft,yTop,pvarChild)	\
    ( (This)->lpVtbl -> accHitTest(This,xLeft,yTop,pvarChild) ) 

#define IAccessibleWinSAT_accDoDefaultAction(This,varChild)	\
    ( (This)->lpVtbl -> accDoDefaultAction(This,varChild) ) 

#define IAccessibleWinSAT_put_accName(This,varChild,szName)	\
    ( (This)->lpVtbl -> put_accName(This,varChild,szName) ) 

#define IAccessibleWinSAT_put_accValue(This,varChild,szValue)	\
    ( (This)->lpVtbl -> put_accValue(This,varChild,szValue) ) 


#define IAccessibleWinSAT_SetAccessiblityData(This,wsName,wsValue,wsDesc)	\
    ( (This)->lpVtbl -> SetAccessiblityData(This,wsName,wsValue,wsDesc) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAccessibleWinSAT_INTERFACE_DEFINED__ */


#ifndef __IQueryOEMWinSATCustomization_INTERFACE_DEFINED__
#define __IQueryOEMWinSATCustomization_INTERFACE_DEFINED__

/* interface IQueryOEMWinSATCustomization */
/* [uuid][object] */ 


EXTERN_C const IID IID_IQueryOEMWinSATCustomization;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BC9A6A9F-AD4E-420e-9953-B34671E9DF22")
    IQueryOEMWinSATCustomization : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetOEMPrePopulationInfo( 
            /* [retval][out] */ __RPC__out WINSAT_OEM_CUSTOMIZATION_STATE *state) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IQueryOEMWinSATCustomizationVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IQueryOEMWinSATCustomization * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IQueryOEMWinSATCustomization * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IQueryOEMWinSATCustomization * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetOEMPrePopulationInfo )( 
            IQueryOEMWinSATCustomization * This,
            /* [retval][out] */ __RPC__out WINSAT_OEM_CUSTOMIZATION_STATE *state);
        
        END_INTERFACE
    } IQueryOEMWinSATCustomizationVtbl;

    interface IQueryOEMWinSATCustomization
    {
        CONST_VTBL struct IQueryOEMWinSATCustomizationVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IQueryOEMWinSATCustomization_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IQueryOEMWinSATCustomization_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IQueryOEMWinSATCustomization_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IQueryOEMWinSATCustomization_GetOEMPrePopulationInfo(This,state)	\
    ( (This)->lpVtbl -> GetOEMPrePopulationInfo(This,state) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IQueryOEMWinSATCustomization_INTERFACE_DEFINED__ */



#ifndef __WINSATLib_LIBRARY_DEFINED__
#define __WINSATLib_LIBRARY_DEFINED__

/* library WINSATLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WINSATLib;

EXTERN_C const CLSID CLSID_CWinSATTaskMangerTask;

#ifdef __cplusplus

class DECLSPEC_UUID("A9A33436-678B-4c9c-A211-7CC38785E79D")
CWinSATTaskMangerTask;
#endif

EXTERN_C const CLSID CLSID_CInitiateWinSAT;

#ifdef __cplusplus

class DECLSPEC_UUID("489331DC-F5E0-4528-9FDA-45331BF4A571")
CInitiateWinSAT;
#endif

EXTERN_C const CLSID CLSID_CQueryWinSAT;

#ifdef __cplusplus

class DECLSPEC_UUID("F3BDFAD3-F276-49e9-9B17-C474F48F0764")
CQueryWinSAT;
#endif

EXTERN_C const CLSID CLSID_CQueryAllWinSAT;

#ifdef __cplusplus

class DECLSPEC_UUID("05DF8D13-C355-47f4-A11E-851B338CEFB8")
CQueryAllWinSAT;
#endif

EXTERN_C const CLSID CLSID_CProvideWinSATVisuals;

#ifdef __cplusplus

class DECLSPEC_UUID("9F377D7E-E551-44f8-9F94-9DB392B03B7B")
CProvideWinSATVisuals;
#endif

EXTERN_C const CLSID CLSID_CAccessiblityWinSAT;

#ifdef __cplusplus

class DECLSPEC_UUID("6e18f9c6-a3eb-495a-89b7-956482e19f7a")
CAccessiblityWinSAT;
#endif

EXTERN_C const CLSID CLSID_CQueryOEMWinSATCustomization;

#ifdef __cplusplus

class DECLSPEC_UUID("C47A41B7-B729-424f-9AF9-5CB3934F2DFA")
CQueryOEMWinSATCustomization;
#endif
#endif /* __WINSATLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  HBITMAP_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in HBITMAP * ); 
unsigned char * __RPC_USER  HBITMAP_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in HBITMAP * ); 
unsigned char * __RPC_USER  HBITMAP_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out HBITMAP * ); 
void                      __RPC_USER  HBITMAP_UserFree(     __RPC__in unsigned long *, __RPC__in HBITMAP * ); 

unsigned long             __RPC_USER  HWND_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in HWND * ); 
unsigned char * __RPC_USER  HWND_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in HWND * ); 
unsigned char * __RPC_USER  HWND_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out HWND * ); 
void                      __RPC_USER  HWND_UserFree(     __RPC__in unsigned long *, __RPC__in HWND * ); 

unsigned long             __RPC_USER  VARIANT_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree(     __RPC__in unsigned long *, __RPC__in VARIANT * ); 

unsigned long             __RPC_USER  BSTR_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out BSTR * ); 
void                      __RPC_USER  BSTR_UserFree64(     __RPC__in unsigned long *, __RPC__in BSTR * ); 

unsigned long             __RPC_USER  HBITMAP_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in HBITMAP * ); 
unsigned char * __RPC_USER  HBITMAP_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in HBITMAP * ); 
unsigned char * __RPC_USER  HBITMAP_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out HBITMAP * ); 
void                      __RPC_USER  HBITMAP_UserFree64(     __RPC__in unsigned long *, __RPC__in HBITMAP * ); 

unsigned long             __RPC_USER  HWND_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in HWND * ); 
unsigned char * __RPC_USER  HWND_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in HWND * ); 
unsigned char * __RPC_USER  HWND_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out HWND * ); 
void                      __RPC_USER  HWND_UserFree64(     __RPC__in unsigned long *, __RPC__in HWND * ); 

unsigned long             __RPC_USER  VARIANT_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in VARIANT * ); 
unsigned char * __RPC_USER  VARIANT_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out VARIANT * ); 
void                      __RPC_USER  VARIANT_UserFree64(     __RPC__in unsigned long *, __RPC__in VARIANT * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



