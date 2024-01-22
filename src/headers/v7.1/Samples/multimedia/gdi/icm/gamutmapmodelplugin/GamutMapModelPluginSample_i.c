

/* this ALWAYS GENERATED file contains the IIDs and CLSIDs */

/* link this file in with the server and any clients */


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

MIDL_DEFINE_GUID(IID, IID_ISampleDeviceModelPrivateInterface,0x94617F91,0x2C14,0x4485,0x9B,0x94,0xA7,0x85,0x79,0xB7,0x35,0x23);


MIDL_DEFINE_GUID(IID, LIBID_GamutMapModelPluginSampleLib,0x32B5DD48,0xA0C5,0x4739,0x86,0x93,0xEA,0xD1,0xDD,0x84,0x06,0x27);


MIDL_DEFINE_GUID(CLSID, CLSID_GamutMapModelPluginSample,0x4B9E0DFE,0xF8F6,0x4d8c,0xB1,0x4F,0xF9,0x95,0x11,0xC5,0x00,0x2F);

#undef MIDL_DEFINE_GUID

#ifdef __cplusplus
}
#endif



