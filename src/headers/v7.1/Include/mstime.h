

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for mstime.idl:
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


#ifndef __mstime_h__
#define __mstime_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ITIMEActiveElementCollection_FWD_DEFINED__
#define __ITIMEActiveElementCollection_FWD_DEFINED__
typedef interface ITIMEActiveElementCollection ITIMEActiveElementCollection;
#endif 	/* __ITIMEActiveElementCollection_FWD_DEFINED__ */


#ifndef __ITIMEElement_FWD_DEFINED__
#define __ITIMEElement_FWD_DEFINED__
typedef interface ITIMEElement ITIMEElement;
#endif 	/* __ITIMEElement_FWD_DEFINED__ */


#ifndef __ITIMEBodyElement_FWD_DEFINED__
#define __ITIMEBodyElement_FWD_DEFINED__
typedef interface ITIMEBodyElement ITIMEBodyElement;
#endif 	/* __ITIMEBodyElement_FWD_DEFINED__ */


#ifndef __ITIMEMediaElement_FWD_DEFINED__
#define __ITIMEMediaElement_FWD_DEFINED__
typedef interface ITIMEMediaElement ITIMEMediaElement;
#endif 	/* __ITIMEMediaElement_FWD_DEFINED__ */


#ifndef __ITIMEMediaElement2_FWD_DEFINED__
#define __ITIMEMediaElement2_FWD_DEFINED__
typedef interface ITIMEMediaElement2 ITIMEMediaElement2;
#endif 	/* __ITIMEMediaElement2_FWD_DEFINED__ */


#ifndef __ITIMETransitionElement_FWD_DEFINED__
#define __ITIMETransitionElement_FWD_DEFINED__
typedef interface ITIMETransitionElement ITIMETransitionElement;
#endif 	/* __ITIMETransitionElement_FWD_DEFINED__ */


#ifndef __ITIMEAnimationElement_FWD_DEFINED__
#define __ITIMEAnimationElement_FWD_DEFINED__
typedef interface ITIMEAnimationElement ITIMEAnimationElement;
#endif 	/* __ITIMEAnimationElement_FWD_DEFINED__ */


#ifndef __ITIMEAnimationElement2_FWD_DEFINED__
#define __ITIMEAnimationElement2_FWD_DEFINED__
typedef interface ITIMEAnimationElement2 ITIMEAnimationElement2;
#endif 	/* __ITIMEAnimationElement2_FWD_DEFINED__ */


#ifndef __IAnimationComposer_FWD_DEFINED__
#define __IAnimationComposer_FWD_DEFINED__
typedef interface IAnimationComposer IAnimationComposer;
#endif 	/* __IAnimationComposer_FWD_DEFINED__ */


#ifndef __IAnimationComposer2_FWD_DEFINED__
#define __IAnimationComposer2_FWD_DEFINED__
typedef interface IAnimationComposer2 IAnimationComposer2;
#endif 	/* __IAnimationComposer2_FWD_DEFINED__ */


#ifndef __IAnimationComposerSite_FWD_DEFINED__
#define __IAnimationComposerSite_FWD_DEFINED__
typedef interface IAnimationComposerSite IAnimationComposerSite;
#endif 	/* __IAnimationComposerSite_FWD_DEFINED__ */


#ifndef __IAnimationComposerSiteSink_FWD_DEFINED__
#define __IAnimationComposerSiteSink_FWD_DEFINED__
typedef interface IAnimationComposerSiteSink IAnimationComposerSiteSink;
#endif 	/* __IAnimationComposerSiteSink_FWD_DEFINED__ */


#ifndef __IAnimationRoot_FWD_DEFINED__
#define __IAnimationRoot_FWD_DEFINED__
typedef interface IAnimationRoot IAnimationRoot;
#endif 	/* __IAnimationRoot_FWD_DEFINED__ */


#ifndef __IAnimationFragment_FWD_DEFINED__
#define __IAnimationFragment_FWD_DEFINED__
typedef interface IAnimationFragment IAnimationFragment;
#endif 	/* __IAnimationFragment_FWD_DEFINED__ */


#ifndef __IFilterAnimationInfo_FWD_DEFINED__
#define __IFilterAnimationInfo_FWD_DEFINED__
typedef interface IFilterAnimationInfo IFilterAnimationInfo;
#endif 	/* __IFilterAnimationInfo_FWD_DEFINED__ */


#ifndef __ITIMEElementCollection_FWD_DEFINED__
#define __ITIMEElementCollection_FWD_DEFINED__
typedef interface ITIMEElementCollection ITIMEElementCollection;
#endif 	/* __ITIMEElementCollection_FWD_DEFINED__ */


#ifndef __ITIMEState_FWD_DEFINED__
#define __ITIMEState_FWD_DEFINED__
typedef interface ITIMEState ITIMEState;
#endif 	/* __ITIMEState_FWD_DEFINED__ */


#ifndef __ITIMEPlayItem_FWD_DEFINED__
#define __ITIMEPlayItem_FWD_DEFINED__
typedef interface ITIMEPlayItem ITIMEPlayItem;
#endif 	/* __ITIMEPlayItem_FWD_DEFINED__ */


#ifndef __ITIMEPlayItem2_FWD_DEFINED__
#define __ITIMEPlayItem2_FWD_DEFINED__
typedef interface ITIMEPlayItem2 ITIMEPlayItem2;
#endif 	/* __ITIMEPlayItem2_FWD_DEFINED__ */


#ifndef __ITIMEPlayList_FWD_DEFINED__
#define __ITIMEPlayList_FWD_DEFINED__
typedef interface ITIMEPlayList ITIMEPlayList;
#endif 	/* __ITIMEPlayList_FWD_DEFINED__ */


#ifndef __ITIMEDVDPlayerObject_FWD_DEFINED__
#define __ITIMEDVDPlayerObject_FWD_DEFINED__
typedef interface ITIMEDVDPlayerObject ITIMEDVDPlayerObject;
#endif 	/* __ITIMEDVDPlayerObject_FWD_DEFINED__ */


#ifndef __ITIMEDMusicPlayerObject_FWD_DEFINED__
#define __ITIMEDMusicPlayerObject_FWD_DEFINED__
typedef interface ITIMEDMusicPlayerObject ITIMEDMusicPlayerObject;
#endif 	/* __ITIMEDMusicPlayerObject_FWD_DEFINED__ */


#ifndef __ITIMEFactory_FWD_DEFINED__
#define __ITIMEFactory_FWD_DEFINED__
typedef interface ITIMEFactory ITIMEFactory;
#endif 	/* __ITIMEFactory_FWD_DEFINED__ */


#ifndef __TIMEFactory_FWD_DEFINED__
#define __TIMEFactory_FWD_DEFINED__

#ifdef __cplusplus
typedef class TIMEFactory TIMEFactory;
#else
typedef struct TIMEFactory TIMEFactory;
#endif /* __cplusplus */

#endif 	/* __TIMEFactory_FWD_DEFINED__ */


#ifndef __IAnimationComposerFactory_FWD_DEFINED__
#define __IAnimationComposerFactory_FWD_DEFINED__
typedef interface IAnimationComposerFactory IAnimationComposerFactory;
#endif 	/* __IAnimationComposerFactory_FWD_DEFINED__ */


#ifndef __IAnimationComposerSiteFactory_FWD_DEFINED__
#define __IAnimationComposerSiteFactory_FWD_DEFINED__
typedef interface IAnimationComposerSiteFactory IAnimationComposerSiteFactory;
#endif 	/* __IAnimationComposerSiteFactory_FWD_DEFINED__ */


#ifndef __ITIMEMediaPlayerSite_FWD_DEFINED__
#define __ITIMEMediaPlayerSite_FWD_DEFINED__
typedef interface ITIMEMediaPlayerSite ITIMEMediaPlayerSite;
#endif 	/* __ITIMEMediaPlayerSite_FWD_DEFINED__ */


#ifndef __ITIMEMediaPlayer_FWD_DEFINED__
#define __ITIMEMediaPlayer_FWD_DEFINED__
typedef interface ITIMEMediaPlayer ITIMEMediaPlayer;
#endif 	/* __ITIMEMediaPlayer_FWD_DEFINED__ */


#ifndef __ITIMEMediaPlayerAudio_FWD_DEFINED__
#define __ITIMEMediaPlayerAudio_FWD_DEFINED__
typedef interface ITIMEMediaPlayerAudio ITIMEMediaPlayerAudio;
#endif 	/* __ITIMEMediaPlayerAudio_FWD_DEFINED__ */


#ifndef __ITIMEMediaPlayerNetwork_FWD_DEFINED__
#define __ITIMEMediaPlayerNetwork_FWD_DEFINED__
typedef interface ITIMEMediaPlayerNetwork ITIMEMediaPlayerNetwork;
#endif 	/* __ITIMEMediaPlayerNetwork_FWD_DEFINED__ */


#ifndef __ITIMEMediaPlayerControl_FWD_DEFINED__
#define __ITIMEMediaPlayerControl_FWD_DEFINED__
typedef interface ITIMEMediaPlayerControl ITIMEMediaPlayerControl;
#endif 	/* __ITIMEMediaPlayerControl_FWD_DEFINED__ */


/* header files for imported files */
#include "servprov.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_mstime_0000_0000 */
/* [local] */ 

//=--------------------------------------------------------------------------=
// mstime.h
//=--------------------------------------------------------------------------=
// (C) Copyright Microsoft Corporation.  All Rights Reserved.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
// PARTICULAR PURPOSE.
//=--------------------------------------------------------------------------=

#include <olectl.h>
#include <mstimeid.h>





extern RPC_IF_HANDLE __MIDL_itf_mstime_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mstime_0000_0000_v0_0_s_ifspec;


#ifndef __MSTIME_LIBRARY_DEFINED__
#define __MSTIME_LIBRARY_DEFINED__

/* library MSTIME */
/* [version][lcid][uuid] */ 

typedef 
enum _TimeState
    {	TS_Inactive	= 0,
	TS_Active	= 1,
	TS_Cueing	= 2,
	TS_Seeking	= 3,
	TS_Holding	= 4
    } 	TimeState;


EXTERN_C const IID LIBID_MSTIME;

#ifndef __ITIMEActiveElementCollection_INTERFACE_DEFINED__
#define __ITIMEActiveElementCollection_INTERFACE_DEFINED__

/* interface ITIMEActiveElementCollection */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEActiveElementCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("403E2540-4520-11D3-93AB-00A0C967A438")
    ITIMEActiveElementCollection : public IDispatch
    {
    public:
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_length( 
            /* [retval][out] */ __RPC__out long *p) = 0;
        
        virtual /* [hidden][restricted][propget][id] */ HRESULT STDMETHODCALLTYPE get__newEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE item( 
            /* [in][defaultvalue] */ VARIANT varIndex,
            /* [retval][out] */ __RPC__out VARIANT *pvarResult) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEActiveElementCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEActiveElementCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEActiveElementCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEActiveElementCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_length )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [retval][out] */ __RPC__out long *p);
        
        /* [hidden][restricted][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get__newEnum )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *item )( 
            __RPC__in ITIMEActiveElementCollection * This,
            /* [in][defaultvalue] */ VARIANT varIndex,
            /* [retval][out] */ __RPC__out VARIANT *pvarResult);
        
        END_INTERFACE
    } ITIMEActiveElementCollectionVtbl;

    interface ITIMEActiveElementCollection
    {
        CONST_VTBL struct ITIMEActiveElementCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEActiveElementCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEActiveElementCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEActiveElementCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEActiveElementCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEActiveElementCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEActiveElementCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEActiveElementCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEActiveElementCollection_get_length(This,p)	\
    ( (This)->lpVtbl -> get_length(This,p) ) 

#define ITIMEActiveElementCollection_get__newEnum(This,p)	\
    ( (This)->lpVtbl -> get__newEnum(This,p) ) 

#define ITIMEActiveElementCollection_item(This,varIndex,pvarResult)	\
    ( (This)->lpVtbl -> item(This,varIndex,pvarResult) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEActiveElementCollection_INTERFACE_DEFINED__ */


#ifndef __ITIMEElement_INTERFACE_DEFINED__
#define __ITIMEElement_INTERFACE_DEFINED__

/* interface ITIMEElement */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1C2EF64E-F07D-4338-9771-9154491CD8B9")
    ITIMEElement : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_accelerate( 
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_accelerate( 
            /* [in] */ VARIANT __MIDL__ITIMEElement0001) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_autoReverse( 
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_autoReverse( 
            /* [in] */ VARIANT __MIDL__ITIMEElement0003) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_begin( 
            /* [retval][out] */ __RPC__out VARIANT *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_begin( 
            /* [in] */ VARIANT time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_decelerate( 
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_decelerate( 
            /* [in] */ VARIANT __MIDL__ITIMEElement0005) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_dur( 
            /* [retval][out] */ __RPC__out VARIANT *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_dur( 
            /* [in] */ VARIANT time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_end( 
            /* [retval][out] */ __RPC__out VARIANT *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_end( 
            /* [in] */ VARIANT time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_fill( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_fill( 
            /* [in] */ __RPC__in BSTR f) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mute( 
            /* [retval][out] */ __RPC__out VARIANT *b) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_mute( 
            /* [in] */ VARIANT b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_repeatCount( 
            /* [retval][out] */ __RPC__out VARIANT *c) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_repeatCount( 
            /* [in] */ VARIANT c) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_repeatDur( 
            /* [retval][out] */ __RPC__out VARIANT *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_repeatDur( 
            /* [in] */ VARIANT time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_restart( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_restart( 
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_speed( 
            /* [retval][out] */ __RPC__out VARIANT *speed) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_speed( 
            /* [in] */ VARIANT speed) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_syncBehavior( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_syncBehavior( 
            /* [in] */ __RPC__in BSTR sync) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_syncTolerance( 
            /* [retval][out] */ __RPC__out VARIANT *tol) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_syncTolerance( 
            /* [in] */ VARIANT tol) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_syncMaster( 
            /* [retval][out] */ __RPC__out VARIANT *b) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_syncMaster( 
            /* [in] */ VARIANT b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeAction( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_timeAction( 
            /* [in] */ __RPC__in BSTR time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeContainer( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_volume( 
            /* [retval][out] */ __RPC__out VARIANT *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_volume( 
            /* [in] */ VARIANT val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_currTimeState( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeAll( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeChildren( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeParent( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isPaused( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE beginElement( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE beginElementAt( 
            /* [in] */ double parentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE endElement( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE endElementAt( 
            /* [in] */ double parentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE pauseElement( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE resetElement( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE resumeElement( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE seekActiveTime( 
            /* [in] */ double activeTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE seekSegmentTime( 
            /* [in] */ double segmentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE seekTo( 
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE documentTimeToParentTime( 
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE parentTimeToDocumentTime( 
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE parentTimeToActiveTime( 
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE activeTimeToParentTime( 
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE activeTimeToSegmentTime( 
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE segmentTimeToActiveTime( 
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE segmentTimeToSimpleTime( 
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE simpleTimeToSegmentTime( 
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_endSync( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_endSync( 
            /* [in] */ __RPC__in BSTR es) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_activeElements( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasMedia( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE nextElement( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE prevElement( void) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_updateMode( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_updateMode( 
            /* [in] */ __RPC__in BSTR updateMode) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEElement * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEElement * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accelerate )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accelerate )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0001);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_autoReverse )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_autoReverse )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0003);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_decelerate )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_decelerate )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0005);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fill )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fill )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in BSTR f);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mute )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *c);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT c);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatDur )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatDur )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_restart )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_restart )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *speed);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_speed )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncBehavior )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncBehavior )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in BSTR sync);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncTolerance )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *tol);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncTolerance )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT tol);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncMaster )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncMaster )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAction )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeAction )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in BSTR time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeContainer )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTimeState )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAll )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeChildren )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeParent )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElementAt )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElementAt )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pauseElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resetElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resumeElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekActiveTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekSegmentTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekTo )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *documentTimeToParentTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToDocumentTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToActiveTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToParentTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToSegmentTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToActiveTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToSimpleTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *simpleTimeToSegmentTime )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endSync )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endSync )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in BSTR es);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeElements )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasMedia )( 
            __RPC__in ITIMEElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevElement )( 
            __RPC__in ITIMEElement * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_updateMode )( 
            __RPC__in ITIMEElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_updateMode )( 
            __RPC__in ITIMEElement * This,
            /* [in] */ __RPC__in BSTR updateMode);
        
        END_INTERFACE
    } ITIMEElementVtbl;

    interface ITIMEElement
    {
        CONST_VTBL struct ITIMEElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEElement_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEElement_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEElement_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEElement_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEElement_get_accelerate(This,__MIDL__ITIMEElement0000)	\
    ( (This)->lpVtbl -> get_accelerate(This,__MIDL__ITIMEElement0000) ) 

#define ITIMEElement_put_accelerate(This,__MIDL__ITIMEElement0001)	\
    ( (This)->lpVtbl -> put_accelerate(This,__MIDL__ITIMEElement0001) ) 

#define ITIMEElement_get_autoReverse(This,__MIDL__ITIMEElement0002)	\
    ( (This)->lpVtbl -> get_autoReverse(This,__MIDL__ITIMEElement0002) ) 

#define ITIMEElement_put_autoReverse(This,__MIDL__ITIMEElement0003)	\
    ( (This)->lpVtbl -> put_autoReverse(This,__MIDL__ITIMEElement0003) ) 

#define ITIMEElement_get_begin(This,time)	\
    ( (This)->lpVtbl -> get_begin(This,time) ) 

#define ITIMEElement_put_begin(This,time)	\
    ( (This)->lpVtbl -> put_begin(This,time) ) 

#define ITIMEElement_get_decelerate(This,__MIDL__ITIMEElement0004)	\
    ( (This)->lpVtbl -> get_decelerate(This,__MIDL__ITIMEElement0004) ) 

#define ITIMEElement_put_decelerate(This,__MIDL__ITIMEElement0005)	\
    ( (This)->lpVtbl -> put_decelerate(This,__MIDL__ITIMEElement0005) ) 

#define ITIMEElement_get_dur(This,time)	\
    ( (This)->lpVtbl -> get_dur(This,time) ) 

#define ITIMEElement_put_dur(This,time)	\
    ( (This)->lpVtbl -> put_dur(This,time) ) 

#define ITIMEElement_get_end(This,time)	\
    ( (This)->lpVtbl -> get_end(This,time) ) 

#define ITIMEElement_put_end(This,time)	\
    ( (This)->lpVtbl -> put_end(This,time) ) 

#define ITIMEElement_get_fill(This,f)	\
    ( (This)->lpVtbl -> get_fill(This,f) ) 

#define ITIMEElement_put_fill(This,f)	\
    ( (This)->lpVtbl -> put_fill(This,f) ) 

#define ITIMEElement_get_mute(This,b)	\
    ( (This)->lpVtbl -> get_mute(This,b) ) 

#define ITIMEElement_put_mute(This,b)	\
    ( (This)->lpVtbl -> put_mute(This,b) ) 

#define ITIMEElement_get_repeatCount(This,c)	\
    ( (This)->lpVtbl -> get_repeatCount(This,c) ) 

#define ITIMEElement_put_repeatCount(This,c)	\
    ( (This)->lpVtbl -> put_repeatCount(This,c) ) 

#define ITIMEElement_get_repeatDur(This,time)	\
    ( (This)->lpVtbl -> get_repeatDur(This,time) ) 

#define ITIMEElement_put_repeatDur(This,time)	\
    ( (This)->lpVtbl -> put_repeatDur(This,time) ) 

#define ITIMEElement_get_restart(This,__MIDL__ITIMEElement0006)	\
    ( (This)->lpVtbl -> get_restart(This,__MIDL__ITIMEElement0006) ) 

#define ITIMEElement_put_restart(This,__MIDL__ITIMEElement0007)	\
    ( (This)->lpVtbl -> put_restart(This,__MIDL__ITIMEElement0007) ) 

#define ITIMEElement_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEElement_put_speed(This,speed)	\
    ( (This)->lpVtbl -> put_speed(This,speed) ) 

#define ITIMEElement_get_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> get_syncBehavior(This,sync) ) 

#define ITIMEElement_put_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> put_syncBehavior(This,sync) ) 

#define ITIMEElement_get_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> get_syncTolerance(This,tol) ) 

#define ITIMEElement_put_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> put_syncTolerance(This,tol) ) 

#define ITIMEElement_get_syncMaster(This,b)	\
    ( (This)->lpVtbl -> get_syncMaster(This,b) ) 

#define ITIMEElement_put_syncMaster(This,b)	\
    ( (This)->lpVtbl -> put_syncMaster(This,b) ) 

#define ITIMEElement_get_timeAction(This,time)	\
    ( (This)->lpVtbl -> get_timeAction(This,time) ) 

#define ITIMEElement_put_timeAction(This,time)	\
    ( (This)->lpVtbl -> put_timeAction(This,time) ) 

#define ITIMEElement_get_timeContainer(This,__MIDL__ITIMEElement0008)	\
    ( (This)->lpVtbl -> get_timeContainer(This,__MIDL__ITIMEElement0008) ) 

#define ITIMEElement_get_volume(This,val)	\
    ( (This)->lpVtbl -> get_volume(This,val) ) 

#define ITIMEElement_put_volume(This,val)	\
    ( (This)->lpVtbl -> put_volume(This,val) ) 

#define ITIMEElement_get_currTimeState(This,TimeState)	\
    ( (This)->lpVtbl -> get_currTimeState(This,TimeState) ) 

#define ITIMEElement_get_timeAll(This,allColl)	\
    ( (This)->lpVtbl -> get_timeAll(This,allColl) ) 

#define ITIMEElement_get_timeChildren(This,childColl)	\
    ( (This)->lpVtbl -> get_timeChildren(This,childColl) ) 

#define ITIMEElement_get_timeParent(This,parent)	\
    ( (This)->lpVtbl -> get_timeParent(This,parent) ) 

#define ITIMEElement_get_isPaused(This,b)	\
    ( (This)->lpVtbl -> get_isPaused(This,b) ) 

#define ITIMEElement_beginElement(This)	\
    ( (This)->lpVtbl -> beginElement(This) ) 

#define ITIMEElement_beginElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> beginElementAt(This,parentTime) ) 

#define ITIMEElement_endElement(This)	\
    ( (This)->lpVtbl -> endElement(This) ) 

#define ITIMEElement_endElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> endElementAt(This,parentTime) ) 

#define ITIMEElement_pauseElement(This)	\
    ( (This)->lpVtbl -> pauseElement(This) ) 

#define ITIMEElement_resetElement(This)	\
    ( (This)->lpVtbl -> resetElement(This) ) 

#define ITIMEElement_resumeElement(This)	\
    ( (This)->lpVtbl -> resumeElement(This) ) 

#define ITIMEElement_seekActiveTime(This,activeTime)	\
    ( (This)->lpVtbl -> seekActiveTime(This,activeTime) ) 

#define ITIMEElement_seekSegmentTime(This,segmentTime)	\
    ( (This)->lpVtbl -> seekSegmentTime(This,segmentTime) ) 

#define ITIMEElement_seekTo(This,repeatCount,segmentTime)	\
    ( (This)->lpVtbl -> seekTo(This,repeatCount,segmentTime) ) 

#define ITIMEElement_documentTimeToParentTime(This,documentTime,parentTime)	\
    ( (This)->lpVtbl -> documentTimeToParentTime(This,documentTime,parentTime) ) 

#define ITIMEElement_parentTimeToDocumentTime(This,parentTime,documentTime)	\
    ( (This)->lpVtbl -> parentTimeToDocumentTime(This,parentTime,documentTime) ) 

#define ITIMEElement_parentTimeToActiveTime(This,parentTime,activeTime)	\
    ( (This)->lpVtbl -> parentTimeToActiveTime(This,parentTime,activeTime) ) 

#define ITIMEElement_activeTimeToParentTime(This,activeTime,parentTime)	\
    ( (This)->lpVtbl -> activeTimeToParentTime(This,activeTime,parentTime) ) 

#define ITIMEElement_activeTimeToSegmentTime(This,activeTime,segmentTime)	\
    ( (This)->lpVtbl -> activeTimeToSegmentTime(This,activeTime,segmentTime) ) 

#define ITIMEElement_segmentTimeToActiveTime(This,segmentTime,activeTime)	\
    ( (This)->lpVtbl -> segmentTimeToActiveTime(This,segmentTime,activeTime) ) 

#define ITIMEElement_segmentTimeToSimpleTime(This,segmentTime,simpleTime)	\
    ( (This)->lpVtbl -> segmentTimeToSimpleTime(This,segmentTime,simpleTime) ) 

#define ITIMEElement_simpleTimeToSegmentTime(This,simpleTime,segmentTime)	\
    ( (This)->lpVtbl -> simpleTimeToSegmentTime(This,simpleTime,segmentTime) ) 

#define ITIMEElement_get_endSync(This,es)	\
    ( (This)->lpVtbl -> get_endSync(This,es) ) 

#define ITIMEElement_put_endSync(This,es)	\
    ( (This)->lpVtbl -> put_endSync(This,es) ) 

#define ITIMEElement_get_activeElements(This,activeColl)	\
    ( (This)->lpVtbl -> get_activeElements(This,activeColl) ) 

#define ITIMEElement_get_hasMedia(This,flag)	\
    ( (This)->lpVtbl -> get_hasMedia(This,flag) ) 

#define ITIMEElement_nextElement(This)	\
    ( (This)->lpVtbl -> nextElement(This) ) 

#define ITIMEElement_prevElement(This)	\
    ( (This)->lpVtbl -> prevElement(This) ) 

#define ITIMEElement_get_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> get_updateMode(This,updateMode) ) 

#define ITIMEElement_put_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> put_updateMode(This,updateMode) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEElement_INTERFACE_DEFINED__ */


#ifndef __ITIMEBodyElement_INTERFACE_DEFINED__
#define __ITIMEBodyElement_INTERFACE_DEFINED__

/* interface ITIMEBodyElement */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEBodyElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8c90e348-ec0a-4229-90b0-e57d2ca45ccb")
    ITIMEBodyElement : public ITIMEElement
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITIMEBodyElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEBodyElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEBodyElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEBodyElement * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEBodyElement * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accelerate )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accelerate )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0001);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_autoReverse )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_autoReverse )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0003);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_decelerate )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_decelerate )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0005);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fill )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fill )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in BSTR f);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mute )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *c);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT c);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatDur )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatDur )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_restart )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_restart )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *speed);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_speed )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncBehavior )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncBehavior )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in BSTR sync);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncTolerance )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *tol);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncTolerance )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT tol);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncMaster )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncMaster )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAction )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeAction )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in BSTR time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeContainer )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTimeState )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAll )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeChildren )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeParent )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElementAt )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElementAt )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pauseElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resetElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resumeElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekActiveTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekSegmentTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekTo )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *documentTimeToParentTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToDocumentTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToActiveTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToParentTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToSegmentTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToActiveTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToSimpleTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *simpleTimeToSegmentTime )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endSync )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endSync )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in BSTR es);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeElements )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasMedia )( 
            __RPC__in ITIMEBodyElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevElement )( 
            __RPC__in ITIMEBodyElement * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_updateMode )( 
            __RPC__in ITIMEBodyElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_updateMode )( 
            __RPC__in ITIMEBodyElement * This,
            /* [in] */ __RPC__in BSTR updateMode);
        
        END_INTERFACE
    } ITIMEBodyElementVtbl;

    interface ITIMEBodyElement
    {
        CONST_VTBL struct ITIMEBodyElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEBodyElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEBodyElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEBodyElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEBodyElement_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEBodyElement_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEBodyElement_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEBodyElement_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEBodyElement_get_accelerate(This,__MIDL__ITIMEElement0000)	\
    ( (This)->lpVtbl -> get_accelerate(This,__MIDL__ITIMEElement0000) ) 

#define ITIMEBodyElement_put_accelerate(This,__MIDL__ITIMEElement0001)	\
    ( (This)->lpVtbl -> put_accelerate(This,__MIDL__ITIMEElement0001) ) 

#define ITIMEBodyElement_get_autoReverse(This,__MIDL__ITIMEElement0002)	\
    ( (This)->lpVtbl -> get_autoReverse(This,__MIDL__ITIMEElement0002) ) 

#define ITIMEBodyElement_put_autoReverse(This,__MIDL__ITIMEElement0003)	\
    ( (This)->lpVtbl -> put_autoReverse(This,__MIDL__ITIMEElement0003) ) 

#define ITIMEBodyElement_get_begin(This,time)	\
    ( (This)->lpVtbl -> get_begin(This,time) ) 

#define ITIMEBodyElement_put_begin(This,time)	\
    ( (This)->lpVtbl -> put_begin(This,time) ) 

#define ITIMEBodyElement_get_decelerate(This,__MIDL__ITIMEElement0004)	\
    ( (This)->lpVtbl -> get_decelerate(This,__MIDL__ITIMEElement0004) ) 

#define ITIMEBodyElement_put_decelerate(This,__MIDL__ITIMEElement0005)	\
    ( (This)->lpVtbl -> put_decelerate(This,__MIDL__ITIMEElement0005) ) 

#define ITIMEBodyElement_get_dur(This,time)	\
    ( (This)->lpVtbl -> get_dur(This,time) ) 

#define ITIMEBodyElement_put_dur(This,time)	\
    ( (This)->lpVtbl -> put_dur(This,time) ) 

#define ITIMEBodyElement_get_end(This,time)	\
    ( (This)->lpVtbl -> get_end(This,time) ) 

#define ITIMEBodyElement_put_end(This,time)	\
    ( (This)->lpVtbl -> put_end(This,time) ) 

#define ITIMEBodyElement_get_fill(This,f)	\
    ( (This)->lpVtbl -> get_fill(This,f) ) 

#define ITIMEBodyElement_put_fill(This,f)	\
    ( (This)->lpVtbl -> put_fill(This,f) ) 

#define ITIMEBodyElement_get_mute(This,b)	\
    ( (This)->lpVtbl -> get_mute(This,b) ) 

#define ITIMEBodyElement_put_mute(This,b)	\
    ( (This)->lpVtbl -> put_mute(This,b) ) 

#define ITIMEBodyElement_get_repeatCount(This,c)	\
    ( (This)->lpVtbl -> get_repeatCount(This,c) ) 

#define ITIMEBodyElement_put_repeatCount(This,c)	\
    ( (This)->lpVtbl -> put_repeatCount(This,c) ) 

#define ITIMEBodyElement_get_repeatDur(This,time)	\
    ( (This)->lpVtbl -> get_repeatDur(This,time) ) 

#define ITIMEBodyElement_put_repeatDur(This,time)	\
    ( (This)->lpVtbl -> put_repeatDur(This,time) ) 

#define ITIMEBodyElement_get_restart(This,__MIDL__ITIMEElement0006)	\
    ( (This)->lpVtbl -> get_restart(This,__MIDL__ITIMEElement0006) ) 

#define ITIMEBodyElement_put_restart(This,__MIDL__ITIMEElement0007)	\
    ( (This)->lpVtbl -> put_restart(This,__MIDL__ITIMEElement0007) ) 

#define ITIMEBodyElement_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEBodyElement_put_speed(This,speed)	\
    ( (This)->lpVtbl -> put_speed(This,speed) ) 

#define ITIMEBodyElement_get_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> get_syncBehavior(This,sync) ) 

#define ITIMEBodyElement_put_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> put_syncBehavior(This,sync) ) 

#define ITIMEBodyElement_get_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> get_syncTolerance(This,tol) ) 

#define ITIMEBodyElement_put_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> put_syncTolerance(This,tol) ) 

#define ITIMEBodyElement_get_syncMaster(This,b)	\
    ( (This)->lpVtbl -> get_syncMaster(This,b) ) 

#define ITIMEBodyElement_put_syncMaster(This,b)	\
    ( (This)->lpVtbl -> put_syncMaster(This,b) ) 

#define ITIMEBodyElement_get_timeAction(This,time)	\
    ( (This)->lpVtbl -> get_timeAction(This,time) ) 

#define ITIMEBodyElement_put_timeAction(This,time)	\
    ( (This)->lpVtbl -> put_timeAction(This,time) ) 

#define ITIMEBodyElement_get_timeContainer(This,__MIDL__ITIMEElement0008)	\
    ( (This)->lpVtbl -> get_timeContainer(This,__MIDL__ITIMEElement0008) ) 

#define ITIMEBodyElement_get_volume(This,val)	\
    ( (This)->lpVtbl -> get_volume(This,val) ) 

#define ITIMEBodyElement_put_volume(This,val)	\
    ( (This)->lpVtbl -> put_volume(This,val) ) 

#define ITIMEBodyElement_get_currTimeState(This,TimeState)	\
    ( (This)->lpVtbl -> get_currTimeState(This,TimeState) ) 

#define ITIMEBodyElement_get_timeAll(This,allColl)	\
    ( (This)->lpVtbl -> get_timeAll(This,allColl) ) 

#define ITIMEBodyElement_get_timeChildren(This,childColl)	\
    ( (This)->lpVtbl -> get_timeChildren(This,childColl) ) 

#define ITIMEBodyElement_get_timeParent(This,parent)	\
    ( (This)->lpVtbl -> get_timeParent(This,parent) ) 

#define ITIMEBodyElement_get_isPaused(This,b)	\
    ( (This)->lpVtbl -> get_isPaused(This,b) ) 

#define ITIMEBodyElement_beginElement(This)	\
    ( (This)->lpVtbl -> beginElement(This) ) 

#define ITIMEBodyElement_beginElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> beginElementAt(This,parentTime) ) 

#define ITIMEBodyElement_endElement(This)	\
    ( (This)->lpVtbl -> endElement(This) ) 

#define ITIMEBodyElement_endElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> endElementAt(This,parentTime) ) 

#define ITIMEBodyElement_pauseElement(This)	\
    ( (This)->lpVtbl -> pauseElement(This) ) 

#define ITIMEBodyElement_resetElement(This)	\
    ( (This)->lpVtbl -> resetElement(This) ) 

#define ITIMEBodyElement_resumeElement(This)	\
    ( (This)->lpVtbl -> resumeElement(This) ) 

#define ITIMEBodyElement_seekActiveTime(This,activeTime)	\
    ( (This)->lpVtbl -> seekActiveTime(This,activeTime) ) 

#define ITIMEBodyElement_seekSegmentTime(This,segmentTime)	\
    ( (This)->lpVtbl -> seekSegmentTime(This,segmentTime) ) 

#define ITIMEBodyElement_seekTo(This,repeatCount,segmentTime)	\
    ( (This)->lpVtbl -> seekTo(This,repeatCount,segmentTime) ) 

#define ITIMEBodyElement_documentTimeToParentTime(This,documentTime,parentTime)	\
    ( (This)->lpVtbl -> documentTimeToParentTime(This,documentTime,parentTime) ) 

#define ITIMEBodyElement_parentTimeToDocumentTime(This,parentTime,documentTime)	\
    ( (This)->lpVtbl -> parentTimeToDocumentTime(This,parentTime,documentTime) ) 

#define ITIMEBodyElement_parentTimeToActiveTime(This,parentTime,activeTime)	\
    ( (This)->lpVtbl -> parentTimeToActiveTime(This,parentTime,activeTime) ) 

#define ITIMEBodyElement_activeTimeToParentTime(This,activeTime,parentTime)	\
    ( (This)->lpVtbl -> activeTimeToParentTime(This,activeTime,parentTime) ) 

#define ITIMEBodyElement_activeTimeToSegmentTime(This,activeTime,segmentTime)	\
    ( (This)->lpVtbl -> activeTimeToSegmentTime(This,activeTime,segmentTime) ) 

#define ITIMEBodyElement_segmentTimeToActiveTime(This,segmentTime,activeTime)	\
    ( (This)->lpVtbl -> segmentTimeToActiveTime(This,segmentTime,activeTime) ) 

#define ITIMEBodyElement_segmentTimeToSimpleTime(This,segmentTime,simpleTime)	\
    ( (This)->lpVtbl -> segmentTimeToSimpleTime(This,segmentTime,simpleTime) ) 

#define ITIMEBodyElement_simpleTimeToSegmentTime(This,simpleTime,segmentTime)	\
    ( (This)->lpVtbl -> simpleTimeToSegmentTime(This,simpleTime,segmentTime) ) 

#define ITIMEBodyElement_get_endSync(This,es)	\
    ( (This)->lpVtbl -> get_endSync(This,es) ) 

#define ITIMEBodyElement_put_endSync(This,es)	\
    ( (This)->lpVtbl -> put_endSync(This,es) ) 

#define ITIMEBodyElement_get_activeElements(This,activeColl)	\
    ( (This)->lpVtbl -> get_activeElements(This,activeColl) ) 

#define ITIMEBodyElement_get_hasMedia(This,flag)	\
    ( (This)->lpVtbl -> get_hasMedia(This,flag) ) 

#define ITIMEBodyElement_nextElement(This)	\
    ( (This)->lpVtbl -> nextElement(This) ) 

#define ITIMEBodyElement_prevElement(This)	\
    ( (This)->lpVtbl -> prevElement(This) ) 

#define ITIMEBodyElement_get_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> get_updateMode(This,updateMode) ) 

#define ITIMEBodyElement_put_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> put_updateMode(This,updateMode) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEBodyElement_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaElement_INTERFACE_DEFINED__
#define __ITIMEMediaElement_INTERFACE_DEFINED__

/* interface ITIMEMediaElement */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("47a6972f-ae65-4a6b-ae63-d0c1d5307b58")
    ITIMEMediaElement : public ITIMEElement
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_clipBegin( 
            /* [retval][out] */ __RPC__out VARIANT *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_clipBegin( 
            /* [in] */ VARIANT time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_clipEnd( 
            /* [retval][out] */ __RPC__out VARIANT *time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_clipEnd( 
            /* [in] */ VARIANT time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_player( 
            /* [retval][out] */ __RPC__out VARIANT *id) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_player( 
            /* [in] */ VARIANT id) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_src( 
            /* [retval][out] */ __RPC__out VARIANT *url) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_src( 
            /* [in] */ VARIANT url) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_type( 
            /* [retval][out] */ __RPC__out VARIANT *mimetype) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_type( 
            /* [in] */ VARIANT mimetype) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_abstract( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_author( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_copyright( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasAudio( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasVisual( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mediaDur( 
            /* [retval][out] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mediaHeight( 
            /* [retval][out] */ __RPC__out long *height) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mediaWidth( 
            /* [retval][out] */ __RPC__out long *width) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_playerObject( 
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **ppDisp) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_playList( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayList **pPlayList) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_rating( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_title( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *name) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasPlayList( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_canPause( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_canSeek( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEMediaElement * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEMediaElement * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accelerate )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accelerate )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0001);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_autoReverse )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_autoReverse )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0003);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_decelerate )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_decelerate )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0005);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fill )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fill )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in BSTR f);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mute )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *c);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT c);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatDur )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatDur )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_restart )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_restart )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *speed);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_speed )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncBehavior )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncBehavior )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in BSTR sync);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncTolerance )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *tol);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncTolerance )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT tol);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncMaster )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncMaster )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAction )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeAction )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in BSTR time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeContainer )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTimeState )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAll )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeChildren )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeParent )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElementAt )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElementAt )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pauseElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resetElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resumeElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekActiveTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekSegmentTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekTo )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *documentTimeToParentTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToDocumentTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToActiveTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToParentTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToSegmentTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToActiveTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToSimpleTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *simpleTimeToSegmentTime )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endSync )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endSync )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in BSTR es);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeElements )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasMedia )( 
            __RPC__in ITIMEMediaElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevElement )( 
            __RPC__in ITIMEMediaElement * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_updateMode )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_updateMode )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ __RPC__in BSTR updateMode);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_clipBegin )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_clipBegin )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_clipEnd )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_clipEnd )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_player )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *id);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_player )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT id);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_src )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *url);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_src )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT url);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_type )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT *mimetype);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_type )( 
            __RPC__in ITIMEMediaElement * This,
            /* [in] */ VARIANT mimetype);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_abstract )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_author )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copyright )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasAudio )( 
            __RPC__in ITIMEMediaElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasVisual )( 
            __RPC__in ITIMEMediaElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaDur )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaHeight )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out long *height);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaWidth )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out long *width);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_playerObject )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **ppDisp);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_playList )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayList **pPlayList);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_rating )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *name);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasPlayList )( 
            __RPC__in ITIMEMediaElement * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_canPause )( 
            __RPC__in ITIMEMediaElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_canSeek )( 
            __RPC__in ITIMEMediaElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        END_INTERFACE
    } ITIMEMediaElementVtbl;

    interface ITIMEMediaElement
    {
        CONST_VTBL struct ITIMEMediaElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaElement_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEMediaElement_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEMediaElement_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEMediaElement_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEMediaElement_get_accelerate(This,__MIDL__ITIMEElement0000)	\
    ( (This)->lpVtbl -> get_accelerate(This,__MIDL__ITIMEElement0000) ) 

#define ITIMEMediaElement_put_accelerate(This,__MIDL__ITIMEElement0001)	\
    ( (This)->lpVtbl -> put_accelerate(This,__MIDL__ITIMEElement0001) ) 

#define ITIMEMediaElement_get_autoReverse(This,__MIDL__ITIMEElement0002)	\
    ( (This)->lpVtbl -> get_autoReverse(This,__MIDL__ITIMEElement0002) ) 

#define ITIMEMediaElement_put_autoReverse(This,__MIDL__ITIMEElement0003)	\
    ( (This)->lpVtbl -> put_autoReverse(This,__MIDL__ITIMEElement0003) ) 

#define ITIMEMediaElement_get_begin(This,time)	\
    ( (This)->lpVtbl -> get_begin(This,time) ) 

#define ITIMEMediaElement_put_begin(This,time)	\
    ( (This)->lpVtbl -> put_begin(This,time) ) 

#define ITIMEMediaElement_get_decelerate(This,__MIDL__ITIMEElement0004)	\
    ( (This)->lpVtbl -> get_decelerate(This,__MIDL__ITIMEElement0004) ) 

#define ITIMEMediaElement_put_decelerate(This,__MIDL__ITIMEElement0005)	\
    ( (This)->lpVtbl -> put_decelerate(This,__MIDL__ITIMEElement0005) ) 

#define ITIMEMediaElement_get_dur(This,time)	\
    ( (This)->lpVtbl -> get_dur(This,time) ) 

#define ITIMEMediaElement_put_dur(This,time)	\
    ( (This)->lpVtbl -> put_dur(This,time) ) 

#define ITIMEMediaElement_get_end(This,time)	\
    ( (This)->lpVtbl -> get_end(This,time) ) 

#define ITIMEMediaElement_put_end(This,time)	\
    ( (This)->lpVtbl -> put_end(This,time) ) 

#define ITIMEMediaElement_get_fill(This,f)	\
    ( (This)->lpVtbl -> get_fill(This,f) ) 

#define ITIMEMediaElement_put_fill(This,f)	\
    ( (This)->lpVtbl -> put_fill(This,f) ) 

#define ITIMEMediaElement_get_mute(This,b)	\
    ( (This)->lpVtbl -> get_mute(This,b) ) 

#define ITIMEMediaElement_put_mute(This,b)	\
    ( (This)->lpVtbl -> put_mute(This,b) ) 

#define ITIMEMediaElement_get_repeatCount(This,c)	\
    ( (This)->lpVtbl -> get_repeatCount(This,c) ) 

#define ITIMEMediaElement_put_repeatCount(This,c)	\
    ( (This)->lpVtbl -> put_repeatCount(This,c) ) 

#define ITIMEMediaElement_get_repeatDur(This,time)	\
    ( (This)->lpVtbl -> get_repeatDur(This,time) ) 

#define ITIMEMediaElement_put_repeatDur(This,time)	\
    ( (This)->lpVtbl -> put_repeatDur(This,time) ) 

#define ITIMEMediaElement_get_restart(This,__MIDL__ITIMEElement0006)	\
    ( (This)->lpVtbl -> get_restart(This,__MIDL__ITIMEElement0006) ) 

#define ITIMEMediaElement_put_restart(This,__MIDL__ITIMEElement0007)	\
    ( (This)->lpVtbl -> put_restart(This,__MIDL__ITIMEElement0007) ) 

#define ITIMEMediaElement_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEMediaElement_put_speed(This,speed)	\
    ( (This)->lpVtbl -> put_speed(This,speed) ) 

#define ITIMEMediaElement_get_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> get_syncBehavior(This,sync) ) 

#define ITIMEMediaElement_put_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> put_syncBehavior(This,sync) ) 

#define ITIMEMediaElement_get_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> get_syncTolerance(This,tol) ) 

#define ITIMEMediaElement_put_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> put_syncTolerance(This,tol) ) 

#define ITIMEMediaElement_get_syncMaster(This,b)	\
    ( (This)->lpVtbl -> get_syncMaster(This,b) ) 

#define ITIMEMediaElement_put_syncMaster(This,b)	\
    ( (This)->lpVtbl -> put_syncMaster(This,b) ) 

#define ITIMEMediaElement_get_timeAction(This,time)	\
    ( (This)->lpVtbl -> get_timeAction(This,time) ) 

#define ITIMEMediaElement_put_timeAction(This,time)	\
    ( (This)->lpVtbl -> put_timeAction(This,time) ) 

#define ITIMEMediaElement_get_timeContainer(This,__MIDL__ITIMEElement0008)	\
    ( (This)->lpVtbl -> get_timeContainer(This,__MIDL__ITIMEElement0008) ) 

#define ITIMEMediaElement_get_volume(This,val)	\
    ( (This)->lpVtbl -> get_volume(This,val) ) 

#define ITIMEMediaElement_put_volume(This,val)	\
    ( (This)->lpVtbl -> put_volume(This,val) ) 

#define ITIMEMediaElement_get_currTimeState(This,TimeState)	\
    ( (This)->lpVtbl -> get_currTimeState(This,TimeState) ) 

#define ITIMEMediaElement_get_timeAll(This,allColl)	\
    ( (This)->lpVtbl -> get_timeAll(This,allColl) ) 

#define ITIMEMediaElement_get_timeChildren(This,childColl)	\
    ( (This)->lpVtbl -> get_timeChildren(This,childColl) ) 

#define ITIMEMediaElement_get_timeParent(This,parent)	\
    ( (This)->lpVtbl -> get_timeParent(This,parent) ) 

#define ITIMEMediaElement_get_isPaused(This,b)	\
    ( (This)->lpVtbl -> get_isPaused(This,b) ) 

#define ITIMEMediaElement_beginElement(This)	\
    ( (This)->lpVtbl -> beginElement(This) ) 

#define ITIMEMediaElement_beginElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> beginElementAt(This,parentTime) ) 

#define ITIMEMediaElement_endElement(This)	\
    ( (This)->lpVtbl -> endElement(This) ) 

#define ITIMEMediaElement_endElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> endElementAt(This,parentTime) ) 

#define ITIMEMediaElement_pauseElement(This)	\
    ( (This)->lpVtbl -> pauseElement(This) ) 

#define ITIMEMediaElement_resetElement(This)	\
    ( (This)->lpVtbl -> resetElement(This) ) 

#define ITIMEMediaElement_resumeElement(This)	\
    ( (This)->lpVtbl -> resumeElement(This) ) 

#define ITIMEMediaElement_seekActiveTime(This,activeTime)	\
    ( (This)->lpVtbl -> seekActiveTime(This,activeTime) ) 

#define ITIMEMediaElement_seekSegmentTime(This,segmentTime)	\
    ( (This)->lpVtbl -> seekSegmentTime(This,segmentTime) ) 

#define ITIMEMediaElement_seekTo(This,repeatCount,segmentTime)	\
    ( (This)->lpVtbl -> seekTo(This,repeatCount,segmentTime) ) 

#define ITIMEMediaElement_documentTimeToParentTime(This,documentTime,parentTime)	\
    ( (This)->lpVtbl -> documentTimeToParentTime(This,documentTime,parentTime) ) 

#define ITIMEMediaElement_parentTimeToDocumentTime(This,parentTime,documentTime)	\
    ( (This)->lpVtbl -> parentTimeToDocumentTime(This,parentTime,documentTime) ) 

#define ITIMEMediaElement_parentTimeToActiveTime(This,parentTime,activeTime)	\
    ( (This)->lpVtbl -> parentTimeToActiveTime(This,parentTime,activeTime) ) 

#define ITIMEMediaElement_activeTimeToParentTime(This,activeTime,parentTime)	\
    ( (This)->lpVtbl -> activeTimeToParentTime(This,activeTime,parentTime) ) 

#define ITIMEMediaElement_activeTimeToSegmentTime(This,activeTime,segmentTime)	\
    ( (This)->lpVtbl -> activeTimeToSegmentTime(This,activeTime,segmentTime) ) 

#define ITIMEMediaElement_segmentTimeToActiveTime(This,segmentTime,activeTime)	\
    ( (This)->lpVtbl -> segmentTimeToActiveTime(This,segmentTime,activeTime) ) 

#define ITIMEMediaElement_segmentTimeToSimpleTime(This,segmentTime,simpleTime)	\
    ( (This)->lpVtbl -> segmentTimeToSimpleTime(This,segmentTime,simpleTime) ) 

#define ITIMEMediaElement_simpleTimeToSegmentTime(This,simpleTime,segmentTime)	\
    ( (This)->lpVtbl -> simpleTimeToSegmentTime(This,simpleTime,segmentTime) ) 

#define ITIMEMediaElement_get_endSync(This,es)	\
    ( (This)->lpVtbl -> get_endSync(This,es) ) 

#define ITIMEMediaElement_put_endSync(This,es)	\
    ( (This)->lpVtbl -> put_endSync(This,es) ) 

#define ITIMEMediaElement_get_activeElements(This,activeColl)	\
    ( (This)->lpVtbl -> get_activeElements(This,activeColl) ) 

#define ITIMEMediaElement_get_hasMedia(This,flag)	\
    ( (This)->lpVtbl -> get_hasMedia(This,flag) ) 

#define ITIMEMediaElement_nextElement(This)	\
    ( (This)->lpVtbl -> nextElement(This) ) 

#define ITIMEMediaElement_prevElement(This)	\
    ( (This)->lpVtbl -> prevElement(This) ) 

#define ITIMEMediaElement_get_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> get_updateMode(This,updateMode) ) 

#define ITIMEMediaElement_put_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> put_updateMode(This,updateMode) ) 


#define ITIMEMediaElement_get_clipBegin(This,time)	\
    ( (This)->lpVtbl -> get_clipBegin(This,time) ) 

#define ITIMEMediaElement_put_clipBegin(This,time)	\
    ( (This)->lpVtbl -> put_clipBegin(This,time) ) 

#define ITIMEMediaElement_get_clipEnd(This,time)	\
    ( (This)->lpVtbl -> get_clipEnd(This,time) ) 

#define ITIMEMediaElement_put_clipEnd(This,time)	\
    ( (This)->lpVtbl -> put_clipEnd(This,time) ) 

#define ITIMEMediaElement_get_player(This,id)	\
    ( (This)->lpVtbl -> get_player(This,id) ) 

#define ITIMEMediaElement_put_player(This,id)	\
    ( (This)->lpVtbl -> put_player(This,id) ) 

#define ITIMEMediaElement_get_src(This,url)	\
    ( (This)->lpVtbl -> get_src(This,url) ) 

#define ITIMEMediaElement_put_src(This,url)	\
    ( (This)->lpVtbl -> put_src(This,url) ) 

#define ITIMEMediaElement_get_type(This,mimetype)	\
    ( (This)->lpVtbl -> get_type(This,mimetype) ) 

#define ITIMEMediaElement_put_type(This,mimetype)	\
    ( (This)->lpVtbl -> put_type(This,mimetype) ) 

#define ITIMEMediaElement_get_abstract(This,abs)	\
    ( (This)->lpVtbl -> get_abstract(This,abs) ) 

#define ITIMEMediaElement_get_author(This,auth)	\
    ( (This)->lpVtbl -> get_author(This,auth) ) 

#define ITIMEMediaElement_get_copyright(This,cpyrght)	\
    ( (This)->lpVtbl -> get_copyright(This,cpyrght) ) 

#define ITIMEMediaElement_get_hasAudio(This,b)	\
    ( (This)->lpVtbl -> get_hasAudio(This,b) ) 

#define ITIMEMediaElement_get_hasVisual(This,b)	\
    ( (This)->lpVtbl -> get_hasVisual(This,b) ) 

#define ITIMEMediaElement_get_mediaDur(This,dur)	\
    ( (This)->lpVtbl -> get_mediaDur(This,dur) ) 

#define ITIMEMediaElement_get_mediaHeight(This,height)	\
    ( (This)->lpVtbl -> get_mediaHeight(This,height) ) 

#define ITIMEMediaElement_get_mediaWidth(This,width)	\
    ( (This)->lpVtbl -> get_mediaWidth(This,width) ) 

#define ITIMEMediaElement_get_playerObject(This,ppDisp)	\
    ( (This)->lpVtbl -> get_playerObject(This,ppDisp) ) 

#define ITIMEMediaElement_get_playList(This,pPlayList)	\
    ( (This)->lpVtbl -> get_playList(This,pPlayList) ) 

#define ITIMEMediaElement_get_rating(This,rate)	\
    ( (This)->lpVtbl -> get_rating(This,rate) ) 

#define ITIMEMediaElement_get_title(This,name)	\
    ( (This)->lpVtbl -> get_title(This,name) ) 

#define ITIMEMediaElement_get_hasPlayList(This,b)	\
    ( (This)->lpVtbl -> get_hasPlayList(This,b) ) 

#define ITIMEMediaElement_get_canPause(This,b)	\
    ( (This)->lpVtbl -> get_canPause(This,b) ) 

#define ITIMEMediaElement_get_canSeek(This,b)	\
    ( (This)->lpVtbl -> get_canSeek(This,b) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaElement_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaElement2_INTERFACE_DEFINED__
#define __ITIMEMediaElement2_INTERFACE_DEFINED__

/* interface ITIMEMediaElement2 */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaElement2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9EE29400-7EE6-453a-85B3-4EC28E0305B4")
    ITIMEMediaElement2 : public ITIMEMediaElement
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_earliestMediaTime( 
            /* [retval][out] */ __RPC__out VARIANT *earliestMediaTime) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_latestMediaTime( 
            /* [retval][out] */ __RPC__out VARIANT *latestMediaTime) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_minBufferedMediaDur( 
            /* [retval][out] */ __RPC__out VARIANT *minBufferedMediaDur) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_minBufferedMediaDur( 
            /* [in] */ VARIANT minBufferedMediaDur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_downloadTotal( 
            /* [retval][out] */ __RPC__out VARIANT *downloadTotal) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_downloadCurrent( 
            /* [retval][out] */ __RPC__out VARIANT *downloadCurrent) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isStreamed( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_bufferingProgress( 
            /* [retval][out] */ __RPC__out VARIANT *bufferingProgress) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasDownloadProgress( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_downloadProgress( 
            /* [retval][out] */ __RPC__out VARIANT *downloadProgress) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mimeType( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *mimeType) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE seekToFrame( 
            /* [in] */ long frameNr) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE decodeMimeType( 
            /* [in] */ __RPC__in TCHAR *header,
            /* [in] */ long headerSize,
            /* [out] */ __RPC__deref_out_opt BSTR *mimeType) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_currentFrame( 
            /* [retval][out] */ __RPC__out long *currFrame) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaElement2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEMediaElement2 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accelerate )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accelerate )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0001);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_autoReverse )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_autoReverse )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0003);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_decelerate )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_decelerate )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0005);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fill )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fill )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in BSTR f);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mute )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *c);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT c);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatDur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatDur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_restart )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_restart )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *speed);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_speed )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncBehavior )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncBehavior )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in BSTR sync);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncTolerance )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *tol);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncTolerance )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT tol);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncMaster )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncMaster )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAction )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeAction )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in BSTR time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeContainer )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTimeState )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAll )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeChildren )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeParent )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElementAt )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElementAt )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pauseElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resetElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resumeElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekActiveTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekSegmentTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekTo )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *documentTimeToParentTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToDocumentTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToActiveTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToParentTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToSegmentTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToActiveTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToSimpleTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *simpleTimeToSegmentTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endSync )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endSync )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in BSTR es);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeElements )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasMedia )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevElement )( 
            __RPC__in ITIMEMediaElement2 * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_updateMode )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_updateMode )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in BSTR updateMode);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_clipBegin )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_clipBegin )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_clipEnd )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_clipEnd )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_player )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *id);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_player )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT id);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_src )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *url);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_src )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT url);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_type )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *mimetype);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_type )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT mimetype);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_abstract )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_author )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copyright )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasAudio )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasVisual )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaDur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaHeight )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out long *height);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaWidth )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out long *width);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_playerObject )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **ppDisp);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_playList )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayList **pPlayList);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_rating )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *name);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasPlayList )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_canPause )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_canSeek )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_earliestMediaTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *earliestMediaTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_latestMediaTime )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *latestMediaTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_minBufferedMediaDur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *minBufferedMediaDur);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_minBufferedMediaDur )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ VARIANT minBufferedMediaDur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_downloadTotal )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *downloadTotal);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_downloadCurrent )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *downloadCurrent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isStreamed )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_bufferingProgress )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *bufferingProgress);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasDownloadProgress )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_downloadProgress )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *downloadProgress);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mimeType )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *mimeType);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekToFrame )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ long frameNr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *decodeMimeType )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [in] */ __RPC__in TCHAR *header,
            /* [in] */ long headerSize,
            /* [out] */ __RPC__deref_out_opt BSTR *mimeType);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currentFrame )( 
            __RPC__in ITIMEMediaElement2 * This,
            /* [retval][out] */ __RPC__out long *currFrame);
        
        END_INTERFACE
    } ITIMEMediaElement2Vtbl;

    interface ITIMEMediaElement2
    {
        CONST_VTBL struct ITIMEMediaElement2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaElement2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaElement2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaElement2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaElement2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEMediaElement2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEMediaElement2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEMediaElement2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEMediaElement2_get_accelerate(This,__MIDL__ITIMEElement0000)	\
    ( (This)->lpVtbl -> get_accelerate(This,__MIDL__ITIMEElement0000) ) 

#define ITIMEMediaElement2_put_accelerate(This,__MIDL__ITIMEElement0001)	\
    ( (This)->lpVtbl -> put_accelerate(This,__MIDL__ITIMEElement0001) ) 

#define ITIMEMediaElement2_get_autoReverse(This,__MIDL__ITIMEElement0002)	\
    ( (This)->lpVtbl -> get_autoReverse(This,__MIDL__ITIMEElement0002) ) 

#define ITIMEMediaElement2_put_autoReverse(This,__MIDL__ITIMEElement0003)	\
    ( (This)->lpVtbl -> put_autoReverse(This,__MIDL__ITIMEElement0003) ) 

#define ITIMEMediaElement2_get_begin(This,time)	\
    ( (This)->lpVtbl -> get_begin(This,time) ) 

#define ITIMEMediaElement2_put_begin(This,time)	\
    ( (This)->lpVtbl -> put_begin(This,time) ) 

#define ITIMEMediaElement2_get_decelerate(This,__MIDL__ITIMEElement0004)	\
    ( (This)->lpVtbl -> get_decelerate(This,__MIDL__ITIMEElement0004) ) 

#define ITIMEMediaElement2_put_decelerate(This,__MIDL__ITIMEElement0005)	\
    ( (This)->lpVtbl -> put_decelerate(This,__MIDL__ITIMEElement0005) ) 

#define ITIMEMediaElement2_get_dur(This,time)	\
    ( (This)->lpVtbl -> get_dur(This,time) ) 

#define ITIMEMediaElement2_put_dur(This,time)	\
    ( (This)->lpVtbl -> put_dur(This,time) ) 

#define ITIMEMediaElement2_get_end(This,time)	\
    ( (This)->lpVtbl -> get_end(This,time) ) 

#define ITIMEMediaElement2_put_end(This,time)	\
    ( (This)->lpVtbl -> put_end(This,time) ) 

#define ITIMEMediaElement2_get_fill(This,f)	\
    ( (This)->lpVtbl -> get_fill(This,f) ) 

#define ITIMEMediaElement2_put_fill(This,f)	\
    ( (This)->lpVtbl -> put_fill(This,f) ) 

#define ITIMEMediaElement2_get_mute(This,b)	\
    ( (This)->lpVtbl -> get_mute(This,b) ) 

#define ITIMEMediaElement2_put_mute(This,b)	\
    ( (This)->lpVtbl -> put_mute(This,b) ) 

#define ITIMEMediaElement2_get_repeatCount(This,c)	\
    ( (This)->lpVtbl -> get_repeatCount(This,c) ) 

#define ITIMEMediaElement2_put_repeatCount(This,c)	\
    ( (This)->lpVtbl -> put_repeatCount(This,c) ) 

#define ITIMEMediaElement2_get_repeatDur(This,time)	\
    ( (This)->lpVtbl -> get_repeatDur(This,time) ) 

#define ITIMEMediaElement2_put_repeatDur(This,time)	\
    ( (This)->lpVtbl -> put_repeatDur(This,time) ) 

#define ITIMEMediaElement2_get_restart(This,__MIDL__ITIMEElement0006)	\
    ( (This)->lpVtbl -> get_restart(This,__MIDL__ITIMEElement0006) ) 

#define ITIMEMediaElement2_put_restart(This,__MIDL__ITIMEElement0007)	\
    ( (This)->lpVtbl -> put_restart(This,__MIDL__ITIMEElement0007) ) 

#define ITIMEMediaElement2_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEMediaElement2_put_speed(This,speed)	\
    ( (This)->lpVtbl -> put_speed(This,speed) ) 

#define ITIMEMediaElement2_get_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> get_syncBehavior(This,sync) ) 

#define ITIMEMediaElement2_put_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> put_syncBehavior(This,sync) ) 

#define ITIMEMediaElement2_get_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> get_syncTolerance(This,tol) ) 

#define ITIMEMediaElement2_put_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> put_syncTolerance(This,tol) ) 

#define ITIMEMediaElement2_get_syncMaster(This,b)	\
    ( (This)->lpVtbl -> get_syncMaster(This,b) ) 

#define ITIMEMediaElement2_put_syncMaster(This,b)	\
    ( (This)->lpVtbl -> put_syncMaster(This,b) ) 

#define ITIMEMediaElement2_get_timeAction(This,time)	\
    ( (This)->lpVtbl -> get_timeAction(This,time) ) 

#define ITIMEMediaElement2_put_timeAction(This,time)	\
    ( (This)->lpVtbl -> put_timeAction(This,time) ) 

#define ITIMEMediaElement2_get_timeContainer(This,__MIDL__ITIMEElement0008)	\
    ( (This)->lpVtbl -> get_timeContainer(This,__MIDL__ITIMEElement0008) ) 

#define ITIMEMediaElement2_get_volume(This,val)	\
    ( (This)->lpVtbl -> get_volume(This,val) ) 

#define ITIMEMediaElement2_put_volume(This,val)	\
    ( (This)->lpVtbl -> put_volume(This,val) ) 

#define ITIMEMediaElement2_get_currTimeState(This,TimeState)	\
    ( (This)->lpVtbl -> get_currTimeState(This,TimeState) ) 

#define ITIMEMediaElement2_get_timeAll(This,allColl)	\
    ( (This)->lpVtbl -> get_timeAll(This,allColl) ) 

#define ITIMEMediaElement2_get_timeChildren(This,childColl)	\
    ( (This)->lpVtbl -> get_timeChildren(This,childColl) ) 

#define ITIMEMediaElement2_get_timeParent(This,parent)	\
    ( (This)->lpVtbl -> get_timeParent(This,parent) ) 

#define ITIMEMediaElement2_get_isPaused(This,b)	\
    ( (This)->lpVtbl -> get_isPaused(This,b) ) 

#define ITIMEMediaElement2_beginElement(This)	\
    ( (This)->lpVtbl -> beginElement(This) ) 

#define ITIMEMediaElement2_beginElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> beginElementAt(This,parentTime) ) 

#define ITIMEMediaElement2_endElement(This)	\
    ( (This)->lpVtbl -> endElement(This) ) 

#define ITIMEMediaElement2_endElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> endElementAt(This,parentTime) ) 

#define ITIMEMediaElement2_pauseElement(This)	\
    ( (This)->lpVtbl -> pauseElement(This) ) 

#define ITIMEMediaElement2_resetElement(This)	\
    ( (This)->lpVtbl -> resetElement(This) ) 

#define ITIMEMediaElement2_resumeElement(This)	\
    ( (This)->lpVtbl -> resumeElement(This) ) 

#define ITIMEMediaElement2_seekActiveTime(This,activeTime)	\
    ( (This)->lpVtbl -> seekActiveTime(This,activeTime) ) 

#define ITIMEMediaElement2_seekSegmentTime(This,segmentTime)	\
    ( (This)->lpVtbl -> seekSegmentTime(This,segmentTime) ) 

#define ITIMEMediaElement2_seekTo(This,repeatCount,segmentTime)	\
    ( (This)->lpVtbl -> seekTo(This,repeatCount,segmentTime) ) 

#define ITIMEMediaElement2_documentTimeToParentTime(This,documentTime,parentTime)	\
    ( (This)->lpVtbl -> documentTimeToParentTime(This,documentTime,parentTime) ) 

#define ITIMEMediaElement2_parentTimeToDocumentTime(This,parentTime,documentTime)	\
    ( (This)->lpVtbl -> parentTimeToDocumentTime(This,parentTime,documentTime) ) 

#define ITIMEMediaElement2_parentTimeToActiveTime(This,parentTime,activeTime)	\
    ( (This)->lpVtbl -> parentTimeToActiveTime(This,parentTime,activeTime) ) 

#define ITIMEMediaElement2_activeTimeToParentTime(This,activeTime,parentTime)	\
    ( (This)->lpVtbl -> activeTimeToParentTime(This,activeTime,parentTime) ) 

#define ITIMEMediaElement2_activeTimeToSegmentTime(This,activeTime,segmentTime)	\
    ( (This)->lpVtbl -> activeTimeToSegmentTime(This,activeTime,segmentTime) ) 

#define ITIMEMediaElement2_segmentTimeToActiveTime(This,segmentTime,activeTime)	\
    ( (This)->lpVtbl -> segmentTimeToActiveTime(This,segmentTime,activeTime) ) 

#define ITIMEMediaElement2_segmentTimeToSimpleTime(This,segmentTime,simpleTime)	\
    ( (This)->lpVtbl -> segmentTimeToSimpleTime(This,segmentTime,simpleTime) ) 

#define ITIMEMediaElement2_simpleTimeToSegmentTime(This,simpleTime,segmentTime)	\
    ( (This)->lpVtbl -> simpleTimeToSegmentTime(This,simpleTime,segmentTime) ) 

#define ITIMEMediaElement2_get_endSync(This,es)	\
    ( (This)->lpVtbl -> get_endSync(This,es) ) 

#define ITIMEMediaElement2_put_endSync(This,es)	\
    ( (This)->lpVtbl -> put_endSync(This,es) ) 

#define ITIMEMediaElement2_get_activeElements(This,activeColl)	\
    ( (This)->lpVtbl -> get_activeElements(This,activeColl) ) 

#define ITIMEMediaElement2_get_hasMedia(This,flag)	\
    ( (This)->lpVtbl -> get_hasMedia(This,flag) ) 

#define ITIMEMediaElement2_nextElement(This)	\
    ( (This)->lpVtbl -> nextElement(This) ) 

#define ITIMEMediaElement2_prevElement(This)	\
    ( (This)->lpVtbl -> prevElement(This) ) 

#define ITIMEMediaElement2_get_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> get_updateMode(This,updateMode) ) 

#define ITIMEMediaElement2_put_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> put_updateMode(This,updateMode) ) 


#define ITIMEMediaElement2_get_clipBegin(This,time)	\
    ( (This)->lpVtbl -> get_clipBegin(This,time) ) 

#define ITIMEMediaElement2_put_clipBegin(This,time)	\
    ( (This)->lpVtbl -> put_clipBegin(This,time) ) 

#define ITIMEMediaElement2_get_clipEnd(This,time)	\
    ( (This)->lpVtbl -> get_clipEnd(This,time) ) 

#define ITIMEMediaElement2_put_clipEnd(This,time)	\
    ( (This)->lpVtbl -> put_clipEnd(This,time) ) 

#define ITIMEMediaElement2_get_player(This,id)	\
    ( (This)->lpVtbl -> get_player(This,id) ) 

#define ITIMEMediaElement2_put_player(This,id)	\
    ( (This)->lpVtbl -> put_player(This,id) ) 

#define ITIMEMediaElement2_get_src(This,url)	\
    ( (This)->lpVtbl -> get_src(This,url) ) 

#define ITIMEMediaElement2_put_src(This,url)	\
    ( (This)->lpVtbl -> put_src(This,url) ) 

#define ITIMEMediaElement2_get_type(This,mimetype)	\
    ( (This)->lpVtbl -> get_type(This,mimetype) ) 

#define ITIMEMediaElement2_put_type(This,mimetype)	\
    ( (This)->lpVtbl -> put_type(This,mimetype) ) 

#define ITIMEMediaElement2_get_abstract(This,abs)	\
    ( (This)->lpVtbl -> get_abstract(This,abs) ) 

#define ITIMEMediaElement2_get_author(This,auth)	\
    ( (This)->lpVtbl -> get_author(This,auth) ) 

#define ITIMEMediaElement2_get_copyright(This,cpyrght)	\
    ( (This)->lpVtbl -> get_copyright(This,cpyrght) ) 

#define ITIMEMediaElement2_get_hasAudio(This,b)	\
    ( (This)->lpVtbl -> get_hasAudio(This,b) ) 

#define ITIMEMediaElement2_get_hasVisual(This,b)	\
    ( (This)->lpVtbl -> get_hasVisual(This,b) ) 

#define ITIMEMediaElement2_get_mediaDur(This,dur)	\
    ( (This)->lpVtbl -> get_mediaDur(This,dur) ) 

#define ITIMEMediaElement2_get_mediaHeight(This,height)	\
    ( (This)->lpVtbl -> get_mediaHeight(This,height) ) 

#define ITIMEMediaElement2_get_mediaWidth(This,width)	\
    ( (This)->lpVtbl -> get_mediaWidth(This,width) ) 

#define ITIMEMediaElement2_get_playerObject(This,ppDisp)	\
    ( (This)->lpVtbl -> get_playerObject(This,ppDisp) ) 

#define ITIMEMediaElement2_get_playList(This,pPlayList)	\
    ( (This)->lpVtbl -> get_playList(This,pPlayList) ) 

#define ITIMEMediaElement2_get_rating(This,rate)	\
    ( (This)->lpVtbl -> get_rating(This,rate) ) 

#define ITIMEMediaElement2_get_title(This,name)	\
    ( (This)->lpVtbl -> get_title(This,name) ) 

#define ITIMEMediaElement2_get_hasPlayList(This,b)	\
    ( (This)->lpVtbl -> get_hasPlayList(This,b) ) 

#define ITIMEMediaElement2_get_canPause(This,b)	\
    ( (This)->lpVtbl -> get_canPause(This,b) ) 

#define ITIMEMediaElement2_get_canSeek(This,b)	\
    ( (This)->lpVtbl -> get_canSeek(This,b) ) 


#define ITIMEMediaElement2_get_earliestMediaTime(This,earliestMediaTime)	\
    ( (This)->lpVtbl -> get_earliestMediaTime(This,earliestMediaTime) ) 

#define ITIMEMediaElement2_get_latestMediaTime(This,latestMediaTime)	\
    ( (This)->lpVtbl -> get_latestMediaTime(This,latestMediaTime) ) 

#define ITIMEMediaElement2_get_minBufferedMediaDur(This,minBufferedMediaDur)	\
    ( (This)->lpVtbl -> get_minBufferedMediaDur(This,minBufferedMediaDur) ) 

#define ITIMEMediaElement2_put_minBufferedMediaDur(This,minBufferedMediaDur)	\
    ( (This)->lpVtbl -> put_minBufferedMediaDur(This,minBufferedMediaDur) ) 

#define ITIMEMediaElement2_get_downloadTotal(This,downloadTotal)	\
    ( (This)->lpVtbl -> get_downloadTotal(This,downloadTotal) ) 

#define ITIMEMediaElement2_get_downloadCurrent(This,downloadCurrent)	\
    ( (This)->lpVtbl -> get_downloadCurrent(This,downloadCurrent) ) 

#define ITIMEMediaElement2_get_isStreamed(This,b)	\
    ( (This)->lpVtbl -> get_isStreamed(This,b) ) 

#define ITIMEMediaElement2_get_bufferingProgress(This,bufferingProgress)	\
    ( (This)->lpVtbl -> get_bufferingProgress(This,bufferingProgress) ) 

#define ITIMEMediaElement2_get_hasDownloadProgress(This,b)	\
    ( (This)->lpVtbl -> get_hasDownloadProgress(This,b) ) 

#define ITIMEMediaElement2_get_downloadProgress(This,downloadProgress)	\
    ( (This)->lpVtbl -> get_downloadProgress(This,downloadProgress) ) 

#define ITIMEMediaElement2_get_mimeType(This,mimeType)	\
    ( (This)->lpVtbl -> get_mimeType(This,mimeType) ) 

#define ITIMEMediaElement2_seekToFrame(This,frameNr)	\
    ( (This)->lpVtbl -> seekToFrame(This,frameNr) ) 

#define ITIMEMediaElement2_decodeMimeType(This,header,headerSize,mimeType)	\
    ( (This)->lpVtbl -> decodeMimeType(This,header,headerSize,mimeType) ) 

#define ITIMEMediaElement2_get_currentFrame(This,currFrame)	\
    ( (This)->lpVtbl -> get_currentFrame(This,currFrame) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaElement2_INTERFACE_DEFINED__ */


#ifndef __ITIMETransitionElement_INTERFACE_DEFINED__
#define __ITIMETransitionElement_INTERFACE_DEFINED__

/* interface ITIMETransitionElement */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMETransitionElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("f383d66f-5e68-4fc2-b641-03672b543a49")
    ITIMETransitionElement : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_type( 
            /* [retval][out] */ __RPC__out VARIANT *type) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_type( 
            /* [in] */ VARIANT type) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_subType( 
            /* [retval][out] */ __RPC__out VARIANT *subtype) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_subType( 
            /* [in] */ VARIANT subtype) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_dur( 
            /* [retval][out] */ __RPC__out VARIANT *dur) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_dur( 
            /* [in] */ VARIANT dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_startProgress( 
            /* [retval][out] */ __RPC__out VARIANT *startProgress) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_startProgress( 
            /* [in] */ VARIANT startProgress) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_endProgress( 
            /* [retval][out] */ __RPC__out VARIANT *endProgress) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_endProgress( 
            /* [in] */ VARIANT endProgress) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_direction( 
            /* [retval][out] */ __RPC__out VARIANT *direction) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_direction( 
            /* [in] */ VARIANT direction) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_repeatCount( 
            /* [retval][out] */ __RPC__out VARIANT *repeatCount) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_repeatCount( 
            /* [in] */ VARIANT repeatCount) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_begin( 
            /* [retval][out] */ __RPC__out VARIANT *begin) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_begin( 
            /* [in] */ VARIANT begin) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_end( 
            /* [retval][out] */ __RPC__out VARIANT *end) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_end( 
            /* [in] */ VARIANT end) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMETransitionElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMETransitionElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMETransitionElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMETransitionElement * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMETransitionElement * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_type )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *type);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_type )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT type);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_subType )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *subtype);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_subType )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT subtype);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *dur);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_startProgress )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *startProgress);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_startProgress )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT startProgress);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endProgress )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *endProgress);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endProgress )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT endProgress);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_direction )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *direction);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_direction )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT direction);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *repeatCount);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT repeatCount);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *begin);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT begin);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMETransitionElement * This,
            /* [retval][out] */ __RPC__out VARIANT *end);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMETransitionElement * This,
            /* [in] */ VARIANT end);
        
        END_INTERFACE
    } ITIMETransitionElementVtbl;

    interface ITIMETransitionElement
    {
        CONST_VTBL struct ITIMETransitionElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMETransitionElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMETransitionElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMETransitionElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMETransitionElement_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMETransitionElement_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMETransitionElement_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMETransitionElement_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMETransitionElement_get_type(This,type)	\
    ( (This)->lpVtbl -> get_type(This,type) ) 

#define ITIMETransitionElement_put_type(This,type)	\
    ( (This)->lpVtbl -> put_type(This,type) ) 

#define ITIMETransitionElement_get_subType(This,subtype)	\
    ( (This)->lpVtbl -> get_subType(This,subtype) ) 

#define ITIMETransitionElement_put_subType(This,subtype)	\
    ( (This)->lpVtbl -> put_subType(This,subtype) ) 

#define ITIMETransitionElement_get_dur(This,dur)	\
    ( (This)->lpVtbl -> get_dur(This,dur) ) 

#define ITIMETransitionElement_put_dur(This,dur)	\
    ( (This)->lpVtbl -> put_dur(This,dur) ) 

#define ITIMETransitionElement_get_startProgress(This,startProgress)	\
    ( (This)->lpVtbl -> get_startProgress(This,startProgress) ) 

#define ITIMETransitionElement_put_startProgress(This,startProgress)	\
    ( (This)->lpVtbl -> put_startProgress(This,startProgress) ) 

#define ITIMETransitionElement_get_endProgress(This,endProgress)	\
    ( (This)->lpVtbl -> get_endProgress(This,endProgress) ) 

#define ITIMETransitionElement_put_endProgress(This,endProgress)	\
    ( (This)->lpVtbl -> put_endProgress(This,endProgress) ) 

#define ITIMETransitionElement_get_direction(This,direction)	\
    ( (This)->lpVtbl -> get_direction(This,direction) ) 

#define ITIMETransitionElement_put_direction(This,direction)	\
    ( (This)->lpVtbl -> put_direction(This,direction) ) 

#define ITIMETransitionElement_get_repeatCount(This,repeatCount)	\
    ( (This)->lpVtbl -> get_repeatCount(This,repeatCount) ) 

#define ITIMETransitionElement_put_repeatCount(This,repeatCount)	\
    ( (This)->lpVtbl -> put_repeatCount(This,repeatCount) ) 

#define ITIMETransitionElement_get_begin(This,begin)	\
    ( (This)->lpVtbl -> get_begin(This,begin) ) 

#define ITIMETransitionElement_put_begin(This,begin)	\
    ( (This)->lpVtbl -> put_begin(This,begin) ) 

#define ITIMETransitionElement_get_end(This,end)	\
    ( (This)->lpVtbl -> get_end(This,end) ) 

#define ITIMETransitionElement_put_end(This,end)	\
    ( (This)->lpVtbl -> put_end(This,end) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMETransitionElement_INTERFACE_DEFINED__ */


#ifndef __ITIMEAnimationElement_INTERFACE_DEFINED__
#define __ITIMEAnimationElement_INTERFACE_DEFINED__

/* interface ITIMEAnimationElement */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEAnimationElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("a74f14b1-b6a2-430a-a5e8-1f4e53f710fe")
    ITIMEAnimationElement : public ITIMEElement
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_attributeName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *attrib) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_attributeName( 
            /* [in] */ __RPC__in BSTR attrib) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_by( 
            /* [retval][out] */ __RPC__out VARIANT *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_by( 
            /* [in] */ VARIANT val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_calcMode( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *calcmode) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_calcMode( 
            /* [in] */ __RPC__in BSTR calcmode) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_from( 
            /* [retval][out] */ __RPC__out VARIANT *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_from( 
            /* [in] */ VARIANT val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_keySplines( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_keySplines( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_keyTimes( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_keyTimes( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_targetElement( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *target) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_targetElement( 
            /* [in] */ __RPC__in BSTR target) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_to( 
            /* [retval][out] */ __RPC__out VARIANT *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_to( 
            /* [in] */ VARIANT val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_values( 
            /* [retval][out] */ __RPC__out VARIANT *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_values( 
            /* [in] */ VARIANT val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_origin( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_origin( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_path( 
            /* [retval][out] */ __RPC__out VARIANT *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_path( 
            /* [in] */ VARIANT val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_additive( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_additive( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_accumulate( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_accumulate( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEAnimationElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEAnimationElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEAnimationElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEAnimationElement * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accelerate )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accelerate )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0001);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_autoReverse )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_autoReverse )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0003);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_decelerate )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_decelerate )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0005);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fill )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fill )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR f);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mute )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *c);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT c);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatDur )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatDur )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_restart )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_restart )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *speed);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_speed )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncBehavior )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncBehavior )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR sync);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncTolerance )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *tol);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncTolerance )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT tol);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncMaster )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncMaster )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAction )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeAction )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeContainer )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTimeState )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAll )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeChildren )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeParent )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElementAt )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElementAt )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pauseElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resetElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resumeElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekActiveTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekSegmentTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekTo )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *documentTimeToParentTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToDocumentTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToActiveTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToParentTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToSegmentTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToActiveTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToSimpleTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *simpleTimeToSegmentTime )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endSync )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endSync )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR es);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeElements )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasMedia )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevElement )( 
            __RPC__in ITIMEAnimationElement * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_updateMode )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_updateMode )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR updateMode);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_attributeName )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *attrib);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_attributeName )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR attrib);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_by )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_by )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_calcMode )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *calcmode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_calcMode )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR calcmode);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_from )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_from )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_keySplines )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_keySplines )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_keyTimes )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_keyTimes )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_targetElement )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *target);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_targetElement )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR target);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_to )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_to )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_values )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_values )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_origin )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_origin )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_path )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_path )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_additive )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_additive )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accumulate )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accumulate )( 
            __RPC__in ITIMEAnimationElement * This,
            /* [in] */ __RPC__in BSTR val);
        
        END_INTERFACE
    } ITIMEAnimationElementVtbl;

    interface ITIMEAnimationElement
    {
        CONST_VTBL struct ITIMEAnimationElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEAnimationElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEAnimationElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEAnimationElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEAnimationElement_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEAnimationElement_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEAnimationElement_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEAnimationElement_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEAnimationElement_get_accelerate(This,__MIDL__ITIMEElement0000)	\
    ( (This)->lpVtbl -> get_accelerate(This,__MIDL__ITIMEElement0000) ) 

#define ITIMEAnimationElement_put_accelerate(This,__MIDL__ITIMEElement0001)	\
    ( (This)->lpVtbl -> put_accelerate(This,__MIDL__ITIMEElement0001) ) 

#define ITIMEAnimationElement_get_autoReverse(This,__MIDL__ITIMEElement0002)	\
    ( (This)->lpVtbl -> get_autoReverse(This,__MIDL__ITIMEElement0002) ) 

#define ITIMEAnimationElement_put_autoReverse(This,__MIDL__ITIMEElement0003)	\
    ( (This)->lpVtbl -> put_autoReverse(This,__MIDL__ITIMEElement0003) ) 

#define ITIMEAnimationElement_get_begin(This,time)	\
    ( (This)->lpVtbl -> get_begin(This,time) ) 

#define ITIMEAnimationElement_put_begin(This,time)	\
    ( (This)->lpVtbl -> put_begin(This,time) ) 

#define ITIMEAnimationElement_get_decelerate(This,__MIDL__ITIMEElement0004)	\
    ( (This)->lpVtbl -> get_decelerate(This,__MIDL__ITIMEElement0004) ) 

#define ITIMEAnimationElement_put_decelerate(This,__MIDL__ITIMEElement0005)	\
    ( (This)->lpVtbl -> put_decelerate(This,__MIDL__ITIMEElement0005) ) 

#define ITIMEAnimationElement_get_dur(This,time)	\
    ( (This)->lpVtbl -> get_dur(This,time) ) 

#define ITIMEAnimationElement_put_dur(This,time)	\
    ( (This)->lpVtbl -> put_dur(This,time) ) 

#define ITIMEAnimationElement_get_end(This,time)	\
    ( (This)->lpVtbl -> get_end(This,time) ) 

#define ITIMEAnimationElement_put_end(This,time)	\
    ( (This)->lpVtbl -> put_end(This,time) ) 

#define ITIMEAnimationElement_get_fill(This,f)	\
    ( (This)->lpVtbl -> get_fill(This,f) ) 

#define ITIMEAnimationElement_put_fill(This,f)	\
    ( (This)->lpVtbl -> put_fill(This,f) ) 

#define ITIMEAnimationElement_get_mute(This,b)	\
    ( (This)->lpVtbl -> get_mute(This,b) ) 

#define ITIMEAnimationElement_put_mute(This,b)	\
    ( (This)->lpVtbl -> put_mute(This,b) ) 

#define ITIMEAnimationElement_get_repeatCount(This,c)	\
    ( (This)->lpVtbl -> get_repeatCount(This,c) ) 

#define ITIMEAnimationElement_put_repeatCount(This,c)	\
    ( (This)->lpVtbl -> put_repeatCount(This,c) ) 

#define ITIMEAnimationElement_get_repeatDur(This,time)	\
    ( (This)->lpVtbl -> get_repeatDur(This,time) ) 

#define ITIMEAnimationElement_put_repeatDur(This,time)	\
    ( (This)->lpVtbl -> put_repeatDur(This,time) ) 

#define ITIMEAnimationElement_get_restart(This,__MIDL__ITIMEElement0006)	\
    ( (This)->lpVtbl -> get_restart(This,__MIDL__ITIMEElement0006) ) 

#define ITIMEAnimationElement_put_restart(This,__MIDL__ITIMEElement0007)	\
    ( (This)->lpVtbl -> put_restart(This,__MIDL__ITIMEElement0007) ) 

#define ITIMEAnimationElement_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEAnimationElement_put_speed(This,speed)	\
    ( (This)->lpVtbl -> put_speed(This,speed) ) 

#define ITIMEAnimationElement_get_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> get_syncBehavior(This,sync) ) 

#define ITIMEAnimationElement_put_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> put_syncBehavior(This,sync) ) 

#define ITIMEAnimationElement_get_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> get_syncTolerance(This,tol) ) 

#define ITIMEAnimationElement_put_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> put_syncTolerance(This,tol) ) 

#define ITIMEAnimationElement_get_syncMaster(This,b)	\
    ( (This)->lpVtbl -> get_syncMaster(This,b) ) 

#define ITIMEAnimationElement_put_syncMaster(This,b)	\
    ( (This)->lpVtbl -> put_syncMaster(This,b) ) 

#define ITIMEAnimationElement_get_timeAction(This,time)	\
    ( (This)->lpVtbl -> get_timeAction(This,time) ) 

#define ITIMEAnimationElement_put_timeAction(This,time)	\
    ( (This)->lpVtbl -> put_timeAction(This,time) ) 

#define ITIMEAnimationElement_get_timeContainer(This,__MIDL__ITIMEElement0008)	\
    ( (This)->lpVtbl -> get_timeContainer(This,__MIDL__ITIMEElement0008) ) 

#define ITIMEAnimationElement_get_volume(This,val)	\
    ( (This)->lpVtbl -> get_volume(This,val) ) 

#define ITIMEAnimationElement_put_volume(This,val)	\
    ( (This)->lpVtbl -> put_volume(This,val) ) 

#define ITIMEAnimationElement_get_currTimeState(This,TimeState)	\
    ( (This)->lpVtbl -> get_currTimeState(This,TimeState) ) 

#define ITIMEAnimationElement_get_timeAll(This,allColl)	\
    ( (This)->lpVtbl -> get_timeAll(This,allColl) ) 

#define ITIMEAnimationElement_get_timeChildren(This,childColl)	\
    ( (This)->lpVtbl -> get_timeChildren(This,childColl) ) 

#define ITIMEAnimationElement_get_timeParent(This,parent)	\
    ( (This)->lpVtbl -> get_timeParent(This,parent) ) 

#define ITIMEAnimationElement_get_isPaused(This,b)	\
    ( (This)->lpVtbl -> get_isPaused(This,b) ) 

#define ITIMEAnimationElement_beginElement(This)	\
    ( (This)->lpVtbl -> beginElement(This) ) 

#define ITIMEAnimationElement_beginElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> beginElementAt(This,parentTime) ) 

#define ITIMEAnimationElement_endElement(This)	\
    ( (This)->lpVtbl -> endElement(This) ) 

#define ITIMEAnimationElement_endElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> endElementAt(This,parentTime) ) 

#define ITIMEAnimationElement_pauseElement(This)	\
    ( (This)->lpVtbl -> pauseElement(This) ) 

#define ITIMEAnimationElement_resetElement(This)	\
    ( (This)->lpVtbl -> resetElement(This) ) 

#define ITIMEAnimationElement_resumeElement(This)	\
    ( (This)->lpVtbl -> resumeElement(This) ) 

#define ITIMEAnimationElement_seekActiveTime(This,activeTime)	\
    ( (This)->lpVtbl -> seekActiveTime(This,activeTime) ) 

#define ITIMEAnimationElement_seekSegmentTime(This,segmentTime)	\
    ( (This)->lpVtbl -> seekSegmentTime(This,segmentTime) ) 

#define ITIMEAnimationElement_seekTo(This,repeatCount,segmentTime)	\
    ( (This)->lpVtbl -> seekTo(This,repeatCount,segmentTime) ) 

#define ITIMEAnimationElement_documentTimeToParentTime(This,documentTime,parentTime)	\
    ( (This)->lpVtbl -> documentTimeToParentTime(This,documentTime,parentTime) ) 

#define ITIMEAnimationElement_parentTimeToDocumentTime(This,parentTime,documentTime)	\
    ( (This)->lpVtbl -> parentTimeToDocumentTime(This,parentTime,documentTime) ) 

#define ITIMEAnimationElement_parentTimeToActiveTime(This,parentTime,activeTime)	\
    ( (This)->lpVtbl -> parentTimeToActiveTime(This,parentTime,activeTime) ) 

#define ITIMEAnimationElement_activeTimeToParentTime(This,activeTime,parentTime)	\
    ( (This)->lpVtbl -> activeTimeToParentTime(This,activeTime,parentTime) ) 

#define ITIMEAnimationElement_activeTimeToSegmentTime(This,activeTime,segmentTime)	\
    ( (This)->lpVtbl -> activeTimeToSegmentTime(This,activeTime,segmentTime) ) 

#define ITIMEAnimationElement_segmentTimeToActiveTime(This,segmentTime,activeTime)	\
    ( (This)->lpVtbl -> segmentTimeToActiveTime(This,segmentTime,activeTime) ) 

#define ITIMEAnimationElement_segmentTimeToSimpleTime(This,segmentTime,simpleTime)	\
    ( (This)->lpVtbl -> segmentTimeToSimpleTime(This,segmentTime,simpleTime) ) 

#define ITIMEAnimationElement_simpleTimeToSegmentTime(This,simpleTime,segmentTime)	\
    ( (This)->lpVtbl -> simpleTimeToSegmentTime(This,simpleTime,segmentTime) ) 

#define ITIMEAnimationElement_get_endSync(This,es)	\
    ( (This)->lpVtbl -> get_endSync(This,es) ) 

#define ITIMEAnimationElement_put_endSync(This,es)	\
    ( (This)->lpVtbl -> put_endSync(This,es) ) 

#define ITIMEAnimationElement_get_activeElements(This,activeColl)	\
    ( (This)->lpVtbl -> get_activeElements(This,activeColl) ) 

#define ITIMEAnimationElement_get_hasMedia(This,flag)	\
    ( (This)->lpVtbl -> get_hasMedia(This,flag) ) 

#define ITIMEAnimationElement_nextElement(This)	\
    ( (This)->lpVtbl -> nextElement(This) ) 

#define ITIMEAnimationElement_prevElement(This)	\
    ( (This)->lpVtbl -> prevElement(This) ) 

#define ITIMEAnimationElement_get_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> get_updateMode(This,updateMode) ) 

#define ITIMEAnimationElement_put_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> put_updateMode(This,updateMode) ) 


#define ITIMEAnimationElement_get_attributeName(This,attrib)	\
    ( (This)->lpVtbl -> get_attributeName(This,attrib) ) 

#define ITIMEAnimationElement_put_attributeName(This,attrib)	\
    ( (This)->lpVtbl -> put_attributeName(This,attrib) ) 

#define ITIMEAnimationElement_get_by(This,val)	\
    ( (This)->lpVtbl -> get_by(This,val) ) 

#define ITIMEAnimationElement_put_by(This,val)	\
    ( (This)->lpVtbl -> put_by(This,val) ) 

#define ITIMEAnimationElement_get_calcMode(This,calcmode)	\
    ( (This)->lpVtbl -> get_calcMode(This,calcmode) ) 

#define ITIMEAnimationElement_put_calcMode(This,calcmode)	\
    ( (This)->lpVtbl -> put_calcMode(This,calcmode) ) 

#define ITIMEAnimationElement_get_from(This,val)	\
    ( (This)->lpVtbl -> get_from(This,val) ) 

#define ITIMEAnimationElement_put_from(This,val)	\
    ( (This)->lpVtbl -> put_from(This,val) ) 

#define ITIMEAnimationElement_get_keySplines(This,val)	\
    ( (This)->lpVtbl -> get_keySplines(This,val) ) 

#define ITIMEAnimationElement_put_keySplines(This,val)	\
    ( (This)->lpVtbl -> put_keySplines(This,val) ) 

#define ITIMEAnimationElement_get_keyTimes(This,val)	\
    ( (This)->lpVtbl -> get_keyTimes(This,val) ) 

#define ITIMEAnimationElement_put_keyTimes(This,val)	\
    ( (This)->lpVtbl -> put_keyTimes(This,val) ) 

#define ITIMEAnimationElement_get_targetElement(This,target)	\
    ( (This)->lpVtbl -> get_targetElement(This,target) ) 

#define ITIMEAnimationElement_put_targetElement(This,target)	\
    ( (This)->lpVtbl -> put_targetElement(This,target) ) 

#define ITIMEAnimationElement_get_to(This,val)	\
    ( (This)->lpVtbl -> get_to(This,val) ) 

#define ITIMEAnimationElement_put_to(This,val)	\
    ( (This)->lpVtbl -> put_to(This,val) ) 

#define ITIMEAnimationElement_get_values(This,val)	\
    ( (This)->lpVtbl -> get_values(This,val) ) 

#define ITIMEAnimationElement_put_values(This,val)	\
    ( (This)->lpVtbl -> put_values(This,val) ) 

#define ITIMEAnimationElement_get_origin(This,val)	\
    ( (This)->lpVtbl -> get_origin(This,val) ) 

#define ITIMEAnimationElement_put_origin(This,val)	\
    ( (This)->lpVtbl -> put_origin(This,val) ) 

#define ITIMEAnimationElement_get_path(This,val)	\
    ( (This)->lpVtbl -> get_path(This,val) ) 

#define ITIMEAnimationElement_put_path(This,val)	\
    ( (This)->lpVtbl -> put_path(This,val) ) 

#define ITIMEAnimationElement_get_additive(This,val)	\
    ( (This)->lpVtbl -> get_additive(This,val) ) 

#define ITIMEAnimationElement_put_additive(This,val)	\
    ( (This)->lpVtbl -> put_additive(This,val) ) 

#define ITIMEAnimationElement_get_accumulate(This,val)	\
    ( (This)->lpVtbl -> get_accumulate(This,val) ) 

#define ITIMEAnimationElement_put_accumulate(This,val)	\
    ( (This)->lpVtbl -> put_accumulate(This,val) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEAnimationElement_INTERFACE_DEFINED__ */


#ifndef __ITIMEAnimationElement2_INTERFACE_DEFINED__
#define __ITIMEAnimationElement2_INTERFACE_DEFINED__

/* interface ITIMEAnimationElement2 */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEAnimationElement2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("29CE8661-BD43-421a-B616-E9B31F33A572")
    ITIMEAnimationElement2 : public ITIMEAnimationElement
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_type( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_type( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_subType( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_subType( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mode( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_mode( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_fadeColor( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_fadeColor( 
            /* [in] */ __RPC__in BSTR val) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEAnimationElement2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEAnimationElement2 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accelerate )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0000);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accelerate )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0001);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_autoReverse )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0002);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_autoReverse )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0003);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_begin )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_begin )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_decelerate )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *__MIDL__ITIMEElement0004);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_decelerate )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT __MIDL__ITIMEElement0005);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_dur )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_end )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_end )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fill )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fill )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR f);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mute )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *c);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatCount )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT c);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatDur )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_repeatDur )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_restart )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0006);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_restart )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR __MIDL__ITIMEElement0007);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *speed);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_speed )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncBehavior )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *sync);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncBehavior )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR sync);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncTolerance )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *tol);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncTolerance )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT tol);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_syncMaster )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_syncMaster )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAction )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_timeAction )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeContainer )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *__MIDL__ITIMEElement0008);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTimeState )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **TimeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeAll )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **allColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeChildren )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElementCollection **childColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeParent )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **parent);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *beginElementAt )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *endElementAt )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pauseElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resetElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resumeElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekActiveTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekSegmentTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seekTo )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ LONG repeatCount,
            /* [in] */ double segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *documentTimeToParentTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double documentTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToDocumentTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *documentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *parentTimeToActiveTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double parentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToParentTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *parentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *activeTimeToSegmentTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double activeTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToActiveTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *activeTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *segmentTimeToSimpleTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double segmentTime,
            /* [retval][out] */ __RPC__out double *simpleTime);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *simpleTimeToSegmentTime )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ double simpleTime,
            /* [retval][out] */ __RPC__out double *segmentTime);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_endSync )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *es);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_endSync )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR es);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeElements )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEActiveElementCollection **activeColl);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasMedia )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *flag);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevElement )( 
            __RPC__in ITIMEAnimationElement2 * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_updateMode )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *updateMode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_updateMode )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR updateMode);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_attributeName )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *attrib);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_attributeName )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR attrib);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_by )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_by )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_calcMode )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *calcmode);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_calcMode )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR calcmode);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_from )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_from )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_keySplines )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_keySplines )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_keyTimes )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_keyTimes )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_targetElement )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *target);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_targetElement )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR target);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_to )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_to )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_values )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_values )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_origin )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_origin )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_path )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__out VARIANT *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_path )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ VARIANT val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_additive )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_additive )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_accumulate )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_accumulate )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_type )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_type )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_subType )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_subType )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mode )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mode )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_fadeColor )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *val);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_fadeColor )( 
            __RPC__in ITIMEAnimationElement2 * This,
            /* [in] */ __RPC__in BSTR val);
        
        END_INTERFACE
    } ITIMEAnimationElement2Vtbl;

    interface ITIMEAnimationElement2
    {
        CONST_VTBL struct ITIMEAnimationElement2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEAnimationElement2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEAnimationElement2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEAnimationElement2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEAnimationElement2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEAnimationElement2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEAnimationElement2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEAnimationElement2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEAnimationElement2_get_accelerate(This,__MIDL__ITIMEElement0000)	\
    ( (This)->lpVtbl -> get_accelerate(This,__MIDL__ITIMEElement0000) ) 

#define ITIMEAnimationElement2_put_accelerate(This,__MIDL__ITIMEElement0001)	\
    ( (This)->lpVtbl -> put_accelerate(This,__MIDL__ITIMEElement0001) ) 

#define ITIMEAnimationElement2_get_autoReverse(This,__MIDL__ITIMEElement0002)	\
    ( (This)->lpVtbl -> get_autoReverse(This,__MIDL__ITIMEElement0002) ) 

#define ITIMEAnimationElement2_put_autoReverse(This,__MIDL__ITIMEElement0003)	\
    ( (This)->lpVtbl -> put_autoReverse(This,__MIDL__ITIMEElement0003) ) 

#define ITIMEAnimationElement2_get_begin(This,time)	\
    ( (This)->lpVtbl -> get_begin(This,time) ) 

#define ITIMEAnimationElement2_put_begin(This,time)	\
    ( (This)->lpVtbl -> put_begin(This,time) ) 

#define ITIMEAnimationElement2_get_decelerate(This,__MIDL__ITIMEElement0004)	\
    ( (This)->lpVtbl -> get_decelerate(This,__MIDL__ITIMEElement0004) ) 

#define ITIMEAnimationElement2_put_decelerate(This,__MIDL__ITIMEElement0005)	\
    ( (This)->lpVtbl -> put_decelerate(This,__MIDL__ITIMEElement0005) ) 

#define ITIMEAnimationElement2_get_dur(This,time)	\
    ( (This)->lpVtbl -> get_dur(This,time) ) 

#define ITIMEAnimationElement2_put_dur(This,time)	\
    ( (This)->lpVtbl -> put_dur(This,time) ) 

#define ITIMEAnimationElement2_get_end(This,time)	\
    ( (This)->lpVtbl -> get_end(This,time) ) 

#define ITIMEAnimationElement2_put_end(This,time)	\
    ( (This)->lpVtbl -> put_end(This,time) ) 

#define ITIMEAnimationElement2_get_fill(This,f)	\
    ( (This)->lpVtbl -> get_fill(This,f) ) 

#define ITIMEAnimationElement2_put_fill(This,f)	\
    ( (This)->lpVtbl -> put_fill(This,f) ) 

#define ITIMEAnimationElement2_get_mute(This,b)	\
    ( (This)->lpVtbl -> get_mute(This,b) ) 

#define ITIMEAnimationElement2_put_mute(This,b)	\
    ( (This)->lpVtbl -> put_mute(This,b) ) 

#define ITIMEAnimationElement2_get_repeatCount(This,c)	\
    ( (This)->lpVtbl -> get_repeatCount(This,c) ) 

#define ITIMEAnimationElement2_put_repeatCount(This,c)	\
    ( (This)->lpVtbl -> put_repeatCount(This,c) ) 

#define ITIMEAnimationElement2_get_repeatDur(This,time)	\
    ( (This)->lpVtbl -> get_repeatDur(This,time) ) 

#define ITIMEAnimationElement2_put_repeatDur(This,time)	\
    ( (This)->lpVtbl -> put_repeatDur(This,time) ) 

#define ITIMEAnimationElement2_get_restart(This,__MIDL__ITIMEElement0006)	\
    ( (This)->lpVtbl -> get_restart(This,__MIDL__ITIMEElement0006) ) 

#define ITIMEAnimationElement2_put_restart(This,__MIDL__ITIMEElement0007)	\
    ( (This)->lpVtbl -> put_restart(This,__MIDL__ITIMEElement0007) ) 

#define ITIMEAnimationElement2_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEAnimationElement2_put_speed(This,speed)	\
    ( (This)->lpVtbl -> put_speed(This,speed) ) 

#define ITIMEAnimationElement2_get_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> get_syncBehavior(This,sync) ) 

#define ITIMEAnimationElement2_put_syncBehavior(This,sync)	\
    ( (This)->lpVtbl -> put_syncBehavior(This,sync) ) 

#define ITIMEAnimationElement2_get_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> get_syncTolerance(This,tol) ) 

#define ITIMEAnimationElement2_put_syncTolerance(This,tol)	\
    ( (This)->lpVtbl -> put_syncTolerance(This,tol) ) 

#define ITIMEAnimationElement2_get_syncMaster(This,b)	\
    ( (This)->lpVtbl -> get_syncMaster(This,b) ) 

#define ITIMEAnimationElement2_put_syncMaster(This,b)	\
    ( (This)->lpVtbl -> put_syncMaster(This,b) ) 

#define ITIMEAnimationElement2_get_timeAction(This,time)	\
    ( (This)->lpVtbl -> get_timeAction(This,time) ) 

#define ITIMEAnimationElement2_put_timeAction(This,time)	\
    ( (This)->lpVtbl -> put_timeAction(This,time) ) 

#define ITIMEAnimationElement2_get_timeContainer(This,__MIDL__ITIMEElement0008)	\
    ( (This)->lpVtbl -> get_timeContainer(This,__MIDL__ITIMEElement0008) ) 

#define ITIMEAnimationElement2_get_volume(This,val)	\
    ( (This)->lpVtbl -> get_volume(This,val) ) 

#define ITIMEAnimationElement2_put_volume(This,val)	\
    ( (This)->lpVtbl -> put_volume(This,val) ) 

#define ITIMEAnimationElement2_get_currTimeState(This,TimeState)	\
    ( (This)->lpVtbl -> get_currTimeState(This,TimeState) ) 

#define ITIMEAnimationElement2_get_timeAll(This,allColl)	\
    ( (This)->lpVtbl -> get_timeAll(This,allColl) ) 

#define ITIMEAnimationElement2_get_timeChildren(This,childColl)	\
    ( (This)->lpVtbl -> get_timeChildren(This,childColl) ) 

#define ITIMEAnimationElement2_get_timeParent(This,parent)	\
    ( (This)->lpVtbl -> get_timeParent(This,parent) ) 

#define ITIMEAnimationElement2_get_isPaused(This,b)	\
    ( (This)->lpVtbl -> get_isPaused(This,b) ) 

#define ITIMEAnimationElement2_beginElement(This)	\
    ( (This)->lpVtbl -> beginElement(This) ) 

#define ITIMEAnimationElement2_beginElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> beginElementAt(This,parentTime) ) 

#define ITIMEAnimationElement2_endElement(This)	\
    ( (This)->lpVtbl -> endElement(This) ) 

#define ITIMEAnimationElement2_endElementAt(This,parentTime)	\
    ( (This)->lpVtbl -> endElementAt(This,parentTime) ) 

#define ITIMEAnimationElement2_pauseElement(This)	\
    ( (This)->lpVtbl -> pauseElement(This) ) 

#define ITIMEAnimationElement2_resetElement(This)	\
    ( (This)->lpVtbl -> resetElement(This) ) 

#define ITIMEAnimationElement2_resumeElement(This)	\
    ( (This)->lpVtbl -> resumeElement(This) ) 

#define ITIMEAnimationElement2_seekActiveTime(This,activeTime)	\
    ( (This)->lpVtbl -> seekActiveTime(This,activeTime) ) 

#define ITIMEAnimationElement2_seekSegmentTime(This,segmentTime)	\
    ( (This)->lpVtbl -> seekSegmentTime(This,segmentTime) ) 

#define ITIMEAnimationElement2_seekTo(This,repeatCount,segmentTime)	\
    ( (This)->lpVtbl -> seekTo(This,repeatCount,segmentTime) ) 

#define ITIMEAnimationElement2_documentTimeToParentTime(This,documentTime,parentTime)	\
    ( (This)->lpVtbl -> documentTimeToParentTime(This,documentTime,parentTime) ) 

#define ITIMEAnimationElement2_parentTimeToDocumentTime(This,parentTime,documentTime)	\
    ( (This)->lpVtbl -> parentTimeToDocumentTime(This,parentTime,documentTime) ) 

#define ITIMEAnimationElement2_parentTimeToActiveTime(This,parentTime,activeTime)	\
    ( (This)->lpVtbl -> parentTimeToActiveTime(This,parentTime,activeTime) ) 

#define ITIMEAnimationElement2_activeTimeToParentTime(This,activeTime,parentTime)	\
    ( (This)->lpVtbl -> activeTimeToParentTime(This,activeTime,parentTime) ) 

#define ITIMEAnimationElement2_activeTimeToSegmentTime(This,activeTime,segmentTime)	\
    ( (This)->lpVtbl -> activeTimeToSegmentTime(This,activeTime,segmentTime) ) 

#define ITIMEAnimationElement2_segmentTimeToActiveTime(This,segmentTime,activeTime)	\
    ( (This)->lpVtbl -> segmentTimeToActiveTime(This,segmentTime,activeTime) ) 

#define ITIMEAnimationElement2_segmentTimeToSimpleTime(This,segmentTime,simpleTime)	\
    ( (This)->lpVtbl -> segmentTimeToSimpleTime(This,segmentTime,simpleTime) ) 

#define ITIMEAnimationElement2_simpleTimeToSegmentTime(This,simpleTime,segmentTime)	\
    ( (This)->lpVtbl -> simpleTimeToSegmentTime(This,simpleTime,segmentTime) ) 

#define ITIMEAnimationElement2_get_endSync(This,es)	\
    ( (This)->lpVtbl -> get_endSync(This,es) ) 

#define ITIMEAnimationElement2_put_endSync(This,es)	\
    ( (This)->lpVtbl -> put_endSync(This,es) ) 

#define ITIMEAnimationElement2_get_activeElements(This,activeColl)	\
    ( (This)->lpVtbl -> get_activeElements(This,activeColl) ) 

#define ITIMEAnimationElement2_get_hasMedia(This,flag)	\
    ( (This)->lpVtbl -> get_hasMedia(This,flag) ) 

#define ITIMEAnimationElement2_nextElement(This)	\
    ( (This)->lpVtbl -> nextElement(This) ) 

#define ITIMEAnimationElement2_prevElement(This)	\
    ( (This)->lpVtbl -> prevElement(This) ) 

#define ITIMEAnimationElement2_get_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> get_updateMode(This,updateMode) ) 

#define ITIMEAnimationElement2_put_updateMode(This,updateMode)	\
    ( (This)->lpVtbl -> put_updateMode(This,updateMode) ) 


#define ITIMEAnimationElement2_get_attributeName(This,attrib)	\
    ( (This)->lpVtbl -> get_attributeName(This,attrib) ) 

#define ITIMEAnimationElement2_put_attributeName(This,attrib)	\
    ( (This)->lpVtbl -> put_attributeName(This,attrib) ) 

#define ITIMEAnimationElement2_get_by(This,val)	\
    ( (This)->lpVtbl -> get_by(This,val) ) 

#define ITIMEAnimationElement2_put_by(This,val)	\
    ( (This)->lpVtbl -> put_by(This,val) ) 

#define ITIMEAnimationElement2_get_calcMode(This,calcmode)	\
    ( (This)->lpVtbl -> get_calcMode(This,calcmode) ) 

#define ITIMEAnimationElement2_put_calcMode(This,calcmode)	\
    ( (This)->lpVtbl -> put_calcMode(This,calcmode) ) 

#define ITIMEAnimationElement2_get_from(This,val)	\
    ( (This)->lpVtbl -> get_from(This,val) ) 

#define ITIMEAnimationElement2_put_from(This,val)	\
    ( (This)->lpVtbl -> put_from(This,val) ) 

#define ITIMEAnimationElement2_get_keySplines(This,val)	\
    ( (This)->lpVtbl -> get_keySplines(This,val) ) 

#define ITIMEAnimationElement2_put_keySplines(This,val)	\
    ( (This)->lpVtbl -> put_keySplines(This,val) ) 

#define ITIMEAnimationElement2_get_keyTimes(This,val)	\
    ( (This)->lpVtbl -> get_keyTimes(This,val) ) 

#define ITIMEAnimationElement2_put_keyTimes(This,val)	\
    ( (This)->lpVtbl -> put_keyTimes(This,val) ) 

#define ITIMEAnimationElement2_get_targetElement(This,target)	\
    ( (This)->lpVtbl -> get_targetElement(This,target) ) 

#define ITIMEAnimationElement2_put_targetElement(This,target)	\
    ( (This)->lpVtbl -> put_targetElement(This,target) ) 

#define ITIMEAnimationElement2_get_to(This,val)	\
    ( (This)->lpVtbl -> get_to(This,val) ) 

#define ITIMEAnimationElement2_put_to(This,val)	\
    ( (This)->lpVtbl -> put_to(This,val) ) 

#define ITIMEAnimationElement2_get_values(This,val)	\
    ( (This)->lpVtbl -> get_values(This,val) ) 

#define ITIMEAnimationElement2_put_values(This,val)	\
    ( (This)->lpVtbl -> put_values(This,val) ) 

#define ITIMEAnimationElement2_get_origin(This,val)	\
    ( (This)->lpVtbl -> get_origin(This,val) ) 

#define ITIMEAnimationElement2_put_origin(This,val)	\
    ( (This)->lpVtbl -> put_origin(This,val) ) 

#define ITIMEAnimationElement2_get_path(This,val)	\
    ( (This)->lpVtbl -> get_path(This,val) ) 

#define ITIMEAnimationElement2_put_path(This,val)	\
    ( (This)->lpVtbl -> put_path(This,val) ) 

#define ITIMEAnimationElement2_get_additive(This,val)	\
    ( (This)->lpVtbl -> get_additive(This,val) ) 

#define ITIMEAnimationElement2_put_additive(This,val)	\
    ( (This)->lpVtbl -> put_additive(This,val) ) 

#define ITIMEAnimationElement2_get_accumulate(This,val)	\
    ( (This)->lpVtbl -> get_accumulate(This,val) ) 

#define ITIMEAnimationElement2_put_accumulate(This,val)	\
    ( (This)->lpVtbl -> put_accumulate(This,val) ) 


#define ITIMEAnimationElement2_get_type(This,val)	\
    ( (This)->lpVtbl -> get_type(This,val) ) 

#define ITIMEAnimationElement2_put_type(This,val)	\
    ( (This)->lpVtbl -> put_type(This,val) ) 

#define ITIMEAnimationElement2_get_subType(This,val)	\
    ( (This)->lpVtbl -> get_subType(This,val) ) 

#define ITIMEAnimationElement2_put_subType(This,val)	\
    ( (This)->lpVtbl -> put_subType(This,val) ) 

#define ITIMEAnimationElement2_get_mode(This,val)	\
    ( (This)->lpVtbl -> get_mode(This,val) ) 

#define ITIMEAnimationElement2_put_mode(This,val)	\
    ( (This)->lpVtbl -> put_mode(This,val) ) 

#define ITIMEAnimationElement2_get_fadeColor(This,val)	\
    ( (This)->lpVtbl -> get_fadeColor(This,val) ) 

#define ITIMEAnimationElement2_put_fadeColor(This,val)	\
    ( (This)->lpVtbl -> put_fadeColor(This,val) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEAnimationElement2_INTERFACE_DEFINED__ */


#ifndef __IAnimationComposer_INTERFACE_DEFINED__
#define __IAnimationComposer_INTERFACE_DEFINED__

/* interface IAnimationComposer */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IAnimationComposer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5459C83D-322B-44b3-8DAA-24C947E7B275")
    IAnimationComposer : public IUnknown
    {
    public:
        virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_attribute( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *attributeName) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ComposerInit( 
            __RPC__in_opt IDispatch *composerSite,
            __RPC__in BSTR attributeName) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ComposerDetach( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UpdateFragments( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE AddFragment( 
            __RPC__in_opt IDispatch *newAnimationFragment) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE InsertFragment( 
            __RPC__in_opt IDispatch *newAnimationFragment,
            VARIANT index) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RemoveFragment( 
            __RPC__in_opt IDispatch *oldAnimationFragment) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EnumerateFragments( 
            __RPC__deref_in_opt IEnumVARIANT **fragments) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetNumFragments( 
            __RPC__in long *fragmentCount) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationComposerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationComposer * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationComposer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationComposer * This);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_attribute )( 
            __RPC__in IAnimationComposer * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *attributeName);
        
        HRESULT ( STDMETHODCALLTYPE *ComposerInit )( 
            __RPC__in IAnimationComposer * This,
            __RPC__in_opt IDispatch *composerSite,
            __RPC__in BSTR attributeName);
        
        HRESULT ( STDMETHODCALLTYPE *ComposerDetach )( 
            __RPC__in IAnimationComposer * This);
        
        HRESULT ( STDMETHODCALLTYPE *UpdateFragments )( 
            __RPC__in IAnimationComposer * This);
        
        HRESULT ( STDMETHODCALLTYPE *AddFragment )( 
            __RPC__in IAnimationComposer * This,
            __RPC__in_opt IDispatch *newAnimationFragment);
        
        HRESULT ( STDMETHODCALLTYPE *InsertFragment )( 
            __RPC__in IAnimationComposer * This,
            __RPC__in_opt IDispatch *newAnimationFragment,
            VARIANT index);
        
        HRESULT ( STDMETHODCALLTYPE *RemoveFragment )( 
            __RPC__in IAnimationComposer * This,
            __RPC__in_opt IDispatch *oldAnimationFragment);
        
        HRESULT ( STDMETHODCALLTYPE *EnumerateFragments )( 
            __RPC__in IAnimationComposer * This,
            __RPC__deref_in_opt IEnumVARIANT **fragments);
        
        HRESULT ( STDMETHODCALLTYPE *GetNumFragments )( 
            __RPC__in IAnimationComposer * This,
            __RPC__in long *fragmentCount);
        
        END_INTERFACE
    } IAnimationComposerVtbl;

    interface IAnimationComposer
    {
        CONST_VTBL struct IAnimationComposerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationComposer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationComposer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationComposer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationComposer_get_attribute(This,attributeName)	\
    ( (This)->lpVtbl -> get_attribute(This,attributeName) ) 

#define IAnimationComposer_ComposerInit(This,composerSite,attributeName)	\
    ( (This)->lpVtbl -> ComposerInit(This,composerSite,attributeName) ) 

#define IAnimationComposer_ComposerDetach(This)	\
    ( (This)->lpVtbl -> ComposerDetach(This) ) 

#define IAnimationComposer_UpdateFragments(This)	\
    ( (This)->lpVtbl -> UpdateFragments(This) ) 

#define IAnimationComposer_AddFragment(This,newAnimationFragment)	\
    ( (This)->lpVtbl -> AddFragment(This,newAnimationFragment) ) 

#define IAnimationComposer_InsertFragment(This,newAnimationFragment,index)	\
    ( (This)->lpVtbl -> InsertFragment(This,newAnimationFragment,index) ) 

#define IAnimationComposer_RemoveFragment(This,oldAnimationFragment)	\
    ( (This)->lpVtbl -> RemoveFragment(This,oldAnimationFragment) ) 

#define IAnimationComposer_EnumerateFragments(This,fragments)	\
    ( (This)->lpVtbl -> EnumerateFragments(This,fragments) ) 

#define IAnimationComposer_GetNumFragments(This,fragmentCount)	\
    ( (This)->lpVtbl -> GetNumFragments(This,fragmentCount) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationComposer_INTERFACE_DEFINED__ */


#ifndef __IAnimationComposer2_INTERFACE_DEFINED__
#define __IAnimationComposer2_INTERFACE_DEFINED__

/* interface IAnimationComposer2 */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IAnimationComposer2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1A4F0E79-09CD-47f3-AFF1-483BF3A222DC")
    IAnimationComposer2 : public IAnimationComposer
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE ComposerInitFromFragment( 
            __RPC__in_opt IDispatch *composerSite,
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *oneFragment) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationComposer2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationComposer2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationComposer2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationComposer2 * This);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_attribute )( 
            __RPC__in IAnimationComposer2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *attributeName);
        
        HRESULT ( STDMETHODCALLTYPE *ComposerInit )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__in_opt IDispatch *composerSite,
            __RPC__in BSTR attributeName);
        
        HRESULT ( STDMETHODCALLTYPE *ComposerDetach )( 
            __RPC__in IAnimationComposer2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *UpdateFragments )( 
            __RPC__in IAnimationComposer2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *AddFragment )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__in_opt IDispatch *newAnimationFragment);
        
        HRESULT ( STDMETHODCALLTYPE *InsertFragment )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__in_opt IDispatch *newAnimationFragment,
            VARIANT index);
        
        HRESULT ( STDMETHODCALLTYPE *RemoveFragment )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__in_opt IDispatch *oldAnimationFragment);
        
        HRESULT ( STDMETHODCALLTYPE *EnumerateFragments )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__deref_in_opt IEnumVARIANT **fragments);
        
        HRESULT ( STDMETHODCALLTYPE *GetNumFragments )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__in long *fragmentCount);
        
        HRESULT ( STDMETHODCALLTYPE *ComposerInitFromFragment )( 
            __RPC__in IAnimationComposer2 * This,
            __RPC__in_opt IDispatch *composerSite,
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *oneFragment);
        
        END_INTERFACE
    } IAnimationComposer2Vtbl;

    interface IAnimationComposer2
    {
        CONST_VTBL struct IAnimationComposer2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationComposer2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationComposer2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationComposer2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationComposer2_get_attribute(This,attributeName)	\
    ( (This)->lpVtbl -> get_attribute(This,attributeName) ) 

#define IAnimationComposer2_ComposerInit(This,composerSite,attributeName)	\
    ( (This)->lpVtbl -> ComposerInit(This,composerSite,attributeName) ) 

#define IAnimationComposer2_ComposerDetach(This)	\
    ( (This)->lpVtbl -> ComposerDetach(This) ) 

#define IAnimationComposer2_UpdateFragments(This)	\
    ( (This)->lpVtbl -> UpdateFragments(This) ) 

#define IAnimationComposer2_AddFragment(This,newAnimationFragment)	\
    ( (This)->lpVtbl -> AddFragment(This,newAnimationFragment) ) 

#define IAnimationComposer2_InsertFragment(This,newAnimationFragment,index)	\
    ( (This)->lpVtbl -> InsertFragment(This,newAnimationFragment,index) ) 

#define IAnimationComposer2_RemoveFragment(This,oldAnimationFragment)	\
    ( (This)->lpVtbl -> RemoveFragment(This,oldAnimationFragment) ) 

#define IAnimationComposer2_EnumerateFragments(This,fragments)	\
    ( (This)->lpVtbl -> EnumerateFragments(This,fragments) ) 

#define IAnimationComposer2_GetNumFragments(This,fragmentCount)	\
    ( (This)->lpVtbl -> GetNumFragments(This,fragmentCount) ) 


#define IAnimationComposer2_ComposerInitFromFragment(This,composerSite,attributeName,oneFragment)	\
    ( (This)->lpVtbl -> ComposerInitFromFragment(This,composerSite,attributeName,oneFragment) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationComposer2_INTERFACE_DEFINED__ */


#ifndef __IAnimationComposerSite_INTERFACE_DEFINED__
#define __IAnimationComposerSite_INTERFACE_DEFINED__

/* interface IAnimationComposerSite */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_IAnimationComposerSite;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("488FCB56-8FD6-4cda-A06A-5BB232930ECA")
    IAnimationComposerSite : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE AddFragment( 
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *fragment) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE RemoveFragment( 
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *fragment) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE InsertFragment( 
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *fragment,
            VARIANT index) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE EnumerateFragments( 
            __RPC__in BSTR attributeName,
            __RPC__deref_in_opt IEnumVARIANT **fragments) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE RegisterComposerFactory( 
            __RPC__in VARIANT *factory) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE UnregisterComposerFactory( 
            __RPC__in VARIANT *factory) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationComposerSiteVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationComposerSite * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationComposerSite * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationComposerSite * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IAnimationComposerSite * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IAnimationComposerSite * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IAnimationComposerSite * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAnimationComposerSite * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *AddFragment )( 
            __RPC__in IAnimationComposerSite * This,
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *fragment);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *RemoveFragment )( 
            __RPC__in IAnimationComposerSite * This,
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *fragment);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *InsertFragment )( 
            __RPC__in IAnimationComposerSite * This,
            __RPC__in BSTR attributeName,
            __RPC__in_opt IDispatch *fragment,
            VARIANT index);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *EnumerateFragments )( 
            __RPC__in IAnimationComposerSite * This,
            __RPC__in BSTR attributeName,
            __RPC__deref_in_opt IEnumVARIANT **fragments);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *RegisterComposerFactory )( 
            __RPC__in IAnimationComposerSite * This,
            __RPC__in VARIANT *factory);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *UnregisterComposerFactory )( 
            __RPC__in IAnimationComposerSite * This,
            __RPC__in VARIANT *factory);
        
        END_INTERFACE
    } IAnimationComposerSiteVtbl;

    interface IAnimationComposerSite
    {
        CONST_VTBL struct IAnimationComposerSiteVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationComposerSite_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationComposerSite_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationComposerSite_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationComposerSite_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAnimationComposerSite_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAnimationComposerSite_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAnimationComposerSite_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IAnimationComposerSite_AddFragment(This,attributeName,fragment)	\
    ( (This)->lpVtbl -> AddFragment(This,attributeName,fragment) ) 

#define IAnimationComposerSite_RemoveFragment(This,attributeName,fragment)	\
    ( (This)->lpVtbl -> RemoveFragment(This,attributeName,fragment) ) 

#define IAnimationComposerSite_InsertFragment(This,attributeName,fragment,index)	\
    ( (This)->lpVtbl -> InsertFragment(This,attributeName,fragment,index) ) 

#define IAnimationComposerSite_EnumerateFragments(This,attributeName,fragments)	\
    ( (This)->lpVtbl -> EnumerateFragments(This,attributeName,fragments) ) 

#define IAnimationComposerSite_RegisterComposerFactory(This,factory)	\
    ( (This)->lpVtbl -> RegisterComposerFactory(This,factory) ) 

#define IAnimationComposerSite_UnregisterComposerFactory(This,factory)	\
    ( (This)->lpVtbl -> UnregisterComposerFactory(This,factory) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationComposerSite_INTERFACE_DEFINED__ */


#ifndef __IAnimationComposerSiteSink_INTERFACE_DEFINED__
#define __IAnimationComposerSiteSink_INTERFACE_DEFINED__

/* interface IAnimationComposerSiteSink */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IAnimationComposerSiteSink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8EF76C64-71CD-480f-96FC-BA2696E659BE")
    IAnimationComposerSiteSink : public IUnknown
    {
    public:
        virtual void STDMETHODCALLTYPE UpdateAnimations( void) = 0;
        
        virtual void STDMETHODCALLTYPE ComposerSiteDetach( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationComposerSiteSinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationComposerSiteSink * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationComposerSiteSink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationComposerSiteSink * This);
        
        void ( STDMETHODCALLTYPE *UpdateAnimations )( 
            __RPC__in IAnimationComposerSiteSink * This);
        
        void ( STDMETHODCALLTYPE *ComposerSiteDetach )( 
            __RPC__in IAnimationComposerSiteSink * This);
        
        END_INTERFACE
    } IAnimationComposerSiteSinkVtbl;

    interface IAnimationComposerSiteSink
    {
        CONST_VTBL struct IAnimationComposerSiteSinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationComposerSiteSink_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationComposerSiteSink_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationComposerSiteSink_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationComposerSiteSink_UpdateAnimations(This)	\
    ( (This)->lpVtbl -> UpdateAnimations(This) ) 

#define IAnimationComposerSiteSink_ComposerSiteDetach(This)	\
    ( (This)->lpVtbl -> ComposerSiteDetach(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationComposerSiteSink_INTERFACE_DEFINED__ */


#ifndef __IAnimationRoot_INTERFACE_DEFINED__
#define __IAnimationRoot_INTERFACE_DEFINED__

/* interface IAnimationRoot */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IAnimationRoot;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("29DF6387-30B4-4a62-891B-A9C5BE37BE88")
    IAnimationRoot : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE RegisterComposerSite( 
            __RPC__in_opt IUnknown *composerSite) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnregisterComposerSite( 
            __RPC__in_opt IUnknown *composerSite) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationRootVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationRoot * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationRoot * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationRoot * This);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterComposerSite )( 
            __RPC__in IAnimationRoot * This,
            __RPC__in_opt IUnknown *composerSite);
        
        HRESULT ( STDMETHODCALLTYPE *UnregisterComposerSite )( 
            __RPC__in IAnimationRoot * This,
            __RPC__in_opt IUnknown *composerSite);
        
        END_INTERFACE
    } IAnimationRootVtbl;

    interface IAnimationRoot
    {
        CONST_VTBL struct IAnimationRootVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationRoot_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationRoot_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationRoot_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationRoot_RegisterComposerSite(This,composerSite)	\
    ( (This)->lpVtbl -> RegisterComposerSite(This,composerSite) ) 

#define IAnimationRoot_UnregisterComposerSite(This,composerSite)	\
    ( (This)->lpVtbl -> UnregisterComposerSite(This,composerSite) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationRoot_INTERFACE_DEFINED__ */


#ifndef __IAnimationFragment_INTERFACE_DEFINED__
#define __IAnimationFragment_INTERFACE_DEFINED__

/* interface IAnimationFragment */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_IAnimationFragment;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("319DFD88-0AC6-4ab1-A19F-90223BA2DA16")
    IAnimationFragment : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_element( 
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **htmlElement) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE get_value( 
            /* [in] */ __RPC__in BSTR attributeName,
            /* [in] */ VARIANT origvalue,
            /* [in] */ VARIANT currentvalue,
            /* [retval][out] */ __RPC__out VARIANT *newvalue) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE DetachFromComposer( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationFragmentVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationFragment * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationFragment * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationFragment * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IAnimationFragment * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IAnimationFragment * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IAnimationFragment * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAnimationFragment * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_element )( 
            __RPC__in IAnimationFragment * This,
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **htmlElement);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *get_value )( 
            __RPC__in IAnimationFragment * This,
            /* [in] */ __RPC__in BSTR attributeName,
            /* [in] */ VARIANT origvalue,
            /* [in] */ VARIANT currentvalue,
            /* [retval][out] */ __RPC__out VARIANT *newvalue);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *DetachFromComposer )( 
            __RPC__in IAnimationFragment * This);
        
        END_INTERFACE
    } IAnimationFragmentVtbl;

    interface IAnimationFragment
    {
        CONST_VTBL struct IAnimationFragmentVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationFragment_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationFragment_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationFragment_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationFragment_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAnimationFragment_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAnimationFragment_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAnimationFragment_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IAnimationFragment_get_element(This,htmlElement)	\
    ( (This)->lpVtbl -> get_element(This,htmlElement) ) 

#define IAnimationFragment_get_value(This,attributeName,origvalue,currentvalue,newvalue)	\
    ( (This)->lpVtbl -> get_value(This,attributeName,origvalue,currentvalue,newvalue) ) 

#define IAnimationFragment_DetachFromComposer(This)	\
    ( (This)->lpVtbl -> DetachFromComposer(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationFragment_INTERFACE_DEFINED__ */


#ifndef __IFilterAnimationInfo_INTERFACE_DEFINED__
#define __IFilterAnimationInfo_INTERFACE_DEFINED__

/* interface IFilterAnimationInfo */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IFilterAnimationInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("02E29300-C758-49b4-9E11-C58BFE90558B")
    IFilterAnimationInfo : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetParameters( 
            __RPC__in VARIANT *params) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFilterAnimationInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IFilterAnimationInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IFilterAnimationInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IFilterAnimationInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetParameters )( 
            __RPC__in IFilterAnimationInfo * This,
            __RPC__in VARIANT *params);
        
        END_INTERFACE
    } IFilterAnimationInfoVtbl;

    interface IFilterAnimationInfo
    {
        CONST_VTBL struct IFilterAnimationInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFilterAnimationInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IFilterAnimationInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IFilterAnimationInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IFilterAnimationInfo_GetParameters(This,params)	\
    ( (This)->lpVtbl -> GetParameters(This,params) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IFilterAnimationInfo_INTERFACE_DEFINED__ */


#ifndef __ITIMEElementCollection_INTERFACE_DEFINED__
#define __ITIMEElementCollection_INTERFACE_DEFINED__

/* interface ITIMEElementCollection */
/* [object][uuid][dual][oleautomation] */ 


EXTERN_C const IID IID_ITIMEElementCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("50abc224-6d53-4f83-9135-2440a41b7bc8")
    ITIMEElementCollection : public IDispatch
    {
    public:
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_length( 
            /* [in] */ long v) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_length( 
            /* [out][retval] */ __RPC__out long *p) = 0;
        
        virtual /* [hidden][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__newEnum( 
            /* [out][retval] */ __RPC__deref_out_opt IUnknown **ppIUnknown) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE item( 
            /* [in][optional] */ VARIANT varName,
            /* [in][optional] */ VARIANT varIndex,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **ppDisp) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE tags( 
            /* [in] */ VARIANT varName,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **ppDisp) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEElementCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEElementCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEElementCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEElementCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEElementCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEElementCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEElementCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEElementCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_length )( 
            __RPC__in ITIMEElementCollection * This,
            /* [in] */ long v);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_length )( 
            __RPC__in ITIMEElementCollection * This,
            /* [out][retval] */ __RPC__out long *p);
        
        /* [hidden][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__newEnum )( 
            __RPC__in ITIMEElementCollection * This,
            /* [out][retval] */ __RPC__deref_out_opt IUnknown **ppIUnknown);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *item )( 
            __RPC__in ITIMEElementCollection * This,
            /* [in][optional] */ VARIANT varName,
            /* [in][optional] */ VARIANT varIndex,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **ppDisp);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *tags )( 
            __RPC__in ITIMEElementCollection * This,
            /* [in] */ VARIANT varName,
            /* [out][retval] */ __RPC__deref_out_opt IDispatch **ppDisp);
        
        END_INTERFACE
    } ITIMEElementCollectionVtbl;

    interface ITIMEElementCollection
    {
        CONST_VTBL struct ITIMEElementCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEElementCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEElementCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEElementCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEElementCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEElementCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEElementCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEElementCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEElementCollection_put_length(This,v)	\
    ( (This)->lpVtbl -> put_length(This,v) ) 

#define ITIMEElementCollection_get_length(This,p)	\
    ( (This)->lpVtbl -> get_length(This,p) ) 

#define ITIMEElementCollection_get__newEnum(This,ppIUnknown)	\
    ( (This)->lpVtbl -> get__newEnum(This,ppIUnknown) ) 

#define ITIMEElementCollection_item(This,varName,varIndex,ppDisp)	\
    ( (This)->lpVtbl -> item(This,varName,varIndex,ppDisp) ) 

#define ITIMEElementCollection_tags(This,varName,ppDisp)	\
    ( (This)->lpVtbl -> tags(This,varName,ppDisp) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEElementCollection_INTERFACE_DEFINED__ */


#ifndef __ITIMEState_INTERFACE_DEFINED__
#define __ITIMEState_INTERFACE_DEFINED__

/* interface ITIMEState */
/* [uuid][unique][dual][oleautomation][object] */ 


EXTERN_C const IID IID_ITIMEState;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("DD5EC62A-9D77-4573-80A8-758594E69CEA")
    ITIMEState : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_activeDur( 
            /* [out][retval] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_activeTime( 
            /* [out][retval] */ __RPC__out double *time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isActive( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *active) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isOn( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *on) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isPaused( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *paused) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isMuted( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *muted) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_parentTimeBegin( 
            /* [out][retval] */ __RPC__out double *time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_parentTimeEnd( 
            /* [out][retval] */ __RPC__out double *time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_progress( 
            /* [out][retval] */ __RPC__out double *progress) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_repeatCount( 
            /* [out][retval] */ __RPC__out LONG *count) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_segmentDur( 
            /* [out][retval] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_segmentTime( 
            /* [out][retval] */ __RPC__out double *time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_simpleDur( 
            /* [out][retval] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_simpleTime( 
            /* [out][retval] */ __RPC__out double *time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_speed( 
            /* [out][retval] */ __RPC__out float *speed) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_state( 
            /* [out][retval] */ __RPC__out TimeState *timeState) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_stateString( 
            /* [out][retval] */ __RPC__deref_out_opt BSTR *state) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_volume( 
            /* [out][retval] */ __RPC__out float *vol) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEStateVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEState * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEState * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEState * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEState * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEState * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEState * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEState * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeDur )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_activeTime )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isActive )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *active);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isOn )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *on);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isPaused )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *paused);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isMuted )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *muted);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_parentTimeBegin )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_parentTimeEnd )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_progress )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *progress);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_repeatCount )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out LONG *count);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_segmentDur )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_segmentTime )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_simpleDur )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_simpleTime )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out double *time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_speed )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out float *speed);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_state )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out TimeState *timeState);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_stateString )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__deref_out_opt BSTR *state);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_volume )( 
            __RPC__in ITIMEState * This,
            /* [out][retval] */ __RPC__out float *vol);
        
        END_INTERFACE
    } ITIMEStateVtbl;

    interface ITIMEState
    {
        CONST_VTBL struct ITIMEStateVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEState_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEState_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEState_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEState_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEState_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEState_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEState_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEState_get_activeDur(This,dur)	\
    ( (This)->lpVtbl -> get_activeDur(This,dur) ) 

#define ITIMEState_get_activeTime(This,time)	\
    ( (This)->lpVtbl -> get_activeTime(This,time) ) 

#define ITIMEState_get_isActive(This,active)	\
    ( (This)->lpVtbl -> get_isActive(This,active) ) 

#define ITIMEState_get_isOn(This,on)	\
    ( (This)->lpVtbl -> get_isOn(This,on) ) 

#define ITIMEState_get_isPaused(This,paused)	\
    ( (This)->lpVtbl -> get_isPaused(This,paused) ) 

#define ITIMEState_get_isMuted(This,muted)	\
    ( (This)->lpVtbl -> get_isMuted(This,muted) ) 

#define ITIMEState_get_parentTimeBegin(This,time)	\
    ( (This)->lpVtbl -> get_parentTimeBegin(This,time) ) 

#define ITIMEState_get_parentTimeEnd(This,time)	\
    ( (This)->lpVtbl -> get_parentTimeEnd(This,time) ) 

#define ITIMEState_get_progress(This,progress)	\
    ( (This)->lpVtbl -> get_progress(This,progress) ) 

#define ITIMEState_get_repeatCount(This,count)	\
    ( (This)->lpVtbl -> get_repeatCount(This,count) ) 

#define ITIMEState_get_segmentDur(This,dur)	\
    ( (This)->lpVtbl -> get_segmentDur(This,dur) ) 

#define ITIMEState_get_segmentTime(This,time)	\
    ( (This)->lpVtbl -> get_segmentTime(This,time) ) 

#define ITIMEState_get_simpleDur(This,dur)	\
    ( (This)->lpVtbl -> get_simpleDur(This,dur) ) 

#define ITIMEState_get_simpleTime(This,time)	\
    ( (This)->lpVtbl -> get_simpleTime(This,time) ) 

#define ITIMEState_get_speed(This,speed)	\
    ( (This)->lpVtbl -> get_speed(This,speed) ) 

#define ITIMEState_get_state(This,timeState)	\
    ( (This)->lpVtbl -> get_state(This,timeState) ) 

#define ITIMEState_get_stateString(This,state)	\
    ( (This)->lpVtbl -> get_stateString(This,state) ) 

#define ITIMEState_get_volume(This,vol)	\
    ( (This)->lpVtbl -> get_volume(This,vol) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEState_INTERFACE_DEFINED__ */


#ifndef __ITIMEPlayItem_INTERFACE_DEFINED__
#define __ITIMEPlayItem_INTERFACE_DEFINED__

/* interface ITIMEPlayItem */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEPlayItem;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2A6096D9-2CE0-47DC-A813-9099A2466309")
    ITIMEPlayItem : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_abstract( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_author( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_copyright( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_dur( 
            /* [retval][out] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_index( 
            /* [retval][out] */ __RPC__out long *index) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_rating( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_src( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *src) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_title( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *title) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE setActive( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEPlayItemVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEPlayItem * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEPlayItem * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEPlayItem * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEPlayItem * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEPlayItem * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEPlayItem * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEPlayItem * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_abstract )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_author )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copyright )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_index )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__out long *index);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_rating )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_src )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *src);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in ITIMEPlayItem * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *title);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *setActive )( 
            __RPC__in ITIMEPlayItem * This);
        
        END_INTERFACE
    } ITIMEPlayItemVtbl;

    interface ITIMEPlayItem
    {
        CONST_VTBL struct ITIMEPlayItemVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEPlayItem_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEPlayItem_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEPlayItem_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEPlayItem_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEPlayItem_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEPlayItem_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEPlayItem_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEPlayItem_get_abstract(This,abs)	\
    ( (This)->lpVtbl -> get_abstract(This,abs) ) 

#define ITIMEPlayItem_get_author(This,auth)	\
    ( (This)->lpVtbl -> get_author(This,auth) ) 

#define ITIMEPlayItem_get_copyright(This,cpyrght)	\
    ( (This)->lpVtbl -> get_copyright(This,cpyrght) ) 

#define ITIMEPlayItem_get_dur(This,dur)	\
    ( (This)->lpVtbl -> get_dur(This,dur) ) 

#define ITIMEPlayItem_get_index(This,index)	\
    ( (This)->lpVtbl -> get_index(This,index) ) 

#define ITIMEPlayItem_get_rating(This,rate)	\
    ( (This)->lpVtbl -> get_rating(This,rate) ) 

#define ITIMEPlayItem_get_src(This,src)	\
    ( (This)->lpVtbl -> get_src(This,src) ) 

#define ITIMEPlayItem_get_title(This,title)	\
    ( (This)->lpVtbl -> get_title(This,title) ) 

#define ITIMEPlayItem_setActive(This)	\
    ( (This)->lpVtbl -> setActive(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEPlayItem_INTERFACE_DEFINED__ */


#ifndef __ITIMEPlayItem2_INTERFACE_DEFINED__
#define __ITIMEPlayItem2_INTERFACE_DEFINED__

/* interface ITIMEPlayItem2 */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEPlayItem2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4262CD38-6BDC-40A4-BC50-4CC50366E702")
    ITIMEPlayItem2 : public ITIMEPlayItem
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_banner( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *banner) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_bannerAbstract( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abstract) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_bannerMoreInfo( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *moreInfo) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEPlayItem2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEPlayItem2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEPlayItem2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEPlayItem2 * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_abstract )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_author )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copyright )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_index )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__out long *index);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_rating )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_src )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *src);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *title);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *setActive )( 
            __RPC__in ITIMEPlayItem2 * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_banner )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *banner);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_bannerAbstract )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abstract);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_bannerMoreInfo )( 
            __RPC__in ITIMEPlayItem2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *moreInfo);
        
        END_INTERFACE
    } ITIMEPlayItem2Vtbl;

    interface ITIMEPlayItem2
    {
        CONST_VTBL struct ITIMEPlayItem2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEPlayItem2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEPlayItem2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEPlayItem2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEPlayItem2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEPlayItem2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEPlayItem2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEPlayItem2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEPlayItem2_get_abstract(This,abs)	\
    ( (This)->lpVtbl -> get_abstract(This,abs) ) 

#define ITIMEPlayItem2_get_author(This,auth)	\
    ( (This)->lpVtbl -> get_author(This,auth) ) 

#define ITIMEPlayItem2_get_copyright(This,cpyrght)	\
    ( (This)->lpVtbl -> get_copyright(This,cpyrght) ) 

#define ITIMEPlayItem2_get_dur(This,dur)	\
    ( (This)->lpVtbl -> get_dur(This,dur) ) 

#define ITIMEPlayItem2_get_index(This,index)	\
    ( (This)->lpVtbl -> get_index(This,index) ) 

#define ITIMEPlayItem2_get_rating(This,rate)	\
    ( (This)->lpVtbl -> get_rating(This,rate) ) 

#define ITIMEPlayItem2_get_src(This,src)	\
    ( (This)->lpVtbl -> get_src(This,src) ) 

#define ITIMEPlayItem2_get_title(This,title)	\
    ( (This)->lpVtbl -> get_title(This,title) ) 

#define ITIMEPlayItem2_setActive(This)	\
    ( (This)->lpVtbl -> setActive(This) ) 


#define ITIMEPlayItem2_get_banner(This,banner)	\
    ( (This)->lpVtbl -> get_banner(This,banner) ) 

#define ITIMEPlayItem2_get_bannerAbstract(This,abstract)	\
    ( (This)->lpVtbl -> get_bannerAbstract(This,abstract) ) 

#define ITIMEPlayItem2_get_bannerMoreInfo(This,moreInfo)	\
    ( (This)->lpVtbl -> get_bannerMoreInfo(This,moreInfo) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEPlayItem2_INTERFACE_DEFINED__ */


#ifndef __ITIMEPlayList_INTERFACE_DEFINED__
#define __ITIMEPlayList_INTERFACE_DEFINED__

/* interface ITIMEPlayList */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEPlayList;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("E9B75B62-DD97-4B19-8FD9-9646292952E0")
    ITIMEPlayList : public IDispatch
    {
    public:
        virtual /* [propput][id] */ HRESULT STDMETHODCALLTYPE put_activeTrack( 
            /* [in] */ VARIANT vTrack) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_activeTrack( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayItem **pPlayItem) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_dur( 
            __RPC__in double *dur) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE item( 
            /* [in][defaultvalue] */ VARIANT varIndex,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayItem **pPlayItem) = 0;
        
        virtual /* [propget][id] */ HRESULT STDMETHODCALLTYPE get_length( 
            /* [retval][out] */ __RPC__out long *p) = 0;
        
        virtual /* [hidden][restricted][propget][id] */ HRESULT STDMETHODCALLTYPE get__newEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **p) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE nextTrack( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE prevTrack( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEPlayListVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEPlayList * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEPlayList * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEPlayList * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEPlayList * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEPlayList * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEPlayList * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEPlayList * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_activeTrack )( 
            __RPC__in ITIMEPlayList * This,
            /* [in] */ VARIANT vTrack);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_activeTrack )( 
            __RPC__in ITIMEPlayList * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayItem **pPlayItem);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_dur )( 
            __RPC__in ITIMEPlayList * This,
            __RPC__in double *dur);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *item )( 
            __RPC__in ITIMEPlayList * This,
            /* [in][defaultvalue] */ VARIANT varIndex,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayItem **pPlayItem);
        
        /* [propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_length )( 
            __RPC__in ITIMEPlayList * This,
            /* [retval][out] */ __RPC__out long *p);
        
        /* [hidden][restricted][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get__newEnum )( 
            __RPC__in ITIMEPlayList * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **p);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *nextTrack )( 
            __RPC__in ITIMEPlayList * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *prevTrack )( 
            __RPC__in ITIMEPlayList * This);
        
        END_INTERFACE
    } ITIMEPlayListVtbl;

    interface ITIMEPlayList
    {
        CONST_VTBL struct ITIMEPlayListVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEPlayList_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEPlayList_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEPlayList_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEPlayList_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEPlayList_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEPlayList_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEPlayList_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEPlayList_put_activeTrack(This,vTrack)	\
    ( (This)->lpVtbl -> put_activeTrack(This,vTrack) ) 

#define ITIMEPlayList_get_activeTrack(This,pPlayItem)	\
    ( (This)->lpVtbl -> get_activeTrack(This,pPlayItem) ) 

#define ITIMEPlayList_get_dur(This,dur)	\
    ( (This)->lpVtbl -> get_dur(This,dur) ) 

#define ITIMEPlayList_item(This,varIndex,pPlayItem)	\
    ( (This)->lpVtbl -> item(This,varIndex,pPlayItem) ) 

#define ITIMEPlayList_get_length(This,p)	\
    ( (This)->lpVtbl -> get_length(This,p) ) 

#define ITIMEPlayList_get__newEnum(This,p)	\
    ( (This)->lpVtbl -> get__newEnum(This,p) ) 

#define ITIMEPlayList_nextTrack(This)	\
    ( (This)->lpVtbl -> nextTrack(This) ) 

#define ITIMEPlayList_prevTrack(This)	\
    ( (This)->lpVtbl -> prevTrack(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEPlayList_INTERFACE_DEFINED__ */


#ifndef __ITIMEDVDPlayerObject_INTERFACE_DEFINED__
#define __ITIMEDVDPlayerObject_INTERFACE_DEFINED__

/* interface ITIMEDVDPlayerObject */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEDVDPlayerObject;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3AF7AB68-4F29-462C-AA6E-5872448899E3")
    ITIMEDVDPlayerObject : public IDispatch
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE upperButtonSelect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE lowerButtonSelect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE leftButtonSelect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE rightButtonSelect( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE buttonActivate( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE gotoMenu( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEDVDPlayerObjectVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEDVDPlayerObject * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEDVDPlayerObject * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEDVDPlayerObject * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEDVDPlayerObject * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEDVDPlayerObject * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *upperButtonSelect )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *lowerButtonSelect )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *leftButtonSelect )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *rightButtonSelect )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *buttonActivate )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *gotoMenu )( 
            __RPC__in ITIMEDVDPlayerObject * This);
        
        END_INTERFACE
    } ITIMEDVDPlayerObjectVtbl;

    interface ITIMEDVDPlayerObject
    {
        CONST_VTBL struct ITIMEDVDPlayerObjectVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEDVDPlayerObject_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEDVDPlayerObject_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEDVDPlayerObject_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEDVDPlayerObject_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEDVDPlayerObject_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEDVDPlayerObject_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEDVDPlayerObject_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEDVDPlayerObject_upperButtonSelect(This)	\
    ( (This)->lpVtbl -> upperButtonSelect(This) ) 

#define ITIMEDVDPlayerObject_lowerButtonSelect(This)	\
    ( (This)->lpVtbl -> lowerButtonSelect(This) ) 

#define ITIMEDVDPlayerObject_leftButtonSelect(This)	\
    ( (This)->lpVtbl -> leftButtonSelect(This) ) 

#define ITIMEDVDPlayerObject_rightButtonSelect(This)	\
    ( (This)->lpVtbl -> rightButtonSelect(This) ) 

#define ITIMEDVDPlayerObject_buttonActivate(This)	\
    ( (This)->lpVtbl -> buttonActivate(This) ) 

#define ITIMEDVDPlayerObject_gotoMenu(This)	\
    ( (This)->lpVtbl -> gotoMenu(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEDVDPlayerObject_INTERFACE_DEFINED__ */


#ifndef __ITIMEDMusicPlayerObject_INTERFACE_DEFINED__
#define __ITIMEDMusicPlayerObject_INTERFACE_DEFINED__

/* interface ITIMEDMusicPlayerObject */
/* [unique][dual][uuid][object] */ 


EXTERN_C const IID IID_ITIMEDMusicPlayerObject;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("407954F5-2BAB-4CFA-954D-249F9FCE43A1")
    ITIMEDMusicPlayerObject : public IDispatch
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isDirectMusicInstalled( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *hasDM) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEDMusicPlayerObjectVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEDMusicPlayerObject * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEDMusicPlayerObject * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEDMusicPlayerObject * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITIMEDMusicPlayerObject * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITIMEDMusicPlayerObject * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITIMEDMusicPlayerObject * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITIMEDMusicPlayerObject * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isDirectMusicInstalled )( 
            __RPC__in ITIMEDMusicPlayerObject * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *hasDM);
        
        END_INTERFACE
    } ITIMEDMusicPlayerObjectVtbl;

    interface ITIMEDMusicPlayerObject
    {
        CONST_VTBL struct ITIMEDMusicPlayerObjectVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEDMusicPlayerObject_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEDMusicPlayerObject_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEDMusicPlayerObject_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEDMusicPlayerObject_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITIMEDMusicPlayerObject_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITIMEDMusicPlayerObject_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITIMEDMusicPlayerObject_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITIMEDMusicPlayerObject_get_isDirectMusicInstalled(This,hasDM)	\
    ( (This)->lpVtbl -> get_isDirectMusicInstalled(This,hasDM) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEDMusicPlayerObject_INTERFACE_DEFINED__ */


#ifndef __ITIMEFactory_INTERFACE_DEFINED__
#define __ITIMEFactory_INTERFACE_DEFINED__

/* interface ITIMEFactory */
/* [unique][hidden][uuid][object] */ 


EXTERN_C const IID IID_ITIMEFactory;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("cd51e446-3006-434f-90e2-e37e8fb8ca8f")
    ITIMEFactory : public IUnknown
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct ITIMEFactoryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEFactory * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEFactory * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEFactory * This);
        
        END_INTERFACE
    } ITIMEFactoryVtbl;

    interface ITIMEFactory
    {
        CONST_VTBL struct ITIMEFactoryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEFactory_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEFactory_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEFactory_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEFactory_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_TIMEFactory;

#ifdef __cplusplus

class DECLSPEC_UUID("17237A20-3ADB-48ec-B182-35291F115790")
TIMEFactory;
#endif

#ifndef __IAnimationComposerFactory_INTERFACE_DEFINED__
#define __IAnimationComposerFactory_INTERFACE_DEFINED__

/* interface IAnimationComposerFactory */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IAnimationComposerFactory;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BEEB3233-F71F-4683-8B05-9A5314C97DBC")
    IAnimationComposerFactory : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE FindComposer( 
            /* [in] */ __RPC__in_opt IDispatch *targetElement,
            /* [in] */ __RPC__in BSTR attributeName,
            /* [retval][out] */ __RPC__deref_out_opt IAnimationComposer **animationComposer) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnimationComposerFactoryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationComposerFactory * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationComposerFactory * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationComposerFactory * This);
        
        HRESULT ( STDMETHODCALLTYPE *FindComposer )( 
            __RPC__in IAnimationComposerFactory * This,
            /* [in] */ __RPC__in_opt IDispatch *targetElement,
            /* [in] */ __RPC__in BSTR attributeName,
            /* [retval][out] */ __RPC__deref_out_opt IAnimationComposer **animationComposer);
        
        END_INTERFACE
    } IAnimationComposerFactoryVtbl;

    interface IAnimationComposerFactory
    {
        CONST_VTBL struct IAnimationComposerFactoryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationComposerFactory_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationComposerFactory_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationComposerFactory_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationComposerFactory_FindComposer(This,targetElement,attributeName,animationComposer)	\
    ( (This)->lpVtbl -> FindComposer(This,targetElement,attributeName,animationComposer) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationComposerFactory_INTERFACE_DEFINED__ */


#ifndef __IAnimationComposerSiteFactory_INTERFACE_DEFINED__
#define __IAnimationComposerSiteFactory_INTERFACE_DEFINED__

/* interface IAnimationComposerSiteFactory */
/* [unique][hidden][dual][uuid][object] */ 


EXTERN_C const IID IID_IAnimationComposerSiteFactory;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B4EA5681-ED72-4efe-BBD7-7C47D1325696")
    IAnimationComposerSiteFactory : public IDispatch
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IAnimationComposerSiteFactoryVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAnimationComposerSiteFactory * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAnimationComposerSiteFactory * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAnimationComposerSiteFactory * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IAnimationComposerSiteFactory * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IAnimationComposerSiteFactory * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IAnimationComposerSiteFactory * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAnimationComposerSiteFactory * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IAnimationComposerSiteFactoryVtbl;

    interface IAnimationComposerSiteFactory
    {
        CONST_VTBL struct IAnimationComposerSiteFactoryVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnimationComposerSiteFactory_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAnimationComposerSiteFactory_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAnimationComposerSiteFactory_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAnimationComposerSiteFactory_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAnimationComposerSiteFactory_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAnimationComposerSiteFactory_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAnimationComposerSiteFactory_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAnimationComposerSiteFactory_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaPlayerSite_INTERFACE_DEFINED__
#define __ITIMEMediaPlayerSite_INTERFACE_DEFINED__

/* interface ITIMEMediaPlayerSite */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaPlayerSite;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("bf0571ed-344f-4f58-82c7-7431ed0fd834")
    ITIMEMediaPlayerSite : public IUnknown
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeElement( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **pElm) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_timeState( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **pState) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE reportError( 
            /* [in] */ HRESULT hr,
            /* [in] */ __RPC__in BSTR errorString) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaPlayerSiteVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaPlayerSite * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaPlayerSite * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaPlayerSite * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeElement )( 
            __RPC__in ITIMEMediaPlayerSite * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEElement **pElm);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_timeState )( 
            __RPC__in ITIMEMediaPlayerSite * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEState **pState);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *reportError )( 
            __RPC__in ITIMEMediaPlayerSite * This,
            /* [in] */ HRESULT hr,
            /* [in] */ __RPC__in BSTR errorString);
        
        END_INTERFACE
    } ITIMEMediaPlayerSiteVtbl;

    interface ITIMEMediaPlayerSite
    {
        CONST_VTBL struct ITIMEMediaPlayerSiteVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaPlayerSite_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaPlayerSite_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaPlayerSite_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaPlayerSite_get_timeElement(This,pElm)	\
    ( (This)->lpVtbl -> get_timeElement(This,pElm) ) 

#define ITIMEMediaPlayerSite_get_timeState(This,pState)	\
    ( (This)->lpVtbl -> get_timeState(This,pState) ) 

#define ITIMEMediaPlayerSite_reportError(This,hr,errorString)	\
    ( (This)->lpVtbl -> reportError(This,hr,errorString) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaPlayerSite_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaPlayer_INTERFACE_DEFINED__
#define __ITIMEMediaPlayer_INTERFACE_DEFINED__

/* interface ITIMEMediaPlayer */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaPlayer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ea4a95be-acc9-4bf0-85a4-1bf3c51e431c")
    ITIMEMediaPlayer : public IUnknown
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Init( 
            __RPC__in_opt ITIMEMediaPlayerSite *mpsite) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE Detach( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE begin( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE end( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE resume( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE pause( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE repeat( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE reset( void) = 0;
        
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE seek( 
            /* [in] */ double time) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_src( 
            /* [in] */ __RPC__in BSTR url) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_clipBegin( 
            /* [in] */ VARIANT b) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_clipEnd( 
            /* [in] */ VARIANT e) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_abstract( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_author( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_canPause( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_canSeek( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_clipDur( 
            /* [retval][out] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_copyright( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_currTime( 
            /* [retval][out] */ __RPC__out double *time) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_customObject( 
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **disp) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasAudio( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasVisual( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mediaDur( 
            /* [retval][out] */ __RPC__out double *dur) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mediaHeight( 
            /* [retval][out] */ __RPC__out long *height) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_mediaWidth( 
            /* [retval][out] */ __RPC__out long *width) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_playList( 
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayList **pPlayList) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_rating( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_state( 
            /* [retval][out] */ __RPC__out TimeState *ts) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_title( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *name) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaPlayerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Init )( 
            __RPC__in ITIMEMediaPlayer * This,
            __RPC__in_opt ITIMEMediaPlayerSite *mpsite);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *Detach )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *begin )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *end )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *resume )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *pause )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *repeat )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *reset )( 
            __RPC__in ITIMEMediaPlayer * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *seek )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [in] */ double time);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_src )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [in] */ __RPC__in BSTR url);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_clipBegin )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [in] */ VARIANT b);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_clipEnd )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [in] */ VARIANT e);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_abstract )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *abs);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_author )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *auth);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_canPause )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_canSeek )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_clipDur )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_copyright )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *cpyrght);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_currTime )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__out double *time);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_customObject )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt IDispatch **disp);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasAudio )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasVisual )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaDur )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__out double *dur);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaHeight )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__out long *height);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_mediaWidth )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__out long *width);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_playList )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt ITIMEPlayList **pPlayList);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_rating )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *rate);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_state )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__out TimeState *ts);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_title )( 
            __RPC__in ITIMEMediaPlayer * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *name);
        
        END_INTERFACE
    } ITIMEMediaPlayerVtbl;

    interface ITIMEMediaPlayer
    {
        CONST_VTBL struct ITIMEMediaPlayerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaPlayer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaPlayer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaPlayer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaPlayer_Init(This,mpsite)	\
    ( (This)->lpVtbl -> Init(This,mpsite) ) 

#define ITIMEMediaPlayer_Detach(This)	\
    ( (This)->lpVtbl -> Detach(This) ) 

#define ITIMEMediaPlayer_begin(This)	\
    ( (This)->lpVtbl -> begin(This) ) 

#define ITIMEMediaPlayer_end(This)	\
    ( (This)->lpVtbl -> end(This) ) 

#define ITIMEMediaPlayer_resume(This)	\
    ( (This)->lpVtbl -> resume(This) ) 

#define ITIMEMediaPlayer_pause(This)	\
    ( (This)->lpVtbl -> pause(This) ) 

#define ITIMEMediaPlayer_repeat(This)	\
    ( (This)->lpVtbl -> repeat(This) ) 

#define ITIMEMediaPlayer_reset(This)	\
    ( (This)->lpVtbl -> reset(This) ) 

#define ITIMEMediaPlayer_seek(This,time)	\
    ( (This)->lpVtbl -> seek(This,time) ) 

#define ITIMEMediaPlayer_put_src(This,url)	\
    ( (This)->lpVtbl -> put_src(This,url) ) 

#define ITIMEMediaPlayer_put_clipBegin(This,b)	\
    ( (This)->lpVtbl -> put_clipBegin(This,b) ) 

#define ITIMEMediaPlayer_put_clipEnd(This,e)	\
    ( (This)->lpVtbl -> put_clipEnd(This,e) ) 

#define ITIMEMediaPlayer_get_abstract(This,abs)	\
    ( (This)->lpVtbl -> get_abstract(This,abs) ) 

#define ITIMEMediaPlayer_get_author(This,auth)	\
    ( (This)->lpVtbl -> get_author(This,auth) ) 

#define ITIMEMediaPlayer_get_canPause(This,b)	\
    ( (This)->lpVtbl -> get_canPause(This,b) ) 

#define ITIMEMediaPlayer_get_canSeek(This,b)	\
    ( (This)->lpVtbl -> get_canSeek(This,b) ) 

#define ITIMEMediaPlayer_get_clipDur(This,dur)	\
    ( (This)->lpVtbl -> get_clipDur(This,dur) ) 

#define ITIMEMediaPlayer_get_copyright(This,cpyrght)	\
    ( (This)->lpVtbl -> get_copyright(This,cpyrght) ) 

#define ITIMEMediaPlayer_get_currTime(This,time)	\
    ( (This)->lpVtbl -> get_currTime(This,time) ) 

#define ITIMEMediaPlayer_get_customObject(This,disp)	\
    ( (This)->lpVtbl -> get_customObject(This,disp) ) 

#define ITIMEMediaPlayer_get_hasAudio(This,b)	\
    ( (This)->lpVtbl -> get_hasAudio(This,b) ) 

#define ITIMEMediaPlayer_get_hasVisual(This,b)	\
    ( (This)->lpVtbl -> get_hasVisual(This,b) ) 

#define ITIMEMediaPlayer_get_mediaDur(This,dur)	\
    ( (This)->lpVtbl -> get_mediaDur(This,dur) ) 

#define ITIMEMediaPlayer_get_mediaHeight(This,height)	\
    ( (This)->lpVtbl -> get_mediaHeight(This,height) ) 

#define ITIMEMediaPlayer_get_mediaWidth(This,width)	\
    ( (This)->lpVtbl -> get_mediaWidth(This,width) ) 

#define ITIMEMediaPlayer_get_playList(This,pPlayList)	\
    ( (This)->lpVtbl -> get_playList(This,pPlayList) ) 

#define ITIMEMediaPlayer_get_rating(This,rate)	\
    ( (This)->lpVtbl -> get_rating(This,rate) ) 

#define ITIMEMediaPlayer_get_state(This,ts)	\
    ( (This)->lpVtbl -> get_state(This,ts) ) 

#define ITIMEMediaPlayer_get_title(This,name)	\
    ( (This)->lpVtbl -> get_title(This,name) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaPlayer_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaPlayerAudio_INTERFACE_DEFINED__
#define __ITIMEMediaPlayerAudio_INTERFACE_DEFINED__

/* interface ITIMEMediaPlayerAudio */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaPlayerAudio;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ffaacfda-b374-4f22-ac9a-c5bb9437cb56")
    ITIMEMediaPlayerAudio : public IUnknown
    {
    public:
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_volume( 
            /* [in] */ float f) = 0;
        
        virtual /* [id][propput] */ HRESULT STDMETHODCALLTYPE put_mute( 
            /* [in] */ VARIANT_BOOL m) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaPlayerAudioVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaPlayerAudio * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaPlayerAudio * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaPlayerAudio * This);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_volume )( 
            __RPC__in ITIMEMediaPlayerAudio * This,
            /* [in] */ float f);
        
        /* [id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_mute )( 
            __RPC__in ITIMEMediaPlayerAudio * This,
            /* [in] */ VARIANT_BOOL m);
        
        END_INTERFACE
    } ITIMEMediaPlayerAudioVtbl;

    interface ITIMEMediaPlayerAudio
    {
        CONST_VTBL struct ITIMEMediaPlayerAudioVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaPlayerAudio_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaPlayerAudio_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaPlayerAudio_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaPlayerAudio_put_volume(This,f)	\
    ( (This)->lpVtbl -> put_volume(This,f) ) 

#define ITIMEMediaPlayerAudio_put_mute(This,m)	\
    ( (This)->lpVtbl -> put_mute(This,m) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaPlayerAudio_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaPlayerNetwork_INTERFACE_DEFINED__
#define __ITIMEMediaPlayerNetwork_INTERFACE_DEFINED__

/* interface ITIMEMediaPlayerNetwork */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaPlayerNetwork;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("b9987fca-7fbb-4015-bd3d-7418605514da")
    ITIMEMediaPlayerNetwork : public IUnknown
    {
    public:
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_hasDownloadProgress( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_downloadProgress( 
            /* [retval][out] */ __RPC__out long *l) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_isBuffered( 
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b) = 0;
        
        virtual /* [id][propget] */ HRESULT STDMETHODCALLTYPE get_bufferingProgress( 
            /* [retval][out] */ __RPC__out long *l) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaPlayerNetworkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaPlayerNetwork * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaPlayerNetwork * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaPlayerNetwork * This);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_hasDownloadProgress )( 
            __RPC__in ITIMEMediaPlayerNetwork * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_downloadProgress )( 
            __RPC__in ITIMEMediaPlayerNetwork * This,
            /* [retval][out] */ __RPC__out long *l);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_isBuffered )( 
            __RPC__in ITIMEMediaPlayerNetwork * This,
            /* [out][retval] */ __RPC__out VARIANT_BOOL *b);
        
        /* [id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_bufferingProgress )( 
            __RPC__in ITIMEMediaPlayerNetwork * This,
            /* [retval][out] */ __RPC__out long *l);
        
        END_INTERFACE
    } ITIMEMediaPlayerNetworkVtbl;

    interface ITIMEMediaPlayerNetwork
    {
        CONST_VTBL struct ITIMEMediaPlayerNetworkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaPlayerNetwork_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaPlayerNetwork_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaPlayerNetwork_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaPlayerNetwork_get_hasDownloadProgress(This,b)	\
    ( (This)->lpVtbl -> get_hasDownloadProgress(This,b) ) 

#define ITIMEMediaPlayerNetwork_get_downloadProgress(This,l)	\
    ( (This)->lpVtbl -> get_downloadProgress(This,l) ) 

#define ITIMEMediaPlayerNetwork_get_isBuffered(This,b)	\
    ( (This)->lpVtbl -> get_isBuffered(This,b) ) 

#define ITIMEMediaPlayerNetwork_get_bufferingProgress(This,l)	\
    ( (This)->lpVtbl -> get_bufferingProgress(This,l) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaPlayerNetwork_INTERFACE_DEFINED__ */


#ifndef __ITIMEMediaPlayerControl_INTERFACE_DEFINED__
#define __ITIMEMediaPlayerControl_INTERFACE_DEFINED__

/* interface ITIMEMediaPlayerControl */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ITIMEMediaPlayerControl;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("897a99e7-f386-45c8-b51b-3a25bbcbba69")
    ITIMEMediaPlayerControl : public IUnknown
    {
    public:
        virtual /* [id] */ HRESULT STDMETHODCALLTYPE getControl( 
            __RPC__deref_in_opt IUnknown **control) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITIMEMediaPlayerControlVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITIMEMediaPlayerControl * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITIMEMediaPlayerControl * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITIMEMediaPlayerControl * This);
        
        /* [id] */ HRESULT ( STDMETHODCALLTYPE *getControl )( 
            __RPC__in ITIMEMediaPlayerControl * This,
            __RPC__deref_in_opt IUnknown **control);
        
        END_INTERFACE
    } ITIMEMediaPlayerControlVtbl;

    interface ITIMEMediaPlayerControl
    {
        CONST_VTBL struct ITIMEMediaPlayerControlVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITIMEMediaPlayerControl_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITIMEMediaPlayerControl_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITIMEMediaPlayerControl_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITIMEMediaPlayerControl_getControl(This,control)	\
    ( (This)->lpVtbl -> getControl(This,control) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITIMEMediaPlayerControl_INTERFACE_DEFINED__ */

#endif /* __MSTIME_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



