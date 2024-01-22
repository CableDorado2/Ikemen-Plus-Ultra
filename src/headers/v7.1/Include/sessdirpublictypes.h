

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for sessdirpublictypes.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 7.00.0555 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 500
#endif

/* verify that the <rpcsal.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCSAL_H_VERSION__
#define __REQUIRED_RPCSAL_H_VERSION__ 100
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__


#ifndef __sessdirpublictypes_h__
#define __sessdirpublictypes_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

/* header files for imported files */
#include "oaidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_sessdirpublictypes_0000_0000 */
/* [local] */ 


#define SINGLE_SESSION 0x1
#define FORCE_REJOIN 0x2
#define FORCE_REJOIN_IN_CLUSTERMODE 0x3
#define RESERVED_FOR_LEGACY   0x4
#define KEEP_EXISTING_SESSIONS 0x8


#define SBPLUGIN_CLSID_PROP_STR     _T("CLSID")
#define SBPLUGIN_ISENABLED_PROP_STR _T("IsEnabled")
#define SBPLUGIN_PROVIDER_PROP_STR _T("Provider")


#define SB_NAME_PROP_STR        _T("SbName")


#define TARGET_GUID_STR                      _T("TargetGuid")
#define TARGET_ENVIRONMENT_STR               _T("TargetEnvironment")
#define TARGET_ID_PROP_STR                   _T("TargetId")
#define FARM_ID_PROP_STR                     _T("FarmId")
#define TARGET_REPOPULATE                    _T("Repopulate")
#define TARGET_SINGLESESSION                 _T("SingleSession")
#define TARGET_SERVERCAPABILITY              _T("ServerCapability")
#define TARGET_SERVERINDRAIN                 _T("ServerDrain")
#define TARGET_CLIENT_CONNECTION_MONITORING  _T("TargetClientConnectionMonitoring")
#define TARGET_OWNER_PROP                    _T("TargetOwner")
#define ENFORCE_SINGLE_SESSION_PER_POOL      _T("EnforceSingleSessionPerPool")


#define TARGET_SERVERRPC          _T("ServerRpcIpAddress")

#define CONN_REQUEST_CALLING_SERVER_NAME_STR       _T("CallingServerName")
#define CONN_REQUEST_IS_CALL_FROM_TS_REDIRECTOR    _T("IsCallFromTSRedirector")
#define CONN_REQUEST_CALLING_SERVER_FARM_NAME_STR  _T("CallingServerFarmName")
#define CONN_REQUEST_TSV_URL_STR                   _T("TsvUrl")
#define CONN_REQUEST_TARGETTYPE_FROM_TSVURL        _T("TargetTypeFromTsvUrl")
#define CONN_REQUEST_TARGETID_FROM_TSVURL          _T("TargetIdFromTsvUrl")
#define CONN_REQUEST_RESOURCEPLUGIN_FROM_TSVURL    _T("ResourcePluginFromTsvUrl")
#define CONN_REQUEST_GUID                          _T("ConnectionRequestGUID")
typedef /* [public][public][public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0001
    {	TSSD_ADDR_UNDEFINED	= 0,
	TSSD_ADDR_IPv4	= 4,
	TSSD_ADDR_IPv6	= 6
    } 	TSSD_AddrV46Type;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0002
    {	TSSB_NOTIFY_INVALID	= 0,
	TSSB_NOTIFY_TARGET_CHANGE	= 0x1,
	TSSB_NOTIFY_SESSION_CHANGE	= 0x2,
	TSSB_NOTIFY_CONNECTION_REQUEST_CHANGE	= 0x4
    } 	TSSB_NOTIFICATION_TYPE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0003
    {	TARGET_UNKNOWN	= 0x1,
	TARGET_INITIALIZING	= ( TARGET_UNKNOWN + 1 ) ,
	TARGET_RUNNING	= ( TARGET_INITIALIZING + 1 ) ,
	TARGET_DOWN	= ( TARGET_RUNNING + 1 ) ,
	TARGET_HIBERNATED	= ( TARGET_DOWN + 1 ) ,
	TARGET_CHECKED_OUT	= ( TARGET_HIBERNATED + 1 ) ,
	TARGET_STOPPED	= ( TARGET_CHECKED_OUT + 1 ) 
    } 	TARGET_STATE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0004
    {	TARGET_CHANGE_UNSPEC	= 0x1,
	TARGET_EXTERNALIP_CHANGED	= 0x2,
	TARGET_INTERNALIP_CHANGED	= 0x4,
	TARGET_JOINED	= 0x8,
	TARGET_REMOVED	= 0x10,
	TARGET_STATE_CHANGED	= 0x20,
	TARGET_IDLE	= 0x40
    } 	TARGET_CHANGE_TYPE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0005
    {	UNKNOWN	= 0,
	FARM	= 1,
	NONFARM	= 2
    } 	TARGET_TYPE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0006
    {	CLIENT_MESSAGE_CONNECTION_INVALID	= 0,
	CLIENT_MESSAGE_CONNECTION_STATUS	= ( CLIENT_MESSAGE_CONNECTION_INVALID + 1 ) ,
	CLIENT_MESSAGE_CONNECTION_ERROR	= ( CLIENT_MESSAGE_CONNECTION_STATUS + 1 ) 
    } 	CLIENT_MESSAGE_TYPE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0007
    {	CONNECTION_REQUEST_INVALID	= 0,
	CONNECTION_REQUEST_PENDING	= ( CONNECTION_REQUEST_INVALID + 1 ) ,
	CONNECTION_REQUEST_FAILED	= ( CONNECTION_REQUEST_PENDING + 1 ) ,
	CONNECTION_REQUEST_TIMEDOUT	= ( CONNECTION_REQUEST_FAILED + 1 ) ,
	CONNECTION_REQUEST_SUCCEEDED	= ( CONNECTION_REQUEST_TIMEDOUT + 1 ) ,
	CONNECTION_REQUEST_CANCELLED	= ( CONNECTION_REQUEST_SUCCEEDED + 1 ) 
    } 	CONNECTION_CHANGE_NOTIFICATION;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0008
    {	UNKNOWN_PLUGIN	= 0,
	POLICY_PLUGIN	= 0x1,
	RESOURCE_PLUGIN	= 0x2,
	LOAD_BALANCING_PLUGIN	= 0x4,
	PLACEMENT_PLUGIN	= 0x8,
	ORCHESTRATION_PLUGIN	= 0x10
    } 	PLUGIN_TYPE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0009
    {	STATE_INVALID	= -1,
	STATE_ACTIVE	= ( STATE_INVALID + 1 ) ,
	STATE_CONNECTED	= ( STATE_ACTIVE + 1 ) ,
	STATE_CONNECTQUERY	= ( STATE_CONNECTED + 1 ) ,
	STATE_SHADOW	= ( STATE_CONNECTQUERY + 1 ) ,
	STATE_DISCONNECTED	= ( STATE_SHADOW + 1 ) ,
	STATE_IDLE	= ( STATE_DISCONNECTED + 1 ) ,
	STATE_LISTEN	= ( STATE_IDLE + 1 ) ,
	STATE_RESET	= ( STATE_LISTEN + 1 ) ,
	STATE_DOWN	= ( STATE_RESET + 1 ) ,
	STATE_INIT	= ( STATE_DOWN + 1 ) 
    } 	TSSESSION_STATE;

typedef /* [public][v1_enum] */ 
enum __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0010
    {	OWNER_UNKNOWN	= 0,
	OWNER_MS_TS_PLUGIN	= 0x1,
	OWNER_MS_VM_PLUGIN	= 0x2
    } 	TARGET_OWNER;

typedef /* [public] */ struct __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0011
    {
    DWORD HorizontalResolution;
    DWORD VerticalResolution;
    DWORD ColorDepth;
    } 	CLIENT_DISPLAY;

typedef struct __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0011 *PCLIENT_DISPLAY;

typedef /* [public] */ struct __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0012
    {
    byte ServerAddressB[ 16 ];
    TSSD_AddrV46Type AddressType;
    USHORT PortNumber;
    ULONG AddressScope;
    } 	TSSD_ConnectionPoint;

typedef struct __MIDL___MIDL_itf_sessdirpublictypes_0000_0000_0012 *PTSSD_ConnectionPoint;



extern RPC_IF_HANDLE __MIDL_itf_sessdirpublictypes_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_sessdirpublictypes_0000_0000_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


