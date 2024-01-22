

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for mfplay.idl:
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

#ifndef __mfplay_h__
#define __mfplay_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IMFPMediaPlayer_FWD_DEFINED__
#define __IMFPMediaPlayer_FWD_DEFINED__
typedef interface IMFPMediaPlayer IMFPMediaPlayer;
#endif 	/* __IMFPMediaPlayer_FWD_DEFINED__ */


#ifndef __IMFPMediaItem_FWD_DEFINED__
#define __IMFPMediaItem_FWD_DEFINED__
typedef interface IMFPMediaItem IMFPMediaItem;
#endif 	/* __IMFPMediaItem_FWD_DEFINED__ */


#ifndef __IMFPMediaPlayerCallback_FWD_DEFINED__
#define __IMFPMediaPlayerCallback_FWD_DEFINED__
typedef interface IMFPMediaPlayerCallback IMFPMediaPlayerCallback;
#endif 	/* __IMFPMediaPlayerCallback_FWD_DEFINED__ */


/* header files for imported files */
#include "unknwn.h"
#include "propsys.h"
#include "mfidl.h"
#include "evr.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_mfplay_0000_0000 */
/* [local] */ 

#if (WINVER >= _WIN32_WINNT_WIN7) 





interface IMFMediaEvent;
interface IMFNetCredential;
typedef UINT32 MFP_CREATION_OPTIONS;

typedef /* [v1_enum] */ 
enum _MFP_CREATION_OPTIONS
    {	MFP_OPTION_NONE	= 0,
	MFP_OPTION_FREE_THREADED_CALLBACK	= 0x1,
	MFP_OPTION_NO_MMCSS	= 0x2,
	MFP_OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION	= 0x4
    } 	_MFP_CREATION_OPTIONS;

typedef /* [v1_enum] */ 
enum MFP_MEDIAPLAYER_STATE
    {	MFP_MEDIAPLAYER_STATE_EMPTY	= 0,
	MFP_MEDIAPLAYER_STATE_STOPPED	= 0x1,
	MFP_MEDIAPLAYER_STATE_PLAYING	= 0x2,
	MFP_MEDIAPLAYER_STATE_PAUSED	= 0x3,
	MFP_MEDIAPLAYER_STATE_SHUTDOWN	= 0x4
    } 	MFP_MEDIAPLAYER_STATE;

typedef UINT32 MFP_MEDIAITEM_CHARACTERISTICS;

typedef /* [v1_enum] */ 
enum _MFP_MEDIAITEM_CHARACTERISTICS
    {	MFP_MEDIAITEM_IS_LIVE	= 0x1,
	MFP_MEDIAITEM_CAN_SEEK	= 0x2,
	MFP_MEDIAITEM_CAN_PAUSE	= 0x4,
	MFP_MEDIAITEM_HAS_SLOW_SEEK	= 0x8
    } 	_MFP_MEDIAITEM_CHARACTERISTICS;

typedef UINT32 MFP_CREDENTIAL_FLAGS;

typedef /* [v1_enum] */ 
enum _MFP_CREDENTIAL_FLAGS
    {	MFP_CREDENTIAL_PROMPT	= 0x1,
	MFP_CREDENTIAL_SAVE	= 0x2,
	MFP_CREDENTIAL_DO_NOT_CACHE	= 0x4,
	MFP_CREDENTIAL_CLEAR_TEXT	= 0x8,
	MFP_CREDENTIAL_PROXY	= 0x10,
	MFP_CREDENTIAL_LOGGED_ON_USER	= 0x20
    } 	_MFP_CREDENTIAL_FLAGS;

STDAPI MFPCreateMediaPlayer(
            __in_opt  LPCWSTR pwszURL,
            __in      BOOL fStartPlayback,
            __in_opt  MFP_CREATION_OPTIONS creationOptions,
            __in_opt  IMFPMediaPlayerCallback * pCallback,
            __in_opt  HWND hWnd,
            __out_opt IMFPMediaPlayer ** ppMediaPlayer );


extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0000_v0_0_s_ifspec;

#ifndef __IMFPMediaPlayer_INTERFACE_DEFINED__
#define __IMFPMediaPlayer_INTERFACE_DEFINED__

/* interface IMFPMediaPlayer */
/* [uuid][object][local] */ 


EXTERN_C const IID IID_IMFPMediaPlayer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("A714590A-58AF-430a-85BF-44F5EC838D85")
    IMFPMediaPlayer : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE Play( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Pause( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Stop( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FrameStep( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetPosition( 
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][in] */ 
            __in  const PROPVARIANT *pvPositionValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetPosition( 
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvPositionValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetDuration( 
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvDurationValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetRate( 
            /* [annotation][in] */ 
            __in  float flRate) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetRate( 
            /* [annotation][out] */ 
            __out  float *pflRate) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetSupportedRates( 
            /* [annotation][in] */ 
            __in  BOOL fForwardDirection,
            /* [annotation][out] */ 
            __out  float *pflSlowestRate,
            /* [annotation][out] */ 
            __out  float *pflFastestRate) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetState( 
            /* [annotation][out] */ 
            __out  MFP_MEDIAPLAYER_STATE *peState) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CreateMediaItemFromURL( 
            /* [annotation][in] */ 
            __in  LPCWSTR pwszURL,
            /* [annotation][in] */ 
            __in  BOOL fSync,
            /* [annotation][in] */ 
            __in  DWORD_PTR dwUserData,
            /* [annotation][out] */ 
            __out_opt  IMFPMediaItem **ppMediaItem) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CreateMediaItemFromObject( 
            /* [annotation][in] */ 
            __in  IUnknown *pIUnknownObj,
            /* [annotation][in] */ 
            __in  BOOL fSync,
            /* [annotation][in] */ 
            __in  DWORD_PTR dwUserData,
            /* [annotation][out] */ 
            __out_opt  IMFPMediaItem **ppMediaItem) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetMediaItem( 
            /* [annotation][in] */ 
            __in  IMFPMediaItem *pIMFPMediaItem) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ClearMediaItem( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetMediaItem( 
            /* [annotation][out] */ 
            __out  IMFPMediaItem **ppIMFPMediaItem) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetVolume( 
            /* [annotation][out] */ 
            __out  float *pflVolume) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetVolume( 
            /* [annotation][in] */ 
            __in  float flVolume) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetBalance( 
            /* [annotation][out] */ 
            __out  float *pflBalance) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetBalance( 
            /* [annotation][in] */ 
            __in  float flBalance) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetMute( 
            /* [annotation][out] */ 
            __out  BOOL *pfMute) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetMute( 
            /* [annotation][in] */ 
            __in  BOOL fMute) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetNativeVideoSize( 
            /* [annotation][out] */ 
            __out_opt  SIZE *pszVideo,
            /* [annotation][out] */ 
            __out_opt  SIZE *pszARVideo) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetIdealVideoSize( 
            /* [annotation][out] */ 
            __out_opt  SIZE *pszMin,
            /* [annotation][out] */ 
            __out_opt  SIZE *pszMax) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetVideoSourceRect( 
            /* [annotation][in] */ 
            __in  const MFVideoNormalizedRect *pnrcSource) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetVideoSourceRect( 
            /* [annotation][out] */ 
            __out  MFVideoNormalizedRect *pnrcSource) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetAspectRatioMode( 
            /* [annotation][in] */ 
            __in  DWORD dwAspectRatioMode) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetAspectRatioMode( 
            /* [annotation][out] */ 
            __out  DWORD *pdwAspectRatioMode) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetVideoWindow( 
            /* [annotation][out] */ 
            __out  HWND *phwndVideo) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UpdateVideo( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetBorderColor( 
            /* [annotation][in] */ 
            __in  COLORREF Clr) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetBorderColor( 
            /* [annotation][out] */ 
            __out  COLORREF *pClr) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE InsertEffect( 
            /* [annotation][in] */ 
            __in  IUnknown *pEffect,
            /* [annotation][in] */ 
            __in  BOOL fOptional) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RemoveEffect( 
            /* [annotation][in] */ 
            __in  IUnknown *pEffect) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RemoveAllEffects( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFPMediaPlayerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFPMediaPlayer * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFPMediaPlayer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *Play )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *Pause )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *Stop )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *FrameStep )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetPosition )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][in] */ 
            __in  const PROPVARIANT *pvPositionValue);
        
        HRESULT ( STDMETHODCALLTYPE *GetPosition )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvPositionValue);
        
        HRESULT ( STDMETHODCALLTYPE *GetDuration )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvDurationValue);
        
        HRESULT ( STDMETHODCALLTYPE *SetRate )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  float flRate);
        
        HRESULT ( STDMETHODCALLTYPE *GetRate )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  float *pflRate);
        
        HRESULT ( STDMETHODCALLTYPE *GetSupportedRates )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  BOOL fForwardDirection,
            /* [annotation][out] */ 
            __out  float *pflSlowestRate,
            /* [annotation][out] */ 
            __out  float *pflFastestRate);
        
        HRESULT ( STDMETHODCALLTYPE *GetState )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  MFP_MEDIAPLAYER_STATE *peState);
        
        HRESULT ( STDMETHODCALLTYPE *CreateMediaItemFromURL )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  LPCWSTR pwszURL,
            /* [annotation][in] */ 
            __in  BOOL fSync,
            /* [annotation][in] */ 
            __in  DWORD_PTR dwUserData,
            /* [annotation][out] */ 
            __out_opt  IMFPMediaItem **ppMediaItem);
        
        HRESULT ( STDMETHODCALLTYPE *CreateMediaItemFromObject )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  IUnknown *pIUnknownObj,
            /* [annotation][in] */ 
            __in  BOOL fSync,
            /* [annotation][in] */ 
            __in  DWORD_PTR dwUserData,
            /* [annotation][out] */ 
            __out_opt  IMFPMediaItem **ppMediaItem);
        
        HRESULT ( STDMETHODCALLTYPE *SetMediaItem )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  IMFPMediaItem *pIMFPMediaItem);
        
        HRESULT ( STDMETHODCALLTYPE *ClearMediaItem )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetMediaItem )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  IMFPMediaItem **ppIMFPMediaItem);
        
        HRESULT ( STDMETHODCALLTYPE *GetVolume )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  float *pflVolume);
        
        HRESULT ( STDMETHODCALLTYPE *SetVolume )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  float flVolume);
        
        HRESULT ( STDMETHODCALLTYPE *GetBalance )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  float *pflBalance);
        
        HRESULT ( STDMETHODCALLTYPE *SetBalance )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  float flBalance);
        
        HRESULT ( STDMETHODCALLTYPE *GetMute )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  BOOL *pfMute);
        
        HRESULT ( STDMETHODCALLTYPE *SetMute )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  BOOL fMute);
        
        HRESULT ( STDMETHODCALLTYPE *GetNativeVideoSize )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out_opt  SIZE *pszVideo,
            /* [annotation][out] */ 
            __out_opt  SIZE *pszARVideo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIdealVideoSize )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out_opt  SIZE *pszMin,
            /* [annotation][out] */ 
            __out_opt  SIZE *pszMax);
        
        HRESULT ( STDMETHODCALLTYPE *SetVideoSourceRect )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  const MFVideoNormalizedRect *pnrcSource);
        
        HRESULT ( STDMETHODCALLTYPE *GetVideoSourceRect )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  MFVideoNormalizedRect *pnrcSource);
        
        HRESULT ( STDMETHODCALLTYPE *SetAspectRatioMode )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  DWORD dwAspectRatioMode);
        
        HRESULT ( STDMETHODCALLTYPE *GetAspectRatioMode )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  DWORD *pdwAspectRatioMode);
        
        HRESULT ( STDMETHODCALLTYPE *GetVideoWindow )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  HWND *phwndVideo);
        
        HRESULT ( STDMETHODCALLTYPE *UpdateVideo )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *SetBorderColor )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  COLORREF Clr);
        
        HRESULT ( STDMETHODCALLTYPE *GetBorderColor )( 
            IMFPMediaPlayer * This,
            /* [annotation][out] */ 
            __out  COLORREF *pClr);
        
        HRESULT ( STDMETHODCALLTYPE *InsertEffect )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  IUnknown *pEffect,
            /* [annotation][in] */ 
            __in  BOOL fOptional);
        
        HRESULT ( STDMETHODCALLTYPE *RemoveEffect )( 
            IMFPMediaPlayer * This,
            /* [annotation][in] */ 
            __in  IUnknown *pEffect);
        
        HRESULT ( STDMETHODCALLTYPE *RemoveAllEffects )( 
            IMFPMediaPlayer * This);
        
        HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            IMFPMediaPlayer * This);
        
        END_INTERFACE
    } IMFPMediaPlayerVtbl;

    interface IMFPMediaPlayer
    {
        CONST_VTBL struct IMFPMediaPlayerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFPMediaPlayer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFPMediaPlayer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFPMediaPlayer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFPMediaPlayer_Play(This)	\
    ( (This)->lpVtbl -> Play(This) ) 

#define IMFPMediaPlayer_Pause(This)	\
    ( (This)->lpVtbl -> Pause(This) ) 

#define IMFPMediaPlayer_Stop(This)	\
    ( (This)->lpVtbl -> Stop(This) ) 

#define IMFPMediaPlayer_FrameStep(This)	\
    ( (This)->lpVtbl -> FrameStep(This) ) 

#define IMFPMediaPlayer_SetPosition(This,guidPositionType,pvPositionValue)	\
    ( (This)->lpVtbl -> SetPosition(This,guidPositionType,pvPositionValue) ) 

#define IMFPMediaPlayer_GetPosition(This,guidPositionType,pvPositionValue)	\
    ( (This)->lpVtbl -> GetPosition(This,guidPositionType,pvPositionValue) ) 

#define IMFPMediaPlayer_GetDuration(This,guidPositionType,pvDurationValue)	\
    ( (This)->lpVtbl -> GetDuration(This,guidPositionType,pvDurationValue) ) 

#define IMFPMediaPlayer_SetRate(This,flRate)	\
    ( (This)->lpVtbl -> SetRate(This,flRate) ) 

#define IMFPMediaPlayer_GetRate(This,pflRate)	\
    ( (This)->lpVtbl -> GetRate(This,pflRate) ) 

#define IMFPMediaPlayer_GetSupportedRates(This,fForwardDirection,pflSlowestRate,pflFastestRate)	\
    ( (This)->lpVtbl -> GetSupportedRates(This,fForwardDirection,pflSlowestRate,pflFastestRate) ) 

#define IMFPMediaPlayer_GetState(This,peState)	\
    ( (This)->lpVtbl -> GetState(This,peState) ) 

#define IMFPMediaPlayer_CreateMediaItemFromURL(This,pwszURL,fSync,dwUserData,ppMediaItem)	\
    ( (This)->lpVtbl -> CreateMediaItemFromURL(This,pwszURL,fSync,dwUserData,ppMediaItem) ) 

#define IMFPMediaPlayer_CreateMediaItemFromObject(This,pIUnknownObj,fSync,dwUserData,ppMediaItem)	\
    ( (This)->lpVtbl -> CreateMediaItemFromObject(This,pIUnknownObj,fSync,dwUserData,ppMediaItem) ) 

#define IMFPMediaPlayer_SetMediaItem(This,pIMFPMediaItem)	\
    ( (This)->lpVtbl -> SetMediaItem(This,pIMFPMediaItem) ) 

#define IMFPMediaPlayer_ClearMediaItem(This)	\
    ( (This)->lpVtbl -> ClearMediaItem(This) ) 

#define IMFPMediaPlayer_GetMediaItem(This,ppIMFPMediaItem)	\
    ( (This)->lpVtbl -> GetMediaItem(This,ppIMFPMediaItem) ) 

#define IMFPMediaPlayer_GetVolume(This,pflVolume)	\
    ( (This)->lpVtbl -> GetVolume(This,pflVolume) ) 

#define IMFPMediaPlayer_SetVolume(This,flVolume)	\
    ( (This)->lpVtbl -> SetVolume(This,flVolume) ) 

#define IMFPMediaPlayer_GetBalance(This,pflBalance)	\
    ( (This)->lpVtbl -> GetBalance(This,pflBalance) ) 

#define IMFPMediaPlayer_SetBalance(This,flBalance)	\
    ( (This)->lpVtbl -> SetBalance(This,flBalance) ) 

#define IMFPMediaPlayer_GetMute(This,pfMute)	\
    ( (This)->lpVtbl -> GetMute(This,pfMute) ) 

#define IMFPMediaPlayer_SetMute(This,fMute)	\
    ( (This)->lpVtbl -> SetMute(This,fMute) ) 

#define IMFPMediaPlayer_GetNativeVideoSize(This,pszVideo,pszARVideo)	\
    ( (This)->lpVtbl -> GetNativeVideoSize(This,pszVideo,pszARVideo) ) 

#define IMFPMediaPlayer_GetIdealVideoSize(This,pszMin,pszMax)	\
    ( (This)->lpVtbl -> GetIdealVideoSize(This,pszMin,pszMax) ) 

#define IMFPMediaPlayer_SetVideoSourceRect(This,pnrcSource)	\
    ( (This)->lpVtbl -> SetVideoSourceRect(This,pnrcSource) ) 

#define IMFPMediaPlayer_GetVideoSourceRect(This,pnrcSource)	\
    ( (This)->lpVtbl -> GetVideoSourceRect(This,pnrcSource) ) 

#define IMFPMediaPlayer_SetAspectRatioMode(This,dwAspectRatioMode)	\
    ( (This)->lpVtbl -> SetAspectRatioMode(This,dwAspectRatioMode) ) 

#define IMFPMediaPlayer_GetAspectRatioMode(This,pdwAspectRatioMode)	\
    ( (This)->lpVtbl -> GetAspectRatioMode(This,pdwAspectRatioMode) ) 

#define IMFPMediaPlayer_GetVideoWindow(This,phwndVideo)	\
    ( (This)->lpVtbl -> GetVideoWindow(This,phwndVideo) ) 

#define IMFPMediaPlayer_UpdateVideo(This)	\
    ( (This)->lpVtbl -> UpdateVideo(This) ) 

#define IMFPMediaPlayer_SetBorderColor(This,Clr)	\
    ( (This)->lpVtbl -> SetBorderColor(This,Clr) ) 

#define IMFPMediaPlayer_GetBorderColor(This,pClr)	\
    ( (This)->lpVtbl -> GetBorderColor(This,pClr) ) 

#define IMFPMediaPlayer_InsertEffect(This,pEffect,fOptional)	\
    ( (This)->lpVtbl -> InsertEffect(This,pEffect,fOptional) ) 

#define IMFPMediaPlayer_RemoveEffect(This,pEffect)	\
    ( (This)->lpVtbl -> RemoveEffect(This,pEffect) ) 

#define IMFPMediaPlayer_RemoveAllEffects(This)	\
    ( (This)->lpVtbl -> RemoveAllEffects(This) ) 

#define IMFPMediaPlayer_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFPMediaPlayer_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_mfplay_0000_0001 */
/* [local] */ 

EXTERN_GUID( MFP_POSITIONTYPE_100NS, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 );


extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0001_v0_0_s_ifspec;

#ifndef __IMFPMediaItem_INTERFACE_DEFINED__
#define __IMFPMediaItem_INTERFACE_DEFINED__

/* interface IMFPMediaItem */
/* [uuid][object][local] */ 


EXTERN_C const IID IID_IMFPMediaItem;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("90EB3E6B-ECBF-45cc-B1DA-C6FE3EA70D57")
    IMFPMediaItem : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetMediaPlayer( 
            /* [annotation][out] */ 
            __out  IMFPMediaPlayer **ppMediaPlayer) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetURL( 
            /* [annotation][out] */ 
            __out  LPWSTR *ppwszURL) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetObject( 
            /* [annotation][out] */ 
            __out  IUnknown **ppIUnknown) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetUserData( 
            /* [annotation][out] */ 
            __out  DWORD_PTR *pdwUserData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetUserData( 
            /* [annotation][in] */ 
            __in  DWORD_PTR dwUserData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStartStopPosition( 
            /* [annotation][out] */ 
            __out_opt  GUID *pguidStartPositionType,
            /* [annotation][out] */ 
            __out_opt  PROPVARIANT *pvStartValue,
            /* [annotation][out] */ 
            __out_opt  GUID *pguidStopPositionType,
            /* [annotation][out] */ 
            __out_opt  PROPVARIANT *pvStopValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetStartStopPosition( 
            /* [annotation][in] */ 
            __in_opt  const GUID *pguidStartPositionType,
            /* [annotation][in] */ 
            __in_opt  const PROPVARIANT *pvStartValue,
            /* [annotation][in] */ 
            __in_opt  const GUID *pguidStopPositionType,
            /* [annotation][in] */ 
            __in_opt  const PROPVARIANT *pvStopValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE HasVideo( 
            /* [annotation][out] */ 
            __out_opt  BOOL *pfHasVideo,
            /* [annotation][out] */ 
            __out_opt  BOOL *pfSelected) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE HasAudio( 
            /* [annotation][out] */ 
            __out_opt  BOOL *pfHasAudio,
            /* [annotation][out] */ 
            __out_opt  BOOL *pfSelected) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IsProtected( 
            /* [annotation][out] */ 
            __out  BOOL *pfProtected) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetDuration( 
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvDurationValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetNumberOfStreams( 
            /* [annotation][out] */ 
            __out  DWORD *pdwStreamCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStreamSelection( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  BOOL *pfEnabled) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetStreamSelection( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  BOOL fEnabled) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStreamAttribute( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidMFAttribute,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetPresentationAttribute( 
            /* [annotation][in] */ 
            __in  REFGUID guidMFAttribute,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvValue) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetCharacteristics( 
            /* [annotation][out] */ 
            __out  MFP_MEDIAITEM_CHARACTERISTICS *pCharacteristics) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetStreamSink( 
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in_opt  IUnknown *pMediaSink) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetMetadata( 
            /* [annotation][out] */ 
            __out  IPropertyStore **ppMetadataStore) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFPMediaItemVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFPMediaItem * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFPMediaItem * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFPMediaItem * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetMediaPlayer )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  IMFPMediaPlayer **ppMediaPlayer);
        
        HRESULT ( STDMETHODCALLTYPE *GetURL )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  LPWSTR *ppwszURL);
        
        HRESULT ( STDMETHODCALLTYPE *GetObject )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  IUnknown **ppIUnknown);
        
        HRESULT ( STDMETHODCALLTYPE *GetUserData )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  DWORD_PTR *pdwUserData);
        
        HRESULT ( STDMETHODCALLTYPE *SetUserData )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  DWORD_PTR dwUserData);
        
        HRESULT ( STDMETHODCALLTYPE *GetStartStopPosition )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out_opt  GUID *pguidStartPositionType,
            /* [annotation][out] */ 
            __out_opt  PROPVARIANT *pvStartValue,
            /* [annotation][out] */ 
            __out_opt  GUID *pguidStopPositionType,
            /* [annotation][out] */ 
            __out_opt  PROPVARIANT *pvStopValue);
        
        HRESULT ( STDMETHODCALLTYPE *SetStartStopPosition )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in_opt  const GUID *pguidStartPositionType,
            /* [annotation][in] */ 
            __in_opt  const PROPVARIANT *pvStartValue,
            /* [annotation][in] */ 
            __in_opt  const GUID *pguidStopPositionType,
            /* [annotation][in] */ 
            __in_opt  const PROPVARIANT *pvStopValue);
        
        HRESULT ( STDMETHODCALLTYPE *HasVideo )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out_opt  BOOL *pfHasVideo,
            /* [annotation][out] */ 
            __out_opt  BOOL *pfSelected);
        
        HRESULT ( STDMETHODCALLTYPE *HasAudio )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out_opt  BOOL *pfHasAudio,
            /* [annotation][out] */ 
            __out_opt  BOOL *pfSelected);
        
        HRESULT ( STDMETHODCALLTYPE *IsProtected )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  BOOL *pfProtected);
        
        HRESULT ( STDMETHODCALLTYPE *GetDuration )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  REFGUID guidPositionType,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvDurationValue);
        
        HRESULT ( STDMETHODCALLTYPE *GetNumberOfStreams )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  DWORD *pdwStreamCount);
        
        HRESULT ( STDMETHODCALLTYPE *GetStreamSelection )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][out] */ 
            __out  BOOL *pfEnabled);
        
        HRESULT ( STDMETHODCALLTYPE *SetStreamSelection )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  BOOL fEnabled);
        
        HRESULT ( STDMETHODCALLTYPE *GetStreamAttribute )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in  REFGUID guidMFAttribute,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvValue);
        
        HRESULT ( STDMETHODCALLTYPE *GetPresentationAttribute )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  REFGUID guidMFAttribute,
            /* [annotation][out] */ 
            __out  PROPVARIANT *pvValue);
        
        HRESULT ( STDMETHODCALLTYPE *GetCharacteristics )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  MFP_MEDIAITEM_CHARACTERISTICS *pCharacteristics);
        
        HRESULT ( STDMETHODCALLTYPE *SetStreamSink )( 
            IMFPMediaItem * This,
            /* [annotation][in] */ 
            __in  DWORD dwStreamIndex,
            /* [annotation][in] */ 
            __in_opt  IUnknown *pMediaSink);
        
        HRESULT ( STDMETHODCALLTYPE *GetMetadata )( 
            IMFPMediaItem * This,
            /* [annotation][out] */ 
            __out  IPropertyStore **ppMetadataStore);
        
        END_INTERFACE
    } IMFPMediaItemVtbl;

    interface IMFPMediaItem
    {
        CONST_VTBL struct IMFPMediaItemVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFPMediaItem_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFPMediaItem_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFPMediaItem_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFPMediaItem_GetMediaPlayer(This,ppMediaPlayer)	\
    ( (This)->lpVtbl -> GetMediaPlayer(This,ppMediaPlayer) ) 

#define IMFPMediaItem_GetURL(This,ppwszURL)	\
    ( (This)->lpVtbl -> GetURL(This,ppwszURL) ) 

#define IMFPMediaItem_GetObject(This,ppIUnknown)	\
    ( (This)->lpVtbl -> GetObject(This,ppIUnknown) ) 

#define IMFPMediaItem_GetUserData(This,pdwUserData)	\
    ( (This)->lpVtbl -> GetUserData(This,pdwUserData) ) 

#define IMFPMediaItem_SetUserData(This,dwUserData)	\
    ( (This)->lpVtbl -> SetUserData(This,dwUserData) ) 

#define IMFPMediaItem_GetStartStopPosition(This,pguidStartPositionType,pvStartValue,pguidStopPositionType,pvStopValue)	\
    ( (This)->lpVtbl -> GetStartStopPosition(This,pguidStartPositionType,pvStartValue,pguidStopPositionType,pvStopValue) ) 

#define IMFPMediaItem_SetStartStopPosition(This,pguidStartPositionType,pvStartValue,pguidStopPositionType,pvStopValue)	\
    ( (This)->lpVtbl -> SetStartStopPosition(This,pguidStartPositionType,pvStartValue,pguidStopPositionType,pvStopValue) ) 

#define IMFPMediaItem_HasVideo(This,pfHasVideo,pfSelected)	\
    ( (This)->lpVtbl -> HasVideo(This,pfHasVideo,pfSelected) ) 

#define IMFPMediaItem_HasAudio(This,pfHasAudio,pfSelected)	\
    ( (This)->lpVtbl -> HasAudio(This,pfHasAudio,pfSelected) ) 

#define IMFPMediaItem_IsProtected(This,pfProtected)	\
    ( (This)->lpVtbl -> IsProtected(This,pfProtected) ) 

#define IMFPMediaItem_GetDuration(This,guidPositionType,pvDurationValue)	\
    ( (This)->lpVtbl -> GetDuration(This,guidPositionType,pvDurationValue) ) 

#define IMFPMediaItem_GetNumberOfStreams(This,pdwStreamCount)	\
    ( (This)->lpVtbl -> GetNumberOfStreams(This,pdwStreamCount) ) 

#define IMFPMediaItem_GetStreamSelection(This,dwStreamIndex,pfEnabled)	\
    ( (This)->lpVtbl -> GetStreamSelection(This,dwStreamIndex,pfEnabled) ) 

#define IMFPMediaItem_SetStreamSelection(This,dwStreamIndex,fEnabled)	\
    ( (This)->lpVtbl -> SetStreamSelection(This,dwStreamIndex,fEnabled) ) 

#define IMFPMediaItem_GetStreamAttribute(This,dwStreamIndex,guidMFAttribute,pvValue)	\
    ( (This)->lpVtbl -> GetStreamAttribute(This,dwStreamIndex,guidMFAttribute,pvValue) ) 

#define IMFPMediaItem_GetPresentationAttribute(This,guidMFAttribute,pvValue)	\
    ( (This)->lpVtbl -> GetPresentationAttribute(This,guidMFAttribute,pvValue) ) 

#define IMFPMediaItem_GetCharacteristics(This,pCharacteristics)	\
    ( (This)->lpVtbl -> GetCharacteristics(This,pCharacteristics) ) 

#define IMFPMediaItem_SetStreamSink(This,dwStreamIndex,pMediaSink)	\
    ( (This)->lpVtbl -> SetStreamSink(This,dwStreamIndex,pMediaSink) ) 

#define IMFPMediaItem_GetMetadata(This,ppMetadataStore)	\
    ( (This)->lpVtbl -> GetMetadata(This,ppMetadataStore) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFPMediaItem_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_mfplay_0000_0002 */
/* [local] */ 

typedef 
enum MFP_EVENT_TYPE
    {	MFP_EVENT_TYPE_PLAY	= 0,
	MFP_EVENT_TYPE_PAUSE	= 1,
	MFP_EVENT_TYPE_STOP	= 2,
	MFP_EVENT_TYPE_POSITION_SET	= 3,
	MFP_EVENT_TYPE_RATE_SET	= 4,
	MFP_EVENT_TYPE_MEDIAITEM_CREATED	= 5,
	MFP_EVENT_TYPE_MEDIAITEM_SET	= 6,
	MFP_EVENT_TYPE_FRAME_STEP	= 7,
	MFP_EVENT_TYPE_MEDIAITEM_CLEARED	= 8,
	MFP_EVENT_TYPE_MF	= 9,
	MFP_EVENT_TYPE_ERROR	= 10,
	MFP_EVENT_TYPE_PLAYBACK_ENDED	= 11,
	MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL	= 12
    } 	MFP_EVENT_TYPE;

typedef struct MFP_EVENT_HEADER
    {
    MFP_EVENT_TYPE eEventType;
    HRESULT hrEvent;
    IMFPMediaPlayer *pMediaPlayer;
    MFP_MEDIAPLAYER_STATE eState;
    IPropertyStore *pPropertyStore;
    } 	MFP_EVENT_HEADER;

typedef struct MFP_PLAY_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_PLAY_EVENT;

typedef struct MFP_PAUSE_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_PAUSE_EVENT;

typedef struct MFP_STOP_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_STOP_EVENT;

typedef struct MFP_POSITION_SET_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_POSITION_SET_EVENT;

typedef struct MFP_RATE_SET_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    float flRate;
    } 	MFP_RATE_SET_EVENT;

typedef struct MFP_MEDIAITEM_CREATED_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    DWORD_PTR dwUserData;
    } 	MFP_MEDIAITEM_CREATED_EVENT;

typedef struct MFP_MEDIAITEM_SET_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_MEDIAITEM_SET_EVENT;

typedef struct MFP_FRAME_STEP_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_FRAME_STEP_EVENT;

typedef struct MFP_MEDIAITEM_CLEARED_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_MEDIAITEM_CLEARED_EVENT;

typedef struct MFP_MF_EVENT
    {
    MFP_EVENT_HEADER header;
    MediaEventType MFEventType;
    IMFMediaEvent *pMFMediaEvent;
    IMFPMediaItem *pMediaItem;
    } 	MFP_MF_EVENT;

typedef struct MFP_ERROR_EVENT
    {
    MFP_EVENT_HEADER header;
    } 	MFP_ERROR_EVENT;

typedef struct MFP_PLAYBACK_ENDED_EVENT
    {
    MFP_EVENT_HEADER header;
    IMFPMediaItem *pMediaItem;
    } 	MFP_PLAYBACK_ENDED_EVENT;

typedef struct MFP_ACQUIRE_USER_CREDENTIAL_EVENT
    {
    MFP_EVENT_HEADER header;
    DWORD_PTR dwUserData;
    BOOL fProceedWithAuthentication;
    HRESULT hrAuthenticationStatus;
    LPCWSTR pwszURL;
    LPCWSTR pwszSite;
    LPCWSTR pwszRealm;
    LPCWSTR pwszPackage;
    LONG nRetries;
    MFP_CREDENTIAL_FLAGS flags;
    IMFNetCredential *pCredential;
    } 	MFP_ACQUIRE_USER_CREDENTIAL_EVENT;

EXTERN_C const DECLSPEC_SELECTANY PROPERTYKEY MFP_PKEY_StreamIndex = { { 0xa7cf9740, 0xe8d9, 0x4a87, { 0xbd, 0x8e, 0x29, 0x67, 0x0, 0x1f, 0xd3, 0xad } }, 0x00 }; 
EXTERN_C const DECLSPEC_SELECTANY PROPERTYKEY MFP_PKEY_StreamRenderingResults = { { 0xa7cf9740, 0xe8d9, 0x4a87, { 0xbd, 0x8e, 0x29, 0x67, 0x0, 0x1f, 0xd3, 0xad } }, 0x01 }; 
#define __MFP_CAST_EVENT( pHdr, Tag )                                   ( ( (pHdr)->eEventType == MFP_EVENT_TYPE_##Tag ) ? (MFP_##Tag##_EVENT*)(pHdr) : NULL )
#define MFP_GET_PLAY_EVENT( pHdr )                                      __MFP_CAST_EVENT( pHdr, PLAY )
#define MFP_GET_PAUSE_EVENT( pHdr )                                     __MFP_CAST_EVENT( pHdr, PAUSE )
#define MFP_GET_STOP_EVENT( pHdr )                                      __MFP_CAST_EVENT( pHdr, STOP )
#define MFP_GET_POSITION_SET_EVENT( pHdr )                              __MFP_CAST_EVENT( pHdr, POSITION_SET )
#define MFP_GET_RATE_SET_EVENT( pHdr )                                  __MFP_CAST_EVENT( pHdr, RATE_SET )
#define MFP_GET_MEDIAITEM_CREATED_EVENT( pHdr )                         __MFP_CAST_EVENT( pHdr, MEDIAITEM_CREATED )
#define MFP_GET_MEDIAITEM_SET_EVENT( pHdr )                             __MFP_CAST_EVENT( pHdr, MEDIAITEM_SET )
#define MFP_GET_FRAME_STEP_EVENT( pHdr )                                __MFP_CAST_EVENT( pHdr, FRAME_STEP )
#define MFP_GET_MEDIAITEM_CLEARED_EVENT( pHdr )                         __MFP_CAST_EVENT( pHdr, MEDIAITEM_CLEARED )
#define MFP_GET_MF_EVENT( pHdr )                                        __MFP_CAST_EVENT( pHdr, MF )
#define MFP_GET_ERROR_EVENT( pHdr )                                     __MFP_CAST_EVENT( pHdr, ERROR )
#define MFP_GET_PLAYBACK_ENDED_EVENT( pHdr )                            __MFP_CAST_EVENT( pHdr, PLAYBACK_ENDED )
#define MFP_GET_ACQUIRE_USER_CREDENTIAL_EVENT( pHdr )                   __MFP_CAST_EVENT( pHdr, ACQUIRE_USER_CREDENTIAL )


extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0002_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0002_v0_0_s_ifspec;

#ifndef __IMFPMediaPlayerCallback_INTERFACE_DEFINED__
#define __IMFPMediaPlayerCallback_INTERFACE_DEFINED__

/* interface IMFPMediaPlayerCallback */
/* [uuid][object][local] */ 


EXTERN_C const IID IID_IMFPMediaPlayerCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("766C8FFB-5FDB-4fea-A28D-B912996F51BD")
    IMFPMediaPlayerCallback : public IUnknown
    {
    public:
        virtual void STDMETHODCALLTYPE OnMediaPlayerEvent( 
            /* [annotation][in] */ 
            __in  MFP_EVENT_HEADER *pEventHeader) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMFPMediaPlayerCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IMFPMediaPlayerCallback * This,
            /* [in] */ REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IMFPMediaPlayerCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IMFPMediaPlayerCallback * This);
        
        void ( STDMETHODCALLTYPE *OnMediaPlayerEvent )( 
            IMFPMediaPlayerCallback * This,
            /* [annotation][in] */ 
            __in  MFP_EVENT_HEADER *pEventHeader);
        
        END_INTERFACE
    } IMFPMediaPlayerCallbackVtbl;

    interface IMFPMediaPlayerCallback
    {
        CONST_VTBL struct IMFPMediaPlayerCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMFPMediaPlayerCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMFPMediaPlayerCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMFPMediaPlayerCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMFPMediaPlayerCallback_OnMediaPlayerEvent(This,pEventHeader)	\
    ( (This)->lpVtbl -> OnMediaPlayerEvent(This,pEventHeader) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMFPMediaPlayerCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_mfplay_0000_0003 */
/* [local] */ 

#endif // (WINVER >= _WIN32_WINNT_WIN7) 


extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0003_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_mfplay_0000_0003_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif



