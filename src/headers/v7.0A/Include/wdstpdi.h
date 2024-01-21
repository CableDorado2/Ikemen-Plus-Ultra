/*++

Copyright (c) 2006 Microsoft Corporation

Module Name:

    wdstpdi.h

Abstract:

    This module defines the structures and functions that compose the interface
    that content providers must expose to the multicast server.
 
Environment:

    User Mode

--*/

#ifndef _WDSTPDI_H
#define _WDSTPDI_H

#ifdef __cplusplus
extern "C"
{
#endif

#define WDSTRANSPORTPROVIDERAPI        __stdcall 
#define WDSMCSAPI                      __stdcall 

//---Defines-----------------------------------------------------

#define MC_SERVER_CURRENT_VERSION 1
#define TRANSPORTPROVIDER_CURRENT_VERSION 1

#define TRANSPORT_INVALID_HANDLE (HANDLE)-1

typedef enum _TRANSPORTPROVIDER_CALLBACK_ID
{
    WDS_TRANSPORTPROVIDER_CREATE_INSTANCE = 0,
    WDS_TRANSPORTPROVIDER_COMPARE_CONTENT,
    WDS_TRANSPORTPROVIDER_OPEN_CONTENT,
    WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK,
    WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE,
    WDS_TRANSPORTPROVIDER_READ_CONTENT,
    WDS_TRANSPORTPROVIDER_CLOSE_CONTENT,
    WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE,
    WDS_TRANSPORTPROVIDER_SHUTDOWN,
    WDS_TRANSPORTPROVIDER_DUMP_STATE,
    WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS,
    WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA,

    WDS_TRANSPORTPROVIDER_MAX_CALLBACKS,
} TRANSPORTPROVIDER_CALLBACK_ID, *PTRANSPORTPROVIDER_CALLBACK_ID;

typedef ULONG WDS_MC_SEVERITY;

#define WDS_MC_TRACE_VERBOSE           0x00010000
#define WDS_MC_TRACE_INFO              0x00020000
#define WDS_MC_TRACE_WARNING           0x00040000
#define WDS_MC_TRACE_ERROR             0x00080000
#define WDS_MC_TRACE_FATAL             0x00100000

//---Structs-----------------------------------------------------

typedef struct _WDS_TRANSPORTPROVIDER_INIT_PARAMS
{
    //
    // The length of this structure.
    //

    ULONG ulLength;

    //
    // The multicast server's version.
    //

    ULONG ulMcServerVersion;
    
    //
    // An open handle to the registry key where this provider should
    // store and retrieve its settings.
    //
    
    HKEY hRegistryKey;

    //
    // A handle that the provider can use to uniquely identify
    // itself in calls to the multicast server.
    //

    HANDLE hProvider;
} WDS_TRANSPORTPROVIDER_INIT_PARAMS, *PWDS_TRANSPORTPROVIDER_INIT_PARAMS;

typedef struct _WDS_TRANSPORTPROVIDER_SETTINGS
{
    //
    // The length of this structure.
    //

    ULONG ulLength;

    //
    // The version of the api that this provider implements.
    //

    ULONG ulProviderVersion;
} WDS_TRANSPORTPROVIDER_SETTINGS, *PWDS_TRANSPORTPROVIDER_SETTINGS;

//---Functions the provider must implement (required callbacks)---

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderInitialize(
    __in PWDS_TRANSPORTPROVIDER_INIT_PARAMS pInParameters,
    __out_bcount(ulLength) PWDS_TRANSPORTPROVIDER_SETTINGS pSettings,
    __in ULONG ulLength
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderCreateInstance(
    __in PCWSTR pwszConfigString,
    __out PHANDLE phInstance
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderCompareContent(
    __in HANDLE hInstance,
    __in PCWSTR pwszContentName,
    __in HANDLE hContent,
    __out PBOOL pbContentMatches
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderOpenContent(
    __in HANDLE hInstance,
    __in PCWSTR pwszContentName,
    __out PHANDLE phContent
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderGetContentMetadata(
    __in HANDLE hContent,
    __out_bcount(*pulLength) PVOID* pvData,
    __out PULONG pulLength
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderUserAccessCheck(
    __in HANDLE hContent,
    __in HANDLE hUserToken,
    __out PBOOL pbAccessAllowed
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderGetContentSize(
    __in HANDLE hContent,
    __out PULARGE_INTEGER pContentSize
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderReadContent(
    __in HANDLE hContent,
    __in_bcount(ulBytesToRead) PVOID pBuffer,
    __in ULONG ulBytesToRead,
    __in PULARGE_INTEGER pContentOffset,
    __in PVOID pvUserData
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderCloseContent(
    __in HANDLE hContent
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderCloseInstance(
    __in HANDLE hInstance
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderShutdown(
);

//---Functions the provider may implement (optional callbacks)-------

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderDumpState(
);

HRESULT
WDSTRANSPORTPROVIDERAPI
WdsTransportProviderRefreshSettings(
);

//---Functions provided by the multicast server----------------------

HRESULT
WDSMCSAPI
WdsTransportServerRegisterCallback(
    __in HANDLE hProvider,
    __in TRANSPORTPROVIDER_CALLBACK_ID CallbackId,
    __in PVOID pfnCallback
);

HRESULT
WDSMCSAPI
WdsTransportServerCompleteRead(
    __in HANDLE hProvider,
    __in ULONG ulBytesRead,
    __in PVOID pvUserData,
    __in HRESULT hReadResult
);

HRESULT
WDSMCSAPI
WdsTransportServerTrace(
    __in HANDLE hProvider,
    __in WDS_MC_SEVERITY Severity,
    __in LPCWSTR pwszFormat,
    ...
);

HRESULT
WDSMCSAPI
WdsTransportServerTraceV(
    __in HANDLE hProvider,
    __in WDS_MC_SEVERITY Severity,
    __in LPCWSTR pwszFormat,
    __in va_list Params
);

PVOID
WDSMCSAPI
WdsTransportServerAllocateBuffer(
    __in HANDLE hProvider,
    __in ULONG ulBufferSize
);

HRESULT
WDSMCSAPI
WdsTransportServerFreeBuffer(
    __in HANDLE hProvider,
    __in PVOID pvBuffer
);

#ifdef __cplusplus
}
#endif

#endif


