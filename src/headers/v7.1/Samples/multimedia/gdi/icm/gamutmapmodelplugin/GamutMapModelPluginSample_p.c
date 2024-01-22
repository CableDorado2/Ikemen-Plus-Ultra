

/* this ALWAYS GENERATED file contains the proxy stub code */


 /* File created by MIDL compiler version 7.00.0493 */
/* at Thu Apr 27 14:05:55 2006
 */
/* Compiler settings for .\GamutMapModelPluginSample.idl:
    Oicf, W1, Zp8, env=Win64 (32b run)
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
//@@MIDL_FILE_HEADING(  )

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
#endif // __RPCPROXY_H_VERSION__


#include "GamutMapModelPluginSample.h"

#define TYPE_FORMAT_STRING_SIZE   3                                 
#define PROC_FORMAT_STRING_SIZE   33                                
#define EXPR_FORMAT_STRING_SIZE   1                                 
#define TRANSMIT_AS_TABLE_SIZE    0            
#define WIRE_MARSHAL_TABLE_SIZE   0            

typedef struct _GamutMapModelPluginSample_MIDL_TYPE_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ TYPE_FORMAT_STRING_SIZE ];
    } GamutMapModelPluginSample_MIDL_TYPE_FORMAT_STRING;

typedef struct _GamutMapModelPluginSample_MIDL_PROC_FORMAT_STRING
    {
    short          Pad;
    unsigned char  Format[ PROC_FORMAT_STRING_SIZE ];
    } GamutMapModelPluginSample_MIDL_PROC_FORMAT_STRING;

typedef struct _GamutMapModelPluginSample_MIDL_EXPR_FORMAT_STRING
    {
    long          Pad;
    unsigned char  Format[ EXPR_FORMAT_STRING_SIZE ];
    } GamutMapModelPluginSample_MIDL_EXPR_FORMAT_STRING;


static RPC_SYNTAX_IDENTIFIER  _RpcTransferSyntax = 
{{0x8A885D04,0x1CEB,0x11C9,{0x9F,0xE8,0x08,0x00,0x2B,0x10,0x48,0x60}},{2,0}};


extern const GamutMapModelPluginSample_MIDL_TYPE_FORMAT_STRING GamutMapModelPluginSample__MIDL_TypeFormatString;
extern const GamutMapModelPluginSample_MIDL_PROC_FORMAT_STRING GamutMapModelPluginSample__MIDL_ProcFormatString;
extern const GamutMapModelPluginSample_MIDL_EXPR_FORMAT_STRING GamutMapModelPluginSample__MIDL_ExprFormatString;


extern const MIDL_STUB_DESC Object_StubDesc;


extern const MIDL_SERVER_INFO ISampleDeviceModelPrivateInterface_ServerInfo;
extern const MIDL_STUBLESS_PROXY_INFO ISampleDeviceModelPrivateInterface_ProxyInfo;



#if !defined(__RPC_WIN64__)
#error  Invalid build platform for this stub.
#endif

static const GamutMapModelPluginSample_MIDL_PROC_FORMAT_STRING GamutMapModelPluginSample__MIDL_ProcFormatString =
    {
        0,
        {

	/* Procedure SamplePrivateMethod */

			0x33,		/* FC_AUTO_HANDLE */
			0x6c,		/* Old Flags:  object, Oi2 */
/*  2 */	NdrFcLong( 0x0 ),	/* 0 */
/*  6 */	NdrFcShort( 0x3 ),	/* 3 */
/*  8 */	NdrFcShort( 0x10 ),	/* X64 Stack size/offset = 16 */
/* 10 */	NdrFcShort( 0x0 ),	/* 0 */
/* 12 */	NdrFcShort( 0x8 ),	/* 8 */
/* 14 */	0x44,		/* Oi2 Flags:  has return, has ext, */
			0x1,		/* 1 */
/* 16 */	0xa,		/* 10 */
			0x1,		/* Ext Flags:  new corr desc, */
/* 18 */	NdrFcShort( 0x0 ),	/* 0 */
/* 20 */	NdrFcShort( 0x0 ),	/* 0 */
/* 22 */	NdrFcShort( 0x0 ),	/* 0 */
/* 24 */	NdrFcShort( 0x0 ),	/* 0 */

	/* Return value */

/* 26 */	NdrFcShort( 0x70 ),	/* Flags:  out, return, base type, */
/* 28 */	NdrFcShort( 0x8 ),	/* X64 Stack size/offset = 8 */
/* 30 */	0x8,		/* FC_LONG */
			0x0,		/* 0 */

			0x0
        }
    };

static const GamutMapModelPluginSample_MIDL_TYPE_FORMAT_STRING GamutMapModelPluginSample__MIDL_TypeFormatString =
    {
        0,
        {
			NdrFcShort( 0x0 ),	/* 0 */

			0x0
        }
    };


/* Object interface: IUnknown, ver. 0.0,
   GUID={0x00000000,0x0000,0x0000,{0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x46}} */


/* Object interface: ISampleDeviceModelPrivateInterface, ver. 0.0,
   GUID={0x94617F91,0x2C14,0x4485,{0x9B,0x94,0xA7,0x85,0x79,0xB7,0x35,0x23}} */

#pragma code_seg(".orpc")
static const unsigned short ISampleDeviceModelPrivateInterface_FormatStringOffsetTable[] =
    {
    0
    };

static const MIDL_STUBLESS_PROXY_INFO ISampleDeviceModelPrivateInterface_ProxyInfo =
    {
    &Object_StubDesc,
    GamutMapModelPluginSample__MIDL_ProcFormatString.Format,
    &ISampleDeviceModelPrivateInterface_FormatStringOffsetTable[-3],
    0,
    0,
    0
    };


static const MIDL_SERVER_INFO ISampleDeviceModelPrivateInterface_ServerInfo = 
    {
    &Object_StubDesc,
    0,
    GamutMapModelPluginSample__MIDL_ProcFormatString.Format,
    &ISampleDeviceModelPrivateInterface_FormatStringOffsetTable[-3],
    0,
    0,
    0,
    0};
CINTERFACE_PROXY_VTABLE(4) _ISampleDeviceModelPrivateInterfaceProxyVtbl = 
{
    &ISampleDeviceModelPrivateInterface_ProxyInfo,
    &IID_ISampleDeviceModelPrivateInterface,
    IUnknown_QueryInterface_Proxy,
    IUnknown_AddRef_Proxy,
    IUnknown_Release_Proxy ,
    (void *) (INT_PTR) -1 /* ISampleDeviceModelPrivateInterface::SamplePrivateMethod */
};

const CInterfaceStubVtbl _ISampleDeviceModelPrivateInterfaceStubVtbl =
{
    &IID_ISampleDeviceModelPrivateInterface,
    &ISampleDeviceModelPrivateInterface_ServerInfo,
    4,
    0, /* pure interpreted */
    CStdStubBuffer_METHODS
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
    GamutMapModelPluginSample__MIDL_TypeFormatString.Format,
    1, /* -error bounds_check flag */
    0x50002, /* Ndr library version */
    0,
    0x70001ed, /* MIDL Version 7.0.493 */
    0,
    0,
    0,  /* notify & notify_flag routine table */
    0x1, /* MIDL flag */
    0, /* cs routines */
    0,   /* proxy/server info */
    0
    };

const CInterfaceProxyVtbl * _GamutMapModelPluginSample_ProxyVtblList[] = 
{
    ( CInterfaceProxyVtbl *) &_ISampleDeviceModelPrivateInterfaceProxyVtbl,
    0
};

const CInterfaceStubVtbl * _GamutMapModelPluginSample_StubVtblList[] = 
{
    ( CInterfaceStubVtbl *) &_ISampleDeviceModelPrivateInterfaceStubVtbl,
    0
};

PCInterfaceName const _GamutMapModelPluginSample_InterfaceNamesList[] = 
{
    "ISampleDeviceModelPrivateInterface",
    0
};


#define _GamutMapModelPluginSample_CHECK_IID(n)	IID_GENERIC_CHECK_IID( _GamutMapModelPluginSample, pIID, n)

int __stdcall _GamutMapModelPluginSample_IID_Lookup( const IID * pIID, int * pIndex )
{
    
    if(!_GamutMapModelPluginSample_CHECK_IID(0))
        {
        *pIndex = 0;
        return 1;
        }

    return 0;
}

const ExtendedProxyFileInfo GamutMapModelPluginSample_ProxyFileInfo = 
{
    (PCInterfaceProxyVtblList *) & _GamutMapModelPluginSample_ProxyVtblList,
    (PCInterfaceStubVtblList *) & _GamutMapModelPluginSample_StubVtblList,
    (const PCInterfaceName * ) & _GamutMapModelPluginSample_InterfaceNamesList,
    0, // no delegation
    & _GamutMapModelPluginSample_IID_Lookup, 
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

