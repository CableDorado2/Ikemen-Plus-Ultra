/*++

Copyright (c) 2005 Microsoft Corporation

Module Name:

    wdstci.h

Abstract:

    This module defines the structures and functions that compose the interface
    between the content receiver and the transport client.
 
Environment:

    User Mode

--*/

#ifndef _WDSTCI_H
#define _WDSTCI_H

#include <windows.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define WDSTCIAPI                      __stdcall 

//----------------------------------------------------------------- Defines.

#define WDS_TRANSPORTCLIENT_CURRENT_API_VERSION 1

//
// Protocol types
//

#define WDS_TRANSPORTCLIENT_PROTOCOL_MULTICAST       0x00000001

//
// Authentication levels
//

#define WDS_TRANSPORTCLIENT_AUTH    0x1
#define WDS_TRANSPORTCLIENT_NO_AUTH 0x2

typedef enum _TRANSPORTCLIENT_CALLBACK_ID
{
    WDS_TRANSPORTCLIENT_SESSION_START = 0,
    WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS,
    WDS_TRANSPORTCLIENT_SESSION_COMPLETE,
    WDS_TRANSPORTCLIENT_RECEIVE_METADATA,
    WDS_TRANSPORTCLIENT_SESSION_STARTEX,

    WDS_TRANSPORTCLIENT_MAX_CALLBACKS,
} TRANSPORTCLIENT_CALLBACK_ID, *PTRANSPORTCLIENT_CALLBACK_ID;

typedef struct _TRANSPORTCLIENT_SESSION_INFO
{
    //
    // The length of this structure in bytes.
    //
    
    ULONG ulStructureLength;

    //
    // The size of the file, in bytes.
    //

    ULARGE_INTEGER ullFileSize;

    //
    // The size of a receive block, in bytes.
    //

    ULONG ulBlockSize;
    
} TRANSPORTCLIENT_SESSION_INFO, *PTRANSPORTCLIENT_SESSION_INFO;

#define WDS_TRANSPORTCLIENT_NO_CACHE                0

//
// Download status. 
//
#define WDS_TRANSPORTCLIENT_STATUS_IN_PROGRESS      0x0001
#define WDS_TRANSPORTCLIENT_STATUS_SUCCESS          0x0002
#define WDS_TRANSPORTCLIENT_STATUS_FAILURE          0x0003

//----------------------------------------------------------------- Callbacks.



typedef
VOID
(CALLBACK *PFN_WdsTransportClientSessionStart)(
    __in HANDLE hSessionKey,
    __in PVOID pCallerData,
    __in PULARGE_INTEGER FileSize
);

typedef
VOID
(CALLBACK *PFN_WdsTransportClientSessionStartEx)(
    __in HANDLE hSessionKey,
    __in PVOID pCallerData,
    __in PTRANSPORTCLIENT_SESSION_INFO Info
);

typedef
VOID
(CALLBACK *PFN_WdsTransportClientReceiveMetadata)(
    __in HANDLE hSessionKey,
    __in PVOID pCallerData,
    __in_bcount(ulSize) PVOID pMetadata,
    __in ULONG ulSize
);

typedef
VOID
(CALLBACK *PFN_WdsTransportClientReceiveContents)(
    __in HANDLE hSessionKey,
    __in PVOID pCallerData,    
    __in_bcount(ulSize) PVOID pContents,
    __in ULONG ulSize,
    __in PULARGE_INTEGER pContentOffset
);

typedef
VOID
(CALLBACK *PFN_WdsTransportClientSessionComplete)(
    __in HANDLE hSessionKey,
    __in PVOID pCallerData,    
    __in DWORD dwError
);

//----------------------------------------------------------------- Structures.

typedef struct _WDS_TRANSPORTCLIENT_REQUEST 
{
    //
    // The length of this structure.
    //
    ULONG ulLength;

    //
    // The version of the api that the caller is built against.  Callers should
    // always set this field to WDS_TRANSPORT_CLIENT_CURRENT_API_VERSION.
    //
    ULONG ulApiVersion;

    //
    // The level of authentication to send to the server.
    //
    ULONG ulAuthLevel;

    //
    // Server name. 
    //
    LPCWSTR pwszServer;

    //
    // Namespace of the object to retrieve.
    //
    LPCWSTR pwszNamespace;

    //
    // Specifies the name of the object to retrieve.  Object names are
    // provider dependant.
    //
    LPCWSTR pwszObjectName;

    //
    // Specifies how much data in bytes the consumer can store in its queue.  Once
    // this threshold is reached, the client will not send any more writes to
    // the consumer until some memory is released with 
    // WdsTransportClientCompleteWrite.
    //
    ULONG ulCacheSize;

    //
    // Specifies the protocol to be used for this transfer.
    //
    ULONG ulProtocol;

    //
    // Protocol specific information.
    //
    PVOID pvProtocolData;

    //
    // The length of the protocol data pointed to by pvProtocolData.
    //
    ULONG ulProtocolDataLength;
} WDS_TRANSPORTCLIENT_REQUEST, *PWDS_TRANSPORTCLIENT_REQUEST;

//----------------------------------------------------------------- Functions.

DWORD 
WDSTCIAPI
WdsTransportClientInitialize(
);

DWORD 
WDSTCIAPI
WdsTransportClientInitializeSession(
    __in PWDS_TRANSPORTCLIENT_REQUEST pSessionRequest,
    __in PVOID pCallerData,
    __out PHANDLE hSessionKey
);

DWORD 
WDSTCIAPI
WdsTransportClientRegisterCallback(
    __in HANDLE hSessionKey,
    __in TRANSPORTCLIENT_CALLBACK_ID CallbackId,
    __in PVOID pfnCallback
);

DWORD 
WDSTCIAPI
WdsTransportClientStartSession(
    __in HANDLE hSessionKey
);

DWORD
WDSTCIAPI
WdsTransportClientCompleteReceive(
    __in HANDLE hSessionKey,
    __in ULONG ulSize,
    __in PULARGE_INTEGER pullOffset
);

DWORD 
WDSTCIAPI
WdsTransportClientCancelSession(
    __in HANDLE hSessionKey
);

DWORD
WDSTCIAPI 
WdsTransportClientCancelSessionEx(
    __in HANDLE hSessionKey,
    __in DWORD dwErrorCode 
);    

DWORD
WDSTCIAPI 
WdsTransportClientWaitForCompletion(
    __in HANDLE hSessionKey,
    __in ULONG uTimeout 
);

DWORD
WDSTCIAPI
WdsTransportClientQueryStatus(
    __in HANDLE hSessionKey,
    __out PULONG puStatus,
    __out PULONG puErrorCode 
);    

DWORD
WDSTCIAPI
WdsTransportClientCloseSession(
    __in HANDLE hSessionKey
);

DWORD
WDSTCIAPI
WdsTransportClientAddRefBuffer(
    __in PVOID pvBuffer
);

DWORD
WDSTCIAPI
WdsTransportClientReleaseBuffer(
    __in PVOID pvBuffer
);

DWORD 
WDSTCIAPI
WdsTransportClientShutdown(
);

#ifdef __cplusplus
}
#endif

#endif

