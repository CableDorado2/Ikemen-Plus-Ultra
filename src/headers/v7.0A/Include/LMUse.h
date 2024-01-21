/*++ BUILD Version: 0001    // Increment this if a change has global effects

Copyright (c) 1991-1999  Microsoft Corporation

Module Name:

    lmuse.c

Abstract:

    This file contains structures, function prototypes, and definitions
    for the NetUse API.


Environment:

    User Mode - Win32
    Portable to any flat, 32-bit environment.  (Uses Win32 typedefs.)
    Requires ANSI C extensions: slash-slash comments, long external names.

Notes:

    You must include NETCONS.H before this file, since this file depends
    on values defined in NETCONS.H.


--*/

#ifndef _LMUSE_
#define _LMUSE_

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

#include <lmcons.h>
#include <lmuseflg.h>                   // Deletion force level flags

//
// Function Prototypes
//

NET_API_STATUS NET_API_FUNCTION
NetUseAdd (
    __in_opt IN LMSTR  UncServerName OPTIONAL,
    IN DWORD Level,
    __inout IN LPBYTE Buf,
    __out_opt OUT LPDWORD ParmError OPTIONAL
    );

NET_API_STATUS NET_API_FUNCTION
NetUseDel (
    __in_opt IN LMSTR  UncServerName OPTIONAL,
    __in IN LMSTR  UseName,
    IN DWORD ForceCond
    );

NET_API_STATUS NET_API_FUNCTION
NetUseEnum (
    __in_opt LMSTR  UncServerName,
    __in DWORD Level,
    __out_opt LPBYTE *BufPtr,
    __in DWORD PreferedMaximumSize,
    __out_opt LPDWORD EntriesRead,
    __out LPDWORD TotalEntries,
    __inout_opt LPDWORD ResumeHandle
    );

NET_API_STATUS NET_API_FUNCTION
NetUseGetInfo (
    __in_opt IN LMSTR  UncServerName OPTIONAL,
    __in IN LMSTR  UseName,
    IN DWORD Level,
    __out_opt OUT LPBYTE *BufPtr
    );

//
//  Data Structures
//

typedef struct _USE_INFO_0 {
    LMSTR   ui0_local;
    LMSTR   ui0_remote;
}USE_INFO_0, *PUSE_INFO_0, *LPUSE_INFO_0;

typedef struct _USE_INFO_1 {
    LMSTR   ui1_local;
    LMSTR   ui1_remote;
    LMSTR   ui1_password;
    DWORD   ui1_status;
    DWORD   ui1_asg_type;
    DWORD   ui1_refcount;
    DWORD   ui1_usecount;
}USE_INFO_1, *PUSE_INFO_1, *LPUSE_INFO_1;

typedef struct _USE_INFO_2 {
    LMSTR    ui2_local;
    LMSTR    ui2_remote;
    LMSTR    ui2_password;
    DWORD    ui2_status;
    DWORD    ui2_asg_type;
    DWORD    ui2_refcount;
    DWORD    ui2_usecount;
    LMSTR    ui2_username;
    LMSTR    ui2_domainname;
}USE_INFO_2, *PUSE_INFO_2, *LPUSE_INFO_2;

typedef struct _USE_INFO_3 {
    USE_INFO_2 ui3_ui2;
    ULONG      ui3_flags;
} USE_INFO_3, *PUSE_INFO_3, *LPUSE_INFO_3;

typedef struct _USE_INFO_4 {
    USE_INFO_3 ui4_ui3;
    DWORD      ui4_auth_identity_length;
    PBYTE      ui4_auth_identity;
} USE_INFO_4, *PUSE_INFO_4, *LPUSE_INFO_4;

//
// Special Values and Constants
//

//
// One of these values indicates the parameter within an information
// structure that is invalid when ERROR_INVALID_PARAMETER is returned by
// NetUseAdd.
//

#define USE_LOCAL_PARMNUM       1
#define USE_REMOTE_PARMNUM      2
#define USE_PASSWORD_PARMNUM    3
#define USE_ASGTYPE_PARMNUM     4
#define USE_USERNAME_PARMNUM    5
#define USE_DOMAINNAME_PARMNUM  6

//
// Values appearing in the ui1_status field of use_info_1 structure.
// Note that USE_SESSLOST and USE_DISCONN are synonyms.
//

#define USE_OK                  0
#define USE_PAUSED              1
#define USE_SESSLOST            2
#define USE_DISCONN             2
#define USE_NETERR              3
#define USE_CONN                4
#define USE_RECONN              5


//
// Values of the ui1_asg_type field of use_info_1 structure
//

#define USE_WILDCARD            ( (DWORD) (-1) )
#define USE_DISKDEV             0
#define USE_SPOOLDEV            1
#define USE_CHARDEV             2
#define USE_IPC                 3

//
// Flags defined in the use_info_3 structure
//

#define CREATE_NO_CONNECT 0x1        // creation flags
#define CREATE_BYPASS_CSC 0x2        // force connection to server, bypassing CSC
                                     //  all ops on this connection go to the server,
                                     //  never to the cache
#define CREATE_CRED_RESET 0x4	     // Create a connection with credentials passed in 
				     //  this netuse if none exist. If connection already 
				     //  exists then update credentials after issuing remote
				     //  tree connection. This is needed as CSC cannot verify 
				     //  credentials while offline.

#define USE_DEFAULT_CREDENTIALS 0x4  // No explicit credentials passed to NetUseAdd

#ifdef __cplusplus
}
#endif

#endif // _LMUSE_

