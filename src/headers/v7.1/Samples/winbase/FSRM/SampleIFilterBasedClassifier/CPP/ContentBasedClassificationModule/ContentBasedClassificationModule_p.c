

/* this ALWAYS GENERATED file contains the proxy stub code */


 /* File created by MIDL compiler version 7.00.0553 */
/* at Mon Feb 16 16:40:08 2009
 */
/* Compiler settings for .\ContentBasedClassificationModule.idl:
    Oicf, W1, Zp8, env=Win64 (32b run), target_arch=AMD64 7.00.0553 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#if defined(_M_AMD64)


#pragma warning( disable: 4049 )  /* more than 64k source lines */
#if _MSC_VER >= 1200
#pragma warning(push)
#endif

#pragma warning( disable: 4211 )  /* redefine extern to static */
#pragma warning( disable: 4232 )  /* dllimport identity*/
#pragma warning( disable: 4024 )  /* array to pointer mapping*/
#pragma warning( disable: 4152 )  /* function/data pointer conversion in expression */

#define USE_STUBLESS_PROXY


/* verify that the <rpcproxy.h> version is high enough to compile this file*/
#ifndef __REDQ_RPCPROXY_H_VERSION__
#define __REQUIRED_RPCPROXY_H_VERSION__ 475
#endif


#include "rpcproxy.h"
#ifndef __RPCPROXY_H_VERSION__
#error this stub requires an updated version of <rpcproxy.h>
#endif /* __RPCPROXY_H_VERSION__ */


#include "ContentBasedClassificationModule.h"

#define TYPE_FORMAT_STRING_SIZE   3                                 
#define PROC_FORMAT_STRING_SIZE   1                                 
#define EXPR_FORMAT_STRING_SIZE   1                                 
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   0            

typedef struct _ContentBasedClassificationModule_MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } ContentBasedClassificationModule_MIDL_TYPE_FORMAT_STRING;

typedef struct _ContentBasedClassificationModule_MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } ContentBasedClassificationModule_MIDL_PROC_FORMAT_STRING;

typedef struct _ContentBasedClassificationModule_MIDL_EXPR_FORMAT_STRING
    {
    long          Pad;
    unsigned char  Format[ EXPR_FORMAT_STRING_SIZE ];
    } ContentBasedClassificationModule_MIDL_EXPR_FORMAT_STRING;


static const RPC_SYNTAX_IDENTIFIER  _RpcTransferSyntax = 
{{0x8A885D04,0x1CEB,0x11C9,{0x9F,0xE8,0x08,0x00,0x2B,0x10,0x48,0x60}},{2,0}};


extern const ContentBasedClassificationModule_MIDL_TYPE_FORMAT_STRING ContentBasedClassificationModule__MIDL_TypeFormatString;
extern const ContentBasedClassificationModule_MIDL_PROC_FORMAT_STRING ContentBasedClassificationModule__MIDL_ProcFormatString;
extern const ContentBasedClassificationModule_MIDL_EXPR_FORMAT_STRING ContentBasedClassificationModule__MIDL_ExprFormatString;


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO IContentBasedClassifier_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO IContentBasedClassifier_ProxyInfo;



#if !defined(__RPC_WIN64__)
#error  Invalid build platform for this stub.
#endif

static const ContentBasedClassificationModule_MIDL_PROC_FORMAT_STRING ContentBasedClassificationModule__MIDL_ProcFormatString =
    {
        0,
        {

			0x0
        }
    };

static const ContentBasedClassificationModule_MIDL_TYPE_FORMAT_STRING ContentBasedClassificationModule__MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */

			0x0
        }
    };


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IDispatch, ver. 0.0,
   GUID={0x00020400,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: IContentBasedClassifier, ver. 0.0,
   GUID={0x74614539,0xC851,0x4E87,{0xBC,0xAA,0x01,0xC3,0x02,0x46,0xDC,0x6E}} */

#pragma code_seg(".orpc")
static const unsigned short IContentBasedClassifier_FormatStringOffsetTable[] =
    {
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    (unsigned short) -1,
    0
    };

static const MIDL_STUBLESS_PROXY_INFO IContentBasedClassifier_ProxyInfo =
    {
    &Object_StubDesc,
    ContentBasedClassificationModule__MIDL_ProcFormatString.Format,
    &IContentBasedClassifier_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO IContentBasedClassifier_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    ContentBasedClassificationModule__MIDL_ProcFormatString.Format,
    &IContentBasedClassifier_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
CINTERFACE_PROXY_VTABLE(7) _IContentBasedClassifierProxyVtbl = 
{
    0,
    &IID_IContentBasedClassifier,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    0 /* IDispatch::GetTypeInfoCount */ ,
    0 /* IDispatch::GetTypeInfo */ ,
    0 /* IDispatch::GetIDsOfNames */ ,
    0 /* IDispatch_Invoke_Proxy */
};


static const PRPC_STUB_FUNCTION IContentBasedClassifier_table[] =
{
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION,
    STUB_FORWARDING_FUNCTION
};

CInterfaceStubVtbl _IContentBasedClassifierStubVtbl =
{
    &IID_IContentBasedClassifier,
    &IContentBasedClassifier_ServerInfo,
    7,
    &IContentBasedClassifier_table[-3],
    CStdStubBuffer_DELEGATING_METHODS
};

static const MIDL_STUB_DESC Object_StubDesc = 
    {
    0,
    NdrOleAllocate,
    NdrOleFree,
    0,
    0,
    0,
    0,
    0,
    ContentBasedClassificationModule__MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x50002, /* Ndr library version */
    0,
    0x7000229, /* MIDL Version 7.0.553 */
    0,
    0,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0, /* cs routines */
    0,   /* proxy/server info */
    0
    };

const CInterfaceProxyVtbl * const _ContentBasedClassificationModule_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_IContentBasedClassifierProxyVtbl,
    0
};

const CInterfaceStubVtbl * const _ContentBasedClassificationModule_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_IContentBasedClassifierStubVtbl,
    0
};

PCInterfaceName const _ContentBasedClassificationModule_InterfaceNamesList[] = 
{
    "IContentBasedClassifier",
    0
};

const IID *  const _ContentBasedClassificationModule_BaseIIDList[] = 
{
    &IID_IDispatch,
    0
};


#define _ContentBasedClassificationModule_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _ContentBasedClassificationModule, pIID, n)

int __stdcall _ContentBasedClassificationModule_IID_Lookup( const IID * pIID, int * pIndex )
{
    
    if(!_ContentBasedClassificationModule_CHECK_IID(0))
        {
        *pIndex = 0;
        return 1;
        }

    return 0;
}

const ExtendedProxyFileInfo ContentBasedClassificationModule_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _ContentBasedClassificationModule_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _ContentBasedClassificationModule_StubVtblList,
    (const PCInterfaceName * ) & _ContentBasedClassificationModule_InterfaceNamesList,
    (const IID ** ) & _ContentBasedClassificationModule_BaseIIDList,
    & _ContentBasedClassificationModule_IID_Lookup, 
    1,
    2,
    0, /* table of [async_uuid] interfaces */
    0, /* Filler1 */
    0, /* Filler2 */
    0  /* Filler3 */
};
#if _MSC_VER >= 1200
#pragma warning(pop)
#endif


#endif /* defined(_M_AMD64)*/

