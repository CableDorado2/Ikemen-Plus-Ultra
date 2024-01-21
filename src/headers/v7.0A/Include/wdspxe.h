/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    wdspxe.h

Abstract:

    Contains functions used to write Providers for WDSPXE Server

--*/

#ifndef __WDSPXE_H__
#define __WDSPXE_H__

#ifdef __cplusplus
extern "C" {
#endif

//
// Calling convention for WDSPXE APIs.
//
#define PXEAPI __stdcall

//
// PXE_REG_INDEX
//
typedef ULONG PXE_REG_INDEX;

#define PXE_REG_INDEX_TOP           (0)
#define PXE_REG_INDEX_BOTTOM        0xFFFFFFFF

//
// PXE_PROVIDER
//
typedef __struct_bcount(uSizeOfStruct) struct tagPXE_PROVIDER
{
    ULONG uSizeOfStruct;
    LPWSTR pwszName;
    LPWSTR pwszFilePath;
    BOOL bIsCritical;
    ULONG uIndex;
} PXE_PROVIDER, *PPXE_PROVIDER;

//
// PXE_CALLBACK_TYPE
//
typedef ULONG PXE_CALLBACK_TYPE;

#define PXE_CALLBACK_RECV_REQUEST       0
#define PXE_CALLBACK_SHUTDOWN           1
#define PXE_CALLBACK_SERVICE_CONTROL    2

#define PXE_CALLBACK_MAX                3

//
// PXE_GSI_TYPE
//
typedef ULONG PXE_GSI_TYPE;

#define PXE_GSI_TRACE_ENABLED           1

//
// PXE_ADDRESS
//
#define PXE_MAX_ADDRESS         16

#define PXE_ADDR_BROADCAST      0x0001
#define PXE_ADDR_USE_PORT       0x0002
#define PXE_ADDR_USE_ADDR       0x0004
#define PXE_ADDR_USE_DHCP_RULES 0x0008

typedef struct tagPXE_ADDRESS
{
    ULONG uFlags;
    
    union
    {
        BYTE bAddress[PXE_MAX_ADDRESS];
        ULONG uIpAddress;
    };
    
    ULONG uAddrLen;
    USHORT uPort;
} PXE_ADDRESS, *PPXE_ADDRESS;

//
// PXE_BOOT_ACTION
//
typedef ULONG PXE_BOOT_ACTION;

#define PXE_BA_NBP              1
#define PXE_BA_CUSTOM           2
#define PXE_BA_IGNORE           3
#define PXE_BA_REJECTED         4

//
// PXE_SEVERITY
//
typedef ULONG PXE_SEVERITY;

#define PXE_TRACE_VERBOSE           0x00010000
#define PXE_TRACE_INFO              0x00020000
#define PXE_TRACE_WARNING           0x00040000
#define PXE_TRACE_ERROR             0x00080000
#define PXE_TRACE_FATAL             0x00100000

//
// PXE_PROVIDER_ATTRIBUTE
//
typedef ULONG PXE_PROVIDER_ATTRIBUTE;

#define PXE_PROV_ATTR_FILTER        0

#define PXE_PROV_FILTER_ALL         0x0000
#define PXE_PROV_FILTER_DHCP_ONLY   0x0001
#define PXE_PROV_FILTER_PXE_ONLY    0x0002
//
// Provider Registration and Enumeration APIs
//
DWORD
PXEAPI
PxeProviderRegister(
    __in LPCWSTR pszProviderName,
    __in LPCWSTR pszModulePath,
    __in PXE_REG_INDEX Index,
    __in BOOL bIsCritical,
    __out_opt PHKEY phProviderKey
);

DWORD
PXEAPI
PxeProviderUnRegister(
    __in LPCWSTR pszProviderName
);

DWORD
PXEAPI
PxeProviderQueryIndex(
    __in LPCWSTR pszProviderName,
    __out PULONG puIndex
);

DWORD
PXEAPI
PxeProviderEnumFirst(
    __out HANDLE *phEnum
);

DWORD
PXEAPI
PxeProviderEnumNext(
    __in HANDLE hEnum,
    __out PPXE_PROVIDER *ppProvider
);

DWORD
PXEAPI
PxeProviderEnumClose(
    __in HANDLE hEnum
);

DWORD
PxeProviderFreeInfo(
    __in PPXE_PROVIDER pProvider
);    
    
//
// Callback Registration
//
DWORD
PXEAPI
PxeRegisterCallback(
    __in HANDLE hProvider,
    __in PXE_CALLBACK_TYPE CallbackType,
    __in PVOID pCallbackFunction,
    __in_opt PVOID pContext
);

//
// UDP Send/Boot Action
//
DWORD
PXEAPI
PxeSendReply(
    __in HANDLE hClientRequest,
    __in_bcount(uPacketLen) PVOID pPacket,
    __in ULONG uPacketLen,
    __in PXE_ADDRESS *pAddress
);

//
// Notify of Async Processing
//
DWORD
PXEAPI
PxeAsyncRecvDone(
    __in HANDLE hClientRequest,
    __in PXE_BOOT_ACTION Action
);

//
// Trace
//

DWORD
PXEAPI
PxeTrace(
    __in HANDLE hProvider,
    __in PXE_SEVERITY Severity,
    __in LPCWSTR pszFormat,
    ...
); 

DWORD
PXEAPI
PxeTraceV(
    __in HANDLE hProvider,
    __in PXE_SEVERITY Severity,
    __in LPCWSTR pszFormat,
    __in va_list Params
); 

//
// Packet Allocation
//
PVOID
PXEAPI
PxePacketAllocate(
    __in HANDLE hProvider,
    __in HANDLE hClientRequest,
    __in ULONG uSize
);

DWORD
PXEAPI
PxePacketFree(
    __in HANDLE hProvider,
    __in HANDLE hClientRequest,
    __in PVOID pPacket
);

//
// Provider Attributes
//
DWORD
PXEAPI
PxeProviderSetAttribute(
    __in HANDLE hProvider,
    __in PXE_PROVIDER_ATTRIBUTE Attribute,
    __in_bcount(uParamLen) PVOID pParameterBuffer,
    __in ULONG uParamLen
);

//
// Dhcp Functions
//
DWORD
PXEAPI
PxeDhcpInitialize(
    __in_bcount(uRecvPacketLen) PVOID pRecvPacket,
    __in ULONG uRecvPacketLen,
    __inout_bcount(uMaxReplyPacketLen) PVOID pReplyPacket,
    __in ULONG uMaxReplyPacketLen,
    __out PULONG puReplyPacketLen
);

DWORD
PXEAPI
PxeDhcpAppendOption(
    __inout_bcount(uMaxReplyPacketLen) PVOID pReplyPacket,
    __in ULONG uMaxReplyPacketLen,
    __inout PULONG puReplyPacketLen,
    __in BYTE bOption,
    __in BYTE bOptionLen,
    __in_bcount_opt(bOptionLen) PVOID pValue
);

DWORD
PXEAPI
PxeDhcpAppendOptionRaw(
    __inout_bcount(uMaxReplyPacketLen) PVOID pReplyPacket,
    __in ULONG uMaxReplyPacketLen,
    __inout PULONG puReplyPacketLen,
    __in USHORT uBufferLen,
    __in_bcount(uBufferLen) PVOID pBuffer
);

DWORD
PXEAPI
PxeDhcpIsValid(
    __in_bcount(uPacketLen) PVOID pPacket,
    __in ULONG uPacketLen,
    __in BOOL bRequestPacket,
    __out_opt PBOOL pbPxeOptionPresent
);

DWORD
PXEAPI
PxeDhcpGetOptionValue(
    __in_bcount(uPacketLen) PVOID pPacket,
    __in ULONG uPacketLen,
    __in ULONG uInstance,
    __in BYTE bOption,
    __out PBYTE pbOptionLen,
    __out PVOID *ppOptionValue
);

DWORD
PXEAPI
PxeDhcpGetVendorOptionValue(
    __in_bcount(uPacketLen) PVOID pPacket,
    __in ULONG uPacketLen,
    __in BYTE bOption,
    __in ULONG uInstance,
    __out PBYTE pbOptionLen,
    __out PVOID *ppOptionValue
);

//
// Server Information
//
DWORD
PXEAPI
PxeGetServerInfo(
    __in PXE_GSI_TYPE uInfoType,
    __out_bcount(uBufferLen) PVOID pBuffer,
    __in ULONG uBufferLen
);

//
// Ports for WDS PXE Server
//
#define     PXE_DHCP_SERVER_PORT            67
#define     PXE_DHCP_CLIENT_PORT            68
#define     PXE_SERVER_PORT                 4011

//
// PXE_DHCP_MESSAGE
//
#define     PXE_DHCP_FILE_SIZE              128
#define     PXE_DHCP_SERVER_SIZE            64
#define     PXE_DHCP_HWAADR_SIZE            16

#define     PXE_DHCP_MAGIC_COOKIE_SIZE      4
#define     PXEDHCP_MAGIC_COOKIE            (ULONG)0x63538263

//
// PXE_DHCP_OPTION
//
typedef struct tagPXE_DHCP_OPTION 
{
    BYTE OptionType;
    BYTE OptionLength;
    BYTE OptionValue[1];
} PXE_DHCP_OPTION, *PPXE_DHCP_OPTION;

typedef struct tagPXE_DHCP_MESSAGE
{
    BYTE Operation;
    BYTE HardwareAddressType;
    BYTE HardwareAddressLength;
    BYTE HopCount;
    DWORD TransactionID;
    WORD SecondsSinceBoot;
    WORD Reserved;
    ULONG ClientIpAddress;
    ULONG YourIpAddress;
    ULONG BootstrapServerAddress;
    ULONG RelayAgentIpAddress;
    BYTE HardwareAddress[PXE_DHCP_HWAADR_SIZE];
    BYTE HostName[PXE_DHCP_SERVER_SIZE];
    BYTE BootFileName[PXE_DHCP_FILE_SIZE];
    
    union
    {
        BYTE bMagicCookie[PXE_DHCP_MAGIC_COOKIE_SIZE];
        ULONG uMagicCookie;
    };

    PXE_DHCP_OPTION Option;
} PXE_DHCP_MESSAGE, *PPXE_DHCP_MESSAGE;

#ifdef __cplusplus
}
#endif

#endif


