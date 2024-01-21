//-------------------------------------------------------------------------- 
// 
//  Copyright (c) Microsoft Corporation.  All rights reserved. 
// 
//  File: iacom.h 
//      Microsoft Tablet PC API definitions 
// 
//-------------------------------------------------------------------------- 
	
 	
 	

#pragma warning( disable: 4049 )  /* more than 64k source lines */

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0347 */
/* Compiler settings for iacom.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__


#ifndef __iacom_h__
#define __iacom_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IInkAnalyzer_FWD_DEFINED__
#define __IInkAnalyzer_FWD_DEFINED__
typedef interface IInkAnalyzer IInkAnalyzer;
#endif 	/* __IInkAnalyzer_FWD_DEFINED__ */


#ifndef __IContextNode_FWD_DEFINED__
#define __IContextNode_FWD_DEFINED__
typedef interface IContextNode IContextNode;
#endif 	/* __IContextNode_FWD_DEFINED__ */


#ifndef __IContextNodes_FWD_DEFINED__
#define __IContextNodes_FWD_DEFINED__
typedef interface IContextNodes IContextNodes;
#endif 	/* __IContextNodes_FWD_DEFINED__ */


#ifndef __IAnalysisRegion_FWD_DEFINED__
#define __IAnalysisRegion_FWD_DEFINED__
typedef interface IAnalysisRegion IAnalysisRegion;
#endif 	/* __IAnalysisRegion_FWD_DEFINED__ */


#ifndef __IContextLink_FWD_DEFINED__
#define __IContextLink_FWD_DEFINED__
typedef interface IContextLink IContextLink;
#endif 	/* __IContextLink_FWD_DEFINED__ */


#ifndef __IContextLinks_FWD_DEFINED__
#define __IContextLinks_FWD_DEFINED__
typedef interface IContextLinks IContextLinks;
#endif 	/* __IContextLinks_FWD_DEFINED__ */


#ifndef __IInkAnalysisRecognizer_FWD_DEFINED__
#define __IInkAnalysisRecognizer_FWD_DEFINED__
typedef interface IInkAnalysisRecognizer IInkAnalysisRecognizer;
#endif 	/* __IInkAnalysisRecognizer_FWD_DEFINED__ */


#ifndef __IInkAnalysisRecognizers_FWD_DEFINED__
#define __IInkAnalysisRecognizers_FWD_DEFINED__
typedef interface IInkAnalysisRecognizers IInkAnalysisRecognizers;
#endif 	/* __IInkAnalysisRecognizers_FWD_DEFINED__ */


#ifndef __IAnalysisAlternate_FWD_DEFINED__
#define __IAnalysisAlternate_FWD_DEFINED__
typedef interface IAnalysisAlternate IAnalysisAlternate;
#endif 	/* __IAnalysisAlternate_FWD_DEFINED__ */


#ifndef __IAnalysisAlternates_FWD_DEFINED__
#define __IAnalysisAlternates_FWD_DEFINED__
typedef interface IAnalysisAlternates IAnalysisAlternates;
#endif 	/* __IAnalysisAlternates_FWD_DEFINED__ */


#ifndef __IAnalysisWarning_FWD_DEFINED__
#define __IAnalysisWarning_FWD_DEFINED__
typedef interface IAnalysisWarning IAnalysisWarning;
#endif 	/* __IAnalysisWarning_FWD_DEFINED__ */


#ifndef __IAnalysisWarnings_FWD_DEFINED__
#define __IAnalysisWarnings_FWD_DEFINED__
typedef interface IAnalysisWarnings IAnalysisWarnings;
#endif 	/* __IAnalysisWarnings_FWD_DEFINED__ */


#ifndef __IAnalysisStatus_FWD_DEFINED__
#define __IAnalysisStatus_FWD_DEFINED__
typedef interface IAnalysisStatus IAnalysisStatus;
#endif 	/* __IAnalysisStatus_FWD_DEFINED__ */


#ifndef __IMatchesCriteriaCallBack_FWD_DEFINED__
#define __IMatchesCriteriaCallBack_FWD_DEFINED__
typedef interface IMatchesCriteriaCallBack IMatchesCriteriaCallBack;
#endif 	/* __IMatchesCriteriaCallBack_FWD_DEFINED__ */


#ifndef ___IAnalysisEvents_FWD_DEFINED__
#define ___IAnalysisEvents_FWD_DEFINED__
typedef interface _IAnalysisEvents _IAnalysisEvents;
#endif 	/* ___IAnalysisEvents_FWD_DEFINED__ */


#ifndef ___IAnalysisProxyEvents_FWD_DEFINED__
#define ___IAnalysisProxyEvents_FWD_DEFINED__
typedef interface _IAnalysisProxyEvents _IAnalysisProxyEvents;
#endif 	/* ___IAnalysisProxyEvents_FWD_DEFINED__ */


#ifndef __InkAnalyzer_FWD_DEFINED__
#define __InkAnalyzer_FWD_DEFINED__

#ifdef __cplusplus
typedef class InkAnalyzer InkAnalyzer;
#else
typedef struct InkAnalyzer InkAnalyzer;
#endif /* __cplusplus */

#endif 	/* __InkAnalyzer_FWD_DEFINED__ */


#ifndef __AnalysisRegion_FWD_DEFINED__
#define __AnalysisRegion_FWD_DEFINED__

#ifdef __cplusplus
typedef class AnalysisRegion AnalysisRegion;
#else
typedef struct AnalysisRegion AnalysisRegion;
#endif /* __cplusplus */

#endif 	/* __AnalysisRegion_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

/* interface __MIDL_itf_iacom_0000 */
/* [local] */ 

#ifndef _COMINKANALYSIS_H_
#define _COMINKANALYSIS_H_


extern RPC_IF_HANDLE __MIDL_itf_iacom_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_iacom_0000_v0_0_s_ifspec;


#ifndef __COMINKANALYSISLib_LIBRARY_DEFINED__
#define __COMINKANALYSISLib_LIBRARY_DEFINED__

/* library COMINKANALYSISLib */
/* [helpcontext][helpstring][version][uuid] */ 















typedef /* [helpcontext][helpstring] */ 
enum StrokeType
    {	StrokeType_Unclassified	= 0,
	StrokeType_Writing	= 1,
	StrokeType_Drawing	= 2
    } 	StrokeType;

typedef /* [helpcontext][helpstring] */ 
enum ConfirmationType
    {	ConfirmationType_None	= 0,
	ConfirmationType_NodeTypeAndProperties	= 3,
	ConfirmationType_TopBoundary	= 4
    } 	ConfirmationType;

typedef /* [helpcontext][helpstring] */ 
enum AnalysisModes
    {	AnalysisModes_None	= 0,
	AnalysisModes_AutomaticReconciliation	= 0x2,
	AnalysisModes_StrokeCacheAutoCleanup	= 0x4,
	AnalysisModes_Personalization	= 0x8,
	AnalysisModes_Default	= 0xd
    } 	AnalysisModes;

typedef /* [helpcontext][helpstring] */ 
enum SemanticType
    {	SemanticType_None	= 0,
	SemanticType_Underline	= 1,
	SemanticType_Strikethrough	= 2,
	SemanticType_Highlight	= 3,
	SemanticType_ScratchOut	= 4,
	SemanticType_VerticalRange	= 5,
	SemanticType_Callout	= 6,
	SemanticType_Enclosure	= 7,
	SemanticType_Comment	= 100,
	SemanticType_Container	= 200,
	SemanticType_Connector	= 201
    } 	SemanticType;

typedef /* [helpcontext][helpstring] */ 
enum ContextLinkDirection
    {	ContextLinkDirection_LinksWith	= 0,
	ContextLinkDirection_LinksFrom	= 1,
	ContextLinkDirection_LinksTo	= 2
    } 	ContextLinkDirection;

typedef /* [helpcontext][helpstring] */ 
enum AnalysisWarningCode
    {	AnalysisWarningCode_Aborted	= 0,
	AnalysisWarningCode_NoMatchingInkAnalysisRecognizerFound	= 1,
	AnalysisWarningCode_FactoidNotSupported	= 2,
	AnalysisWarningCode_FactoidCoercionNotSupported	= 3,
	AnalysisWarningCode_GuideNotSupported	= 4,
	AnalysisWarningCode_WordlistNotSupported	= 5,
	AnalysisWarningCode_WordModeNotSupported	= 6,
	AnalysisWarningCode_PartialDictionaryTermsNotSupported	= 7,
	AnalysisWarningCode_TextRecognitionProcessFailed	= 8,
	AnalysisWarningCode_AddInkToRecognizerFailed	= 9,
	AnalysisWarningCode_SetPrefixSuffixFailed	= 10,
	AnalysisWarningCode_InkAnalysisRecognizerInitializationFailed	= 11,
	AnalysisWarningCode_ConfirmedWithoutInkRecognition	= 12,
	AnalysisWarningCode_BackgroundException	= 13,
	AnalysisWarningCode_ContextNodeLocationNotSet	= 14,
	AnalysisWarningCode_LanguageIdNotRespected	= 15,
	AnalysisWarningCode_EnableUnicodeCharacterRangesNotSupported	= 16,
	AnalysisWarningCode_TopInkBreaksOnlyNotSupported	= 17,
	AnalysisWarningCode_AnalysisAlreadyRunning	= 18
    } 	AnalysisWarningCode;

typedef /* [helpcontext][helpstring] */ 
enum RecognitionConfidence
    {	RecognitionConfidence_Strong	= 0,
	RecognitionConfidence_Intermediate	= 1,
	RecognitionConfidence_Poor	= 2,
	RecognitionConfidence_Unknown	= 3
    } 	RecognitionConfidence;

typedef /* [helpcontext][helpstring] */ 
enum InkAnalysisRecognizerCapabilities
    {	RC_None	= 0,
	RC_DoNotCare	= 0x1,
	RC_Object	= 0x2,
	RC_FreeInput	= 0x4,
	RC_LinedInput	= 0x8,
	RC_BoxedInput	= 0x10,
	RC_CharacterAutoCompletionInput	= 0x20,
	RC_RightAndDown	= 0x40,
	RC_LeftAndDown	= 0x80,
	RC_DownAndLeft	= 0x100,
	RC_DownAndRight	= 0x200,
	RC_ArbitraryAngle	= 0x400,
	RC_Lattice	= 0x800,
	RC_AdviseInkChange	= 0x1000,
	RC_StrokeReorder	= 0x2000,
	RC_Personalizable	= 0x4000,
	RC_PrefersArbitraryAngle	= 0x8000,
	RC_PrefersParagraphBreaking	= 0x10000,
	RC_PrefersSegmentationRecognition	= 0x20000
    } 	InkAnalysisRecognizerCapabilities;

typedef struct InkAnalysisRecognizerGuide
    {
    RECT rectWritingBox;
    RECT rectDrawnBox;
    long cRows;
    long cColumns;
    long midline;
    } 	InkAnalysisRecognizerGuide;


EXTERN_C const IID LIBID_COMINKANALYSISLib;

#ifndef __IInkAnalyzer_INTERFACE_DEFINED__
#define __IInkAnalyzer_INTERFACE_DEFINED__

/* interface IInkAnalyzer */
/* [unique][helpcontext][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IInkAnalyzer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("31F8B4AE-F970-3A72-8595-867D286E3B7B")
    IInkAnalyzer : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetDirtyRegion( 
            /* [out] */ IAnalysisRegion **ppDirtyRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetDirtyRegion( 
            /* [in] */ IAnalysisRegion *pDirtyRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetStrokeType( 
            /* [in] */ LONG lStrokeId,
            /* [in] */ StrokeType StrokeType) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetStrokesType( 
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokes,
            /* [in] */ StrokeType StrokeType) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokeType( 
            /* [in] */ LONG lStrokeId,
            /* [out] */ StrokeType *pStrokeType) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetStrokeLanguageId( 
            /* [in] */ LONG lStrokeId,
            /* [in] */ LONG lLanguageId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetStrokesLanguageId( 
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokes,
            /* [in] */ LONG lStrokesLCID) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokeLanguageId( 
            /* [in] */ LONG strokeId,
            /* [out] */ LONG *plLanguageId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetRootNode( 
            /* [out] */ IContextNode **ppRootNode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE BackgroundAnalyze( void) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Analyze( 
            /* [out] */ IAnalysisStatus **ppStatus) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsAnalyzing( 
            /* [out] */ VARIANT_BOOL *pbAnalyzing) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Reconcile( void) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE TransactionalReconcile( 
            /* [in] */ LONG lTimeLimit,
            /* [out] */ VARIANT_BOOL *pbMoreToReconcile) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Abort( 
            /* [out] */ IAnalysisRegion **ppAbortedRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetInkAnalysisRecognizersByPriority( 
            /* [out] */ IInkAnalysisRecognizers **ppInkAnalysisRecognizers) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetRecognizedString( 
            /* [out] */ BSTR *pbstrRecognizedString) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddStroke( 
            /* [in] */ LONG lStrokeId,
            /* [in] */ ULONG ulStrokePacketDataCount,
            /* [size_is][in] */ LONG *plStrokePacketData,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddStrokes( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddStrokeForLanguage( 
            /* [in] */ LONG lStrokeId,
            /* [in] */ LONG lStrokeLCID,
            /* [in] */ ULONG ulStrokePacketDataCount,
            /* [size_is][in] */ LONG *plStrokePacketData,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddStrokesForLanguage( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plIdofStrokesToAdd,
            /* [in] */ LONG lStrokesLCID,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ClearStrokeData( 
            /* [in] */ LONG lStrokeId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE RemoveStroke( 
            /* [in] */ LONG lStrokeId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE RemoveStrokes( 
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokeIds) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE UpdateStrokesData( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAnalysisModes( 
            /* [out] */ AnalysisModes *pAnalysisMode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetAnalysisModes( 
            /* [in] */ AnalysisModes analysisMode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE CreateAnalysisHint( 
            /* [out] */ IContextNode **ppAnalysisHint) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE DeleteAnalysisHint( 
            /* [in] */ IContextNode *pHintToDelete) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAnalysisHints( 
            /* [out] */ IContextNodes **ppAnalysisHints) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAnalysisHintsByName( 
            /* [in] */ BSTR hintName,
            /* [out] */ IContextNodes **ppAnalysisHints) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE CreateContextNodes( 
            /* [out] */ IContextNodes **ppContextNodes) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAlternatesForContextNodes( 
            /* [in] */ IContextNodes *pContextNodes,
            /* [in] */ ULONG ulMaximumAlternates,
            /* [out] */ IAnalysisAlternates **ppAlternates) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAlternatesForStrokes( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokes,
            /* [in] */ ULONG ulMaximumAlternates,
            /* [out] */ IAnalysisAlternates **ppAlternates) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAlternates( 
            /* [out] */ IAnalysisAlternates **ppAlternates) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ModifyTopAlternate( 
            /* [in] */ IAnalysisAlternate *pAlternate) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ModifyTopAlternateWithConfirmation( 
            /* [in] */ IAnalysisAlternate *alternate,
            /* [in] */ VARIANT_BOOL fconfirmAutomatically) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE CreateCustomRecognizer( 
            /* [in] */ const GUID *pInkAnalysisRecognizerId,
            /* [out] */ IContextNode **ppContextNode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddStrokeToCustomRecognizer( 
            /* [in] */ LONG lStrokeId,
            /* [in] */ ULONG ulStrokePacketDataCount,
            /* [size_is][in] */ LONG *plStrokePacketData,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [in] */ IContextNode *pCustomRecognizer,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddStrokesToCustomRecognizer( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData,
            /* [in] */ IContextNode *pCustomRecognizer,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindNode( 
            /* [in] */ const GUID *pId,
            /* [out] */ IContextNode **ppContextNodeFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindLeafNodes( 
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindInkLeafNodesForStrokes( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindInkLeafNodes( 
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindNodesOfType( 
            /* [in] */ const GUID *pNodeType,
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindNodesOfTypeForStrokes( 
            /* [in] */ const GUID *pNodeType,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindNodesOfTypeInSubTree( 
            /* [in] */ const GUID *pNodeType,
            /* [in] */ IContextNode *pContextNodeToSearchFrom,
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindNodesWithCallBack( 
            /* [in] */ IMatchesCriteriaCallBack *pCriteria,
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE FindNodesWithCallBackInSubTree( 
            /* [in] */ IMatchesCriteriaCallBack *pCriteria,
            /* [in] */ IContextNode *pContextNodeToSearchFrom,
            /* [out] */ IContextNodes **ppContextNodesFound) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE LoadResults( 
            /* [in] */ ULONG ulDataSize,
            /* [size_is][in] */ BYTE *pbSerializedData,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [out] */ VARIANT_BOOL *pfRetVal) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SaveResults( 
            /* [in] */ ULONG ulMappedStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [out][in] */ ULONG *pulSerializedDataSize,
            /* [size_is][out] */ BYTE **ppbSerializedData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SaveResultsForNodes( 
            /* [in] */ ULONG ulMappedStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [in] */ IContextNodes *pContextNodes,
            /* [out][in] */ ULONG *pulSerializedDataSize,
            /* [size_is][out] */ BYTE **ppbSerializedData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SaveResultsForStrokes( 
            /* [in] */ ULONG ulMappedStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [out][in] */ ULONG *pulSerializedDataSize,
            /* [size_is][out] */ BYTE **ppbSerializedData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetNodesFromTextRange( 
            /* [out][in] */ LONG *plStart,
            /* [out][in] */ LONG *plLength,
            /* [out] */ IContextNodes **ppContextNodes,
            /* [defaultvalue][in] */ IContextNodes *pNodesToSearch = 0) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetTextRangeFromNodes( 
            /* [out] */ LONG *plStart,
            /* [out] */ LONG *plLength,
            /* [in] */ IContextNodes *pNodesToSearch) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Search( 
            /* [in] */ BSTR bstrPhraseToMatch,
            /* [out][in] */ ULONG *pulSearchResultCount,
            /* [size_is][out] */ ULONG **ppulStrokeCountPerResult,
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ ULONG **ppulStrokeIds) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SearchWithLanguageId( 
            /* [in] */ BSTR bstrPhraseToMatch,
            /* [in] */ LONG lSearchStringLanguageId,
            /* [out][in] */ ULONG *pulSearchResultCount,
            /* [size_is][out] */ ULONG **ppulStrokeCountPerResult,
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ ULONG **ppulStrokeIds) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IInkAnalyzerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IInkAnalyzer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IInkAnalyzer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IInkAnalyzer * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetDirtyRegion )( 
            IInkAnalyzer * This,
            /* [out] */ IAnalysisRegion **ppDirtyRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetDirtyRegion )( 
            IInkAnalyzer * This,
            /* [in] */ IAnalysisRegion *pDirtyRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetStrokeType )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId,
            /* [in] */ StrokeType StrokeType);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetStrokesType )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokes,
            /* [in] */ StrokeType StrokeType);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokeType )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId,
            /* [out] */ StrokeType *pStrokeType);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetStrokeLanguageId )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId,
            /* [in] */ LONG lLanguageId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetStrokesLanguageId )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokes,
            /* [in] */ LONG lStrokesLCID);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokeLanguageId )( 
            IInkAnalyzer * This,
            /* [in] */ LONG strokeId,
            /* [out] */ LONG *plLanguageId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRootNode )( 
            IInkAnalyzer * This,
            /* [out] */ IContextNode **ppRootNode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *BackgroundAnalyze )( 
            IInkAnalyzer * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Analyze )( 
            IInkAnalyzer * This,
            /* [out] */ IAnalysisStatus **ppStatus);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsAnalyzing )( 
            IInkAnalyzer * This,
            /* [out] */ VARIANT_BOOL *pbAnalyzing);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reconcile )( 
            IInkAnalyzer * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *TransactionalReconcile )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lTimeLimit,
            /* [out] */ VARIANT_BOOL *pbMoreToReconcile);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Abort )( 
            IInkAnalyzer * This,
            /* [out] */ IAnalysisRegion **ppAbortedRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetInkAnalysisRecognizersByPriority )( 
            IInkAnalyzer * This,
            /* [out] */ IInkAnalysisRecognizers **ppInkAnalysisRecognizers);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRecognizedString )( 
            IInkAnalyzer * This,
            /* [out] */ BSTR *pbstrRecognizedString);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddStroke )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId,
            /* [in] */ ULONG ulStrokePacketDataCount,
            /* [size_is][in] */ LONG *plStrokePacketData,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddStrokes )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddStrokeForLanguage )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId,
            /* [in] */ LONG lStrokeLCID,
            /* [in] */ ULONG ulStrokePacketDataCount,
            /* [size_is][in] */ LONG *plStrokePacketData,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddStrokesForLanguage )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plIdofStrokesToAdd,
            /* [in] */ LONG lStrokesLCID,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ClearStrokeData )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveStroke )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveStrokes )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokeIds);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *UpdateStrokesData )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAnalysisModes )( 
            IInkAnalyzer * This,
            /* [out] */ AnalysisModes *pAnalysisMode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetAnalysisModes )( 
            IInkAnalyzer * This,
            /* [in] */ AnalysisModes analysisMode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateAnalysisHint )( 
            IInkAnalyzer * This,
            /* [out] */ IContextNode **ppAnalysisHint);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *DeleteAnalysisHint )( 
            IInkAnalyzer * This,
            /* [in] */ IContextNode *pHintToDelete);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAnalysisHints )( 
            IInkAnalyzer * This,
            /* [out] */ IContextNodes **ppAnalysisHints);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAnalysisHintsByName )( 
            IInkAnalyzer * This,
            /* [in] */ BSTR hintName,
            /* [out] */ IContextNodes **ppAnalysisHints);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateContextNodes )( 
            IInkAnalyzer * This,
            /* [out] */ IContextNodes **ppContextNodes);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAlternatesForContextNodes )( 
            IInkAnalyzer * This,
            /* [in] */ IContextNodes *pContextNodes,
            /* [in] */ ULONG ulMaximumAlternates,
            /* [out] */ IAnalysisAlternates **ppAlternates);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAlternatesForStrokes )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokes,
            /* [in] */ ULONG ulMaximumAlternates,
            /* [out] */ IAnalysisAlternates **ppAlternates);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAlternates )( 
            IInkAnalyzer * This,
            /* [out] */ IAnalysisAlternates **ppAlternates);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ModifyTopAlternate )( 
            IInkAnalyzer * This,
            /* [in] */ IAnalysisAlternate *pAlternate);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ModifyTopAlternateWithConfirmation )( 
            IInkAnalyzer * This,
            /* [in] */ IAnalysisAlternate *alternate,
            /* [in] */ VARIANT_BOOL fconfirmAutomatically);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateCustomRecognizer )( 
            IInkAnalyzer * This,
            /* [in] */ const GUID *pInkAnalysisRecognizerId,
            /* [out] */ IContextNode **ppContextNode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddStrokeToCustomRecognizer )( 
            IInkAnalyzer * This,
            /* [in] */ LONG lStrokeId,
            /* [in] */ ULONG ulStrokePacketDataCount,
            /* [size_is][in] */ LONG *plStrokePacketData,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [in] */ IContextNode *pCustomRecognizer,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddStrokesToCustomRecognizer )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ ULONG ulStrokePacketDescriptionCount,
            /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
            /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
            /* [in] */ LONG *plStrokePacketData,
            /* [in] */ IContextNode *pCustomRecognizer,
            /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindNode )( 
            IInkAnalyzer * This,
            /* [in] */ const GUID *pId,
            /* [out] */ IContextNode **ppContextNodeFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindLeafNodes )( 
            IInkAnalyzer * This,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindInkLeafNodesForStrokes )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindInkLeafNodes )( 
            IInkAnalyzer * This,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindNodesOfType )( 
            IInkAnalyzer * This,
            /* [in] */ const GUID *pNodeType,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindNodesOfTypeForStrokes )( 
            IInkAnalyzer * This,
            /* [in] */ const GUID *pNodeType,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindNodesOfTypeInSubTree )( 
            IInkAnalyzer * This,
            /* [in] */ const GUID *pNodeType,
            /* [in] */ IContextNode *pContextNodeToSearchFrom,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindNodesWithCallBack )( 
            IInkAnalyzer * This,
            /* [in] */ IMatchesCriteriaCallBack *pCriteria,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindNodesWithCallBackInSubTree )( 
            IInkAnalyzer * This,
            /* [in] */ IMatchesCriteriaCallBack *pCriteria,
            /* [in] */ IContextNode *pContextNodeToSearchFrom,
            /* [out] */ IContextNodes **ppContextNodesFound);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *LoadResults )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulDataSize,
            /* [size_is][in] */ BYTE *pbSerializedData,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [out] */ VARIANT_BOOL *pfRetVal);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SaveResults )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulMappedStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [out][in] */ ULONG *pulSerializedDataSize,
            /* [size_is][out] */ BYTE **ppbSerializedData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SaveResultsForNodes )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulMappedStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [in] */ IContextNodes *pContextNodes,
            /* [out][in] */ ULONG *pulSerializedDataSize,
            /* [size_is][out] */ BYTE **ppbSerializedData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SaveResultsForStrokes )( 
            IInkAnalyzer * This,
            /* [in] */ ULONG ulMappedStrokeIdsCount,
            /* [size_is][in] */ LONG *plOriginalStrokeIds,
            /* [size_is][in] */ LONG *plModifiedStrokeIds,
            /* [in] */ ULONG ulStrokeIdCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [out][in] */ ULONG *pulSerializedDataSize,
            /* [size_is][out] */ BYTE **ppbSerializedData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetNodesFromTextRange )( 
            IInkAnalyzer * This,
            /* [out][in] */ LONG *plStart,
            /* [out][in] */ LONG *plLength,
            /* [out] */ IContextNodes **ppContextNodes,
            /* [defaultvalue][in] */ IContextNodes *pNodesToSearch);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTextRangeFromNodes )( 
            IInkAnalyzer * This,
            /* [out] */ LONG *plStart,
            /* [out] */ LONG *plLength,
            /* [in] */ IContextNodes *pNodesToSearch);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Search )( 
            IInkAnalyzer * This,
            /* [in] */ BSTR bstrPhraseToMatch,
            /* [out][in] */ ULONG *pulSearchResultCount,
            /* [size_is][out] */ ULONG **ppulStrokeCountPerResult,
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ ULONG **ppulStrokeIds);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SearchWithLanguageId )( 
            IInkAnalyzer * This,
            /* [in] */ BSTR bstrPhraseToMatch,
            /* [in] */ LONG lSearchStringLanguageId,
            /* [out][in] */ ULONG *pulSearchResultCount,
            /* [size_is][out] */ ULONG **ppulStrokeCountPerResult,
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ ULONG **ppulStrokeIds);
        
        END_INTERFACE
    } IInkAnalyzerVtbl;

    interface IInkAnalyzer
    {
        CONST_VTBL struct IInkAnalyzerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IInkAnalyzer_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IInkAnalyzer_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IInkAnalyzer_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IInkAnalyzer_GetDirtyRegion(This,ppDirtyRegion)	\
    (This)->lpVtbl -> GetDirtyRegion(This,ppDirtyRegion)

#define IInkAnalyzer_SetDirtyRegion(This,pDirtyRegion)	\
    (This)->lpVtbl -> SetDirtyRegion(This,pDirtyRegion)

#define IInkAnalyzer_SetStrokeType(This,lStrokeId,StrokeType)	\
    (This)->lpVtbl -> SetStrokeType(This,lStrokeId,StrokeType)

#define IInkAnalyzer_SetStrokesType(This,ulStrokeIdCount,plStrokes,StrokeType)	\
    (This)->lpVtbl -> SetStrokesType(This,ulStrokeIdCount,plStrokes,StrokeType)

#define IInkAnalyzer_GetStrokeType(This,lStrokeId,pStrokeType)	\
    (This)->lpVtbl -> GetStrokeType(This,lStrokeId,pStrokeType)

#define IInkAnalyzer_SetStrokeLanguageId(This,lStrokeId,lLanguageId)	\
    (This)->lpVtbl -> SetStrokeLanguageId(This,lStrokeId,lLanguageId)

#define IInkAnalyzer_SetStrokesLanguageId(This,ulStrokeIdCount,plStrokes,lStrokesLCID)	\
    (This)->lpVtbl -> SetStrokesLanguageId(This,ulStrokeIdCount,plStrokes,lStrokesLCID)

#define IInkAnalyzer_GetStrokeLanguageId(This,strokeId,plLanguageId)	\
    (This)->lpVtbl -> GetStrokeLanguageId(This,strokeId,plLanguageId)

#define IInkAnalyzer_GetRootNode(This,ppRootNode)	\
    (This)->lpVtbl -> GetRootNode(This,ppRootNode)

#define IInkAnalyzer_BackgroundAnalyze(This)	\
    (This)->lpVtbl -> BackgroundAnalyze(This)

#define IInkAnalyzer_Analyze(This,ppStatus)	\
    (This)->lpVtbl -> Analyze(This,ppStatus)

#define IInkAnalyzer_IsAnalyzing(This,pbAnalyzing)	\
    (This)->lpVtbl -> IsAnalyzing(This,pbAnalyzing)

#define IInkAnalyzer_Reconcile(This)	\
    (This)->lpVtbl -> Reconcile(This)

#define IInkAnalyzer_TransactionalReconcile(This,lTimeLimit,pbMoreToReconcile)	\
    (This)->lpVtbl -> TransactionalReconcile(This,lTimeLimit,pbMoreToReconcile)

#define IInkAnalyzer_Abort(This,ppAbortedRegion)	\
    (This)->lpVtbl -> Abort(This,ppAbortedRegion)

#define IInkAnalyzer_GetInkAnalysisRecognizersByPriority(This,ppInkAnalysisRecognizers)	\
    (This)->lpVtbl -> GetInkAnalysisRecognizersByPriority(This,ppInkAnalysisRecognizers)

#define IInkAnalyzer_GetRecognizedString(This,pbstrRecognizedString)	\
    (This)->lpVtbl -> GetRecognizedString(This,pbstrRecognizedString)

#define IInkAnalyzer_AddStroke(This,lStrokeId,ulStrokePacketDataCount,plStrokePacketData,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,ppContextNodeStrokeAddedTo)	\
    (This)->lpVtbl -> AddStroke(This,lStrokeId,ulStrokePacketDataCount,plStrokePacketData,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,ppContextNodeStrokeAddedTo)

#define IInkAnalyzer_AddStrokes(This,ulStrokeIdsCount,plStrokeIds,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData,ppContextNodeStrokeAddedTo)	\
    (This)->lpVtbl -> AddStrokes(This,ulStrokeIdsCount,plStrokeIds,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData,ppContextNodeStrokeAddedTo)

#define IInkAnalyzer_AddStrokeForLanguage(This,lStrokeId,lStrokeLCID,ulStrokePacketDataCount,plStrokePacketData,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,ppContextNodeStrokeAddedTo)	\
    (This)->lpVtbl -> AddStrokeForLanguage(This,lStrokeId,lStrokeLCID,ulStrokePacketDataCount,plStrokePacketData,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,ppContextNodeStrokeAddedTo)

#define IInkAnalyzer_AddStrokesForLanguage(This,ulStrokeIdsCount,plIdofStrokesToAdd,lStrokesLCID,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData,ppContextNodeStrokeAddedTo)	\
    (This)->lpVtbl -> AddStrokesForLanguage(This,ulStrokeIdsCount,plIdofStrokesToAdd,lStrokesLCID,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData,ppContextNodeStrokeAddedTo)

#define IInkAnalyzer_ClearStrokeData(This,lStrokeId)	\
    (This)->lpVtbl -> ClearStrokeData(This,lStrokeId)

#define IInkAnalyzer_RemoveStroke(This,lStrokeId)	\
    (This)->lpVtbl -> RemoveStroke(This,lStrokeId)

#define IInkAnalyzer_RemoveStrokes(This,ulStrokeIdCount,plStrokeIds)	\
    (This)->lpVtbl -> RemoveStrokes(This,ulStrokeIdCount,plStrokeIds)

#define IInkAnalyzer_UpdateStrokesData(This,ulStrokeIdsCount,plStrokeIds,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData)	\
    (This)->lpVtbl -> UpdateStrokesData(This,ulStrokeIdsCount,plStrokeIds,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData)

#define IInkAnalyzer_GetAnalysisModes(This,pAnalysisMode)	\
    (This)->lpVtbl -> GetAnalysisModes(This,pAnalysisMode)

#define IInkAnalyzer_SetAnalysisModes(This,analysisMode)	\
    (This)->lpVtbl -> SetAnalysisModes(This,analysisMode)

#define IInkAnalyzer_CreateAnalysisHint(This,ppAnalysisHint)	\
    (This)->lpVtbl -> CreateAnalysisHint(This,ppAnalysisHint)

#define IInkAnalyzer_DeleteAnalysisHint(This,pHintToDelete)	\
    (This)->lpVtbl -> DeleteAnalysisHint(This,pHintToDelete)

#define IInkAnalyzer_GetAnalysisHints(This,ppAnalysisHints)	\
    (This)->lpVtbl -> GetAnalysisHints(This,ppAnalysisHints)

#define IInkAnalyzer_GetAnalysisHintsByName(This,hintName,ppAnalysisHints)	\
    (This)->lpVtbl -> GetAnalysisHintsByName(This,hintName,ppAnalysisHints)

#define IInkAnalyzer_CreateContextNodes(This,ppContextNodes)	\
    (This)->lpVtbl -> CreateContextNodes(This,ppContextNodes)

#define IInkAnalyzer_GetAlternatesForContextNodes(This,pContextNodes,ulMaximumAlternates,ppAlternates)	\
    (This)->lpVtbl -> GetAlternatesForContextNodes(This,pContextNodes,ulMaximumAlternates,ppAlternates)

#define IInkAnalyzer_GetAlternatesForStrokes(This,ulStrokeIdsCount,plStrokes,ulMaximumAlternates,ppAlternates)	\
    (This)->lpVtbl -> GetAlternatesForStrokes(This,ulStrokeIdsCount,plStrokes,ulMaximumAlternates,ppAlternates)

#define IInkAnalyzer_GetAlternates(This,ppAlternates)	\
    (This)->lpVtbl -> GetAlternates(This,ppAlternates)

#define IInkAnalyzer_ModifyTopAlternate(This,pAlternate)	\
    (This)->lpVtbl -> ModifyTopAlternate(This,pAlternate)

#define IInkAnalyzer_ModifyTopAlternateWithConfirmation(This,alternate,fconfirmAutomatically)	\
    (This)->lpVtbl -> ModifyTopAlternateWithConfirmation(This,alternate,fconfirmAutomatically)

#define IInkAnalyzer_CreateCustomRecognizer(This,pInkAnalysisRecognizerId,ppContextNode)	\
    (This)->lpVtbl -> CreateCustomRecognizer(This,pInkAnalysisRecognizerId,ppContextNode)

#define IInkAnalyzer_AddStrokeToCustomRecognizer(This,lStrokeId,ulStrokePacketDataCount,plStrokePacketData,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pCustomRecognizer,ppContextNodeStrokeAddedTo)	\
    (This)->lpVtbl -> AddStrokeToCustomRecognizer(This,lStrokeId,ulStrokePacketDataCount,plStrokePacketData,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pCustomRecognizer,ppContextNodeStrokeAddedTo)

#define IInkAnalyzer_AddStrokesToCustomRecognizer(This,ulStrokeIdsCount,plStrokeIds,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData,pCustomRecognizer,ppContextNodeStrokeAddedTo)	\
    (This)->lpVtbl -> AddStrokesToCustomRecognizer(This,ulStrokeIdsCount,plStrokeIds,ulStrokePacketDescriptionCount,pStrokePacketDescriptionGuids,pulPacketDataCountPerStroke,plStrokePacketData,pCustomRecognizer,ppContextNodeStrokeAddedTo)

#define IInkAnalyzer_FindNode(This,pId,ppContextNodeFound)	\
    (This)->lpVtbl -> FindNode(This,pId,ppContextNodeFound)

#define IInkAnalyzer_FindLeafNodes(This,ppContextNodesFound)	\
    (This)->lpVtbl -> FindLeafNodes(This,ppContextNodesFound)

#define IInkAnalyzer_FindInkLeafNodesForStrokes(This,ulStrokeIdsCount,plStrokeIds,ppContextNodesFound)	\
    (This)->lpVtbl -> FindInkLeafNodesForStrokes(This,ulStrokeIdsCount,plStrokeIds,ppContextNodesFound)

#define IInkAnalyzer_FindInkLeafNodes(This,ppContextNodesFound)	\
    (This)->lpVtbl -> FindInkLeafNodes(This,ppContextNodesFound)

#define IInkAnalyzer_FindNodesOfType(This,pNodeType,ppContextNodesFound)	\
    (This)->lpVtbl -> FindNodesOfType(This,pNodeType,ppContextNodesFound)

#define IInkAnalyzer_FindNodesOfTypeForStrokes(This,pNodeType,ulStrokeIdsCount,plStrokeIds,ppContextNodesFound)	\
    (This)->lpVtbl -> FindNodesOfTypeForStrokes(This,pNodeType,ulStrokeIdsCount,plStrokeIds,ppContextNodesFound)

#define IInkAnalyzer_FindNodesOfTypeInSubTree(This,pNodeType,pContextNodeToSearchFrom,ppContextNodesFound)	\
    (This)->lpVtbl -> FindNodesOfTypeInSubTree(This,pNodeType,pContextNodeToSearchFrom,ppContextNodesFound)

#define IInkAnalyzer_FindNodesWithCallBack(This,pCriteria,ppContextNodesFound)	\
    (This)->lpVtbl -> FindNodesWithCallBack(This,pCriteria,ppContextNodesFound)

#define IInkAnalyzer_FindNodesWithCallBackInSubTree(This,pCriteria,pContextNodeToSearchFrom,ppContextNodesFound)	\
    (This)->lpVtbl -> FindNodesWithCallBackInSubTree(This,pCriteria,pContextNodeToSearchFrom,ppContextNodesFound)

#define IInkAnalyzer_LoadResults(This,ulDataSize,pbSerializedData,ulStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,pfRetVal)	\
    (This)->lpVtbl -> LoadResults(This,ulDataSize,pbSerializedData,ulStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,pfRetVal)

#define IInkAnalyzer_SaveResults(This,ulMappedStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,pulSerializedDataSize,ppbSerializedData)	\
    (This)->lpVtbl -> SaveResults(This,ulMappedStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,pulSerializedDataSize,ppbSerializedData)

#define IInkAnalyzer_SaveResultsForNodes(This,ulMappedStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,pContextNodes,pulSerializedDataSize,ppbSerializedData)	\
    (This)->lpVtbl -> SaveResultsForNodes(This,ulMappedStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,pContextNodes,pulSerializedDataSize,ppbSerializedData)

#define IInkAnalyzer_SaveResultsForStrokes(This,ulMappedStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,ulStrokeIdCount,plStrokeIds,pulSerializedDataSize,ppbSerializedData)	\
    (This)->lpVtbl -> SaveResultsForStrokes(This,ulMappedStrokeIdsCount,plOriginalStrokeIds,plModifiedStrokeIds,ulStrokeIdCount,plStrokeIds,pulSerializedDataSize,ppbSerializedData)

#define IInkAnalyzer_GetNodesFromTextRange(This,plStart,plLength,ppContextNodes,pNodesToSearch)	\
    (This)->lpVtbl -> GetNodesFromTextRange(This,plStart,plLength,ppContextNodes,pNodesToSearch)

#define IInkAnalyzer_GetTextRangeFromNodes(This,plStart,plLength,pNodesToSearch)	\
    (This)->lpVtbl -> GetTextRangeFromNodes(This,plStart,plLength,pNodesToSearch)

#define IInkAnalyzer_Search(This,bstrPhraseToMatch,pulSearchResultCount,ppulStrokeCountPerResult,pulStrokeIdsCount,ppulStrokeIds)	\
    (This)->lpVtbl -> Search(This,bstrPhraseToMatch,pulSearchResultCount,ppulStrokeCountPerResult,pulStrokeIdsCount,ppulStrokeIds)

#define IInkAnalyzer_SearchWithLanguageId(This,bstrPhraseToMatch,lSearchStringLanguageId,pulSearchResultCount,ppulStrokeCountPerResult,pulStrokeIdsCount,ppulStrokeIds)	\
    (This)->lpVtbl -> SearchWithLanguageId(This,bstrPhraseToMatch,lSearchStringLanguageId,pulSearchResultCount,ppulStrokeCountPerResult,pulStrokeIdsCount,ppulStrokeIds)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetDirtyRegion_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IAnalysisRegion **ppDirtyRegion);


void __RPC_STUB IInkAnalyzer_GetDirtyRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SetDirtyRegion_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IAnalysisRegion *pDirtyRegion);


void __RPC_STUB IInkAnalyzer_SetDirtyRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SetStrokeType_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId,
    /* [in] */ StrokeType StrokeType);


void __RPC_STUB IInkAnalyzer_SetStrokeType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SetStrokesType_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdCount,
    /* [size_is][in] */ LONG *plStrokes,
    /* [in] */ StrokeType StrokeType);


void __RPC_STUB IInkAnalyzer_SetStrokesType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetStrokeType_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId,
    /* [out] */ StrokeType *pStrokeType);


void __RPC_STUB IInkAnalyzer_GetStrokeType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SetStrokeLanguageId_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId,
    /* [in] */ LONG lLanguageId);


void __RPC_STUB IInkAnalyzer_SetStrokeLanguageId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SetStrokesLanguageId_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdCount,
    /* [size_is][in] */ LONG *plStrokes,
    /* [in] */ LONG lStrokesLCID);


void __RPC_STUB IInkAnalyzer_SetStrokesLanguageId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetStrokeLanguageId_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG strokeId,
    /* [out] */ LONG *plLanguageId);


void __RPC_STUB IInkAnalyzer_GetStrokeLanguageId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetRootNode_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IContextNode **ppRootNode);


void __RPC_STUB IInkAnalyzer_GetRootNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_BackgroundAnalyze_Proxy( 
    IInkAnalyzer * This);


void __RPC_STUB IInkAnalyzer_BackgroundAnalyze_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_Analyze_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IAnalysisStatus **ppStatus);


void __RPC_STUB IInkAnalyzer_Analyze_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_IsAnalyzing_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ VARIANT_BOOL *pbAnalyzing);


void __RPC_STUB IInkAnalyzer_IsAnalyzing_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_Reconcile_Proxy( 
    IInkAnalyzer * This);


void __RPC_STUB IInkAnalyzer_Reconcile_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_TransactionalReconcile_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lTimeLimit,
    /* [out] */ VARIANT_BOOL *pbMoreToReconcile);


void __RPC_STUB IInkAnalyzer_TransactionalReconcile_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_Abort_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IAnalysisRegion **ppAbortedRegion);


void __RPC_STUB IInkAnalyzer_Abort_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetInkAnalysisRecognizersByPriority_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IInkAnalysisRecognizers **ppInkAnalysisRecognizers);


void __RPC_STUB IInkAnalyzer_GetInkAnalysisRecognizersByPriority_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetRecognizedString_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ BSTR *pbstrRecognizedString);


void __RPC_STUB IInkAnalyzer_GetRecognizedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_AddStroke_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId,
    /* [in] */ ULONG ulStrokePacketDataCount,
    /* [size_is][in] */ LONG *plStrokePacketData,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);


void __RPC_STUB IInkAnalyzer_AddStroke_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_AddStrokes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
    /* [in] */ LONG *plStrokePacketData,
    /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);


void __RPC_STUB IInkAnalyzer_AddStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_AddStrokeForLanguage_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId,
    /* [in] */ LONG lStrokeLCID,
    /* [in] */ ULONG ulStrokePacketDataCount,
    /* [size_is][in] */ LONG *plStrokePacketData,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);


void __RPC_STUB IInkAnalyzer_AddStrokeForLanguage_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_AddStrokesForLanguage_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plIdofStrokesToAdd,
    /* [in] */ LONG lStrokesLCID,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
    /* [in] */ LONG *plStrokePacketData,
    /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);


void __RPC_STUB IInkAnalyzer_AddStrokesForLanguage_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_ClearStrokeData_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId);


void __RPC_STUB IInkAnalyzer_ClearStrokeData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_RemoveStroke_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId);


void __RPC_STUB IInkAnalyzer_RemoveStroke_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_RemoveStrokes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdCount,
    /* [size_is][in] */ LONG *plStrokeIds);


void __RPC_STUB IInkAnalyzer_RemoveStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_UpdateStrokesData_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
    /* [in] */ LONG *plStrokePacketData);


void __RPC_STUB IInkAnalyzer_UpdateStrokesData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetAnalysisModes_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ AnalysisModes *pAnalysisMode);


void __RPC_STUB IInkAnalyzer_GetAnalysisModes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SetAnalysisModes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ AnalysisModes analysisMode);


void __RPC_STUB IInkAnalyzer_SetAnalysisModes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_CreateAnalysisHint_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IContextNode **ppAnalysisHint);


void __RPC_STUB IInkAnalyzer_CreateAnalysisHint_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_DeleteAnalysisHint_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IContextNode *pHintToDelete);


void __RPC_STUB IInkAnalyzer_DeleteAnalysisHint_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetAnalysisHints_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IContextNodes **ppAnalysisHints);


void __RPC_STUB IInkAnalyzer_GetAnalysisHints_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetAnalysisHintsByName_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ BSTR hintName,
    /* [out] */ IContextNodes **ppAnalysisHints);


void __RPC_STUB IInkAnalyzer_GetAnalysisHintsByName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_CreateContextNodes_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IContextNodes **ppContextNodes);


void __RPC_STUB IInkAnalyzer_CreateContextNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetAlternatesForContextNodes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IContextNodes *pContextNodes,
    /* [in] */ ULONG ulMaximumAlternates,
    /* [out] */ IAnalysisAlternates **ppAlternates);


void __RPC_STUB IInkAnalyzer_GetAlternatesForContextNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetAlternatesForStrokes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokes,
    /* [in] */ ULONG ulMaximumAlternates,
    /* [out] */ IAnalysisAlternates **ppAlternates);


void __RPC_STUB IInkAnalyzer_GetAlternatesForStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetAlternates_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IAnalysisAlternates **ppAlternates);


void __RPC_STUB IInkAnalyzer_GetAlternates_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_ModifyTopAlternate_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IAnalysisAlternate *pAlternate);


void __RPC_STUB IInkAnalyzer_ModifyTopAlternate_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_ModifyTopAlternateWithConfirmation_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IAnalysisAlternate *alternate,
    /* [in] */ VARIANT_BOOL fconfirmAutomatically);


void __RPC_STUB IInkAnalyzer_ModifyTopAlternateWithConfirmation_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_CreateCustomRecognizer_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ const GUID *pInkAnalysisRecognizerId,
    /* [out] */ IContextNode **ppContextNode);


void __RPC_STUB IInkAnalyzer_CreateCustomRecognizer_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_AddStrokeToCustomRecognizer_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ LONG lStrokeId,
    /* [in] */ ULONG ulStrokePacketDataCount,
    /* [size_is][in] */ LONG *plStrokePacketData,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [in] */ IContextNode *pCustomRecognizer,
    /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);


void __RPC_STUB IInkAnalyzer_AddStrokeToCustomRecognizer_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_AddStrokesToCustomRecognizer_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [in] */ ULONG ulStrokePacketDescriptionCount,
    /* [size_is][in] */ GUID *pStrokePacketDescriptionGuids,
    /* [size_is][in] */ ULONG *pulPacketDataCountPerStroke,
    /* [in] */ LONG *plStrokePacketData,
    /* [in] */ IContextNode *pCustomRecognizer,
    /* [out] */ IContextNode **ppContextNodeStrokeAddedTo);


void __RPC_STUB IInkAnalyzer_AddStrokesToCustomRecognizer_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindNode_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ const GUID *pId,
    /* [out] */ IContextNode **ppContextNodeFound);


void __RPC_STUB IInkAnalyzer_FindNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindLeafNodes_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindLeafNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindInkLeafNodesForStrokes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindInkLeafNodesForStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindInkLeafNodes_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindInkLeafNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindNodesOfType_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ const GUID *pNodeType,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindNodesOfType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindNodesOfTypeForStrokes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ const GUID *pNodeType,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindNodesOfTypeForStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindNodesOfTypeInSubTree_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ const GUID *pNodeType,
    /* [in] */ IContextNode *pContextNodeToSearchFrom,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindNodesOfTypeInSubTree_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindNodesWithCallBack_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IMatchesCriteriaCallBack *pCriteria,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindNodesWithCallBack_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_FindNodesWithCallBackInSubTree_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ IMatchesCriteriaCallBack *pCriteria,
    /* [in] */ IContextNode *pContextNodeToSearchFrom,
    /* [out] */ IContextNodes **ppContextNodesFound);


void __RPC_STUB IInkAnalyzer_FindNodesWithCallBackInSubTree_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_LoadResults_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulDataSize,
    /* [size_is][in] */ BYTE *pbSerializedData,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plOriginalStrokeIds,
    /* [size_is][in] */ LONG *plModifiedStrokeIds,
    /* [out] */ VARIANT_BOOL *pfRetVal);


void __RPC_STUB IInkAnalyzer_LoadResults_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SaveResults_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulMappedStrokeIdsCount,
    /* [size_is][in] */ LONG *plOriginalStrokeIds,
    /* [size_is][in] */ LONG *plModifiedStrokeIds,
    /* [out][in] */ ULONG *pulSerializedDataSize,
    /* [size_is][out] */ BYTE **ppbSerializedData);


void __RPC_STUB IInkAnalyzer_SaveResults_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SaveResultsForNodes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulMappedStrokeIdsCount,
    /* [size_is][in] */ LONG *plOriginalStrokeIds,
    /* [size_is][in] */ LONG *plModifiedStrokeIds,
    /* [in] */ IContextNodes *pContextNodes,
    /* [out][in] */ ULONG *pulSerializedDataSize,
    /* [size_is][out] */ BYTE **ppbSerializedData);


void __RPC_STUB IInkAnalyzer_SaveResultsForNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SaveResultsForStrokes_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ ULONG ulMappedStrokeIdsCount,
    /* [size_is][in] */ LONG *plOriginalStrokeIds,
    /* [size_is][in] */ LONG *plModifiedStrokeIds,
    /* [in] */ ULONG ulStrokeIdCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [out][in] */ ULONG *pulSerializedDataSize,
    /* [size_is][out] */ BYTE **ppbSerializedData);


void __RPC_STUB IInkAnalyzer_SaveResultsForStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetNodesFromTextRange_Proxy( 
    IInkAnalyzer * This,
    /* [out][in] */ LONG *plStart,
    /* [out][in] */ LONG *plLength,
    /* [out] */ IContextNodes **ppContextNodes,
    /* [defaultvalue][in] */ IContextNodes *pNodesToSearch);


void __RPC_STUB IInkAnalyzer_GetNodesFromTextRange_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_GetTextRangeFromNodes_Proxy( 
    IInkAnalyzer * This,
    /* [out] */ LONG *plStart,
    /* [out] */ LONG *plLength,
    /* [in] */ IContextNodes *pNodesToSearch);


void __RPC_STUB IInkAnalyzer_GetTextRangeFromNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_Search_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ BSTR bstrPhraseToMatch,
    /* [out][in] */ ULONG *pulSearchResultCount,
    /* [size_is][out] */ ULONG **ppulStrokeCountPerResult,
    /* [out][in] */ ULONG *pulStrokeIdsCount,
    /* [size_is][out] */ ULONG **ppulStrokeIds);


void __RPC_STUB IInkAnalyzer_Search_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalyzer_SearchWithLanguageId_Proxy( 
    IInkAnalyzer * This,
    /* [in] */ BSTR bstrPhraseToMatch,
    /* [in] */ LONG lSearchStringLanguageId,
    /* [out][in] */ ULONG *pulSearchResultCount,
    /* [size_is][out] */ ULONG **ppulStrokeCountPerResult,
    /* [out][in] */ ULONG *pulStrokeIdsCount,
    /* [size_is][out] */ ULONG **ppulStrokeIds);


void __RPC_STUB IInkAnalyzer_SearchWithLanguageId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IInkAnalyzer_INTERFACE_DEFINED__ */


#ifndef __IContextNode_INTERFACE_DEFINED__
#define __IContextNode_INTERFACE_DEFINED__

/* interface IContextNode */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IContextNode;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("160BC1B3-5997-3D3C-9E5A-E38BCB212047")
    IContextNode : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetId( 
            /* [out] */ GUID *pId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetType( 
            /* [out] */ GUID *pContextNodeType) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetLocation( 
            /* [out] */ IAnalysisRegion **ppIAnalysisRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetTypeName( 
            /* [out] */ BSTR *pbstrContextNodeType) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetLocation( 
            /* [in] */ IAnalysisRegion *pIAnalysisRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetParentNode( 
            /* [out] */ IContextNode **ppParentContextNode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Reparent( 
            /* [in] */ IContextNode *pNewParent) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetSubNodes( 
            /* [out] */ IContextNodes **ppSubContextNodes) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE CreateSubNode( 
            /* [in] */ const GUID *pNodeType,
            /* [out] */ IContextNode **ppContextNodeCreated) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE CreatePartiallyPopulatedSubNode( 
            /* [in] */ const GUID *pNodeType,
            /* [in] */ const GUID *pNodeId,
            /* [in] */ IAnalysisRegion *pNodeLocation,
            /* [out] */ IContextNode **ppPartiallyPopulatedContextNodeCreated) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetPartiallyPopulated( 
            /* [out] */ VARIANT_BOOL *pfPartiallyPopulated) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetPartiallyPopulated( 
            /* [in] */ VARIANT_BOOL fPartiallyPopulated) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE LoadPropertiesData( 
            /* [in] */ ULONG cbPropertiesDataSize,
            /* [size_is][in] */ BYTE *pbPropertiesData,
            /* [out] */ VARIANT_BOOL *pfSuccessful) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SavePropertiesData( 
            /* [out][in] */ ULONG *pulPropertiesDataSize,
            /* [size_is][out] */ BYTE **ppbPropertiesData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE DeleteSubNode( 
            /* [in] */ IContextNode *pContextNodeToDelete) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddPropertyData( 
            /* [in] */ const GUID *pPropertyDataId,
            /* [in] */ ULONG ulPropertyDataSize,
            /* [size_is][in] */ BYTE *pbPropertyData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetPropertyData( 
            /* [in] */ const GUID *pPropertyDataId,
            /* [out][in] */ ULONG *pulPropertyDataSize,
            /* [size_is][out] */ BYTE **ppbPropertyData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE RemovePropertyData( 
            /* [in] */ const GUID *pPropertyDataId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetPropertyDataIds( 
            /* [out][in] */ ULONG *pulGuidCount,
            /* [size_is][out] */ GUID **ppGuids) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContainsPropertyData( 
            /* [in] */ const GUID *pPropertyDataId,
            /* [out] */ VARIANT_BOOL *pbContains) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetStrokes( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokeIds( 
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ LONG **pplStrokes) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokeCount( 
            /* [out] */ ULONG *pulStrokeCount) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokePacketDataById( 
            /* [in] */ LONG strokeId,
            /* [out][in] */ ULONG *pStrokePacketDataCount,
            /* [size_is][out] */ LONG **pplStrokePacketData) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokePacketDescriptionById( 
            /* [in] */ LONG lStrokeId,
            /* [out][in] */ ULONG *pulStrokePacketDescriptionCount,
            /* [size_is][out] */ GUID **ppStrokePacketDescriptionGuids) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE MoveSubNodeToPosition( 
            /* [in] */ IContextNode *pSubnodeToMove,
            /* [in] */ ULONG ulNewIndex) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ReparentStrokesByIdToNode( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ IContextNode *pContextNodeDestination) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Confirm( 
            /* [in] */ ConfirmationType confirmedType) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsConfirmed( 
            /* [in] */ ConfirmationType confirmedType,
            /* [out] */ VARIANT_BOOL *pfTypeConfirmed) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetContextLinks( 
            /* [out] */ IContextLinks **ppContextLinks) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsAlternateStringSupported( 
            /* [in] */ BSTR bstrAlternateString,
            /* [out] */ VARIANT_BOOL *pfIsSupported) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsStringSupported( 
            /* [retval][out] */ VARIANT_BOOL *pfIsSupported) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IContextNodeVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IContextNode * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IContextNode * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IContextNode * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetId )( 
            IContextNode * This,
            /* [out] */ GUID *pId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetType )( 
            IContextNode * This,
            /* [out] */ GUID *pContextNodeType);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetLocation )( 
            IContextNode * This,
            /* [out] */ IAnalysisRegion **ppIAnalysisRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTypeName )( 
            IContextNode * This,
            /* [out] */ BSTR *pbstrContextNodeType);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetLocation )( 
            IContextNode * This,
            /* [in] */ IAnalysisRegion *pIAnalysisRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetParentNode )( 
            IContextNode * This,
            /* [out] */ IContextNode **ppParentContextNode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reparent )( 
            IContextNode * This,
            /* [in] */ IContextNode *pNewParent);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSubNodes )( 
            IContextNode * This,
            /* [out] */ IContextNodes **ppSubContextNodes);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateSubNode )( 
            IContextNode * This,
            /* [in] */ const GUID *pNodeType,
            /* [out] */ IContextNode **ppContextNodeCreated);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreatePartiallyPopulatedSubNode )( 
            IContextNode * This,
            /* [in] */ const GUID *pNodeType,
            /* [in] */ const GUID *pNodeId,
            /* [in] */ IAnalysisRegion *pNodeLocation,
            /* [out] */ IContextNode **ppPartiallyPopulatedContextNodeCreated);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetPartiallyPopulated )( 
            IContextNode * This,
            /* [out] */ VARIANT_BOOL *pfPartiallyPopulated);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetPartiallyPopulated )( 
            IContextNode * This,
            /* [in] */ VARIANT_BOOL fPartiallyPopulated);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *LoadPropertiesData )( 
            IContextNode * This,
            /* [in] */ ULONG cbPropertiesDataSize,
            /* [size_is][in] */ BYTE *pbPropertiesData,
            /* [out] */ VARIANT_BOOL *pfSuccessful);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SavePropertiesData )( 
            IContextNode * This,
            /* [out][in] */ ULONG *pulPropertiesDataSize,
            /* [size_is][out] */ BYTE **ppbPropertiesData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *DeleteSubNode )( 
            IContextNode * This,
            /* [in] */ IContextNode *pContextNodeToDelete);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddPropertyData )( 
            IContextNode * This,
            /* [in] */ const GUID *pPropertyDataId,
            /* [in] */ ULONG ulPropertyDataSize,
            /* [size_is][in] */ BYTE *pbPropertyData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetPropertyData )( 
            IContextNode * This,
            /* [in] */ const GUID *pPropertyDataId,
            /* [out][in] */ ULONG *pulPropertyDataSize,
            /* [size_is][out] */ BYTE **ppbPropertyData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemovePropertyData )( 
            IContextNode * This,
            /* [in] */ const GUID *pPropertyDataId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetPropertyDataIds )( 
            IContextNode * This,
            /* [out][in] */ ULONG *pulGuidCount,
            /* [size_is][out] */ GUID **ppGuids);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContainsPropertyData )( 
            IContextNode * This,
            /* [in] */ const GUID *pPropertyDataId,
            /* [out] */ VARIANT_BOOL *pbContains);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetStrokes )( 
            IContextNode * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokeIds )( 
            IContextNode * This,
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ LONG **pplStrokes);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokeCount )( 
            IContextNode * This,
            /* [out] */ ULONG *pulStrokeCount);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokePacketDataById )( 
            IContextNode * This,
            /* [in] */ LONG strokeId,
            /* [out][in] */ ULONG *pStrokePacketDataCount,
            /* [size_is][out] */ LONG **pplStrokePacketData);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokePacketDescriptionById )( 
            IContextNode * This,
            /* [in] */ LONG lStrokeId,
            /* [out][in] */ ULONG *pulStrokePacketDescriptionCount,
            /* [size_is][out] */ GUID **ppStrokePacketDescriptionGuids);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *MoveSubNodeToPosition )( 
            IContextNode * This,
            /* [in] */ IContextNode *pSubnodeToMove,
            /* [in] */ ULONG ulNewIndex);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReparentStrokesByIdToNode )( 
            IContextNode * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ IContextNode *pContextNodeDestination);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Confirm )( 
            IContextNode * This,
            /* [in] */ ConfirmationType confirmedType);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsConfirmed )( 
            IContextNode * This,
            /* [in] */ ConfirmationType confirmedType,
            /* [out] */ VARIANT_BOOL *pfTypeConfirmed);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetContextLinks )( 
            IContextNode * This,
            /* [out] */ IContextLinks **ppContextLinks);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsAlternateStringSupported )( 
            IContextNode * This,
            /* [in] */ BSTR bstrAlternateString,
            /* [out] */ VARIANT_BOOL *pfIsSupported);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsStringSupported )( 
            IContextNode * This,
            /* [retval][out] */ VARIANT_BOOL *pfIsSupported);
        
        END_INTERFACE
    } IContextNodeVtbl;

    interface IContextNode
    {
        CONST_VTBL struct IContextNodeVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IContextNode_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IContextNode_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IContextNode_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IContextNode_GetId(This,pId)	\
    (This)->lpVtbl -> GetId(This,pId)

#define IContextNode_GetType(This,pContextNodeType)	\
    (This)->lpVtbl -> GetType(This,pContextNodeType)

#define IContextNode_GetLocation(This,ppIAnalysisRegion)	\
    (This)->lpVtbl -> GetLocation(This,ppIAnalysisRegion)

#define IContextNode_GetTypeName(This,pbstrContextNodeType)	\
    (This)->lpVtbl -> GetTypeName(This,pbstrContextNodeType)

#define IContextNode_SetLocation(This,pIAnalysisRegion)	\
    (This)->lpVtbl -> SetLocation(This,pIAnalysisRegion)

#define IContextNode_GetParentNode(This,ppParentContextNode)	\
    (This)->lpVtbl -> GetParentNode(This,ppParentContextNode)

#define IContextNode_Reparent(This,pNewParent)	\
    (This)->lpVtbl -> Reparent(This,pNewParent)

#define IContextNode_GetSubNodes(This,ppSubContextNodes)	\
    (This)->lpVtbl -> GetSubNodes(This,ppSubContextNodes)

#define IContextNode_CreateSubNode(This,pNodeType,ppContextNodeCreated)	\
    (This)->lpVtbl -> CreateSubNode(This,pNodeType,ppContextNodeCreated)

#define IContextNode_CreatePartiallyPopulatedSubNode(This,pNodeType,pNodeId,pNodeLocation,ppPartiallyPopulatedContextNodeCreated)	\
    (This)->lpVtbl -> CreatePartiallyPopulatedSubNode(This,pNodeType,pNodeId,pNodeLocation,ppPartiallyPopulatedContextNodeCreated)

#define IContextNode_GetPartiallyPopulated(This,pfPartiallyPopulated)	\
    (This)->lpVtbl -> GetPartiallyPopulated(This,pfPartiallyPopulated)

#define IContextNode_SetPartiallyPopulated(This,fPartiallyPopulated)	\
    (This)->lpVtbl -> SetPartiallyPopulated(This,fPartiallyPopulated)

#define IContextNode_LoadPropertiesData(This,cbPropertiesDataSize,pbPropertiesData,pfSuccessful)	\
    (This)->lpVtbl -> LoadPropertiesData(This,cbPropertiesDataSize,pbPropertiesData,pfSuccessful)

#define IContextNode_SavePropertiesData(This,pulPropertiesDataSize,ppbPropertiesData)	\
    (This)->lpVtbl -> SavePropertiesData(This,pulPropertiesDataSize,ppbPropertiesData)

#define IContextNode_DeleteSubNode(This,pContextNodeToDelete)	\
    (This)->lpVtbl -> DeleteSubNode(This,pContextNodeToDelete)

#define IContextNode_AddPropertyData(This,pPropertyDataId,ulPropertyDataSize,pbPropertyData)	\
    (This)->lpVtbl -> AddPropertyData(This,pPropertyDataId,ulPropertyDataSize,pbPropertyData)

#define IContextNode_GetPropertyData(This,pPropertyDataId,pulPropertyDataSize,ppbPropertyData)	\
    (This)->lpVtbl -> GetPropertyData(This,pPropertyDataId,pulPropertyDataSize,ppbPropertyData)

#define IContextNode_RemovePropertyData(This,pPropertyDataId)	\
    (This)->lpVtbl -> RemovePropertyData(This,pPropertyDataId)

#define IContextNode_GetPropertyDataIds(This,pulGuidCount,ppGuids)	\
    (This)->lpVtbl -> GetPropertyDataIds(This,pulGuidCount,ppGuids)

#define IContextNode_ContainsPropertyData(This,pPropertyDataId,pbContains)	\
    (This)->lpVtbl -> ContainsPropertyData(This,pPropertyDataId,pbContains)

#define IContextNode_SetStrokes(This,ulStrokeIdsCount,plStrokeIds)	\
    (This)->lpVtbl -> SetStrokes(This,ulStrokeIdsCount,plStrokeIds)

#define IContextNode_GetStrokeIds(This,pulStrokeIdsCount,pplStrokes)	\
    (This)->lpVtbl -> GetStrokeIds(This,pulStrokeIdsCount,pplStrokes)

#define IContextNode_GetStrokeCount(This,pulStrokeCount)	\
    (This)->lpVtbl -> GetStrokeCount(This,pulStrokeCount)

#define IContextNode_GetStrokePacketDataById(This,strokeId,pStrokePacketDataCount,pplStrokePacketData)	\
    (This)->lpVtbl -> GetStrokePacketDataById(This,strokeId,pStrokePacketDataCount,pplStrokePacketData)

#define IContextNode_GetStrokePacketDescriptionById(This,lStrokeId,pulStrokePacketDescriptionCount,ppStrokePacketDescriptionGuids)	\
    (This)->lpVtbl -> GetStrokePacketDescriptionById(This,lStrokeId,pulStrokePacketDescriptionCount,ppStrokePacketDescriptionGuids)

#define IContextNode_MoveSubNodeToPosition(This,pSubnodeToMove,ulNewIndex)	\
    (This)->lpVtbl -> MoveSubNodeToPosition(This,pSubnodeToMove,ulNewIndex)

#define IContextNode_ReparentStrokesByIdToNode(This,ulStrokeIdsCount,plStrokeIds,pContextNodeDestination)	\
    (This)->lpVtbl -> ReparentStrokesByIdToNode(This,ulStrokeIdsCount,plStrokeIds,pContextNodeDestination)

#define IContextNode_Confirm(This,confirmedType)	\
    (This)->lpVtbl -> Confirm(This,confirmedType)

#define IContextNode_IsConfirmed(This,confirmedType,pfTypeConfirmed)	\
    (This)->lpVtbl -> IsConfirmed(This,confirmedType,pfTypeConfirmed)

#define IContextNode_GetContextLinks(This,ppContextLinks)	\
    (This)->lpVtbl -> GetContextLinks(This,ppContextLinks)

#define IContextNode_IsAlternateStringSupported(This,bstrAlternateString,pfIsSupported)	\
    (This)->lpVtbl -> IsAlternateStringSupported(This,bstrAlternateString,pfIsSupported)

#define IContextNode_IsStringSupported(This,pfIsSupported)	\
    (This)->lpVtbl -> IsStringSupported(This,pfIsSupported)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetId_Proxy( 
    IContextNode * This,
    /* [out] */ GUID *pId);


void __RPC_STUB IContextNode_GetId_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetType_Proxy( 
    IContextNode * This,
    /* [out] */ GUID *pContextNodeType);


void __RPC_STUB IContextNode_GetType_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetLocation_Proxy( 
    IContextNode * This,
    /* [out] */ IAnalysisRegion **ppIAnalysisRegion);


void __RPC_STUB IContextNode_GetLocation_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetTypeName_Proxy( 
    IContextNode * This,
    /* [out] */ BSTR *pbstrContextNodeType);


void __RPC_STUB IContextNode_GetTypeName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_SetLocation_Proxy( 
    IContextNode * This,
    /* [in] */ IAnalysisRegion *pIAnalysisRegion);


void __RPC_STUB IContextNode_SetLocation_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetParentNode_Proxy( 
    IContextNode * This,
    /* [out] */ IContextNode **ppParentContextNode);


void __RPC_STUB IContextNode_GetParentNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_Reparent_Proxy( 
    IContextNode * This,
    /* [in] */ IContextNode *pNewParent);


void __RPC_STUB IContextNode_Reparent_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetSubNodes_Proxy( 
    IContextNode * This,
    /* [out] */ IContextNodes **ppSubContextNodes);


void __RPC_STUB IContextNode_GetSubNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_CreateSubNode_Proxy( 
    IContextNode * This,
    /* [in] */ const GUID *pNodeType,
    /* [out] */ IContextNode **ppContextNodeCreated);


void __RPC_STUB IContextNode_CreateSubNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_CreatePartiallyPopulatedSubNode_Proxy( 
    IContextNode * This,
    /* [in] */ const GUID *pNodeType,
    /* [in] */ const GUID *pNodeId,
    /* [in] */ IAnalysisRegion *pNodeLocation,
    /* [out] */ IContextNode **ppPartiallyPopulatedContextNodeCreated);


void __RPC_STUB IContextNode_CreatePartiallyPopulatedSubNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetPartiallyPopulated_Proxy( 
    IContextNode * This,
    /* [out] */ VARIANT_BOOL *pfPartiallyPopulated);


void __RPC_STUB IContextNode_GetPartiallyPopulated_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_SetPartiallyPopulated_Proxy( 
    IContextNode * This,
    /* [in] */ VARIANT_BOOL fPartiallyPopulated);


void __RPC_STUB IContextNode_SetPartiallyPopulated_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_LoadPropertiesData_Proxy( 
    IContextNode * This,
    /* [in] */ ULONG cbPropertiesDataSize,
    /* [size_is][in] */ BYTE *pbPropertiesData,
    /* [out] */ VARIANT_BOOL *pfSuccessful);


void __RPC_STUB IContextNode_LoadPropertiesData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_SavePropertiesData_Proxy( 
    IContextNode * This,
    /* [out][in] */ ULONG *pulPropertiesDataSize,
    /* [size_is][out] */ BYTE **ppbPropertiesData);


void __RPC_STUB IContextNode_SavePropertiesData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_DeleteSubNode_Proxy( 
    IContextNode * This,
    /* [in] */ IContextNode *pContextNodeToDelete);


void __RPC_STUB IContextNode_DeleteSubNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_AddPropertyData_Proxy( 
    IContextNode * This,
    /* [in] */ const GUID *pPropertyDataId,
    /* [in] */ ULONG ulPropertyDataSize,
    /* [size_is][in] */ BYTE *pbPropertyData);


void __RPC_STUB IContextNode_AddPropertyData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetPropertyData_Proxy( 
    IContextNode * This,
    /* [in] */ const GUID *pPropertyDataId,
    /* [out][in] */ ULONG *pulPropertyDataSize,
    /* [size_is][out] */ BYTE **ppbPropertyData);


void __RPC_STUB IContextNode_GetPropertyData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_RemovePropertyData_Proxy( 
    IContextNode * This,
    /* [in] */ const GUID *pPropertyDataId);


void __RPC_STUB IContextNode_RemovePropertyData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetPropertyDataIds_Proxy( 
    IContextNode * This,
    /* [out][in] */ ULONG *pulGuidCount,
    /* [size_is][out] */ GUID **ppGuids);


void __RPC_STUB IContextNode_GetPropertyDataIds_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_ContainsPropertyData_Proxy( 
    IContextNode * This,
    /* [in] */ const GUID *pPropertyDataId,
    /* [out] */ VARIANT_BOOL *pbContains);


void __RPC_STUB IContextNode_ContainsPropertyData_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_SetStrokes_Proxy( 
    IContextNode * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds);


void __RPC_STUB IContextNode_SetStrokes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetStrokeIds_Proxy( 
    IContextNode * This,
    /* [out][in] */ ULONG *pulStrokeIdsCount,
    /* [size_is][out] */ LONG **pplStrokes);


void __RPC_STUB IContextNode_GetStrokeIds_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetStrokeCount_Proxy( 
    IContextNode * This,
    /* [out] */ ULONG *pulStrokeCount);


void __RPC_STUB IContextNode_GetStrokeCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetStrokePacketDataById_Proxy( 
    IContextNode * This,
    /* [in] */ LONG strokeId,
    /* [out][in] */ ULONG *pStrokePacketDataCount,
    /* [size_is][out] */ LONG **pplStrokePacketData);


void __RPC_STUB IContextNode_GetStrokePacketDataById_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetStrokePacketDescriptionById_Proxy( 
    IContextNode * This,
    /* [in] */ LONG lStrokeId,
    /* [out][in] */ ULONG *pulStrokePacketDescriptionCount,
    /* [size_is][out] */ GUID **ppStrokePacketDescriptionGuids);


void __RPC_STUB IContextNode_GetStrokePacketDescriptionById_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_MoveSubNodeToPosition_Proxy( 
    IContextNode * This,
    /* [in] */ IContextNode *pSubnodeToMove,
    /* [in] */ ULONG ulNewIndex);


void __RPC_STUB IContextNode_MoveSubNodeToPosition_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_ReparentStrokesByIdToNode_Proxy( 
    IContextNode * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [in] */ IContextNode *pContextNodeDestination);


void __RPC_STUB IContextNode_ReparentStrokesByIdToNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_Confirm_Proxy( 
    IContextNode * This,
    /* [in] */ ConfirmationType confirmedType);


void __RPC_STUB IContextNode_Confirm_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_IsConfirmed_Proxy( 
    IContextNode * This,
    /* [in] */ ConfirmationType confirmedType,
    /* [out] */ VARIANT_BOOL *pfTypeConfirmed);


void __RPC_STUB IContextNode_IsConfirmed_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_GetContextLinks_Proxy( 
    IContextNode * This,
    /* [out] */ IContextLinks **ppContextLinks);


void __RPC_STUB IContextNode_GetContextLinks_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_IsAlternateStringSupported_Proxy( 
    IContextNode * This,
    /* [in] */ BSTR bstrAlternateString,
    /* [out] */ VARIANT_BOOL *pfIsSupported);


void __RPC_STUB IContextNode_IsAlternateStringSupported_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNode_IsStringSupported_Proxy( 
    IContextNode * This,
    /* [retval][out] */ VARIANT_BOOL *pfIsSupported);


void __RPC_STUB IContextNode_IsStringSupported_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IContextNode_INTERFACE_DEFINED__ */


#ifndef __IContextNodes_INTERFACE_DEFINED__
#define __IContextNodes_INTERFACE_DEFINED__

/* interface IContextNodes */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IContextNodes;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("23A56238-A883-4393-B539-8C1E2996B7A2")
    IContextNodes : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetCount( 
            /* [out] */ ULONG *pulCount) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetContextNode( 
            /* [in] */ ULONG ulIndex,
            /* [out] */ IContextNode **ppContextNode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddContextNode( 
            /* [in] */ IContextNode *pContextNode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE RemoveContextNode( 
            /* [in] */ IContextNode *pContextNode) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IContextNodesVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IContextNodes * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IContextNodes * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IContextNodes * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCount )( 
            IContextNodes * This,
            /* [out] */ ULONG *pulCount);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetContextNode )( 
            IContextNodes * This,
            /* [in] */ ULONG ulIndex,
            /* [out] */ IContextNode **ppContextNode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddContextNode )( 
            IContextNodes * This,
            /* [in] */ IContextNode *pContextNode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveContextNode )( 
            IContextNodes * This,
            /* [in] */ IContextNode *pContextNode);
        
        END_INTERFACE
    } IContextNodesVtbl;

    interface IContextNodes
    {
        CONST_VTBL struct IContextNodesVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IContextNodes_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IContextNodes_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IContextNodes_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IContextNodes_GetCount(This,pulCount)	\
    (This)->lpVtbl -> GetCount(This,pulCount)

#define IContextNodes_GetContextNode(This,ulIndex,ppContextNode)	\
    (This)->lpVtbl -> GetContextNode(This,ulIndex,ppContextNode)

#define IContextNodes_AddContextNode(This,pContextNode)	\
    (This)->lpVtbl -> AddContextNode(This,pContextNode)

#define IContextNodes_RemoveContextNode(This,pContextNode)	\
    (This)->lpVtbl -> RemoveContextNode(This,pContextNode)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNodes_GetCount_Proxy( 
    IContextNodes * This,
    /* [out] */ ULONG *pulCount);


void __RPC_STUB IContextNodes_GetCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNodes_GetContextNode_Proxy( 
    IContextNodes * This,
    /* [in] */ ULONG ulIndex,
    /* [out] */ IContextNode **ppContextNode);


void __RPC_STUB IContextNodes_GetContextNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNodes_AddContextNode_Proxy( 
    IContextNodes * This,
    /* [in] */ IContextNode *pContextNode);


void __RPC_STUB IContextNodes_AddContextNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextNodes_RemoveContextNode_Proxy( 
    IContextNodes * This,
    /* [in] */ IContextNode *pContextNode);


void __RPC_STUB IContextNodes_RemoveContextNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IContextNodes_INTERFACE_DEFINED__ */


#ifndef __IAnalysisRegion_INTERFACE_DEFINED__
#define __IAnalysisRegion_INTERFACE_DEFINED__

/* interface IAnalysisRegion */
/* [unique][uuid][helpcontext][helpstring][object] */ 


EXTERN_C const IID IID_IAnalysisRegion;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("F76EBC66-ABEF-3248-AE9B-F20D4B9149FE")
    IAnalysisRegion : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsEmpty( 
            /* [out] */ VARIANT_BOOL *pfIsEmpty) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE MakeEmpty( void) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE MakeInfinite( void) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsInfinite( 
            /* [out] */ VARIANT_BOOL *pfIsInfinite) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Clone( 
            /* [out] */ IAnalysisRegion **pClonedRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetRegionScans( 
            /* [out] */ ULONG *pulRectCount,
            /* [out] */ RECT **pRegionScans) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE UnionRectangle( 
            /* [in] */ RECT *pRectangle) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE UnionRegion( 
            /* [in] */ IAnalysisRegion *pRegionToUnion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetBounds( 
            /* [out] */ RECT *pBoundingRectangle) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IntersectRectangle( 
            /* [in] */ RECT *pIntersectingRectangle) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IntersectRegion( 
            /* [in] */ IAnalysisRegion *pRegionToIntersect) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IntersectsWith( 
            /* [in] */ RECT *pRectangle,
            /* [out] */ VARIANT_BOOL *pfIsIntersecting) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ExcludeRectangle( 
            /* [in] */ RECT *pExcludingRectangle) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ExcludeRegion( 
            /* [in] */ IAnalysisRegion *pRegionToExclude) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE EqualsRegion( 
            /* [in] */ IAnalysisRegion *pOtherRegion,
            /* [out] */ VARIANT_BOOL *pfRegionsEqual) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnalysisRegionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAnalysisRegion * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAnalysisRegion * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAnalysisRegion * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsEmpty )( 
            IAnalysisRegion * This,
            /* [out] */ VARIANT_BOOL *pfIsEmpty);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *MakeEmpty )( 
            IAnalysisRegion * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *MakeInfinite )( 
            IAnalysisRegion * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsInfinite )( 
            IAnalysisRegion * This,
            /* [out] */ VARIANT_BOOL *pfIsInfinite);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clone )( 
            IAnalysisRegion * This,
            /* [out] */ IAnalysisRegion **pClonedRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRegionScans )( 
            IAnalysisRegion * This,
            /* [out] */ ULONG *pulRectCount,
            /* [out] */ RECT **pRegionScans);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnionRectangle )( 
            IAnalysisRegion * This,
            /* [in] */ RECT *pRectangle);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnionRegion )( 
            IAnalysisRegion * This,
            /* [in] */ IAnalysisRegion *pRegionToUnion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetBounds )( 
            IAnalysisRegion * This,
            /* [out] */ RECT *pBoundingRectangle);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IntersectRectangle )( 
            IAnalysisRegion * This,
            /* [in] */ RECT *pIntersectingRectangle);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IntersectRegion )( 
            IAnalysisRegion * This,
            /* [in] */ IAnalysisRegion *pRegionToIntersect);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IntersectsWith )( 
            IAnalysisRegion * This,
            /* [in] */ RECT *pRectangle,
            /* [out] */ VARIANT_BOOL *pfIsIntersecting);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ExcludeRectangle )( 
            IAnalysisRegion * This,
            /* [in] */ RECT *pExcludingRectangle);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ExcludeRegion )( 
            IAnalysisRegion * This,
            /* [in] */ IAnalysisRegion *pRegionToExclude);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *EqualsRegion )( 
            IAnalysisRegion * This,
            /* [in] */ IAnalysisRegion *pOtherRegion,
            /* [out] */ VARIANT_BOOL *pfRegionsEqual);
        
        END_INTERFACE
    } IAnalysisRegionVtbl;

    interface IAnalysisRegion
    {
        CONST_VTBL struct IAnalysisRegionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnalysisRegion_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAnalysisRegion_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAnalysisRegion_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAnalysisRegion_IsEmpty(This,pfIsEmpty)	\
    (This)->lpVtbl -> IsEmpty(This,pfIsEmpty)

#define IAnalysisRegion_MakeEmpty(This)	\
    (This)->lpVtbl -> MakeEmpty(This)

#define IAnalysisRegion_MakeInfinite(This)	\
    (This)->lpVtbl -> MakeInfinite(This)

#define IAnalysisRegion_IsInfinite(This,pfIsInfinite)	\
    (This)->lpVtbl -> IsInfinite(This,pfIsInfinite)

#define IAnalysisRegion_Clone(This,pClonedRegion)	\
    (This)->lpVtbl -> Clone(This,pClonedRegion)

#define IAnalysisRegion_GetRegionScans(This,pulRectCount,pRegionScans)	\
    (This)->lpVtbl -> GetRegionScans(This,pulRectCount,pRegionScans)

#define IAnalysisRegion_UnionRectangle(This,pRectangle)	\
    (This)->lpVtbl -> UnionRectangle(This,pRectangle)

#define IAnalysisRegion_UnionRegion(This,pRegionToUnion)	\
    (This)->lpVtbl -> UnionRegion(This,pRegionToUnion)

#define IAnalysisRegion_GetBounds(This,pBoundingRectangle)	\
    (This)->lpVtbl -> GetBounds(This,pBoundingRectangle)

#define IAnalysisRegion_IntersectRectangle(This,pIntersectingRectangle)	\
    (This)->lpVtbl -> IntersectRectangle(This,pIntersectingRectangle)

#define IAnalysisRegion_IntersectRegion(This,pRegionToIntersect)	\
    (This)->lpVtbl -> IntersectRegion(This,pRegionToIntersect)

#define IAnalysisRegion_IntersectsWith(This,pRectangle,pfIsIntersecting)	\
    (This)->lpVtbl -> IntersectsWith(This,pRectangle,pfIsIntersecting)

#define IAnalysisRegion_ExcludeRectangle(This,pExcludingRectangle)	\
    (This)->lpVtbl -> ExcludeRectangle(This,pExcludingRectangle)

#define IAnalysisRegion_ExcludeRegion(This,pRegionToExclude)	\
    (This)->lpVtbl -> ExcludeRegion(This,pRegionToExclude)

#define IAnalysisRegion_EqualsRegion(This,pOtherRegion,pfRegionsEqual)	\
    (This)->lpVtbl -> EqualsRegion(This,pOtherRegion,pfRegionsEqual)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_IsEmpty_Proxy( 
    IAnalysisRegion * This,
    /* [out] */ VARIANT_BOOL *pfIsEmpty);


void __RPC_STUB IAnalysisRegion_IsEmpty_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_MakeEmpty_Proxy( 
    IAnalysisRegion * This);


void __RPC_STUB IAnalysisRegion_MakeEmpty_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_MakeInfinite_Proxy( 
    IAnalysisRegion * This);


void __RPC_STUB IAnalysisRegion_MakeInfinite_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_IsInfinite_Proxy( 
    IAnalysisRegion * This,
    /* [out] */ VARIANT_BOOL *pfIsInfinite);


void __RPC_STUB IAnalysisRegion_IsInfinite_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_Clone_Proxy( 
    IAnalysisRegion * This,
    /* [out] */ IAnalysisRegion **pClonedRegion);


void __RPC_STUB IAnalysisRegion_Clone_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_GetRegionScans_Proxy( 
    IAnalysisRegion * This,
    /* [out] */ ULONG *pulRectCount,
    /* [out] */ RECT **pRegionScans);


void __RPC_STUB IAnalysisRegion_GetRegionScans_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_UnionRectangle_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ RECT *pRectangle);


void __RPC_STUB IAnalysisRegion_UnionRectangle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_UnionRegion_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ IAnalysisRegion *pRegionToUnion);


void __RPC_STUB IAnalysisRegion_UnionRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_GetBounds_Proxy( 
    IAnalysisRegion * This,
    /* [out] */ RECT *pBoundingRectangle);


void __RPC_STUB IAnalysisRegion_GetBounds_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_IntersectRectangle_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ RECT *pIntersectingRectangle);


void __RPC_STUB IAnalysisRegion_IntersectRectangle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_IntersectRegion_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ IAnalysisRegion *pRegionToIntersect);


void __RPC_STUB IAnalysisRegion_IntersectRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_IntersectsWith_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ RECT *pRectangle,
    /* [out] */ VARIANT_BOOL *pfIsIntersecting);


void __RPC_STUB IAnalysisRegion_IntersectsWith_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_ExcludeRectangle_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ RECT *pExcludingRectangle);


void __RPC_STUB IAnalysisRegion_ExcludeRectangle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_ExcludeRegion_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ IAnalysisRegion *pRegionToExclude);


void __RPC_STUB IAnalysisRegion_ExcludeRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisRegion_EqualsRegion_Proxy( 
    IAnalysisRegion * This,
    /* [in] */ IAnalysisRegion *pOtherRegion,
    /* [out] */ VARIANT_BOOL *pfRegionsEqual);


void __RPC_STUB IAnalysisRegion_EqualsRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAnalysisRegion_INTERFACE_DEFINED__ */


#ifndef __IContextLink_INTERFACE_DEFINED__
#define __IContextLink_INTERFACE_DEFINED__

/* interface IContextLink */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IContextLink;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("715389A8-84B1-3B52-98FC-E2CCCD27D4B9")
    IContextLink : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetDestinationNode( 
            /* [out] */ IContextNode **ppDstContextNodeId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetSourceNode( 
            /* [out] */ IContextNode **ppSrcContextNodeId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetContextLinkDirection( 
            /* [out] */ ContextLinkDirection *pContextLinkDirection) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IContextLinkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IContextLink * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IContextLink * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IContextLink * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetDestinationNode )( 
            IContextLink * This,
            /* [out] */ IContextNode **ppDstContextNodeId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSourceNode )( 
            IContextLink * This,
            /* [out] */ IContextNode **ppSrcContextNodeId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetContextLinkDirection )( 
            IContextLink * This,
            /* [out] */ ContextLinkDirection *pContextLinkDirection);
        
        END_INTERFACE
    } IContextLinkVtbl;

    interface IContextLink
    {
        CONST_VTBL struct IContextLinkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IContextLink_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IContextLink_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IContextLink_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IContextLink_GetDestinationNode(This,ppDstContextNodeId)	\
    (This)->lpVtbl -> GetDestinationNode(This,ppDstContextNodeId)

#define IContextLink_GetSourceNode(This,ppSrcContextNodeId)	\
    (This)->lpVtbl -> GetSourceNode(This,ppSrcContextNodeId)

#define IContextLink_GetContextLinkDirection(This,pContextLinkDirection)	\
    (This)->lpVtbl -> GetContextLinkDirection(This,pContextLinkDirection)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLink_GetDestinationNode_Proxy( 
    IContextLink * This,
    /* [out] */ IContextNode **ppDstContextNodeId);


void __RPC_STUB IContextLink_GetDestinationNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLink_GetSourceNode_Proxy( 
    IContextLink * This,
    /* [out] */ IContextNode **ppSrcContextNodeId);


void __RPC_STUB IContextLink_GetSourceNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLink_GetContextLinkDirection_Proxy( 
    IContextLink * This,
    /* [out] */ ContextLinkDirection *pContextLinkDirection);


void __RPC_STUB IContextLink_GetContextLinkDirection_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IContextLink_INTERFACE_DEFINED__ */


#ifndef __IContextLinks_INTERFACE_DEFINED__
#define __IContextLinks_INTERFACE_DEFINED__

/* interface IContextLinks */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IContextLinks;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2914EB5A-8B3D-4381-A733-1509A2295394")
    IContextLinks : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetCount( 
            /* [out] */ ULONG *pulCount) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetContextLink( 
            /* [in] */ ULONG ulIndex,
            /* [out] */ IContextLink **ppContextLink) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE AddContextLink( 
            /* [in] */ IContextNode *pDestinationNode,
            /* [in] */ ContextLinkDirection linkDirection,
            /* [out] */ IContextLink **ppContextLinkToAdd) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE DeleteContextLink( 
            /* [in] */ IContextLink *pContextLinkToDelete) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IContextLinksVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IContextLinks * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IContextLinks * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IContextLinks * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCount )( 
            IContextLinks * This,
            /* [out] */ ULONG *pulCount);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetContextLink )( 
            IContextLinks * This,
            /* [in] */ ULONG ulIndex,
            /* [out] */ IContextLink **ppContextLink);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddContextLink )( 
            IContextLinks * This,
            /* [in] */ IContextNode *pDestinationNode,
            /* [in] */ ContextLinkDirection linkDirection,
            /* [out] */ IContextLink **ppContextLinkToAdd);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *DeleteContextLink )( 
            IContextLinks * This,
            /* [in] */ IContextLink *pContextLinkToDelete);
        
        END_INTERFACE
    } IContextLinksVtbl;

    interface IContextLinks
    {
        CONST_VTBL struct IContextLinksVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IContextLinks_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IContextLinks_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IContextLinks_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IContextLinks_GetCount(This,pulCount)	\
    (This)->lpVtbl -> GetCount(This,pulCount)

#define IContextLinks_GetContextLink(This,ulIndex,ppContextLink)	\
    (This)->lpVtbl -> GetContextLink(This,ulIndex,ppContextLink)

#define IContextLinks_AddContextLink(This,pDestinationNode,linkDirection,ppContextLinkToAdd)	\
    (This)->lpVtbl -> AddContextLink(This,pDestinationNode,linkDirection,ppContextLinkToAdd)

#define IContextLinks_DeleteContextLink(This,pContextLinkToDelete)	\
    (This)->lpVtbl -> DeleteContextLink(This,pContextLinkToDelete)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLinks_GetCount_Proxy( 
    IContextLinks * This,
    /* [out] */ ULONG *pulCount);


void __RPC_STUB IContextLinks_GetCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLinks_GetContextLink_Proxy( 
    IContextLinks * This,
    /* [in] */ ULONG ulIndex,
    /* [out] */ IContextLink **ppContextLink);


void __RPC_STUB IContextLinks_GetContextLink_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLinks_AddContextLink_Proxy( 
    IContextLinks * This,
    /* [in] */ IContextNode *pDestinationNode,
    /* [in] */ ContextLinkDirection linkDirection,
    /* [out] */ IContextLink **ppContextLinkToAdd);


void __RPC_STUB IContextLinks_AddContextLink_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IContextLinks_DeleteContextLink_Proxy( 
    IContextLinks * This,
    /* [in] */ IContextLink *pContextLinkToDelete);


void __RPC_STUB IContextLinks_DeleteContextLink_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IContextLinks_INTERFACE_DEFINED__ */


#ifndef __IInkAnalysisRecognizer_INTERFACE_DEFINED__
#define __IInkAnalysisRecognizer_INTERFACE_DEFINED__

/* interface IInkAnalysisRecognizer */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IInkAnalysisRecognizer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("BD5F33DF-BEBB-3D05-98AC-F0986D3BEF17")
    IInkAnalysisRecognizer : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetName( 
            /* [out] */ BSTR *pbstrName) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetGuid( 
            /* [out] */ GUID *pId) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetVendor( 
            /* [out] */ BSTR *pbstrVendor) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetCapabilities( 
            /* [out] */ InkAnalysisRecognizerCapabilities *pCapabilities) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetSupportedProperties( 
            /* [out][in] */ ULONG *pulPropertiesCount,
            /* [size_is][out] */ GUID **ppProperties) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetLanguages( 
            /* [out][in] */ ULONG *pulLanguagesCount,
            /* [size_is][out] */ ULONG **ppulLanguages) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetUnicodeRanges( 
            /* [out][in] */ ULONG *pulNumberOfRanges,
            /* [size_is][out] */ WCHAR **ppulLowUnicode,
            /* [size_is][out] */ USHORT **ppusUnicodeRangeLength) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE SetAsHighestPriorityInkAnalysisRecognizer( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IInkAnalysisRecognizerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IInkAnalysisRecognizer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IInkAnalysisRecognizer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IInkAnalysisRecognizer * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetName )( 
            IInkAnalysisRecognizer * This,
            /* [out] */ BSTR *pbstrName);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetGuid )( 
            IInkAnalysisRecognizer * This,
            /* [out] */ GUID *pId);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetVendor )( 
            IInkAnalysisRecognizer * This,
            /* [out] */ BSTR *pbstrVendor);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCapabilities )( 
            IInkAnalysisRecognizer * This,
            /* [out] */ InkAnalysisRecognizerCapabilities *pCapabilities);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetSupportedProperties )( 
            IInkAnalysisRecognizer * This,
            /* [out][in] */ ULONG *pulPropertiesCount,
            /* [size_is][out] */ GUID **ppProperties);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetLanguages )( 
            IInkAnalysisRecognizer * This,
            /* [out][in] */ ULONG *pulLanguagesCount,
            /* [size_is][out] */ ULONG **ppulLanguages);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetUnicodeRanges )( 
            IInkAnalysisRecognizer * This,
            /* [out][in] */ ULONG *pulNumberOfRanges,
            /* [size_is][out] */ WCHAR **ppulLowUnicode,
            /* [size_is][out] */ USHORT **ppusUnicodeRangeLength);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetAsHighestPriorityInkAnalysisRecognizer )( 
            IInkAnalysisRecognizer * This);
        
        END_INTERFACE
    } IInkAnalysisRecognizerVtbl;

    interface IInkAnalysisRecognizer
    {
        CONST_VTBL struct IInkAnalysisRecognizerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IInkAnalysisRecognizer_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IInkAnalysisRecognizer_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IInkAnalysisRecognizer_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IInkAnalysisRecognizer_GetName(This,pbstrName)	\
    (This)->lpVtbl -> GetName(This,pbstrName)

#define IInkAnalysisRecognizer_GetGuid(This,pId)	\
    (This)->lpVtbl -> GetGuid(This,pId)

#define IInkAnalysisRecognizer_GetVendor(This,pbstrVendor)	\
    (This)->lpVtbl -> GetVendor(This,pbstrVendor)

#define IInkAnalysisRecognizer_GetCapabilities(This,pCapabilities)	\
    (This)->lpVtbl -> GetCapabilities(This,pCapabilities)

#define IInkAnalysisRecognizer_GetSupportedProperties(This,pulPropertiesCount,ppProperties)	\
    (This)->lpVtbl -> GetSupportedProperties(This,pulPropertiesCount,ppProperties)

#define IInkAnalysisRecognizer_GetLanguages(This,pulLanguagesCount,ppulLanguages)	\
    (This)->lpVtbl -> GetLanguages(This,pulLanguagesCount,ppulLanguages)

#define IInkAnalysisRecognizer_GetUnicodeRanges(This,pulNumberOfRanges,ppulLowUnicode,ppusUnicodeRangeLength)	\
    (This)->lpVtbl -> GetUnicodeRanges(This,pulNumberOfRanges,ppulLowUnicode,ppusUnicodeRangeLength)

#define IInkAnalysisRecognizer_SetAsHighestPriorityInkAnalysisRecognizer(This)	\
    (This)->lpVtbl -> SetAsHighestPriorityInkAnalysisRecognizer(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetName_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out] */ BSTR *pbstrName);


void __RPC_STUB IInkAnalysisRecognizer_GetName_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetGuid_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out] */ GUID *pId);


void __RPC_STUB IInkAnalysisRecognizer_GetGuid_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetVendor_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out] */ BSTR *pbstrVendor);


void __RPC_STUB IInkAnalysisRecognizer_GetVendor_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetCapabilities_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out] */ InkAnalysisRecognizerCapabilities *pCapabilities);


void __RPC_STUB IInkAnalysisRecognizer_GetCapabilities_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetSupportedProperties_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out][in] */ ULONG *pulPropertiesCount,
    /* [size_is][out] */ GUID **ppProperties);


void __RPC_STUB IInkAnalysisRecognizer_GetSupportedProperties_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetLanguages_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out][in] */ ULONG *pulLanguagesCount,
    /* [size_is][out] */ ULONG **ppulLanguages);


void __RPC_STUB IInkAnalysisRecognizer_GetLanguages_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_GetUnicodeRanges_Proxy( 
    IInkAnalysisRecognizer * This,
    /* [out][in] */ ULONG *pulNumberOfRanges,
    /* [size_is][out] */ WCHAR **ppulLowUnicode,
    /* [size_is][out] */ USHORT **ppusUnicodeRangeLength);


void __RPC_STUB IInkAnalysisRecognizer_GetUnicodeRanges_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizer_SetAsHighestPriorityInkAnalysisRecognizer_Proxy( 
    IInkAnalysisRecognizer * This);


void __RPC_STUB IInkAnalysisRecognizer_SetAsHighestPriorityInkAnalysisRecognizer_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IInkAnalysisRecognizer_INTERFACE_DEFINED__ */


#ifndef __IInkAnalysisRecognizers_INTERFACE_DEFINED__
#define __IInkAnalysisRecognizers_INTERFACE_DEFINED__

/* interface IInkAnalysisRecognizers */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IInkAnalysisRecognizers;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("7C3B2C8F-1ADD-309A-9201-22C6E0DDA633")
    IInkAnalysisRecognizers : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetCount( 
            /* [out] */ ULONG *pulCount) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetInkAnalysisRecognizer( 
            /* [in] */ ULONG ulIndex,
            /* [out] */ IInkAnalysisRecognizer **ppInkAnalysisRecognizer) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IInkAnalysisRecognizersVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IInkAnalysisRecognizers * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IInkAnalysisRecognizers * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IInkAnalysisRecognizers * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCount )( 
            IInkAnalysisRecognizers * This,
            /* [out] */ ULONG *pulCount);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetInkAnalysisRecognizer )( 
            IInkAnalysisRecognizers * This,
            /* [in] */ ULONG ulIndex,
            /* [out] */ IInkAnalysisRecognizer **ppInkAnalysisRecognizer);
        
        END_INTERFACE
    } IInkAnalysisRecognizersVtbl;

    interface IInkAnalysisRecognizers
    {
        CONST_VTBL struct IInkAnalysisRecognizersVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IInkAnalysisRecognizers_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IInkAnalysisRecognizers_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IInkAnalysisRecognizers_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IInkAnalysisRecognizers_GetCount(This,pulCount)	\
    (This)->lpVtbl -> GetCount(This,pulCount)

#define IInkAnalysisRecognizers_GetInkAnalysisRecognizer(This,ulIndex,ppInkAnalysisRecognizer)	\
    (This)->lpVtbl -> GetInkAnalysisRecognizer(This,ulIndex,ppInkAnalysisRecognizer)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizers_GetCount_Proxy( 
    IInkAnalysisRecognizers * This,
    /* [out] */ ULONG *pulCount);


void __RPC_STUB IInkAnalysisRecognizers_GetCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IInkAnalysisRecognizers_GetInkAnalysisRecognizer_Proxy( 
    IInkAnalysisRecognizers * This,
    /* [in] */ ULONG ulIndex,
    /* [out] */ IInkAnalysisRecognizer **ppInkAnalysisRecognizer);


void __RPC_STUB IInkAnalysisRecognizers_GetInkAnalysisRecognizer_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IInkAnalysisRecognizers_INTERFACE_DEFINED__ */


#ifndef __IAnalysisAlternate_INTERFACE_DEFINED__
#define __IAnalysisAlternate_INTERFACE_DEFINED__

/* interface IAnalysisAlternate */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IAnalysisAlternate;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5DB42FCE-8FDE-3E45-8C4A-224C89034F02")
    IAnalysisAlternate : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAlternateNodes( 
            /* [out] */ IContextNodes **ppAlternateNodes) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetRecognizedString( 
            /* [out] */ BSTR *pbstrRecognizedString) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetStrokeIds( 
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ LONG **pplStrokeIds) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetRecognitionConfidence( 
            /* [out] */ RecognitionConfidence *pConfidence) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnalysisAlternateVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAnalysisAlternate * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAnalysisAlternate * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAnalysisAlternate * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAlternateNodes )( 
            IAnalysisAlternate * This,
            /* [out] */ IContextNodes **ppAlternateNodes);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRecognizedString )( 
            IAnalysisAlternate * This,
            /* [out] */ BSTR *pbstrRecognizedString);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetStrokeIds )( 
            IAnalysisAlternate * This,
            /* [out][in] */ ULONG *pulStrokeIdsCount,
            /* [size_is][out] */ LONG **pplStrokeIds);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRecognitionConfidence )( 
            IAnalysisAlternate * This,
            /* [out] */ RecognitionConfidence *pConfidence);
        
        END_INTERFACE
    } IAnalysisAlternateVtbl;

    interface IAnalysisAlternate
    {
        CONST_VTBL struct IAnalysisAlternateVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnalysisAlternate_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAnalysisAlternate_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAnalysisAlternate_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAnalysisAlternate_GetAlternateNodes(This,ppAlternateNodes)	\
    (This)->lpVtbl -> GetAlternateNodes(This,ppAlternateNodes)

#define IAnalysisAlternate_GetRecognizedString(This,pbstrRecognizedString)	\
    (This)->lpVtbl -> GetRecognizedString(This,pbstrRecognizedString)

#define IAnalysisAlternate_GetStrokeIds(This,pulStrokeIdsCount,pplStrokeIds)	\
    (This)->lpVtbl -> GetStrokeIds(This,pulStrokeIdsCount,pplStrokeIds)

#define IAnalysisAlternate_GetRecognitionConfidence(This,pConfidence)	\
    (This)->lpVtbl -> GetRecognitionConfidence(This,pConfidence)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisAlternate_GetAlternateNodes_Proxy( 
    IAnalysisAlternate * This,
    /* [out] */ IContextNodes **ppAlternateNodes);


void __RPC_STUB IAnalysisAlternate_GetAlternateNodes_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisAlternate_GetRecognizedString_Proxy( 
    IAnalysisAlternate * This,
    /* [out] */ BSTR *pbstrRecognizedString);


void __RPC_STUB IAnalysisAlternate_GetRecognizedString_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisAlternate_GetStrokeIds_Proxy( 
    IAnalysisAlternate * This,
    /* [out][in] */ ULONG *pulStrokeIdsCount,
    /* [size_is][out] */ LONG **pplStrokeIds);


void __RPC_STUB IAnalysisAlternate_GetStrokeIds_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisAlternate_GetRecognitionConfidence_Proxy( 
    IAnalysisAlternate * This,
    /* [out] */ RecognitionConfidence *pConfidence);


void __RPC_STUB IAnalysisAlternate_GetRecognitionConfidence_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAnalysisAlternate_INTERFACE_DEFINED__ */


#ifndef __IAnalysisAlternates_INTERFACE_DEFINED__
#define __IAnalysisAlternates_INTERFACE_DEFINED__

/* interface IAnalysisAlternates */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IAnalysisAlternates;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4262DF99-1C25-3CF8-98CB-4528DE750F08")
    IAnalysisAlternates : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetCount( 
            /* [out] */ ULONG *pulCount) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAnalysisAlternate( 
            /* [in] */ ULONG ulIndex,
            /* [out] */ IAnalysisAlternate **ppAlternate) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnalysisAlternatesVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAnalysisAlternates * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAnalysisAlternates * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAnalysisAlternates * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCount )( 
            IAnalysisAlternates * This,
            /* [out] */ ULONG *pulCount);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAnalysisAlternate )( 
            IAnalysisAlternates * This,
            /* [in] */ ULONG ulIndex,
            /* [out] */ IAnalysisAlternate **ppAlternate);
        
        END_INTERFACE
    } IAnalysisAlternatesVtbl;

    interface IAnalysisAlternates
    {
        CONST_VTBL struct IAnalysisAlternatesVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnalysisAlternates_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAnalysisAlternates_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAnalysisAlternates_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAnalysisAlternates_GetCount(This,pulCount)	\
    (This)->lpVtbl -> GetCount(This,pulCount)

#define IAnalysisAlternates_GetAnalysisAlternate(This,ulIndex,ppAlternate)	\
    (This)->lpVtbl -> GetAnalysisAlternate(This,ulIndex,ppAlternate)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisAlternates_GetCount_Proxy( 
    IAnalysisAlternates * This,
    /* [out] */ ULONG *pulCount);


void __RPC_STUB IAnalysisAlternates_GetCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisAlternates_GetAnalysisAlternate_Proxy( 
    IAnalysisAlternates * This,
    /* [in] */ ULONG ulIndex,
    /* [out] */ IAnalysisAlternate **ppAlternate);


void __RPC_STUB IAnalysisAlternates_GetAnalysisAlternate_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAnalysisAlternates_INTERFACE_DEFINED__ */


#ifndef __IAnalysisWarning_INTERFACE_DEFINED__
#define __IAnalysisWarning_INTERFACE_DEFINED__

/* interface IAnalysisWarning */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IAnalysisWarning;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B7BC3EF6-C944-33C5-8917-19BD3E0C8327")
    IAnalysisWarning : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetWarningCode( 
            /* [out] */ AnalysisWarningCode *pWarningCode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetNodeIds( 
            /* [out][in] */ ULONG *pulNodeIdCount,
            /* [size_is][out] */ GUID **ppNodeIds) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetHint( 
            /* [out] */ IContextNode **pAnalysisHint) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetBackgroundError( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnalysisWarningVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAnalysisWarning * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAnalysisWarning * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAnalysisWarning * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetWarningCode )( 
            IAnalysisWarning * This,
            /* [out] */ AnalysisWarningCode *pWarningCode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetNodeIds )( 
            IAnalysisWarning * This,
            /* [out][in] */ ULONG *pulNodeIdCount,
            /* [size_is][out] */ GUID **ppNodeIds);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetHint )( 
            IAnalysisWarning * This,
            /* [out] */ IContextNode **pAnalysisHint);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetBackgroundError )( 
            IAnalysisWarning * This);
        
        END_INTERFACE
    } IAnalysisWarningVtbl;

    interface IAnalysisWarning
    {
        CONST_VTBL struct IAnalysisWarningVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnalysisWarning_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAnalysisWarning_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAnalysisWarning_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAnalysisWarning_GetWarningCode(This,pWarningCode)	\
    (This)->lpVtbl -> GetWarningCode(This,pWarningCode)

#define IAnalysisWarning_GetNodeIds(This,pulNodeIdCount,ppNodeIds)	\
    (This)->lpVtbl -> GetNodeIds(This,pulNodeIdCount,ppNodeIds)

#define IAnalysisWarning_GetHint(This,pAnalysisHint)	\
    (This)->lpVtbl -> GetHint(This,pAnalysisHint)

#define IAnalysisWarning_GetBackgroundError(This)	\
    (This)->lpVtbl -> GetBackgroundError(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisWarning_GetWarningCode_Proxy( 
    IAnalysisWarning * This,
    /* [out] */ AnalysisWarningCode *pWarningCode);


void __RPC_STUB IAnalysisWarning_GetWarningCode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisWarning_GetNodeIds_Proxy( 
    IAnalysisWarning * This,
    /* [out][in] */ ULONG *pulNodeIdCount,
    /* [size_is][out] */ GUID **ppNodeIds);


void __RPC_STUB IAnalysisWarning_GetNodeIds_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisWarning_GetHint_Proxy( 
    IAnalysisWarning * This,
    /* [out] */ IContextNode **pAnalysisHint);


void __RPC_STUB IAnalysisWarning_GetHint_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisWarning_GetBackgroundError_Proxy( 
    IAnalysisWarning * This);


void __RPC_STUB IAnalysisWarning_GetBackgroundError_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAnalysisWarning_INTERFACE_DEFINED__ */


#ifndef __IAnalysisWarnings_INTERFACE_DEFINED__
#define __IAnalysisWarnings_INTERFACE_DEFINED__

/* interface IAnalysisWarnings */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IAnalysisWarnings;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("304ADA62-DEC1-35BF-84AE-A61BB846ADD7")
    IAnalysisWarnings : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetCount( 
            /* [out] */ ULONG *pulCount) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAnalysisWarning( 
            /* [in] */ ULONG ulIndex,
            /* [out] */ IAnalysisWarning **ppIAnalysisWarning) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnalysisWarningsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAnalysisWarnings * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAnalysisWarnings * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAnalysisWarnings * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetCount )( 
            IAnalysisWarnings * This,
            /* [out] */ ULONG *pulCount);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAnalysisWarning )( 
            IAnalysisWarnings * This,
            /* [in] */ ULONG ulIndex,
            /* [out] */ IAnalysisWarning **ppIAnalysisWarning);
        
        END_INTERFACE
    } IAnalysisWarningsVtbl;

    interface IAnalysisWarnings
    {
        CONST_VTBL struct IAnalysisWarningsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnalysisWarnings_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAnalysisWarnings_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAnalysisWarnings_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAnalysisWarnings_GetCount(This,pulCount)	\
    (This)->lpVtbl -> GetCount(This,pulCount)

#define IAnalysisWarnings_GetAnalysisWarning(This,ulIndex,ppIAnalysisWarning)	\
    (This)->lpVtbl -> GetAnalysisWarning(This,ulIndex,ppIAnalysisWarning)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisWarnings_GetCount_Proxy( 
    IAnalysisWarnings * This,
    /* [out] */ ULONG *pulCount);


void __RPC_STUB IAnalysisWarnings_GetCount_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisWarnings_GetAnalysisWarning_Proxy( 
    IAnalysisWarnings * This,
    /* [in] */ ULONG ulIndex,
    /* [out] */ IAnalysisWarning **ppIAnalysisWarning);


void __RPC_STUB IAnalysisWarnings_GetAnalysisWarning_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAnalysisWarnings_INTERFACE_DEFINED__ */


#ifndef __IAnalysisStatus_INTERFACE_DEFINED__
#define __IAnalysisStatus_INTERFACE_DEFINED__

/* interface IAnalysisStatus */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IAnalysisStatus;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8E16FC8B-F1DC-38C9-BB8F-7EF7B0D6C5AE")
    IAnalysisStatus : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IsSuccessful( 
            /* [out] */ VARIANT_BOOL *pfSuccessful) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetAppliedChangesRegion( 
            /* [out] */ IAnalysisRegion **pAppliedChangesRegion) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE GetWarnings( 
            /* [out] */ IAnalysisWarnings **ppAnalysisWarnings) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IAnalysisStatusVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IAnalysisStatus * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IAnalysisStatus * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IAnalysisStatus * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsSuccessful )( 
            IAnalysisStatus * This,
            /* [out] */ VARIANT_BOOL *pfSuccessful);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetAppliedChangesRegion )( 
            IAnalysisStatus * This,
            /* [out] */ IAnalysisRegion **pAppliedChangesRegion);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetWarnings )( 
            IAnalysisStatus * This,
            /* [out] */ IAnalysisWarnings **ppAnalysisWarnings);
        
        END_INTERFACE
    } IAnalysisStatusVtbl;

    interface IAnalysisStatus
    {
        CONST_VTBL struct IAnalysisStatusVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAnalysisStatus_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IAnalysisStatus_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IAnalysisStatus_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IAnalysisStatus_IsSuccessful(This,pfSuccessful)	\
    (This)->lpVtbl -> IsSuccessful(This,pfSuccessful)

#define IAnalysisStatus_GetAppliedChangesRegion(This,pAppliedChangesRegion)	\
    (This)->lpVtbl -> GetAppliedChangesRegion(This,pAppliedChangesRegion)

#define IAnalysisStatus_GetWarnings(This,ppAnalysisWarnings)	\
    (This)->lpVtbl -> GetWarnings(This,ppAnalysisWarnings)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisStatus_IsSuccessful_Proxy( 
    IAnalysisStatus * This,
    /* [out] */ VARIANT_BOOL *pfSuccessful);


void __RPC_STUB IAnalysisStatus_IsSuccessful_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisStatus_GetAppliedChangesRegion_Proxy( 
    IAnalysisStatus * This,
    /* [out] */ IAnalysisRegion **pAppliedChangesRegion);


void __RPC_STUB IAnalysisStatus_GetAppliedChangesRegion_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IAnalysisStatus_GetWarnings_Proxy( 
    IAnalysisStatus * This,
    /* [out] */ IAnalysisWarnings **ppAnalysisWarnings);


void __RPC_STUB IAnalysisStatus_GetWarnings_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IAnalysisStatus_INTERFACE_DEFINED__ */


#ifndef __IMatchesCriteriaCallBack_INTERFACE_DEFINED__
#define __IMatchesCriteriaCallBack_INTERFACE_DEFINED__

/* interface IMatchesCriteriaCallBack */
/* [object][unique][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID_IMatchesCriteriaCallBack;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("A11BEA2D-62F5-3DDC-AEFD-5BFED2ED43E9")
    IMatchesCriteriaCallBack : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE EvaluateContextNode( 
            /* [in] */ IContextNode *pContextNodeToEvaluate,
            /* [out] */ VARIANT_BOOL *pbResult) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMatchesCriteriaCallBackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMatchesCriteriaCallBack * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMatchesCriteriaCallBack * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMatchesCriteriaCallBack * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *EvaluateContextNode )( 
            IMatchesCriteriaCallBack * This,
            /* [in] */ IContextNode *pContextNodeToEvaluate,
            /* [out] */ VARIANT_BOOL *pbResult);
        
        END_INTERFACE
    } IMatchesCriteriaCallBackVtbl;

    interface IMatchesCriteriaCallBack
    {
        CONST_VTBL struct IMatchesCriteriaCallBackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMatchesCriteriaCallBack_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IMatchesCriteriaCallBack_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IMatchesCriteriaCallBack_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IMatchesCriteriaCallBack_EvaluateContextNode(This,pContextNodeToEvaluate,pbResult)	\
    (This)->lpVtbl -> EvaluateContextNode(This,pContextNodeToEvaluate,pbResult)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IMatchesCriteriaCallBack_EvaluateContextNode_Proxy( 
    IMatchesCriteriaCallBack * This,
    /* [in] */ IContextNode *pContextNodeToEvaluate,
    /* [out] */ VARIANT_BOOL *pbResult);


void __RPC_STUB IMatchesCriteriaCallBack_EvaluateContextNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IMatchesCriteriaCallBack_INTERFACE_DEFINED__ */


#ifndef ___IAnalysisEvents_INTERFACE_DEFINED__
#define ___IAnalysisEvents_INTERFACE_DEFINED__

/* interface _IAnalysisEvents */
/* [object][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID__IAnalysisEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("67CCF9D3-FE75-338D-BB4B-FD0FF18C8258")
    _IAnalysisEvents : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ResultsUpdated( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IAnalysisStatus *pAnalysisStatus) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE IntermediateResultsUpdated( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IAnalysisStatus *pAnalysisStatus) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE Activity( void) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE UpdateStrokesCache( 
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ReadyToReconcile( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct _IAnalysisEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            _IAnalysisEvents * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            _IAnalysisEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            _IAnalysisEvents * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ResultsUpdated )( 
            _IAnalysisEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IAnalysisStatus *pAnalysisStatus);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *IntermediateResultsUpdated )( 
            _IAnalysisEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IAnalysisStatus *pAnalysisStatus);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *Activity )( 
            _IAnalysisEvents * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *UpdateStrokesCache )( 
            _IAnalysisEvents * This,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReadyToReconcile )( 
            _IAnalysisEvents * This);
        
        END_INTERFACE
    } _IAnalysisEventsVtbl;

    interface _IAnalysisEvents
    {
        CONST_VTBL struct _IAnalysisEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define _IAnalysisEvents_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define _IAnalysisEvents_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define _IAnalysisEvents_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define _IAnalysisEvents_ResultsUpdated(This,pInkAnalyzer,pAnalysisStatus)	\
    (This)->lpVtbl -> ResultsUpdated(This,pInkAnalyzer,pAnalysisStatus)

#define _IAnalysisEvents_IntermediateResultsUpdated(This,pInkAnalyzer,pAnalysisStatus)	\
    (This)->lpVtbl -> IntermediateResultsUpdated(This,pInkAnalyzer,pAnalysisStatus)

#define _IAnalysisEvents_Activity(This)	\
    (This)->lpVtbl -> Activity(This)

#define _IAnalysisEvents_UpdateStrokesCache(This,ulStrokeIdsCount,plStrokeIds)	\
    (This)->lpVtbl -> UpdateStrokesCache(This,ulStrokeIdsCount,plStrokeIds)

#define _IAnalysisEvents_ReadyToReconcile(This)	\
    (This)->lpVtbl -> ReadyToReconcile(This)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisEvents_ResultsUpdated_Proxy( 
    _IAnalysisEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IAnalysisStatus *pAnalysisStatus);


void __RPC_STUB _IAnalysisEvents_ResultsUpdated_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisEvents_IntermediateResultsUpdated_Proxy( 
    _IAnalysisEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IAnalysisStatus *pAnalysisStatus);


void __RPC_STUB _IAnalysisEvents_IntermediateResultsUpdated_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisEvents_Activity_Proxy( 
    _IAnalysisEvents * This);


void __RPC_STUB _IAnalysisEvents_Activity_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisEvents_UpdateStrokesCache_Proxy( 
    _IAnalysisEvents * This,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds);


void __RPC_STUB _IAnalysisEvents_UpdateStrokesCache_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisEvents_ReadyToReconcile_Proxy( 
    _IAnalysisEvents * This);


void __RPC_STUB _IAnalysisEvents_ReadyToReconcile_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* ___IAnalysisEvents_INTERFACE_DEFINED__ */


#ifndef ___IAnalysisProxyEvents_INTERFACE_DEFINED__
#define ___IAnalysisProxyEvents_INTERFACE_DEFINED__

/* interface _IAnalysisProxyEvents */
/* [object][uuid][helpcontext][helpstring] */ 


EXTERN_C const IID IID__IAnalysisProxyEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("70049599-2E75-3FEC-A597-C8191105F4FB")
    _IAnalysisProxyEvents : public IUnknown
    {
    public:
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE InkAnalyzerStateChanging( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodePropertiesUpdated( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeUpdated,
            /* [in] */ ULONG ulPropertiesIdsCount,
            /* [size_is][in] */ GUID *pUpdatedProperties) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE PopulateContextNode( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeToPopulate,
            /* [in] */ VARIANT_BOOL bPopulateSubTree) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodeCreated( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeCreated) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodeDeleting( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeToBeDeleted) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodeReparenting( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pNewParentContextNode,
            /* [in] */ IContextNode *pContextNodeToBeReparented) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodeMovingToPosition( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pSubnodeToMove,
            /* [in] */ IContextNode *pParentContextNode,
            /* [in] */ ULONG ulNewIndex) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE StrokesReparented( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ IContextNode *pSourceContextNode,
            /* [in] */ IContextNode *pDestinationContextNode) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE NewStrokesLoaded( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ IContextNode *pNodeWithStrokes) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodeLinkAdding( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextLink *pContextLinkToBeAdded) = 0;
        
        virtual /* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE ContextNodeLinkDeleting( 
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextLink *pContextLinkToBeDeleted) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct _IAnalysisProxyEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            _IAnalysisProxyEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            _IAnalysisProxyEvents * This);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *InkAnalyzerStateChanging )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodePropertiesUpdated )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeUpdated,
            /* [in] */ ULONG ulPropertiesIdsCount,
            /* [size_is][in] */ GUID *pUpdatedProperties);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *PopulateContextNode )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeToPopulate,
            /* [in] */ VARIANT_BOOL bPopulateSubTree);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodeCreated )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeCreated);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodeDeleting )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pContextNodeToBeDeleted);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodeReparenting )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pNewParentContextNode,
            /* [in] */ IContextNode *pContextNodeToBeReparented);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodeMovingToPosition )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextNode *pSubnodeToMove,
            /* [in] */ IContextNode *pParentContextNode,
            /* [in] */ ULONG ulNewIndex);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *StrokesReparented )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ IContextNode *pSourceContextNode,
            /* [in] */ IContextNode *pDestinationContextNode);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *NewStrokesLoaded )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ ULONG ulStrokeIdsCount,
            /* [size_is][in] */ LONG *plStrokeIds,
            /* [in] */ IContextNode *pNodeWithStrokes);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodeLinkAdding )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextLink *pContextLinkToBeAdded);
        
        /* [helpcontext][helpstring] */ HRESULT ( STDMETHODCALLTYPE *ContextNodeLinkDeleting )( 
            _IAnalysisProxyEvents * This,
            /* [in] */ IInkAnalyzer *pInkAnalyzer,
            /* [in] */ IContextLink *pContextLinkToBeDeleted);
        
        END_INTERFACE
    } _IAnalysisProxyEventsVtbl;

    interface _IAnalysisProxyEvents
    {
        CONST_VTBL struct _IAnalysisProxyEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define _IAnalysisProxyEvents_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define _IAnalysisProxyEvents_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define _IAnalysisProxyEvents_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define _IAnalysisProxyEvents_InkAnalyzerStateChanging(This,pInkAnalyzer)	\
    (This)->lpVtbl -> InkAnalyzerStateChanging(This,pInkAnalyzer)

#define _IAnalysisProxyEvents_ContextNodePropertiesUpdated(This,pInkAnalyzer,pContextNodeUpdated,ulPropertiesIdsCount,pUpdatedProperties)	\
    (This)->lpVtbl -> ContextNodePropertiesUpdated(This,pInkAnalyzer,pContextNodeUpdated,ulPropertiesIdsCount,pUpdatedProperties)

#define _IAnalysisProxyEvents_PopulateContextNode(This,pInkAnalyzer,pContextNodeToPopulate,bPopulateSubTree)	\
    (This)->lpVtbl -> PopulateContextNode(This,pInkAnalyzer,pContextNodeToPopulate,bPopulateSubTree)

#define _IAnalysisProxyEvents_ContextNodeCreated(This,pInkAnalyzer,pContextNodeCreated)	\
    (This)->lpVtbl -> ContextNodeCreated(This,pInkAnalyzer,pContextNodeCreated)

#define _IAnalysisProxyEvents_ContextNodeDeleting(This,pInkAnalyzer,pContextNodeToBeDeleted)	\
    (This)->lpVtbl -> ContextNodeDeleting(This,pInkAnalyzer,pContextNodeToBeDeleted)

#define _IAnalysisProxyEvents_ContextNodeReparenting(This,pInkAnalyzer,pNewParentContextNode,pContextNodeToBeReparented)	\
    (This)->lpVtbl -> ContextNodeReparenting(This,pInkAnalyzer,pNewParentContextNode,pContextNodeToBeReparented)

#define _IAnalysisProxyEvents_ContextNodeMovingToPosition(This,pInkAnalyzer,pSubnodeToMove,pParentContextNode,ulNewIndex)	\
    (This)->lpVtbl -> ContextNodeMovingToPosition(This,pInkAnalyzer,pSubnodeToMove,pParentContextNode,ulNewIndex)

#define _IAnalysisProxyEvents_StrokesReparented(This,pInkAnalyzer,ulStrokeIdsCount,plStrokeIds,pSourceContextNode,pDestinationContextNode)	\
    (This)->lpVtbl -> StrokesReparented(This,pInkAnalyzer,ulStrokeIdsCount,plStrokeIds,pSourceContextNode,pDestinationContextNode)

#define _IAnalysisProxyEvents_NewStrokesLoaded(This,pInkAnalyzer,ulStrokeIdsCount,plStrokeIds,pNodeWithStrokes)	\
    (This)->lpVtbl -> NewStrokesLoaded(This,pInkAnalyzer,ulStrokeIdsCount,plStrokeIds,pNodeWithStrokes)

#define _IAnalysisProxyEvents_ContextNodeLinkAdding(This,pInkAnalyzer,pContextLinkToBeAdded)	\
    (This)->lpVtbl -> ContextNodeLinkAdding(This,pInkAnalyzer,pContextLinkToBeAdded)

#define _IAnalysisProxyEvents_ContextNodeLinkDeleting(This,pInkAnalyzer,pContextLinkToBeDeleted)	\
    (This)->lpVtbl -> ContextNodeLinkDeleting(This,pInkAnalyzer,pContextLinkToBeDeleted)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_InkAnalyzerStateChanging_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer);


void __RPC_STUB _IAnalysisProxyEvents_InkAnalyzerStateChanging_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodePropertiesUpdated_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextNode *pContextNodeUpdated,
    /* [in] */ ULONG ulPropertiesIdsCount,
    /* [size_is][in] */ GUID *pUpdatedProperties);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodePropertiesUpdated_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_PopulateContextNode_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextNode *pContextNodeToPopulate,
    /* [in] */ VARIANT_BOOL bPopulateSubTree);


void __RPC_STUB _IAnalysisProxyEvents_PopulateContextNode_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodeCreated_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextNode *pContextNodeCreated);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodeCreated_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodeDeleting_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextNode *pContextNodeToBeDeleted);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodeDeleting_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodeReparenting_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextNode *pNewParentContextNode,
    /* [in] */ IContextNode *pContextNodeToBeReparented);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodeReparenting_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodeMovingToPosition_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextNode *pSubnodeToMove,
    /* [in] */ IContextNode *pParentContextNode,
    /* [in] */ ULONG ulNewIndex);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodeMovingToPosition_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_StrokesReparented_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [in] */ IContextNode *pSourceContextNode,
    /* [in] */ IContextNode *pDestinationContextNode);


void __RPC_STUB _IAnalysisProxyEvents_StrokesReparented_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_NewStrokesLoaded_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ ULONG ulStrokeIdsCount,
    /* [size_is][in] */ LONG *plStrokeIds,
    /* [in] */ IContextNode *pNodeWithStrokes);


void __RPC_STUB _IAnalysisProxyEvents_NewStrokesLoaded_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodeLinkAdding_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextLink *pContextLinkToBeAdded);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodeLinkAdding_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);


/* [helpcontext][helpstring] */ HRESULT STDMETHODCALLTYPE _IAnalysisProxyEvents_ContextNodeLinkDeleting_Proxy( 
    _IAnalysisProxyEvents * This,
    /* [in] */ IInkAnalyzer *pInkAnalyzer,
    /* [in] */ IContextLink *pContextLinkToBeDeleted);


void __RPC_STUB _IAnalysisProxyEvents_ContextNodeLinkDeleting_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* ___IAnalysisProxyEvents_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_InkAnalyzer;

#ifdef __cplusplus

class DECLSPEC_UUID("B4BAB526-5BA1-3C4D-AF21-CFDCD9AAF2D2")
InkAnalyzer;
#endif

EXTERN_C const CLSID CLSID_AnalysisRegion;

#ifdef __cplusplus

class DECLSPEC_UUID("3C3E7657-4F0C-3FC4-8A89-A5B0F7EB480A")
AnalysisRegion;
#endif
#endif /* __COMINKANALYSISLib_LIBRARY_DEFINED__ */

/* interface __MIDL_itf_iacom_0272 */
/* [local] */ 

#endif /* of #define _COMINKANALYSIS_H_*/


extern RPC_IF_HANDLE __MIDL_itf_iacom_0272_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_iacom_0272_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


