/******************************************************************************

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:
    errorrep.h

Abstract:
    contains functions used to report errors to Microsoft

******************************************************************************/	

#ifndef __ERRORREP_H__
#define __ERRORREP_H__

typedef enum tagEFaultRepRetVal
{
    frrvOk = 0,
    frrvOkManifest,
    frrvOkQueued,
    frrvErr,
    frrvErrNoDW,
    frrvErrTimeout,
    frrvLaunchDebugger,
    frrvOkHeadless,
    frrvErrAnotherInstance
} EFaultRepRetVal;

EFaultRepRetVal APIENTRY ReportFault(__in LPEXCEPTION_POINTERS pep, __in DWORD dwOpt);

BOOL            APIENTRY AddERExcludedApplicationA(__in LPCSTR szApplication);
BOOL            APIENTRY AddERExcludedApplicationW(__in LPCWSTR wszApplication);


typedef EFaultRepRetVal (APIENTRY *pfn_REPORTFAULT)(__in LPEXCEPTION_POINTERS, __in DWORD);
typedef EFaultRepRetVal (APIENTRY *pfn_ADDEREXCLUDEDAPPLICATIONA)(__in LPCSTR);
typedef EFaultRepRetVal (APIENTRY *pfn_ADDEREXCLUDEDAPPLICATIONW)(__in LPCWSTR);

#ifdef UNICODE
#define AddERExcludedApplication AddERExcludedApplicationW
#define pfn_ADDEREXCLUDEDAPPLICATION pfn_ADDEREXCLUDEDAPPLICATIONW
#else
#define AddERExcludedApplication AddERExcludedApplicationA
#define pfn_ADDEREXCLUDEDAPPLICATION pfn_ADDEREXCLUDEDAPPLICATIONA
#endif

// 
//+++++++++++++++++++++ Hang reporting api ++++++++++++++++++++++++++++++++
//
__control_entrypoint(DllExport)
HRESULT 
WINAPI
WerReportHang(
    __in HWND hwndHungApp,
    __in_opt PCWSTR pwzHungApplicationName
    );


#endif

