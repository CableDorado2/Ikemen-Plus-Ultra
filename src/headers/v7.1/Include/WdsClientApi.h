/*++

Copyright (c) 2006 Microsoft Corporation

Module Name:

    WdsClientApi.h

Abstract:

    WDS Client API public header file.

Environment:

    User Mode

--*/
#ifndef __WDSCLIENTAPI_H__
#define __WDSCLIENTAPI_H__

#if (_MSC_VER > 1000)
#pragma once
#endif

#define WDSCLIAPI WINAPI

#ifdef __cplusplus
extern "C"
{
#endif

//
// Structures
//


// Credentials structure.
//
typedef struct tagWDS_CLI_CRED
{
    PCWSTR pwszUserName,
           pwszDomain,
           pwszPassword;
} WDS_CLI_CRED, *PWDS_CLI_CRED, *LPWDS_CLI_CRED;


//
// General functions
//
HRESULT
WDSCLIAPI
WdsCliClose( 
    __in HANDLE Handle );


typedef 
VOID
(WDSCLIAPI *PFN_WdsCliTraceFunction)(
    __in LPCWSTR pwszFormat,
    __in va_list Params
);


HRESULT
WDSCLIAPI
WdsCliRegisterTrace(
    __in_opt PFN_WdsCliTraceFunction pfn );


HRESULT
WDSCLIAPI
WdsCliFreeStringArray(
    __inout_ecount_opt(ulCount) PWSTR *ppwszArray,
    __in ULONG ulCount );

//
// Image enumeration functions
//
HRESULT
WDSCLIAPI
WdsCliFindFirstImage(
    __in HANDLE hSession,
    __out PHANDLE phFindHandle );

HRESULT
WDSCLIAPI
WdsCliFindNextImage(
    __in HANDLE Handle );

HRESULT
WDSCLIAPI
WdsCliGetEnumerationFlags(
    __in HANDLE Handle,
    __out PDWORD pdwFlags );

HRESULT
WDSCLIAPI
WdsCliGetImageHandleFromFindHandle(
    __in HANDLE FindHandle,
    __out PHANDLE phImageHandle );

HRESULT
WDSCLIAPI
WdsCliGetImageHandleFromTransferHandle(
    __in HANDLE hTransfer,
    __out PHANDLE phImageHandle );


//
// Image enumeration constants
//

enum
{
    WdsCliFlagEnumFilterVersion = 0x0001,
    WdsCliFlagEnumFilterFirmware = 0x0002, 
};

//
// Image Type constants.
//
typedef enum _WDS_CLI_IMAGE_TYPE
{
    WDS_CLI_IMAGE_TYPE_UNKNOWN = 0,
    WDS_CLI_IMAGE_TYPE_WIM,
    WDS_CLI_IMAGE_TYPE_VHD
} WDS_CLI_IMAGE_TYPE, *PWDS_CLI_IMAGE_TYPE;

//
// Firmware Types.
//
typedef enum _WDS_CLI_FIRMWARE_TYPE 
{
    WDS_CLI_FIRMWARE_UNKNOWN = 0,
    WDS_CLI_FIRMWARE_BIOS = 0x0001,
    WDS_CLI_FIRMWARE_EFI = 0x0002,
} WDS_CLI_FIRMWARE_TYPE, *PWDS_CLI_FIRMWARE_TYPE;

//
// Extended Image Parameters.
//
typedef enum _WDS_CLI_IMAGE_PARAM_TYPE
{
    WDS_CLI_IMAGE_PARAM_UNKNOWN = 0,
    WDS_CLI_IMAGE_PARAM_SPARSE_FILE,
    WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES,
} WDS_CLI_IMAGE_PARAM_TYPE, *PWDS_CLI_IMAGE_PARAM_TYPE;

//
// Session functions
//
HRESULT
WDSCLIAPI
WdsCliCreateSession(
    __in PWSTR pwszServer,
    __in_opt PWDS_CLI_CRED pCred,
    __out PHANDLE phSession );

HRESULT
WDSCLIAPI
WdsCliAuthorizeSession(
    __inout HANDLE hSession,
    __in_opt PWDS_CLI_CRED pCred );

//
// Client -> Server Logging functions
//
HRESULT
WDSCLIAPI
WdsCliInitializeLog(
    __in HANDLE hSession, 
    __in ULONG ulClientArchitecture,
    __in PWSTR pwszClientId,
    __in PWSTR pwszClientAddress );

HRESULT
WDSCLIAPI
WdsCliLog(
    __in HANDLE hSession,
    __in ULONG ulLogLevel,
    __in ULONG ulMessageCode,
    ... );

//
// Log events sent by the client to the server.
// Each one of these has a set of variables associated with it
// that must be present in the request in order for the request to be 
// considered valid.
//
typedef enum
{
    WDS_LOG_TYPE_CLIENT_ERROR = 1,
    WDS_LOG_TYPE_CLIENT_STARTED,
    WDS_LOG_TYPE_CLIENT_FINISHED,
    WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED,    
    WDS_LOG_TYPE_CLIENT_APPLY_STARTED,
    WDS_LOG_TYPE_CLIENT_APPLY_FINISHED,
    WDS_LOG_TYPE_CLIENT_GENERIC_MESSAGE,
    WDS_LOG_TYPE_CLIENT_UNATTEND_MODE,
    WDS_LOG_TYPE_CLIENT_TRANSFER_START,
    WDS_LOG_TYPE_CLIENT_TRANSFER_END,
    WDS_LOG_TYPE_CLIENT_TRANSFER_DOWNGRADE,
    WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR,
    WDS_LOG_TYPE_CLIENT_POST_ACTIONS_START,
    WDS_LOG_TYPE_CLIENT_POST_ACTIONS_END,
    WDS_LOG_TYPE_CLIENT_APPLY_STARTED_2,
    WDS_LOG_TYPE_CLIENT_APPLY_FINISHED_2,
    WDS_LOG_TYPE_CLIENT_DOMAINJOINERROR_2,
    WDS_LOG_TYPE_CLIENT_DRIVER_PACKAGE_NOT_ACCESSIBLE,
    WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_START,
    WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_END,
    WDS_LOG_TYPE_CLIENT_OFFLINE_DRIVER_INJECTION_FAILURE,
    WDS_LOG_TYPE_CLIENT_IMAGE_SELECTED2,   // Only add entries before WDS_LOG_TYPE_CLIENT_MAX_CODE.
    WDS_LOG_TYPE_CLIENT_MAX_CODE 
};

//
// Log levels.
//
typedef enum
{
    WDS_LOG_LEVEL_DISABLED = 0,
    WDS_LOG_LEVEL_ERROR = 1,
    WDS_LOG_LEVEL_WARNING = 2,
    WDS_LOG_LEVEL_INFO = 3
};

//
// Image information functions
//

HRESULT
WDSCLIAPI
WdsCliGetImageName(
    __in HANDLE hIfh, 
    __out PWSTR *ppwszValue );

HRESULT
WDSCLIAPI
WdsCliGetImageDescription(
    __in HANDLE hIfh, 
    __out PWSTR *ppwszValue );

HRESULT 
WDSCLIAPI 
WdsCliGetImageType(
    __in HANDLE hIfh,
    __out PWDS_CLI_IMAGE_TYPE pImageType );

HRESULT
WDSCLIAPI
WdsCliGetImageFiles(
    __in HANDLE hIfh,
    __deref_out_ecount(*pdwCount) LPWSTR **pppwszFiles,
   __out PDWORD pdwCount );

HRESULT
WDSCLIAPI
WdsCliGetImageLanguage(
    __in HANDLE hIfh, 
    __out PWSTR *ppwszValue );

HRESULT
WDSCLIAPI
WdsCliGetImageLanguages(
    __in HANDLE hIfh,
    __out_ecount(*pdwNumValues) PTSTR **pppszValues,
    __out PDWORD pdwNumValues );

HRESULT
WDSCLIAPI
WdsCliGetImageVersion(
    __in HANDLE hIfh, 
    __out PWSTR *ppwszValue );

HRESULT
WDSCLIAPI
WdsCliGetImagePath(
    __in HANDLE hIfh,
    __out PWSTR *ppwszValue );

HRESULT
WDSCLIAPI
WdsCliGetImageIndex(
    __in HANDLE hIfh,
    __out PDWORD pdwValue );

HRESULT
WDSCLIAPI
WdsCliGetImageArchitecture(
    __in HANDLE hIfh,
    __out PDWORD pdwValue );

HRESULT
WDSCLIAPI
WdsCliGetImageLastModifiedTime(
    __in HANDLE hIfh,
    __out PSYSTEMTIME *ppSysTimeValue );

HRESULT
WDSCLIAPI
WdsCliGetImageSize(
    __in HANDLE hIfh,
    __out PULONGLONG pullValue );

HRESULT
WDSCLIAPI
WdsCliGetImageHalName(
    __in HANDLE hIfh,
    __out PWSTR *ppwszValue );

HRESULT
WDSCLIAPI
WdsCliGetImageGroup(
    __in HANDLE hIfh,
    __out PWSTR *ppwszValue );

HRESULT
WDSCLIAPI
WdsCliGetImageNamespace(
    __in HANDLE hIfh,
    __out PWSTR *ppwszValue );

HRESULT 
WDSCLIAPI 
WdsCliGetImageParameter(
    __in HANDLE hIfh,
    __in WDS_CLI_IMAGE_PARAM_TYPE ParamType,
    __out_bcount(uResponseLen) PVOID pResponse,
    __in ULONG uResponseLen );

//
// Image transfer functions.
//

// Callback function
//

typedef
VOID
(WDSCLIAPI *PFN_WdsCliCallback)(
    DWORD dwMessageId,
    __in_opt WPARAM wParam,
    __in_opt LPARAM lParam,
    __in_opt PVOID pvUserData );

// Callback messages.
//
typedef enum
{
    WDS_CLI_MSG_START = 0,
    WDS_CLI_MSG_COMPLETE,
    WDS_CLI_MSG_PROGRESS,
    WDS_CLI_MSG_TEXT,
};


HRESULT
WDSCLIAPI
WdsCliGetTransferSize(
    __in HANDLE hIfh,
    __out PULONGLONG pullValue );

// Flags for transfer functions
//
#define WDS_CLI_TRANSFER_ASYNCHRONOUS         0x00000001
#define WDS_CLI_NO_SPARSE_FILE                0x00000002

HRESULT
WDSCLIAPI
WdsCliTransferImage(
    __in HANDLE hImage,
    __in PWSTR pwszLocalPath,
    __in DWORD dwFlags,
    __in DWORD dwReserved,
    __in_opt PFN_WdsCliCallback pfnWdsCliCallback,
    __in_opt PVOID pvUserData,
    __out PHANDLE phTransfer );

HRESULT
WDSCLIAPI
WdsCliTransferFile(
    __in PCWSTR pwszServer,
    __in PCWSTR pwszNamespace,
    __in PCWSTR pwszRemoteFilePath,
    __in PCWSTR pwszLocalFilePath,
    __in DWORD dwFlags,
    __in DWORD dwReserved,
    __in_opt PFN_WdsCliCallback pfnWdsCliCallback,
    __in_opt PVOID pvUserData,
    __out PHANDLE phTransfer );

HRESULT
WDSCLIAPI
WdsCliCancelTransfer(
    __in HANDLE hTransfer );

HRESULT
WDSCLIAPI
WdsCliWaitForTransfer(
    __in HANDLE hTransfer );

//
// Dynamic Driver Provisioning functions
//
HRESULT
WDSCLIAPI
WdsCliObtainDriverPackages(
    __in HANDLE hImage,
    __deref_out PWSTR *ppwszServerName,
    __deref_out_ecount(*pulCount) PWSTR **pppwszDriverPackages,
    __out ULONG *pulCount    
    );


#ifdef __cplusplus
}
#endif

#endif  // __WDSCLIENTAPI_H__

