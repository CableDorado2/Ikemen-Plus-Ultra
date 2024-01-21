/*++

Copyright (c) 2005  Microsoft Corporation

Module Name  : NDF.h

Abstract:

This file contains declaration for Network Diagnostics Framework (NDF) client API

Author:

Tin Qian (tinqian) 07-08-2005

Revision history:

--*/
#pragma once

#include <specstrings.h>
#include <ndattrib.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus


#ifndef __CSADDR_DEFINED__
struct SOCKET_ADDRESS_LIST;
#endif // __CSADDR_DEFINED__


typedef PVOID NDFHANDLE; 

STDAPI
NdfCreateIncident(
    __in LPCWSTR helperClassName,
    ULONG celt,
    __in_ecount(celt) HELPER_ATTRIBUTE *attributes,
    __deref_out NDFHANDLE *handle);

STDAPI
NdfCreateWinSockIncident(  
    SOCKET sock,
    __in_opt LPCWSTR host,
    USHORT port,
    __in_opt LPCWSTR appId,
    __in_opt SID *userId,
    __deref_out NDFHANDLE *handle);
    
STDAPI
NdfCreateWebIncident(
    __in LPCWSTR url,
    __deref_out NDFHANDLE *handle);    
    
STDAPI
NdfCreateWebIncidentEx(
       __in LPCWSTR url,
       BOOL useWinHTTP,
       __in_opt LPWSTR moduleName, 
       __deref_out NDFHANDLE *handle);

STDAPI NdfCreateSharingIncident(  
    __in LPCWSTR UNCPath,
    __deref_out NDFHANDLE *handle);

STDAPI NdfCreateDNSIncident(  
    __in LPCWSTR hostname,
    WORD queryType,
    __deref_out NDFHANDLE *handle);

STDAPI NdfCreateConnectivityIncident(  
    __deref_out NDFHANDLE *handle);

STDAPI NdfCreatePnrpIncident(  
    __in LPCWSTR cloudname,
    __in_opt LPCWSTR peername,
    __in BOOL diagnosePublish,
    __in_opt    LPCWSTR appId,  
    __deref_out NDFHANDLE *handle);

#define NDF_INBOUND_FLAG_EDGETRAVERSAL      0x00001
#define NDF_INBOUND_FLAG_HEALTHCHECK         0x00002

#ifdef __CSADDR_DEFINED__
STDAPI NdfCreateInboundIncident(
    __in_opt LPCWSTR applicationID,
    __in_opt LPCWSTR serviceID,
    __in_opt SID * userID,
    __in_opt const SOCKADDR_STORAGE *localTarget,
    IPPROTO protocol,
    DWORD dwFlags,
    __deref_out NDFHANDLE *handle
    );
#endif


HRESULT WINAPI
NdfCreateGroupingIncident(
	__in_opt		LPCWSTR	CloudName,
	__in_opt		LPCWSTR	GroupName,
	__in_opt    	LPCWSTR	Identity,                	
	__in_opt		LPCWSTR	Invitation,
	__in_opt    	SOCKET_ADDRESS_LIST * Addresses,
	__in_opt    LPCWSTR appId,	
	__deref_out 	NDFHANDLE *handle);


STDAPI
NdfExecuteDiagnosis(       
    __in NDFHANDLE handle,
    __in_opt HWND hwnd
    );

STDAPI
NdfCloseIncident(
    NDFHANDLE handle);

// Available flags for NdfDiagnoseIncident
#define NDF_ADD_CAPTURE_TRACE   0x0001

//UI-less diagnosis API
STDAPI
#ifdef __cplusplus
NdfDiagnoseIncident(
    __in NDFHANDLE Handle,
    __out ULONG *RootCauseCount,
    __deref_out_ecount(*RootCauseCount) 
    RootCauseInfo **RootCauses,
    DWORD dwWait=INFINITE,
    DWORD dwFlags=0
);
#else
NdfDiagnoseIncident(
    __in NDFHANDLE Handle,
    __out ULONG *RootCauseCount,
    __deref_out_ecount(*RootCauseCount) 
    RootCauseInfo **RootCauses,
    DWORD dwWait,
    DWORD dwFlags
);
#endif

//UI-less repair API
STDAPI
#ifdef __cplusplus
NdfRepairIncident(
      __in NDFHANDLE Handle,
      __in RepairInfoEx *RepairEx,
      DWORD dwWait=INFINITE
      );
#else
NdfRepairIncident(
      __in NDFHANDLE Handle,
      __in RepairInfoEx *RepairEx,
      DWORD dwWait
      );
#endif

//UI-less cancel API
STDAPI
NdfCancelIncident(
      __in NDFHANDLE Handle
      );

STDAPI
NdfGetTraceFile(
      __in NDFHANDLE Handle,
      __deref_out LPCWSTR *TraceFileLocation
      );

#ifdef __cplusplus
}
#endif // defined(__cplusplus)


