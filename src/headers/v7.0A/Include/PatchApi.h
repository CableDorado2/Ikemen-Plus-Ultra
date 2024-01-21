// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//  patchapi.h
//
//  Interface for creating and applying patches to files.
//
//  Copyright (C) Microsoft, 1997-2001.
//

#ifndef _PATCHAPI_H_
#define _PATCHAPI_H_

#ifdef __cplusplus
extern "C" {
#endif

//
//  The following constants can be combined and used as the OptionFlags
//  parameter in the patch creation apis.
//

#define PATCH_OPTION_USE_BEST           0x00000000  // auto choose best (slower)

#define PATCH_OPTION_USE_LZX_BEST       0x00000003  // auto choose best of LZX A/B (but not large)
#define PATCH_OPTION_USE_LZX_A          0x00000001  // normal
#define PATCH_OPTION_USE_LZX_B          0x00000002  // better on some x86 binaries
#define PATCH_OPTION_USE_LZX_LARGE      0x00000004  // better support for large files (requires 5.1 or higher applyer)

#define PATCH_OPTION_NO_BINDFIX         0x00010000  // PE bound imports
#define PATCH_OPTION_NO_LOCKFIX         0x00020000  // PE smashed locks
#define PATCH_OPTION_NO_REBASE          0x00040000  // PE rebased image
#define PATCH_OPTION_FAIL_IF_SAME_FILE  0x00080000  // don't create if same
#define PATCH_OPTION_FAIL_IF_BIGGER     0x00100000  // fail if patch is larger than simply compressing new file (slower)
#define PATCH_OPTION_NO_CHECKSUM        0x00200000  // PE checksum zero
#define PATCH_OPTION_NO_RESTIMEFIX      0x00400000  // PE resource timestamps
#define PATCH_OPTION_NO_TIMESTAMP       0x00800000  // don't store new file timestamp in patch
#define PATCH_OPTION_SIGNATURE_MD5      0x01000000  // use MD5 instead of CRC (reserved for future support)
#define PATCH_OPTION_INTERLEAVE_FILES   0x40000000  // better support for large files (requires 5.2 or higher applyer)
#define PATCH_OPTION_RESERVED1          0x80000000  // (used internally)

#define PATCH_OPTION_VALID_FLAGS        0xC0FF0007

//
//  The following flags are used with PATCH_OPTION_DATA SymbolOptionFlags:
//

#define PATCH_SYMBOL_NO_IMAGEHLP        0x00000001  // don't use imagehlp.dll
#define PATCH_SYMBOL_NO_FAILURES        0x00000002  // don't fail patch due to imagehlp failures
#define PATCH_SYMBOL_UNDECORATED_TOO    0x00000004  // after matching decorated symbols, try to match remaining by undecorated names
#define PATCH_SYMBOL_RESERVED1          0x80000000  // (used internally)

//
//  The following flags are used with PATCH_OPTION_DATA ExtendedOptionFlags:
//

#define PATCH_TRANSFORM_PE_RESOURCE_2   0x00000100  // better handling of PE resources (requires 5.2 or higher applyer)
#define PATCH_TRANSFORM_PE_IRELOC_2     0x00000200  // better handling of PE stripped relocs (requires 5.2 or higher applyer)


//
//  The following constants can be combined and used as the ApplyOptionFlags
//  parameter in the patch apply and test apis.
//

#define APPLY_OPTION_FAIL_IF_EXACT      0x00000001  // don't copy new file
#define APPLY_OPTION_FAIL_IF_CLOSE      0x00000002  // differ by rebase, bind
#define APPLY_OPTION_TEST_ONLY          0x00000004  // don't create new file
#define APPLY_OPTION_VALID_FLAGS        0x00000007

//
//  In addition to standard Win32 error codes, the following error codes may
//  be returned via GetLastError() when one of the patch APIs fails.
//

#define ERROR_PATCH_ENCODE_FAILURE          0xC00E3101  // create
#define ERROR_PATCH_INVALID_OPTIONS         0xC00E3102  // create
#define ERROR_PATCH_SAME_FILE               0xC00E3103  // create
#define ERROR_PATCH_RETAIN_RANGES_DIFFER    0xC00E3104  // create
#define ERROR_PATCH_BIGGER_THAN_COMPRESSED  0xC00E3105  // create
#define ERROR_PATCH_IMAGEHLP_FAILURE        0xC00E3106  // create

#define ERROR_PATCH_DECODE_FAILURE          0xC00E4101  // apply
#define ERROR_PATCH_CORRUPT                 0xC00E4102  // apply
#define ERROR_PATCH_NEWER_FORMAT            0xC00E4103  // apply
#define ERROR_PATCH_WRONG_FILE              0xC00E4104  // apply
#define ERROR_PATCH_NOT_NECESSARY           0xC00E4105  // apply
#define ERROR_PATCH_NOT_AVAILABLE           0xC00E4106  // apply

typedef BOOL (CALLBACK PATCH_PROGRESS_CALLBACK)(
    PVOID CallbackContext,
    ULONG CurrentPosition,
    ULONG MaximumPosition
    );

typedef PATCH_PROGRESS_CALLBACK *PPATCH_PROGRESS_CALLBACK;

typedef BOOL (CALLBACK PATCH_SYMLOAD_CALLBACK)(
    IN ULONG  WhichFile,          // 0 for new file, 1 for first old file, etc
    IN LPCSTR SymbolFileName,
    IN ULONG  SymType,            // see SYM_TYPE in imagehlp.h
    IN ULONG  SymbolFileCheckSum,
    IN ULONG  SymbolFileTimeDate,
    IN ULONG  ImageFileCheckSum,
    IN ULONG  ImageFileTimeDate,
    IN PVOID  CallbackContext
    );

typedef PATCH_SYMLOAD_CALLBACK *PPATCH_SYMLOAD_CALLBACK;

typedef struct _PATCH_IGNORE_RANGE {
    ULONG OffsetInOldFile;
    ULONG LengthInBytes;
    } PATCH_IGNORE_RANGE, *PPATCH_IGNORE_RANGE;

typedef struct _PATCH_RETAIN_RANGE {
    ULONG OffsetInOldFile;
    ULONG LengthInBytes;
    ULONG OffsetInNewFile;
    } PATCH_RETAIN_RANGE, *PPATCH_RETAIN_RANGE;

typedef struct _PATCH_OLD_FILE_INFO_A {
    ULONG               SizeOfThisStruct;
    LPCSTR              OldFileName;
    ULONG               IgnoreRangeCount;               // maximum 255
    PPATCH_IGNORE_RANGE IgnoreRangeArray;
    ULONG               RetainRangeCount;               // maximum 255
    PPATCH_RETAIN_RANGE RetainRangeArray;
    } PATCH_OLD_FILE_INFO_A, *PPATCH_OLD_FILE_INFO_A;

typedef struct _PATCH_OLD_FILE_INFO_W {
    ULONG               SizeOfThisStruct;
    LPCWSTR             OldFileName;
    ULONG               IgnoreRangeCount;               // maximum 255
    PPATCH_IGNORE_RANGE IgnoreRangeArray;
    ULONG               RetainRangeCount;               // maximum 255
    PPATCH_RETAIN_RANGE RetainRangeArray;
    } PATCH_OLD_FILE_INFO_W, *PPATCH_OLD_FILE_INFO_W;

typedef struct _PATCH_OLD_FILE_INFO_H {
    ULONG               SizeOfThisStruct;
    HANDLE              OldFileHandle;
    ULONG               IgnoreRangeCount;               // maximum 255
    PPATCH_IGNORE_RANGE IgnoreRangeArray;
    ULONG               RetainRangeCount;               // maximum 255
    PPATCH_RETAIN_RANGE RetainRangeArray;
    } PATCH_OLD_FILE_INFO_H, *PPATCH_OLD_FILE_INFO_H;

typedef struct _PATCH_OLD_FILE_INFO {
    ULONG               SizeOfThisStruct;
    union {
        LPCSTR          OldFileNameA;
        LPCWSTR         OldFileNameW;
        HANDLE          OldFileHandle;
        };
    ULONG               IgnoreRangeCount;               // maximum 255
    PPATCH_IGNORE_RANGE IgnoreRangeArray;
    ULONG               RetainRangeCount;               // maximum 255
    PPATCH_RETAIN_RANGE RetainRangeArray;
    } PATCH_OLD_FILE_INFO, *PPATCH_OLD_FILE_INFO;

typedef struct _PATCH_INTERLEAVE_MAP {
    ULONG CountRanges;
    struct {
        ULONG OldOffset;
        ULONG OldLength;
        ULONG NewLength;    // NewOffset implied by sum of previous NewLengths
        } Range[ 1 ];       // Variable length (CountRanges)
    } PATCH_INTERLEAVE_MAP, *PPATCH_INTERLEAVE_MAP;

typedef struct _PATCH_OPTION_DATA {
    ULONG                   SizeOfThisStruct;
    ULONG                   SymbolOptionFlags;      // PATCH_SYMBOL_xxx flags
    LPCSTR                  NewFileSymbolPath;      // always ANSI, never Unicode
    LPCSTR                 *OldFileSymbolPathArray; // array[ OldFileCount ]
    ULONG                   ExtendedOptionFlags;
    PPATCH_SYMLOAD_CALLBACK SymLoadCallback;
    PVOID                   SymLoadContext;
    PPATCH_INTERLEAVE_MAP*  InterleaveMapArray;     // array[ OldFileCount ] (requires 5.2 or higher applyer)
    ULONG                   MaxLzxWindowSize;       // limit memory requirements (requires 5.2 or higher applyer)
    } PATCH_OPTION_DATA, *PPATCH_OPTION_DATA;

//
//  Note that PATCH_OPTION_DATA contains LPCSTR paths, and no LPCWSTR (Unicode)
//  path argument is available, even when used with one of the Unicode APIs
//  such as CreatePatchFileW.  This is because the underlying system services
//  for symbol file handling (IMAGEHLP.DLL) only support ANSI file/path names.
//

//
//  A note about PATCH_RETAIN_RANGE specifiers with multiple old files:
//
//  Each old version file must have the same RetainRangeCount, and the same
//  retain range LengthInBytes and OffsetInNewFile values in the same order.
//  Only the OffsetInOldFile values can differ between old files for retain
//  ranges.
//

#ifdef IMPORTING_MSPATCH_DLL
#define PATCHAPI WINAPI __declspec( dllimport )
#else
#define PATCHAPI WINAPI
#endif


//
//  The following prototypes are interface for creating patches from files.
//

BOOL
PATCHAPI
CreatePatchFileA(
    __in_opt LPCSTR OldFileName,            // input file  (optional)
    __in     LPCSTR NewFileName,            // input file  (required)
    __in     LPCSTR PatchFileName,          // output file (required)
    __in     ULONG  OptionFlags,
    __in_opt PPATCH_OPTION_DATA OptionData
    );

BOOL
PATCHAPI
CreatePatchFileW(
    __in_opt LPCWSTR OldFileName,           // input file  (optional)
    __in     LPCWSTR NewFileName,           // input file  (required)
    __in     LPCWSTR PatchFileName,         // output file (required)
    __in     ULONG   OptionFlags,
    __in_opt PPATCH_OPTION_DATA OptionData
    );

BOOL
PATCHAPI
CreatePatchFileByHandles(
    __in_opt HANDLE OldFileHandle,          // input file  (optional)
    __in     HANDLE NewFileHandle,          // input file  (required)
    __in     HANDLE PatchFileHandle,        // output file (required)
    __in     ULONG  OptionFlags,
    __in_opt PPATCH_OPTION_DATA OptionData
    );

BOOL
PATCHAPI
CreatePatchFileExA(
    __in     ULONG                    OldFileCount,     // maximum 255
    __in_ecount( OldFileCount ) PPATCH_OLD_FILE_INFO_A OldFileInfoArray,
    __in     LPCSTR                   NewFileName,      // input file
    __in     LPCSTR                   PatchFileName,    // output file
    __in     ULONG                    OptionFlags,
    __in_opt PPATCH_OPTION_DATA       OptionData,
    __in_opt PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt PVOID                    CallbackContext
    );

BOOL
PATCHAPI
CreatePatchFileExW(
    __in     ULONG                    OldFileCount,     // maximum 255
    __in_ecount( OldFileCount ) PPATCH_OLD_FILE_INFO_W OldFileInfoArray,
    __in     LPCWSTR                  NewFileName,      // input file
    __in     LPCWSTR                  PatchFileName,    // output file
    __in     ULONG                    OptionFlags,
    __in_opt PPATCH_OPTION_DATA       OptionData,
    __in_opt PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt PVOID                    CallbackContext
    );

BOOL
PATCHAPI
CreatePatchFileByHandlesEx(
    __in     ULONG                    OldFileCount,     // maximum 255
    __in_ecount( OldFileCount ) PPATCH_OLD_FILE_INFO_H OldFileInfoArray,
    __in     HANDLE                   NewFileHandle,    // input file
    __in     HANDLE                   PatchFileHandle,  // output file
    __in     ULONG                    OptionFlags,
    __in_opt PPATCH_OPTION_DATA       OptionData,
    __in_opt PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt PVOID                    CallbackContext
    );

BOOL
PATCHAPI
ExtractPatchHeaderToFileA(
    __in LPCSTR PatchFileName,          // input file
    __in LPCSTR PatchHeaderFileName     // output file
    );

BOOL
PATCHAPI
ExtractPatchHeaderToFileW(
    __in LPCWSTR PatchFileName,         // input file
    __in LPCWSTR PatchHeaderFileName    // output file
    );

BOOL
PATCHAPI
ExtractPatchHeaderToFileByHandles(
    __in HANDLE PatchFileHandle,        // input file
    __in HANDLE PatchHeaderFileHandle   // output file
    );

//
//  The following prototypes are interface for creating new file from old file
//  and patch file.  Note that it is possible for the TestApply API to succeed
//  but the actual Apply to fail since the TestApply only verifies that the
//  old file has the correct CRC without actually applying the patch.  The
//  TestApply API only requires the patch header portion of the patch file,
//  but its CRC must be corrected.
//

BOOL
PATCHAPI
TestApplyPatchToFileA(
    __in LPCSTR PatchFileName,
    __in LPCSTR OldFileName,
    __in ULONG  ApplyOptionFlags
    );

BOOL
PATCHAPI
TestApplyPatchToFileW(
    __in LPCWSTR PatchFileName,
    __in LPCWSTR OldFileName,
    __in ULONG   ApplyOptionFlags
    );

BOOL
PATCHAPI
TestApplyPatchToFileByHandles(
    __in HANDLE PatchFileHandle,      // requires GENERIC_READ access
    __in HANDLE OldFileHandle,        // requires GENERIC_READ access
    __in ULONG  ApplyOptionFlags
    );

BOOL
PATCHAPI
TestApplyPatchToFileByBuffers(
    __in_bcount( PatchFileSize )   PBYTE  PatchFileBuffer,     // not modified
    __in                           ULONG  PatchFileSize,
    __in_bcount_opt( OldFileSize ) PBYTE  OldFileBuffer,       // not modified
    __in                           ULONG  OldFileSize,
    __out_opt                      ULONG* NewFileSize,         // optional
    __in                           ULONG  ApplyOptionFlags
    );

BOOL
PATCHAPI
ApplyPatchToFileA(
    __in     LPCSTR PatchFileName,      // input file (required)
    __in_opt LPCSTR OldFileName,        // input file (optional)
    __in     LPCSTR NewFileName,        // output file (required)
    __in     ULONG  ApplyOptionFlags
    );

BOOL
PATCHAPI
ApplyPatchToFileW(
    __in     LPCWSTR PatchFileName,     // input file (required)
    __in_opt LPCWSTR OldFileName,       // input file (optional)
    __in     LPCWSTR NewFileName,       // output file (required)
    __in     ULONG   ApplyOptionFlags
    );

BOOL
PATCHAPI
ApplyPatchToFileByHandles(
    __in     HANDLE PatchFileHandle,    // input file (required)  GENERIC_READ
    __in_opt HANDLE OldFileHandle,      // input file (optional)  GENERIC_READ
    __in     HANDLE NewFileHandle,      // output file (required) GENERIC_WRITE
    __in     ULONG  ApplyOptionFlags
    );

BOOL
PATCHAPI
ApplyPatchToFileExA(
    __in     LPCSTR                   PatchFileName,    // input file (required)
    __in_opt LPCSTR                   OldFileName,      // input file (optional)
    __in     LPCSTR                   NewFileName,      // output file (required)
    __in     ULONG                    ApplyOptionFlags,
    __in_opt PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt PVOID                    CallbackContext
    );

BOOL
PATCHAPI
ApplyPatchToFileExW(
    __in     LPCWSTR                  PatchFileName,    // input file (required)
    __in_opt LPCWSTR                  OldFileName,      // input file (optional)
    __in     LPCWSTR                  NewFileName,      // output file (required)
    __in     ULONG                    ApplyOptionFlags,
    __in_opt PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt PVOID                    CallbackContext
    );

BOOL
PATCHAPI
ApplyPatchToFileByHandlesEx(
    __in     HANDLE                   PatchFileHandle,  // input file (required)
    __in_opt HANDLE                   OldFileHandle,    // input file (optional)
    __in     HANDLE                   NewFileHandle,    // output file (required)
    __in     ULONG                    ApplyOptionFlags,
    __in_opt PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt PVOID                    CallbackContext
    );

BOOL
PATCHAPI
ApplyPatchToFileByBuffers(
    __in_bcount( PatchFileSize )   PBYTE  PatchFileMapped,     // not modified
    __in                           ULONG  PatchFileSize,
    __in_bcount_opt( OldFileSize ) PBYTE  OldFileMapped,       // not modified
    __in                           ULONG  OldFileSize,
    __deref_opt_inout_bcount_part_opt( NewFileBufferSize, *NewFileActualSize )
                                   PBYTE* NewFileBuffer,       // caller-supplied or returned buffer
    __in                           ULONG  NewFileBufferSize,   // caller-supplied buffer size
    __out_opt                      ULONG* NewFileActualSize,   // actual or required size
    __out_opt                      FILETIME* NewFileTime,      // optional
    __in                           ULONG  ApplyOptionFlags,
    __in_opt                       PPATCH_PROGRESS_CALLBACK ProgressCallback,
    __in_opt                       PVOID  CallbackContext
    );

//
//  If *NewFileBuffer is NULL, and APPLY_OPTION_TEST_ONLY is not specified,
//  and the function succeeds (returns TRUE), and size of new file is non-zero,
//  *NewFileBuffer will be set to a VirtualAlloc buffer of the required size,
//  and it will be the caller's responsibility to VirtualFree this buffer.
//  NewFileBufferSize is ignored when *NewFileBuffer is NULL.
//
//  If *NewFileBuffer is non-NULL, and APPLY_OPTION_TEST_ONLY is not specified,
//  NewFileBufferSize specifies the size of caller-supplied *NewFileBuffer
//  buffer.  If required size exceeds NewFileBufferSize, function will fail
//  (return FALSE), *NewFileActualSize will be set to required size, and
//  GetLastError will return ERROR_INSUFFICIENT_BUFFER.
//
//  If ApplyOptionFlags APPLY_OPTION_TEST_ONLY is specified, NewFileBuffer
//  and NewFileBufferSize are ignored, and *NewFileActualSize will be set to
//  required buffer size.  If APPLY_OPTION_TEST_ONLY is not specified, then
//  NewFileBuffer must be non-NULL (*NewFileBuffer may be NULL).
//
//  NewFileTime is optional.  If non-NULL, the value returned will either be
//  non-zero to indicate the new file time as specified in the patch, or zero
//  to indicate that file time was not stored inside the patch.
//


//
//  The following prototypes provide a unique patch "signature" for a given
//  file.  Consider the case where you have a new foo.dll and the machines
//  to be updated with the new foo.dll may have one of three different old
//  foo.dll files.  Rather than creating a single large patch file that can
//  update any of the three older foo.dll files, three separate smaller patch
//  files can be created and identified according to the patch signature of the
//  old file.  Then the patch applyer application can determine at runtime
//  which of the three foo.dll patch files is necessary given the specific
//  foo.dll to be updated.  If patch files are being downloaded over a slow
//  network connection (internet over a modem), this signature scheme provides
//  a mechanism for choosing the correct single patch file to download at
//  application time thus decreasing total bytes necessary to download.
//

BOOL
PATCHAPI
GetFilePatchSignatureA(
    __in                                  LPCSTR FileName,
    __in                                  ULONG  OptionFlags,
    __in_opt                              PVOID  OptionData,
    __in                                  ULONG  IgnoreRangeCount,
    __in_ecount_opt( IgnoreRangeCount )   PPATCH_IGNORE_RANGE IgnoreRangeArray,
    __in                                  ULONG  RetainRangeCount,
    __in_ecount_opt( RetainRangeCount )   PPATCH_RETAIN_RANGE RetainRangeArray,
    __in                                  ULONG  SignatureBufferSize,
    __out_bcount( SignatureBufferSize )   LPSTR  SignatureBuffer
    );

BOOL
PATCHAPI
GetFilePatchSignatureW(
    __in                                  LPCWSTR FileName,
    __in                                  ULONG   OptionFlags,
    __in_opt                              PVOID   OptionData,
    __in                                  ULONG   IgnoreRangeCount,
    __in_ecount_opt( IgnoreRangeCount )   PPATCH_IGNORE_RANGE IgnoreRangeArray,
    __in                                  ULONG   RetainRangeCount,
    __in_ecount_opt( RetainRangeCount )   PPATCH_RETAIN_RANGE RetainRangeArray,
    __in                                  ULONG   SignatureBufferSize,
    __out_bcount( SignatureBufferSize )   LPWSTR  SignatureBuffer
    );

BOOL
PATCHAPI
GetFilePatchSignatureByHandle(
    __in                                  HANDLE  FileHandle,
    __in                                  ULONG   OptionFlags,
    __in_opt                              PVOID   OptionData,
    __in                                  ULONG   IgnoreRangeCount,
    __in_ecount_opt( IgnoreRangeCount )   PPATCH_IGNORE_RANGE IgnoreRangeArray,
    __in                                  ULONG   RetainRangeCount,
    __in_ecount_opt( RetainRangeCount )   PPATCH_RETAIN_RANGE RetainRangeArray,
    __in                                  ULONG   SignatureBufferSize,
    __out_bcount( SignatureBufferSize )   LPSTR   SignatureBuffer
    );

BOOL
PATCHAPI
GetFilePatchSignatureByBuffer(
    __inout_bcount( FileSize )            PBYTE   FileBufferWritable,   // modified!
    __in                                  ULONG   FileSize,
    __in                                  ULONG   OptionFlags,
    __in_opt                              PVOID   OptionData,
    __in                                  ULONG   IgnoreRangeCount,
    __in_ecount_opt( IgnoreRangeCount )   PPATCH_IGNORE_RANGE IgnoreRangeArray,
    __in                                  ULONG   RetainRangeCount,
    __in_ecount_opt( RetainRangeCount )   PPATCH_RETAIN_RANGE RetainRangeArray,
    __in                                  ULONG   SignatureBufferSize,
    __out_bcount( SignatureBufferSize )   LPSTR   SignatureBuffer
    );

//
//  As an alternative to requesting the signature, some applications might use
//  NormalizeFileForPatchSignature to render a stream that can be hashed
//  by other means than CRC or MD5 provided by the signature APIs.  This API
//  returns 0 for failure (GetLastError returns additional info), 1 to indicate
//  the buffer did not require any modifications for normalization, or 2 to
//  indicate that the buffer was modified in the process of normalization.
//

INT
WINAPI
NormalizeFileForPatchSignature(
    __inout_bcount( FileSize )          PVOID FileBuffer,       // modified!
    __in                                ULONG FileSize,
    __in                                ULONG OptionFlags,
    __in_opt                            PATCH_OPTION_DATA* OptionData,
    __in                                ULONG NewFileCoffBase,
    __in                                ULONG NewFileCoffTime,
    __in                                ULONG IgnoreRangeCount,
    __in_ecount_opt( IgnoreRangeCount ) PPATCH_IGNORE_RANGE IgnoreRangeArray,
    __in                                ULONG RetainRangeCount,
    __in_ecount_opt( RetainRangeCount ) PPATCH_RETAIN_RANGE RetainRangeArray
    );


//
//  Depending on whether UNICODE is defined, map the generic API names to the
//  appropriate Unicode or Ansi APIs.
//

#ifdef UNICODE

    #define CreatePatchFile          CreatePatchFileW
    #define CreatePatchFileEx        CreatePatchFileExW
    #define TestApplyPatchToFile     TestApplyPatchToFileW
    #define ApplyPatchToFile         ApplyPatchToFileW
    #define ApplyPatchToFileEx       ApplyPatchToFileExW
    #define ExtractPatchHeaderToFile ExtractPatchHeaderToFileW
    #define GetFilePatchSignature    GetFilePatchSignatureW

#else

    #define CreatePatchFile          CreatePatchFileA
    #define CreatePatchFileEx        CreatePatchFileExA
    #define TestApplyPatchToFile     TestApplyPatchToFileA
    #define ApplyPatchToFile         ApplyPatchToFileA
    #define ApplyPatchToFileEx       ApplyPatchToFileExA
    #define ExtractPatchHeaderToFile ExtractPatchHeaderToFileA
    #define GetFilePatchSignature    GetFilePatchSignatureA

#endif // UNICODE

#ifdef __cplusplus
}
#endif

#endif // _PATCHAPI_H_


