/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    cscsearchapiif.hxx

Abstract:

    Public Interface definition for Offline Files Search Assistance.

--*/

#ifndef _INC_CSCSEARCHAPIIF_HXX
#define _INC_CSCSEARCHAPIIF_HXX

#pragma once


class CCscSearchApiInterface
{
public:

    //
    // Memory Management
    //

    virtual
    LONG
    AddRef(
        ) = 0;

    virtual
    LONG
    DelRef(
        ) = 0;

    //
    // CSC Search API Methods
    //

    virtual
    DWORD
    OfflineFilesOpenIndexingHandle(
        __out PHANDLE Handle,
        __in PCWSTR FileName,
        __in DWORD DesiredAccess,
        __in DWORD ShareMode,
        __in_opt PBOOL IsDirectoryOrFile
        ) = 0;

};


#define _CSC_SEARCHAPI_INTERFACE_VERSION 0x1
#define _CSC_SEARCHAPI_INTERFACE_COOKIE  0x8fb92809

#define CSC_SEARCHAPI_INTERFACE_VERSION ( ((_CSC_SEARCHAPI_INTERFACE_VERSION) << 16) | (sizeof(CCscSearchApiInterface)) )
#define CSC_SEARCHAPI_INTERFACE_COOKIE (_CSC_SEARCHAPI_INTERFACE_COOKIE)

typedef
NTSTATUS
(*PFUNC_CSC_SEARCHAPI_GET_INTERFACE)(
    __in ULONG Version,
    __in ULONG Cookie,
    __out CCscSearchApiInterface** Interface
    );

extern "C"
NTSTATUS
CscSearchApiGetInterface(
    __in ULONG Version,
    __in ULONG Cookie,
    __out CCscSearchApiInterface** Interface
    );

#endif // _INC_CSCSEARCHAPIIF_HXX

