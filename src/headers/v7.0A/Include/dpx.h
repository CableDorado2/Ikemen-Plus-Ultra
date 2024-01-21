// Copyright Microsoft Corporation.  All rights reserved.

#pragma once

#include <dpx1.h>

//
//  DpxNewJob and DpxRestoreJob require a TargetPath which is the local file
//  system directory under which extracted files should be created.  If the
//  directory does not exist, DpxNewJob or DpxRestoreJob will fail.  Files
//  created under TargetPath directory may include relative subdirectory names
//  or even stream names.  Files and subdirectories will be created with
//  inherited ACL from TargetPath and owner from the thread calling
//  IDpxJob::ProvideRequestedData.  During the course of extraction, additional
//  temporary files might be created in the TargetPath directory but will be
//  deleted when the job completes.  If the job is cancelled or destroyed
//  before completing, these temporary files may not be automatically deleted.
//  To move partially completed extraction job to different TargetPath, caller
//  may Suspend and SaveJobState, then tree-copy entire existing TargetPath
//  contents to new location, create a new IDpxJob instance, then DpxRestoreJob
//  using the new TargetPath location.
//

EXTERN_C HRESULT WINAPI DpxNewJob( __in LPCWSTR TargetPath, __deref_out IDpxJob ** ppJob );

EXTERN_C HRESULT WINAPI DpxRestoreJob( __in LPCWSTR TargetPath, __deref_out IDpxJob ** ppJob );

EXTERN_C VOID    WINAPI DpxFreeMemory( __in void* Allocation );


