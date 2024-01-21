/*++

Copyright (c) 2006 Microsoft Corporation

Module Name:

    WdsBp.h

Abstract:

    This module defines data structure and public APIs which are used to parse
    and construct packets for WDS Network Boot Program.

Environment:

    User Mode

--*/

#ifndef __WDSBP_H__
#define __WDSBP_H__

#ifdef __cplusplus
extern "C"
{
#endif

//
// Calling Convention.
//

#define WDSBPAPI        __stdcall

//
// Options used by WDS Network Boot Program.
//

#define WDSBP_MAKE_OPTION(_Pk, _Type, _Id)      ((_Type) | ((_Pk) << 8) | ((_Id) << 16))

//
// Packet Types.
//

#define WDSBP_PK_TYPE_DHCP                      1
#define WDSBP_PK_TYPE_WDSNBP                    2
#define WDSBP_PK_TYPE_BCD                       4

//
// Option Types.
//

#define WDSBP_OPT_TYPE_NONE                     0
#define WDSBP_OPT_TYPE_BYTE                     1
#define WDSBP_OPT_TYPE_USHORT                   2
#define WDSBP_OPT_TYPE_ULONG                    3
#define WDSBP_OPT_TYPE_WSTR                     4
#define WDSBP_OPT_TYPE_STR                      5
#define WDSBP_OPT_TYPE_IP4                      6

//
// Boot Program Options.
//

#define WDSBP_OPT_ARCHITECTURE                  WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_USHORT,        1)
#define WDSBP_OPT_NEXT_ACTION                   WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_BYTE,          2)
#define WDSBP_OPT_POLL_INTERVAL                 WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_USHORT,        3)
#define WDSBP_OPT_POLL_RETRY_COUNT              WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_USHORT,        4)
#define WDSBP_OPT_REQUEST_ID                    WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_ULONG,         5)
#define WDSBP_OPT_MESSAGE                       WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_STR,           6)
#define WDSBP_OPT_VERSION_QUERY                 WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_NONE,          7)
#define WDSBP_OPT_SERVER_VERSION                WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_ULONG,         8)
#define WDSBP_OPT_REFERRAL_SERVER               WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_IP4,           9)
#define WDSBP_OPT_PXE_CLIENT_PROMPT             WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_BYTE,          11)
#define WDSBP_OPT_PXE_PROMPT_DONE               WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_BYTE,          12)
#define WDSBP_OPT_NBP_VER                       WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_USHORT,        13)
#define WDSBP_OPT_ACTION_DONE                   WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_BYTE,          14)
#define WDSBP_OPT_ALLOW_SERVER_SELECTION        WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_WDSNBP,     WDSBP_OPT_TYPE_BYTE,          15)
#define WDSBP_OPT_BCD_FILE_PATH                 WDSBP_MAKE_OPTION(WDSBP_PK_TYPE_BCD,        WDSBP_OPT_TYPE_STR,           252)

//
// Helper Macros.
//

#define WDSBP_IS_PK_TYPE(_Value, _Type)         (((_Value) & (_Type)) == (_Type))

//
// Values for WDSBP_OPT_NEXT_ACTION Option.
//

#define WDSBP_OPTVAL_ACTION_APPROVAL            1
#define WDSBP_OPTVAL_ACTION_REFERRAL            3
#define WDSBP_OPTVAL_ACTION_ABORT               5

//
// Values for WDSBP_OPT_PXE_CLIENT_PROMPT and WDSBP_OPT_PXE_PROMPT_DONE.
//

#define WDSBP_OPTVAL_PXE_PROMPT_OPTIN           1
#define WDSBP_OPTVAL_PXE_PROMPT_NOPROMPT        2
#define WDSBP_OPTVAL_PXE_PROMPT_OPTOUT          3

//
// Values for WDSBP_OPT_NBP_VER.
//

#define WDSBP_OPTVAL_NBP_VER_7                  0x0700

//
// APIs.
//

DWORD
WDSBPAPI
WdsBpParseInitialize(
    __in_bcount(uPacketLen) PVOID pPacket,
    __in ULONG uPacketLen,
    __out_opt PBYTE pbPacketType,
    __out HANDLE *phHandle
);

DWORD
WDSBPAPI 
WdsBpInitialize(
    __in BYTE bPacketType,
    __out HANDLE *phHandle
);    

DWORD
WDSBPAPI
WdsBpCloseHandle(
    __in HANDLE hHandle 
);

DWORD
WDSBPAPI 
WdsBpQueryOption(
    __in HANDLE hHandle,
    __in ULONG uOption,
    __in ULONG uValueLen,
    __out_bcount_part(uValueLen, *puBytes) PVOID pValue,
    __out PULONG puBytes
);

DWORD
WDSBPAPI 
WdsBpAddOption(
    __in HANDLE hHandle,
    __in ULONG uOption,
    __in ULONG uValueLen,
    __in_bcount(uValueLen) PVOID pValue 
);

DWORD 
WDSBPAPI    
WdsBpGetOptionBuffer(
    __in HANDLE hHandle,
    __in ULONG uBufferLen,
    __out_bcount_part(uBufferLen, *puBytes) PVOID pBuffer,
    __out PULONG puBytes 
);    

#ifdef __cplusplus
}
#endif

#endif


