/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    npapi.h

Abstract:

    Network Provider API prototypes and manifests.  A network provider
    is a client of the Win32 WNet APIs.  See the "NT/Win32 Network
    Provider API Specification" document for further details.

Environment:

    User Mode -Win32

--*/

#ifndef _NPAPI_INCLUDED
#define _NPAPI_INCLUDED

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

//
//  CONNECTIONS
//

DWORD APIENTRY
NPAddConnection (
    __in     LPNETRESOURCEW lpNetResource,
    __in_opt LPWSTR         lpPassword,
    __in_opt LPWSTR         lpUserName
    );

typedef DWORD (APIENTRY *PF_NPAddConnection) (
    __in     LPNETRESOURCEW lpNetResource,
    __in_opt LPWSTR         lpPassword,
    __in_opt LPWSTR         lpUserName
    );


DWORD APIENTRY
NPAddConnection3 (
    __in_opt HWND           hwndOwner,
    __in     LPNETRESOURCEW lpNetResource,
    __in_opt LPWSTR         lpPassword,
    __in_opt LPWSTR         lpUserName,
    __in     DWORD          dwFlags
    );

typedef DWORD (APIENTRY *PF_NPAddConnection3) (
    __in_opt HWND           hwndOwner,
    __in     LPNETRESOURCEW lpNetResource,
    __in_opt LPWSTR         lpPassword,
    __in_opt LPWSTR         lpUserName,
    __in     DWORD          dwFlags
    );


DWORD APIENTRY
NPCancelConnection (
    __in LPWSTR  lpName,
    __in BOOL    fForce
    );

typedef DWORD (APIENTRY *PF_NPCancelConnection) (
    __in LPWSTR  lpName,
    __in BOOL    fForce
    );


DWORD APIENTRY
NPGetConnection (
    __in LPWSTR     lpLocalName,
    __out_ecount_opt(*lpnBufferLen) LPWSTR lpRemoteName,
    __inout LPDWORD lpnBufferLen
    );

typedef DWORD (APIENTRY *PF_NPGetConnection) (
    __in LPWSTR   lpLocalName,
    __out_ecount_opt(*lpnBufferLen) LPWSTR lpRemoteName,
    __inout LPDWORD lpnBufferLen
    );


#define WNGETCON_CONNECTED      0x00000000
#define WNGETCON_DISCONNECTED   0x00000001

DWORD APIENTRY
NPGetConnection3 (
    __in LPCWSTR    lpLocalName,
    __in DWORD      dwLevel,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize
    );

typedef DWORD (APIENTRY *PF_NPGetConnection3) (
    __in LPCWSTR    lpLocalName,
    __in DWORD      dwLevel,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize
    );


DWORD APIENTRY
NPGetUniversalName (
    __in LPCWSTR    lpLocalPath,
    __in DWORD      dwInfoLevel,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize
    );

typedef DWORD (APIENTRY *PF_NPGetUniversalName) (
    __in LPCWSTR    lpLocalPath,
    __in DWORD      dwInfoLevel,
    __out_bcount(*lpnBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpnBufferSize
    );

DWORD APIENTRY
NPGetConnectionPerformance (
    __in  LPCWSTR                lpRemoteName,
    __out LPNETCONNECTINFOSTRUCT lpNetConnectInfo
    );

typedef DWORD (APIENTRY *PF_NPGetConnectionPerformance) (
    __in  LPCWSTR                lpRemoteName,
    __out LPNETCONNECTINFOSTRUCT lpNetConnectInfo
    );


DWORD APIENTRY
NPOpenEnum (
    __in     DWORD          dwScope,
    __in     DWORD          dwType,
    __in     DWORD          dwUsage,
    __in_opt LPNETRESOURCEW lpNetResource,
    __out    LPHANDLE       lphEnum
    );

typedef DWORD (APIENTRY *PF_NPOpenEnum) (
    __in     DWORD          dwScope,
    __in     DWORD          dwType,
    __in     DWORD          dwUsage,
    __in_opt LPNETRESOURCEW lpNetResource,
    __out    LPHANDLE       lphEnum
    );

DWORD APIENTRY
NPEnumResource (
    __in    HANDLE  hEnum,
    __inout LPDWORD lpcCount,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize
    );

typedef DWORD (APIENTRY *PF_NPEnumResource) (
    __in    HANDLE  hEnum,
    __inout LPDWORD lpcCount,
    __out_bcount(*lpbufferSize) LPVOID  lpBuffer,
    __inout LPDWORD lpBufferSize
    );

DWORD APIENTRY
NPCloseEnum (
    __in HANDLE   hEnum
    );

typedef DWORD (APIENTRY *PF_NPCloseEnum) (
    __in HANDLE   hEnum
    );


//
//  CAPABILITIES
//

#define WNNC_SPEC_VERSION                0x00000001
#define WNNC_SPEC_VERSION51              0x00050001

#define WNNC_NET_TYPE                    0x00000002
#define WNNC_NET_NONE                    0x00000000

#define WNNC_DRIVER_VERSION              0x00000003

#define WNNC_USER                        0x00000004
#define WNNC_USR_GETUSER                 0x00000001

#define WNNC_CONNECTION                  0x00000006
#define WNNC_CON_ADDCONNECTION           0x00000001
#define WNNC_CON_CANCELCONNECTION        0x00000002
#define WNNC_CON_GETCONNECTIONS          0x00000004
#define WNNC_CON_ADDCONNECTION3          0x00000008
#define WNNC_CON_GETPERFORMANCE          0x00000040
#define WNNC_CON_DEFER                   0x00000080

#define WNNC_DIALOG                      0x00000008
#define WNNC_DLG_DEVICEMODE              0x00000001
#define WNNC_DLG_PROPERTYDIALOG          0x00000020
#define WNNC_DLG_SEARCHDIALOG            0x00000040
#define WNNC_DLG_FORMATNETWORKNAME       0x00000080
#define WNNC_DLG_PERMISSIONEDITOR        0x00000100
#define WNNC_DLG_GETRESOURCEPARENT       0x00000200
#define WNNC_DLG_GETRESOURCEINFORMATION  0x00000800

#define WNNC_ADMIN                       0x00000009
#define WNNC_ADM_GETDIRECTORYTYPE        0x00000001
#define WNNC_ADM_DIRECTORYNOTIFY         0x00000002

#define WNNC_ENUMERATION                 0x0000000B
#define WNNC_ENUM_GLOBAL                 0x00000001
#define WNNC_ENUM_LOCAL                  0x00000002
#define WNNC_ENUM_CONTEXT                0x00000004
#define WNNC_ENUM_SHAREABLE              0x00000008

#define WNNC_START                       0x0000000C
#define WNNC_WAIT_FOR_START              0x00000001

#define WNNC_CONNECTION_FLAGS            0x0000000D
#define WNNC_CF_DEFAULT ( CONNECT_TEMPORARY | CONNECT_INTERACTIVE | CONNECT_PROMPT )
#define WNNC_CF_MAXIMUM (WNNC_CF_DEFAULT | CONNECT_DEFERRED | CONNECT_COMMANDLINE | CONNECT_CMD_SAVECRED | CONNECT_CRED_RESET)



DWORD APIENTRY
NPGetCaps (
    __in DWORD ndex
    );

typedef DWORD (APIENTRY *PF_NPGetCaps) (
    __in DWORD ndex
    );

//
//  OTHER
//

DWORD APIENTRY
NPGetUser (
    __in    LPWSTR  lpName,
    __out_ecount(*lpnBufferLen) LPWSTR lpUserName,
    __inout LPDWORD lpnBufferLen
    );

typedef DWORD (APIENTRY *PF_NPGetUser) (
    __in    LPWSTR  lpName,
    __out_ecount(*lpnBufferLen) LPWSTR lpUserName,
    __inout LPDWORD lpnBufferLen
    );

#define WNTYPE_DRIVE    1
#define WNTYPE_FILE     2
#define WNTYPE_PRINTER  3
#define WNTYPE_COMM     4

#define WNPS_FILE       0
#define WNPS_DIR        1
#define WNPS_MULT       2

DWORD APIENTRY
NPDeviceMode(
    __in HWND hParent
    );

typedef DWORD (APIENTRY *PF_NPDeviceMode) (
    __in HWND hParent
    );

// flag for search dialog
#define WNSRCH_REFRESH_FIRST_LEVEL 0x00000001

DWORD APIENTRY
NPSearchDialog(
    __in     HWND   hwndParent,
    __in_opt LPNETRESOURCEW lpNetResource,
    __out_ecount(cbBuffer) LPVOID lpBuffer,
    __in     DWORD   cbBuffer,
    __out    LPDWORD lpnFlags
    );

typedef DWORD (APIENTRY *PF_NPSearchDialog) (
    __in     HWND   hwndParent,
    __in_opt LPNETRESOURCEW lpNetResource,
    __out_ecount(cbBuffer) LPVOID lpBuffer,
    __in     DWORD   cbBuffer,
    __out    LPDWORD lpnFlags
    );

DWORD APIENTRY
NPGetResourceParent(
    __in LPNETRESOURCEW lpNetResource,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize
    );

typedef DWORD (APIENTRY *PF_NPGetResourceParent) (
    __in LPNETRESOURCEW lpNetResource,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize
    );

DWORD APIENTRY NPGetResourceInformation(
    __in LPNETRESOURCEW lpNetResource,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize,
    __deref_out LPWSTR *lplpSystem
    );

typedef DWORD (APIENTRY *PF_NPGetResourceInformation) (
    __in LPNETRESOURCEW lpNetResource,
    __out_bcount(*lpBufferSize) LPVOID lpBuffer,
    __inout LPDWORD lpBufferSize,
    __deref_out LPWSTR *lplpSystem
    );

DWORD APIENTRY
NPFormatNetworkName(
    __in    LPWSTR   lpRemoteName,
    __out_ecount(*lpnLength) LPWSTR lpFormattedName,
    __inout LPDWORD  lpnLength,
    __in    DWORD    dwFlags,
    __in    DWORD    dwAveCharPerLine
    );

typedef DWORD (APIENTRY *PF_NPFormatNetworkName) (
    __in    LPWSTR   lpRemoteName,
    __out_ecount(*lpnLength) LPWSTR lpFormattedName,
    __inout LPDWORD  lpnLength,
    __in    DWORD    dwFlags,
    __in    DWORD    dwAveCharPerLine
    );

DWORD APIENTRY
NPGetPropertyText(
    __in DWORD  iButton,
    __in DWORD  nPropSel,
    __in LPWSTR lpName,
    __out_ecount(nButtonNameLen) LPWSTR lpButtonName,
    __in DWORD  nButtonNameLen,
    __in DWORD  nType
    );

typedef DWORD (APIENTRY *PF_NPGetPropertyText) (
    __in DWORD  iButton,
    __in DWORD  nPropSel,
    __in LPWSTR lpName,
    __out_ecount(nButtonNameLen) LPWSTR lpButtonName,
    __in DWORD  nButtonNameLen,
    __in DWORD  nType
    );

DWORD APIENTRY
NPPropertyDialog(
    __in HWND   hwndParent,
    __in DWORD  iButtonDlg,
    __in DWORD  nPropSel,
    __in LPWSTR lpFileName,
    __in DWORD  nType
    );

typedef DWORD (APIENTRY *PF_NPPropertyDialog) (
    __in HWND   hwndParent,
    __in DWORD  iButtonDlg,
    __in DWORD  nPropSel,
    __in LPWSTR lpFileName,
    __in DWORD  nType
    );


//
//  ADMIN
//

#define WNDT_NORMAL   0
#define WNDT_NETWORK  1

#define WNDN_MKDIR    1
#define WNDN_RMDIR    2
#define WNDN_MVDIR    3

DWORD APIENTRY
NPGetDirectoryType (
    __in LPWSTR  lpName,
    __in LPINT   lpType,
    __in BOOL    bFlushCache
    );

typedef DWORD (APIENTRY *PF_NPGetDirectoryType) (
    __in LPWSTR  lpName,
    __in LPINT   lpType,
    __in BOOL    bFlushCache
    );

DWORD APIENTRY
NPDirectoryNotify (
    __in HWND    hwnd,
    __in LPWSTR  lpDir,
    __in DWORD   dwOper
    );

typedef DWORD (APIENTRY *PF_NPDirectoryNotify) (
    __in HWND    hwnd,
    __in LPWSTR  lpDir,
    __in DWORD   dwOper
    );

VOID
WNetSetLastErrorA(
    __in DWORD   err,
    __in LPSTR   lpError,
    __in LPSTR   lpProviders
    );

VOID
WNetSetLastErrorW(
    __in DWORD   err,
    __in LPWSTR  lpError,
    __in LPWSTR  lpProviders
    );

#ifdef UNICODE
#define WNetSetLastError   WNetSetLastErrorW
#else
#define WNetSetLastError   WNetSetLastErrorA
#endif  // UNICODE

//
//  CREDENTIAL MANAGEMENT and other classes of providers
//


// Define the Net/Authentication and othr Provider Classes
#define WN_NETWORK_CLASS            0x00000001
#define WN_CREDENTIAL_CLASS         0x00000002
#define WN_PRIMARY_AUTHENT_CLASS    0x00000004
#define WN_SERVICE_CLASS            0x00000008

#define WN_VALID_LOGON_ACCOUNT      0x00000001
#define WN_NT_PASSWORD_CHANGED      0x00000002

DWORD APIENTRY
NPLogonNotify (
    __in     PLUID               lpLogonId,
    __in     LPCWSTR             lpAuthentInfoType,
    __in     LPVOID              lpAuthentInfo,
    __in_opt LPCWSTR             lpPreviousAuthentInfoType,
    __in_opt LPVOID              lpPreviousAuthentInfo,
    __in     LPWSTR              lpStationName,
    __in_opt LPVOID              StationHandle,
    __out    LPWSTR              *lpLogonScript
    );

typedef DWORD (APIENTRY *PF_NPLogonNotify) (
    __in     PLUID               lpLogonId,
    __in     LPCWSTR             lpAuthentInfoType,
    __in     LPVOID              lpAuthentInfo,
    __in_opt LPCWSTR             lpPreviousAuthentInfoType,
    __in_opt LPVOID              lpPreviousAuthentInfo,
    __in     LPWSTR              lpStationName,
    __in_opt LPVOID              StationHandle,
    __out    LPWSTR              *lpLogonScript
    );

DWORD APIENTRY
NPPasswordChangeNotify (
    __in     LPCWSTR             lpAuthentInfoType,
    __in     LPVOID              lpAuthentInfo,
    __in     LPCWSTR             lpPreviousAuthentInfoType,
    __in     LPVOID              lpPreviousAuthentInfo,
    __in     LPWSTR              lpStationName,
    __in_opt LPVOID              StationHandle,
    __in     DWORD               dwChangeInfo
    );

typedef DWORD (APIENTRY *PF_NPPasswordChangeNotify) (
    __in     LPCWSTR             lpAuthentInfoType,
    __in     LPVOID              lpAuthentInfo,
    __in     LPCWSTR             lpPreviousAuthentInfoType,
    __in     LPVOID              lpPreviousAuthentInfo,
    __in     LPWSTR              lpStationName,
    __in_opt LPVOID              StationHandle,
    __in     DWORD               dwChangeInfo
    );

//
//  CONNECTION NOTIFICATION
//

//
// NotifyStatus
//
#define NOTIFY_PRE      0x00000001
#define NOTIFY_POST     0x00000002

typedef struct _NOTIFYINFO {
    DWORD       dwNotifyStatus;
    DWORD       dwOperationStatus;
    LPVOID      lpContext;
} NOTIFYINFO, *LPNOTIFYINFO;

typedef struct _NOTIFYADD {
    HWND            hwndOwner;
    NETRESOURCE     NetResource;
    DWORD           dwAddFlags;
} NOTIFYADD, *LPNOTIFYADD;

typedef struct _NOTIFYCANCEL {
    LPWSTR      lpName;
    LPWSTR      lpProvider;
    DWORD       dwFlags;
    BOOL        fForce;
} NOTIFYCANCEL, *LPNOTIFYCANCEL;


DWORD APIENTRY
AddConnectNotify (
    __inout LPNOTIFYINFO lpNotifyInfo,
    __in    LPNOTIFYADD  lpAddInfo
    );

typedef DWORD (APIENTRY *PF_AddConnectNotify) (
    __inout LPNOTIFYINFO lpNotifyInfo,
    __in    LPNOTIFYADD  lpAddInfo
    );

DWORD APIENTRY
CancelConnectNotify (
    __inout LPNOTIFYINFO   lpNotifyInfo,
    __in    LPNOTIFYCANCEL lpCancelInfo
    );

typedef DWORD (APIENTRY *PF_CancelConnectNotify) (
    __inout LPNOTIFYINFO   lpNotifyInfo,
    __in    LPNOTIFYCANCEL lpCancelInfo
    );

//
// Permission editor dialogs
//

//
// Capabilities bits of permission editor dialogs
//
#define WNPERMC_PERM  0x00000001
#define WNPERMC_AUDIT 0x00000002
#define WNPERMC_OWNER 0x00000004

DWORD APIENTRY
NPFMXGetPermCaps (
    __in LPWSTR lpDriveName
    );

typedef DWORD (APIENTRY *PF_NPFMXGetPermCaps) (
    __in LPWSTR lpDriveName
    );

//
// Type of security dialog
//
#define WNPERM_DLG_PERM   0
#define WNPERM_DLG_AUDIT  1
#define WNPERM_DLG_OWNER  2

DWORD APIENTRY
NPFMXEditPerm (
    __in LPWSTR lpDriveName,
    __in HWND   hwndFMX,
    __in DWORD  nDialogType
    );

typedef DWORD (APIENTRY *PF_NPFMXEditPerm) (
    __in LPWSTR lpDriveName,
    __in HWND   hwndFMX,
    __in DWORD  nDialogType
    );

DWORD APIENTRY
NPFMXGetPermHelp (
    __in    LPWSTR  lpDriveName,
    __in    DWORD   nDialogType,
    __in    BOOL    fDirectory,
    __out_ecount(*lpBufferSize) LPVOID lpFileNameBuffer,
    __inout LPDWORD lpBufferSize,
    __out   LPDWORD lpnHelpContext
    );

typedef DWORD (APIENTRY *PF_NPFMXGetPermHelp) (
    __in    LPWSTR  lpDriveName,
    __in    DWORD   nDialogType,
    __in    BOOL    fDirectory,
    __out_ecount(*lpBufferSize) LPVOID lpFileNameBuffer,
    __inout LPDWORD lpBufferSize,
    __out   LPDWORD lpnHelpContext
    );

#ifdef __cplusplus
}
#endif

#endif  // _NPAPI_INCLUDED

