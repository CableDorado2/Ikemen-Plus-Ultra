

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0499 */
/* Compiler settings for tlbref.idl:
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

#ifndef __tlbref_h__
#define __tlbref_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __ITypeLibResolver_FWD_DEFINED__
#define __ITypeLibResolver_FWD_DEFINED__
typedef interface ITypeLibResolver ITypeLibResolver;
#endif 	/* __ITypeLibResolver_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_tlbref_0000_0000 */
/* [local] */ 

EXTERN_GUID(IID_ITypeLibResolver, 0x8F026EDB, 0x785E, 0x4470, 0xA8, 0xE1, 0xB4, 0xE8, 0x4E, 0x9D, 0x17, 0x79);


extern RPC_IF_HANDLE __MIDL_itf_tlbref_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_tlbref_0000_0000_v0_0_s_ifspec;

#ifndef __ITypeLibResolver_INTERFACE_DEFINED__
#define __ITypeLibResolver_INTERFACE_DEFINED__

/* interface ITypeLibResolver */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_ITypeLibResolver;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8F026EDB-785E-4470-A8E1-B4E84E9D1779")
    ITypeLibResolver : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE ResolveTypeLib( 
            /* [in] */ __RPC__in BSTR bstrSimpleName,
            /* [in] */ GUID tlbid,
            /* [in] */ LCID lcid,
            /* [in] */ USHORT wMajorVersion,
            /* [in] */ USHORT wMinorVersion,
            /* [in] */ SYSKIND syskind,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrResolvedTlbName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITypeLibResolverVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            ITypeLibResolver * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            ITypeLibResolver * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            ITypeLibResolver * This);
        
        HRESULT ( STDMETHODCALLTYPE *ResolveTypeLib )( 
            ITypeLibResolver * This,
            /* [in] */ __RPC__in BSTR bstrSimpleName,
            /* [in] */ GUID tlbid,
            /* [in] */ LCID lcid,
            /* [in] */ USHORT wMajorVersion,
            /* [in] */ USHORT wMinorVersion,
            /* [in] */ SYSKIND syskind,
            /* [out] */ __RPC__deref_out_opt BSTR *pbstrResolvedTlbName);
        
        END_INTERFACE
    } ITypeLibResolverVtbl;

    interface ITypeLibResolver
    {
        CONST_VTBL struct ITypeLibResolverVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITypeLibResolver_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITypeLibResolver_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITypeLibResolver_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITypeLibResolver_ResolveTypeLib(This,bstrSimpleName,tlbid,lcid,wMajorVersion,wMinorVersion,syskind,pbstrResolvedTlbName)	\
    ( (This)->lpVtbl -> ResolveTypeLib(This,bstrSimpleName,tlbid,lcid,wMajorVersion,wMinorVersion,syskind,pbstrResolvedTlbName) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITypeLibResolver_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_tlbref_0000_0001 */
/* [local] */ 

STDAPI LoadTypeLibWithResolver(LPCOLESTR szFile, REGKIND regkind, ITypeLibResolver *pTlbResolver, ITypeLib **pptlib);
STDAPI GetTypeLibInfo(LPWSTR szFile, GUID* pTypeLibID, LCID* pTypeLibLCID, SYSKIND* pTypeLibPlatform, USHORT* pTypeLibMajorVer, USHORT* pTypeLibMinorVer);


extern RPC_IF_HANDLE __MIDL_itf_tlbref_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_tlbref_0000_0001_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  BSTR_UserSize(     unsigned long *, unsigned long            , BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserMarshal(  unsigned long *, unsigned char *, BSTR * ); 
unsigned char * __RPC_USER  BSTR_UserUnmarshal(unsigned long *, unsigned char *, BSTR * ); 
void                      __RPC_USER  BSTR_UserFree(     unsigned long *, BSTR * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


