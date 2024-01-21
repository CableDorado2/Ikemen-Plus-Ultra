/*++ BUILD Version: 0001    // Increment this if a change has global effects

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    DavClnt.h

Abstract:

    This module defines the DAV specific functions that are exposed to the user

Revision History:

--*/

#ifndef _DAV_CLNT_H_
#define _DAV_CLNT_H_

#ifdef __cplusplus
extern "C" {
#endif

#define OPAQUE_HANDLE DWORD

// Certificates or other Auth types will be sent through this structure
typedef struct _DAV_CALLBACK_AUTH_BLOB{
    PVOID  pBuffer;
    ULONG  ulSize;              // Size of AuthBlob,   
    ULONG  ulType;              // Type of Cred sent in ppBuffer. Currently the only value it supports is 1 for PCCERT_CONTEXT. 
}DAV_CALLBACK_AUTH_BLOB, *PDAV_CALLBACK_AUTH_BLOB;

// Username and password will be sent through this structure
typedef struct _DAV_CALLBACK_AUTH_UNP{
   LPWSTR pszUserName;          // UserName . Memory to be allocated by the callback
   ULONG  ulUserNameLength;     // Length in WCHAR(Doesnt include terminating NULL)
   LPWSTR pszPassword;          // Password . Memory to be allocated by the callback
   ULONG  ulPasswordLength;     // Length in WCHAR(Doesnt include terminating NULL)
}DAV_CALLBACK_AUTH_UNP, *PDAV_CALLBACK_AUTH_UNP;

typedef struct _DAV_CALLBACK_CRED{
    DAV_CALLBACK_AUTH_BLOB AuthBlob;
    DAV_CALLBACK_AUTH_UNP UNPBlob;
    BOOL  bAuthBlobValid;       // Indicates if AuthBlob contents is valid. If false UNPBlob is valid
    BOOL  bSave;                // Indicates the value of bsave flag. True indicates that the creds were written to credman false indicates that creds were not written to credman
}DAV_CALLBACK_CRED, *PDAV_CALLBACK_CRED;

#define DAV_AUTHN_SCHEME_BASIC      0x00000001
#define DAV_AUTHN_SCHEME_NTLM       0x00000002
#define DAV_AUTHN_SCHEME_PASSPORT   0x00000004
#define DAV_AUTHN_SCHEME_DIGEST     0x00000008
#define DAV_AUTHN_SCHEME_NEGOTIATE  0x00000010
#define DAV_AUTHN_SCHEME_CERT       0x00010000
#define DAV_AUTHN_SCHEME_FBA        0x00100000 

typedef enum
{
  DefaultBehavior,  // Try the default behaviour. Dont use callback
  RetryRequest,     // Retry the connection with the newly gathered creds   
  CancelRequest     // Cancel connection
} AUTHNEXTSTEP;


//  Function signature for the callback to delete the memory allocated by the creds
typedef DWORD (*PFNDAVAUTHCALLBACK_FREECRED)(__in PVOID pbuffer);

//  Function signature for the Callback that will harvest the credentials
typedef DWORD (*PFNDAVAUTHCALLBACK)(
    __in LPWSTR lpwzServerName,     // Server Name
    __in LPWSTR lpwzRemoteName,     // Remote Name
    __in DWORD  dwAuthScheme,       // Bitmap of DAV_AUTHN_SCHEME* values
    __in DWORD  dwFlags,            // The flags that was passed to NPADDConnection
    __inout PDAV_CALLBACK_CRED pCallbackCred,       // Creds collected by the callback
    __inout AUTHNEXTSTEP *NextStep,                 // Next step for DavClnt
    __out PFNDAVAUTHCALLBACK_FREECRED *pFreeCred    // Callback to free the memory allocated for creds by the callback
);

DWORD
WINAPI
DavAddConnection(
    __inout HANDLE *ConnectionHandle,
    __in LPCWSTR RemoteName,
    __in_opt LPCWSTR UserName,
    __in_opt LPCWSTR Password,
    __in_bcount(CertSize) PBYTE ClientCert,
    __in DWORD CertSize
    );

DWORD
WINAPI
DavDeleteConnection(
    __in HANDLE ConnectionHandle
    );

DWORD
WINAPI
DavGetUNCFromHTTPPath (
    __in LPCWSTR  HttpPath,
    __out_ecount(*lpSize) LPWSTR UncPath,
    IN OUT  LPDWORD lpSize
    );

DWORD
WINAPI
DavGetHTTPFromUNCPath (
    __in LPCWSTR  UncPath,
    __out_ecount(*lpSize) LPWSTR HttpPath,
    IN OUT  LPDWORD lpSize
    );

DWORD
WINAPI
DavGetTheLockOwnerOfTheFile(
    __in LPCWSTR FileName,
    __out_bcount_opt(*LockOwnerNameLengthInBytes) PWSTR LockOwnerName,
    __inout PULONG LockOwnerNameLengthInBytes
    );

DWORD
WINAPI
DavGetExtendedError(
    __in HANDLE hFile,
    __out DWORD *ExtError,
    __out_ecount(*cChSize) LPWSTR ExtErrorString,
    __inout DWORD *cChSize
    );

DWORD
WINAPI
DavFlushFile(
    __in HANDLE hFile
    );
	
DWORD
WINAPI
DavInvalidateCache(
	__in LPWSTR URLName
	);
        
DWORD
APIENTRY
DavCancelConnectionsToServer(
    __in LPWSTR lpName,
    BOOL fForce
    );

OPAQUE_HANDLE 
APIENTRY
DavRegisterAuthCallback(__in PFNDAVAUTHCALLBACK CallBack, 
                        __in ULONG Version);

VOID 
APIENTRY
DavUnregisterAuthCallback(__in OPAQUE_HANDLE hCallback);

#ifdef __cplusplus
}
#endif

#endif

