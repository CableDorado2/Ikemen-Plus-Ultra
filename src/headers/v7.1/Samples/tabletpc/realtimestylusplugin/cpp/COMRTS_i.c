

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


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


#ifdef __cplusplus
extern "C"{
#endif 


#include <rpc.h>
#include <rpcndr.h>

#ifdef _MIDL_USE_GUIDDEF_

#ifndef INITGUID
#define INITGUID
#include <guiddef.h>
#undef INITGUID
#else
#include <guiddef.h>
#endif

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        DEFINE_GUID(name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8)

#else // !_MIDL_USE_GUIDDEF_

#ifndef __IID_DEFINED__
#define __IID_DEFINED__

typedef struct _IID
{
    unsigned long x;
    unsigned short s1;
    unsigned short s2;
    unsigned char  c[8];
} IID;

#endif // __IID_DEFINED__

#ifndef CLSID_DEFINED
#define CLSID_DEFINED
typedef IID CLSID;
#endif // CLSID_DEFINED

#define MIDL_DEFINE_GUID(type,name,l,w1,w2,b1,b2,b3,b4,b5,b6,b7,b8) \
        const type name = {l,w1,w2,{b1,b2,b3,b4,b5,b6,b7,b8}}

#endif !_MIDL_USE_GUIDDEF_

MIDL_DEFINE_GUID(IID, IID_IPacketModifier,0xCECF232D,0x25D4,0x468D,0x8B,0x67,0x7D,0x9B,0xD7,0x22,0x46,0x7D);


MIDL_DEFINE_GUID(IID, IID_ICustomRenderer,0x2438D9B4,0x2139,0x42A9,0xA6,0x1B,0x60,0xE6,0x4C,0xD8,0x5B,0xDA);


MIDL_DEFINE_GUID(IID, IID_IGestureHandler,0x948F648D,0x0A4F,0x4077,0xA6,0x53,0x3B,0x55,0x76,0x4C,0xFF,0xFC);


MIDL_DEFINE_GUID(IID, LIBID_COMRTSLib,0x7819C446,0x8B13,0x4409,0x85,0x2D,0xB0,0x4B,0xAA,0x21,0x98,0xDE);


MIDL_DEFINE_GUID(CLSID, CLSID_PacketModifier,0x38C6395F,0x0C50,0x47D2,0x83,0x73,0xBA,0x57,0x6E,0xCE,0x3D,0xFE);


MIDL_DEFINE_GUID(CLSID, CLSID_CustomRenderer,0xD919FD8D,0xA0BC,0x4072,0x90,0x87,0x04,0xD8,0xA1,0xCD,0x37,0xDF);


MIDL_DEFINE_GUID(CLSID, CLSID_GestureHandler,0x9826AFCB,0x62B0,0x4FEB,0xAD,0x62,0x7B,0xAC,0x3D,0xC4,0xAE,0x74);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



