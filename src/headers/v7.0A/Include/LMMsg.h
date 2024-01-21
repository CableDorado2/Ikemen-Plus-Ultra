/*++ BUILD Version: 0001    // Increment this if a change has global effects

Copyright (c) 1991-1999  Microsoft Corporation

Module Name:

    lmmsg.h

Abstract:

    This file contains structures, function prototypes, and definitions
    for the NetMessage API.

[Environment:]

    User Mode - Win32

[Notes:]

    You must include NETCONS.H before this file, since this file depends
    on values defined in NETCONS.H.

--*/

#ifndef _LMMSG_
#define _LMMSG_

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

//
// Function Prototypes
//

NET_API_STATUS NET_API_FUNCTION
NetMessageNameAdd (
    __in_opt  LPCWSTR  servername,
    __in      LPCWSTR  msgname
    );

NET_API_STATUS NET_API_FUNCTION
NetMessageNameEnum (
    __in_opt  LPCWSTR  servername,
    __in      DWORD    level,
    __in      LPBYTE  *bufptr,
    __in      DWORD    prefmaxlen,
    __out     LPDWORD  entriesread,
    __out     LPDWORD  totalentries,
    __out     LPDWORD  resume_handle
    );

NET_API_STATUS NET_API_FUNCTION
NetMessageNameGetInfo (
    __in_opt  LPCWSTR  servername,
    __in      LPCWSTR  msgname,
    __in      DWORD    level,
    __in      LPBYTE  *bufptr
    );

NET_API_STATUS NET_API_FUNCTION
NetMessageNameDel (
    __in_opt  LPCWSTR  servername,
    __in      LPCWSTR  msgname
    );

NET_API_STATUS NET_API_FUNCTION
NetMessageBufferSend (
    __in_opt  LPCWSTR servername,
    __in      LPCWSTR msgname,
    __in      LPCWSTR fromname,
    __in      LPBYTE  buf,
    __in      DWORD   buflen
    );

//
//  Data Structures
//

typedef struct _MSG_INFO_0 {
    LPWSTR  msgi0_name;
}MSG_INFO_0, *PMSG_INFO_0, *LPMSG_INFO_0;

typedef struct _MSG_INFO_1 {
    LPWSTR  msgi1_name;
    DWORD   msgi1_forward_flag;
    LPWSTR  msgi1_forward;
}MSG_INFO_1, *PMSG_INFO_1, *LPMSG_INFO_1;

//
// Special Values and Constants
//

//
// Values for msgi1_forward_flag.
//

#define MSGNAME_NOT_FORWARDED   0       // Name not forwarded
#define MSGNAME_FORWARDED_TO    0x04    // Name forward to remote station
#define MSGNAME_FORWARDED_FROM  0x10    // Name forwarded from remote station

#ifdef __cplusplus
}
#endif

#endif //_LMMSG_

