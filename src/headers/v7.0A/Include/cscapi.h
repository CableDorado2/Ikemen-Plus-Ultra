/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    cscapi.h

Abstract:

    Public Win32 API functions for Offline Files (Client Side Caching - CSC).

    These functions complement the COM-based interfaces and methods declared
    in cscobj.h.  

--*/
#ifndef _INC_CSCAPI_H
#define _INC_CSCAPI_H

#if _MSC_VER > 1000
#pragma once
#endif


#include <specstrings.h>

//
// Enable or disable the Offline Files feature.  
// If *pbRebootRequired returns TRUE, a system restart is necessary to 
// complete the operation.
//
STDAPI_(DWORD)
OfflineFilesEnable(
    __in BOOL bEnable, 
    __out BOOL *pbRebootRequired
    );

//
// Query the active/inactive and enabled/disabled state of the Offline Files feature.
//
//  - active/inactive describes the current running state.
//
//  - enabled/disabled describes the configured state as last successfully set by 
//    OfflineFilesEnable().
//
STDAPI_(DWORD)
OfflineFilesQueryStatus(
    __out_opt BOOL *pbActive,
    __out_opt BOOL *pbEnabled
    );


#endif // _INC_CSCAPI_H

