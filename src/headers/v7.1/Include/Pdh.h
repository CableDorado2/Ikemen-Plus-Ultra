/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    PDH.H

Abstract:

    Header file for the Performance Data Helper (PDH) DLL functions.

--*/
#ifndef _PDH_H_
#define _PDH_H_

#if _MSC_VER > 1000
#pragma once
#endif

#if _MSC_VER >= 1200
#pragma warning(push)
#endif
#pragma warning ( disable : 4201)

// system include files required for datatype and constant definitions
#include <windows.h>    // necessary for data types used in this file
#include <winperf.h>    // necessary for the Detail Level definitions

#ifdef __cplusplus
extern "C" {
#endif

typedef LONG            PDH_STATUS;

#define PDH_FUNCTION    PDH_STATUS __stdcall

// version info
#define PDH_CVERSION_WIN40  ((DWORD)(0x0400))
#define PDH_CVERSION_WIN50  ((DWORD)(0x0500))
// v1.1 revision of PDH -- basic log functions
// v1.2 of the PDH -- adds variable instance counters
// v1.3 of the PDH -- adds log service control & stubs for NT5/PDH v2 fn's
// v2.0 of the PDH -- is the NT v 5.0 B2 version
#define PDH_VERSION         ((DWORD)((PDH_CVERSION_WIN50) + 0x0003))

// define severity masks
#define IsSuccessSeverity(ErrorCode)       ((((DWORD)(ErrorCode) & (0xC0000000L)) == 0x00000000L) ? TRUE : FALSE)
#define IsInformationalSeverity(ErrorCode) ((((DWORD)(ErrorCode) & (0xC0000000L)) == 0x40000000L) ? TRUE : FALSE)
#define IsWarningSeverity(ErrorCode)       ((((DWORD)(ErrorCode) & (0xC0000000L)) == 0x80000000L) ? TRUE : FALSE)
#define IsErrorSeverity(ErrorCode)         ((((DWORD)(ErrorCode) & (0xC0000000L)) == 0xC0000000L) ? TRUE : FALSE)

#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
#define MAX_COUNTER_PATH       256  // Maximum counter path length. This is an obsolute constance.

#if (_WIN32_WINDOWS >= 0x0502 || _WIN32_WINNT >= 0x0502 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WIN2003))
#define PDH_MAX_COUNTER_NAME    1024  // Maximum counter name length.
#define PDH_MAX_INSTANCE_NAME   1024  // Maximum counter instance name length.
#define PDH_MAX_COUNTER_PATH    2048  // Maximum full counter path length.
#define PDH_MAX_DATASOURCE_PATH 1024  // MAximum full counter log name length.
#endif

#define PDH_OBJECT_HAS_INSTANCES    ((DWORD) 0x00000001)
#endif

// data type definitions

typedef HANDLE       PDH_HCOUNTER;
typedef HANDLE       PDH_HQUERY;
typedef HANDLE       PDH_HLOG;

typedef PDH_HCOUNTER HCOUNTER;
typedef PDH_HQUERY   HQUERY;
#ifndef _LMHLOGDEFINED_
typedef PDH_HLOG     HLOG;
#endif

#ifdef INVALID_HANDLE_VALUE
#undef INVALID_HANDLE_VALUE
#define INVALID_HANDLE_VALUE  ((HANDLE)((LONG_PTR)-1))
#endif

#define H_REALTIME_DATASOURCE NULL
#define H_WBEM_DATASOURCE     INVALID_HANDLE_VALUE

typedef struct _PDH_RAW_COUNTER {
    volatile DWORD CStatus;
    FILETIME    TimeStamp;
    LONGLONG    FirstValue;
    LONGLONG    SecondValue;
    DWORD       MultiCount;
} PDH_RAW_COUNTER, * PPDH_RAW_COUNTER;

typedef struct _PDH_RAW_COUNTER_ITEM_A {
    LPSTR           szName;
    PDH_RAW_COUNTER RawValue;
} PDH_RAW_COUNTER_ITEM_A, * PPDH_RAW_COUNTER_ITEM_A;

typedef struct _PDH_RAW_COUNTER_ITEM_W {
    LPWSTR          szName;
    PDH_RAW_COUNTER RawValue;
} PDH_RAW_COUNTER_ITEM_W, * PPDH_RAW_COUNTER_ITEM_W;

typedef struct _PDH_FMT_COUNTERVALUE {
    DWORD    CStatus;
    union {
        LONG        longValue;
        double      doubleValue;
        LONGLONG    largeValue;
        LPCSTR      AnsiStringValue;
        LPCWSTR     WideStringValue;
    };
} PDH_FMT_COUNTERVALUE, * PPDH_FMT_COUNTERVALUE;

typedef struct _PDH_FMT_COUNTERVALUE_ITEM_A {
    LPSTR                   szName;
    PDH_FMT_COUNTERVALUE    FmtValue;
} PDH_FMT_COUNTERVALUE_ITEM_A, * PPDH_FMT_COUNTERVALUE_ITEM_A;

typedef struct _PDH_FMT_COUNTERVALUE_ITEM_W {
    LPWSTR                  szName;
    PDH_FMT_COUNTERVALUE    FmtValue;
} PDH_FMT_COUNTERVALUE_ITEM_W, * PPDH_FMT_COUNTERVALUE_ITEM_W;

typedef struct _PDH_STATISTICS {
    DWORD                   dwFormat;
    DWORD                   count;
    PDH_FMT_COUNTERVALUE    min;
    PDH_FMT_COUNTERVALUE    max;
    PDH_FMT_COUNTERVALUE    mean;
} PDH_STATISTICS, * PPDH_STATISTICS;

typedef struct _PDH_COUNTER_PATH_ELEMENTS_A {
    LPSTR   szMachineName;
    LPSTR   szObjectName;
    LPSTR   szInstanceName;
    LPSTR   szParentInstance;
    DWORD   dwInstanceIndex;
    LPSTR   szCounterName;
} PDH_COUNTER_PATH_ELEMENTS_A, * PPDH_COUNTER_PATH_ELEMENTS_A;

typedef struct _PDH_COUNTER_PATH_ELEMENTS_W {
    LPWSTR  szMachineName;
    LPWSTR  szObjectName;
    LPWSTR  szInstanceName;
    LPWSTR  szParentInstance;
    DWORD   dwInstanceIndex;
    LPWSTR  szCounterName;
} PDH_COUNTER_PATH_ELEMENTS_W, * PPDH_COUNTER_PATH_ELEMENTS_W;

typedef struct _PDH_DATA_ITEM_PATH_ELEMENTS_A {
    LPSTR   szMachineName;
    GUID    ObjectGUID;
    DWORD   dwItemId;
    LPSTR   szInstanceName;
} PDH_DATA_ITEM_PATH_ELEMENTS_A, * PPDH_DATA_ITEM_PATH_ELEMENTS_A;

typedef struct _PDH_DATA_ITEM_PATH_ELEMENTS_W {
    LPWSTR  szMachineName;
    GUID    ObjectGUID;
    DWORD   dwItemId;
    LPWSTR  szInstanceName;
} PDH_DATA_ITEM_PATH_ELEMENTS_W, * PPDH_DATA_ITEM_PATH_ELEMENTS_W;

typedef struct _PDH_COUNTER_INFO_A {
    DWORD   dwLength;
    DWORD   dwType;
    DWORD   CVersion;
    DWORD   CStatus;
    LONG    lScale;
    LONG    lDefaultScale;
    DWORD_PTR   dwUserData;
    DWORD_PTR   dwQueryUserData;
    LPSTR   szFullPath;
    union   {
        PDH_DATA_ITEM_PATH_ELEMENTS_A DataItemPath;
        PDH_COUNTER_PATH_ELEMENTS_A CounterPath;
        struct {
            LPSTR   szMachineName;
            LPSTR   szObjectName;
            LPSTR   szInstanceName;
            LPSTR   szParentInstance;
            DWORD   dwInstanceIndex;
            LPSTR   szCounterName;
        };
    };
    LPSTR   szExplainText;
    DWORD   DataBuffer[1];
} PDH_COUNTER_INFO_A, * PPDH_COUNTER_INFO_A;

typedef struct _PDH_COUNTER_INFO_W {
    DWORD   dwLength;
    DWORD   dwType;
    DWORD   CVersion;
    DWORD   CStatus;
    LONG    lScale;
    LONG    lDefaultScale;
    DWORD_PTR   dwUserData;
    DWORD_PTR   dwQueryUserData;
    LPWSTR  szFullPath;
    union   {
        PDH_DATA_ITEM_PATH_ELEMENTS_W DataItemPath;
        PDH_COUNTER_PATH_ELEMENTS_W CounterPath;
        struct {
            LPWSTR   szMachineName;
            LPWSTR   szObjectName;
            LPWSTR   szInstanceName;
            LPWSTR   szParentInstance;
            DWORD    dwInstanceIndex;
            LPWSTR   szCounterName;
        };
    };
    LPWSTR  szExplainText;
    DWORD   DataBuffer[1];
} PDH_COUNTER_INFO_W, * PPDH_COUNTER_INFO_W;

typedef struct _PDH_TIME_INFO {
    LONGLONG    StartTime;
    LONGLONG    EndTime;
    DWORD       SampleCount;
} PDH_TIME_INFO, * PPDH_TIME_INFO;

typedef struct _PDH_RAW_LOG_RECORD {
    DWORD       dwStructureSize;
    DWORD       dwRecordType;
    DWORD       dwItems;
    UCHAR       RawBytes[1];
} PDH_RAW_LOG_RECORD, * PPDH_RAW_LOG_RECORD;

typedef struct _PDH_LOG_SERVICE_QUERY_INFO_A {
    DWORD   dwSize;
    DWORD   dwFlags;
    DWORD   dwLogQuota;
    LPSTR   szLogFileCaption;
    LPSTR   szDefaultDir;
    LPSTR   szBaseFileName;
    DWORD   dwFileType;
    DWORD   dwReserved;
    union {
        struct {
            DWORD   PdlAutoNameInterval;
            DWORD   PdlAutoNameUnits;
            LPSTR   PdlCommandFilename;
            LPSTR   PdlCounterList;
            DWORD   PdlAutoNameFormat;
            DWORD   PdlSampleInterval;
            FILETIME    PdlLogStartTime;
            FILETIME    PdlLogEndTime;
        };
        struct {
            DWORD   TlNumberOfBuffers;
            DWORD   TlMinimumBuffers;
            DWORD   TlMaximumBuffers;
            DWORD   TlFreeBuffers;
            DWORD   TlBufferSize;
            DWORD   TlEventsLost;
            DWORD   TlLoggerThreadId;
            DWORD   TlBuffersWritten;
            DWORD   TlLogHandle;
            LPSTR   TlLogFileName;
        };
    };
} PDH_LOG_SERVICE_QUERY_INFO_A, * PPDH_LOG_SERVICE_QUERY_INFO_A;

typedef struct _PDH_LOG_SERVICE_QUERY_INFO_W {
    DWORD   dwSize;
    DWORD   dwFlags;
    DWORD   dwLogQuota;
    LPWSTR  szLogFileCaption;
    LPWSTR  szDefaultDir;
    LPWSTR  szBaseFileName;
    DWORD   dwFileType;
    DWORD   dwReserved;
    union {
        struct {
            DWORD   PdlAutoNameInterval;
            DWORD   PdlAutoNameUnits;
            LPWSTR  PdlCommandFilename;
            LPWSTR  PdlCounterList;
            DWORD   PdlAutoNameFormat;
            DWORD   PdlSampleInterval;
            FILETIME    PdlLogStartTime;
            FILETIME    PdlLogEndTime;
        };
        struct {
            DWORD   TlNumberOfBuffers;
            DWORD   TlMinimumBuffers;
            DWORD   TlMaximumBuffers;
            DWORD   TlFreeBuffers;
            DWORD   TlBufferSize;
            DWORD   TlEventsLost;
            DWORD   TlLoggerThreadId;
            DWORD   TlBuffersWritten;
            DWORD   TlLogHandle;
            LPWSTR  TlLogFileName;
        };
    };
} PDH_LOG_SERVICE_QUERY_INFO_W, * PPDH_LOG_SERVICE_QUERY_INFO_W;

//
//  Time value constants
//
#define MAX_TIME_VALUE ((LONGLONG) 0x7FFFFFFFFFFFFFFF)
#define MIN_TIME_VALUE ((LONGLONG) 0)

// function definitions

PDH_FUNCTION
PdhGetDllVersion(
    __out_opt LPDWORD lpdwVersion
);

//
//  Query Functions
//

PDH_FUNCTION
PdhOpenQueryW(
    __in_opt LPCWSTR      szDataSource,
    __in     DWORD_PTR    dwUserData,
    __out    PDH_HQUERY * phQuery
);

PDH_FUNCTION
PdhOpenQueryA(
    __in_opt LPCSTR       szDataSource,
    __in     DWORD_PTR    dwUserData,
    __out    PDH_HQUERY * phQuery
);

PDH_FUNCTION
PdhAddCounterW(
    __in  PDH_HQUERY     hQuery,
    __in  LPCWSTR        szFullCounterPath,
    __in  DWORD_PTR      dwUserData,
    __out PDH_HCOUNTER * phCounter
);

PDH_FUNCTION
PdhAddCounterA(
    __in  PDH_HQUERY     hQuery,
    __in  LPCSTR         szFullCounterPath,
    __in  DWORD_PTR      dwUserData,
    __out PDH_HCOUNTER * phCounter
);

#if (_WIN32_WINDOWS >= 0x0600 || _WIN32_WINNT >= 0x0600 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_VISTA))
PDH_FUNCTION
PdhAddEnglishCounterW(
    __in  PDH_HQUERY     hQuery,
    __in  LPCWSTR        szFullCounterPath,
    __in  DWORD_PTR      dwUserData,
    __out PDH_HCOUNTER * phCounter
);

PDH_FUNCTION
PdhAddEnglishCounterA(
    __in  PDH_HQUERY     hQuery,
    __in  LPCSTR         szFullCounterPath,
    __in  DWORD_PTR      dwUserData,
    __out PDH_HCOUNTER * phCounter
);

PDH_FUNCTION
PdhCollectQueryDataWithTime(
    __inout PDH_HQUERY   hQuery,
    __out   LONGLONG   * pllTimeStamp
);

PDH_FUNCTION
PdhValidatePathExW(
    __in_opt PDH_HLOG hDataSource,
    __in     LPCWSTR  szFullPathBuffer
);

PDH_FUNCTION
PdhValidatePathExA(
    __in_opt PDH_HLOG hDataSource,
    __in     LPCSTR   szFullPathBuffer
);
#endif

PDH_FUNCTION
PdhRemoveCounter(
    __in PDH_HCOUNTER hCounter
);

PDH_FUNCTION
PdhCollectQueryData(
    __inout PDH_HQUERY hQuery
);

PDH_FUNCTION
PdhCloseQuery(
    __inout PDH_HQUERY hQuery
);

//
//  Counter Functions
//

PDH_FUNCTION
PdhGetFormattedCounterValue(
    __in      PDH_HCOUNTER          hCounter,
    __in      DWORD                 dwFormat,
    __out_opt LPDWORD               lpdwType,
    __out     PPDH_FMT_COUNTERVALUE pValue
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetFormattedCounterArrayA(
    __in    PDH_HCOUNTER hCounter,
    __in    DWORD        dwFormat,
    __inout LPDWORD      lpdwBufferSize,
    __out   LPDWORD      lpdwItemCount,
    __out_bcount_opt(* lpdwBufferSize) PPDH_FMT_COUNTERVALUE_ITEM_A ItemBuffer
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetFormattedCounterArrayW(
    __in    PDH_HCOUNTER hCounter,
    __in    DWORD        dwFormat,
    __inout LPDWORD      lpdwBufferSize,
    __out   LPDWORD      lpdwItemCount,
    __out_bcount_opt(* lpdwBufferSize) PPDH_FMT_COUNTERVALUE_ITEM_W ItemBuffer
);

// dwFormat flag values
//
#define PDH_FMT_RAW          ((DWORD) 0x00000010)
#define PDH_FMT_ANSI         ((DWORD) 0x00000020)
#define PDH_FMT_UNICODE      ((DWORD) 0x00000040)
#define PDH_FMT_LONG         ((DWORD) 0x00000100)
#define PDH_FMT_DOUBLE       ((DWORD) 0x00000200)
#define PDH_FMT_LARGE        ((DWORD) 0x00000400)
#define PDH_FMT_NOSCALE      ((DWORD) 0x00001000)
#define PDH_FMT_1000         ((DWORD) 0x00002000)
#define PDH_FMT_NODATA       ((DWORD) 0x00004000)
#define PDH_FMT_NOCAP100     ((DWORD) 0x00008000)
#define PERF_DETAIL_COSTLY   ((DWORD) 0x00010000)
#define PERF_DETAIL_STANDARD ((DWORD) 0x0000FFFF)

PDH_FUNCTION
PdhGetRawCounterValue(
    __in      PDH_HCOUNTER      hCounter,
    __out_opt LPDWORD           lpdwType,
    __out     PPDH_RAW_COUNTER  pValue
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetRawCounterArrayA(
    __in    PDH_HCOUNTER  hCounter,
    __inout LPDWORD       lpdwBufferSize,
    __out   LPDWORD       lpdwItemCount,
    __out_bcount_opt(* lpdwBufferSize) PPDH_RAW_COUNTER_ITEM_A ItemBuffer
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetRawCounterArrayW(
    __in    PDH_HCOUNTER  hCounter,
    __inout LPDWORD       lpdwBufferSize,
    __out   LPDWORD       lpdwItemCount,
    __out_bcount_opt(* lpdwBufferSize) PPDH_RAW_COUNTER_ITEM_W ItemBuffer
);

PDH_FUNCTION
PdhCalculateCounterFromRawValue(
    __in  PDH_HCOUNTER          hCounter,
    __in  DWORD                 dwFormat,
    __in  PPDH_RAW_COUNTER      rawValue1,
    __in  PPDH_RAW_COUNTER      rawValue2,
    __out PPDH_FMT_COUNTERVALUE fmtValue
);

PDH_FUNCTION
PdhComputeCounterStatistics(
    __in  PDH_HCOUNTER     hCounter,
    __in  DWORD            dwFormat,
    __in  DWORD            dwFirstEntry,
    __in  DWORD            dwNumEntries,
    __in  PPDH_RAW_COUNTER lpRawValueArray,
    __out PPDH_STATISTICS  data
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetCounterInfoW(
    __in    PDH_HCOUNTER hCounter,
    __in    BOOLEAN      bRetrieveExplainText,
    __inout LPDWORD      pdwBufferSize,
    __out_bcount_opt(* pdwBufferSize) PPDH_COUNTER_INFO_W lpBuffer
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetCounterInfoA(
    __in    PDH_HCOUNTER hCounter,
    __in    BOOLEAN      bRetrieveExplainText,
    __inout LPDWORD      pdwBufferSize,
    __out_bcount_opt(* pdwBufferSize) PPDH_COUNTER_INFO_A lpBuffer
);

#define PDH_MAX_SCALE  (7L)
#define PDH_MIN_SCALE (-7L)

PDH_FUNCTION
PdhSetCounterScaleFactor(
    __inout PDH_HCOUNTER hCounter,
    __in    LONG         lFactor
);
//
//   Browsing and enumeration functions
//
PDH_FUNCTION
PdhConnectMachineW(
    __in_opt LPCWSTR szMachineName
);

PDH_FUNCTION
PdhConnectMachineA(
    __in_opt LPCSTR szMachineName
);

PDH_FUNCTION
PdhEnumMachinesW(
    __in_opt LPCWSTR szDataSource,
    __out_ecount_opt(* pcchBufferSize) PZZWSTR mszMachineList,
    __inout LPDWORD pcchBufferSize
);

PDH_FUNCTION
PdhEnumMachinesA(
    __in_opt LPCSTR  szDataSource,
    __out_ecount_opt(* pcchBufferSize) PZZSTR mszMachineList,
    __inout LPDWORD pcchBufferSize
);

PDH_FUNCTION
PdhEnumObjectsW(
    __in_opt LPCWSTR szDataSource,
    __in_opt LPCWSTR szMachineName,
    __out_ecount_opt(* pcchBufferSize) PZZWSTR mszObjectList,
    __inout  LPDWORD pcchBufferSize,
    __in     DWORD   dwDetailLevel,
    __in     BOOL    bRefresh
);

PDH_FUNCTION
PdhEnumObjectsA(
    __in_opt LPCSTR  szDataSource,
    __in_opt LPCSTR  szMachineName,
    __out_ecount_opt(* pcchBufferSize) PZZSTR mszObjectList,
    __inout  LPDWORD pcchBufferSize,
    __in     DWORD   dwDetailLevel,
    __in     BOOL    bRefresh
);

PDH_FUNCTION
PdhEnumObjectItemsW(
    __in_opt LPCWSTR szDataSource,
    __in_opt LPCWSTR szMachineName,
    __in     LPCWSTR szObjectName,
    __out_ecount_opt(* pcchCounterListLength) PZZWSTR mszCounterList,
    __inout  LPDWORD pcchCounterListLength,
    __out_ecount_opt(* pcchInstanceListLength) PZZWSTR mszInstanceList,
    __inout  LPDWORD pcchInstanceListLength,
    __in     DWORD   dwDetailLevel,
    __in     DWORD   dwFlags
);

PDH_FUNCTION
PdhEnumObjectItemsA(
    __in_opt LPCSTR  szDataSource,
    __in_opt LPCSTR  szMachineName,
    __in     LPCSTR  szObjectName,
    __out_ecount_opt(* pcchCounterListLength) PZZSTR mszCounterList,
    __inout  LPDWORD pcchCounterListLength,
    __out_ecount_opt(* pcchInstanceListLength) PZZSTR mszInstanceList,
    __inout  LPDWORD pcchInstanceListLength,
    __in     DWORD   dwDetailLevel,
    __in     DWORD   dwFlags
);

PDH_FUNCTION
PdhMakeCounterPathW(
    __in    PPDH_COUNTER_PATH_ELEMENTS_W pCounterPathElements,
    __out_ecount_opt(* pcchBufferSize)   LPWSTR szFullPathBuffer,
    __inout LPDWORD                      pcchBufferSize,
    __in    DWORD                        dwFlags
);

PDH_FUNCTION
PdhMakeCounterPathA(
    __in    PPDH_COUNTER_PATH_ELEMENTS_A pCounterPathElements,
    __out_ecount_opt(* pcchBufferSize)   LPSTR szFullPathBuffer,
    __inout LPDWORD                      pcchBufferSize,
    __in    DWORD                        dwFlags
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhParseCounterPathW(
    __in    LPCWSTR                   szFullPathBuffer,
    __out_bcount_opt(* pdwBufferSize) PPDH_COUNTER_PATH_ELEMENTS_W pCounterPathElements,
    __inout LPDWORD                   pdwBufferSize,
    __in    DWORD                     dwFlags
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhParseCounterPathA(
    __in    LPCSTR                    szFullPathBuffer,
    __out_bcount_opt(* pdwBufferSize) PPDH_COUNTER_PATH_ELEMENTS_A pCounterPathElements,
    __inout LPDWORD                   pdwBufferSize,
    __in    DWORD                     dwFlags
);

#define PDH_PATH_WBEM_RESULT ((DWORD) 0x00000001)
#define PDH_PATH_WBEM_INPUT  ((DWORD) 0x00000002)

#define PDH_PATH_LANG_FLAGS(LangId, Flags)  ((DWORD)(((LangId & 0x0000FFFF) << 16) | (Flags & 0x0000FFFF)))

PDH_FUNCTION
PdhParseInstanceNameW(
    __in    LPCWSTR szInstanceString,
    __out_ecount_opt(* pcchInstanceNameLength) LPWSTR  szInstanceName,
    __inout LPDWORD pcchInstanceNameLength,
    __out_ecount_opt(* pcchParentNameLength)   LPWSTR  szParentName,
    __inout LPDWORD pcchParentNameLength,
    __out   LPDWORD lpIndex
);

PDH_FUNCTION
PdhParseInstanceNameA(
    __in    LPCSTR  szInstanceString,
    __out_ecount_opt(* pcchInstanceNameLength) LPSTR   szInstanceName,
    __inout LPDWORD pcchInstanceNameLength,
    __out_ecount_opt(* pcchParentNameLength)   LPSTR   szParentName,
    __inout LPDWORD pcchParentNameLength,
    __out   LPDWORD lpIndex
);

PDH_FUNCTION
PdhValidatePathW(
    __in LPCWSTR szFullPathBuffer
);

PDH_FUNCTION
PdhValidatePathA(
    __in LPCSTR szFullPathBuffer
);

PDH_FUNCTION
PdhGetDefaultPerfObjectW(
    __in_opt LPCWSTR szDataSource,
    __in_opt LPCWSTR szMachineName,
    __out_ecount_opt(* pcchBufferSize) LPWSTR  szDefaultObjectName,
    __inout  LPDWORD pcchBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfObjectA(
    __in_opt LPCSTR  szDataSource,
    __in_opt LPCSTR  szMachineName,
    __out_ecount_opt(* pcchBufferSize) LPSTR   szDefaultObjectName,
    __inout  LPDWORD pcchBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfCounterW(
    __in_opt LPCWSTR szDataSource,
    __in_opt LPCWSTR szMachineName,
    __in     LPCWSTR szObjectName,
    __out_ecount_opt(* pcchBufferSize) LPWSTR  szDefaultCounterName,
    __inout  LPDWORD pcchBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfCounterA(
    __in_opt LPCSTR  szDataSource,
    __in_opt LPCSTR  szMachineName,
    __in     LPCSTR  szObjectName,
    __out_ecount_opt(* pcchBufferSize) LPSTR   szDefaultCounterName,
    __inout  LPDWORD pcchBufferSize
);

typedef PDH_STATUS (__stdcall * CounterPathCallBack)(DWORD_PTR);

#if _MSC_VER >= 1200
#pragma warning(push)
#endif
#pragma warning ( disable : 4214 )  // Disable warning messages

#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
typedef struct _BrowseDlgConfig_HW {
    // Configuration flags
    DWORD   bIncludeInstanceIndex:1,
            bSingleCounterPerAdd:1,
            bSingleCounterPerDialog:1,
            bLocalCountersOnly:1,
            bWildCardInstances:1,
            bHideDetailBox:1,
            bInitializePath:1,
            bDisableMachineSelection:1,
            bIncludeCostlyObjects:1,
            bShowObjectBrowser:1,
            bReserved:22;

    HWND                hWndOwner;
    PDH_HLOG            hDataSource;
    LPWSTR              szReturnPathBuffer;
    DWORD               cchReturnPathLength;
    CounterPathCallBack pCallBack;
    DWORD_PTR           dwCallBackArg;
    PDH_STATUS          CallBackStatus;
    DWORD               dwDefaultDetailLevel;
    LPWSTR              szDialogBoxCaption;
} PDH_BROWSE_DLG_CONFIG_HW, * PPDH_BROWSE_DLG_CONFIG_HW;

typedef struct _BrowseDlgConfig_HA {
    // Configuration flags
    DWORD   bIncludeInstanceIndex:1,
            bSingleCounterPerAdd:1,
            bSingleCounterPerDialog:1,
            bLocalCountersOnly:1,
            bWildCardInstances:1,
            bHideDetailBox:1,
            bInitializePath:1,
            bDisableMachineSelection:1,
            bIncludeCostlyObjects:1,
            bShowObjectBrowser:1,
            bReserved:22;

    HWND                hWndOwner;
    PDH_HLOG            hDataSource;
    LPSTR               szReturnPathBuffer;
    DWORD               cchReturnPathLength;
    CounterPathCallBack pCallBack;
    DWORD_PTR           dwCallBackArg;
    PDH_STATUS          CallBackStatus;
    DWORD               dwDefaultDetailLevel;
    LPSTR               szDialogBoxCaption;
} PDH_BROWSE_DLG_CONFIG_HA, * PPDH_BROWSE_DLG_CONFIG_HA;

typedef struct _BrowseDlgConfig_W {
    // Configuration flags
    DWORD   bIncludeInstanceIndex:1,
            bSingleCounterPerAdd:1,
            bSingleCounterPerDialog:1,
            bLocalCountersOnly:1,
            bWildCardInstances:1,
            bHideDetailBox:1,
            bInitializePath:1,
            bDisableMachineSelection:1,
            bIncludeCostlyObjects:1,
            bShowObjectBrowser:1,
            bReserved:22;

    HWND                hWndOwner;
    LPWSTR              szDataSource;
    LPWSTR              szReturnPathBuffer;
    DWORD               cchReturnPathLength;
    CounterPathCallBack pCallBack;
    DWORD_PTR           dwCallBackArg;
    PDH_STATUS          CallBackStatus;
    DWORD               dwDefaultDetailLevel;
    LPWSTR              szDialogBoxCaption;
} PDH_BROWSE_DLG_CONFIG_W, * PPDH_BROWSE_DLG_CONFIG_W;

typedef struct _BrowseDlgConfig_A {
    // Configuration flags
    DWORD   bIncludeInstanceIndex:1,
            bSingleCounterPerAdd:1,
            bSingleCounterPerDialog:1,
            bLocalCountersOnly:1,
            bWildCardInstances:1,
            bHideDetailBox:1,
            bInitializePath:1,
            bDisableMachineSelection:1,
            bIncludeCostlyObjects:1,
            bShowObjectBrowser:1,
            bReserved:22;

    HWND                hWndOwner;
    LPSTR               szDataSource;
    __field_ecount(cchReturnPathLength) LPSTR               szReturnPathBuffer;
    DWORD               cchReturnPathLength;
    CounterPathCallBack pCallBack;
    DWORD_PTR           dwCallBackArg;
    PDH_STATUS          CallBackStatus;
    DWORD               dwDefaultDetailLevel;
    LPSTR               szDialogBoxCaption;
} PDH_BROWSE_DLG_CONFIG_A, * PPDH_BROWSE_DLG_CONFIG_A;
#else

typedef struct _BrowseDlgConfig_W {
    // Configuration flags
    DWORD   bIncludeInstanceIndex:1,
            bSingleCounterPerAdd:1,
            bSingleCounterPerDialog:1,
            bLocalCountersOnly:1,
            bWildCardInstances:1,
            bHideDetailBox:1,
            bInitializePath:1,
            bDisableMachineSelection:1,
            bIncludeCostlyObjects:1,
            bReserved:23;

    HWND                hWndOwner;
    LPWSTR              szDataSource;
    LPWSTR              szReturnPathBuffer;
    DWORD               cchReturnPathLength;
    CounterPathCallBack pCallBack;
    DWORD_PTR           dwCallBackArg;
    PDH_STATUS          CallBackStatus;
    DWORD               dwDefaultDetailLevel;
    LPWSTR              szDialogBoxCaption;
} PDH_BROWSE_DLG_CONFIG_W, * PPDH_BROWSE_DLG_CONFIG_W;

typedef struct _BrowseDlgConfig_A {
    // Configuration flags
    DWORD   bIncludeInstanceIndex:1,
            bSingleCounterPerAdd:1,
            bSingleCounterPerDialog:1,
            bLocalCountersOnly:1,
            bWildCardInstances:1,
            bHideDetailBox:1,
            bInitializePath:1,
            bDisableMachineSelection:1,
            bIncludeCostlyObjects:1,
            bReserved:23;

    HWND                hWndOwner;
    LPSTR               szDataSource;
    LPSTR               szReturnPathBuffer;
    DWORD               cchReturnPathLength;
    CounterPathCallBack pCallBack;
    DWORD_PTR           dwCallBackArg;
    PDH_STATUS          CallBackStatus;
    DWORD               dwDefaultDetailLevel;
    LPSTR               szDialogBoxCaption;
} PDH_BROWSE_DLG_CONFIG_A, * PPDH_BROWSE_DLG_CONFIG_A;
#endif

#if _MSC_VER >= 1200
#pragma warning(pop)
#else
#pragma warning ( default : 4214 )
#endif

PDH_FUNCTION
PdhBrowseCountersW(
    __in PPDH_BROWSE_DLG_CONFIG_W pBrowseDlgData
);

PDH_FUNCTION
PdhBrowseCountersA(
    __in PPDH_BROWSE_DLG_CONFIG_A pBrowseDlgData
);

PDH_FUNCTION
PdhExpandCounterPathW(
    __in    LPCWSTR szWildCardPath,
    __out_ecount_opt(* pcchPathListLength) PZZWSTR  mszExpandedPathList,
    __inout LPDWORD pcchPathListLength
);

PDH_FUNCTION
PdhExpandCounterPathA(
    __in    LPCSTR  szWildCardPath,
    __out_ecount_opt(* pcchPathListLength) PZZSTR   mszExpandedPathList,
    __inout LPDWORD pcchPathListLength
);

//
//  v2.0 functions
//
PDH_FUNCTION
PdhLookupPerfNameByIndexW(
    __in_opt LPCWSTR szMachineName,
    __in     DWORD   dwNameIndex,
    __out_ecount_opt(* pcchNameBufferSize) LPWSTR  szNameBuffer,
    __inout  LPDWORD pcchNameBufferSize
);

PDH_FUNCTION
PdhLookupPerfNameByIndexA(
    __in_opt LPCSTR  szMachineName,
    __in     DWORD   dwNameIndex,
    __out_ecount_opt(* pcchNameBufferSize) LPSTR   szNameBuffer,
    __inout  LPDWORD pcchNameBufferSize
);

PDH_FUNCTION
PdhLookupPerfIndexByNameW(
    __in_opt LPCWSTR szMachineName,
    __in     LPCWSTR szNameBuffer,
    __out    LPDWORD pdwIndex
);

PDH_FUNCTION
PdhLookupPerfIndexByNameA(
    __in_opt LPCSTR  szMachineName,
    __in     LPCSTR  szNameBuffer,
    __out    LPDWORD pdwIndex
);

#define PDH_NOEXPANDCOUNTERS    1
#define PDH_NOEXPANDINSTANCES   2
#if (_WIN32_WINDOWS >= 0x0502 || _WIN32_WINNT >= 0x0502 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WIN2003))
#define PDH_REFRESHCOUNTERS     4
#endif

PDH_FUNCTION
PdhExpandWildCardPathA(
    __in_opt LPCSTR  szDataSource,
    __in     LPCSTR  szWildCardPath,
    __out_ecount_opt(* pcchPathListLength) PZZSTR   mszExpandedPathList,
    __inout  LPDWORD pcchPathListLength,
    __in     DWORD   dwFlags
);

PDH_FUNCTION
PdhExpandWildCardPathW(
    __in_opt LPCWSTR szDataSource,
    __in     LPCWSTR szWildCardPath,
    __out_ecount_opt(* pcchPathListLength) PZZWSTR  mszExpandedPathList,
    __inout  LPDWORD pcchPathListLength,
    __in     DWORD   dwFlags
);

//
//   Logging Functions
//

#define PDH_LOG_READ_ACCESS      ((DWORD) 0x00010000)
#define PDH_LOG_WRITE_ACCESS     ((DWORD) 0x00020000)
#define PDH_LOG_UPDATE_ACCESS    ((DWORD) 0x00040000)
#define PDH_LOG_ACCESS_MASK      ((DWORD) 0x000F0000)

#define PDH_LOG_CREATE_NEW       ((DWORD) 0x00000001)
#define PDH_LOG_CREATE_ALWAYS    ((DWORD) 0x00000002)
#define PDH_LOG_OPEN_ALWAYS      ((DWORD) 0x00000003)
#define PDH_LOG_OPEN_EXISTING    ((DWORD) 0x00000004)
#define PDH_LOG_CREATE_MASK      ((DWORD) 0x0000000F)

#define PDH_LOG_OPT_USER_STRING  ((DWORD) 0x01000000)
#define PDH_LOG_OPT_CIRCULAR     ((DWORD) 0x02000000)
#define PDH_LOG_OPT_MAX_IS_BYTES ((DWORD) 0x04000000)
#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
#define PDH_LOG_OPT_APPEND       ((DWORD) 0x08000000)
#endif
#define PDH_LOG_OPT_MASK         ((DWORD) 0x0F000000)

#define PDH_LOG_TYPE_UNDEFINED      0
#define PDH_LOG_TYPE_CSV            1
#define PDH_LOG_TYPE_TSV            2
#define PDH_LOG_TYPE_TRACE_KERNEL   4
#define PDH_LOG_TYPE_TRACE_GENERIC  5
#define PDH_LOG_TYPE_PERFMON        6
#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
//#define PDH_LOG_TYPE_BINARY         3 // this is the retired binary format
#define PDH_LOG_TYPE_SQL            7
#define PDH_LOG_TYPE_BINARY         8
#else
#define PDH_LOG_TYPE_BINARY         3
#endif

PDH_FUNCTION
PdhOpenLogW(
    __in     LPCWSTR     szLogFileName,
    __in     DWORD       dwAccessFlags,
    __inout  LPDWORD     lpdwLogType,
    __in_opt PDH_HQUERY  hQuery,
    __in     DWORD       dwMaxSize,
    __in_opt LPCWSTR     szUserCaption,
    __out    PDH_HLOG  * phLog
);

PDH_FUNCTION
PdhOpenLogA(
    __in     LPCSTR       szLogFileName,
    __in     DWORD        dwAccessFlags,
    __inout  LPDWORD      lpdwLogType,
    __in_opt PDH_HQUERY   hQuery,
    __in     DWORD        dwMaxSize,
    __in_opt LPCSTR       szUserCaption,
    __out    PDH_HLOG   * phLog
);

PDH_FUNCTION
PdhUpdateLogW(
    __in     PDH_HLOG hLog,
    __in_opt LPCWSTR  szUserString
);

PDH_FUNCTION
PdhUpdateLogA(
    __in     PDH_HLOG hLog,
    __in_opt LPCSTR   szUserString
);

PDH_FUNCTION
PdhUpdateLogFileCatalog(
    __in PDH_HLOG hLog
);

PDH_FUNCTION
PdhGetLogFileSize(
    __in  PDH_HLOG   hLog,
    __out LONGLONG * llSize
);

PDH_FUNCTION
PdhCloseLog(
    __in PDH_HLOG hLog,
    __in DWORD    dwFlags
);

#define PDH_FLAGS_CLOSE_QUERY   ((DWORD) 0x00000001)
//
//  Data source selection dialog
//
#define PDH_FLAGS_FILE_BROWSER_ONLY ((DWORD) 0x00000001)

PDH_FUNCTION
PdhSelectDataSourceW(
    __in    HWND    hWndOwner,
    __in    DWORD   dwFlags,
    __inout_ecount(* pcchBufferLength) LPWSTR  szDataSource,
    __inout LPDWORD pcchBufferLength
);

PDH_FUNCTION
PdhSelectDataSourceA(
    __in    HWND    hWndOwner,
    __in    DWORD   dwFlags,
    __inout_ecount(* pcchBufferLength) LPSTR   szDataSource,
    __inout LPDWORD pcchBufferLength
);

BOOL
PdhIsRealTimeQuery(
    __in PDH_HQUERY hQuery
);

PDH_FUNCTION
PdhSetQueryTimeRange(
    __in PDH_HQUERY     hQuery,
    __in PPDH_TIME_INFO pInfo
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetDataSourceTimeRangeW(
    __in_opt LPCWSTR  szDataSource,
    __out    LPDWORD  pdwNumEntries,
    __out_bcount(* pdwBufferSize)    PPDH_TIME_INFO pInfo,
    __inout  LPDWORD  pdwBufferSize
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetDataSourceTimeRangeA(
    __in_opt LPCSTR   szDataSource,
    __out    LPDWORD  pdwNumEntries,
    __out_bcount(* pdwBufferSize) PPDH_TIME_INFO pInfo,
    __inout  LPDWORD  pdwBufferSize
);

PDH_FUNCTION
PdhCollectQueryDataEx(
    __in PDH_HQUERY hQuery,
    __in DWORD      dwIntervalTime,
    __in HANDLE     hNewDataEvent
);

PDH_FUNCTION
PdhFormatFromRawValue(
    __in  DWORD                   dwCounterType,
    __in  DWORD                   dwFormat,
    __in  LONGLONG              * pTimeBase,
    __in  PPDH_RAW_COUNTER        pRawValue1,
    __in  PPDH_RAW_COUNTER        pRawValue2,
    __out PPDH_FMT_COUNTERVALUE   pFmtValue
);

PDH_FUNCTION
PdhGetCounterTimeBase(
    __in  PDH_HCOUNTER   hCounter,
    __out LONGLONG     * pTimeBase
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhReadRawLogRecord(
    __in    PDH_HLOG  hLog,
    __in    FILETIME  ftRecord,
    __out_bcount_opt(* pdwBufferLength) PPDH_RAW_LOG_RECORD pRawLogRecord,
    __inout LPDWORD   pdwBufferLength
);


#define DATA_SOURCE_REGISTRY ((DWORD) 0x00000001)
#define DATA_SOURCE_LOGFILE  ((DWORD) 0x00000002)
#define DATA_SOURCE_WBEM     ((DWORD) 0x00000004)

PDH_FUNCTION
PdhSetDefaultRealTimeDataSource(
    __in DWORD dwDataSourceId
);

#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
// Extended API for WMI event trace logfile format
//
PDH_FUNCTION
PdhBindInputDataSourceW(
    __out    PDH_HLOG * phDataSource,
    __in_opt LPCWSTR    LogFileNameList
);

PDH_FUNCTION
PdhBindInputDataSourceA(
    __out    PDH_HLOG * phDataSource,
    __in_opt LPCSTR     LogFileNameList
);

PDH_FUNCTION
PdhOpenQueryH(
    __in_opt  PDH_HLOG     hDataSource,
    __in      DWORD_PTR    dwUserData,
    __out     PDH_HQUERY * phQuery
);

PDH_FUNCTION
PdhEnumMachinesHW(
    __in_opt PDH_HLOG hDataSource,
    __out_ecount_opt(* pcchBufferSize) PZZWSTR   mszMachineList,
    __inout  LPDWORD  pcchBufferSize
);

PDH_FUNCTION
PdhEnumMachinesHA(
    __in_opt PDH_HLOG hDataSource,
    __out_ecount_opt(* pcchBufferSize) PZZSTR    mszMachineList,
    __inout  LPDWORD  pcchBufferSize
);

PDH_FUNCTION
PdhEnumObjectsHW(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCWSTR  szMachineName,
    __out_ecount_opt(* pcchBufferSize) PZZWSTR   mszObjectList,
    __inout  LPDWORD  pcchBufferSize,
    __in     DWORD    dwDetailLevel,
    __in     BOOL     bRefresh
) ;

PDH_FUNCTION
PdhEnumObjectsHA(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCSTR   szMachineName,
    __out_ecount_opt(* pcchBufferSize) PZZSTR    mszObjectList,
    __inout  LPDWORD  pcchBufferSize,
    __in     DWORD    dwDetailLevel,
    __in     BOOL     bRefresh
);

PDH_FUNCTION
PdhEnumObjectItemsHW(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCWSTR  szMachineName,
    __in     LPCWSTR  szObjectName,
    __out_ecount_opt(* pcchCounterListLength) PZZWSTR   mszCounterList,
    __inout  LPDWORD  pcchCounterListLength,
    __out_ecount_opt(* pcchInstanceListLength) PZZWSTR   mszInstanceList,
    __inout  LPDWORD  pcchInstanceListLength,
    __in     DWORD    dwDetailLevel,
    __in     DWORD    dwFlags
);

PDH_FUNCTION
PdhEnumObjectItemsHA(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCSTR   szMachineName,
    __in     LPCSTR   szObjectName,
    __out_ecount_opt(* pcchCounterListLength) PZZSTR    mszCounterList,
    __inout  LPDWORD  pcchCounterListLength,
    __out_ecount_opt(* pcchInstanceListLength) PZZSTR    mszInstanceList,
    __inout  LPDWORD  pcchInstanceListLength,
    __in     DWORD    dwDetailLevel,
    __in     DWORD    dwFlags
);

PDH_FUNCTION
PdhExpandWildCardPathHW(
    __in_opt PDH_HLOG hDataSource,
    __in     LPCWSTR  szWildCardPath,
    __out_ecount_opt(* pcchPathListLength) PZZWSTR   mszExpandedPathList,
    __inout  LPDWORD  pcchPathListLength,
    __in    DWORD    dwFlags
);

PDH_FUNCTION
PdhExpandWildCardPathHA(
    __in_opt PDH_HLOG hDataSource,
    __in     LPCSTR   szWildCardPath,
    __out_ecount_opt(* pcchPathListLength) PZZSTR    mszExpandedPathList,
    __inout  LPDWORD  pcchPathListLength,
    __in    DWORD    dwFlags
);

__success(return == ERROR_SUCCESS)
PDH_FUNCTION
PdhGetDataSourceTimeRangeH(
    __inout_opt PDH_HLOG hDataSource,
    __out       LPDWORD  pdwNumEntries,
    __out_bcount(* pdwBufferSize) PPDH_TIME_INFO pInfo,
    __inout  LPDWORD  pdwBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfObjectHW(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCWSTR  szMachineName,
    __out_ecount_opt(* pcchBufferSize) LPWSTR   szDefaultObjectName,
    __inout  LPDWORD  pcchBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfObjectHA(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCSTR   szMachineName,
    __out_ecount_opt(* pcchBufferSize) LPSTR    szDefaultObjectName,
    __inout  LPDWORD  pcchBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfCounterHW(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCWSTR  szMachineName,
    __in     LPCWSTR  szObjectName,
    __out_ecount_opt(* pcchBufferSize) LPWSTR   szDefaultCounterName,
    __inout  LPDWORD  pcchBufferSize
);

PDH_FUNCTION
PdhGetDefaultPerfCounterHA(
    __in_opt PDH_HLOG hDataSource,
    __in_opt LPCSTR   szMachineName,
    __in     LPCSTR   szObjectName,
    __out_ecount_opt(* pcchBufferSize) LPSTR    szDefaultCounterName,
    __inout  LPDWORD  pcchBufferSize
);

PDH_FUNCTION
PdhBrowseCountersHW(
    __in PPDH_BROWSE_DLG_CONFIG_HW pBrowseDlgData
);

PDH_FUNCTION
PdhBrowseCountersHA(
    __in PPDH_BROWSE_DLG_CONFIG_HA pBrowseDlgData
);

//Check that a DSN points to a database that contains the correct Perfmon tables.
PDH_FUNCTION
PdhVerifySQLDBW(
    __in LPCWSTR szDataSource
);

PDH_FUNCTION
PdhVerifySQLDBA(
    __in LPCSTR szDataSource
);


//Create the correct perfmon tables in the database pointed to by a DSN.
PDH_FUNCTION
PdhCreateSQLTablesW(
    __in LPCWSTR szDataSource
);  

PDH_FUNCTION
PdhCreateSQLTablesA(
    __in LPCSTR szDataSource
);     

//Return the list of Log set names in the database pointed to by the DSN.
PDH_FUNCTION
PdhEnumLogSetNamesW(
    __in    LPCWSTR szDataSource,
    __out_ecount_opt(* pcchBufferLength) PZZWSTR  mszDataSetNameList,
    __inout LPDWORD pcchBufferLength
);

PDH_FUNCTION
PdhEnumLogSetNamesA(
    __in    LPCSTR  szDataSource,
    __out_ecount_opt(* pcchBufferLength) PZZSTR   mszDataSetNameList,
    __inout LPDWORD pcchBufferLength
);

//Retrieve the GUID for an open Log Set
PDH_FUNCTION
PdhGetLogSetGUID(
    __in      PDH_HLOG   hLog,             
    __out_opt GUID     * pGuid,
    __out_opt int      * pRunId
);

//Set the RunID for an open Log Set
PDH_FUNCTION
PdhSetLogSetRunID(
    __inout PDH_HLOG hLog,             
    __in    int      RunId
);
#endif

//
//   Unicode/ANSI compatibility section
//
#ifdef UNICODE
#ifndef _UNICODE
#define _UNICODE
#endif
#endif

#ifdef _UNICODE
#ifndef UNICODE
#define UNICODE
#endif
#endif

#ifdef UNICODE
// start of UNICODE definitions
#define PdhOpenQuery                PdhOpenQueryW
#define PdhAddCounter               PdhAddCounterW
#if (_WIN32_WINDOWS >= 0x0600 || _WIN32_WINNT >= 0x0600 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_VISTA))
#define PdhAddEnglishCounter        PdhAddEnglishCounterW
#define PdhValidatePathEx           PdhValidatePathExW
#endif
#define PdhGetCounterInfo           PdhGetCounterInfoW
#define PDH_COUNTER_INFO            PDH_COUNTER_INFO_W
#define PPDH_COUNTER_INFO           PPDH_COUNTER_INFO_W
#define PdhConnectMachine           PdhConnectMachineW
#define PdhEnumMachines             PdhEnumMachinesW
#define PdhEnumObjects              PdhEnumObjectsW
#define PdhEnumObjectItems          PdhEnumObjectItemsW
#define PdhMakeCounterPath          PdhMakeCounterPathW
#define PDH_COUNTER_PATH_ELEMENTS   PDH_COUNTER_PATH_ELEMENTS_W
#define PPDH_COUNTER_PATH_ELEMENTS  PPDH_COUNTER_PATH_ELEMENTS_W
#define PdhParseCounterPath         PdhParseCounterPathW
#define PdhParseInstanceName        PdhParseInstanceNameW
#define PdhValidatePath             PdhValidatePathW
#define PdhGetDefaultPerfObject     PdhGetDefaultPerfObjectW
#define PdhGetDefaultPerfCounter    PdhGetDefaultPerfCounterW
#define PdhBrowseCounters           PdhBrowseCountersW
#define PDH_BROWSE_DLG_CONFIG       PDH_BROWSE_DLG_CONFIG_W
#define PPDH_BROWSE_DLG_CONFIG      PPDH_BROWSE_DLG_CONFIG_W
#define PdhExpandCounterPath        PdhExpandCounterPathW
// v2.0 functions
#define PDH_FMT_COUNTERVALUE_ITEM   PDH_FMT_COUNTERVALUE_ITEM_W
#define PPDH_FMT_COUNTERVALUE_ITEM  PPDH_FMT_COUNTERVALUE_ITEM_W
#define PDH_RAW_COUNTER_ITEM        PDH_RAW_COUNTER_ITEM_W
#define PPDH_RAW_COUNTER_ITEM       PPDH_RAW_COUNTER_ITEM_W
#define PdhGetFormattedCounterArray PdhGetFormattedCounterArrayW
#define PdhGetRawCounterArray       PdhGetRawCounterArrayW
#define PdhLookupPerfNameByIndex    PdhLookupPerfNameByIndexW
#define PdhOpenLog                  PdhOpenLogW
#define PdhUpdateLog                PdhUpdateLogW
#define PdhSelectDataSource         PdhSelectDataSourceW
#define PdhGetDataSourceTimeRange   PdhGetDataSourceTimeRangeW
#define PDH_LOG_SERVICE_QUERY_INFO  PDH_LOG_SERVICE_QUERY_INFO_W
#define PPDH_LOG_SERVICE_QUERY_INFO PPDH_LOG_SERVICE_QUERY_INFO_W
#define PdhLogServiceControl        PdhLogServiceControlW
#define PdhLogServiceQuery          PdhLogServiceQueryW
#define PdhExpandWildCardPath       PdhExpandWildCardPathW

#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
#define PdhBindInputDataSource      PdhBindInputDataSourceW
#define PdhBrowseCountersH          PdhBrowseCountersHW
#define PDH_BROWSE_DLG_CONFIG_H     PDH_BROWSE_DLG_CONFIG_HW
#define PPDH_BROWSE_DLG_CONFIG_H    PPDH_BROWSE_DLG_CONFIG_HW
#define PdhEnumMachinesH            PdhEnumMachinesHW
#define PdhEnumObjectsH             PdhEnumObjectsHW
#define PdhEnumObjectItemsH         PdhEnumObjectItemsHW
#define PdhExpandWildCardPathH      PdhExpandWildCardPathHW
#define PdhGetDefaultPerfObjectH    PdhGetDefaultPerfObjectHW
#define PdhGetDefaultPerfCounterH   PdhGetDefaultPerfCounterHW
#define PdhEnumLogSetNames          PdhEnumLogSetNamesW
#define PdhCreateSQLTables          PdhCreateSQLTablesW
#define PdhVerifySQLDB              PdhVerifySQLDBW
#define PdhLookupPerfIndexByName    PdhLookupPerfIndexByNameW
#endif

// end of UNICODE definitions
#else
// start of ANSI definitions
#define PdhOpenQuery                PdhOpenQueryA
#define PdhAddCounter               PdhAddCounterA
#if (_WIN32_WINDOWS >= 0x0600 || _WINNT_WINNT >= 0x0600 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_VISTA))
#define PdhAddEnglishCounter        PdhAddEnglishCounterA
#define PdhValidatePathEx           PdhValidatePathExA
#endif
#define PdhGetCounterInfo           PdhGetCounterInfoA
#define PDH_COUNTER_INFO            PDH_COUNTER_INFO_A
#define PPDH_COUNTER_INFO           PPDH_COUNTER_INFO_A
#define PdhConnectMachine           PdhConnectMachineA
#define PdhEnumMachines             PdhEnumMachinesA
#define PdhEnumObjects              PdhEnumObjectsA
#define PdhEnumObjectItems          PdhEnumObjectItemsA
#define PdhMakeCounterPath          PdhMakeCounterPathA
#define PDH_COUNTER_PATH_ELEMENTS   PDH_COUNTER_PATH_ELEMENTS_A
#define PPDH_COUNTER_PATH_ELEMENTS  PPDH_COUNTER_PATH_ELEMENTS_A
#define PdhParseCounterPath         PdhParseCounterPathA
#define PdhParseInstanceName        PdhParseInstanceNameA
#define PdhValidatePath             PdhValidatePathA
#define PdhGetDefaultPerfObject     PdhGetDefaultPerfObjectA
#define PdhGetDefaultPerfCounter    PdhGetDefaultPerfCounterA
#define PdhBrowseCounters           PdhBrowseCountersA
#define PDH_BROWSE_DLG_CONFIG       PDH_BROWSE_DLG_CONFIG_A
#define PPDH_BROWSE_DLG_CONFIG      PPDH_BROWSE_DLG_CONFIG_A
#define PdhExpandCounterPath        PdhExpandCounterPathA
// v2.0 functions
#define PDH_FMT_COUNTERVALUE_ITEM   PDH_FMT_COUNTERVALUE_ITEM_A
#define PPDH_FMT_COUNTERVALUE_ITEM  PPDH_FMT_COUNTERVALUE_ITEM_A
#define PDH_RAW_COUNTER_ITEM        PDH_RAW_COUNTER_ITEM_A
#define PPDH_RAW_COUNTER_ITEM       PPDH_RAW_COUNTER_ITEM_A
#define PdhGetFormattedCounterArray PdhGetFormattedCounterArrayA
#define PdhGetRawCounterArray       PdhGetRawCounterArrayA
#define PdhLookupPerfNameByIndex    PdhLookupPerfNameByIndexA
#define PdhOpenLog                  PdhOpenLogA
#define PdhUpdateLog                PdhUpdateLogA
#define PdhSelectDataSource         PdhSelectDataSourceA
#define PdhGetDataSourceTimeRange   PdhGetDataSourceTimeRangeA
#define PDH_LOG_SERVICE_QUERY_INFO  PDH_LOG_SERVICE_QUERY_INFO_A
#define PPDH_LOG_SERVICE_QUERY_INFO PPDH_LOG_SERVICE_QUERY_INFO_A
#define PdhLogServiceControl        PdhLogServiceControlA
#define PdhLogServiceQuery          PdhLogServiceQueryA
#define PdhExpandWildCardPath       PdhExpandWildCardPathA

#if (_WIN32_WINDOWS >= 0x0501 || _WIN32_WINNT >= 0x0501 || (defined(NTDDI_VERSION) && NTDDI_VERSION >= NTDDI_WINXP))
#define PdhBindInputDataSource      PdhBindInputDataSourceA
#define PDH_BROWSE_DLG_CONFIG_H     PDH_BROWSE_DLG_CONFIG_HA
#define PPDH_BROWSE_DLG_CONFIG_H    PPDH_BROWSE_DLG_CONFIG_HA
#define PdhBrowseCountersH          PdhBrowseCountersHA
#define PdhEnumMachinesH            PdhEnumMachinesHA
#define PdhEnumObjectsH             PdhEnumObjectsHA
#define PdhEnumObjectItemsH         PdhEnumObjectItemsHA
#define PdhExpandWildCardPathH      PdhExpandWildCardPathHA
#define PdhGetDefaultPerfObjectH    PdhGetDefaultPerfObjectHA
#define PdhGetDefaultPerfCounterH   PdhGetDefaultPerfCounterHA
#define PdhEnumLogSetNames          PdhEnumLogSetNamesA
#define PdhCreateSQLTables          PdhCreateSQLTablesA
#define PdhVerifySQLDB              PdhVerifySQLDBA
#define PdhLookupPerfIndexByName    PdhLookupPerfIndexByNameA
#endif

// end of ANSI definitions
#endif  // UNICODE

#if _MSC_VER >= 1200
#pragma warning(pop)
#else
#pragma warning ( default : 4201 )
#endif


#ifdef __cplusplus
}
#endif

#endif //_PDH_H_

