

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 6.00.0366 */
/* at Fri Mar 31 17:58:52 2006
 */
/* Compiler settings for .\COMRTS.idl:
    Oicf, W1, Zp8, env=Win32 (32b run)
    protocol : dce , ms_ext, c_ext
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 440
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

#ifndef __COMRTS_i_h__
#define __COMRTS_i_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IPacketModifier_FWD_DEFINED__
#define __IPacketModifier_FWD_DEFINED__
typedef interface IPacketModifier IPacketModifier;
#endif 	/* __IPacketModifier_FWD_DEFINED__ */


#ifndef __ICustomRenderer_FWD_DEFINED__
#define __ICustomRenderer_FWD_DEFINED__
typedef interface ICustomRenderer ICustomRenderer;
#endif 	/* __ICustomRenderer_FWD_DEFINED__ */


#ifndef __IGestureHandler_FWD_DEFINED__
#define __IGestureHandler_FWD_DEFINED__
typedef interface IGestureHandler IGestureHandler;
#endif 	/* __IGestureHandler_FWD_DEFINED__ */


#ifndef __PacketModifier_FWD_DEFINED__
#define __PacketModifier_FWD_DEFINED__

#ifdef __cplusplus
typedef class PacketModifier PacketModifier;
#else
typedef struct PacketModifier PacketModifier;
#endif /* __cplusplus */

#endif 	/* __PacketModifier_FWD_DEFINED__ */


#ifndef __CustomRenderer_FWD_DEFINED__
#define __CustomRenderer_FWD_DEFINED__

#ifdef __cplusplus
typedef class CustomRenderer CustomRenderer;
#else
typedef struct CustomRenderer CustomRenderer;
#endif /* __cplusplus */

#endif 	/* __CustomRenderer_FWD_DEFINED__ */


#ifndef __GestureHandler_FWD_DEFINED__
#define __GestureHandler_FWD_DEFINED__

#ifdef __cplusplus
typedef class GestureHandler GestureHandler;
#else
typedef struct GestureHandler GestureHandler;
#endif /* __cplusplus */

#endif 	/* __GestureHandler_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 

void * __RPC_USER MIDL_user_allocate(size_t);
void __RPC_USER MIDL_user_free( void * ); 

#ifndef __IPacketModifier_INTERFACE_DEFINED__
#define __IPacketModifier_INTERFACE_DEFINED__

/* interface IPacketModifier */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IPacketModifier;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("CECF232D-25D4-468D-8B67-7D9BD722467D")
    IPacketModifier : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetRectangle( 
            HDC hDC,
            RECT rect) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IPacketModifierVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IPacketModifier * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IPacketModifier * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IPacketModifier * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetRectangle )( 
            IPacketModifier * This,
            HDC hDC,
            RECT rect);
        
        END_INTERFACE
    } IPacketModifierVtbl;

    interface IPacketModifier
    {
        CONST_VTBL struct IPacketModifierVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IPacketModifier_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IPacketModifier_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IPacketModifier_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define IPacketModifier_SetRectangle(This,hDC,rect)	\
    (This)->lpVtbl -> SetRectangle(This,hDC,rect)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE IPacketModifier_SetRectangle_Proxy( 
    IPacketModifier * This,
    HDC hDC,
    RECT rect);


void __RPC_STUB IPacketModifier_SetRectangle_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __IPacketModifier_INTERFACE_DEFINED__ */


#ifndef __ICustomRenderer_INTERFACE_DEFINED__
#define __ICustomRenderer_INTERFACE_DEFINED__

/* interface ICustomRenderer */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_ICustomRenderer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2438D9B4-2139-42A9-A61B-60E64CD85BDA")
    ICustomRenderer : public IUnknown
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetHDC( 
            HDC hDC) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ICustomRendererVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ICustomRenderer * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ICustomRenderer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ICustomRenderer * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetHDC )( 
            ICustomRenderer * This,
            HDC hDC);
        
        END_INTERFACE
    } ICustomRendererVtbl;

    interface ICustomRenderer
    {
        CONST_VTBL struct ICustomRendererVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ICustomRenderer_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define ICustomRenderer_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define ICustomRenderer_Release(This)	\
    (This)->lpVtbl -> Release(This)


#define ICustomRenderer_SetHDC(This,hDC)	\
    (This)->lpVtbl -> SetHDC(This,hDC)

#endif /* COBJMACROS */


#endif 	/* C style interface */



/* [helpstring] */ HRESULT STDMETHODCALLTYPE ICustomRenderer_SetHDC_Proxy( 
    ICustomRenderer * This,
    HDC hDC);


void __RPC_STUB ICustomRenderer_SetHDC_Stub(
    IRpcStubBuffer *This,
    IRpcChannelBuffer *_pRpcChannelBuffer,
    PRPC_MESSAGE _pRpcMessage,
    DWORD *_pdwStubPhase);



#endif 	/* __ICustomRenderer_INTERFACE_DEFINED__ */


#ifndef __IGestureHandler_INTERFACE_DEFINED__
#define __IGestureHandler_INTERFACE_DEFINED__

/* interface IGestureHandler */
/* [unique][helpstring][uuid][object] */ 


EXTERN_C const IID IID_IGestureHandler;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("948F648D-0A4F-4077-A653-3B55764CFFFC")
    IGestureHandler : public IUnknown
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IGestureHandlerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            IGestureHandler * This,
            /* [in] */ REFIID riid,
            /* [iid_is][out] */ void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            IGestureHandler * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            IGestureHandler * This);
        
        END_INTERFACE
    } IGestureHandlerVtbl;

    interface IGestureHandler
    {
        CONST_VTBL struct IGestureHandlerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IGestureHandler_QueryInterface(This,riid,ppvObject)	\
    (This)->lpVtbl -> QueryInterface(This,riid,ppvObject)

#define IGestureHandler_AddRef(This)	\
    (This)->lpVtbl -> AddRef(This)

#define IGestureHandler_Release(This)	\
    (This)->lpVtbl -> Release(This)


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IGestureHandler_INTERFACE_DEFINED__ */



#ifndef __COMRTSLib_LIBRARY_DEFINED__
#define __COMRTSLib_LIBRARY_DEFINED__

/* library COMRTSLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_COMRTSLib;

EXTERN_C const CLSID CLSID_PacketModifier;

#ifdef __cplusplus

class DECLSPEC_UUID("38C6395F-0C50-47D2-8373-BA576ECE3DFE")
PacketModifier;
#endif

EXTERN_C const CLSID CLSID_CustomRenderer;

#ifdef __cplusplus

class DECLSPEC_UUID("D919FD8D-A0BC-4072-9087-04D8A1CD37DF")
CustomRenderer;
#endif

EXTERN_C const CLSID CLSID_GestureHandler;

#ifdef __cplusplus

class DECLSPEC_UUID("9826AFCB-62B0-4FEB-AD62-7BAC3DC4AE74")
GestureHandler;
#endif
#endif /* __COMRTSLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  HDC_UserSize(     unsigned long *, unsigned long            , HDC * ); 
unsigned char * __RPC_USER  HDC_UserMarshal(  unsigned long *, unsigned char *, HDC * ); 
unsigned char * __RPC_USER  HDC_UserUnmarshal(unsigned long *, unsigned char *, HDC * ); 
void                      __RPC_USER  HDC_UserFree(     unsigned long *, HDC * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


