

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for winsync.idl:
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

#ifndef __winsync_h__
#define __winsync_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IClockVectorElement_FWD_DEFINED__
#define __IClockVectorElement_FWD_DEFINED__
typedef interface IClockVectorElement IClockVectorElement;
#endif 	/* __IClockVectorElement_FWD_DEFINED__ */


#ifndef __IFeedClockVectorElement_FWD_DEFINED__
#define __IFeedClockVectorElement_FWD_DEFINED__
typedef interface IFeedClockVectorElement IFeedClockVectorElement;
#endif 	/* __IFeedClockVectorElement_FWD_DEFINED__ */


#ifndef __IClockVector_FWD_DEFINED__
#define __IClockVector_FWD_DEFINED__
typedef interface IClockVector IClockVector;
#endif 	/* __IClockVector_FWD_DEFINED__ */


#ifndef __IFeedClockVector_FWD_DEFINED__
#define __IFeedClockVector_FWD_DEFINED__
typedef interface IFeedClockVector IFeedClockVector;
#endif 	/* __IFeedClockVector_FWD_DEFINED__ */


#ifndef __IEnumClockVector_FWD_DEFINED__
#define __IEnumClockVector_FWD_DEFINED__
typedef interface IEnumClockVector IEnumClockVector;
#endif 	/* __IEnumClockVector_FWD_DEFINED__ */


#ifndef __IEnumFeedClockVector_FWD_DEFINED__
#define __IEnumFeedClockVector_FWD_DEFINED__
typedef interface IEnumFeedClockVector IEnumFeedClockVector;
#endif 	/* __IEnumFeedClockVector_FWD_DEFINED__ */


#ifndef __ICoreFragment_FWD_DEFINED__
#define __ICoreFragment_FWD_DEFINED__
typedef interface ICoreFragment ICoreFragment;
#endif 	/* __ICoreFragment_FWD_DEFINED__ */


#ifndef __ICoreFragmentInspector_FWD_DEFINED__
#define __ICoreFragmentInspector_FWD_DEFINED__
typedef interface ICoreFragmentInspector ICoreFragmentInspector;
#endif 	/* __ICoreFragmentInspector_FWD_DEFINED__ */


#ifndef __IRangeException_FWD_DEFINED__
#define __IRangeException_FWD_DEFINED__
typedef interface IRangeException IRangeException;
#endif 	/* __IRangeException_FWD_DEFINED__ */


#ifndef __IEnumRangeExceptions_FWD_DEFINED__
#define __IEnumRangeExceptions_FWD_DEFINED__
typedef interface IEnumRangeExceptions IEnumRangeExceptions;
#endif 	/* __IEnumRangeExceptions_FWD_DEFINED__ */


#ifndef __ISingleItemException_FWD_DEFINED__
#define __ISingleItemException_FWD_DEFINED__
typedef interface ISingleItemException ISingleItemException;
#endif 	/* __ISingleItemException_FWD_DEFINED__ */


#ifndef __IEnumSingleItemExceptions_FWD_DEFINED__
#define __IEnumSingleItemExceptions_FWD_DEFINED__
typedef interface IEnumSingleItemExceptions IEnumSingleItemExceptions;
#endif 	/* __IEnumSingleItemExceptions_FWD_DEFINED__ */


#ifndef __IChangeUnitException_FWD_DEFINED__
#define __IChangeUnitException_FWD_DEFINED__
typedef interface IChangeUnitException IChangeUnitException;
#endif 	/* __IChangeUnitException_FWD_DEFINED__ */


#ifndef __IEnumChangeUnitExceptions_FWD_DEFINED__
#define __IEnumChangeUnitExceptions_FWD_DEFINED__
typedef interface IEnumChangeUnitExceptions IEnumChangeUnitExceptions;
#endif 	/* __IEnumChangeUnitExceptions_FWD_DEFINED__ */


#ifndef __IReplicaKeyMap_FWD_DEFINED__
#define __IReplicaKeyMap_FWD_DEFINED__
typedef interface IReplicaKeyMap IReplicaKeyMap;
#endif 	/* __IReplicaKeyMap_FWD_DEFINED__ */


#ifndef __IConstructReplicaKeyMap_FWD_DEFINED__
#define __IConstructReplicaKeyMap_FWD_DEFINED__
typedef interface IConstructReplicaKeyMap IConstructReplicaKeyMap;
#endif 	/* __IConstructReplicaKeyMap_FWD_DEFINED__ */


#ifndef __ISyncKnowledge_FWD_DEFINED__
#define __ISyncKnowledge_FWD_DEFINED__
typedef interface ISyncKnowledge ISyncKnowledge;
#endif 	/* __ISyncKnowledge_FWD_DEFINED__ */


#ifndef __IForgottenKnowledge_FWD_DEFINED__
#define __IForgottenKnowledge_FWD_DEFINED__
typedef interface IForgottenKnowledge IForgottenKnowledge;
#endif 	/* __IForgottenKnowledge_FWD_DEFINED__ */


#ifndef __ISyncKnowledge2_FWD_DEFINED__
#define __ISyncKnowledge2_FWD_DEFINED__
typedef interface ISyncKnowledge2 ISyncKnowledge2;
#endif 	/* __ISyncKnowledge2_FWD_DEFINED__ */


#ifndef __IRecoverableErrorData_FWD_DEFINED__
#define __IRecoverableErrorData_FWD_DEFINED__
typedef interface IRecoverableErrorData IRecoverableErrorData;
#endif 	/* __IRecoverableErrorData_FWD_DEFINED__ */


#ifndef __IRecoverableError_FWD_DEFINED__
#define __IRecoverableError_FWD_DEFINED__
typedef interface IRecoverableError IRecoverableError;
#endif 	/* __IRecoverableError_FWD_DEFINED__ */


#ifndef __IChangeConflict_FWD_DEFINED__
#define __IChangeConflict_FWD_DEFINED__
typedef interface IChangeConflict IChangeConflict;
#endif 	/* __IChangeConflict_FWD_DEFINED__ */


#ifndef __ISyncCallback_FWD_DEFINED__
#define __ISyncCallback_FWD_DEFINED__
typedef interface ISyncCallback ISyncCallback;
#endif 	/* __ISyncCallback_FWD_DEFINED__ */


#ifndef __ISyncCallback2_FWD_DEFINED__
#define __ISyncCallback2_FWD_DEFINED__
typedef interface ISyncCallback2 ISyncCallback2;
#endif 	/* __ISyncCallback2_FWD_DEFINED__ */


#ifndef __ISyncProvider_FWD_DEFINED__
#define __ISyncProvider_FWD_DEFINED__
typedef interface ISyncProvider ISyncProvider;
#endif 	/* __ISyncProvider_FWD_DEFINED__ */


#ifndef __ISyncSessionState_FWD_DEFINED__
#define __ISyncSessionState_FWD_DEFINED__
typedef interface ISyncSessionState ISyncSessionState;
#endif 	/* __ISyncSessionState_FWD_DEFINED__ */


#ifndef __ISyncSessionExtendedErrorInfo_FWD_DEFINED__
#define __ISyncSessionExtendedErrorInfo_FWD_DEFINED__
typedef interface ISyncSessionExtendedErrorInfo ISyncSessionExtendedErrorInfo;
#endif 	/* __ISyncSessionExtendedErrorInfo_FWD_DEFINED__ */


#ifndef __ISyncSessionState2_FWD_DEFINED__
#define __ISyncSessionState2_FWD_DEFINED__
typedef interface ISyncSessionState2 ISyncSessionState2;
#endif 	/* __ISyncSessionState2_FWD_DEFINED__ */


#ifndef __ISyncFilterInfo_FWD_DEFINED__
#define __ISyncFilterInfo_FWD_DEFINED__
typedef interface ISyncFilterInfo ISyncFilterInfo;
#endif 	/* __ISyncFilterInfo_FWD_DEFINED__ */


#ifndef __ISyncFilterInfo2_FWD_DEFINED__
#define __ISyncFilterInfo2_FWD_DEFINED__
typedef interface ISyncFilterInfo2 ISyncFilterInfo2;
#endif 	/* __ISyncFilterInfo2_FWD_DEFINED__ */


#ifndef __IChangeUnitListFilterInfo_FWD_DEFINED__
#define __IChangeUnitListFilterInfo_FWD_DEFINED__
typedef interface IChangeUnitListFilterInfo IChangeUnitListFilterInfo;
#endif 	/* __IChangeUnitListFilterInfo_FWD_DEFINED__ */


#ifndef __IEnumSyncChanges_FWD_DEFINED__
#define __IEnumSyncChanges_FWD_DEFINED__
typedef interface IEnumSyncChanges IEnumSyncChanges;
#endif 	/* __IEnumSyncChanges_FWD_DEFINED__ */


#ifndef __ISyncChangeBuilder_FWD_DEFINED__
#define __ISyncChangeBuilder_FWD_DEFINED__
typedef interface ISyncChangeBuilder ISyncChangeBuilder;
#endif 	/* __ISyncChangeBuilder_FWD_DEFINED__ */


#ifndef __ISyncChangeBatchBase_FWD_DEFINED__
#define __ISyncChangeBatchBase_FWD_DEFINED__
typedef interface ISyncChangeBatchBase ISyncChangeBatchBase;
#endif 	/* __ISyncChangeBatchBase_FWD_DEFINED__ */


#ifndef __ISyncChangeBatch_FWD_DEFINED__
#define __ISyncChangeBatch_FWD_DEFINED__
typedef interface ISyncChangeBatch ISyncChangeBatch;
#endif 	/* __ISyncChangeBatch_FWD_DEFINED__ */


#ifndef __ISyncFullEnumerationChangeBatch_FWD_DEFINED__
#define __ISyncFullEnumerationChangeBatch_FWD_DEFINED__
typedef interface ISyncFullEnumerationChangeBatch ISyncFullEnumerationChangeBatch;
#endif 	/* __ISyncFullEnumerationChangeBatch_FWD_DEFINED__ */


#ifndef __ISyncChangeBatchWithPrerequisite_FWD_DEFINED__
#define __ISyncChangeBatchWithPrerequisite_FWD_DEFINED__
typedef interface ISyncChangeBatchWithPrerequisite ISyncChangeBatchWithPrerequisite;
#endif 	/* __ISyncChangeBatchWithPrerequisite_FWD_DEFINED__ */


#ifndef __ISyncChangeBatchBase2_FWD_DEFINED__
#define __ISyncChangeBatchBase2_FWD_DEFINED__
typedef interface ISyncChangeBatchBase2 ISyncChangeBatchBase2;
#endif 	/* __ISyncChangeBatchBase2_FWD_DEFINED__ */


#ifndef __ISyncChangeBatchAdvanced_FWD_DEFINED__
#define __ISyncChangeBatchAdvanced_FWD_DEFINED__
typedef interface ISyncChangeBatchAdvanced ISyncChangeBatchAdvanced;
#endif 	/* __ISyncChangeBatchAdvanced_FWD_DEFINED__ */


#ifndef __IKnowledgeSyncProvider_FWD_DEFINED__
#define __IKnowledgeSyncProvider_FWD_DEFINED__
typedef interface IKnowledgeSyncProvider IKnowledgeSyncProvider;
#endif 	/* __IKnowledgeSyncProvider_FWD_DEFINED__ */


#ifndef __ISyncChangeUnit_FWD_DEFINED__
#define __ISyncChangeUnit_FWD_DEFINED__
typedef interface ISyncChangeUnit ISyncChangeUnit;
#endif 	/* __ISyncChangeUnit_FWD_DEFINED__ */


#ifndef __IEnumSyncChangeUnits_FWD_DEFINED__
#define __IEnumSyncChangeUnits_FWD_DEFINED__
typedef interface IEnumSyncChangeUnits IEnumSyncChangeUnits;
#endif 	/* __IEnumSyncChangeUnits_FWD_DEFINED__ */


#ifndef __ISyncChange_FWD_DEFINED__
#define __ISyncChange_FWD_DEFINED__
typedef interface ISyncChange ISyncChange;
#endif 	/* __ISyncChange_FWD_DEFINED__ */


#ifndef __ISyncChangeWithPrerequisite_FWD_DEFINED__
#define __ISyncChangeWithPrerequisite_FWD_DEFINED__
typedef interface ISyncChangeWithPrerequisite ISyncChangeWithPrerequisite;
#endif 	/* __ISyncChangeWithPrerequisite_FWD_DEFINED__ */


#ifndef __ISyncFullEnumerationChange_FWD_DEFINED__
#define __ISyncFullEnumerationChange_FWD_DEFINED__
typedef interface ISyncFullEnumerationChange ISyncFullEnumerationChange;
#endif 	/* __ISyncFullEnumerationChange_FWD_DEFINED__ */


#ifndef __IDataRetrieverCallback_FWD_DEFINED__
#define __IDataRetrieverCallback_FWD_DEFINED__
typedef interface IDataRetrieverCallback IDataRetrieverCallback;
#endif 	/* __IDataRetrieverCallback_FWD_DEFINED__ */


#ifndef __ILoadChangeContext_FWD_DEFINED__
#define __ILoadChangeContext_FWD_DEFINED__
typedef interface ILoadChangeContext ILoadChangeContext;
#endif 	/* __ILoadChangeContext_FWD_DEFINED__ */


#ifndef __ISynchronousDataRetriever_FWD_DEFINED__
#define __ISynchronousDataRetriever_FWD_DEFINED__
typedef interface ISynchronousDataRetriever ISynchronousDataRetriever;
#endif 	/* __ISynchronousDataRetriever_FWD_DEFINED__ */


#ifndef __IAsynchronousDataRetriever_FWD_DEFINED__
#define __IAsynchronousDataRetriever_FWD_DEFINED__
typedef interface IAsynchronousDataRetriever IAsynchronousDataRetriever;
#endif 	/* __IAsynchronousDataRetriever_FWD_DEFINED__ */


#ifndef __IFilterRequestCallback_FWD_DEFINED__
#define __IFilterRequestCallback_FWD_DEFINED__
typedef interface IFilterRequestCallback IFilterRequestCallback;
#endif 	/* __IFilterRequestCallback_FWD_DEFINED__ */


#ifndef __IRequestFilteredSync_FWD_DEFINED__
#define __IRequestFilteredSync_FWD_DEFINED__
typedef interface IRequestFilteredSync IRequestFilteredSync;
#endif 	/* __IRequestFilteredSync_FWD_DEFINED__ */


#ifndef __ISupportFilteredSync_FWD_DEFINED__
#define __ISupportFilteredSync_FWD_DEFINED__
typedef interface ISupportFilteredSync ISupportFilteredSync;
#endif 	/* __ISupportFilteredSync_FWD_DEFINED__ */


#ifndef __ISupportLastWriteTime_FWD_DEFINED__
#define __ISupportLastWriteTime_FWD_DEFINED__
typedef interface ISupportLastWriteTime ISupportLastWriteTime;
#endif 	/* __ISupportLastWriteTime_FWD_DEFINED__ */


#ifndef __IProviderConverter_FWD_DEFINED__
#define __IProviderConverter_FWD_DEFINED__
typedef interface IProviderConverter IProviderConverter;
#endif 	/* __IProviderConverter_FWD_DEFINED__ */


/* header files for imported files */
#include "oleidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_winsync_0000_0000 */
/* [local] */ 

#pragma warning ( disable : 28718 )
typedef struct _ID_PARAMETER_PAIR
    {
    BOOL fIsVariable;
    USHORT cbIdSize;
    } 	ID_PARAMETER_PAIR;

typedef struct _ID_PARAMETERS
    {
    DWORD dwSize;
    ID_PARAMETER_PAIR replicaId;
    ID_PARAMETER_PAIR itemId;
    ID_PARAMETER_PAIR changeUnitId;
    } 	ID_PARAMETERS;

typedef struct _SYNC_SESSION_STATISTICS
    {
    DWORD dwChangesApplied;
    DWORD dwChangesFailed;
    } 	SYNC_SESSION_STATISTICS;

typedef struct _SYNC_VERSION
    {
    DWORD dwLastUpdatingReplicaKey;
    ULONGLONG ullTickCount;
    } 	SYNC_VERSION;

typedef struct _SYNC_RANGE
    {
    BYTE *pbClosedLowerBound;
    BYTE *pbClosedUpperBound;
    } 	SYNC_RANGE;

typedef struct _SYNC_TIME
    {
    DWORD dwDate;
    DWORD dwTime;
    } 	SYNC_TIME;

typedef /* [public][public][public][public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0001
    {	SPR_SOURCE	= 0,
	SPR_DESTINATION	= ( SPR_SOURCE + 1 ) 
    } 	SYNC_PROVIDER_ROLE;

typedef /* [public][public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0002
    {	CRP_NONE	= 0,
	CRP_DESTINATION_PROVIDER_WINS	= ( CRP_NONE + 1 ) ,
	CRP_SOURCE_PROVIDER_WINS	= ( CRP_DESTINATION_PROVIDER_WINS + 1 ) ,
	CRP_LAST	= ( CRP_SOURCE_PROVIDER_WINS + 1 ) 
    } 	CONFLICT_RESOLUTION_POLICY;

typedef /* [public][public][public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0003
    {	SPS_CHANGE_DETECTION	= 0,
	SPS_CHANGE_ENUMERATION	= ( SPS_CHANGE_DETECTION + 1 ) ,
	SPS_CHANGE_APPLICATION	= ( SPS_CHANGE_ENUMERATION + 1 ) 
    } 	SYNC_PROGRESS_STAGE;

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0004
    {	SFEA_FULL_ENUMERATION	= 0,
	SFEA_PARTIAL_SYNC	= ( SFEA_FULL_ENUMERATION + 1 ) ,
	SFEA_ABORT	= ( SFEA_PARTIAL_SYNC + 1 ) 
    } 	SYNC_FULL_ENUMERATION_ACTION;

typedef /* [public][public][public][public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0005
    {	SRA_DEFER	= 0,
	SRA_ACCEPT_DESTINATION_PROVIDER	= ( SRA_DEFER + 1 ) ,
	SRA_ACCEPT_SOURCE_PROVIDER	= ( SRA_ACCEPT_DESTINATION_PROVIDER + 1 ) ,
	SRA_MERGE	= ( SRA_ACCEPT_SOURCE_PROVIDER + 1 ) ,
	SRA_TRANSFER_AND_DEFER	= ( SRA_MERGE + 1 ) ,
	SRA_LAST	= ( SRA_TRANSFER_AND_DEFER + 1 ) 
    } 	SYNC_RESOLVE_ACTION;

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0006
    {	SYNC_STATISTICS_RANGE_COUNT	= 0
    } 	SYNC_STATISTICS;

typedef /* [public][public][public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0007
    {	SYNC_SERIALIZATION_VERSION_V1	= 1,
	SYNC_SERIALIZATION_VERSION_V2	= 4
    } 	SYNC_SERIALIZATION_VERSION;

typedef /* [public][public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0008
    {	FT_CURRENT_ITEMS_ONLY	= 0
    } 	FILTERING_TYPE;

typedef /* [public][public] */ 
enum __MIDL___MIDL_itf_winsync_0000_0000_0009
    {	KCCR_COOKIE_KNOWLEDGE_EQUAL	= 0,
	KCCR_COOKIE_KNOWLEDGE_CONTAINED	= ( KCCR_COOKIE_KNOWLEDGE_EQUAL + 1 ) ,
	KCCR_COOKIE_KNOWLEDGE_CONTAINS	= ( KCCR_COOKIE_KNOWLEDGE_CONTAINED + 1 ) ,
	KCCR_COOKIE_KNOWLEDGE_NOT_COMPARABLE	= ( KCCR_COOKIE_KNOWLEDGE_CONTAINS + 1 ) 
    } 	KNOWLEDGE_COOKIE_COMPARISON_RESULT;



extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0000_v0_0_s_ifspec;

#ifndef __IClockVectorElement_INTERFACE_DEFINED__
#define __IClockVectorElement_INTERFACE_DEFINED__

/* interface IClockVectorElement */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IClockVectorElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("e71c4250-adf8-4a07-8fae-5669596909c1")
    IClockVectorElement : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetReplicaKey( 
            /* [out] */ DWORD *pdwReplicaKey) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetTickCount( 
            /* [out] */ ULONGLONG *pullTickCount) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IClockVectorElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IClockVectorElement * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IClockVectorElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IClockVectorElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetReplicaKey )( 
            IClockVectorElement * This,
            /* [out] */ DWORD *pdwReplicaKey);
        
        HRESULT ( STDMETHODCALLTYPE *GetTickCount )( 
            IClockVectorElement * This,
            /* [out] */ ULONGLONG *pullTickCount);
        
        END_INTERFACE
    } IClockVectorElementVtbl;

    interface IClockVectorElement
    {
        CONST_VTBL struct IClockVectorElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IClockVectorElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IClockVectorElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IClockVectorElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IClockVectorElement_GetReplicaKey(This,pdwReplicaKey)	\
    ( (This)->lpVtbl -> GetReplicaKey(This,pdwReplicaKey) ) 

#define IClockVectorElement_GetTickCount(This,pullTickCount)	\
    ( (This)->lpVtbl -> GetTickCount(This,pullTickCount) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IClockVectorElement_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_winsync_0000_0001 */
/* [local] */ 

#define SYNC_VERSION_FLAG_FROM_FEED              0x00000001
#define SYNC_VERSION_FLAG_HAS_BY                 0x00000002


extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0001_v0_0_s_ifspec;

#ifndef __IFeedClockVectorElement_INTERFACE_DEFINED__
#define __IFeedClockVectorElement_INTERFACE_DEFINED__

/* interface IFeedClockVectorElement */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IFeedClockVectorElement;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("a40b46d2-e97b-4156-b6da-991f501b0f05")
    IFeedClockVectorElement : public IClockVectorElement
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetSyncTime( 
            /* [out] */ SYNC_TIME *pSyncTime) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetFlags( 
            /* [out] */ BYTE *pbFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFeedClockVectorElementVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IFeedClockVectorElement * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IFeedClockVectorElement * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IFeedClockVectorElement * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetReplicaKey )( 
            IFeedClockVectorElement * This,
            /* [out] */ DWORD *pdwReplicaKey);
        
        HRESULT ( STDMETHODCALLTYPE *GetTickCount )( 
            IFeedClockVectorElement * This,
            /* [out] */ ULONGLONG *pullTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetSyncTime )( 
            IFeedClockVectorElement * This,
            /* [out] */ SYNC_TIME *pSyncTime);
        
        HRESULT ( STDMETHODCALLTYPE *GetFlags )( 
            IFeedClockVectorElement * This,
            /* [out] */ BYTE *pbFlags);
        
        END_INTERFACE
    } IFeedClockVectorElementVtbl;

    interface IFeedClockVectorElement
    {
        CONST_VTBL struct IFeedClockVectorElementVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFeedClockVectorElement_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IFeedClockVectorElement_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IFeedClockVectorElement_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IFeedClockVectorElement_GetReplicaKey(This,pdwReplicaKey)	\
    ( (This)->lpVtbl -> GetReplicaKey(This,pdwReplicaKey) ) 

#define IFeedClockVectorElement_GetTickCount(This,pullTickCount)	\
    ( (This)->lpVtbl -> GetTickCount(This,pullTickCount) ) 


#define IFeedClockVectorElement_GetSyncTime(This,pSyncTime)	\
    ( (This)->lpVtbl -> GetSyncTime(This,pSyncTime) ) 

#define IFeedClockVectorElement_GetFlags(This,pbFlags)	\
    ( (This)->lpVtbl -> GetFlags(This,pbFlags) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IFeedClockVectorElement_INTERFACE_DEFINED__ */


#ifndef __IClockVector_INTERFACE_DEFINED__
#define __IClockVector_INTERFACE_DEFINED__

/* interface IClockVector */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IClockVector;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("14b2274a-8698-4cc6-9333-f89bd1d47bc4")
    IClockVector : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetClockVectorElements( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppiEnumClockVector) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClockVectorElementCount( 
            /* [out] */ DWORD *pdwCount) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IClockVectorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IClockVector * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IClockVector * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IClockVector * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVectorElements )( 
            IClockVector * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppiEnumClockVector);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVectorElementCount )( 
            IClockVector * This,
            /* [out] */ DWORD *pdwCount);
        
        END_INTERFACE
    } IClockVectorVtbl;

    interface IClockVector
    {
        CONST_VTBL struct IClockVectorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IClockVector_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IClockVector_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IClockVector_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IClockVector_GetClockVectorElements(This,riid,ppiEnumClockVector)	\
    ( (This)->lpVtbl -> GetClockVectorElements(This,riid,ppiEnumClockVector) ) 

#define IClockVector_GetClockVectorElementCount(This,pdwCount)	\
    ( (This)->lpVtbl -> GetClockVectorElementCount(This,pdwCount) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IClockVector_INTERFACE_DEFINED__ */


#ifndef __IFeedClockVector_INTERFACE_DEFINED__
#define __IFeedClockVector_INTERFACE_DEFINED__

/* interface IFeedClockVector */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IFeedClockVector;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8d1d98d1-9fb8-4ec9-a553-54dd924e0f67")
    IFeedClockVector : public IClockVector
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetUpdateCount( 
            /* [out] */ DWORD *pdwUpdateCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IsNoConflictsSpecified( 
            /* [out] */ BOOL *pfIsNoConflictsSpecified) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFeedClockVectorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IFeedClockVector * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IFeedClockVector * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IFeedClockVector * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVectorElements )( 
            IFeedClockVector * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppiEnumClockVector);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVectorElementCount )( 
            IFeedClockVector * This,
            /* [out] */ DWORD *pdwCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetUpdateCount )( 
            IFeedClockVector * This,
            /* [out] */ DWORD *pdwUpdateCount);
        
        HRESULT ( STDMETHODCALLTYPE *IsNoConflictsSpecified )( 
            IFeedClockVector * This,
            /* [out] */ BOOL *pfIsNoConflictsSpecified);
        
        END_INTERFACE
    } IFeedClockVectorVtbl;

    interface IFeedClockVector
    {
        CONST_VTBL struct IFeedClockVectorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFeedClockVector_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IFeedClockVector_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IFeedClockVector_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IFeedClockVector_GetClockVectorElements(This,riid,ppiEnumClockVector)	\
    ( (This)->lpVtbl -> GetClockVectorElements(This,riid,ppiEnumClockVector) ) 

#define IFeedClockVector_GetClockVectorElementCount(This,pdwCount)	\
    ( (This)->lpVtbl -> GetClockVectorElementCount(This,pdwCount) ) 


#define IFeedClockVector_GetUpdateCount(This,pdwUpdateCount)	\
    ( (This)->lpVtbl -> GetUpdateCount(This,pdwUpdateCount) ) 

#define IFeedClockVector_IsNoConflictsSpecified(This,pfIsNoConflictsSpecified)	\
    ( (This)->lpVtbl -> IsNoConflictsSpecified(This,pfIsNoConflictsSpecified) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IFeedClockVector_INTERFACE_DEFINED__ */


#ifndef __IEnumClockVector_INTERFACE_DEFINED__
#define __IEnumClockVector_INTERFACE_DEFINED__

/* interface IEnumClockVector */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumClockVector;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("525844db-2837-4799-9e80-81a66e02220c")
    IEnumClockVector : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [range][in] */ ULONG cClockVectorElements,
            /* [length_is][size_is][out] */ IClockVectorElement **ppiClockVectorElements,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cSyncVersions) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumClockVector **ppiEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumClockVectorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumClockVector * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumClockVector * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumClockVector * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumClockVector * This,
            /* [range][in] */ ULONG cClockVectorElements,
            /* [length_is][size_is][out] */ IClockVectorElement **ppiClockVectorElements,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumClockVector * This,
            /* [in] */ ULONG cSyncVersions);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumClockVector * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumClockVector * This,
            /* [out] */ IEnumClockVector **ppiEnum);
        
        END_INTERFACE
    } IEnumClockVectorVtbl;

    interface IEnumClockVector
    {
        CONST_VTBL struct IEnumClockVectorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumClockVector_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumClockVector_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumClockVector_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumClockVector_Next(This,cClockVectorElements,ppiClockVectorElements,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cClockVectorElements,ppiClockVectorElements,pcFetched) ) 

#define IEnumClockVector_Skip(This,cSyncVersions)	\
    ( (This)->lpVtbl -> Skip(This,cSyncVersions) ) 

#define IEnumClockVector_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumClockVector_Clone(This,ppiEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppiEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumClockVector_INTERFACE_DEFINED__ */


#ifndef __IEnumFeedClockVector_INTERFACE_DEFINED__
#define __IEnumFeedClockVector_INTERFACE_DEFINED__

/* interface IEnumFeedClockVector */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumFeedClockVector;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("550f763d-146a-48f6-abeb-6c88c7f70514")
    IEnumFeedClockVector : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [in] */ ULONG cClockVectorElements,
            /* [length_is][size_is][out] */ IFeedClockVectorElement **ppiClockVectorElements,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cSyncVersions) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumFeedClockVector **ppiEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumFeedClockVectorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumFeedClockVector * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumFeedClockVector * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumFeedClockVector * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumFeedClockVector * This,
            /* [in] */ ULONG cClockVectorElements,
            /* [length_is][size_is][out] */ IFeedClockVectorElement **ppiClockVectorElements,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumFeedClockVector * This,
            /* [in] */ ULONG cSyncVersions);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumFeedClockVector * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumFeedClockVector * This,
            /* [out] */ IEnumFeedClockVector **ppiEnum);
        
        END_INTERFACE
    } IEnumFeedClockVectorVtbl;

    interface IEnumFeedClockVector
    {
        CONST_VTBL struct IEnumFeedClockVectorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumFeedClockVector_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumFeedClockVector_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumFeedClockVector_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumFeedClockVector_Next(This,cClockVectorElements,ppiClockVectorElements,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cClockVectorElements,ppiClockVectorElements,pcFetched) ) 

#define IEnumFeedClockVector_Skip(This,cSyncVersions)	\
    ( (This)->lpVtbl -> Skip(This,cSyncVersions) ) 

#define IEnumFeedClockVector_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumFeedClockVector_Clone(This,ppiEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppiEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumFeedClockVector_INTERFACE_DEFINED__ */


#ifndef __ICoreFragment_INTERFACE_DEFINED__
#define __ICoreFragment_INTERFACE_DEFINED__

/* interface ICoreFragment */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ICoreFragment;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("613b2ab5-b304-47d9-9c31-ce6c54401a15")
    ICoreFragment : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE NextColumn( 
            /* [size_is][unique][out][in] */ BYTE *pChangeUnitId,
            /* [out][in] */ DWORD *pChangeUnitIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE NextRange( 
            /* [size_is][unique][out][in] */ BYTE *pItemId,
            /* [out][in] */ DWORD *pItemIdSize,
            /* [out] */ IClockVector **piClockVector) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetColumnCount( 
            /* [out] */ DWORD *pColumnCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRangeCount( 
            /* [out] */ DWORD *pRangeCount) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICoreFragmentVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICoreFragment * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICoreFragment * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICoreFragment * This);
        
        HRESULT ( STDMETHODCALLTYPE *NextColumn )( 
            ICoreFragment * This,
            /* [size_is][unique][out][in] */ BYTE *pChangeUnitId,
            /* [out][in] */ DWORD *pChangeUnitIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *NextRange )( 
            ICoreFragment * This,
            /* [size_is][unique][out][in] */ BYTE *pItemId,
            /* [out][in] */ DWORD *pItemIdSize,
            /* [out] */ IClockVector **piClockVector);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ICoreFragment * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetColumnCount )( 
            ICoreFragment * This,
            /* [out] */ DWORD *pColumnCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetRangeCount )( 
            ICoreFragment * This,
            /* [out] */ DWORD *pRangeCount);
        
        END_INTERFACE
    } ICoreFragmentVtbl;

    interface ICoreFragment
    {
        CONST_VTBL struct ICoreFragmentVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICoreFragment_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICoreFragment_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICoreFragment_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICoreFragment_NextColumn(This,pChangeUnitId,pChangeUnitIdSize)	\
    ( (This)->lpVtbl -> NextColumn(This,pChangeUnitId,pChangeUnitIdSize) ) 

#define ICoreFragment_NextRange(This,pItemId,pItemIdSize,piClockVector)	\
    ( (This)->lpVtbl -> NextRange(This,pItemId,pItemIdSize,piClockVector) ) 

#define ICoreFragment_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define ICoreFragment_GetColumnCount(This,pColumnCount)	\
    ( (This)->lpVtbl -> GetColumnCount(This,pColumnCount) ) 

#define ICoreFragment_GetRangeCount(This,pRangeCount)	\
    ( (This)->lpVtbl -> GetRangeCount(This,pRangeCount) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICoreFragment_INTERFACE_DEFINED__ */


#ifndef __ICoreFragmentInspector_INTERFACE_DEFINED__
#define __ICoreFragmentInspector_INTERFACE_DEFINED__

/* interface ICoreFragmentInspector */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ICoreFragmentInspector;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("f7fcc5fd-ae26-4679-ba16-96aac583c134")
    ICoreFragmentInspector : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE NextCoreFragments( 
            /* [in] */ ULONG requestedCount,
            /* [length_is][size_is][out] */ ICoreFragment **ppiCoreFragments,
            /* [out][in] */ ULONG *pFetchedCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICoreFragmentInspectorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICoreFragmentInspector * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICoreFragmentInspector * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICoreFragmentInspector * This);
        
        HRESULT ( STDMETHODCALLTYPE *NextCoreFragments )( 
            ICoreFragmentInspector * This,
            /* [in] */ ULONG requestedCount,
            /* [length_is][size_is][out] */ ICoreFragment **ppiCoreFragments,
            /* [out][in] */ ULONG *pFetchedCount);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            ICoreFragmentInspector * This);
        
        END_INTERFACE
    } ICoreFragmentInspectorVtbl;

    interface ICoreFragmentInspector
    {
        CONST_VTBL struct ICoreFragmentInspectorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICoreFragmentInspector_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ICoreFragmentInspector_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ICoreFragmentInspector_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ICoreFragmentInspector_NextCoreFragments(This,requestedCount,ppiCoreFragments,pFetchedCount)	\
    ( (This)->lpVtbl -> NextCoreFragments(This,requestedCount,ppiCoreFragments,pFetchedCount) ) 

#define ICoreFragmentInspector_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ICoreFragmentInspector_INTERFACE_DEFINED__ */


#ifndef __IRangeException_INTERFACE_DEFINED__
#define __IRangeException_INTERFACE_DEFINED__

/* interface IRangeException */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IRangeException;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("75ae8777-6848-49f7-956c-a3a92f5096e8")
    IRangeException : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetClosedRangeStart( 
            /* [size_is][unique][out][in] */ BYTE *pbClosedRangeStart,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClosedRangeEnd( 
            /* [size_is][unique][out][in] */ BYTE *pbClosedRangeEnd,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClockVector( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IRangeExceptionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IRangeException * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IRangeException * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IRangeException * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetClosedRangeStart )( 
            IRangeException * This,
            /* [size_is][unique][out][in] */ BYTE *pbClosedRangeStart,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetClosedRangeEnd )( 
            IRangeException * This,
            /* [size_is][unique][out][in] */ BYTE *pbClosedRangeEnd,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVector )( 
            IRangeException * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        END_INTERFACE
    } IRangeExceptionVtbl;

    interface IRangeException
    {
        CONST_VTBL struct IRangeExceptionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRangeException_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRangeException_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRangeException_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRangeException_GetClosedRangeStart(This,pbClosedRangeStart,pcbIdSize)	\
    ( (This)->lpVtbl -> GetClosedRangeStart(This,pbClosedRangeStart,pcbIdSize) ) 

#define IRangeException_GetClosedRangeEnd(This,pbClosedRangeEnd,pcbIdSize)	\
    ( (This)->lpVtbl -> GetClosedRangeEnd(This,pbClosedRangeEnd,pcbIdSize) ) 

#define IRangeException_GetClockVector(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetClockVector(This,riid,ppUnk) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRangeException_INTERFACE_DEFINED__ */


#ifndef __IEnumRangeExceptions_INTERFACE_DEFINED__
#define __IEnumRangeExceptions_INTERFACE_DEFINED__

/* interface IEnumRangeExceptions */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumRangeExceptions;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0944439f-ddb1-4176-b703-046ff22a2386")
    IEnumRangeExceptions : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [range][in] */ ULONG cExceptions,
            /* [length_is][size_is][out] */ IRangeException **ppRangeException,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cExceptions) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumRangeExceptions **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumRangeExceptionsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumRangeExceptions * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumRangeExceptions * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumRangeExceptions * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumRangeExceptions * This,
            /* [range][in] */ ULONG cExceptions,
            /* [length_is][size_is][out] */ IRangeException **ppRangeException,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumRangeExceptions * This,
            /* [in] */ ULONG cExceptions);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumRangeExceptions * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumRangeExceptions * This,
            /* [out] */ IEnumRangeExceptions **ppEnum);
        
        END_INTERFACE
    } IEnumRangeExceptionsVtbl;

    interface IEnumRangeExceptions
    {
        CONST_VTBL struct IEnumRangeExceptionsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumRangeExceptions_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumRangeExceptions_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumRangeExceptions_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumRangeExceptions_Next(This,cExceptions,ppRangeException,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cExceptions,ppRangeException,pcFetched) ) 

#define IEnumRangeExceptions_Skip(This,cExceptions)	\
    ( (This)->lpVtbl -> Skip(This,cExceptions) ) 

#define IEnumRangeExceptions_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumRangeExceptions_Clone(This,ppEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumRangeExceptions_INTERFACE_DEFINED__ */


#ifndef __ISingleItemException_INTERFACE_DEFINED__
#define __ISingleItemException_INTERFACE_DEFINED__

/* interface ISingleItemException */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISingleItemException;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("892fb9b0-7c55-4a18-9316-fdF449569b64")
    ISingleItemException : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetItemId( 
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClockVector( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISingleItemExceptionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISingleItemException * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISingleItemException * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISingleItemException * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetItemId )( 
            ISingleItemException * This,
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVector )( 
            ISingleItemException * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        END_INTERFACE
    } ISingleItemExceptionVtbl;

    interface ISingleItemException
    {
        CONST_VTBL struct ISingleItemExceptionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISingleItemException_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISingleItemException_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISingleItemException_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISingleItemException_GetItemId(This,pbItemId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetItemId(This,pbItemId,pcbIdSize) ) 

#define ISingleItemException_GetClockVector(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetClockVector(This,riid,ppUnk) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISingleItemException_INTERFACE_DEFINED__ */


#ifndef __IEnumSingleItemExceptions_INTERFACE_DEFINED__
#define __IEnumSingleItemExceptions_INTERFACE_DEFINED__

/* interface IEnumSingleItemExceptions */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumSingleItemExceptions;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("e563381c-1b4d-4c66-9796-c86faccdcd40")
    IEnumSingleItemExceptions : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [range][in] */ ULONG cExceptions,
            /* [length_is][size_is][out] */ ISingleItemException **ppSingleItemException,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cExceptions) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumSingleItemExceptions **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumSingleItemExceptionsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumSingleItemExceptions * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumSingleItemExceptions * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumSingleItemExceptions * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumSingleItemExceptions * This,
            /* [range][in] */ ULONG cExceptions,
            /* [length_is][size_is][out] */ ISingleItemException **ppSingleItemException,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumSingleItemExceptions * This,
            /* [in] */ ULONG cExceptions);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumSingleItemExceptions * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumSingleItemExceptions * This,
            /* [out] */ IEnumSingleItemExceptions **ppEnum);
        
        END_INTERFACE
    } IEnumSingleItemExceptionsVtbl;

    interface IEnumSingleItemExceptions
    {
        CONST_VTBL struct IEnumSingleItemExceptionsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumSingleItemExceptions_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumSingleItemExceptions_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumSingleItemExceptions_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumSingleItemExceptions_Next(This,cExceptions,ppSingleItemException,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cExceptions,ppSingleItemException,pcFetched) ) 

#define IEnumSingleItemExceptions_Skip(This,cExceptions)	\
    ( (This)->lpVtbl -> Skip(This,cExceptions) ) 

#define IEnumSingleItemExceptions_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumSingleItemExceptions_Clone(This,ppEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumSingleItemExceptions_INTERFACE_DEFINED__ */


#ifndef __IChangeUnitException_INTERFACE_DEFINED__
#define __IChangeUnitException_INTERFACE_DEFINED__

/* interface IChangeUnitException */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IChangeUnitException;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0cd7ee7c-fec0-4021-99ee-f0e5348f2a5f")
    IChangeUnitException : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetItemId( 
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitId( 
            /* [size_is][unique][out][in] */ BYTE *pbChangeUnitId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClockVector( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IChangeUnitExceptionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IChangeUnitException * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IChangeUnitException * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IChangeUnitException * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetItemId )( 
            IChangeUnitException * This,
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitId )( 
            IChangeUnitException * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeUnitId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetClockVector )( 
            IChangeUnitException * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        END_INTERFACE
    } IChangeUnitExceptionVtbl;

    interface IChangeUnitException
    {
        CONST_VTBL struct IChangeUnitExceptionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IChangeUnitException_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IChangeUnitException_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IChangeUnitException_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IChangeUnitException_GetItemId(This,pbItemId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetItemId(This,pbItemId,pcbIdSize) ) 

#define IChangeUnitException_GetChangeUnitId(This,pbChangeUnitId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetChangeUnitId(This,pbChangeUnitId,pcbIdSize) ) 

#define IChangeUnitException_GetClockVector(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetClockVector(This,riid,ppUnk) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IChangeUnitException_INTERFACE_DEFINED__ */


#ifndef __IEnumChangeUnitExceptions_INTERFACE_DEFINED__
#define __IEnumChangeUnitExceptions_INTERFACE_DEFINED__

/* interface IEnumChangeUnitExceptions */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumChangeUnitExceptions;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3074e802-9319-4420-be21-1022e2e21da8")
    IEnumChangeUnitExceptions : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [range][in] */ ULONG cExceptions,
            /* [length_is][size_is][out] */ IChangeUnitException **ppChangeUnitException,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cExceptions) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumChangeUnitExceptions **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumChangeUnitExceptionsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumChangeUnitExceptions * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumChangeUnitExceptions * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumChangeUnitExceptions * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumChangeUnitExceptions * This,
            /* [range][in] */ ULONG cExceptions,
            /* [length_is][size_is][out] */ IChangeUnitException **ppChangeUnitException,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumChangeUnitExceptions * This,
            /* [in] */ ULONG cExceptions);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumChangeUnitExceptions * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumChangeUnitExceptions * This,
            /* [out] */ IEnumChangeUnitExceptions **ppEnum);
        
        END_INTERFACE
    } IEnumChangeUnitExceptionsVtbl;

    interface IEnumChangeUnitExceptions
    {
        CONST_VTBL struct IEnumChangeUnitExceptionsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumChangeUnitExceptions_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumChangeUnitExceptions_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumChangeUnitExceptions_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumChangeUnitExceptions_Next(This,cExceptions,ppChangeUnitException,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cExceptions,ppChangeUnitException,pcFetched) ) 

#define IEnumChangeUnitExceptions_Skip(This,cExceptions)	\
    ( (This)->lpVtbl -> Skip(This,cExceptions) ) 

#define IEnumChangeUnitExceptions_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumChangeUnitExceptions_Clone(This,ppEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumChangeUnitExceptions_INTERFACE_DEFINED__ */


#ifndef __IReplicaKeyMap_INTERFACE_DEFINED__
#define __IReplicaKeyMap_INTERFACE_DEFINED__

/* interface IReplicaKeyMap */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IReplicaKeyMap;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2209F4FC-FD10-4ff0-84A8-F0A1982E440E")
    IReplicaKeyMap : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE LookupReplicaKey( 
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ DWORD *pdwReplicaKey) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE LookupReplicaId( 
            /* [in] */ DWORD dwReplicaKey,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Serialize( 
            /* [size_is][unique][out][in] */ BYTE *pbReplicaKeyMap,
            /* [out][in] */ DWORD *pcbReplicaKeyMap) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IReplicaKeyMapVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IReplicaKeyMap * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IReplicaKeyMap * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IReplicaKeyMap * This);
        
        HRESULT ( STDMETHODCALLTYPE *LookupReplicaKey )( 
            IReplicaKeyMap * This,
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ DWORD *pdwReplicaKey);
        
        HRESULT ( STDMETHODCALLTYPE *LookupReplicaId )( 
            IReplicaKeyMap * This,
            /* [in] */ DWORD dwReplicaKey,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            IReplicaKeyMap * This,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaKeyMap,
            /* [out][in] */ DWORD *pcbReplicaKeyMap);
        
        END_INTERFACE
    } IReplicaKeyMapVtbl;

    interface IReplicaKeyMap
    {
        CONST_VTBL struct IReplicaKeyMapVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IReplicaKeyMap_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IReplicaKeyMap_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IReplicaKeyMap_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IReplicaKeyMap_LookupReplicaKey(This,pbReplicaId,pdwReplicaKey)	\
    ( (This)->lpVtbl -> LookupReplicaKey(This,pbReplicaId,pdwReplicaKey) ) 

#define IReplicaKeyMap_LookupReplicaId(This,dwReplicaKey,pbReplicaId,pcbIdSize)	\
    ( (This)->lpVtbl -> LookupReplicaId(This,dwReplicaKey,pbReplicaId,pcbIdSize) ) 

#define IReplicaKeyMap_Serialize(This,pbReplicaKeyMap,pcbReplicaKeyMap)	\
    ( (This)->lpVtbl -> Serialize(This,pbReplicaKeyMap,pcbReplicaKeyMap) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IReplicaKeyMap_INTERFACE_DEFINED__ */


#ifndef __IConstructReplicaKeyMap_INTERFACE_DEFINED__
#define __IConstructReplicaKeyMap_INTERFACE_DEFINED__

/* interface IConstructReplicaKeyMap */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IConstructReplicaKeyMap;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ded10970-ec85-4115-b52c-4405845642a5")
    IConstructReplicaKeyMap : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE FindOrAddReplica( 
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ DWORD *pdwReplicaKey) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IConstructReplicaKeyMapVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IConstructReplicaKeyMap * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IConstructReplicaKeyMap * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IConstructReplicaKeyMap * This);
        
        HRESULT ( STDMETHODCALLTYPE *FindOrAddReplica )( 
            IConstructReplicaKeyMap * This,
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ DWORD *pdwReplicaKey);
        
        END_INTERFACE
    } IConstructReplicaKeyMapVtbl;

    interface IConstructReplicaKeyMap
    {
        CONST_VTBL struct IConstructReplicaKeyMapVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IConstructReplicaKeyMap_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IConstructReplicaKeyMap_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IConstructReplicaKeyMap_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IConstructReplicaKeyMap_FindOrAddReplica(This,pbReplicaId,pdwReplicaKey)	\
    ( (This)->lpVtbl -> FindOrAddReplica(This,pbReplicaId,pdwReplicaKey) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IConstructReplicaKeyMap_INTERFACE_DEFINED__ */


#ifndef __ISyncKnowledge_INTERFACE_DEFINED__
#define __ISyncKnowledge_INTERFACE_DEFINED__

/* interface ISyncKnowledge */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncKnowledge;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("615bbb53-c945-4203-bf4b-2cb65919a0aa")
    ISyncKnowledge : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetOwnerReplicaId( 
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Serialize( 
            /* [in] */ BOOL fSerializeReplicaKeyMap,
            /* [size_is][unique][out][in] */ BYTE *pbKnowledge,
            /* [out][in] */ DWORD *pcbKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetLocalTickCount( 
            /* [in] */ ULONGLONG ullTickCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ContainsChange( 
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pgidItemId,
            /* [in] */ const SYNC_VERSION *pSyncVersion) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ContainsChangeUnit( 
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ const SYNC_VERSION *pSyncVersion) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetScopeVector( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetReplicaKeyMap( 
            /* [out] */ IReplicaKeyMap **ppReplicaKeyMap) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ ISyncKnowledge **ppClonedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ConvertVersion( 
            /* [in] */ ISyncKnowledge *pKnowledgeIn,
            /* [in] */ const BYTE *pbCurrentOwnerId,
            /* [in] */ const SYNC_VERSION *pVersionIn,
            /* [unique][in] */ BYTE *pbNewOwnerId,
            /* [out][in] */ DWORD *pcbIdSize,
            /* [out] */ SYNC_VERSION *pVersionOut) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE MapRemoteToLocal( 
            /* [in] */ ISyncKnowledge *pRemoteKnowledge,
            /* [out] */ ISyncKnowledge **ppMappedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Union( 
            /* [in] */ ISyncKnowledge *pKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProjectOntoItem( 
            /* [in] */ const BYTE *pbItemId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProjectOntoChangeUnit( 
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProjectOntoRange( 
            /* [in] */ const SYNC_RANGE *psrngSyncRange,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ExcludeItem( 
            /* [in] */ const BYTE *pbItemId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ExcludeChangeUnit( 
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ContainsKnowledge( 
            /* [in] */ ISyncKnowledge *pKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FindMinTickCountForReplica( 
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ ULONGLONG *pullReplicaTickCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRangeExceptions( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSingleItemExceptions( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitExceptions( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FindClockVectorForItem( 
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FindClockVectorForChangeUnit( 
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetVersion( 
            /* [out] */ DWORD *pdwVersion) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncKnowledgeVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncKnowledge * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncKnowledge * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncKnowledge * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetOwnerReplicaId )( 
            ISyncKnowledge * This,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncKnowledge * This,
            /* [in] */ BOOL fSerializeReplicaKeyMap,
            /* [size_is][unique][out][in] */ BYTE *pbKnowledge,
            /* [out][in] */ DWORD *pcbKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLocalTickCount )( 
            ISyncKnowledge * This,
            /* [in] */ ULONGLONG ullTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsChange )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pgidItemId,
            /* [in] */ const SYNC_VERSION *pSyncVersion);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsChangeUnit )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ const SYNC_VERSION *pSyncVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetScopeVector )( 
            ISyncKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetReplicaKeyMap )( 
            ISyncKnowledge * This,
            /* [out] */ IReplicaKeyMap **ppReplicaKeyMap);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISyncKnowledge * This,
            /* [out] */ ISyncKnowledge **ppClonedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *ConvertVersion )( 
            ISyncKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledgeIn,
            /* [in] */ const BYTE *pbCurrentOwnerId,
            /* [in] */ const SYNC_VERSION *pVersionIn,
            /* [unique][in] */ BYTE *pbNewOwnerId,
            /* [out][in] */ DWORD *pcbIdSize,
            /* [out] */ SYNC_VERSION *pVersionOut);
        
        HRESULT ( STDMETHODCALLTYPE *MapRemoteToLocal )( 
            ISyncKnowledge * This,
            /* [in] */ ISyncKnowledge *pRemoteKnowledge,
            /* [out] */ ISyncKnowledge **ppMappedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *Union )( 
            ISyncKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoItem )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoChangeUnit )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoRange )( 
            ISyncKnowledge * This,
            /* [in] */ const SYNC_RANGE *psrngSyncRange,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ExcludeItem )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbItemId);
        
        HRESULT ( STDMETHODCALLTYPE *ExcludeChangeUnit )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsKnowledge )( 
            ISyncKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *FindMinTickCountForReplica )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ ULONGLONG *pullReplicaTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetRangeExceptions )( 
            ISyncKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetSingleItemExceptions )( 
            ISyncKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitExceptions )( 
            ISyncKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *FindClockVectorForItem )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *FindClockVectorForChangeUnit )( 
            ISyncKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetVersion )( 
            ISyncKnowledge * This,
            /* [out] */ DWORD *pdwVersion);
        
        END_INTERFACE
    } ISyncKnowledgeVtbl;

    interface ISyncKnowledge
    {
        CONST_VTBL struct ISyncKnowledgeVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncKnowledge_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncKnowledge_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncKnowledge_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncKnowledge_GetOwnerReplicaId(This,pbReplicaId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetOwnerReplicaId(This,pbReplicaId,pcbIdSize) ) 

#define ISyncKnowledge_Serialize(This,fSerializeReplicaKeyMap,pbKnowledge,pcbKnowledge)	\
    ( (This)->lpVtbl -> Serialize(This,fSerializeReplicaKeyMap,pbKnowledge,pcbKnowledge) ) 

#define ISyncKnowledge_SetLocalTickCount(This,ullTickCount)	\
    ( (This)->lpVtbl -> SetLocalTickCount(This,ullTickCount) ) 

#define ISyncKnowledge_ContainsChange(This,pbVersionOwnerReplicaId,pgidItemId,pSyncVersion)	\
    ( (This)->lpVtbl -> ContainsChange(This,pbVersionOwnerReplicaId,pgidItemId,pSyncVersion) ) 

#define ISyncKnowledge_ContainsChangeUnit(This,pbVersionOwnerReplicaId,pbItemId,pbChangeUnitId,pSyncVersion)	\
    ( (This)->lpVtbl -> ContainsChangeUnit(This,pbVersionOwnerReplicaId,pbItemId,pbChangeUnitId,pSyncVersion) ) 

#define ISyncKnowledge_GetScopeVector(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetScopeVector(This,riid,ppUnk) ) 

#define ISyncKnowledge_GetReplicaKeyMap(This,ppReplicaKeyMap)	\
    ( (This)->lpVtbl -> GetReplicaKeyMap(This,ppReplicaKeyMap) ) 

#define ISyncKnowledge_Clone(This,ppClonedKnowledge)	\
    ( (This)->lpVtbl -> Clone(This,ppClonedKnowledge) ) 

#define ISyncKnowledge_ConvertVersion(This,pKnowledgeIn,pbCurrentOwnerId,pVersionIn,pbNewOwnerId,pcbIdSize,pVersionOut)	\
    ( (This)->lpVtbl -> ConvertVersion(This,pKnowledgeIn,pbCurrentOwnerId,pVersionIn,pbNewOwnerId,pcbIdSize,pVersionOut) ) 

#define ISyncKnowledge_MapRemoteToLocal(This,pRemoteKnowledge,ppMappedKnowledge)	\
    ( (This)->lpVtbl -> MapRemoteToLocal(This,pRemoteKnowledge,ppMappedKnowledge) ) 

#define ISyncKnowledge_Union(This,pKnowledge)	\
    ( (This)->lpVtbl -> Union(This,pKnowledge) ) 

#define ISyncKnowledge_ProjectOntoItem(This,pbItemId,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoItem(This,pbItemId,ppKnowledgeOut) ) 

#define ISyncKnowledge_ProjectOntoChangeUnit(This,pbItemId,pbChangeUnitId,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoChangeUnit(This,pbItemId,pbChangeUnitId,ppKnowledgeOut) ) 

#define ISyncKnowledge_ProjectOntoRange(This,psrngSyncRange,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoRange(This,psrngSyncRange,ppKnowledgeOut) ) 

#define ISyncKnowledge_ExcludeItem(This,pbItemId)	\
    ( (This)->lpVtbl -> ExcludeItem(This,pbItemId) ) 

#define ISyncKnowledge_ExcludeChangeUnit(This,pbItemId,pbChangeUnitId)	\
    ( (This)->lpVtbl -> ExcludeChangeUnit(This,pbItemId,pbChangeUnitId) ) 

#define ISyncKnowledge_ContainsKnowledge(This,pKnowledge)	\
    ( (This)->lpVtbl -> ContainsKnowledge(This,pKnowledge) ) 

#define ISyncKnowledge_FindMinTickCountForReplica(This,pbReplicaId,pullReplicaTickCount)	\
    ( (This)->lpVtbl -> FindMinTickCountForReplica(This,pbReplicaId,pullReplicaTickCount) ) 

#define ISyncKnowledge_GetRangeExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetRangeExceptions(This,riid,ppUnk) ) 

#define ISyncKnowledge_GetSingleItemExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetSingleItemExceptions(This,riid,ppUnk) ) 

#define ISyncKnowledge_GetChangeUnitExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetChangeUnitExceptions(This,riid,ppUnk) ) 

#define ISyncKnowledge_FindClockVectorForItem(This,pbItemId,riid,ppUnk)	\
    ( (This)->lpVtbl -> FindClockVectorForItem(This,pbItemId,riid,ppUnk) ) 

#define ISyncKnowledge_FindClockVectorForChangeUnit(This,pbItemId,pbChangeUnitId,riid,ppUnk)	\
    ( (This)->lpVtbl -> FindClockVectorForChangeUnit(This,pbItemId,pbChangeUnitId,riid,ppUnk) ) 

#define ISyncKnowledge_GetVersion(This,pdwVersion)	\
    ( (This)->lpVtbl -> GetVersion(This,pdwVersion) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncKnowledge_INTERFACE_DEFINED__ */


#ifndef __IForgottenKnowledge_INTERFACE_DEFINED__
#define __IForgottenKnowledge_INTERFACE_DEFINED__

/* interface IForgottenKnowledge */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IForgottenKnowledge;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("456e0f96-6036-452b-9f9d-bcc4b4a85db2")
    IForgottenKnowledge : public ISyncKnowledge
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE ForgetToVersion( 
            /* [in] */ ISyncKnowledge *pKnowledge,
            /* [in] */ const SYNC_VERSION *pVersion) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IForgottenKnowledgeVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IForgottenKnowledge * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IForgottenKnowledge * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IForgottenKnowledge * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetOwnerReplicaId )( 
            IForgottenKnowledge * This,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            IForgottenKnowledge * This,
            /* [in] */ BOOL fSerializeReplicaKeyMap,
            /* [size_is][unique][out][in] */ BYTE *pbKnowledge,
            /* [out][in] */ DWORD *pcbKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLocalTickCount )( 
            IForgottenKnowledge * This,
            /* [in] */ ULONGLONG ullTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsChange )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pgidItemId,
            /* [in] */ const SYNC_VERSION *pSyncVersion);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsChangeUnit )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ const SYNC_VERSION *pSyncVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetScopeVector )( 
            IForgottenKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetReplicaKeyMap )( 
            IForgottenKnowledge * This,
            /* [out] */ IReplicaKeyMap **ppReplicaKeyMap);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IForgottenKnowledge * This,
            /* [out] */ ISyncKnowledge **ppClonedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *ConvertVersion )( 
            IForgottenKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledgeIn,
            /* [in] */ const BYTE *pbCurrentOwnerId,
            /* [in] */ const SYNC_VERSION *pVersionIn,
            /* [unique][in] */ BYTE *pbNewOwnerId,
            /* [out][in] */ DWORD *pcbIdSize,
            /* [out] */ SYNC_VERSION *pVersionOut);
        
        HRESULT ( STDMETHODCALLTYPE *MapRemoteToLocal )( 
            IForgottenKnowledge * This,
            /* [in] */ ISyncKnowledge *pRemoteKnowledge,
            /* [out] */ ISyncKnowledge **ppMappedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *Union )( 
            IForgottenKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoItem )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoChangeUnit )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoRange )( 
            IForgottenKnowledge * This,
            /* [in] */ const SYNC_RANGE *psrngSyncRange,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ExcludeItem )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbItemId);
        
        HRESULT ( STDMETHODCALLTYPE *ExcludeChangeUnit )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsKnowledge )( 
            IForgottenKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *FindMinTickCountForReplica )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ ULONGLONG *pullReplicaTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetRangeExceptions )( 
            IForgottenKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetSingleItemExceptions )( 
            IForgottenKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitExceptions )( 
            IForgottenKnowledge * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *FindClockVectorForItem )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *FindClockVectorForChangeUnit )( 
            IForgottenKnowledge * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetVersion )( 
            IForgottenKnowledge * This,
            /* [out] */ DWORD *pdwVersion);
        
        HRESULT ( STDMETHODCALLTYPE *ForgetToVersion )( 
            IForgottenKnowledge * This,
            /* [in] */ ISyncKnowledge *pKnowledge,
            /* [in] */ const SYNC_VERSION *pVersion);
        
        END_INTERFACE
    } IForgottenKnowledgeVtbl;

    interface IForgottenKnowledge
    {
        CONST_VTBL struct IForgottenKnowledgeVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IForgottenKnowledge_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IForgottenKnowledge_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IForgottenKnowledge_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IForgottenKnowledge_GetOwnerReplicaId(This,pbReplicaId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetOwnerReplicaId(This,pbReplicaId,pcbIdSize) ) 

#define IForgottenKnowledge_Serialize(This,fSerializeReplicaKeyMap,pbKnowledge,pcbKnowledge)	\
    ( (This)->lpVtbl -> Serialize(This,fSerializeReplicaKeyMap,pbKnowledge,pcbKnowledge) ) 

#define IForgottenKnowledge_SetLocalTickCount(This,ullTickCount)	\
    ( (This)->lpVtbl -> SetLocalTickCount(This,ullTickCount) ) 

#define IForgottenKnowledge_ContainsChange(This,pbVersionOwnerReplicaId,pgidItemId,pSyncVersion)	\
    ( (This)->lpVtbl -> ContainsChange(This,pbVersionOwnerReplicaId,pgidItemId,pSyncVersion) ) 

#define IForgottenKnowledge_ContainsChangeUnit(This,pbVersionOwnerReplicaId,pbItemId,pbChangeUnitId,pSyncVersion)	\
    ( (This)->lpVtbl -> ContainsChangeUnit(This,pbVersionOwnerReplicaId,pbItemId,pbChangeUnitId,pSyncVersion) ) 

#define IForgottenKnowledge_GetScopeVector(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetScopeVector(This,riid,ppUnk) ) 

#define IForgottenKnowledge_GetReplicaKeyMap(This,ppReplicaKeyMap)	\
    ( (This)->lpVtbl -> GetReplicaKeyMap(This,ppReplicaKeyMap) ) 

#define IForgottenKnowledge_Clone(This,ppClonedKnowledge)	\
    ( (This)->lpVtbl -> Clone(This,ppClonedKnowledge) ) 

#define IForgottenKnowledge_ConvertVersion(This,pKnowledgeIn,pbCurrentOwnerId,pVersionIn,pbNewOwnerId,pcbIdSize,pVersionOut)	\
    ( (This)->lpVtbl -> ConvertVersion(This,pKnowledgeIn,pbCurrentOwnerId,pVersionIn,pbNewOwnerId,pcbIdSize,pVersionOut) ) 

#define IForgottenKnowledge_MapRemoteToLocal(This,pRemoteKnowledge,ppMappedKnowledge)	\
    ( (This)->lpVtbl -> MapRemoteToLocal(This,pRemoteKnowledge,ppMappedKnowledge) ) 

#define IForgottenKnowledge_Union(This,pKnowledge)	\
    ( (This)->lpVtbl -> Union(This,pKnowledge) ) 

#define IForgottenKnowledge_ProjectOntoItem(This,pbItemId,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoItem(This,pbItemId,ppKnowledgeOut) ) 

#define IForgottenKnowledge_ProjectOntoChangeUnit(This,pbItemId,pbChangeUnitId,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoChangeUnit(This,pbItemId,pbChangeUnitId,ppKnowledgeOut) ) 

#define IForgottenKnowledge_ProjectOntoRange(This,psrngSyncRange,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoRange(This,psrngSyncRange,ppKnowledgeOut) ) 

#define IForgottenKnowledge_ExcludeItem(This,pbItemId)	\
    ( (This)->lpVtbl -> ExcludeItem(This,pbItemId) ) 

#define IForgottenKnowledge_ExcludeChangeUnit(This,pbItemId,pbChangeUnitId)	\
    ( (This)->lpVtbl -> ExcludeChangeUnit(This,pbItemId,pbChangeUnitId) ) 

#define IForgottenKnowledge_ContainsKnowledge(This,pKnowledge)	\
    ( (This)->lpVtbl -> ContainsKnowledge(This,pKnowledge) ) 

#define IForgottenKnowledge_FindMinTickCountForReplica(This,pbReplicaId,pullReplicaTickCount)	\
    ( (This)->lpVtbl -> FindMinTickCountForReplica(This,pbReplicaId,pullReplicaTickCount) ) 

#define IForgottenKnowledge_GetRangeExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetRangeExceptions(This,riid,ppUnk) ) 

#define IForgottenKnowledge_GetSingleItemExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetSingleItemExceptions(This,riid,ppUnk) ) 

#define IForgottenKnowledge_GetChangeUnitExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetChangeUnitExceptions(This,riid,ppUnk) ) 

#define IForgottenKnowledge_FindClockVectorForItem(This,pbItemId,riid,ppUnk)	\
    ( (This)->lpVtbl -> FindClockVectorForItem(This,pbItemId,riid,ppUnk) ) 

#define IForgottenKnowledge_FindClockVectorForChangeUnit(This,pbItemId,pbChangeUnitId,riid,ppUnk)	\
    ( (This)->lpVtbl -> FindClockVectorForChangeUnit(This,pbItemId,pbChangeUnitId,riid,ppUnk) ) 

#define IForgottenKnowledge_GetVersion(This,pdwVersion)	\
    ( (This)->lpVtbl -> GetVersion(This,pdwVersion) ) 


#define IForgottenKnowledge_ForgetToVersion(This,pKnowledge,pVersion)	\
    ( (This)->lpVtbl -> ForgetToVersion(This,pKnowledge,pVersion) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IForgottenKnowledge_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_winsync_0000_0018 */
/* [local] */ 

#define SYNC_SERIALIZE_REPLICA_KEY_MAP                 0x00000001


extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0018_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0018_v0_0_s_ifspec;

#ifndef __ISyncKnowledge2_INTERFACE_DEFINED__
#define __ISyncKnowledge2_INTERFACE_DEFINED__

/* interface ISyncKnowledge2 */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncKnowledge2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ed0addc0-3b4b-46a1-9a45-45661d2114c8")
    ISyncKnowledge2 : public ISyncKnowledge
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetIdParameters( 
            /* [out] */ ID_PARAMETERS *pIdParameters) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProjectOntoColumnSet( 
            /* [in] */ const BYTE **ppColumns,
            /* [in] */ DWORD count,
            /* [out] */ ISyncKnowledge2 **ppiKnowledgeOut) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SerializeWithOptions( 
            /* [in] */ SYNC_SERIALIZATION_VERSION targetFormatVersion,
            /* [in] */ DWORD dwFlags,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pdwSerializedSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLowestUncontainedId( 
            /* [in] */ ISyncKnowledge2 *piSyncKnowledge,
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbItemIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetInspector( 
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppiInspector) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetMinimumSupportedVersion( 
            /* [out] */ SYNC_SERIALIZATION_VERSION *pVersion) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStatistics( 
            /* [in] */ SYNC_STATISTICS which,
            /* [out] */ DWORD *pValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ContainsKnowledgeForItem( 
            /* [in] */ ISyncKnowledge *pKnowledge,
            /* [in] */ const BYTE *pbItemId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ContainsKnowledgeForChangeUnit( 
            /* [in] */ ISyncKnowledge *pKnowledge,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProjectOntoKnowledgeWithPrerequisite( 
            /* [in] */ ISyncKnowledge *pPrerequisiteKnowledge,
            /* [in] */ ISyncKnowledge *pTemplateKnowledge,
            /* [out] */ ISyncKnowledge **ppProjectedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Complement( 
            /* [in] */ ISyncKnowledge *pSyncKnowledge,
            /* [out] */ ISyncKnowledge **ppComplementedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IntersectsWithKnowledge( 
            /* [in] */ ISyncKnowledge *pSyncKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetKnowledgeCookie( 
            /* [out] */ IUnknown **ppKnowledgeCookie) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CompareToKnowledgeCookie( 
            /* [in] */ IUnknown *pKnowledgeCookie,
            /* [out] */ KNOWLEDGE_COOKIE_COMPARISON_RESULT *pResult) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncKnowledge2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncKnowledge2 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncKnowledge2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncKnowledge2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetOwnerReplicaId )( 
            ISyncKnowledge2 * This,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncKnowledge2 * This,
            /* [in] */ BOOL fSerializeReplicaKeyMap,
            /* [size_is][unique][out][in] */ BYTE *pbKnowledge,
            /* [out][in] */ DWORD *pcbKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLocalTickCount )( 
            ISyncKnowledge2 * This,
            /* [in] */ ULONGLONG ullTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsChange )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pgidItemId,
            /* [in] */ const SYNC_VERSION *pSyncVersion);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsChangeUnit )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbVersionOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ const SYNC_VERSION *pSyncVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetScopeVector )( 
            ISyncKnowledge2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetReplicaKeyMap )( 
            ISyncKnowledge2 * This,
            /* [out] */ IReplicaKeyMap **ppReplicaKeyMap);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            ISyncKnowledge2 * This,
            /* [out] */ ISyncKnowledge **ppClonedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *ConvertVersion )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pKnowledgeIn,
            /* [in] */ const BYTE *pbCurrentOwnerId,
            /* [in] */ const SYNC_VERSION *pVersionIn,
            /* [unique][in] */ BYTE *pbNewOwnerId,
            /* [out][in] */ DWORD *pcbIdSize,
            /* [out] */ SYNC_VERSION *pVersionOut);
        
        HRESULT ( STDMETHODCALLTYPE *MapRemoteToLocal )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pRemoteKnowledge,
            /* [out] */ ISyncKnowledge **ppMappedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *Union )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoItem )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbItemId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoChangeUnit )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoRange )( 
            ISyncKnowledge2 * This,
            /* [in] */ const SYNC_RANGE *psrngSyncRange,
            /* [out] */ ISyncKnowledge **ppKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *ExcludeItem )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbItemId);
        
        HRESULT ( STDMETHODCALLTYPE *ExcludeChangeUnit )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsKnowledge )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *FindMinTickCountForReplica )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbReplicaId,
            /* [out] */ ULONGLONG *pullReplicaTickCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetRangeExceptions )( 
            ISyncKnowledge2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetSingleItemExceptions )( 
            ISyncKnowledge2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitExceptions )( 
            ISyncKnowledge2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *FindClockVectorForItem )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *FindClockVectorForChangeUnit )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppUnk);
        
        HRESULT ( STDMETHODCALLTYPE *GetVersion )( 
            ISyncKnowledge2 * This,
            /* [out] */ DWORD *pdwVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetIdParameters )( 
            ISyncKnowledge2 * This,
            /* [out] */ ID_PARAMETERS *pIdParameters);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoColumnSet )( 
            ISyncKnowledge2 * This,
            /* [in] */ const BYTE **ppColumns,
            /* [in] */ DWORD count,
            /* [out] */ ISyncKnowledge2 **ppiKnowledgeOut);
        
        HRESULT ( STDMETHODCALLTYPE *SerializeWithOptions )( 
            ISyncKnowledge2 * This,
            /* [in] */ SYNC_SERIALIZATION_VERSION targetFormatVersion,
            /* [in] */ DWORD dwFlags,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pdwSerializedSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetLowestUncontainedId )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge2 *piSyncKnowledge,
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbItemIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetInspector )( 
            ISyncKnowledge2 * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppiInspector);
        
        HRESULT ( STDMETHODCALLTYPE *GetMinimumSupportedVersion )( 
            ISyncKnowledge2 * This,
            /* [out] */ SYNC_SERIALIZATION_VERSION *pVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetStatistics )( 
            ISyncKnowledge2 * This,
            /* [in] */ SYNC_STATISTICS which,
            /* [out] */ DWORD *pValue);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsKnowledgeForItem )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pKnowledge,
            /* [in] */ const BYTE *pbItemId);
        
        HRESULT ( STDMETHODCALLTYPE *ContainsKnowledgeForChangeUnit )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pKnowledge,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId);
        
        HRESULT ( STDMETHODCALLTYPE *ProjectOntoKnowledgeWithPrerequisite )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pPrerequisiteKnowledge,
            /* [in] */ ISyncKnowledge *pTemplateKnowledge,
            /* [out] */ ISyncKnowledge **ppProjectedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *Complement )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pSyncKnowledge,
            /* [out] */ ISyncKnowledge **ppComplementedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *IntersectsWithKnowledge )( 
            ISyncKnowledge2 * This,
            /* [in] */ ISyncKnowledge *pSyncKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetKnowledgeCookie )( 
            ISyncKnowledge2 * This,
            /* [out] */ IUnknown **ppKnowledgeCookie);
        
        HRESULT ( STDMETHODCALLTYPE *CompareToKnowledgeCookie )( 
            ISyncKnowledge2 * This,
            /* [in] */ IUnknown *pKnowledgeCookie,
            /* [out] */ KNOWLEDGE_COOKIE_COMPARISON_RESULT *pResult);
        
        END_INTERFACE
    } ISyncKnowledge2Vtbl;

    interface ISyncKnowledge2
    {
        CONST_VTBL struct ISyncKnowledge2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncKnowledge2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncKnowledge2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncKnowledge2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncKnowledge2_GetOwnerReplicaId(This,pbReplicaId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetOwnerReplicaId(This,pbReplicaId,pcbIdSize) ) 

#define ISyncKnowledge2_Serialize(This,fSerializeReplicaKeyMap,pbKnowledge,pcbKnowledge)	\
    ( (This)->lpVtbl -> Serialize(This,fSerializeReplicaKeyMap,pbKnowledge,pcbKnowledge) ) 

#define ISyncKnowledge2_SetLocalTickCount(This,ullTickCount)	\
    ( (This)->lpVtbl -> SetLocalTickCount(This,ullTickCount) ) 

#define ISyncKnowledge2_ContainsChange(This,pbVersionOwnerReplicaId,pgidItemId,pSyncVersion)	\
    ( (This)->lpVtbl -> ContainsChange(This,pbVersionOwnerReplicaId,pgidItemId,pSyncVersion) ) 

#define ISyncKnowledge2_ContainsChangeUnit(This,pbVersionOwnerReplicaId,pbItemId,pbChangeUnitId,pSyncVersion)	\
    ( (This)->lpVtbl -> ContainsChangeUnit(This,pbVersionOwnerReplicaId,pbItemId,pbChangeUnitId,pSyncVersion) ) 

#define ISyncKnowledge2_GetScopeVector(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetScopeVector(This,riid,ppUnk) ) 

#define ISyncKnowledge2_GetReplicaKeyMap(This,ppReplicaKeyMap)	\
    ( (This)->lpVtbl -> GetReplicaKeyMap(This,ppReplicaKeyMap) ) 

#define ISyncKnowledge2_Clone(This,ppClonedKnowledge)	\
    ( (This)->lpVtbl -> Clone(This,ppClonedKnowledge) ) 

#define ISyncKnowledge2_ConvertVersion(This,pKnowledgeIn,pbCurrentOwnerId,pVersionIn,pbNewOwnerId,pcbIdSize,pVersionOut)	\
    ( (This)->lpVtbl -> ConvertVersion(This,pKnowledgeIn,pbCurrentOwnerId,pVersionIn,pbNewOwnerId,pcbIdSize,pVersionOut) ) 

#define ISyncKnowledge2_MapRemoteToLocal(This,pRemoteKnowledge,ppMappedKnowledge)	\
    ( (This)->lpVtbl -> MapRemoteToLocal(This,pRemoteKnowledge,ppMappedKnowledge) ) 

#define ISyncKnowledge2_Union(This,pKnowledge)	\
    ( (This)->lpVtbl -> Union(This,pKnowledge) ) 

#define ISyncKnowledge2_ProjectOntoItem(This,pbItemId,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoItem(This,pbItemId,ppKnowledgeOut) ) 

#define ISyncKnowledge2_ProjectOntoChangeUnit(This,pbItemId,pbChangeUnitId,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoChangeUnit(This,pbItemId,pbChangeUnitId,ppKnowledgeOut) ) 

#define ISyncKnowledge2_ProjectOntoRange(This,psrngSyncRange,ppKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoRange(This,psrngSyncRange,ppKnowledgeOut) ) 

#define ISyncKnowledge2_ExcludeItem(This,pbItemId)	\
    ( (This)->lpVtbl -> ExcludeItem(This,pbItemId) ) 

#define ISyncKnowledge2_ExcludeChangeUnit(This,pbItemId,pbChangeUnitId)	\
    ( (This)->lpVtbl -> ExcludeChangeUnit(This,pbItemId,pbChangeUnitId) ) 

#define ISyncKnowledge2_ContainsKnowledge(This,pKnowledge)	\
    ( (This)->lpVtbl -> ContainsKnowledge(This,pKnowledge) ) 

#define ISyncKnowledge2_FindMinTickCountForReplica(This,pbReplicaId,pullReplicaTickCount)	\
    ( (This)->lpVtbl -> FindMinTickCountForReplica(This,pbReplicaId,pullReplicaTickCount) ) 

#define ISyncKnowledge2_GetRangeExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetRangeExceptions(This,riid,ppUnk) ) 

#define ISyncKnowledge2_GetSingleItemExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetSingleItemExceptions(This,riid,ppUnk) ) 

#define ISyncKnowledge2_GetChangeUnitExceptions(This,riid,ppUnk)	\
    ( (This)->lpVtbl -> GetChangeUnitExceptions(This,riid,ppUnk) ) 

#define ISyncKnowledge2_FindClockVectorForItem(This,pbItemId,riid,ppUnk)	\
    ( (This)->lpVtbl -> FindClockVectorForItem(This,pbItemId,riid,ppUnk) ) 

#define ISyncKnowledge2_FindClockVectorForChangeUnit(This,pbItemId,pbChangeUnitId,riid,ppUnk)	\
    ( (This)->lpVtbl -> FindClockVectorForChangeUnit(This,pbItemId,pbChangeUnitId,riid,ppUnk) ) 

#define ISyncKnowledge2_GetVersion(This,pdwVersion)	\
    ( (This)->lpVtbl -> GetVersion(This,pdwVersion) ) 


#define ISyncKnowledge2_GetIdParameters(This,pIdParameters)	\
    ( (This)->lpVtbl -> GetIdParameters(This,pIdParameters) ) 

#define ISyncKnowledge2_ProjectOntoColumnSet(This,ppColumns,count,ppiKnowledgeOut)	\
    ( (This)->lpVtbl -> ProjectOntoColumnSet(This,ppColumns,count,ppiKnowledgeOut) ) 

#define ISyncKnowledge2_SerializeWithOptions(This,targetFormatVersion,dwFlags,pbBuffer,pdwSerializedSize)	\
    ( (This)->lpVtbl -> SerializeWithOptions(This,targetFormatVersion,dwFlags,pbBuffer,pdwSerializedSize) ) 

#define ISyncKnowledge2_GetLowestUncontainedId(This,piSyncKnowledge,pbItemId,pcbItemIdSize)	\
    ( (This)->lpVtbl -> GetLowestUncontainedId(This,piSyncKnowledge,pbItemId,pcbItemIdSize) ) 

#define ISyncKnowledge2_GetInspector(This,riid,ppiInspector)	\
    ( (This)->lpVtbl -> GetInspector(This,riid,ppiInspector) ) 

#define ISyncKnowledge2_GetMinimumSupportedVersion(This,pVersion)	\
    ( (This)->lpVtbl -> GetMinimumSupportedVersion(This,pVersion) ) 

#define ISyncKnowledge2_GetStatistics(This,which,pValue)	\
    ( (This)->lpVtbl -> GetStatistics(This,which,pValue) ) 

#define ISyncKnowledge2_ContainsKnowledgeForItem(This,pKnowledge,pbItemId)	\
    ( (This)->lpVtbl -> ContainsKnowledgeForItem(This,pKnowledge,pbItemId) ) 

#define ISyncKnowledge2_ContainsKnowledgeForChangeUnit(This,pKnowledge,pbItemId,pbChangeUnitId)	\
    ( (This)->lpVtbl -> ContainsKnowledgeForChangeUnit(This,pKnowledge,pbItemId,pbChangeUnitId) ) 

#define ISyncKnowledge2_ProjectOntoKnowledgeWithPrerequisite(This,pPrerequisiteKnowledge,pTemplateKnowledge,ppProjectedKnowledge)	\
    ( (This)->lpVtbl -> ProjectOntoKnowledgeWithPrerequisite(This,pPrerequisiteKnowledge,pTemplateKnowledge,ppProjectedKnowledge) ) 

#define ISyncKnowledge2_Complement(This,pSyncKnowledge,ppComplementedKnowledge)	\
    ( (This)->lpVtbl -> Complement(This,pSyncKnowledge,ppComplementedKnowledge) ) 

#define ISyncKnowledge2_IntersectsWithKnowledge(This,pSyncKnowledge)	\
    ( (This)->lpVtbl -> IntersectsWithKnowledge(This,pSyncKnowledge) ) 

#define ISyncKnowledge2_GetKnowledgeCookie(This,ppKnowledgeCookie)	\
    ( (This)->lpVtbl -> GetKnowledgeCookie(This,ppKnowledgeCookie) ) 

#define ISyncKnowledge2_CompareToKnowledgeCookie(This,pKnowledgeCookie,pResult)	\
    ( (This)->lpVtbl -> CompareToKnowledgeCookie(This,pKnowledgeCookie,pResult) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncKnowledge2_INTERFACE_DEFINED__ */


#ifndef __IRecoverableErrorData_INTERFACE_DEFINED__
#define __IRecoverableErrorData_INTERFACE_DEFINED__

/* interface IRecoverableErrorData */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IRecoverableErrorData;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("b37c4a0a-4b7d-4c2d-9711-3b00d119b1c8")
    IRecoverableErrorData : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Initialize( 
            /* [unique][in] */ LPCWSTR pcszItemDisplayName,
            /* [unique][in] */ LPCWSTR pcszErrorDescription) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetItemDisplayName( 
            /* [size_is][string][unique][out][in] */ LPWSTR pszItemDisplayName,
            /* [out][in] */ DWORD *pcchItemDisplayName) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetErrorDescription( 
            /* [size_is][string][unique][out][in] */ LPWSTR pszErrorDescription,
            /* [out][in] */ DWORD *pcchErrorDescription) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IRecoverableErrorDataVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IRecoverableErrorData * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IRecoverableErrorData * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IRecoverableErrorData * This);
        
        HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            IRecoverableErrorData * This,
            /* [unique][in] */ LPCWSTR pcszItemDisplayName,
            /* [unique][in] */ LPCWSTR pcszErrorDescription);
        
        HRESULT ( STDMETHODCALLTYPE *GetItemDisplayName )( 
            IRecoverableErrorData * This,
            /* [size_is][string][unique][out][in] */ LPWSTR pszItemDisplayName,
            /* [out][in] */ DWORD *pcchItemDisplayName);
        
        HRESULT ( STDMETHODCALLTYPE *GetErrorDescription )( 
            IRecoverableErrorData * This,
            /* [size_is][string][unique][out][in] */ LPWSTR pszErrorDescription,
            /* [out][in] */ DWORD *pcchErrorDescription);
        
        END_INTERFACE
    } IRecoverableErrorDataVtbl;

    interface IRecoverableErrorData
    {
        CONST_VTBL struct IRecoverableErrorDataVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRecoverableErrorData_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRecoverableErrorData_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRecoverableErrorData_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRecoverableErrorData_Initialize(This,pcszItemDisplayName,pcszErrorDescription)	\
    ( (This)->lpVtbl -> Initialize(This,pcszItemDisplayName,pcszErrorDescription) ) 

#define IRecoverableErrorData_GetItemDisplayName(This,pszItemDisplayName,pcchItemDisplayName)	\
    ( (This)->lpVtbl -> GetItemDisplayName(This,pszItemDisplayName,pcchItemDisplayName) ) 

#define IRecoverableErrorData_GetErrorDescription(This,pszErrorDescription,pcchErrorDescription)	\
    ( (This)->lpVtbl -> GetErrorDescription(This,pszErrorDescription,pcchErrorDescription) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRecoverableErrorData_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_winsync_0000_0020 */
/* [local] */ 





extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0020_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0020_v0_0_s_ifspec;

#ifndef __IRecoverableError_INTERFACE_DEFINED__
#define __IRecoverableError_INTERFACE_DEFINED__

/* interface IRecoverableError */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IRecoverableError;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0f5625e8-0a7b-45ee-9637-1ce13645909e")
    IRecoverableError : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetStage( 
            /* [out] */ SYNC_PROGRESS_STAGE *pStage) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetProvider( 
            /* [out] */ SYNC_PROVIDER_ROLE *pProviderRole) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeWithRecoverableError( 
            /* [out] */ ISyncChange **ppChangeWithRecoverableError) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRecoverableErrorDataForChange( 
            /* [out] */ HRESULT *phrError,
            /* [out] */ IRecoverableErrorData **ppErrorData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRecoverableErrorDataForChangeUnit( 
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [out] */ HRESULT *phrError,
            /* [out] */ IRecoverableErrorData **ppErrorData) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IRecoverableErrorVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IRecoverableError * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IRecoverableError * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IRecoverableError * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetStage )( 
            IRecoverableError * This,
            /* [out] */ SYNC_PROGRESS_STAGE *pStage);
        
        HRESULT ( STDMETHODCALLTYPE *GetProvider )( 
            IRecoverableError * This,
            /* [out] */ SYNC_PROVIDER_ROLE *pProviderRole);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeWithRecoverableError )( 
            IRecoverableError * This,
            /* [out] */ ISyncChange **ppChangeWithRecoverableError);
        
        HRESULT ( STDMETHODCALLTYPE *GetRecoverableErrorDataForChange )( 
            IRecoverableError * This,
            /* [out] */ HRESULT *phrError,
            /* [out] */ IRecoverableErrorData **ppErrorData);
        
        HRESULT ( STDMETHODCALLTYPE *GetRecoverableErrorDataForChangeUnit )( 
            IRecoverableError * This,
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [out] */ HRESULT *phrError,
            /* [out] */ IRecoverableErrorData **ppErrorData);
        
        END_INTERFACE
    } IRecoverableErrorVtbl;

    interface IRecoverableError
    {
        CONST_VTBL struct IRecoverableErrorVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRecoverableError_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRecoverableError_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRecoverableError_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRecoverableError_GetStage(This,pStage)	\
    ( (This)->lpVtbl -> GetStage(This,pStage) ) 

#define IRecoverableError_GetProvider(This,pProviderRole)	\
    ( (This)->lpVtbl -> GetProvider(This,pProviderRole) ) 

#define IRecoverableError_GetChangeWithRecoverableError(This,ppChangeWithRecoverableError)	\
    ( (This)->lpVtbl -> GetChangeWithRecoverableError(This,ppChangeWithRecoverableError) ) 

#define IRecoverableError_GetRecoverableErrorDataForChange(This,phrError,ppErrorData)	\
    ( (This)->lpVtbl -> GetRecoverableErrorDataForChange(This,phrError,ppErrorData) ) 

#define IRecoverableError_GetRecoverableErrorDataForChangeUnit(This,pChangeUnit,phrError,ppErrorData)	\
    ( (This)->lpVtbl -> GetRecoverableErrorDataForChangeUnit(This,pChangeUnit,phrError,ppErrorData) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRecoverableError_INTERFACE_DEFINED__ */


#ifndef __IChangeConflict_INTERFACE_DEFINED__
#define __IChangeConflict_INTERFACE_DEFINED__

/* interface IChangeConflict */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IChangeConflict;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("014ebf97-9f20-4f7a-bdd4-25979c77c002")
    IChangeConflict : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetDestinationProviderConflictingChange( 
            /* [out] */ ISyncChange **ppConflictingChange) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSourceProviderConflictingChange( 
            /* [out] */ ISyncChange **ppConflictingChange) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetDestinationProviderConflictingData( 
            /* [out] */ IUnknown **ppConflictingData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSourceProviderConflictingData( 
            /* [out] */ IUnknown **ppConflictingData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetResolveActionForChange( 
            /* [out] */ SYNC_RESOLVE_ACTION *pResolveAction) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetResolveActionForChange( 
            /* [in] */ SYNC_RESOLVE_ACTION resolveAction) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetResolveActionForChangeUnit( 
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [out] */ SYNC_RESOLVE_ACTION *pResolveAction) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetResolveActionForChangeUnit( 
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [in] */ SYNC_RESOLVE_ACTION resolveAction) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IChangeConflictVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IChangeConflict * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IChangeConflict * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IChangeConflict * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetDestinationProviderConflictingChange )( 
            IChangeConflict * This,
            /* [out] */ ISyncChange **ppConflictingChange);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceProviderConflictingChange )( 
            IChangeConflict * This,
            /* [out] */ ISyncChange **ppConflictingChange);
        
        HRESULT ( STDMETHODCALLTYPE *GetDestinationProviderConflictingData )( 
            IChangeConflict * This,
            /* [out] */ IUnknown **ppConflictingData);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceProviderConflictingData )( 
            IChangeConflict * This,
            /* [out] */ IUnknown **ppConflictingData);
        
        HRESULT ( STDMETHODCALLTYPE *GetResolveActionForChange )( 
            IChangeConflict * This,
            /* [out] */ SYNC_RESOLVE_ACTION *pResolveAction);
        
        HRESULT ( STDMETHODCALLTYPE *SetResolveActionForChange )( 
            IChangeConflict * This,
            /* [in] */ SYNC_RESOLVE_ACTION resolveAction);
        
        HRESULT ( STDMETHODCALLTYPE *GetResolveActionForChangeUnit )( 
            IChangeConflict * This,
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [out] */ SYNC_RESOLVE_ACTION *pResolveAction);
        
        HRESULT ( STDMETHODCALLTYPE *SetResolveActionForChangeUnit )( 
            IChangeConflict * This,
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [in] */ SYNC_RESOLVE_ACTION resolveAction);
        
        END_INTERFACE
    } IChangeConflictVtbl;

    interface IChangeConflict
    {
        CONST_VTBL struct IChangeConflictVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IChangeConflict_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IChangeConflict_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IChangeConflict_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IChangeConflict_GetDestinationProviderConflictingChange(This,ppConflictingChange)	\
    ( (This)->lpVtbl -> GetDestinationProviderConflictingChange(This,ppConflictingChange) ) 

#define IChangeConflict_GetSourceProviderConflictingChange(This,ppConflictingChange)	\
    ( (This)->lpVtbl -> GetSourceProviderConflictingChange(This,ppConflictingChange) ) 

#define IChangeConflict_GetDestinationProviderConflictingData(This,ppConflictingData)	\
    ( (This)->lpVtbl -> GetDestinationProviderConflictingData(This,ppConflictingData) ) 

#define IChangeConflict_GetSourceProviderConflictingData(This,ppConflictingData)	\
    ( (This)->lpVtbl -> GetSourceProviderConflictingData(This,ppConflictingData) ) 

#define IChangeConflict_GetResolveActionForChange(This,pResolveAction)	\
    ( (This)->lpVtbl -> GetResolveActionForChange(This,pResolveAction) ) 

#define IChangeConflict_SetResolveActionForChange(This,resolveAction)	\
    ( (This)->lpVtbl -> SetResolveActionForChange(This,resolveAction) ) 

#define IChangeConflict_GetResolveActionForChangeUnit(This,pChangeUnit,pResolveAction)	\
    ( (This)->lpVtbl -> GetResolveActionForChangeUnit(This,pChangeUnit,pResolveAction) ) 

#define IChangeConflict_SetResolveActionForChangeUnit(This,pChangeUnit,resolveAction)	\
    ( (This)->lpVtbl -> SetResolveActionForChangeUnit(This,pChangeUnit,resolveAction) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IChangeConflict_INTERFACE_DEFINED__ */


#ifndef __ISyncCallback_INTERFACE_DEFINED__
#define __ISyncCallback_INTERFACE_DEFINED__

/* interface ISyncCallback */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0599797f-5ed9-485c-ae36-0c5d1bf2e7a5")
    ISyncCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE OnProgress( 
            /* [in] */ SYNC_PROVIDER_ROLE provider,
            /* [in] */ SYNC_PROGRESS_STAGE syncStage,
            /* [in] */ DWORD dwCompletedWork,
            /* [in] */ DWORD dwTotalWork) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnChange( 
            /* [in] */ ISyncChange *pSyncChange) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnConflict( 
            /* [in] */ IChangeConflict *pConflict) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnFullEnumerationNeeded( 
            /* [out] */ SYNC_FULL_ENUMERATION_ACTION *pFullEnumerationAction) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnRecoverableError( 
            /* [in] */ IRecoverableError *pRecoverableError) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncCallback * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *OnProgress )( 
            ISyncCallback * This,
            /* [in] */ SYNC_PROVIDER_ROLE provider,
            /* [in] */ SYNC_PROGRESS_STAGE syncStage,
            /* [in] */ DWORD dwCompletedWork,
            /* [in] */ DWORD dwTotalWork);
        
        HRESULT ( STDMETHODCALLTYPE *OnChange )( 
            ISyncCallback * This,
            /* [in] */ ISyncChange *pSyncChange);
        
        HRESULT ( STDMETHODCALLTYPE *OnConflict )( 
            ISyncCallback * This,
            /* [in] */ IChangeConflict *pConflict);
        
        HRESULT ( STDMETHODCALLTYPE *OnFullEnumerationNeeded )( 
            ISyncCallback * This,
            /* [out] */ SYNC_FULL_ENUMERATION_ACTION *pFullEnumerationAction);
        
        HRESULT ( STDMETHODCALLTYPE *OnRecoverableError )( 
            ISyncCallback * This,
            /* [in] */ IRecoverableError *pRecoverableError);
        
        END_INTERFACE
    } ISyncCallbackVtbl;

    interface ISyncCallback
    {
        CONST_VTBL struct ISyncCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncCallback_OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork)	\
    ( (This)->lpVtbl -> OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork) ) 

#define ISyncCallback_OnChange(This,pSyncChange)	\
    ( (This)->lpVtbl -> OnChange(This,pSyncChange) ) 

#define ISyncCallback_OnConflict(This,pConflict)	\
    ( (This)->lpVtbl -> OnConflict(This,pConflict) ) 

#define ISyncCallback_OnFullEnumerationNeeded(This,pFullEnumerationAction)	\
    ( (This)->lpVtbl -> OnFullEnumerationNeeded(This,pFullEnumerationAction) ) 

#define ISyncCallback_OnRecoverableError(This,pRecoverableError)	\
    ( (This)->lpVtbl -> OnRecoverableError(This,pRecoverableError) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncCallback_INTERFACE_DEFINED__ */


#ifndef __ISyncCallback2_INTERFACE_DEFINED__
#define __ISyncCallback2_INTERFACE_DEFINED__

/* interface ISyncCallback2 */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncCallback2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("47ce84af-7442-4ead-8630-12015e030ad7")
    ISyncCallback2 : public ISyncCallback
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE OnChangeApplied( 
            /* [in] */ DWORD dwChangesApplied,
            /* [in] */ DWORD dwChangesFailed) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnChangeFailed( 
            /* [in] */ DWORD dwChangesApplied,
            /* [in] */ DWORD dwChangesFailed) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncCallback2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncCallback2 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncCallback2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncCallback2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *OnProgress )( 
            ISyncCallback2 * This,
            /* [in] */ SYNC_PROVIDER_ROLE provider,
            /* [in] */ SYNC_PROGRESS_STAGE syncStage,
            /* [in] */ DWORD dwCompletedWork,
            /* [in] */ DWORD dwTotalWork);
        
        HRESULT ( STDMETHODCALLTYPE *OnChange )( 
            ISyncCallback2 * This,
            /* [in] */ ISyncChange *pSyncChange);
        
        HRESULT ( STDMETHODCALLTYPE *OnConflict )( 
            ISyncCallback2 * This,
            /* [in] */ IChangeConflict *pConflict);
        
        HRESULT ( STDMETHODCALLTYPE *OnFullEnumerationNeeded )( 
            ISyncCallback2 * This,
            /* [out] */ SYNC_FULL_ENUMERATION_ACTION *pFullEnumerationAction);
        
        HRESULT ( STDMETHODCALLTYPE *OnRecoverableError )( 
            ISyncCallback2 * This,
            /* [in] */ IRecoverableError *pRecoverableError);
        
        HRESULT ( STDMETHODCALLTYPE *OnChangeApplied )( 
            ISyncCallback2 * This,
            /* [in] */ DWORD dwChangesApplied,
            /* [in] */ DWORD dwChangesFailed);
        
        HRESULT ( STDMETHODCALLTYPE *OnChangeFailed )( 
            ISyncCallback2 * This,
            /* [in] */ DWORD dwChangesApplied,
            /* [in] */ DWORD dwChangesFailed);
        
        END_INTERFACE
    } ISyncCallback2Vtbl;

    interface ISyncCallback2
    {
        CONST_VTBL struct ISyncCallback2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncCallback2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncCallback2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncCallback2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncCallback2_OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork)	\
    ( (This)->lpVtbl -> OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork) ) 

#define ISyncCallback2_OnChange(This,pSyncChange)	\
    ( (This)->lpVtbl -> OnChange(This,pSyncChange) ) 

#define ISyncCallback2_OnConflict(This,pConflict)	\
    ( (This)->lpVtbl -> OnConflict(This,pConflict) ) 

#define ISyncCallback2_OnFullEnumerationNeeded(This,pFullEnumerationAction)	\
    ( (This)->lpVtbl -> OnFullEnumerationNeeded(This,pFullEnumerationAction) ) 

#define ISyncCallback2_OnRecoverableError(This,pRecoverableError)	\
    ( (This)->lpVtbl -> OnRecoverableError(This,pRecoverableError) ) 


#define ISyncCallback2_OnChangeApplied(This,dwChangesApplied,dwChangesFailed)	\
    ( (This)->lpVtbl -> OnChangeApplied(This,dwChangesApplied,dwChangesFailed) ) 

#define ISyncCallback2_OnChangeFailed(This,dwChangesApplied,dwChangesFailed)	\
    ( (This)->lpVtbl -> OnChangeFailed(This,dwChangesApplied,dwChangesFailed) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncCallback2_INTERFACE_DEFINED__ */


#ifndef __ISyncProvider_INTERFACE_DEFINED__
#define __ISyncProvider_INTERFACE_DEFINED__

/* interface ISyncProvider */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncProvider;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8f657056-2bce-4a17-8c68-c7bb7898b56f")
    ISyncProvider : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetIdParameters( 
            /* [out] */ ID_PARAMETERS *pIdParameters) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncProviderVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncProvider * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncProvider * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncProvider * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIdParameters )( 
            ISyncProvider * This,
            /* [out] */ ID_PARAMETERS *pIdParameters);
        
        END_INTERFACE
    } ISyncProviderVtbl;

    interface ISyncProvider
    {
        CONST_VTBL struct ISyncProviderVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncProvider_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncProvider_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncProvider_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncProvider_GetIdParameters(This,pIdParameters)	\
    ( (This)->lpVtbl -> GetIdParameters(This,pIdParameters) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncProvider_INTERFACE_DEFINED__ */


#ifndef __ISyncSessionState_INTERFACE_DEFINED__
#define __ISyncSessionState_INTERFACE_DEFINED__

/* interface ISyncSessionState */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncSessionState;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("b8a940fe-9f01-483b-9434-c37d361225d9")
    ISyncSessionState : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE IsCanceled( 
            /* [out] */ BOOL *pfIsCanceled) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetInfoForChangeApplication( 
            /* [size_is][unique][out][in] */ BYTE *pbChangeApplierInfo,
            /* [out][in] */ DWORD *pcbChangeApplierInfo) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE LoadInfoFromChangeApplication( 
            /* [size_is][in] */ const BYTE *pbChangeApplierInfo,
            /* [in] */ DWORD cbChangeApplierInfo) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetForgottenKnowledgeRecoveryRangeStart( 
            /* [size_is][unique][out][in] */ BYTE *pbRangeStart,
            /* [out][in] */ DWORD *pcbRangeStart) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetForgottenKnowledgeRecoveryRangeEnd( 
            /* [size_is][unique][out][in] */ BYTE *pbRangeEnd,
            /* [out][in] */ DWORD *pcbRangeEnd) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetForgottenKnowledgeRecoveryRange( 
            /* [in] */ const SYNC_RANGE *pRange) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OnProgress( 
            /* [in] */ SYNC_PROVIDER_ROLE provider,
            /* [in] */ SYNC_PROGRESS_STAGE syncStage,
            /* [in] */ DWORD dwCompletedWork,
            /* [in] */ DWORD dwTotalWork) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncSessionStateVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncSessionState * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncSessionState * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncSessionState * This);
        
        HRESULT ( STDMETHODCALLTYPE *IsCanceled )( 
            ISyncSessionState * This,
            /* [out] */ BOOL *pfIsCanceled);
        
        HRESULT ( STDMETHODCALLTYPE *GetInfoForChangeApplication )( 
            ISyncSessionState * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeApplierInfo,
            /* [out][in] */ DWORD *pcbChangeApplierInfo);
        
        HRESULT ( STDMETHODCALLTYPE *LoadInfoFromChangeApplication )( 
            ISyncSessionState * This,
            /* [size_is][in] */ const BYTE *pbChangeApplierInfo,
            /* [in] */ DWORD cbChangeApplierInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetForgottenKnowledgeRecoveryRangeStart )( 
            ISyncSessionState * This,
            /* [size_is][unique][out][in] */ BYTE *pbRangeStart,
            /* [out][in] */ DWORD *pcbRangeStart);
        
        HRESULT ( STDMETHODCALLTYPE *GetForgottenKnowledgeRecoveryRangeEnd )( 
            ISyncSessionState * This,
            /* [size_is][unique][out][in] */ BYTE *pbRangeEnd,
            /* [out][in] */ DWORD *pcbRangeEnd);
        
        HRESULT ( STDMETHODCALLTYPE *SetForgottenKnowledgeRecoveryRange )( 
            ISyncSessionState * This,
            /* [in] */ const SYNC_RANGE *pRange);
        
        HRESULT ( STDMETHODCALLTYPE *OnProgress )( 
            ISyncSessionState * This,
            /* [in] */ SYNC_PROVIDER_ROLE provider,
            /* [in] */ SYNC_PROGRESS_STAGE syncStage,
            /* [in] */ DWORD dwCompletedWork,
            /* [in] */ DWORD dwTotalWork);
        
        END_INTERFACE
    } ISyncSessionStateVtbl;

    interface ISyncSessionState
    {
        CONST_VTBL struct ISyncSessionStateVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncSessionState_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncSessionState_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncSessionState_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncSessionState_IsCanceled(This,pfIsCanceled)	\
    ( (This)->lpVtbl -> IsCanceled(This,pfIsCanceled) ) 

#define ISyncSessionState_GetInfoForChangeApplication(This,pbChangeApplierInfo,pcbChangeApplierInfo)	\
    ( (This)->lpVtbl -> GetInfoForChangeApplication(This,pbChangeApplierInfo,pcbChangeApplierInfo) ) 

#define ISyncSessionState_LoadInfoFromChangeApplication(This,pbChangeApplierInfo,cbChangeApplierInfo)	\
    ( (This)->lpVtbl -> LoadInfoFromChangeApplication(This,pbChangeApplierInfo,cbChangeApplierInfo) ) 

#define ISyncSessionState_GetForgottenKnowledgeRecoveryRangeStart(This,pbRangeStart,pcbRangeStart)	\
    ( (This)->lpVtbl -> GetForgottenKnowledgeRecoveryRangeStart(This,pbRangeStart,pcbRangeStart) ) 

#define ISyncSessionState_GetForgottenKnowledgeRecoveryRangeEnd(This,pbRangeEnd,pcbRangeEnd)	\
    ( (This)->lpVtbl -> GetForgottenKnowledgeRecoveryRangeEnd(This,pbRangeEnd,pcbRangeEnd) ) 

#define ISyncSessionState_SetForgottenKnowledgeRecoveryRange(This,pRange)	\
    ( (This)->lpVtbl -> SetForgottenKnowledgeRecoveryRange(This,pRange) ) 

#define ISyncSessionState_OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork)	\
    ( (This)->lpVtbl -> OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncSessionState_INTERFACE_DEFINED__ */


#ifndef __ISyncSessionExtendedErrorInfo_INTERFACE_DEFINED__
#define __ISyncSessionExtendedErrorInfo_INTERFACE_DEFINED__

/* interface ISyncSessionExtendedErrorInfo */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncSessionExtendedErrorInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("326c6810-790a-409b-b741-6999388761eb")
    ISyncSessionExtendedErrorInfo : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetSyncProviderWithError( 
            /* [retval][out] */ ISyncProvider **ppProviderWithError) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncSessionExtendedErrorInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncSessionExtendedErrorInfo * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncSessionExtendedErrorInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncSessionExtendedErrorInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetSyncProviderWithError )( 
            ISyncSessionExtendedErrorInfo * This,
            /* [retval][out] */ ISyncProvider **ppProviderWithError);
        
        END_INTERFACE
    } ISyncSessionExtendedErrorInfoVtbl;

    interface ISyncSessionExtendedErrorInfo
    {
        CONST_VTBL struct ISyncSessionExtendedErrorInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncSessionExtendedErrorInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncSessionExtendedErrorInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncSessionExtendedErrorInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncSessionExtendedErrorInfo_GetSyncProviderWithError(This,ppProviderWithError)	\
    ( (This)->lpVtbl -> GetSyncProviderWithError(This,ppProviderWithError) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncSessionExtendedErrorInfo_INTERFACE_DEFINED__ */


#ifndef __ISyncSessionState2_INTERFACE_DEFINED__
#define __ISyncSessionState2_INTERFACE_DEFINED__

/* interface ISyncSessionState2 */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncSessionState2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9e37cfa3-9e38-4c61-9ca3-ffe810b45ca2")
    ISyncSessionState2 : public ISyncSessionState
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SetProviderWithError( 
            /* [in] */ BOOL fSelf) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSessionErrorStatus( 
            /* [retval][out] */ HRESULT *phrSessionError) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncSessionState2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncSessionState2 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncSessionState2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncSessionState2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *IsCanceled )( 
            ISyncSessionState2 * This,
            /* [out] */ BOOL *pfIsCanceled);
        
        HRESULT ( STDMETHODCALLTYPE *GetInfoForChangeApplication )( 
            ISyncSessionState2 * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeApplierInfo,
            /* [out][in] */ DWORD *pcbChangeApplierInfo);
        
        HRESULT ( STDMETHODCALLTYPE *LoadInfoFromChangeApplication )( 
            ISyncSessionState2 * This,
            /* [size_is][in] */ const BYTE *pbChangeApplierInfo,
            /* [in] */ DWORD cbChangeApplierInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetForgottenKnowledgeRecoveryRangeStart )( 
            ISyncSessionState2 * This,
            /* [size_is][unique][out][in] */ BYTE *pbRangeStart,
            /* [out][in] */ DWORD *pcbRangeStart);
        
        HRESULT ( STDMETHODCALLTYPE *GetForgottenKnowledgeRecoveryRangeEnd )( 
            ISyncSessionState2 * This,
            /* [size_is][unique][out][in] */ BYTE *pbRangeEnd,
            /* [out][in] */ DWORD *pcbRangeEnd);
        
        HRESULT ( STDMETHODCALLTYPE *SetForgottenKnowledgeRecoveryRange )( 
            ISyncSessionState2 * This,
            /* [in] */ const SYNC_RANGE *pRange);
        
        HRESULT ( STDMETHODCALLTYPE *OnProgress )( 
            ISyncSessionState2 * This,
            /* [in] */ SYNC_PROVIDER_ROLE provider,
            /* [in] */ SYNC_PROGRESS_STAGE syncStage,
            /* [in] */ DWORD dwCompletedWork,
            /* [in] */ DWORD dwTotalWork);
        
        HRESULT ( STDMETHODCALLTYPE *SetProviderWithError )( 
            ISyncSessionState2 * This,
            /* [in] */ BOOL fSelf);
        
        HRESULT ( STDMETHODCALLTYPE *GetSessionErrorStatus )( 
            ISyncSessionState2 * This,
            /* [retval][out] */ HRESULT *phrSessionError);
        
        END_INTERFACE
    } ISyncSessionState2Vtbl;

    interface ISyncSessionState2
    {
        CONST_VTBL struct ISyncSessionState2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncSessionState2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncSessionState2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncSessionState2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncSessionState2_IsCanceled(This,pfIsCanceled)	\
    ( (This)->lpVtbl -> IsCanceled(This,pfIsCanceled) ) 

#define ISyncSessionState2_GetInfoForChangeApplication(This,pbChangeApplierInfo,pcbChangeApplierInfo)	\
    ( (This)->lpVtbl -> GetInfoForChangeApplication(This,pbChangeApplierInfo,pcbChangeApplierInfo) ) 

#define ISyncSessionState2_LoadInfoFromChangeApplication(This,pbChangeApplierInfo,cbChangeApplierInfo)	\
    ( (This)->lpVtbl -> LoadInfoFromChangeApplication(This,pbChangeApplierInfo,cbChangeApplierInfo) ) 

#define ISyncSessionState2_GetForgottenKnowledgeRecoveryRangeStart(This,pbRangeStart,pcbRangeStart)	\
    ( (This)->lpVtbl -> GetForgottenKnowledgeRecoveryRangeStart(This,pbRangeStart,pcbRangeStart) ) 

#define ISyncSessionState2_GetForgottenKnowledgeRecoveryRangeEnd(This,pbRangeEnd,pcbRangeEnd)	\
    ( (This)->lpVtbl -> GetForgottenKnowledgeRecoveryRangeEnd(This,pbRangeEnd,pcbRangeEnd) ) 

#define ISyncSessionState2_SetForgottenKnowledgeRecoveryRange(This,pRange)	\
    ( (This)->lpVtbl -> SetForgottenKnowledgeRecoveryRange(This,pRange) ) 

#define ISyncSessionState2_OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork)	\
    ( (This)->lpVtbl -> OnProgress(This,provider,syncStage,dwCompletedWork,dwTotalWork) ) 


#define ISyncSessionState2_SetProviderWithError(This,fSelf)	\
    ( (This)->lpVtbl -> SetProviderWithError(This,fSelf) ) 

#define ISyncSessionState2_GetSessionErrorStatus(This,phrSessionError)	\
    ( (This)->lpVtbl -> GetSessionErrorStatus(This,phrSessionError) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncSessionState2_INTERFACE_DEFINED__ */


#ifndef __ISyncFilterInfo_INTERFACE_DEFINED__
#define __ISyncFilterInfo_INTERFACE_DEFINED__

/* interface ISyncFilterInfo */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncFilterInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("794eaaf8-3f2e-47e6-9728-17e6fcf94cb7")
    ISyncFilterInfo : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Serialize( 
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pcbBuffer) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncFilterInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncFilterInfo * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncFilterInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncFilterInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncFilterInfo * This,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pcbBuffer);
        
        END_INTERFACE
    } ISyncFilterInfoVtbl;

    interface ISyncFilterInfo
    {
        CONST_VTBL struct ISyncFilterInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncFilterInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncFilterInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncFilterInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncFilterInfo_Serialize(This,pbBuffer,pcbBuffer)	\
    ( (This)->lpVtbl -> Serialize(This,pbBuffer,pcbBuffer) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncFilterInfo_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_winsync_0000_0029 */
/* [local] */ 

#define SYNC_FILTER_INFO_FLAG_ITEM_LIST          0x00000001
#define SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST   0x00000002


extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0029_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0029_v0_0_s_ifspec;

#ifndef __ISyncFilterInfo2_INTERFACE_DEFINED__
#define __ISyncFilterInfo2_INTERFACE_DEFINED__

/* interface ISyncFilterInfo2 */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncFilterInfo2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("19b394ba-e3d0-468c-934d-321968b2ab34")
    ISyncFilterInfo2 : public ISyncFilterInfo
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetFlags( 
            /* [out] */ DWORD *pdwFlags) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncFilterInfo2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncFilterInfo2 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncFilterInfo2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncFilterInfo2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncFilterInfo2 * This,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pcbBuffer);
        
        HRESULT ( STDMETHODCALLTYPE *GetFlags )( 
            ISyncFilterInfo2 * This,
            /* [out] */ DWORD *pdwFlags);
        
        END_INTERFACE
    } ISyncFilterInfo2Vtbl;

    interface ISyncFilterInfo2
    {
        CONST_VTBL struct ISyncFilterInfo2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncFilterInfo2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncFilterInfo2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncFilterInfo2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncFilterInfo2_Serialize(This,pbBuffer,pcbBuffer)	\
    ( (This)->lpVtbl -> Serialize(This,pbBuffer,pcbBuffer) ) 


#define ISyncFilterInfo2_GetFlags(This,pdwFlags)	\
    ( (This)->lpVtbl -> GetFlags(This,pdwFlags) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncFilterInfo2_INTERFACE_DEFINED__ */


#ifndef __IChangeUnitListFilterInfo_INTERFACE_DEFINED__
#define __IChangeUnitListFilterInfo_INTERFACE_DEFINED__

/* interface IChangeUnitListFilterInfo */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IChangeUnitListFilterInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("f2837671-0bdf-43fa-b502-232375fb50c2")
    IChangeUnitListFilterInfo : public ISyncFilterInfo
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Initialize( 
            /* [size_is][in] */ const BYTE *const *ppbChangeUnitIds,
            /* [in] */ DWORD dwChangeUnitCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitIdCount( 
            /* [retval][out] */ DWORD *pdwChangeUnitIdCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitId( 
            /* [in] */ DWORD dwChangeUnitIdIndex,
            /* [size_is][unique][out][in] */ BYTE *pbChangeUnitId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IChangeUnitListFilterInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IChangeUnitListFilterInfo * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IChangeUnitListFilterInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IChangeUnitListFilterInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            IChangeUnitListFilterInfo * This,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pcbBuffer);
        
        HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            IChangeUnitListFilterInfo * This,
            /* [size_is][in] */ const BYTE *const *ppbChangeUnitIds,
            /* [in] */ DWORD dwChangeUnitCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitIdCount )( 
            IChangeUnitListFilterInfo * This,
            /* [retval][out] */ DWORD *pdwChangeUnitIdCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitId )( 
            IChangeUnitListFilterInfo * This,
            /* [in] */ DWORD dwChangeUnitIdIndex,
            /* [size_is][unique][out][in] */ BYTE *pbChangeUnitId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        END_INTERFACE
    } IChangeUnitListFilterInfoVtbl;

    interface IChangeUnitListFilterInfo
    {
        CONST_VTBL struct IChangeUnitListFilterInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IChangeUnitListFilterInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IChangeUnitListFilterInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IChangeUnitListFilterInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IChangeUnitListFilterInfo_Serialize(This,pbBuffer,pcbBuffer)	\
    ( (This)->lpVtbl -> Serialize(This,pbBuffer,pcbBuffer) ) 


#define IChangeUnitListFilterInfo_Initialize(This,ppbChangeUnitIds,dwChangeUnitCount)	\
    ( (This)->lpVtbl -> Initialize(This,ppbChangeUnitIds,dwChangeUnitCount) ) 

#define IChangeUnitListFilterInfo_GetChangeUnitIdCount(This,pdwChangeUnitIdCount)	\
    ( (This)->lpVtbl -> GetChangeUnitIdCount(This,pdwChangeUnitIdCount) ) 

#define IChangeUnitListFilterInfo_GetChangeUnitId(This,dwChangeUnitIdIndex,pbChangeUnitId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetChangeUnitId(This,dwChangeUnitIdIndex,pbChangeUnitId,pcbIdSize) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IChangeUnitListFilterInfo_INTERFACE_DEFINED__ */


#ifndef __IEnumSyncChanges_INTERFACE_DEFINED__
#define __IEnumSyncChanges_INTERFACE_DEFINED__

/* interface IEnumSyncChanges */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumSyncChanges;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5f86be4a-5e78-4e32-ac1c-c24fd223ef85")
    IEnumSyncChanges : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [range][in] */ ULONG cChanges,
            /* [length_is][size_is][out] */ ISyncChange **ppChange,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cChanges) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumSyncChanges **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumSyncChangesVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumSyncChanges * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumSyncChanges * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumSyncChanges * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumSyncChanges * This,
            /* [range][in] */ ULONG cChanges,
            /* [length_is][size_is][out] */ ISyncChange **ppChange,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumSyncChanges * This,
            /* [in] */ ULONG cChanges);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumSyncChanges * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumSyncChanges * This,
            /* [out] */ IEnumSyncChanges **ppEnum);
        
        END_INTERFACE
    } IEnumSyncChangesVtbl;

    interface IEnumSyncChanges
    {
        CONST_VTBL struct IEnumSyncChangesVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumSyncChanges_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumSyncChanges_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumSyncChanges_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumSyncChanges_Next(This,cChanges,ppChange,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cChanges,ppChange,pcFetched) ) 

#define IEnumSyncChanges_Skip(This,cChanges)	\
    ( (This)->lpVtbl -> Skip(This,cChanges) ) 

#define IEnumSyncChanges_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumSyncChanges_Clone(This,ppEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumSyncChanges_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeBuilder_INTERFACE_DEFINED__
#define __ISyncChangeBuilder_INTERFACE_DEFINED__

/* interface ISyncChangeBuilder */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeBuilder;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("56f14771-8677-484f-a170-e386e418a676")
    ISyncChangeBuilder : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE AddChangeUnitMetadata( 
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ const SYNC_VERSION *pChangeUnitVersion) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeBuilderVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeBuilder * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeBuilder * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeBuilder * This);
        
        HRESULT ( STDMETHODCALLTYPE *AddChangeUnitMetadata )( 
            ISyncChangeBuilder * This,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [in] */ const SYNC_VERSION *pChangeUnitVersion);
        
        END_INTERFACE
    } ISyncChangeBuilderVtbl;

    interface ISyncChangeBuilder
    {
        CONST_VTBL struct ISyncChangeBuilderVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeBuilder_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeBuilder_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeBuilder_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeBuilder_AddChangeUnitMetadata(This,pbChangeUnitId,pChangeUnitVersion)	\
    ( (This)->lpVtbl -> AddChangeUnitMetadata(This,pbChangeUnitId,pChangeUnitVersion) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeBuilder_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_winsync_0000_0033 */
/* [local] */ 

#define SYNC_CHANGE_FLAG_DELETED                 0x00000001
#define SYNC_CHANGE_FLAG_DOES_NOT_EXIST          0x00000002


extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0033_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_winsync_0000_0033_v0_0_s_ifspec;

#ifndef __ISyncChangeBatchBase_INTERFACE_DEFINED__
#define __ISyncChangeBatchBase_INTERFACE_DEFINED__

/* interface ISyncChangeBatchBase */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeBatchBase;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("52F6E694-6A71-4494-A184-A8311BF5D227")
    ISyncChangeBatchBase : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetChangeEnumerator( 
            /* [out] */ IEnumSyncChanges **ppEnum) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetIsLastBatch( 
            /* [out] */ BOOL *pfLastBatch) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetWorkEstimateForBatch( 
            /* [out] */ DWORD *pdwWorkForBatch) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRemainingWorkEstimateForSession( 
            /* [out] */ DWORD *pdwRemainingWorkForSession) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE BeginOrderedGroup( 
            /* [in] */ const BYTE *pbLowerBound) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EndOrderedGroup( 
            /* [in] */ const BYTE *pbUpperBound,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE AddItemMetadataToGroup( 
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [unique][out][in] */ ISyncChangeBuilder **ppChangeBuilder) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLearnedKnowledge( 
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetPrerequisiteKnowledge( 
            /* [out] */ ISyncKnowledge **ppPrerequisteKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSourceForgottenKnowledge( 
            /* [out] */ IForgottenKnowledge **ppSourceForgottenKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetLastBatch( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetWorkEstimateForBatch( 
            /* [in] */ DWORD dwWorkForBatch) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetRemainingWorkEstimateForSession( 
            /* [in] */ DWORD dwRemainingWorkForSession) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Serialize( 
            /* [size_is][unique][out][in] */ BYTE *pbChangeBatch,
            /* [out][in] */ DWORD *pcbChangeBatch) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeBatchBaseVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeBatchBase * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeBatchBase * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeBatchBase * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeEnumerator )( 
            ISyncChangeBatchBase * This,
            /* [out] */ IEnumSyncChanges **ppEnum);
        
        HRESULT ( STDMETHODCALLTYPE *GetIsLastBatch )( 
            ISyncChangeBatchBase * This,
            /* [out] */ BOOL *pfLastBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetWorkEstimateForBatch )( 
            ISyncChangeBatchBase * This,
            /* [out] */ DWORD *pdwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetRemainingWorkEstimateForSession )( 
            ISyncChangeBatchBase * This,
            /* [out] */ DWORD *pdwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *BeginOrderedGroup )( 
            ISyncChangeBatchBase * This,
            /* [in] */ const BYTE *pbLowerBound);
        
        HRESULT ( STDMETHODCALLTYPE *EndOrderedGroup )( 
            ISyncChangeBatchBase * This,
            /* [in] */ const BYTE *pbUpperBound,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *AddItemMetadataToGroup )( 
            ISyncChangeBatchBase * This,
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [unique][out][in] */ ISyncChangeBuilder **ppChangeBuilder);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledge )( 
            ISyncChangeBatchBase * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetPrerequisiteKnowledge )( 
            ISyncChangeBatchBase * This,
            /* [out] */ ISyncKnowledge **ppPrerequisteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceForgottenKnowledge )( 
            ISyncChangeBatchBase * This,
            /* [out] */ IForgottenKnowledge **ppSourceForgottenKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLastBatch )( 
            ISyncChangeBatchBase * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetWorkEstimateForBatch )( 
            ISyncChangeBatchBase * This,
            /* [in] */ DWORD dwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SetRemainingWorkEstimateForSession )( 
            ISyncChangeBatchBase * This,
            /* [in] */ DWORD dwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncChangeBatchBase * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeBatch,
            /* [out][in] */ DWORD *pcbChangeBatch);
        
        END_INTERFACE
    } ISyncChangeBatchBaseVtbl;

    interface ISyncChangeBatchBase
    {
        CONST_VTBL struct ISyncChangeBatchBaseVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeBatchBase_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeBatchBase_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeBatchBase_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeBatchBase_GetChangeEnumerator(This,ppEnum)	\
    ( (This)->lpVtbl -> GetChangeEnumerator(This,ppEnum) ) 

#define ISyncChangeBatchBase_GetIsLastBatch(This,pfLastBatch)	\
    ( (This)->lpVtbl -> GetIsLastBatch(This,pfLastBatch) ) 

#define ISyncChangeBatchBase_GetWorkEstimateForBatch(This,pdwWorkForBatch)	\
    ( (This)->lpVtbl -> GetWorkEstimateForBatch(This,pdwWorkForBatch) ) 

#define ISyncChangeBatchBase_GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession) ) 

#define ISyncChangeBatchBase_BeginOrderedGroup(This,pbLowerBound)	\
    ( (This)->lpVtbl -> BeginOrderedGroup(This,pbLowerBound) ) 

#define ISyncChangeBatchBase_EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge)	\
    ( (This)->lpVtbl -> EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge) ) 

#define ISyncChangeBatchBase_AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder)	\
    ( (This)->lpVtbl -> AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder) ) 

#define ISyncChangeBatchBase_GetLearnedKnowledge(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledge(This,ppLearnedKnowledge) ) 

#define ISyncChangeBatchBase_GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge)	\
    ( (This)->lpVtbl -> GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge) ) 

#define ISyncChangeBatchBase_GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge) ) 

#define ISyncChangeBatchBase_SetLastBatch(This)	\
    ( (This)->lpVtbl -> SetLastBatch(This) ) 

#define ISyncChangeBatchBase_SetWorkEstimateForBatch(This,dwWorkForBatch)	\
    ( (This)->lpVtbl -> SetWorkEstimateForBatch(This,dwWorkForBatch) ) 

#define ISyncChangeBatchBase_SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession) ) 

#define ISyncChangeBatchBase_Serialize(This,pbChangeBatch,pcbChangeBatch)	\
    ( (This)->lpVtbl -> Serialize(This,pbChangeBatch,pcbChangeBatch) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeBatchBase_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeBatch_INTERFACE_DEFINED__
#define __ISyncChangeBatch_INTERFACE_DEFINED__

/* interface ISyncChangeBatch */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeBatch;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("70c64dee-380f-4c2e-8f70-31c55bd5f9b3")
    ISyncChangeBatch : public ISyncChangeBatchBase
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE BeginUnorderedGroup( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EndUnorderedGroup( 
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge,
            /* [in] */ BOOL fAllChangesForKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE AddLoggedConflict( 
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [in] */ ISyncKnowledge *pConflictKnowledge,
            /* [out] */ ISyncChangeBuilder **ppChangeBuilder) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeBatchVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeBatch * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeBatch * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeBatch * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeEnumerator )( 
            ISyncChangeBatch * This,
            /* [out] */ IEnumSyncChanges **ppEnum);
        
        HRESULT ( STDMETHODCALLTYPE *GetIsLastBatch )( 
            ISyncChangeBatch * This,
            /* [out] */ BOOL *pfLastBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetWorkEstimateForBatch )( 
            ISyncChangeBatch * This,
            /* [out] */ DWORD *pdwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetRemainingWorkEstimateForSession )( 
            ISyncChangeBatch * This,
            /* [out] */ DWORD *pdwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *BeginOrderedGroup )( 
            ISyncChangeBatch * This,
            /* [in] */ const BYTE *pbLowerBound);
        
        HRESULT ( STDMETHODCALLTYPE *EndOrderedGroup )( 
            ISyncChangeBatch * This,
            /* [in] */ const BYTE *pbUpperBound,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *AddItemMetadataToGroup )( 
            ISyncChangeBatch * This,
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [unique][out][in] */ ISyncChangeBuilder **ppChangeBuilder);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledge )( 
            ISyncChangeBatch * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetPrerequisiteKnowledge )( 
            ISyncChangeBatch * This,
            /* [out] */ ISyncKnowledge **ppPrerequisteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceForgottenKnowledge )( 
            ISyncChangeBatch * This,
            /* [out] */ IForgottenKnowledge **ppSourceForgottenKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLastBatch )( 
            ISyncChangeBatch * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetWorkEstimateForBatch )( 
            ISyncChangeBatch * This,
            /* [in] */ DWORD dwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SetRemainingWorkEstimateForSession )( 
            ISyncChangeBatch * This,
            /* [in] */ DWORD dwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncChangeBatch * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeBatch,
            /* [out][in] */ DWORD *pcbChangeBatch);
        
        HRESULT ( STDMETHODCALLTYPE *BeginUnorderedGroup )( 
            ISyncChangeBatch * This);
        
        HRESULT ( STDMETHODCALLTYPE *EndUnorderedGroup )( 
            ISyncChangeBatch * This,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge,
            /* [in] */ BOOL fAllChangesForKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *AddLoggedConflict )( 
            ISyncChangeBatch * This,
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [in] */ ISyncKnowledge *pConflictKnowledge,
            /* [out] */ ISyncChangeBuilder **ppChangeBuilder);
        
        END_INTERFACE
    } ISyncChangeBatchVtbl;

    interface ISyncChangeBatch
    {
        CONST_VTBL struct ISyncChangeBatchVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeBatch_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeBatch_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeBatch_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeBatch_GetChangeEnumerator(This,ppEnum)	\
    ( (This)->lpVtbl -> GetChangeEnumerator(This,ppEnum) ) 

#define ISyncChangeBatch_GetIsLastBatch(This,pfLastBatch)	\
    ( (This)->lpVtbl -> GetIsLastBatch(This,pfLastBatch) ) 

#define ISyncChangeBatch_GetWorkEstimateForBatch(This,pdwWorkForBatch)	\
    ( (This)->lpVtbl -> GetWorkEstimateForBatch(This,pdwWorkForBatch) ) 

#define ISyncChangeBatch_GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession) ) 

#define ISyncChangeBatch_BeginOrderedGroup(This,pbLowerBound)	\
    ( (This)->lpVtbl -> BeginOrderedGroup(This,pbLowerBound) ) 

#define ISyncChangeBatch_EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge)	\
    ( (This)->lpVtbl -> EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge) ) 

#define ISyncChangeBatch_AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder)	\
    ( (This)->lpVtbl -> AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder) ) 

#define ISyncChangeBatch_GetLearnedKnowledge(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledge(This,ppLearnedKnowledge) ) 

#define ISyncChangeBatch_GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge)	\
    ( (This)->lpVtbl -> GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge) ) 

#define ISyncChangeBatch_GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge) ) 

#define ISyncChangeBatch_SetLastBatch(This)	\
    ( (This)->lpVtbl -> SetLastBatch(This) ) 

#define ISyncChangeBatch_SetWorkEstimateForBatch(This,dwWorkForBatch)	\
    ( (This)->lpVtbl -> SetWorkEstimateForBatch(This,dwWorkForBatch) ) 

#define ISyncChangeBatch_SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession) ) 

#define ISyncChangeBatch_Serialize(This,pbChangeBatch,pcbChangeBatch)	\
    ( (This)->lpVtbl -> Serialize(This,pbChangeBatch,pcbChangeBatch) ) 


#define ISyncChangeBatch_BeginUnorderedGroup(This)	\
    ( (This)->lpVtbl -> BeginUnorderedGroup(This) ) 

#define ISyncChangeBatch_EndUnorderedGroup(This,pMadeWithKnowledge,fAllChangesForKnowledge)	\
    ( (This)->lpVtbl -> EndUnorderedGroup(This,pMadeWithKnowledge,fAllChangesForKnowledge) ) 

#define ISyncChangeBatch_AddLoggedConflict(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,pConflictKnowledge,ppChangeBuilder)	\
    ( (This)->lpVtbl -> AddLoggedConflict(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,pConflictKnowledge,ppChangeBuilder) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeBatch_INTERFACE_DEFINED__ */


#ifndef __ISyncFullEnumerationChangeBatch_INTERFACE_DEFINED__
#define __ISyncFullEnumerationChangeBatch_INTERFACE_DEFINED__

/* interface ISyncFullEnumerationChangeBatch */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncFullEnumerationChangeBatch;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("EF64197D-4F44-4ea2-B355-4524713E3BED")
    ISyncFullEnumerationChangeBatch : public ISyncChangeBatchBase
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetLearnedKnowledgeAfterRecoveryComplete( 
            /* [out] */ ISyncKnowledge **ppLearnedKnowledgeAfterRecoveryComplete) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClosedLowerBoundItemId( 
            /* [size_is][unique][out][in] */ BYTE *pbClosedLowerBoundItemId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetClosedUpperBoundItemId( 
            /* [size_is][unique][out][in] */ BYTE *pbClosedUpperBoundItemId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncFullEnumerationChangeBatchVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncFullEnumerationChangeBatch * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncFullEnumerationChangeBatch * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeEnumerator )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ IEnumSyncChanges **ppEnum);
        
        HRESULT ( STDMETHODCALLTYPE *GetIsLastBatch )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ BOOL *pfLastBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetWorkEstimateForBatch )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ DWORD *pdwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetRemainingWorkEstimateForSession )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ DWORD *pdwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *BeginOrderedGroup )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [in] */ const BYTE *pbLowerBound);
        
        HRESULT ( STDMETHODCALLTYPE *EndOrderedGroup )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [in] */ const BYTE *pbUpperBound,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *AddItemMetadataToGroup )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [unique][out][in] */ ISyncChangeBuilder **ppChangeBuilder);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledge )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetPrerequisiteKnowledge )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ ISyncKnowledge **ppPrerequisteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceForgottenKnowledge )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ IForgottenKnowledge **ppSourceForgottenKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLastBatch )( 
            ISyncFullEnumerationChangeBatch * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetWorkEstimateForBatch )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [in] */ DWORD dwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SetRemainingWorkEstimateForSession )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [in] */ DWORD dwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeBatch,
            /* [out][in] */ DWORD *pcbChangeBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledgeAfterRecoveryComplete )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledgeAfterRecoveryComplete);
        
        HRESULT ( STDMETHODCALLTYPE *GetClosedLowerBoundItemId )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [size_is][unique][out][in] */ BYTE *pbClosedLowerBoundItemId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetClosedUpperBoundItemId )( 
            ISyncFullEnumerationChangeBatch * This,
            /* [size_is][unique][out][in] */ BYTE *pbClosedUpperBoundItemId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        END_INTERFACE
    } ISyncFullEnumerationChangeBatchVtbl;

    interface ISyncFullEnumerationChangeBatch
    {
        CONST_VTBL struct ISyncFullEnumerationChangeBatchVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncFullEnumerationChangeBatch_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncFullEnumerationChangeBatch_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncFullEnumerationChangeBatch_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncFullEnumerationChangeBatch_GetChangeEnumerator(This,ppEnum)	\
    ( (This)->lpVtbl -> GetChangeEnumerator(This,ppEnum) ) 

#define ISyncFullEnumerationChangeBatch_GetIsLastBatch(This,pfLastBatch)	\
    ( (This)->lpVtbl -> GetIsLastBatch(This,pfLastBatch) ) 

#define ISyncFullEnumerationChangeBatch_GetWorkEstimateForBatch(This,pdwWorkForBatch)	\
    ( (This)->lpVtbl -> GetWorkEstimateForBatch(This,pdwWorkForBatch) ) 

#define ISyncFullEnumerationChangeBatch_GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession) ) 

#define ISyncFullEnumerationChangeBatch_BeginOrderedGroup(This,pbLowerBound)	\
    ( (This)->lpVtbl -> BeginOrderedGroup(This,pbLowerBound) ) 

#define ISyncFullEnumerationChangeBatch_EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge)	\
    ( (This)->lpVtbl -> EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge) ) 

#define ISyncFullEnumerationChangeBatch_AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder)	\
    ( (This)->lpVtbl -> AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder) ) 

#define ISyncFullEnumerationChangeBatch_GetLearnedKnowledge(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledge(This,ppLearnedKnowledge) ) 

#define ISyncFullEnumerationChangeBatch_GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge)	\
    ( (This)->lpVtbl -> GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge) ) 

#define ISyncFullEnumerationChangeBatch_GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge) ) 

#define ISyncFullEnumerationChangeBatch_SetLastBatch(This)	\
    ( (This)->lpVtbl -> SetLastBatch(This) ) 

#define ISyncFullEnumerationChangeBatch_SetWorkEstimateForBatch(This,dwWorkForBatch)	\
    ( (This)->lpVtbl -> SetWorkEstimateForBatch(This,dwWorkForBatch) ) 

#define ISyncFullEnumerationChangeBatch_SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession) ) 

#define ISyncFullEnumerationChangeBatch_Serialize(This,pbChangeBatch,pcbChangeBatch)	\
    ( (This)->lpVtbl -> Serialize(This,pbChangeBatch,pcbChangeBatch) ) 


#define ISyncFullEnumerationChangeBatch_GetLearnedKnowledgeAfterRecoveryComplete(This,ppLearnedKnowledgeAfterRecoveryComplete)	\
    ( (This)->lpVtbl -> GetLearnedKnowledgeAfterRecoveryComplete(This,ppLearnedKnowledgeAfterRecoveryComplete) ) 

#define ISyncFullEnumerationChangeBatch_GetClosedLowerBoundItemId(This,pbClosedLowerBoundItemId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetClosedLowerBoundItemId(This,pbClosedLowerBoundItemId,pcbIdSize) ) 

#define ISyncFullEnumerationChangeBatch_GetClosedUpperBoundItemId(This,pbClosedUpperBoundItemId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetClosedUpperBoundItemId(This,pbClosedUpperBoundItemId,pcbIdSize) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncFullEnumerationChangeBatch_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeBatchWithPrerequisite_INTERFACE_DEFINED__
#define __ISyncChangeBatchWithPrerequisite_INTERFACE_DEFINED__

/* interface ISyncChangeBatchWithPrerequisite */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeBatchWithPrerequisite;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("097f13be-5b92-4048-b3f2-7b42a2515e07")
    ISyncChangeBatchWithPrerequisite : public ISyncChangeBatchBase
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SetPrerequisiteKnowledge( 
            /* [in] */ ISyncKnowledge *pPrerequisiteKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLearnedKnowledgeWithPrerequisite( 
            /* [in] */ ISyncKnowledge *pDestinationKnowledge,
            /* [out] */ ISyncKnowledge **ppLearnedWithPrerequisiteKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLearnedForgottenKnowledge( 
            /* [out] */ IForgottenKnowledge **ppLearnedForgottenKnowledge) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeBatchWithPrerequisiteVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeBatchWithPrerequisite * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeBatchWithPrerequisite * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeEnumerator )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ IEnumSyncChanges **ppEnum);
        
        HRESULT ( STDMETHODCALLTYPE *GetIsLastBatch )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ BOOL *pfLastBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetWorkEstimateForBatch )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ DWORD *pdwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetRemainingWorkEstimateForSession )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ DWORD *pdwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *BeginOrderedGroup )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ const BYTE *pbLowerBound);
        
        HRESULT ( STDMETHODCALLTYPE *EndOrderedGroup )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ const BYTE *pbUpperBound,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *AddItemMetadataToGroup )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [unique][out][in] */ ISyncChangeBuilder **ppChangeBuilder);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledge )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetPrerequisiteKnowledge )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ ISyncKnowledge **ppPrerequisteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceForgottenKnowledge )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ IForgottenKnowledge **ppSourceForgottenKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLastBatch )( 
            ISyncChangeBatchWithPrerequisite * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetWorkEstimateForBatch )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ DWORD dwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SetRemainingWorkEstimateForSession )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ DWORD dwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeBatch,
            /* [out][in] */ DWORD *pcbChangeBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SetPrerequisiteKnowledge )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ ISyncKnowledge *pPrerequisiteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledgeWithPrerequisite )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [in] */ ISyncKnowledge *pDestinationKnowledge,
            /* [out] */ ISyncKnowledge **ppLearnedWithPrerequisiteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedForgottenKnowledge )( 
            ISyncChangeBatchWithPrerequisite * This,
            /* [out] */ IForgottenKnowledge **ppLearnedForgottenKnowledge);
        
        END_INTERFACE
    } ISyncChangeBatchWithPrerequisiteVtbl;

    interface ISyncChangeBatchWithPrerequisite
    {
        CONST_VTBL struct ISyncChangeBatchWithPrerequisiteVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeBatchWithPrerequisite_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeBatchWithPrerequisite_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeBatchWithPrerequisite_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeBatchWithPrerequisite_GetChangeEnumerator(This,ppEnum)	\
    ( (This)->lpVtbl -> GetChangeEnumerator(This,ppEnum) ) 

#define ISyncChangeBatchWithPrerequisite_GetIsLastBatch(This,pfLastBatch)	\
    ( (This)->lpVtbl -> GetIsLastBatch(This,pfLastBatch) ) 

#define ISyncChangeBatchWithPrerequisite_GetWorkEstimateForBatch(This,pdwWorkForBatch)	\
    ( (This)->lpVtbl -> GetWorkEstimateForBatch(This,pdwWorkForBatch) ) 

#define ISyncChangeBatchWithPrerequisite_GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession) ) 

#define ISyncChangeBatchWithPrerequisite_BeginOrderedGroup(This,pbLowerBound)	\
    ( (This)->lpVtbl -> BeginOrderedGroup(This,pbLowerBound) ) 

#define ISyncChangeBatchWithPrerequisite_EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge)	\
    ( (This)->lpVtbl -> EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge) ) 

#define ISyncChangeBatchWithPrerequisite_AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder)	\
    ( (This)->lpVtbl -> AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder) ) 

#define ISyncChangeBatchWithPrerequisite_GetLearnedKnowledge(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledge(This,ppLearnedKnowledge) ) 

#define ISyncChangeBatchWithPrerequisite_GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge)	\
    ( (This)->lpVtbl -> GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge) ) 

#define ISyncChangeBatchWithPrerequisite_GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge) ) 

#define ISyncChangeBatchWithPrerequisite_SetLastBatch(This)	\
    ( (This)->lpVtbl -> SetLastBatch(This) ) 

#define ISyncChangeBatchWithPrerequisite_SetWorkEstimateForBatch(This,dwWorkForBatch)	\
    ( (This)->lpVtbl -> SetWorkEstimateForBatch(This,dwWorkForBatch) ) 

#define ISyncChangeBatchWithPrerequisite_SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession) ) 

#define ISyncChangeBatchWithPrerequisite_Serialize(This,pbChangeBatch,pcbChangeBatch)	\
    ( (This)->lpVtbl -> Serialize(This,pbChangeBatch,pcbChangeBatch) ) 


#define ISyncChangeBatchWithPrerequisite_SetPrerequisiteKnowledge(This,pPrerequisiteKnowledge)	\
    ( (This)->lpVtbl -> SetPrerequisiteKnowledge(This,pPrerequisiteKnowledge) ) 

#define ISyncChangeBatchWithPrerequisite_GetLearnedKnowledgeWithPrerequisite(This,pDestinationKnowledge,ppLearnedWithPrerequisiteKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledgeWithPrerequisite(This,pDestinationKnowledge,ppLearnedWithPrerequisiteKnowledge) ) 

#define ISyncChangeBatchWithPrerequisite_GetLearnedForgottenKnowledge(This,ppLearnedForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedForgottenKnowledge(This,ppLearnedForgottenKnowledge) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeBatchWithPrerequisite_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeBatchBase2_INTERFACE_DEFINED__
#define __ISyncChangeBatchBase2_INTERFACE_DEFINED__

/* interface ISyncChangeBatchBase2 */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeBatchBase2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6fdb596a-d755-4584-bd0c-c0c23a548fbf")
    ISyncChangeBatchBase2 : public ISyncChangeBatchBase
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SerializeWithOptions( 
            /* [in] */ SYNC_SERIALIZATION_VERSION targetFormatVersion,
            /* [in] */ DWORD dwFlags,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pdwSerializedSize) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeBatchBase2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeBatchBase2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeBatchBase2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeEnumerator )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ IEnumSyncChanges **ppEnum);
        
        HRESULT ( STDMETHODCALLTYPE *GetIsLastBatch )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ BOOL *pfLastBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetWorkEstimateForBatch )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ DWORD *pdwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetRemainingWorkEstimateForSession )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ DWORD *pdwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *BeginOrderedGroup )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ const BYTE *pbLowerBound);
        
        HRESULT ( STDMETHODCALLTYPE *EndOrderedGroup )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ const BYTE *pbUpperBound,
            /* [in] */ ISyncKnowledge *pMadeWithKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *AddItemMetadataToGroup )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ const BYTE *pbOwnerReplicaId,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const SYNC_VERSION *pChangeVersion,
            /* [in] */ const SYNC_VERSION *pCreationVersion,
            /* [in] */ DWORD dwFlags,
            /* [in] */ DWORD dwWorkForChange,
            /* [unique][out][in] */ ISyncChangeBuilder **ppChangeBuilder);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledge )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetPrerequisiteKnowledge )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ ISyncKnowledge **ppPrerequisteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetSourceForgottenKnowledge )( 
            ISyncChangeBatchBase2 * This,
            /* [out] */ IForgottenKnowledge **ppSourceForgottenKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetLastBatch )( 
            ISyncChangeBatchBase2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetWorkEstimateForBatch )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ DWORD dwWorkForBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SetRemainingWorkEstimateForSession )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ DWORD dwRemainingWorkForSession);
        
        HRESULT ( STDMETHODCALLTYPE *Serialize )( 
            ISyncChangeBatchBase2 * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeBatch,
            /* [out][in] */ DWORD *pcbChangeBatch);
        
        HRESULT ( STDMETHODCALLTYPE *SerializeWithOptions )( 
            ISyncChangeBatchBase2 * This,
            /* [in] */ SYNC_SERIALIZATION_VERSION targetFormatVersion,
            /* [in] */ DWORD dwFlags,
            /* [size_is][unique][out][in] */ BYTE *pbBuffer,
            /* [out][in] */ DWORD *pdwSerializedSize);
        
        END_INTERFACE
    } ISyncChangeBatchBase2Vtbl;

    interface ISyncChangeBatchBase2
    {
        CONST_VTBL struct ISyncChangeBatchBase2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeBatchBase2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeBatchBase2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeBatchBase2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeBatchBase2_GetChangeEnumerator(This,ppEnum)	\
    ( (This)->lpVtbl -> GetChangeEnumerator(This,ppEnum) ) 

#define ISyncChangeBatchBase2_GetIsLastBatch(This,pfLastBatch)	\
    ( (This)->lpVtbl -> GetIsLastBatch(This,pfLastBatch) ) 

#define ISyncChangeBatchBase2_GetWorkEstimateForBatch(This,pdwWorkForBatch)	\
    ( (This)->lpVtbl -> GetWorkEstimateForBatch(This,pdwWorkForBatch) ) 

#define ISyncChangeBatchBase2_GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> GetRemainingWorkEstimateForSession(This,pdwRemainingWorkForSession) ) 

#define ISyncChangeBatchBase2_BeginOrderedGroup(This,pbLowerBound)	\
    ( (This)->lpVtbl -> BeginOrderedGroup(This,pbLowerBound) ) 

#define ISyncChangeBatchBase2_EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge)	\
    ( (This)->lpVtbl -> EndOrderedGroup(This,pbUpperBound,pMadeWithKnowledge) ) 

#define ISyncChangeBatchBase2_AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder)	\
    ( (This)->lpVtbl -> AddItemMetadataToGroup(This,pbOwnerReplicaId,pbItemId,pChangeVersion,pCreationVersion,dwFlags,dwWorkForChange,ppChangeBuilder) ) 

#define ISyncChangeBatchBase2_GetLearnedKnowledge(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledge(This,ppLearnedKnowledge) ) 

#define ISyncChangeBatchBase2_GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge)	\
    ( (This)->lpVtbl -> GetPrerequisiteKnowledge(This,ppPrerequisteKnowledge) ) 

#define ISyncChangeBatchBase2_GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetSourceForgottenKnowledge(This,ppSourceForgottenKnowledge) ) 

#define ISyncChangeBatchBase2_SetLastBatch(This)	\
    ( (This)->lpVtbl -> SetLastBatch(This) ) 

#define ISyncChangeBatchBase2_SetWorkEstimateForBatch(This,dwWorkForBatch)	\
    ( (This)->lpVtbl -> SetWorkEstimateForBatch(This,dwWorkForBatch) ) 

#define ISyncChangeBatchBase2_SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession)	\
    ( (This)->lpVtbl -> SetRemainingWorkEstimateForSession(This,dwRemainingWorkForSession) ) 

#define ISyncChangeBatchBase2_Serialize(This,pbChangeBatch,pcbChangeBatch)	\
    ( (This)->lpVtbl -> Serialize(This,pbChangeBatch,pcbChangeBatch) ) 


#define ISyncChangeBatchBase2_SerializeWithOptions(This,targetFormatVersion,dwFlags,pbBuffer,pdwSerializedSize)	\
    ( (This)->lpVtbl -> SerializeWithOptions(This,targetFormatVersion,dwFlags,pbBuffer,pdwSerializedSize) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeBatchBase2_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeBatchAdvanced_INTERFACE_DEFINED__
#define __ISyncChangeBatchAdvanced_INTERFACE_DEFINED__

/* interface ISyncChangeBatchAdvanced */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeBatchAdvanced;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0f1a4995-cbc8-421d-b550-5d0bebf3e9a5")
    ISyncChangeBatchAdvanced : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetFilterInfo( 
            /* [out] */ ISyncFilterInfo **ppFilterInfo) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ConvertFullEnumerationChangeBatchToRegularChangeBatch( 
            /* [out] */ ISyncChangeBatch **ppChangeBatch) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetUpperBoundItemId( 
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetBatchLevelKnowledgeShouldBeApplied( 
            /* [out] */ BOOL *pfBatchKnowledgeShouldBeApplied) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeBatchAdvancedVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeBatchAdvanced * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeBatchAdvanced * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeBatchAdvanced * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetFilterInfo )( 
            ISyncChangeBatchAdvanced * This,
            /* [out] */ ISyncFilterInfo **ppFilterInfo);
        
        HRESULT ( STDMETHODCALLTYPE *ConvertFullEnumerationChangeBatchToRegularChangeBatch )( 
            ISyncChangeBatchAdvanced * This,
            /* [out] */ ISyncChangeBatch **ppChangeBatch);
        
        HRESULT ( STDMETHODCALLTYPE *GetUpperBoundItemId )( 
            ISyncChangeBatchAdvanced * This,
            /* [size_is][unique][out][in] */ BYTE *pbItemId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetBatchLevelKnowledgeShouldBeApplied )( 
            ISyncChangeBatchAdvanced * This,
            /* [out] */ BOOL *pfBatchKnowledgeShouldBeApplied);
        
        END_INTERFACE
    } ISyncChangeBatchAdvancedVtbl;

    interface ISyncChangeBatchAdvanced
    {
        CONST_VTBL struct ISyncChangeBatchAdvancedVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeBatchAdvanced_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeBatchAdvanced_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeBatchAdvanced_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeBatchAdvanced_GetFilterInfo(This,ppFilterInfo)	\
    ( (This)->lpVtbl -> GetFilterInfo(This,ppFilterInfo) ) 

#define ISyncChangeBatchAdvanced_ConvertFullEnumerationChangeBatchToRegularChangeBatch(This,ppChangeBatch)	\
    ( (This)->lpVtbl -> ConvertFullEnumerationChangeBatchToRegularChangeBatch(This,ppChangeBatch) ) 

#define ISyncChangeBatchAdvanced_GetUpperBoundItemId(This,pbItemId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetUpperBoundItemId(This,pbItemId,pcbIdSize) ) 

#define ISyncChangeBatchAdvanced_GetBatchLevelKnowledgeShouldBeApplied(This,pfBatchKnowledgeShouldBeApplied)	\
    ( (This)->lpVtbl -> GetBatchLevelKnowledgeShouldBeApplied(This,pfBatchKnowledgeShouldBeApplied) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeBatchAdvanced_INTERFACE_DEFINED__ */


#ifndef __IKnowledgeSyncProvider_INTERFACE_DEFINED__
#define __IKnowledgeSyncProvider_INTERFACE_DEFINED__

/* interface IKnowledgeSyncProvider */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IKnowledgeSyncProvider;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("43434a49-8da4-47f2-8172-ad7b8b024978")
    IKnowledgeSyncProvider : public ISyncProvider
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE BeginSession( 
            /* [in] */ SYNC_PROVIDER_ROLE role,
            /* [in] */ ISyncSessionState *pSessionState) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSyncBatchParameters( 
            /* [out] */ ISyncKnowledge **ppSyncKnowledge,
            /* [out] */ DWORD *pdwRequestedBatchSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeBatch( 
            /* [in] */ DWORD dwBatchSize,
            /* [in] */ ISyncKnowledge *pSyncKnowledge,
            /* [out] */ ISyncChangeBatch **ppSyncChangeBatch,
            /* [out] */ IUnknown **ppUnkDataRetriever) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetFullEnumerationChangeBatch( 
            /* [in] */ DWORD dwBatchSize,
            /* [in] */ const BYTE *pbLowerEnumerationBound,
            /* [in] */ ISyncKnowledge *pSyncKnowledge,
            /* [out] */ ISyncFullEnumerationChangeBatch **ppSyncChangeBatch,
            /* [out] */ IUnknown **ppUnkDataRetriever) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProcessChangeBatch( 
            /* [in] */ CONFLICT_RESOLUTION_POLICY resolutionPolicy,
            /* [in] */ ISyncChangeBatch *pSourceChangeBatch,
            /* [in] */ IUnknown *pUnkDataRetriever,
            /* [in] */ ISyncCallback *pCallback,
            /* [out][in] */ SYNC_SESSION_STATISTICS *pSyncSessionStatistics) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProcessFullEnumerationChangeBatch( 
            /* [in] */ CONFLICT_RESOLUTION_POLICY resolutionPolicy,
            /* [in] */ ISyncFullEnumerationChangeBatch *pSourceChangeBatch,
            /* [in] */ IUnknown *pUnkDataRetriever,
            /* [in] */ ISyncCallback *pCallback,
            /* [out][in] */ SYNC_SESSION_STATISTICS *pSyncSessionStatistics) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EndSession( 
            /* [in] */ ISyncSessionState *pSessionState) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IKnowledgeSyncProviderVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IKnowledgeSyncProvider * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IKnowledgeSyncProvider * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIdParameters )( 
            IKnowledgeSyncProvider * This,
            /* [out] */ ID_PARAMETERS *pIdParameters);
        
        HRESULT ( STDMETHODCALLTYPE *BeginSession )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ SYNC_PROVIDER_ROLE role,
            /* [in] */ ISyncSessionState *pSessionState);
        
        HRESULT ( STDMETHODCALLTYPE *GetSyncBatchParameters )( 
            IKnowledgeSyncProvider * This,
            /* [out] */ ISyncKnowledge **ppSyncKnowledge,
            /* [out] */ DWORD *pdwRequestedBatchSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeBatch )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ DWORD dwBatchSize,
            /* [in] */ ISyncKnowledge *pSyncKnowledge,
            /* [out] */ ISyncChangeBatch **ppSyncChangeBatch,
            /* [out] */ IUnknown **ppUnkDataRetriever);
        
        HRESULT ( STDMETHODCALLTYPE *GetFullEnumerationChangeBatch )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ DWORD dwBatchSize,
            /* [in] */ const BYTE *pbLowerEnumerationBound,
            /* [in] */ ISyncKnowledge *pSyncKnowledge,
            /* [out] */ ISyncFullEnumerationChangeBatch **ppSyncChangeBatch,
            /* [out] */ IUnknown **ppUnkDataRetriever);
        
        HRESULT ( STDMETHODCALLTYPE *ProcessChangeBatch )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ CONFLICT_RESOLUTION_POLICY resolutionPolicy,
            /* [in] */ ISyncChangeBatch *pSourceChangeBatch,
            /* [in] */ IUnknown *pUnkDataRetriever,
            /* [in] */ ISyncCallback *pCallback,
            /* [out][in] */ SYNC_SESSION_STATISTICS *pSyncSessionStatistics);
        
        HRESULT ( STDMETHODCALLTYPE *ProcessFullEnumerationChangeBatch )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ CONFLICT_RESOLUTION_POLICY resolutionPolicy,
            /* [in] */ ISyncFullEnumerationChangeBatch *pSourceChangeBatch,
            /* [in] */ IUnknown *pUnkDataRetriever,
            /* [in] */ ISyncCallback *pCallback,
            /* [out][in] */ SYNC_SESSION_STATISTICS *pSyncSessionStatistics);
        
        HRESULT ( STDMETHODCALLTYPE *EndSession )( 
            IKnowledgeSyncProvider * This,
            /* [in] */ ISyncSessionState *pSessionState);
        
        END_INTERFACE
    } IKnowledgeSyncProviderVtbl;

    interface IKnowledgeSyncProvider
    {
        CONST_VTBL struct IKnowledgeSyncProviderVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IKnowledgeSyncProvider_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IKnowledgeSyncProvider_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IKnowledgeSyncProvider_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IKnowledgeSyncProvider_GetIdParameters(This,pIdParameters)	\
    ( (This)->lpVtbl -> GetIdParameters(This,pIdParameters) ) 


#define IKnowledgeSyncProvider_BeginSession(This,role,pSessionState)	\
    ( (This)->lpVtbl -> BeginSession(This,role,pSessionState) ) 

#define IKnowledgeSyncProvider_GetSyncBatchParameters(This,ppSyncKnowledge,pdwRequestedBatchSize)	\
    ( (This)->lpVtbl -> GetSyncBatchParameters(This,ppSyncKnowledge,pdwRequestedBatchSize) ) 

#define IKnowledgeSyncProvider_GetChangeBatch(This,dwBatchSize,pSyncKnowledge,ppSyncChangeBatch,ppUnkDataRetriever)	\
    ( (This)->lpVtbl -> GetChangeBatch(This,dwBatchSize,pSyncKnowledge,ppSyncChangeBatch,ppUnkDataRetriever) ) 

#define IKnowledgeSyncProvider_GetFullEnumerationChangeBatch(This,dwBatchSize,pbLowerEnumerationBound,pSyncKnowledge,ppSyncChangeBatch,ppUnkDataRetriever)	\
    ( (This)->lpVtbl -> GetFullEnumerationChangeBatch(This,dwBatchSize,pbLowerEnumerationBound,pSyncKnowledge,ppSyncChangeBatch,ppUnkDataRetriever) ) 

#define IKnowledgeSyncProvider_ProcessChangeBatch(This,resolutionPolicy,pSourceChangeBatch,pUnkDataRetriever,pCallback,pSyncSessionStatistics)	\
    ( (This)->lpVtbl -> ProcessChangeBatch(This,resolutionPolicy,pSourceChangeBatch,pUnkDataRetriever,pCallback,pSyncSessionStatistics) ) 

#define IKnowledgeSyncProvider_ProcessFullEnumerationChangeBatch(This,resolutionPolicy,pSourceChangeBatch,pUnkDataRetriever,pCallback,pSyncSessionStatistics)	\
    ( (This)->lpVtbl -> ProcessFullEnumerationChangeBatch(This,resolutionPolicy,pSourceChangeBatch,pUnkDataRetriever,pCallback,pSyncSessionStatistics) ) 

#define IKnowledgeSyncProvider_EndSession(This,pSessionState)	\
    ( (This)->lpVtbl -> EndSession(This,pSessionState) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IKnowledgeSyncProvider_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeUnit_INTERFACE_DEFINED__
#define __ISyncChangeUnit_INTERFACE_DEFINED__

/* interface ISyncChangeUnit */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeUnit;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("60edd8ca-7341-4bb7-95ce-fab6394b51cb")
    ISyncChangeUnit : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetItemChange( 
            /* [out] */ ISyncChange **ppSyncChange) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitId( 
            /* [size_is][unique][out][in] */ BYTE *pbChangeUnitId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitVersion( 
            /* [in] */ const BYTE *pbCurrentReplicaId,
            /* [out] */ SYNC_VERSION *pVersion) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeUnitVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeUnit * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeUnit * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeUnit * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetItemChange )( 
            ISyncChangeUnit * This,
            /* [out] */ ISyncChange **ppSyncChange);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitId )( 
            ISyncChangeUnit * This,
            /* [size_is][unique][out][in] */ BYTE *pbChangeUnitId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitVersion )( 
            ISyncChangeUnit * This,
            /* [in] */ const BYTE *pbCurrentReplicaId,
            /* [out] */ SYNC_VERSION *pVersion);
        
        END_INTERFACE
    } ISyncChangeUnitVtbl;

    interface ISyncChangeUnit
    {
        CONST_VTBL struct ISyncChangeUnitVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeUnit_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeUnit_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeUnit_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeUnit_GetItemChange(This,ppSyncChange)	\
    ( (This)->lpVtbl -> GetItemChange(This,ppSyncChange) ) 

#define ISyncChangeUnit_GetChangeUnitId(This,pbChangeUnitId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetChangeUnitId(This,pbChangeUnitId,pcbIdSize) ) 

#define ISyncChangeUnit_GetChangeUnitVersion(This,pbCurrentReplicaId,pVersion)	\
    ( (This)->lpVtbl -> GetChangeUnitVersion(This,pbCurrentReplicaId,pVersion) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeUnit_INTERFACE_DEFINED__ */


#ifndef __IEnumSyncChangeUnits_INTERFACE_DEFINED__
#define __IEnumSyncChangeUnits_INTERFACE_DEFINED__

/* interface IEnumSyncChangeUnits */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IEnumSyncChangeUnits;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("346b35f1-8703-4c6d-ab1a-4dbca2cff97f")
    IEnumSyncChangeUnits : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Next( 
            /* [range][in] */ ULONG cChanges,
            /* [length_is][size_is][out] */ ISyncChangeUnit **ppChangeUnit,
            /* [unique][out][in] */ ULONG *pcFetched) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Skip( 
            /* [in] */ ULONG cChanges) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IEnumSyncChangeUnits **ppEnum) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IEnumSyncChangeUnitsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IEnumSyncChangeUnits * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IEnumSyncChangeUnits * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IEnumSyncChangeUnits * This);
        
        HRESULT ( STDMETHODCALLTYPE *Next )( 
            IEnumSyncChangeUnits * This,
            /* [range][in] */ ULONG cChanges,
            /* [length_is][size_is][out] */ ISyncChangeUnit **ppChangeUnit,
            /* [unique][out][in] */ ULONG *pcFetched);
        
        HRESULT ( STDMETHODCALLTYPE *Skip )( 
            IEnumSyncChangeUnits * This,
            /* [in] */ ULONG cChanges);
        
        HRESULT ( STDMETHODCALLTYPE *Reset )( 
            IEnumSyncChangeUnits * This);
        
        HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IEnumSyncChangeUnits * This,
            /* [out] */ IEnumSyncChangeUnits **ppEnum);
        
        END_INTERFACE
    } IEnumSyncChangeUnitsVtbl;

    interface IEnumSyncChangeUnits
    {
        CONST_VTBL struct IEnumSyncChangeUnitsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IEnumSyncChangeUnits_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IEnumSyncChangeUnits_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IEnumSyncChangeUnits_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IEnumSyncChangeUnits_Next(This,cChanges,ppChangeUnit,pcFetched)	\
    ( (This)->lpVtbl -> Next(This,cChanges,ppChangeUnit,pcFetched) ) 

#define IEnumSyncChangeUnits_Skip(This,cChanges)	\
    ( (This)->lpVtbl -> Skip(This,cChanges) ) 

#define IEnumSyncChangeUnits_Reset(This)	\
    ( (This)->lpVtbl -> Reset(This) ) 

#define IEnumSyncChangeUnits_Clone(This,ppEnum)	\
    ( (This)->lpVtbl -> Clone(This,ppEnum) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IEnumSyncChangeUnits_INTERFACE_DEFINED__ */


#ifndef __ISyncChange_INTERFACE_DEFINED__
#define __ISyncChange_INTERFACE_DEFINED__

/* interface ISyncChange */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChange;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("a1952beb-0f6b-4711-b136-01da85b968a6")
    ISyncChange : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetOwnerReplicaId( 
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRootItemId( 
            /* [size_is][unique][out][in] */ BYTE *pbRootItemId,
            /* [out][in] */ DWORD *pcbIdSize) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeVersion( 
            /* [in] */ const BYTE *pbCurrentReplicaId,
            /* [out] */ SYNC_VERSION *pVersion) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetCreationVersion( 
            /* [in] */ const BYTE *pbCurrentReplicaId,
            /* [out] */ SYNC_VERSION *pVersion) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetFlags( 
            /* [out] */ DWORD *pdwFlags) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetWorkEstimate( 
            /* [out] */ DWORD *pdwWork) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnits( 
            /* [out] */ IEnumSyncChangeUnits **ppEnum) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetMadeWithKnowledge( 
            /* [out] */ ISyncKnowledge **ppMadeWithKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLearnedKnowledge( 
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetWorkEstimate( 
            /* [in] */ DWORD dwWork) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChange * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChange * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChange * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetOwnerReplicaId )( 
            ISyncChange * This,
            /* [size_is][unique][out][in] */ BYTE *pbReplicaId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetRootItemId )( 
            ISyncChange * This,
            /* [size_is][unique][out][in] */ BYTE *pbRootItemId,
            /* [out][in] */ DWORD *pcbIdSize);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeVersion )( 
            ISyncChange * This,
            /* [in] */ const BYTE *pbCurrentReplicaId,
            /* [out] */ SYNC_VERSION *pVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetCreationVersion )( 
            ISyncChange * This,
            /* [in] */ const BYTE *pbCurrentReplicaId,
            /* [out] */ SYNC_VERSION *pVersion);
        
        HRESULT ( STDMETHODCALLTYPE *GetFlags )( 
            ISyncChange * This,
            /* [out] */ DWORD *pdwFlags);
        
        HRESULT ( STDMETHODCALLTYPE *GetWorkEstimate )( 
            ISyncChange * This,
            /* [out] */ DWORD *pdwWork);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnits )( 
            ISyncChange * This,
            /* [out] */ IEnumSyncChangeUnits **ppEnum);
        
        HRESULT ( STDMETHODCALLTYPE *GetMadeWithKnowledge )( 
            ISyncChange * This,
            /* [out] */ ISyncKnowledge **ppMadeWithKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledge )( 
            ISyncChange * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *SetWorkEstimate )( 
            ISyncChange * This,
            /* [in] */ DWORD dwWork);
        
        END_INTERFACE
    } ISyncChangeVtbl;

    interface ISyncChange
    {
        CONST_VTBL struct ISyncChangeVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChange_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChange_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChange_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChange_GetOwnerReplicaId(This,pbReplicaId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetOwnerReplicaId(This,pbReplicaId,pcbIdSize) ) 

#define ISyncChange_GetRootItemId(This,pbRootItemId,pcbIdSize)	\
    ( (This)->lpVtbl -> GetRootItemId(This,pbRootItemId,pcbIdSize) ) 

#define ISyncChange_GetChangeVersion(This,pbCurrentReplicaId,pVersion)	\
    ( (This)->lpVtbl -> GetChangeVersion(This,pbCurrentReplicaId,pVersion) ) 

#define ISyncChange_GetCreationVersion(This,pbCurrentReplicaId,pVersion)	\
    ( (This)->lpVtbl -> GetCreationVersion(This,pbCurrentReplicaId,pVersion) ) 

#define ISyncChange_GetFlags(This,pdwFlags)	\
    ( (This)->lpVtbl -> GetFlags(This,pdwFlags) ) 

#define ISyncChange_GetWorkEstimate(This,pdwWork)	\
    ( (This)->lpVtbl -> GetWorkEstimate(This,pdwWork) ) 

#define ISyncChange_GetChangeUnits(This,ppEnum)	\
    ( (This)->lpVtbl -> GetChangeUnits(This,ppEnum) ) 

#define ISyncChange_GetMadeWithKnowledge(This,ppMadeWithKnowledge)	\
    ( (This)->lpVtbl -> GetMadeWithKnowledge(This,ppMadeWithKnowledge) ) 

#define ISyncChange_GetLearnedKnowledge(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledge(This,ppLearnedKnowledge) ) 

#define ISyncChange_SetWorkEstimate(This,dwWork)	\
    ( (This)->lpVtbl -> SetWorkEstimate(This,dwWork) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChange_INTERFACE_DEFINED__ */


#ifndef __ISyncChangeWithPrerequisite_INTERFACE_DEFINED__
#define __ISyncChangeWithPrerequisite_INTERFACE_DEFINED__

/* interface ISyncChangeWithPrerequisite */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncChangeWithPrerequisite;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9e38382f-1589-48c3-92e4-05ecdcb4f3f7")
    ISyncChangeWithPrerequisite : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetPrerequisiteKnowledge( 
            /* [out] */ ISyncKnowledge **ppPrerequisiteKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLearnedKnowledgeWithPrerequisite( 
            /* [in] */ ISyncKnowledge *pDestinationKnowledge,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledgeWithPrerequisite) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncChangeWithPrerequisiteVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncChangeWithPrerequisite * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncChangeWithPrerequisite * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncChangeWithPrerequisite * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetPrerequisiteKnowledge )( 
            ISyncChangeWithPrerequisite * This,
            /* [out] */ ISyncKnowledge **ppPrerequisiteKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledgeWithPrerequisite )( 
            ISyncChangeWithPrerequisite * This,
            /* [in] */ ISyncKnowledge *pDestinationKnowledge,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledgeWithPrerequisite);
        
        END_INTERFACE
    } ISyncChangeWithPrerequisiteVtbl;

    interface ISyncChangeWithPrerequisite
    {
        CONST_VTBL struct ISyncChangeWithPrerequisiteVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncChangeWithPrerequisite_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncChangeWithPrerequisite_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncChangeWithPrerequisite_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncChangeWithPrerequisite_GetPrerequisiteKnowledge(This,ppPrerequisiteKnowledge)	\
    ( (This)->lpVtbl -> GetPrerequisiteKnowledge(This,ppPrerequisiteKnowledge) ) 

#define ISyncChangeWithPrerequisite_GetLearnedKnowledgeWithPrerequisite(This,pDestinationKnowledge,ppLearnedKnowledgeWithPrerequisite)	\
    ( (This)->lpVtbl -> GetLearnedKnowledgeWithPrerequisite(This,pDestinationKnowledge,ppLearnedKnowledgeWithPrerequisite) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncChangeWithPrerequisite_INTERFACE_DEFINED__ */


#ifndef __ISyncFullEnumerationChange_INTERFACE_DEFINED__
#define __ISyncFullEnumerationChange_INTERFACE_DEFINED__

/* interface ISyncFullEnumerationChange */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISyncFullEnumerationChange;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9785e0bd-bdff-40c4-98c5-b34b2f1991b3")
    ISyncFullEnumerationChange : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetLearnedKnowledgeAfterRecoveryComplete( 
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetLearnedForgottenKnowledge( 
            /* [out] */ IForgottenKnowledge **ppLearnedForgottenKnowledge) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISyncFullEnumerationChangeVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISyncFullEnumerationChange * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISyncFullEnumerationChange * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISyncFullEnumerationChange * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedKnowledgeAfterRecoveryComplete )( 
            ISyncFullEnumerationChange * This,
            /* [out] */ ISyncKnowledge **ppLearnedKnowledge);
        
        HRESULT ( STDMETHODCALLTYPE *GetLearnedForgottenKnowledge )( 
            ISyncFullEnumerationChange * This,
            /* [out] */ IForgottenKnowledge **ppLearnedForgottenKnowledge);
        
        END_INTERFACE
    } ISyncFullEnumerationChangeVtbl;

    interface ISyncFullEnumerationChange
    {
        CONST_VTBL struct ISyncFullEnumerationChangeVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISyncFullEnumerationChange_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISyncFullEnumerationChange_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISyncFullEnumerationChange_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISyncFullEnumerationChange_GetLearnedKnowledgeAfterRecoveryComplete(This,ppLearnedKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedKnowledgeAfterRecoveryComplete(This,ppLearnedKnowledge) ) 

#define ISyncFullEnumerationChange_GetLearnedForgottenKnowledge(This,ppLearnedForgottenKnowledge)	\
    ( (This)->lpVtbl -> GetLearnedForgottenKnowledge(This,ppLearnedForgottenKnowledge) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISyncFullEnumerationChange_INTERFACE_DEFINED__ */


#ifndef __IDataRetrieverCallback_INTERFACE_DEFINED__
#define __IDataRetrieverCallback_INTERFACE_DEFINED__

/* interface IDataRetrieverCallback */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IDataRetrieverCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("71b4863b-f969-4676-bbc3-3d9fdc3fb2c7")
    IDataRetrieverCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE LoadChangeDataComplete( 
            /* [in] */ IUnknown *pUnkData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE LoadChangeDataError( 
            /* [in] */ HRESULT hrError) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDataRetrieverCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IDataRetrieverCallback * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IDataRetrieverCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IDataRetrieverCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *LoadChangeDataComplete )( 
            IDataRetrieverCallback * This,
            /* [in] */ IUnknown *pUnkData);
        
        HRESULT ( STDMETHODCALLTYPE *LoadChangeDataError )( 
            IDataRetrieverCallback * This,
            /* [in] */ HRESULT hrError);
        
        END_INTERFACE
    } IDataRetrieverCallbackVtbl;

    interface IDataRetrieverCallback
    {
        CONST_VTBL struct IDataRetrieverCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDataRetrieverCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IDataRetrieverCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IDataRetrieverCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IDataRetrieverCallback_LoadChangeDataComplete(This,pUnkData)	\
    ( (This)->lpVtbl -> LoadChangeDataComplete(This,pUnkData) ) 

#define IDataRetrieverCallback_LoadChangeDataError(This,hrError)	\
    ( (This)->lpVtbl -> LoadChangeDataError(This,hrError) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IDataRetrieverCallback_INTERFACE_DEFINED__ */


#ifndef __ILoadChangeContext_INTERFACE_DEFINED__
#define __ILoadChangeContext_INTERFACE_DEFINED__

/* interface ILoadChangeContext */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ILoadChangeContext;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("44a4aaca-ec39-46d5-b5c9-d633c0ee67e2")
    ILoadChangeContext : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetSyncChange( 
            /* [out] */ ISyncChange **ppSyncChange) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetRecoverableErrorOnChange( 
            /* [in] */ HRESULT hrError,
            /* [unique][in] */ IRecoverableErrorData *pErrorData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetRecoverableErrorOnChangeUnit( 
            /* [in] */ HRESULT hrError,
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [unique][in] */ IRecoverableErrorData *pErrorData) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ILoadChangeContextVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ILoadChangeContext * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ILoadChangeContext * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ILoadChangeContext * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetSyncChange )( 
            ILoadChangeContext * This,
            /* [out] */ ISyncChange **ppSyncChange);
        
        HRESULT ( STDMETHODCALLTYPE *SetRecoverableErrorOnChange )( 
            ILoadChangeContext * This,
            /* [in] */ HRESULT hrError,
            /* [unique][in] */ IRecoverableErrorData *pErrorData);
        
        HRESULT ( STDMETHODCALLTYPE *SetRecoverableErrorOnChangeUnit )( 
            ILoadChangeContext * This,
            /* [in] */ HRESULT hrError,
            /* [in] */ ISyncChangeUnit *pChangeUnit,
            /* [unique][in] */ IRecoverableErrorData *pErrorData);
        
        END_INTERFACE
    } ILoadChangeContextVtbl;

    interface ILoadChangeContext
    {
        CONST_VTBL struct ILoadChangeContextVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ILoadChangeContext_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ILoadChangeContext_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ILoadChangeContext_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ILoadChangeContext_GetSyncChange(This,ppSyncChange)	\
    ( (This)->lpVtbl -> GetSyncChange(This,ppSyncChange) ) 

#define ILoadChangeContext_SetRecoverableErrorOnChange(This,hrError,pErrorData)	\
    ( (This)->lpVtbl -> SetRecoverableErrorOnChange(This,hrError,pErrorData) ) 

#define ILoadChangeContext_SetRecoverableErrorOnChangeUnit(This,hrError,pChangeUnit,pErrorData)	\
    ( (This)->lpVtbl -> SetRecoverableErrorOnChangeUnit(This,hrError,pChangeUnit,pErrorData) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ILoadChangeContext_INTERFACE_DEFINED__ */


#ifndef __ISynchronousDataRetriever_INTERFACE_DEFINED__
#define __ISynchronousDataRetriever_INTERFACE_DEFINED__

/* interface ISynchronousDataRetriever */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISynchronousDataRetriever;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9b22f2a9-a4cd-4648-9d8e-3a510d4da04b")
    ISynchronousDataRetriever : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetIdParameters( 
            /* [out] */ ID_PARAMETERS *pIdParameters) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE LoadChangeData( 
            /* [in] */ ILoadChangeContext *pLoadChangeContext,
            /* [out] */ IUnknown **ppUnkData) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISynchronousDataRetrieverVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISynchronousDataRetriever * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISynchronousDataRetriever * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISynchronousDataRetriever * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIdParameters )( 
            ISynchronousDataRetriever * This,
            /* [out] */ ID_PARAMETERS *pIdParameters);
        
        HRESULT ( STDMETHODCALLTYPE *LoadChangeData )( 
            ISynchronousDataRetriever * This,
            /* [in] */ ILoadChangeContext *pLoadChangeContext,
            /* [out] */ IUnknown **ppUnkData);
        
        END_INTERFACE
    } ISynchronousDataRetrieverVtbl;

    interface ISynchronousDataRetriever
    {
        CONST_VTBL struct ISynchronousDataRetrieverVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISynchronousDataRetriever_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISynchronousDataRetriever_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISynchronousDataRetriever_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISynchronousDataRetriever_GetIdParameters(This,pIdParameters)	\
    ( (This)->lpVtbl -> GetIdParameters(This,pIdParameters) ) 

#define ISynchronousDataRetriever_LoadChangeData(This,pLoadChangeContext,ppUnkData)	\
    ( (This)->lpVtbl -> LoadChangeData(This,pLoadChangeContext,ppUnkData) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISynchronousDataRetriever_INTERFACE_DEFINED__ */


#ifndef __IAsynchronousDataRetriever_INTERFACE_DEFINED__
#define __IAsynchronousDataRetriever_INTERFACE_DEFINED__

/* interface IAsynchronousDataRetriever */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IAsynchronousDataRetriever;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9fc7e470-61ea-4a88-9be4-df56a27cfef2")
    IAsynchronousDataRetriever : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetIdParameters( 
            /* [out] */ ID_PARAMETERS *pIdParameters) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterCallback( 
            /* [in] */ IDataRetrieverCallback *pDataRetrieverCallback) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RevokeCallback( 
            /* [in] */ IDataRetrieverCallback *pDataRetrieverCallback) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE LoadChangeData( 
            /* [in] */ ILoadChangeContext *pLoadChangeContext) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAsynchronousDataRetrieverVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAsynchronousDataRetriever * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAsynchronousDataRetriever * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAsynchronousDataRetriever * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIdParameters )( 
            IAsynchronousDataRetriever * This,
            /* [out] */ ID_PARAMETERS *pIdParameters);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterCallback )( 
            IAsynchronousDataRetriever * This,
            /* [in] */ IDataRetrieverCallback *pDataRetrieverCallback);
        
        HRESULT ( STDMETHODCALLTYPE *RevokeCallback )( 
            IAsynchronousDataRetriever * This,
            /* [in] */ IDataRetrieverCallback *pDataRetrieverCallback);
        
        HRESULT ( STDMETHODCALLTYPE *LoadChangeData )( 
            IAsynchronousDataRetriever * This,
            /* [in] */ ILoadChangeContext *pLoadChangeContext);
        
        END_INTERFACE
    } IAsynchronousDataRetrieverVtbl;

    interface IAsynchronousDataRetriever
    {
        CONST_VTBL struct IAsynchronousDataRetrieverVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAsynchronousDataRetriever_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAsynchronousDataRetriever_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAsynchronousDataRetriever_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAsynchronousDataRetriever_GetIdParameters(This,pIdParameters)	\
    ( (This)->lpVtbl -> GetIdParameters(This,pIdParameters) ) 

#define IAsynchronousDataRetriever_RegisterCallback(This,pDataRetrieverCallback)	\
    ( (This)->lpVtbl -> RegisterCallback(This,pDataRetrieverCallback) ) 

#define IAsynchronousDataRetriever_RevokeCallback(This,pDataRetrieverCallback)	\
    ( (This)->lpVtbl -> RevokeCallback(This,pDataRetrieverCallback) ) 

#define IAsynchronousDataRetriever_LoadChangeData(This,pLoadChangeContext)	\
    ( (This)->lpVtbl -> LoadChangeData(This,pLoadChangeContext) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAsynchronousDataRetriever_INTERFACE_DEFINED__ */


#ifndef __IFilterRequestCallback_INTERFACE_DEFINED__
#define __IFilterRequestCallback_INTERFACE_DEFINED__

/* interface IFilterRequestCallback */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IFilterRequestCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("82df8873-6360-463a-a8a1-ede5e1a1594d")
    IFilterRequestCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE RequestFilter( 
            /* [in] */ __RPC__in_opt IUnknown *pFilter,
            /* [in] */ FILTERING_TYPE filteringType) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IFilterRequestCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IFilterRequestCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IFilterRequestCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IFilterRequestCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *RequestFilter )( 
            __RPC__in IFilterRequestCallback * This,
            /* [in] */ __RPC__in_opt IUnknown *pFilter,
            /* [in] */ FILTERING_TYPE filteringType);
        
        END_INTERFACE
    } IFilterRequestCallbackVtbl;

    interface IFilterRequestCallback
    {
        CONST_VTBL struct IFilterRequestCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IFilterRequestCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IFilterRequestCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IFilterRequestCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IFilterRequestCallback_RequestFilter(This,pFilter,filteringType)	\
    ( (This)->lpVtbl -> RequestFilter(This,pFilter,filteringType) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IFilterRequestCallback_INTERFACE_DEFINED__ */


#ifndef __IRequestFilteredSync_INTERFACE_DEFINED__
#define __IRequestFilteredSync_INTERFACE_DEFINED__

/* interface IRequestFilteredSync */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IRequestFilteredSync;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2e020184-6d18-46a7-a32a-da4aeb06696c")
    IRequestFilteredSync : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SpecifyFilter( 
            /* [in] */ __RPC__in_opt IFilterRequestCallback *pCallback) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IRequestFilteredSyncVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IRequestFilteredSync * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IRequestFilteredSync * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IRequestFilteredSync * This);
        
        HRESULT ( STDMETHODCALLTYPE *SpecifyFilter )( 
            __RPC__in IRequestFilteredSync * This,
            /* [in] */ __RPC__in_opt IFilterRequestCallback *pCallback);
        
        END_INTERFACE
    } IRequestFilteredSyncVtbl;

    interface IRequestFilteredSync
    {
        CONST_VTBL struct IRequestFilteredSyncVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IRequestFilteredSync_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IRequestFilteredSync_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IRequestFilteredSync_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IRequestFilteredSync_SpecifyFilter(This,pCallback)	\
    ( (This)->lpVtbl -> SpecifyFilter(This,pCallback) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IRequestFilteredSync_INTERFACE_DEFINED__ */


#ifndef __ISupportFilteredSync_INTERFACE_DEFINED__
#define __ISupportFilteredSync_INTERFACE_DEFINED__

/* interface ISupportFilteredSync */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ISupportFilteredSync;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3d128ded-d555-4e0d-bf4b-fb213a8a9302")
    ISupportFilteredSync : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE AddFilter( 
            /* [in] */ __RPC__in_opt IUnknown *pFilter,
            /* [in] */ FILTERING_TYPE filteringType) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISupportFilteredSyncVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ISupportFilteredSync * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ISupportFilteredSync * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ISupportFilteredSync * This);
        
        HRESULT ( STDMETHODCALLTYPE *AddFilter )( 
            __RPC__in ISupportFilteredSync * This,
            /* [in] */ __RPC__in_opt IUnknown *pFilter,
            /* [in] */ FILTERING_TYPE filteringType);
        
        END_INTERFACE
    } ISupportFilteredSyncVtbl;

    interface ISupportFilteredSync
    {
        CONST_VTBL struct ISupportFilteredSyncVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISupportFilteredSync_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISupportFilteredSync_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISupportFilteredSync_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISupportFilteredSync_AddFilter(This,pFilter,filteringType)	\
    ( (This)->lpVtbl -> AddFilter(This,pFilter,filteringType) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISupportFilteredSync_INTERFACE_DEFINED__ */


#ifndef __ISupportLastWriteTime_INTERFACE_DEFINED__
#define __ISupportLastWriteTime_INTERFACE_DEFINED__

/* interface ISupportLastWriteTime */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_ISupportLastWriteTime;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("eadf816f-d0bd-43ca-8f40-5acdc6c06f7a")
    ISupportLastWriteTime : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetItemChangeTime( 
            /* [in] */ const BYTE *pbItemId,
            /* [out] */ ULONGLONG *pullTimestamp) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetChangeUnitChangeTime( 
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [out] */ ULONGLONG *pullTimestamp) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISupportLastWriteTimeVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ISupportLastWriteTime * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ISupportLastWriteTime * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ISupportLastWriteTime * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetItemChangeTime )( 
            ISupportLastWriteTime * This,
            /* [in] */ const BYTE *pbItemId,
            /* [out] */ ULONGLONG *pullTimestamp);
        
        HRESULT ( STDMETHODCALLTYPE *GetChangeUnitChangeTime )( 
            ISupportLastWriteTime * This,
            /* [in] */ const BYTE *pbItemId,
            /* [in] */ const BYTE *pbChangeUnitId,
            /* [out] */ ULONGLONG *pullTimestamp);
        
        END_INTERFACE
    } ISupportLastWriteTimeVtbl;

    interface ISupportLastWriteTime
    {
        CONST_VTBL struct ISupportLastWriteTimeVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISupportLastWriteTime_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISupportLastWriteTime_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISupportLastWriteTime_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISupportLastWriteTime_GetItemChangeTime(This,pbItemId,pullTimestamp)	\
    ( (This)->lpVtbl -> GetItemChangeTime(This,pbItemId,pullTimestamp) ) 

#define ISupportLastWriteTime_GetChangeUnitChangeTime(This,pbItemId,pbChangeUnitId,pullTimestamp)	\
    ( (This)->lpVtbl -> GetChangeUnitChangeTime(This,pbItemId,pbChangeUnitId,pullTimestamp) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISupportLastWriteTime_INTERFACE_DEFINED__ */


#ifndef __IProviderConverter_INTERFACE_DEFINED__
#define __IProviderConverter_INTERFACE_DEFINED__

/* interface IProviderConverter */
/* [unique][uuid][local][object] */ 


EXTERN_C const IID IID_IProviderConverter;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("809b7276-98cf-4957-93a5-0ebdd3dddffd")
    IProviderConverter : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Initialize( 
            /* [in] */ ISyncProvider *pISyncProvider) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IProviderConverterVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IProviderConverter * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IProviderConverter * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IProviderConverter * This);
        
        HRESULT ( STDMETHODCALLTYPE *Initialize )( 
            IProviderConverter * This,
            /* [in] */ ISyncProvider *pISyncProvider);
        
        END_INTERFACE
    } IProviderConverterVtbl;

    interface IProviderConverter
    {
        CONST_VTBL struct IProviderConverterVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IProviderConverter_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IProviderConverter_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IProviderConverter_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IProviderConverter_Initialize(This,pISyncProvider)	\
    ( (This)->lpVtbl -> Initialize(This,pISyncProvider) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IProviderConverter_INTERFACE_DEFINED__ */


/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



