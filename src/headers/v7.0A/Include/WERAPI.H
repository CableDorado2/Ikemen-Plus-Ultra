/*++

Copyright (c) 1989-2001  Microsoft Corporation

Module Name:

    werapi.h

Abstract:

    This file contains the function prototypes for Windows Error Reporting (WER)

Notes:
    
--*/

#pragma once

#include <specstrings.h>

#ifdef __cplusplus
extern "C" {
#endif

//////////////////////// Defines //////////////////////////////////////////////

typedef HANDLE HREPORT;

//
// Do not add heap dumps for reports for the process
//
#define WER_FAULT_REPORTING_FLAG_NOHEAP     1

//
// Queue critical reports for this process
//
#define WER_FAULT_REPORTING_FLAG_QUEUE      2

//
// Do not suspend the process before error reporting
//
#define WER_FAULT_REPORTING_FLAG_DISABLE_THREAD_SUSPENSION   4

//
// Queue critical reports for this process and upload from the queue
//
#define WER_FAULT_REPORTING_FLAG_QUEUE_UPLOAD      8

//
// Fault reporting UI should always be shown. This is only applicable for interactive processes
//
#define WER_FAULT_REPORTING_ALWAYS_SHOW_UI          16

// 
// Maximum length of the report event name
//
#define WER_MAX_EVENT_NAME_LENGTH 64

//
// Maximum length of the name of a signature element
//
#define WER_MAX_SIGNATURE_NAME_LENGTH 128

//
// This is the maximum length of any created URL
//
#define WER_MAX_TOTAL_PARAM_LENGTH      1720

//
// This is the maximum length of any parameter including the NULL character
//
#define WER_MAX_PARAM_LENGTH            (MAX_PATH)

//
// Number of extra modules that we can select to get extra data in the minidump
// 
#define WER_MAX_PREFERRED_MODULES           128
#define WER_MAX_PREFERRED_MODULES_BUFFER    256

//
// Maximum number of parameters for a report
//
#define WER_MAX_PARAM_COUNT 10

//
// The maximum size of memory block that can be registered
//
#define WER_MAX_MEM_BLOCK_SIZE (64 * 1024)

//
// Event Type constant for application crashes
//
#define APPCRASH_EVENT          L"APPCRASH"

// Indexes for the parameter ids
#define WER_P0  0
#define WER_P1  1
#define WER_P2  2
#define WER_P3  3
#define WER_P4  4
#define WER_P5  5
#define WER_P6  6
#define WER_P7  7
#define WER_P8  8
#define WER_P9  9

//
// Custom error HRESULTS
//
//  This error occurs if we are adding some parameter and this will cause the URL string to
//  exceed the maximum length

#define WER_ERROR_START (0xff00)

#define WER_E_INSUFFICIENT_BUFFER           (HRESULT_FROM_WIN32(ERROR_INSUFFICIENT_BUFFER))
#define WER_E_NOT_FOUND                     (HRESULT_FROM_WIN32(ERROR_NOT_FOUND))

#define WER_E_LENGTH_EXCEEDED               (HRESULT_FROM_WIN32(ERROR_PARAMETER_QUOTA_EXCEEDED))
//
// The API was called when it should not have been called. E.g trying to report the same
// event twice when the first reportign is still going on
#define WER_E_INVALID_STATE                 (HRESULT_FROM_WIN32(ERROR_INVALID_STATE))

// The store was disabled
#define WER_E_STORE_DISABLED                MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WINDOWS, WER_ERROR_START + 3)

//
// There were some params that were missing, i.e the coniditon index A < B < C and parameter at B is null
// but parameters at A and C are not
#define WER_E_MISSING_PARAM                 MAKE_HRESULT(SEVERITY_ERROR, FACILITY_WINDOWS, WER_ERROR_START + 5)

///////////////////////////////////////////////////////////////////////////////

//
// The enum that describes the indexes of the customizable UI strings
// 
typedef enum _WER_REPORT_UI
{
    WerUIAdditionalDataDlgHeader = 1,
    WerUIIconFilePath = 2,
    WerUIConsentDlgHeader = 3,
    WerUIConsentDlgBody = 4,
    WerUIOnlineSolutionCheckText = 5,
    WerUIOfflineSolutionCheckText = 6,
    WerUICloseText = 7,
    WerUICloseDlgHeader = 8,
    WerUICloseDlgBody = 9,
    WerUICloseDlgButtonText = 10,
    WerUICustomActionButtonText = 11,
    WerUIMax
} WER_REPORT_UI;

//
// The type of the registered files
//
typedef enum _WER_REGISTER_FILE_TYPE
{   
    WerRegFileTypeUserDocument = 1,
    WerRegFileTypeOther = 2,
    WerRegFileTypeMax
} WER_REGISTER_FILE_TYPE;

//
// The type of files that can be added to the report
// 
typedef enum _WER_FILE_TYPE
{   
    WerFileTypeMicrodump = 1,
    WerFileTypeMinidump = 2,
    WerFileTypeHeapdump = 3,
    WerFileTypeUserDocument = 4,
    WerFileTypeOther = 5,
    WerFileTypeMax
} WER_FILE_TYPE;

typedef enum _WER_SUBMIT_RESULT
{
    WerReportQueued = 1,
    WerReportUploaded = 2,
    WerReportDebug = 3,
    WerReportFailed = 4,
    WerDisabled = 5,
    WerReportCancelled = 6,
    WerDisabledQueue = 7,
    WerReportAsync = 8,
    WerCustomAction = 9
} WER_SUBMIT_RESULT, *PWER_SUBMIT_RESULT;

//
// The type of the report
//
typedef enum _WER_REPORT_TYPE
{   
    WerReportNonCritical = 0,
    WerReportCritical = 1,
    WerReportApplicationCrash = 2,
    WerReportApplicationHang = 3,
    WerReportKernel = 4,
    WerReportInvalid
} WER_REPORT_TYPE;

//
// Flags that can be specified when adding a file to the report. 
//
// NOTE: These should always occupy the lower 16 bits of the file flag dword. 
// The upper 16 bits are reserved for internal use and get cleared by WerAddFile.
//
#define WER_FILE_DELETE_WHEN_DONE       1  // Delete the file once WER is done
#define WER_FILE_ANONYMOUS_DATA         2  // This file does not contain any PII

//
// Report submission flags. 
//                     
#define WER_SUBMIT_HONOR_RECOVERY               1       // show recovery option
#define WER_SUBMIT_HONOR_RESTART                2       // show application restart option
#define WER_SUBMIT_QUEUE                        4       // report directly to queue
#define WER_SUBMIT_SHOW_DEBUG                   8       // show the debug button
#define WER_SUBMIT_ADD_REGISTERED_DATA          16      // Add registered data to the WER report 
#define WER_SUBMIT_OUTOFPROCESS                 32      // Force the report to go out of process
#define WER_SUBMIT_NO_CLOSE_UI                  64      // Do not show the close dialog for the critical report
#define WER_SUBMIT_NO_QUEUE                     128     // Do not queue the report
#define WER_SUBMIT_NO_ARCHIVE                   256     // Do not archive the report
#define WER_SUBMIT_START_MINIMIZED              512     // The initial reporting UI is minimized and will flash
#define WER_SUBMIT_OUTOFPROCESS_ASYNC           1024    // Force the report to go out of process and do not wait for it to finish
#define WER_SUBMIT_BYPASS_DATA_THROTTLING       2048    // Bypass data throttling for the report
#define WER_SUBMIT_ARCHIVE_PARAMETERS_ONLY      4096    // Archive only the parameters; the cab is discarded
#define WER_SUBMIT_REPORT_MACHINE_ID            8192    // Always send the machine ID, regardless of the consent the report was submitted with

typedef struct _WER_REPORT_INFORMATION
{
    DWORD dwSize;
    HANDLE hProcess;
    WCHAR wzConsentKey[64];
    WCHAR wzFriendlyEventName[128];
    WCHAR wzApplicationName[128];
    WCHAR wzApplicationPath[MAX_PATH];
    WCHAR wzDescription[512];
    HWND hwndParent;    

} WER_REPORT_INFORMATION, *PWER_REPORT_INFORMATION;

typedef struct _WER_DUMP_CUSTOM_OPTIONS 
{
    DWORD dwSize;   
    DWORD dwMask;
    DWORD dwDumpFlags;
    BOOL  bOnlyThisThread;
    DWORD dwExceptionThreadFlags;
    DWORD dwOtherThreadFlags;
    DWORD dwExceptionThreadExFlags;
    DWORD dwOtherThreadExFlags;
    DWORD dwPreferredModuleFlags;
    DWORD dwOtherModuleFlags;
    WCHAR wzPreferredModuleList[WER_MAX_PREFERRED_MODULES_BUFFER];
    
} WER_DUMP_CUSTOM_OPTIONS, *PWER_DUMP_CUSTOM_OPTIONS;

typedef struct _WER_EXCEPTION_INFORMATION
{   
    PEXCEPTION_POINTERS pExceptionPointers;
    BOOL bClientPointers;
} WER_EXCEPTION_INFORMATION, *PWER_EXCEPTION_INFORMATION;

typedef enum _WER_CONSENT
{
    WerConsentNotAsked = 1,
    WerConsentApproved = 2,
    WerConsentDenied = 3,
    WerConsentAlwaysPrompt = 4,
    WerConsentMax
}WER_CONSENT;

__control_entrypoint(DllExport)
HRESULT
WINAPI
WerReportCreate(
    __in PCWSTR pwzEventType, 
    __in WER_REPORT_TYPE repType,
    __in_opt PWER_REPORT_INFORMATION pReportInformation,
    __out HREPORT *phReportHandle
    );
    
__control_entrypoint(DllExport)
HRESULT
WINAPI
WerReportSetParameter(
    __in HREPORT hReportHandle, 
    __in DWORD dwparamID, 
    __in_opt PCWSTR pwzName,
    __in PCWSTR pwzValue
    );
    
__control_entrypoint(DllExport)
HRESULT
WINAPI
WerReportAddFile(
    __in HREPORT hReportHandle, 
    __in PCWSTR pwzPath, 
    __in WER_FILE_TYPE repFileType,
    __in DWORD  dwFileFlags
    );

__control_entrypoint(DllExport)
HRESULT  
WINAPI
WerReportSetUIOption(
    __in HREPORT hReportHandle, 
    __in WER_REPORT_UI repUITypeID, 
    __in PCWSTR pwzValue
    );

__control_entrypoint(DllExport)
HRESULT 
WINAPI
WerReportSubmit(
    __in HREPORT hReportHandle,
    __in WER_CONSENT consent,
    __in DWORD  dwFlags,
    __out_opt PWER_SUBMIT_RESULT pSubmitResult
    );

//
// Masks to be used for customizing the dump
//
#define WER_DUMP_MASK_START 1
#define WER_DUMP_MASK_DUMPTYPE               (WER_DUMP_MASK_START << 0)
#define WER_DUMP_MASK_ONLY_THISTHREAD        (WER_DUMP_MASK_START << 1)
#define WER_DUMP_MASK_THREADFLAGS            (WER_DUMP_MASK_START << 2)
#define WER_DUMP_MASK_THREADFLAGS_EX         (WER_DUMP_MASK_START << 3)
#define WER_DUMP_MASK_OTHERTHREADFLAGS       (WER_DUMP_MASK_START << 4)
#define WER_DUMP_MASK_OTHERTHREADFLAGS_EX    (WER_DUMP_MASK_START << 5)
#define WER_DUMP_MASK_PREFERRED_MODULESFLAGS (WER_DUMP_MASK_START << 6)
#define WER_DUMP_MASK_OTHER_MODULESFLAGS     (WER_DUMP_MASK_START << 7)
#define WER_DUMP_MASK_PREFERRED_MODULE_LIST  (WER_DUMP_MASK_START << 8)

//
// WER dump flags
//
#define  WER_DUMP_NOHEAP_ONQUEUE    1

typedef enum _WER_DUMP_TYPE
{
    WerDumpTypeMicroDump = 1,
    WerDumpTypeMiniDump = 2,
    WerDumpTypeHeapDump = 3,
    WerDumpTypeMax = 4
} WER_DUMP_TYPE;

__control_entrypoint(DllExport)
HRESULT  
WINAPI
WerReportAddDump(
    __in HREPORT hReportHandle, 
    __in HANDLE  hProcess,
    __in_opt HANDLE hThread,
    __in WER_DUMP_TYPE dumpType,
    __in_opt  PWER_EXCEPTION_INFORMATION pExceptionParam,
    __in_opt PWER_DUMP_CUSTOM_OPTIONS pDumpCustomOptions,
    __in DWORD dwFlags
    );

__control_entrypoint(DllExport)
HRESULT 
WINAPI
WerReportCloseHandle(
    __in HREPORT hReportHandle
    );
    

//
// ++++++++++++++++++++++++++ Registration APIs ++++++++++++++++++++++++++++++++++++++
//

#define WER_MAX_REGISTERED_ENTRIES 512

HRESULT 
WINAPI
WerRegisterFile(
    __in PCWSTR pwzFile, 
    __in WER_REGISTER_FILE_TYPE regFileType,
    __in DWORD dwFlags
    );

HRESULT 
WINAPI
WerUnregisterFile(
    __in PCWSTR pwzFilePath
    );

HRESULT
WINAPI
WerRegisterMemoryBlock(
    __in PVOID pvAddress,
    __in DWORD dwSize
    );

HRESULT 
WINAPI
WerUnregisterMemoryBlock(
    __in PVOID pvAddress
    );
    
HRESULT
WINAPI
WerSetFlags(
    __in DWORD dwFlags
    );
    
HRESULT
WINAPI
WerGetFlags(
    __in HANDLE hProcess,
    __out PDWORD pdwFlags
    );

//
// ++++++++++++++++++++++++++ Application Setup APIs ++++++++++++++++++++++++++++++++++++++
// 
HRESULT
WINAPI
WerAddExcludedApplication(
    __in PCWSTR pwzExeName,
    __in BOOL bAllUsers
    );
    
HRESULT
WINAPI
WerRemoveExcludedApplication(
    __in PCWSTR pwzExeName,
    __in BOOL bAllUsers
    );

//
// ++++++++++++++++++++++++++ Run time handler APIs +++++++++++++++++++++++++++
// 

#define WER_MAX_REGISTERED_RUNTIME_EXCEPTION_MODULES 16

HRESULT
WINAPI
WerRegisterRuntimeExceptionModule(
    __in PCWSTR pwszOutOfProcessCallbackDll,
    __in PVOID pContext
    );

HRESULT
WINAPI
WerUnregisterRuntimeExceptionModule(
    __in PCWSTR pwszOutOfProcessCallbackDll,
    __in PVOID pContext
    );

#define WER_RUNTIME_EXCEPTION_EVENT_FUNCTION                "OutOfProcessExceptionEventCallback"
#define WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE_FUNCTION      "OutOfProcessExceptionEventSignatureCallback"
#define WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH               "OutOfProcessExceptionEventDebuggerLaunchCallback"

typedef struct _WER_RUNTIME_EXCEPTION_INFORMATION
{
    DWORD dwSize;
    HANDLE hProcess;
    HANDLE hThread;
    EXCEPTION_RECORD exceptionRecord;
    CONTEXT context;
    PCWSTR pwszReportId;
} WER_RUNTIME_EXCEPTION_INFORMATION, *PWER_RUNTIME_EXCEPTION_INFORMATION;

typedef
HRESULT
(* PFN_WER_RUNTIME_EXCEPTION_EVENT)(       
    __in PVOID pContext,
    __in const PWER_RUNTIME_EXCEPTION_INFORMATION pExceptionInformation,
    __out BOOL * pbOwnershipClaimed,
    __out_ecount(*pchSize) PWSTR pwszEventName,
    __inout PDWORD  pchSize,
    __out PDWORD  pdwSignatureCount
    );

typedef
HRESULT
(* PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE)(       
    __in PVOID pContext,
    __in const PWER_RUNTIME_EXCEPTION_INFORMATION pExceptionInformation,
    __in DWORD dwIndex,
    __out_ecount(*pchName) PWSTR pwszName,
    __inout PDWORD  pchName,
    __out_ecount(*pchValue) PWSTR pwszValue,
    __inout PDWORD  pchValue
    );

typedef
HRESULT
(* PFN_WER_RUNTIME_EXCEPTION_DEBUGGER_LAUNCH)(       
    __in PVOID pContext,
    __in const PWER_RUNTIME_EXCEPTION_INFORMATION pExceptionInformation,
    __out PBOOL pbIsCustomDebugger,
    __out_ecount(*pchName) PWSTR pwszDebuggerLaunch,
    __inout PDWORD  pchDebuggerLaunch,
    __out PBOOL pbIsDebuggerAutolaunch
    );
   
#ifdef __cplusplus
}                  
#endif             
