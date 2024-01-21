/*++

Copyright (c) 1998-1999 Microsoft Corporation

Module Name:

    sisbackup.h

Abstract:

    External interface for the SIS Backup dll.


Revision History:

--*/

#ifndef __SISBKUP_H__
#define __SISBKUP_H__

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef  __cplusplus
extern "C" {
#endif  // __cplusplus

BOOL __stdcall
SisCreateBackupStructure(
    __in PWCHAR                         volumeRoot,
    __out PVOID                         *sisBackupStructure,
    __out PWCHAR                        *commonStoreRootPathname,
    __out PULONG                        countOfCommonStoreFilesToBackup,
    __out PWCHAR                        **commonStoreFilesToBackup);


BOOL __stdcall
SisCSFilesToBackupForLink(
    __in PVOID                          sisBackupStructure,
    __in_bcount(reparseDataSize) PVOID  reparseData,
    __in ULONG                          reparseDataSize,
    __in_opt PVOID                      thisFileContext,
    __out_opt PVOID                     *matchingFileContext,
    __out PULONG                        countOfCommonStoreFilesToBackup,
    __out PWCHAR                        **commonStoreFilesToBackup);

BOOL __stdcall
SisFreeBackupStructure(
    __in PVOID                          sisBackupStructure);

BOOL __stdcall
SisCreateRestoreStructure(
    __in PWCHAR                         volumeRoot,
    __out PVOID                         *sisRestoreStructure,
    __out PWCHAR                        *commonStoreRootPathname,
    __out PULONG                        countOfCommonStoreFilesToRestore,
    __out PWCHAR                        **commonStoreFilesToRestore);

BOOL __stdcall
SisRestoredLink(
    __in PVOID                          sisRestoreStructure,
    __in PWCHAR                         restoredFileName,
    __in_bcount(reparseDataSize) PVOID  reparseData,
    __in ULONG                          reparseDataSize,
    __out PULONG                        countOfCommonStoreFilesToRestore,
    __out PWCHAR                        **commonStoreFilesToRestore);

BOOL __stdcall
SisRestoredCommonStoreFile(
    __in PVOID                          sisRestoreStructure,
    __in PWCHAR                         commonStoreFileName);

BOOL __stdcall
SisFreeRestoreStructure(
    __in PVOID                          sisRestoreStructure);

VOID __stdcall
SisFreeAllocatedMemory(
    __in PVOID                          allocatedSpace);


//
// SIS entry function typedefs
//
typedef BOOL ( FAR __stdcall *PF_SISCREATEBACKUPSTRUCTURE )( PWCHAR, PVOID *, PWCHAR *, PULONG, PWCHAR ** );
typedef BOOL ( FAR __stdcall *PF_SISCSFILESTOBACKUPFORLINK )  (PVOID, PVOID, ULONG, PVOID, PVOID *, PULONG, PWCHAR ** ) ;
typedef BOOL ( FAR __stdcall *PF_SISFREEBACKUPSTRUCTURE )  ( PVOID ) ;

typedef BOOL ( FAR __stdcall *PF_SISCREATERESTORESTRUCTURE)  ( PWCHAR, PVOID *, PWCHAR *, PULONG, PWCHAR ** );
typedef BOOL ( FAR __stdcall *PF_SISRESTOREDLINK )  ( PVOID, PWCHAR, PVOID, ULONG, PULONG, PWCHAR ** ) ;
typedef BOOL ( FAR __stdcall *PF_SISRESTOREDCOMMONSTORFILE) ( PVOID, PWCHAR ) ;

typedef BOOL ( FAR __stdcall *PF_SISFREERESTORESTRUCTURE )( PVOID ) ;
typedef BOOL ( FAR __stdcall *PF_SISFREEALLOCATEDMEMORY )( PVOID ) ;

#ifdef  __cplusplus
}
#endif  // __cplusplus

#endif  // __SISBKUP_H__

