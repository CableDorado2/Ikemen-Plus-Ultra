

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


 /* File created by MIDL compiler version 7.00.0499 */
/* at Mon Oct 23 11:04:56 2006
 */
/* Compiler settings for .\EraseSample.idl:
    Oicf, W1, Zp8, env=Win64 (32b run)
    protocol : dce , ms_ext, c_ext, robust
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

MIDL_DEFINE_GUID(IID, IID_IEraseSample,0x2A97995D,0x523A,0x40cc,0xAE,0x40,0xD5,0x4E,0xA2,0x14,0xBA,0xE5);


MIDL_DEFINE_GUID(IID, IID_DEraseSampleEvents,0xE2DDFE2A,0x3BD5,0x4896,0x87,0xE2,0xB6,0xB2,0xF5,0x82,0x98,0xE0);


MIDL_DEFINE_GUID(IID, LIBID_EraseSampleLib,0x32DAE09E,0x4A98,0x4967,0xA4,0x7C,0xC0,0x74,0x41,0x27,0xB8,0xCB);


MIDL_DEFINE_GUID(CLSID, CLSID_MsftEraseSample,0x786e85d1,0x9f56,0x47ed,0x9c,0xbb,0x9b,0xe1,0xe9,0xb2,0xb0,0x74);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



