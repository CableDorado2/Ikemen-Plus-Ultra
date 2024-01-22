/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:   dhcpsapi.h


--*/


#ifndef _DHCPSAPI_
#define _DHCPSAPI_

#pragma once

#if defined(MIDL_PASS)
#define LPWSTR [string] wchar_t *
#endif


#if (_MSC_VER >= 800)
#define DHCP_API_FUNCTION    __stdcall
#else
#define DHCP_API_FUNCTION
#endif


#ifdef __cplusplus
#define DHCP_CONST   const
extern "C" {
#else
#define DHCP_CONST
#endif // __cplusplus


#ifndef _DHCP_

typedef DWORD DHCP_IP_ADDRESS, *PDHCP_IP_ADDRESS, *LPDHCP_IP_ADDRESS;
typedef DWORD DHCP_OPTION_ID;

typedef struct _DATE_TIME {
    DWORD dwLowDateTime;
    DWORD dwHighDateTime;
} DATE_TIME,*PDATE_TIME, *LPDATE_TIME;


#endif // _DHCP_

typedef DWORD DHCP_IP_MASK;
typedef DWORD DHCP_RESUME_HANDLE;


typedef struct _DHCP_IP_RANGE {
    DHCP_IP_ADDRESS StartAddress;
    DHCP_IP_ADDRESS EndAddress;
} DHCP_IP_RANGE, *LPDHCP_IP_RANGE;

typedef struct _DHCP_BINARY_DATA {
    DWORD  DataLength;

#if defined(MIDL_PASS)
    [size_is(DataLength)]
#endif // MIDL_PASS
    __field_bcount(DataLength) BYTE *Data;

} DHCP_BINARY_DATA, *LPDHCP_BINARY_DATA;

typedef DHCP_BINARY_DATA DHCP_CLIENT_UID;

typedef struct _DHCP_HOST_INFO {
    DHCP_IP_ADDRESS IpAddress;      // minimum information always available
    LPWSTR          NetBiosName;    // optional information
    LPWSTR          HostName;       // optional information
} DHCP_HOST_INFO, *LPDHCP_HOST_INFO;


typedef enum _DHCP_FORCE_FLAG {
    DhcpFullForce,
    DhcpNoForce
} DHCP_FORCE_FLAG, *LPDHCP_FORCE_FLAG;


typedef struct _DWORD_DWORD {
    DWORD DWord1;
    DWORD DWord2;
} DWORD_DWORD, *LPDWORD_DWORD;


typedef enum _DHCP_SUBNET_STATE {
    DhcpSubnetEnabled = 0,
    DhcpSubnetDisabled,
    DhcpSubnetEnabledSwitched,
    DhcpSubnetDisabledSwitched,
    DhcpSubnetInvalidState
} DHCP_SUBNET_STATE, *LPDHCP_SUBNET_STATE;

//
// Subnet related data structures.
//

typedef struct _DHCP_SUBNET_INFO {
    DHCP_IP_ADDRESS   SubnetAddress;
    DHCP_IP_MASK      SubnetMask;
    LPWSTR            SubnetName;
    LPWSTR            SubnetComment;
    DHCP_HOST_INFO    PrimaryHost;
    DHCP_SUBNET_STATE SubnetState; 
} DHCP_SUBNET_INFO, *LPDHCP_SUBNET_INFO;

#define DHCP_SUBNET_INFO_VQ_FLAG_QUARANTINE    (1 << 0)        // Bit 0

typedef struct _DHCP_SUBNET_INFO_VQ {
    DHCP_IP_ADDRESS   SubnetAddress;
    DHCP_IP_MASK      SubnetMask;
    LPWSTR            SubnetName;
    LPWSTR            SubnetComment;
    DHCP_HOST_INFO    PrimaryHost;
    DHCP_SUBNET_STATE SubnetState;
    DWORD             QuarantineOn;
    DWORD             Reserved1;
    DWORD             Reserved2;
    INT64             Reserved3;
    INT64             Reserved4;
} DHCP_SUBNET_INFO_VQ, *LPDHCP_SUBNET_INFO_VQ;


typedef struct _DHCP_IP_ARRAY {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    __field_ecount(NumElements) LPDHCP_IP_ADDRESS Elements; //array
} DHCP_IP_ARRAY, *LPDHCP_IP_ARRAY;

typedef struct _DHCP_IP_CLUSTER {
    DHCP_IP_ADDRESS ClusterAddress; // First IP address of the cluster.
    DWORD           ClusterMask;    // Cluster usage mask, 0xFFFFFFFF
                                    //  indicates the cluster is fully used.
} DHCP_IP_CLUSTER, *LPDHCP_IP_CLUSTER;

typedef struct _DHCP_IP_RESERVATION {
    DHCP_IP_ADDRESS ReservedIpAddress;
    DHCP_CLIENT_UID *ReservedForClient;
} DHCP_IP_RESERVATION, *LPDHCP_IP_RESERVATION;

typedef enum _DHCP_SUBNET_ELEMENT_TYPE_V5 {
    DhcpIpRanges,
    DhcpSecondaryHosts,
    DhcpReservedIps,
    DhcpExcludedIpRanges,
    DhcpIpUsedClusters,                     
    DhcpIpRangesDhcpOnly,
    DhcpIpRangesDhcpBootp,
    DhcpIpRangesBootpOnly,
} DHCP_SUBNET_ELEMENT_TYPE, *LPDHCP_SUBNET_ELEMENT_TYPE;

#define ELEMENT_MASK(E) ((((E) <= DhcpIpRangesBootpOnly) && (DhcpIpRangesDhcpOnly <= (E)))?(0):(E))

typedef struct _DHCP_SUBNET_ELEMENT_DATA {
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
#if defined(MIDL_PASS)
    [switch_is(ELEMENT_MASK(ElementType)), switch_type(DHCP_SUBNET_ELEMENT_TYPE)]
    union _DHCP_SUBNET_ELEMENT_UNION {
        [case(DhcpIpRanges)]         DHCP_IP_RANGE       *IpRange;
        [case(DhcpSecondaryHosts)]   DHCP_HOST_INFO      *SecondaryHost;
        [case(DhcpReservedIps)]      DHCP_IP_RESERVATION *ReservedIp;
        [case(DhcpExcludedIpRanges)] DHCP_IP_RANGE       *ExcludeIpRange;
        [case(DhcpIpUsedClusters)]   DHCP_IP_CLUSTER     *IpUsedCluster;
    } Element;
#else
    union _DHCP_SUBNET_ELEMENT_UNION {
        DHCP_IP_RANGE       *IpRange;
        DHCP_HOST_INFO      *SecondaryHost;
        DHCP_IP_RESERVATION *ReservedIp;
        DHCP_IP_RANGE       *ExcludeIpRange;
        DHCP_IP_CLUSTER     *IpUsedCluster;
    } Element;
#endif // MIDL_PASS
} DHCP_SUBNET_ELEMENT_DATA, *LPDHCP_SUBNET_ELEMENT_DATA;

#if !defined(MIDL_PASS)
typedef union _DHCP_SUBNET_ELEMENT_UNION
    DHCP_SUBNET_ELEMENT_UNION, *LPDHCP_SUBNET_ELEMENT_UNION;
#endif

typedef struct _DHCP_SUBNET_ELEMENT_INFO_ARRAY {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_SUBNET_ELEMENT_DATA Elements; //array
} DHCP_SUBNET_ELEMENT_INFO_ARRAY, *LPDHCP_SUBNET_ELEMENT_INFO_ARRAY;

typedef struct _DHCP_IPV6_ADDRESS {
	ULONGLONG HighOrderBits;
	ULONGLONG LowOrderBits;
} DHCP_IPV6_ADDRESS, *LPDHCP_IPV6_ADDRESS, *PDHCP_IPV6_ADDRESS;

typedef DHCP_IPV6_ADDRESS DHCP_RESUME_IPV6_HANDLE;

//
// DHCP Filter related data structures.
//

#define MAX_PATTERN_LENGTH      255
#define MAC_ADDRESS_LENGTH      6
#define HWTYPE_ETHERNET_10MB    1

typedef enum _DHCP_FILTER_LIST_TYPE {
    Deny,
    Allow
} DHCP_FILTER_LIST_TYPE, *LPDHCP_FILTER_LIST_TYPE;

typedef struct _DHCP_ADDR_PATTERN {
    BOOL MatchHWType;
    BYTE HWType;
    BOOL IsWildcard;
    BYTE Length;
    BYTE Pattern[MAX_PATTERN_LENGTH];       //  Variable Length address/pattern
} DHCP_ADDR_PATTERN, *LPDHCP_ADDR_PATTERN;

typedef struct _DHCP_FILTER_ADD_INFOV4 {
    DHCP_ADDR_PATTERN     AddrPatt;         // Contains address/pattern
    LPWSTR                Comment;          // Comment associated with address/pattern
    DHCP_FILTER_LIST_TYPE ListType;         // Enum that specifies either allow or deny
} DHCP_FILTER_ADD_INFO, *LPDHCP_FILTER_ADD_INFO;

typedef struct _DHCP_FILTER_GLOBAL_INFO {
    BOOL EnforceAllowList;
    BOOL EnforceDenyList;
} DHCP_FILTER_GLOBAL_INFO, *LPDHCP_FILTER_GLOBAL_INFO;

typedef struct _DHCP_FILTER_RECORD {
    DHCP_ADDR_PATTERN AddrPatt;                 // Contains MAC address/pattern and Mask
    LPWSTR            Comment;                  // Comment associated with MAC address/pattern
} DHCP_FILTER_RECORD, *LPDHCP_FILTER_RECORD;

typedef struct _DHCP_FILTER_ENUM_INFO {
    DWORD NumElements;
#if defined( MIDL_PASS )
    [ size_is( NumElements ) ]
#endif;
    __field_ecount(NumElements) LPDHCP_FILTER_RECORD pEnumRecords;  
} DHCP_FILTER_ENUM_INFO, *LPDHCP_FILTER_ENUM_INFO;

//
// DHCP Options related data structures.
//

typedef enum _DHCP_OPTION_DATA_TYPE {
    DhcpByteOption,
    DhcpWordOption,
    DhcpDWordOption,
    DhcpDWordDWordOption,
    DhcpIpAddressOption,
    DhcpStringDataOption,
    DhcpBinaryDataOption,
    DhcpEncapsulatedDataOption,
    DhcpIpv6AddressOption
} DHCP_OPTION_DATA_TYPE, *LPDHCP_OPTION_DATA_TYPE;


typedef struct _DHCP_OPTION_DATA_ELEMENT {
    DHCP_OPTION_DATA_TYPE    OptionType;
#if defined(MIDL_PASS)
    [switch_is(OptionType), switch_type(DHCP_OPTION_DATA_TYPE)]
    union _DHCP_OPTION_ELEMENT_UNION {
        [case(DhcpByteOption)]             BYTE             ByteOption;
        [case(DhcpWordOption)]             WORD             WordOption;
        [case(DhcpDWordOption)]            DWORD            DWordOption;
        [case(DhcpDWordDWordOption)]       DWORD_DWORD      DWordDWordOption;
        [case(DhcpIpAddressOption)]        DHCP_IP_ADDRESS  IpAddressOption;
        [case(DhcpStringDataOption)]       LPWSTR           StringDataOption;
        [case(DhcpBinaryDataOption)]       DHCP_BINARY_DATA BinaryDataOption;
        [case(DhcpEncapsulatedDataOption)] DHCP_BINARY_DATA EncapsulatedDataOption;
        [case(DhcpIpv6AddressOption)] LPWSTR Ipv6AddressDataOption;
    } Element;
#else
    union _DHCP_OPTION_ELEMENT_UNION {
        BYTE             ByteOption;
        WORD             WordOption;
        DWORD            DWordOption;
        DWORD_DWORD      DWordDWordOption;
        DHCP_IP_ADDRESS  IpAddressOption;
        LPWSTR           StringDataOption;
        DHCP_BINARY_DATA BinaryDataOption;
        DHCP_BINARY_DATA EncapsulatedDataOption;
        LPWSTR Ipv6AddressDataOption;	
                
    } Element;
#endif // MIDL_PASS
} DHCP_OPTION_DATA_ELEMENT, *LPDHCP_OPTION_DATA_ELEMENT;

#if !defined(MIDL_PASS)
typedef union _DHCP_OPTION_ELEMENT_UNION
    DHCP_OPTION_ELEMENT_UNION, *LPDHCP_OPTION_ELEMENT_UNION;
#endif

typedef struct _DHCP_OPTION_DATA {
    DWORD NumElements; // number of option elements in the pointed array
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    __field_ecount(NumElements) LPDHCP_OPTION_DATA_ELEMENT Elements; //array
} DHCP_OPTION_DATA, *LPDHCP_OPTION_DATA;

typedef enum _DHCP_OPTION_TYPE {
    DhcpUnaryElementTypeOption,
    DhcpArrayTypeOption
} DHCP_OPTION_TYPE, *LPDHCP_OPTION_TYPE;

typedef struct _DHCP_OPTION {
    DHCP_OPTION_ID   OptionID;
    LPWSTR           OptionName;
    LPWSTR           OptionComment;
    DHCP_OPTION_DATA DefaultValue;
    DHCP_OPTION_TYPE OptionType;
} DHCP_OPTION, *LPDHCP_OPTION;

typedef struct _DHCP_OPTION_ARRAY {
    DWORD NumElements; // number of options in the pointed array
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_OPTION Options;  // array
} DHCP_OPTION_ARRAY, *LPDHCP_OPTION_ARRAY;

typedef struct _DHCP_OPTION_VALUE {
    DHCP_OPTION_ID   OptionID;
    DHCP_OPTION_DATA Value;
} DHCP_OPTION_VALUE, *LPDHCP_OPTION_VALUE;

typedef struct _DHCP_OPTION_VALUE_ARRAY {
    DWORD NumElements; // number of options in the pointed array
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_OPTION_VALUE Values;  // array
} DHCP_OPTION_VALUE_ARRAY, *LPDHCP_OPTION_VALUE_ARRAY;

typedef enum _DHCP_OPTION_SCOPE_TYPE {
    DhcpDefaultOptions,
    DhcpGlobalOptions,
    DhcpSubnetOptions,
    DhcpReservedOptions,
    DhcpMScopeOptions
} DHCP_OPTION_SCOPE_TYPE, *LPDHCP_OPTION_SCOPE_TYPE;

typedef struct _DHCP_RESERVED_SCOPE {
    DHCP_IP_ADDRESS ReservedIpAddress;
    DHCP_IP_ADDRESS ReservedIpSubnetAddress;
} DHCP_RESERVED_SCOPE, *LPDHCP_RESERVED_SCOPE;

typedef struct _DHCP_OPTION_SCOPE_INFO {
    DHCP_OPTION_SCOPE_TYPE ScopeType;
#if defined(MIDL_PASS)
    [switch_is(ScopeType), switch_type(DHCP_OPTION_SCOPE_TYPE)]
    union _DHCP_OPTION_SCOPE_UNION {
        [case(DhcpDefaultOptions)] ; 
        [case(DhcpGlobalOptions)] ;  
        [case(DhcpSubnetOptions)]   DHCP_IP_ADDRESS     SubnetScopeInfo;
        [case(DhcpReservedOptions)] DHCP_RESERVED_SCOPE ReservedScopeInfo;
        [case(DhcpMScopeOptions)]   LPWSTR              MScopeInfo;
    } ScopeInfo;
#else
    union _DHCP_OPTION_SCOPE_UNION {
        PVOID               DefaultScopeInfo; // must be NULL
        PVOID               GlobalScopeInfo;  // must be NULL
        DHCP_IP_ADDRESS     SubnetScopeInfo;
        DHCP_RESERVED_SCOPE ReservedScopeInfo;
        LPWSTR              MScopeInfo;
    } ScopeInfo;
#endif // MIDL_PASS
} DHCP_OPTION_SCOPE_INFO, *LPDHCP_OPTION_SCOPE_INFO;

typedef enum _DHCP_OPTION_SCOPE_TYPE6 {
    DhcpDefaultOptions6,
    DhcpScopeOptions6,
    DhcpReservedOptions6,
    DhcpGlobalOptions6
} DHCP_OPTION_SCOPE_TYPE6, *LPDHCP_OPTION_SCOPE_TYPE6;

typedef struct _DHCP_RESERVED_SCOPE6 {
    DHCP_IPV6_ADDRESS ReservedIpAddress;
    DHCP_IPV6_ADDRESS ReservedIpSubnetAddress;
} DHCP_RESERVED_SCOPE6, *LPDHCP_RESERVED_SCOPE6;

typedef struct _DHCP_OPTION_SCOPE_INFO6 {
    DHCP_OPTION_SCOPE_TYPE6 ScopeType;
#if defined(MIDL_PASS)
    [switch_is(ScopeType), switch_type(DHCP_OPTION_SCOPE_TYPE6)]
    union _DHCP_OPTION_SCOPE_UNION6 {
        [case(DhcpDefaultOptions6)] ; 
        [case(DhcpScopeOptions6)]    DHCP_IPV6_ADDRESS    SubnetScopeInfo;
        [case(DhcpReservedOptions6)] DHCP_RESERVED_SCOPE6 ReservedScopeInfo;
        [case(DhcpGlobalOptions6)];
    } ScopeInfo;
#else
    union _DHCP_OPTION_SCOPE_UNION6 {
        PVOID                 DefaultScopeInfo; // must be NULL
        DHCP_IPV6_ADDRESS     SubnetScopeInfo;
        DHCP_RESERVED_SCOPE6  ReservedScopeInfo;
    } ScopeInfo;
#endif // MIDL_PASS
} DHCP_OPTION_SCOPE_INFO6, *LPDHCP_OPTION_SCOPE_INFO6;

#if !defined(MIDL_PASS)
typedef union _DHCP_OPTION_SCOPE_UNION6
    DHCP_OPTION_SCOPE_UNION6, *LPDHCP_OPTION_SCOPE_UNION6;
#endif

typedef struct _DHCP_OPTION_LIST {
    DWORD NumOptions;
#if defined(MIDL_PASS)
    [size_is(NumOptions)]
#endif // MIDL_PASS
    DHCP_OPTION_VALUE *Options;     // array
} DHCP_OPTION_LIST, *LPDHCP_OPTION_LIST;

//
// DHCP Client information data structures
//

typedef struct _DHCP_CLIENT_INFO {
    DHCP_IP_ADDRESS ClientIpAddress;      // currently assigned IP address.
    DHCP_IP_MASK    SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR          ClientName;                  
    LPWSTR          ClientComment;
    DATE_TIME       ClientLeaseExpires;   // UTC time in FILE_TIME format.
    DHCP_HOST_INFO  OwnerHost;            // host that distributed this IP address.
} DHCP_CLIENT_INFO, *LPDHCP_CLIENT_INFO;

typedef struct _DHCP_CLIENT_INFO_ARRAY {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_CLIENT_INFO *Clients; // array of pointers
} DHCP_CLIENT_INFO_ARRAY, *LPDHCP_CLIENT_INFO_ARRAY;

typedef enum _QuarantineStatus
{
   NOQUARANTINE = 0,
   RESTRICTEDACCESS,
   DROPPACKET,
   PROBATION,
   EXEMPT,
   DEFAULTQUARSETTING,
   NOQUARINFO
}QuarantineStatus;

typedef struct _DHCP_CLIENT_INFO_VQ {
    DHCP_IP_ADDRESS  ClientIpAddress;    // currently assigned IP address.
    DHCP_IP_MASK     SubnetMask;
    DHCP_CLIENT_UID  ClientHardwareAddress;
    LPWSTR           ClientName;                  
    LPWSTR           ClientComment;
    DATE_TIME        ClientLeaseExpires;       // UTC time in FILE_TIME format.
    DHCP_HOST_INFO   OwnerHost;           // host that distributed this IP address.
    BYTE             bClientType;          
    BYTE             AddressState;        
    QuarantineStatus Status;
    DATE_TIME        ProbationEnds;
    BOOL             QuarantineCapable;
} DHCP_CLIENT_INFO_VQ, *LPDHCP_CLIENT_INFO_VQ;

typedef struct _DHCP_CLIENT_INFO_ARRAY_VQ {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_CLIENT_INFO_VQ *Clients; // array of pointers
} DHCP_CLIENT_INFO_ARRAY_VQ, *LPDHCP_CLIENT_INFO_ARRAY_VQ;



//When the client's MAC Address doesn't match any configured filters
#define FILTER_STATUS_NONE                          0x00000001

//When the client's MAC Address matches an allow filter fully
#define FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST      0x00000002

//When the client's MAC Address matches a deny filter fully
#define FILTER_STATUS_FULL_MATCH_IN_DENY_LIST       0x00000004

//When the client's MAC Address has a wildcard match in the allow list
#define FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST  0x00000008

//When the client's MAC Address has a wildcard match in the deny list
#define FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST   0x00000010


typedef struct _DHCP_CLIENT_FILTER_STATUS_INFO {
    DHCP_IP_ADDRESS   ClientIpAddress;
    DHCP_IP_MASK      SubnetMask;
    DHCP_CLIENT_UID   ClientHardwareAddress;
    LPWSTR            ClientName;
    LPWSTR            ClientComment;
    DATE_TIME         ClientLeaseExpires;
    DHCP_HOST_INFO    OwnerHost;
    BYTE              bClientType;          
    BYTE              AddressState;         
    QuarantineStatus  Status;
    DATE_TIME         ProbationEnds;
    BOOL              QuarantineCapable;
    DWORD             FilterStatus;
} DHCP_CLIENT_FILTER_STATUS_INFO, *LPDHCP_CLIENT_FILTER_STATUS_INFO;

typedef struct _DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_CLIENT_FILTER_STATUS_INFO *Clients; // array of pointers
} DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY, *LPDHCP_CLIENT_FILTER_STATUS_INFO_ARRAY;

typedef enum _DHCP_CLIENT_SEARCH_TYPE {
    DhcpClientIpAddress,
    DhcpClientHardwareAddress,
    DhcpClientName
} DHCP_SEARCH_INFO_TYPE, *LPDHCP_SEARCH_INFO_TYPE;

typedef struct _DHCP_CLIENT_SEARCH_INFO {
    DHCP_SEARCH_INFO_TYPE SearchType;
#if defined(MIDL_PASS)
    [switch_is(SearchType), switch_type(DHCP_SEARCH_INFO_TYPE)]
    union _DHCP_CLIENT_SEARCH_UNION {
        [case(DhcpClientIpAddress)]       DHCP_IP_ADDRESS ClientIpAddress;
        [case(DhcpClientHardwareAddress)] DHCP_CLIENT_UID ClientHardwareAddress;
        [case(DhcpClientName)]            LPWSTR          ClientName;
    } SearchInfo;
#else
    union _DHCP_CLIENT_SEARCH_UNION {
        DHCP_IP_ADDRESS ClientIpAddress;
        DHCP_CLIENT_UID ClientHardwareAddress;
        LPWSTR          ClientName;
    } SearchInfo;
#endif // MIDL_PASS
} DHCP_SEARCH_INFO, *LPDHCP_SEARCH_INFO;


#if !defined(MIDL_PASS)
typedef union _DHCP_CLIENT_SEARCH_UNION
    DHCP_CLIENT_SEARCH_UNION, *LPDHCP_CLIENT_SEARCH_UNION;
#endif // MIDL_PASS

//
// Mib Info structures.
//

typedef struct _SCOPE_MIB_INFO {
    DHCP_IP_ADDRESS Subnet;
    DWORD NumAddressesInuse;
    DWORD NumAddressesFree;
    DWORD NumPendingOffers;
} SCOPE_MIB_INFO, *LPSCOPE_MIB_INFO;

typedef struct _DHCP_MIB_INFO {
    DWORD     Discovers;
    DWORD     Offers;
    DWORD     Requests;
    DWORD     Acks;
    DWORD     Naks;
    DWORD     Declines;
    DWORD     Releases;
    DATE_TIME ServerStartTime;
    DWORD     Scopes;
#if defined(MIDL_PASS)
    [size_is(Scopes)]
#endif // MIDL_PASS
    __field_ecount(Scopes) LPSCOPE_MIB_INFO ScopeInfo; // array.
} DHCP_MIB_INFO, *LPDHCP_MIB_INFO;

//
// Quarantine version of mib structures
//


typedef struct _SCOPE_MIB_INFO_VQ {
    DHCP_IP_ADDRESS Subnet;
    DWORD NumAddressesInuse;
    DWORD NumAddressesFree;
    DWORD NumPendingOffers;
    //
    // Quarantine MIB info
    //
    DWORD QtnNumLeases;
    DWORD QtnPctQtnLeases;
    DWORD QtnProbationLeases;
    DWORD QtnNonQtnLeases;
    DWORD QtnExemptLeases;
    DWORD QtnCapableClients;

} SCOPE_MIB_INFO_VQ, *LPSCOPE_MIB_INFO_VQ;

typedef struct _DHCP_MIB_INFO_VQ {
    DWORD Discovers;
    DWORD Offers;
    DWORD Requests;
    DWORD Acks;
    DWORD Naks;
    DWORD Declines;
    DWORD Releases;
    DATE_TIME ServerStartTime;
    //
    // Quarantine MIB info
    //
    DWORD QtnNumLeases;
    DWORD QtnPctQtnLeases;
    DWORD QtnProbationLeases;
    DWORD QtnNonQtnLeases;
    DWORD QtnExemptLeases;
    DWORD QtnCapableClients;
    DWORD QtnIASErrors;    
    DWORD Scopes;
#if defined(MIDL_PASS)
    [size_is(Scopes)]
#endif // MIDL_PASS
    LPSCOPE_MIB_INFO_VQ ScopeInfo; // array.
    
} DHCP_MIB_INFO_VQ, *LPDHCP_MIB_INFO_VQ;

typedef struct _SCOPE_MIB_INFO_V5 {
    DHCP_IP_ADDRESS Subnet;
    DWORD NumAddressesInuse;
    DWORD NumAddressesFree;
    DWORD NumPendingOffers;   
} SCOPE_MIB_INFO_V5, *LPSCOPE_MIB_INFO_V5;

typedef struct _DHCP_MIB_INFO_V5 {
    DWORD Discovers;
    DWORD Offers;
    DWORD Requests;
    DWORD Acks;
    DWORD Naks;
    DWORD Declines;
    DWORD Releases;
    DATE_TIME ServerStartTime;
    //
    // Quarantine MIB info
    //
    DWORD QtnNumLeases;
    DWORD QtnPctQtnLeases;
    DWORD QtnProbationLeases;
    DWORD QtnNonQtnLeases;
    DWORD QtnExemptLeases;
    DWORD QtnCapableClients;
    DWORD QtnIASErrors;    

    DWORD DelayedOffers;
    DWORD ScopesWithDelayedOffers;
    DWORD Scopes;
#if defined(MIDL_PASS)
    [size_is(Scopes)]
#endif // MIDL_PASS
    __field_ecount(Scopes) LPSCOPE_MIB_INFO_V5 ScopeInfo; // array.
} DHCP_MIB_INFO_V5, *LPDHCP_MIB_INFO_V5;

#define Set_APIProtocolSupport          0x00000001
#define Set_DatabaseName                0x00000002
#define Set_DatabasePath                0x00000004
#define Set_BackupPath                  0x00000008
#define Set_BackupInterval              0x00000010
#define Set_DatabaseLoggingFlag         0x00000020
#define Set_RestoreFlag                 0x00000040
#define Set_DatabaseCleanupInterval     0x00000080
#define Set_DebugFlag                   0x00000100
#define Set_PingRetries                 0x00000200
#define Set_BootFileTable               0x00000400
#define Set_AuditLogState               0x00000800
#define Set_QuarantineON                0x00001000
#define Set_QuarantineDefFail           0x00002000


typedef struct _DHCP_SERVER_CONFIG_INFO {
    DWORD APIProtocolSupport;       // bit map of the protocols supported.
    LPWSTR DatabaseName;            // JET database name.
    LPWSTR DatabasePath;            // JET database path.
    LPWSTR BackupPath;              // Backup path.
    DWORD BackupInterval;           // Backup interval in mins.
    DWORD DatabaseLoggingFlag;      // Boolean database logging flag.
    DWORD RestoreFlag;              // Boolean database restore flag.
    DWORD DatabaseCleanupInterval;  // Database Cleanup Interval in mins.
    DWORD DebugFlag;                // Bit map of server debug flags.
} DHCP_SERVER_CONFIG_INFO, *LPDHCP_SERVER_CONFIG_INFO;

typedef enum _DHCP_SCAN_FLAG {
    DhcpRegistryFix,
    DhcpDatabaseFix
} DHCP_SCAN_FLAG, *LPDHCP_SCAN_FLAG;

typedef struct _DHCP_SCAN_ITEM {
    DHCP_IP_ADDRESS IpAddress;
    DHCP_SCAN_FLAG  ScanFlag;
} DHCP_SCAN_ITEM, *LPDHCP_SCAN_ITEM;

typedef struct _DHCP_SCAN_LIST {
    DWORD NumScanItems;
#if defined(MIDL_PASS)
    [size_is(NumScanItems)]
#endif // MIDL_PASS
        __field_ecount(NumScanItems) DHCP_SCAN_ITEM *ScanItems;     // array
} DHCP_SCAN_LIST, *LPDHCP_SCAN_LIST;

typedef struct _DHCP_CLASS_INFO {
    LPWSTR                         ClassName;
    LPWSTR                         ClassComment;
    DWORD                          ClassDataLength;
    BOOL                           IsVendor;
    DWORD                          Flags;
#if defined(MIDL_PASS)
    [size_is(ClassDataLength)]
#endif // MIDL_PASS
    __field_bcount(ClassDataLength) LPBYTE                         ClassData;
} DHCP_CLASS_INFO, *LPDHCP_CLASS_INFO;

typedef struct _DHCP_CLASS_INFO_ARRAY {
    DWORD                          NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif //MIDL_PASS
    LPDHCP_CLASS_INFO              Classes;
} DHCP_CLASS_INFO_ARRAY, *LPDHCP_CLASS_INFO_ARRAY;


typedef struct _DHCP_CLASS_INFO_V6 {
    LPWSTR                         ClassName;
    LPWSTR                         ClassComment;
    DWORD                          ClassDataLength;
    BOOL                           IsVendor;
    DWORD                          EnterpriseNumber;
    DWORD                          Flags;
#if defined(MIDL_PASS)
    [size_is(ClassDataLength)]
#endif // MIDL_PASS
    __field_bcount(ClassDataLength) LPBYTE                         ClassData;
} DHCP_CLASS_INFO_V6, *LPDHCP_CLASS_INFO_V6;

typedef struct _DHCP_CLASS_INFO_ARRAY_V6 {
    DWORD                          NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif //MIDL_PASS
    LPDHCP_CLASS_INFO_V6              Classes;
} DHCP_CLASS_INFO_ARRAY_V6, *LPDHCP_CLASS_INFO_ARRAY_V6;


typedef struct _DHCP_SERVER_SPECIFIC_STRINGS {
    LPWSTR                         DefaultVendorClassName;
    LPWSTR                         DefaultUserClassName;
} DHCP_SERVER_SPECIFIC_STRINGS, *LPDHCP_SERVER_SPECIFIC_STRINGS;



typedef struct _DHCP_IP_RESERVATION_V4 {
    DHCP_IP_ADDRESS  ReservedIpAddress;
    DHCP_CLIENT_UID *ReservedForClient;
    BYTE             bAllowedClientTypes;
} DHCP_IP_RESERVATION_V4, *LPDHCP_IP_RESERVATION_V4;

typedef struct _DHCP_SUBNET_ELEMENT_DATA_V4 {
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
#if defined(MIDL_PASS)
    [switch_is(ELEMENT_MASK(ElementType)), switch_type(DHCP_SUBNET_ELEMENT_TYPE)]
    union _DHCP_SUBNET_ELEMENT_UNION_V4 {
        [case(DhcpIpRanges)]         DHCP_IP_RANGE          *IpRange;
        [case(DhcpSecondaryHosts)]   DHCP_HOST_INFO         *SecondaryHost;
        [case(DhcpReservedIps)]      DHCP_IP_RESERVATION_V4 *ReservedIp;
        [case(DhcpExcludedIpRanges)] DHCP_IP_RANGE          *ExcludeIpRange;
        [case(DhcpIpUsedClusters)]   DHCP_IP_CLUSTER        *IpUsedCluster;
    } Element;
#else
    union _DHCP_SUBNET_ELEMENT_UNION_V4 {
        DHCP_IP_RANGE          *IpRange;
        DHCP_HOST_INFO         *SecondaryHost;
        DHCP_IP_RESERVATION_V4 *ReservedIp;
        DHCP_IP_RANGE          *ExcludeIpRange;
        DHCP_IP_CLUSTER        *IpUsedCluster;
    } Element;
#endif // MIDL_PASS
} DHCP_SUBNET_ELEMENT_DATA_V4, *LPDHCP_SUBNET_ELEMENT_DATA_V4;

#if !defined(MIDL_PASS)
typedef union _DHCP_SUBNET_ELEMENT_UNION_V4
    DHCP_SUBNET_ELEMENT_UNION_V4, *LPDHCP_SUBNET_ELEMENT_UNION_V4;
#endif

typedef struct _DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4 {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_SUBNET_ELEMENT_DATA_V4 Elements; 
} DHCP_SUBNET_ELEMENT_INFO_ARRAY_V4, *LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V4;



#define CLIENT_TYPE_UNSPECIFIED     0x0 
#define CLIENT_TYPE_DHCP            0x1
#define CLIENT_TYPE_BOOTP           0x2
#define CLIENT_TYPE_BOTH    ( CLIENT_TYPE_DHCP | CLIENT_TYPE_BOOTP )
#define CLIENT_TYPE_RESERVATION_FLAG 0x4
#define CLIENT_TYPE_NONE            0x64



typedef struct _DHCP_CLIENT_INFO_V4 {
    DHCP_IP_ADDRESS ClientIpAddress;    
    DHCP_IP_MASK    SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR          ClientName;                  
    LPWSTR          ClientComment;
    DATE_TIME       ClientLeaseExpires;       
    DHCP_HOST_INFO  OwnerHost;          
    BYTE            bClientType;          
} DHCP_CLIENT_INFO_V4, *LPDHCP_CLIENT_INFO_V4;

typedef struct _DHCP_CLIENT_INFO_ARRAY_V4 {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif 
        LPDHCP_CLIENT_INFO_V4 *Clients; 
} DHCP_CLIENT_INFO_ARRAY_V4, *LPDHCP_CLIENT_INFO_ARRAY_V4;


typedef struct _DHCP_SERVER_CONFIG_INFO_V4 {
    DWORD APIProtocolSupport;       
    LPWSTR DatabaseName;            
    LPWSTR DatabasePath;            
    LPWSTR BackupPath;              
    DWORD BackupInterval;           
    DWORD DatabaseLoggingFlag;      
    DWORD RestoreFlag;              
    DWORD DatabaseCleanupInterval;  
    DWORD DebugFlag;                
    DWORD  dwPingRetries;           // valid range: 0-5 inclusive
    DWORD  cbBootTableString;
#if defined( MIDL_PASS )
    [ size_is( cbBootTableString/2 ) ] // WCHAR SIZE = 2 Bytes 
#endif
    __field_bcount(cbBootTableString) WCHAR  *wszBootTableString;
    BOOL   fAuditLog;               // TRUE to enable audit log

} DHCP_SERVER_CONFIG_INFO_V4, *LPDHCP_SERVER_CONFIG_INFO_V4;


//
// Server Configuration Info with quarantine config.
//

typedef struct _DHCP_SERVER_CONFIG_INFO_VQ {
    DWORD APIProtocolSupport;       // bit map of the protocols supported.
    LPWSTR DatabaseName;            // JET database name.
    LPWSTR DatabasePath;            // JET database path.
    LPWSTR BackupPath;              // Backup path.
    DWORD BackupInterval;           // Backup interval in mins.
    DWORD DatabaseLoggingFlag;      // Boolean database logging flag.
    DWORD RestoreFlag;              // Boolean database restore flag.
    DWORD DatabaseCleanupInterval;  // Database Cleanup Interval in mins.
    DWORD DebugFlag;                // Bit map of server debug flags.
    DWORD  dwPingRetries;           // valid range: 0-5 inclusive
    DWORD  cbBootTableString;
#if defined( MIDL_PASS )
    [ size_is( cbBootTableString/2 ) ] // WCHAR SIZE = 2 Bytes 
#endif
    __field_bcount(cbBootTableString) WCHAR  *wszBootTableString;
    BOOL   fAuditLog;               // TRUE to enable audit log
    BOOL    QuarantineOn;           // Server global Quarantine on/off
    DWORD   QuarDefFail;            // Default behavior when IAS fails
                                    // to be set to QUARANTINE_DEFFAIL_ACCEPT
                                    // or QUARANTINE_DEFFAIL_DROP
    BOOL    QuarRuntimeStatus;      // This tells us whether NAP is actually running 
                                    // on the DHCP server as opposed to the the value 
                                    // which is configured by the admin.
} DHCP_SERVER_CONFIG_INFO_VQ, *LPDHCP_SERVER_CONFIG_INFO_VQ;


typedef struct _DHCP_SERVER_CONFIG_INFO_V6 {
	BOOL 	UnicastFlag;
	BOOL 	RapidCommitFlag;
	DWORD 	PreferredLifetime;
	DWORD 	ValidLifetime;
	DWORD 	T1;
	DWORD 	T2;
	DWORD 	PreferredLifetimeIATA;
	DWORD 	ValidLifetimeIATA;
        BOOL    fAuditLog;
} DHCP_SERVER_CONFIG_INFO_V6, *LPDHCP_SERVER_CONFIG_INFO_V6;

#define Set_UnicastFlag                 0x00000001
#define Set_RapidCommitFlag             0x00000002
#define Set_PreferredLifetime           0x00000004
#define Set_ValidLifetime               0x00000008
#define Set_T1                          0x00000010
#define Set_T2                          0x00000020
#define Set_PreferredLifetimeIATA       0x00000040
#define Set_ValidLifetimeIATA           0x00000080



typedef struct _DHCP_SUPER_SCOPE_TABLE_ENTRY {
    DHCP_IP_ADDRESS SubnetAddress; // subnet address
    DWORD  SuperScopeNumber;       // super scope group number
    DWORD  NextInSuperScope;       // index of the next subnet in the superscope
    LPWSTR SuperScopeName;         // super scope name
                                   // NULL indicates no superscope membership.
} DHCP_SUPER_SCOPE_TABLE_ENTRY, *LPDHCP_SUPER_SCOPE_TABLE_ENTRY;


typedef struct _DHCP_SUPER_SCOPE_TABLE
{
    DWORD cEntries;
#if defined( MIDL_PASS )
    [ size_is( cEntries ) ]
#endif;
    DHCP_SUPER_SCOPE_TABLE_ENTRY *pEntries;
} DHCP_SUPER_SCOPE_TABLE, *LPDHCP_SUPER_SCOPE_TABLE;


typedef struct _DHCP_CLIENT_INFO_V5 {
    DHCP_IP_ADDRESS ClientIpAddress;       // currently assigned IP address.
    DHCP_IP_MASK    SubnetMask;
    DHCP_CLIENT_UID ClientHardwareAddress;
    LPWSTR          ClientName;            // optional.
    LPWSTR          ClientComment;
    DATE_TIME       ClientLeaseExpires;    // UTC time in FILE_TIME format.
    DHCP_HOST_INFO  OwnerHost;             // host that distributed this IP address.
    BYTE            bClientType;         
    BYTE            AddressState;         
} DHCP_CLIENT_INFO_V5, *LPDHCP_CLIENT_INFO_V5;


#define V5_ADDRESS_STATE_OFFERED       0x0
#define V5_ADDRESS_STATE_ACTIVE        0x1
#define V5_ADDRESS_STATE_DECLINED      0x2
#define V5_ADDRESS_STATE_DOOM          0x3

#define V5_ADDRESS_BIT_DELETED         0x80
#define V5_ADDRESS_BIT_UNREGISTERED    0x40
#define V5_ADDRESS_BIT_BOTH_REC        0x20


#define DNS_FLAG_ENABLED               0x01
#define DNS_FLAG_UPDATE_DOWNLEVEL      0x02
#define DNS_FLAG_CLEANUP_EXPIRED       0x04
#define DNS_FLAG_UPDATE_BOTH_ALWAYS    0x10
#define DNS_FLAG_UPDATE_DHCID          0x20

typedef struct _DHCP_CLIENT_INFO_ARRAY_V5 {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_CLIENT_INFO_V5 *Clients; // array of pointers
} DHCP_CLIENT_INFO_ARRAY_V5, *LPDHCP_CLIENT_INFO_ARRAY_V5;


#define     DHCP_OPT_ENUM_IGNORE_VENDOR           0x01
#define     DHCP_OPT_ENUM_USE_CLASSNAME           0x02

typedef     struct _DHCP_ALL_OPTIONS {
    DWORD                          Flags;         // must be zero -- not used..
    LPDHCP_OPTION_ARRAY            NonVendorOptions;
    DWORD                          NumVendorOptions;

#if defined(MIDL_PASS)
    [size_is(NumVendorOptions)]
#endif
    struct                                  {
        DHCP_OPTION                Option;
        LPWSTR                     VendorName;
        LPWSTR                     ClassName;    
    }                             *VendorOptions;
} DHCP_ALL_OPTIONS, *LPDHCP_ALL_OPTIONS;


typedef     struct _DHCP_ALL_OPTION_VALUES {
    DWORD                          Flags;         // must be zero -- not used
    DWORD                          NumElements;   // the # of elements in array of Options below..
#if     defined(MIDL_PASS)
    [size_is(NumElements)]
#endif  MIDL_PASS
    struct                         /* anonymous */ {
        LPWSTR                     ClassName;     // for each user class (NULL if none exists)
        LPWSTR                     VendorName;    // for each vendor class (NULL if none exists)
        BOOL                       IsVendor;      // is this set of options vendor specific?
        LPDHCP_OPTION_VALUE_ARRAY  OptionsArray;  // list of options for the above pair: (vendor,user)
    }                             *Options;       // for each vendor/user class pair, one element in this array..
} DHCP_ALL_OPTION_VALUES, *LPDHCP_ALL_OPTION_VALUES;

#ifndef     _ST_SRVR_H_
#define     _ST_SRVR_H_

typedef     struct                 _DHCPDS_SERVER {
    DWORD                          Version;       
    LPWSTR                         ServerName;   
    DWORD                          ServerAddress; 
    DWORD                          Flags;         
    DWORD                          State;         
    LPWSTR                         DsLocation;    
    DWORD                          DsLocType;     
}   DHCPDS_SERVER, *LPDHCPDS_SERVER, *PDHCPDS_SERVER;

typedef     struct                 _DHCPDS_SERVERS {
    DWORD                          Flags;         
    DWORD                          NumElements;  
    LPDHCPDS_SERVER                Servers;       
}   DHCPDS_SERVERS, *LPDHCPDS_SERVERS, *PDHCPDS_SERVERS;

typedef     DHCPDS_SERVER          DHCP_SERVER_INFO;
typedef     PDHCPDS_SERVER         PDHCP_SERVER_INFO;
typedef     LPDHCPDS_SERVER        LPDHCP_SERVER_INFO;

typedef     DHCPDS_SERVERS         DHCP_SERVER_INFO_ARRAY;
typedef     PDHCPDS_SERVERS        PDHCP_SERVER_INFO_ARRAY;
typedef     LPDHCPDS_SERVERS       LPDHCP_SERVER_INFO_ARRAY;

#endif      _ST_SRVR_H_

#define     DHCP_FLAGS_DONT_ACCESS_DS             0x01
#define     DHCP_FLAGS_DONT_DO_RPC                0x02
#define     DHCP_FLAGS_OPTION_IS_VENDOR           0x03

#define     DHCP_ATTRIB_BOOL_IS_ROGUE             0x01
#define     DHCP_ATTRIB_BOOL_IS_DYNBOOTP          0x02
#define     DHCP_ATTRIB_BOOL_IS_PART_OF_DSDC      0x03
#define     DHCP_ATTRIB_BOOL_IS_BINDING_AWARE     0x04
#define     DHCP_ATTRIB_BOOL_IS_ADMIN             0x05
#define     DHCP_ATTRIB_ULONG_RESTORE_STATUS      0x06

#define     DHCP_ATTRIB_TYPE_BOOL                 0x01
#define     DHCP_ATTRIB_TYPE_ULONG                0x02

typedef     ULONG                  DHCP_ATTRIB_ID, *PDHCP_ATTRIB_ID, *LPDHCP_ATTRIB_ID;

typedef     struct      _DHCP_ATTRIB {
    DHCP_ATTRIB_ID                 DhcpAttribId;  // one of the DHCP_ATTRIB_*
    ULONG                          DhcpAttribType;// type of attrib
#if defined(MIDL_PASS)
    [switch_is(DhcpAttribType), switch_type(ULONG)]
    union                          {
    [case(DHCP_ATTRIB_TYPE_BOOL)]  BOOL  DhcpAttribBool;
    [case(DHCP_ATTRIB_TYPE_ULONG)] ULONG DhcpAttribUlong;
    };
#else MIDL_PASS
    union               {              
    BOOL                           DhcpAttribBool;
    ULONG                          DhcpAttribUlong;
    };
#endif MIDL_PASS
}   DHCP_ATTRIB, *PDHCP_ATTRIB, *LPDHCP_ATTRIB;

typedef     struct                 _DHCP_ATTRIB_ARRAY {
    ULONG                          NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif MIDL_PASS
    __field_ecount(NumElements) LPDHCP_ATTRIB                  DhcpAttribs;
}   DHCP_ATTRIB_ARRAY, *PDHCP_ATTRIB_ARRAY, *LPDHCP_ATTRIB_ARRAY;



typedef struct _DHCP_BOOTP_IP_RANGE {
    DHCP_IP_ADDRESS StartAddress;
    DHCP_IP_ADDRESS EndAddress;
    ULONG BootpAllocated;
    ULONG MaxBootpAllowed;
} DHCP_BOOTP_IP_RANGE, *LPDHCP_BOOT_IP_RANGE;

typedef struct _DHCP_SUBNET_ELEMENT_DATA_V5 {
    DHCP_SUBNET_ELEMENT_TYPE ElementType;
#if defined(MIDL_PASS)
    [switch_is(ELEMENT_MASK(ElementType)), switch_type(DHCP_SUBNET_ELEMENT_TYPE)]
    union _DHCP_SUBNET_ELEMENT_UNION_V5 {
        [case(DhcpIpRanges)]         DHCP_BOOTP_IP_RANGE    *IpRange;
        [case(DhcpSecondaryHosts)]   DHCP_HOST_INFO         *SecondaryHost;
        [case(DhcpReservedIps)]      DHCP_IP_RESERVATION_V4 *ReservedIp;
        [case(DhcpExcludedIpRanges)] DHCP_IP_RANGE          *ExcludeIpRange;
        [case(DhcpIpUsedClusters)] DHCP_IP_CLUSTER          *IpUsedCluster;
    } Element;
#else
    union _DHCP_SUBNET_ELEMENT_UNION_V5 {
        DHCP_BOOTP_IP_RANGE    *IpRange;
        DHCP_HOST_INFO         *SecondaryHost;
        DHCP_IP_RESERVATION_V4 *ReservedIp;
        DHCP_IP_RANGE          *ExcludeIpRange;
        DHCP_IP_CLUSTER        *IpUsedCluster;
    } Element;
#endif // MIDL_PASS
} DHCP_SUBNET_ELEMENT_DATA_V5, *LPDHCP_SUBNET_ELEMENT_DATA_V5;

typedef struct _DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5 {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_SUBNET_ELEMENT_DATA_V5 Elements; //array
} DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5, *LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V5;




#pragma     pack(4)
typedef struct _DHCP_PERF_STATS {                     // performance statistics
    //
    // DO NOT CHANGE THIS ORDER -- THIS AFFECTS THE PERF COUNTER DEFINITION
    // ORDER IN DHCPDATA.C (under PERF directory)
    //
    ULONG   dwNumPacketsReceived;
    ULONG   dwNumPacketsDuplicate;
    ULONG   dwNumPacketsExpired;
    ULONG   dwNumMilliSecondsProcessed;
    ULONG   dwNumPacketsInActiveQueue;
    ULONG   dwNumPacketsInPingQueue;

    ULONG   dwNumDiscoversReceived;
    ULONG   dwNumOffersSent;

    ULONG   dwNumRequestsReceived;
    ULONG   dwNumInformsReceived;
    ULONG   dwNumAcksSent;
    ULONG   dwNumNacksSent;

    ULONG   dwNumDeclinesReceived;
    ULONG   dwNumReleasesReceived;

    // Count of Delayed Offer sent
    ULONG   dwNumDelayedOfferInQueue;
    ULONG   dwNumPacketsProcessed;

    // For Quarantine
    ULONG   dwNumPacketsInQuarWaitingQueue;
    ULONG   dwNumPacketsInQuarReadyQueue;
    ULONG   dwNumPacketsInQuarDecisionQueue;


} DHCP_PERF_STATS, *LPDHCP_PERF_STATS;
#pragma     pack()


#define DHCP_ENDPOINT_FLAG_CANT_MODIFY 0x01

typedef struct _DHCP_BIND_ELEMENT {
    ULONG           Flags;
    BOOL            fBoundToDHCPServer;
    DHCP_IP_ADDRESS AdapterPrimaryAddress;
    DHCP_IP_ADDRESS AdapterSubnetAddress;
    LPWSTR          IfDescription;
    ULONG           IfIdSize;
#if defined (MIDL_PASS)
    [size_is(IfIdSize)]
#endif // MIDL_PASS
    __field_bcount(IfIdSize) LPBYTE IfId;
} DHCP_BIND_ELEMENT, *LPDHCP_BIND_ELEMENT;

typedef struct _DHCP_BIND_ELEMENT_ARRAY {
    DWORD NumElements;
#if defined (MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_BIND_ELEMENT Elements; //array
} DHCP_BIND_ELEMENT_ARRAY, *LPDHCP_BIND_ELEMENT_ARRAY;


typedef struct _DHCPV6_BIND_ELEMENT {
    ULONG             Flags;
    BOOL              fBoundToDHCPServer;
    DHCP_IPV6_ADDRESS AdapterPrimaryAddress;
    DHCP_IPV6_ADDRESS AdapterSubnetAddress;
    LPWSTR            IfDescription;
    DWORD             IpV6IfIndex;
    ULONG             IfIdSize;
#if defined (MIDL_PASS)
    [size_is(IfIdSize)]
#endif // MIDL_PASS
    LPBYTE            IfId;
} DHCPV6_BIND_ELEMENT, *LPDHCPV6_BIND_ELEMENT;

typedef struct _DHCPV6_BIND_ELEMENT_ARRAY {
    DWORD NumElements;
#if defined (MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCPV6_BIND_ELEMENT Elements; //array
} DHCPV6_BIND_ELEMENT_ARRAY, *LPDHCPV6_BIND_ELEMENT_ARRAY;


//
// For Quarantine
//

#define QUARANTIN_OPTION_BASE 43220

#define QUARANTINE_SCOPE_QUARPROFILE_OPTION  (QUARANTIN_OPTION_BASE + 1)

#define QUARANTINE_CONFIG_OPTION  (QUARANTIN_OPTION_BASE + 2)


  

// DHCP IPV6 specific Structures

typedef struct _DHCP_IP_RANGE_V6 {
    DHCP_IPV6_ADDRESS StartAddress;
    DHCP_IPV6_ADDRESS EndAddress;
} DHCP_IP_RANGE_V6, *LPDHCP_IP_RANGE_V6;

typedef struct _DHCP_HOST_INFO_V6 {
    DHCP_IPV6_ADDRESS IpAddress;      // minimum information always available
    LPWSTR            NetBiosName;    // optional information
    LPWSTR            HostName;       // optional information
} DHCP_HOST_INFO_V6, *LPDHCP_HOST_INFO_V6;


typedef struct _DHCP_SUBNET_INFO_V6
{
    DHCP_IPV6_ADDRESS       SubnetAddress;
    ULONG                   Prefix;
    USHORT                  Preference;	
    LPWSTR                  SubnetName;
    LPWSTR                  SubnetComment;
    DWORD                   State;
    DWORD 				    ScopeId;
} DHCP_SUBNET_INFO_V6, *PDHCP_SUBNET_INFO_V6,*LPDHCP_SUBNET_INFO_V6;


//
// Mib Info structures.
//

typedef struct _SCOPE_MIB_INFO_V6 {
    DHCP_IPV6_ADDRESS Subnet;
    ULONGLONG NumAddressesInuse;
    ULONGLONG NumAddressesFree;
    ULONGLONG NumPendingAdvertises;
} SCOPE_MIB_INFO_V6, *LPSCOPE_MIB_INFO_V6;

typedef struct _DHCP_MIB_INFO_V6 {
    DWORD Solicits;
    DWORD Advertises;
    DWORD Requests;
    DWORD Renews;	
    DWORD Rebinds;		
    DWORD Replies;
    DWORD Confirms;
    DWORD Declines;
    DWORD Releases;
    DWORD Informs;
    DATE_TIME ServerStartTime;
    DWORD Scopes;
#if defined(MIDL_PASS)
    [size_is(Scopes)]
#endif // MIDL_PASS
    LPSCOPE_MIB_INFO_V6 ScopeInfo; // array.
} DHCP_MIB_INFO_V6, *LPDHCP_MIB_INFO_V6;

typedef struct _DHCP_IP_RESERVATION_V6 {
    DHCP_IPV6_ADDRESS  ReservedIpAddress;
    DHCP_CLIENT_UID    *ReservedForClient;
    DWORD InterfaceId;
} DHCP_IP_RESERVATION_V6, *LPDHCP_IP_RESERVATION_V6;

typedef enum _DHCP_SUBNET_ELEMENT_TYPE_V6 {
    Dhcpv6IpRanges,
    Dhcpv6ReservedIps,
    Dhcpv6ExcludedIpRanges
} DHCP_SUBNET_ELEMENT_TYPE_V6, *LPDHCP_SUBNET_ELEMENT_TYPE_V6;

typedef struct _DHCP_SUBNET_ELEMENT_DATA_V6 {
    DHCP_SUBNET_ELEMENT_TYPE_V6 ElementType;
#if defined(MIDL_PASS)
    [switch_is(ELEMENT_MASK(ElementType)), switch_type(DHCP_SUBNET_ELEMENT_TYPE_V6)]
    union _DHCP_SUBNET_ELEMENT_UNION_V6 {
        [case(Dhcpv6IpRanges)]         DHCP_IP_RANGE_V6       *IpRange;
        [case(Dhcpv6ReservedIps)]      DHCP_IP_RESERVATION_V6 *ReservedIp;
        [case(Dhcpv6ExcludedIpRanges)] DHCP_IP_RANGE_V6       *ExcludeIpRange;
    } Element;
#else
    union _DHCP_SUBNET_ELEMENT_UNION_V6 {
	    DHCP_IP_RANGE_V6       *IpRange;
        DHCP_IP_RESERVATION_V6 *ReservedIp;
        DHCP_IP_RANGE_V6       *ExcludeIpRange;
    } Element;
#endif // MIDL_PASS
} DHCP_SUBNET_ELEMENT_DATA_V6, *LPDHCP_SUBNET_ELEMENT_DATA_V6;

#if !defined(MIDL_PASS)
typedef union _DHCP_SUBNET_ELEMENT_UNION_V6
    DHCP_SUBNET_ELEMENT_UNION_V6, *LPDHCP_SUBNET_ELEMENT_UNION_V6;
#endif

typedef struct _DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_SUBNET_ELEMENT_DATA_V6 Elements; //array
} DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6, *LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V6;



//
// DHCPv6 Client information data structures
//

#define ADDRESS_TYPE_IANA	0
#define ADDRESS_TYPE_IATA	1

typedef struct _DHCP_CLIENT_INFO_V6 {
    DHCP_IPV6_ADDRESS ClientIpAddress;           // currently assigned IP address.
    DHCP_CLIENT_UID   ClientDUID; 
    DWORD             AddressType;		         // IANA or IATA
    DWORD             IAID;				         // IAID Associated with the address.
    LPWSTR            ClientName;                // optional.
    LPWSTR            ClientComment;
    DATE_TIME         ClientValidLeaseExpires;   // UTC time in FILE_TIME format.
    DATE_TIME         ClientPrefLeaseExpires;    // UTC time in FILE_TIME format.
    DHCP_HOST_INFO_V6 OwnerHost;                 // host that distributed this IP address.
} DHCP_CLIENT_INFO_V6, *LPDHCP_CLIENT_INFO_V6;

typedef struct _DHCPV6_IP_ARRAY {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
        LPDHCP_IPV6_ADDRESS Elements; //array
} DHCPV6_IP_ARRAY, *LPDHCPV6_IP_ARRAY;

typedef struct _DHCP_CLIENT_INFO_ARRAY_V6 {
    DWORD NumElements;
#if defined(MIDL_PASS)
    [size_is(NumElements)]
#endif // MIDL_PASS
    LPDHCP_CLIENT_INFO_V6 *Clients; // array of pointers
} DHCP_CLIENT_INFO_ARRAY_V6, *LPDHCP_CLIENT_INFO_ARRAY_V6;


typedef enum _DHCP_CLIENT_SEARCH_TYPE_V6 {
    Dhcpv6ClientIpAddress,
    Dhcpv6ClientDUID,
    Dhcpv6ClientName
} DHCP_SEARCH_INFO_TYPE_V6, *LPDHCP_SEARCH_INFO_TYPE_V6;

typedef struct _DHCP_CLIENT_SEARCH_INFO_V6 {
    DHCP_SEARCH_INFO_TYPE_V6 SearchType;
#if defined(MIDL_PASS)
    [switch_is(SearchType), switch_type(DHCP_SEARCH_INFO_TYPE_V6)]
    union _DHCP_CLIENT_SEARCH_UNION_V6 {
        [case(Dhcpv6ClientIpAddress)] DHCP_IPV6_ADDRESS ClientIpAddress;
        [case(Dhcpv6ClientDUID)]      DHCP_CLIENT_UID   ClientDUID;
        [case(Dhcpv6ClientName)]      LPWSTR            ClientName;
    } SearchInfo;
#else
    union _DHCP_CLIENT_SEARCH_UNION_V6 {
        DHCP_IPV6_ADDRESS ClientIpAddress;
        DHCP_CLIENT_UID   ClientDUID;
        LPWSTR            ClientName;
    } SearchInfo;
#endif // MIDL_PASS
} DHCP_SEARCH_INFO_V6, *LPDHCP_SEARCH_INFO_V6;


#define SCOPE_STATE_ENABLED     DhcpSubnetEnabled
#define SCOPE_STATE_DISABLED    DhcpSubnetDisabled


#define DHCP_MIN_DELAY 0
#define DHCP_MAX_DELAY 1000


#ifndef  DHCPAPI_NO_PROTOTYPES

//
// DHCP Filter related APIs
//


DWORD DHCP_API_FUNCTION
DhcpAddFilterV4(
    __in_z_opt DHCP_CONST WCHAR     *ServerIpAddress,
    __in       DHCP_FILTER_ADD_INFO *AddFilterInfo,
    __in       BOOL                 ForceFlag
    );

DWORD DHCP_API_FUNCTION
DhcpDeleteFilterV4(
    __in_z_opt DHCP_CONST WCHAR  *ServerIpAddress,
    __in       DHCP_ADDR_PATTERN *DeleteFilterInfo
    );

DWORD DHCP_API_FUNCTION
DhcpSetFilterV4(
    __in_z_opt DHCP_CONST WCHAR        *ServerIpAddress,
    __in       DHCP_FILTER_GLOBAL_INFO *GlobalFilterInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetFilterV4(
    __in_z_opt DHCP_CONST WCHAR        *ServerIpAddress,
    __out      DHCP_FILTER_GLOBAL_INFO *GlobalFilterInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumFilterV4(
    __in_z_opt DHCP_CONST WCHAR        *ServerIpAddress,
    __inout    LPDHCP_ADDR_PATTERN     ResumeHandle,
    __in       DWORD                   PreferredMaximum,
    __in       DHCP_FILTER_LIST_TYPE   ListType,
    __out      LPDHCP_FILTER_ENUM_INFO *EnumFilterInfo,
    __out      DWORD                   *ElementsRead,
    __out      DWORD                   *ElementsTotal
    );


//
// Subnet APIs
//

DWORD DHCP_API_FUNCTION
DhcpCreateSubnet(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_IP_ADDRESS  SubnetAddress,
    DHCP_CONST DHCP_SUBNET_INFO * SubnetInfo
    );

DWORD DHCP_API_FUNCTION
DhcpSetSubnetInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_IP_ADDRESS  SubnetAddress,
    DHCP_CONST DHCP_SUBNET_INFO * SubnetInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetSubnetInfo(
    __in_z_opt DHCP_CONST WCHAR   *ServerIpAddress,
               DHCP_IP_ADDRESS    SubnetAddress,
               LPDHCP_SUBNET_INFO * SubnetInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnets(
    __in_z_opt   DHCP_CONST WCHAR    *ServerIpAddress,
    __inout      DHCP_RESUME_HANDLE  *ResumeHandle,
    __in         DWORD               PreferredMaximum,
    __inout      LPDHCP_IP_ARRAY     *EnumInfo,
    __out        DWORD               *ElementsRead,
    __out        DWORD               *ElementsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpAddSubnetElement(
    __in_z_opt DHCP_CONST WCHAR          *ServerIpAddress,
               DHCP_IP_ADDRESS            SubnetAddress,
    DHCP_CONST DHCP_SUBNET_ELEMENT_DATA * AddElementInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnetElements(
    __in_z_opt DHCP_CONST WCHAR                 *ServerIpAddress,
               DHCP_IP_ADDRESS                  SubnetAddress,
               DHCP_SUBNET_ELEMENT_TYPE         EnumElementType,
               DHCP_RESUME_HANDLE               *ResumeHandle,
               DWORD                            PreferredMaximum,
               LPDHCP_SUBNET_ELEMENT_INFO_ARRAY *EnumElementInfo,
               DWORD                            *ElementsRead,
               DWORD                            *ElementsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpRemoveSubnetElement(
    __in_z_opt DHCP_CONST WCHAR         *ServerIpAddress,
               DHCP_IP_ADDRESS          SubnetAddress,
    DHCP_CONST DHCP_SUBNET_ELEMENT_DATA * RemoveElementInfo,
               DHCP_FORCE_FLAG           ForceFlag
    );

DWORD DHCP_API_FUNCTION
DhcpDeleteSubnet(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_IP_ADDRESS   SubnetAddress,
               DHCP_FORCE_FLAG   ForceFlag
    );

//
// Option APIs
//

DWORD DHCP_API_FUNCTION
DhcpCreateOption(
    __in_z_opt DHCP_CONST WCHAR        *ServerIpAddress,
               DHCP_OPTION_ID           OptionID,
               DHCP_CONST DHCP_OPTION * OptionInfo
    );

DWORD DHCP_API_FUNCTION
DhcpSetOptionInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_OPTION_ID    OptionID,
    DHCP_CONST DHCP_OPTION      *OptionInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetOptionInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_OPTION_ID   OptionID,
               LPDHCP_OPTION    *OptionInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumOptions(
    __in_z_opt DHCP_CONST WCHAR    *ServerIpAddress,
               DHCP_RESUME_HANDLE  *ResumeHandle,
               DWORD               PreferredMaximum,
               LPDHCP_OPTION_ARRAY *Options,
               DWORD               *OptionsRead,
               DWORD               *OptionsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpRemoveOption(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_OPTION_ID   OptionID
    );

DWORD DHCP_API_FUNCTION
DhcpSetOptionValue(           
    __in_z_opt DHCP_CONST WCHAR       *ServerIpAddress,
               DHCP_OPTION_ID          OptionID,
    DHCP_CONST DHCP_OPTION_SCOPE_INFO *ScopeInfo,
    DHCP_CONST DHCP_OPTION_DATA       *OptionValue
    );

DWORD DHCP_API_FUNCTION
DhcpSetOptionValues(
    __in_z_opt DHCP_CONST WCHAR        *ServerIpAddress,
    DHCP_CONST DHCP_OPTION_SCOPE_INFO  *ScopeInfo,
    DHCP_CONST DHCP_OPTION_VALUE_ARRAY *OptionValues
    );

DWORD DHCP_API_FUNCTION
DhcpGetOptionValue(
    __in_z_opt DHCP_CONST WCHAR       *ServerIpAddress,
               DHCP_OPTION_ID         OptionID,
    DHCP_CONST DHCP_OPTION_SCOPE_INFO *ScopeInfo,
    LPDHCP_OPTION_VALUE *OptionValue
    );

DWORD DHCP_API_FUNCTION
DhcpEnumOptionValues(
    __in_z_opt DHCP_CONST WCHAR          *ServerIpAddress,
    DHCP_CONST DHCP_OPTION_SCOPE_INFO    *ScopeInfo,
               DHCP_RESUME_HANDLE        *ResumeHandle,
               DWORD                     PreferredMaximum,
               LPDHCP_OPTION_VALUE_ARRAY *OptionValues,
               DWORD                     *OptionsRead,
               DWORD                     *OptionsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpRemoveOptionValue(
    __in_z_opt DHCP_CONST WCHAR       *ServerIpAddress,
               DHCP_OPTION_ID          OptionID,
    DHCP_CONST DHCP_OPTION_SCOPE_INFO *ScopeInfo
    );

//
// Client APIs
//
DWORD DHCP_API_FUNCTION
DhcpCreateClientInfoVQ(
    __in_z_opt DHCP_CONST WCHAR    *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO_VQ *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpSetClientInfoVQ(
    __in_z_opt DHCP_CONST WCHAR    *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO_VQ *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetClientInfoVQ(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_SEARCH_INFO *SearchInfo,
    LPDHCP_CLIENT_INFO_VQ       *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnetClientsVQ(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS              SubnetAddress,
               DHCP_RESUME_HANDLE           *ResumeHandle,
               DWORD                        PreferredMaximum,
               LPDHCP_CLIENT_INFO_ARRAY_VQ *ClientInfo,
               DWORD                       *ClientsRead,
               DWORD                       *ClientsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnetClientsFilterStatusInfo(
    __in_z_opt DHCP_CONST WCHAR                       *ServerIpAddress,
               DHCP_IP_ADDRESS                        SubnetAddress,
               DHCP_RESUME_HANDLE                     *ResumeHandle,
               DWORD                                  PreferredMaximum,
               LPDHCP_CLIENT_FILTER_STATUS_INFO_ARRAY *ClientInfo,
               DWORD                                  *ClientsRead,
               DWORD                                  *ClientsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpCreateClientInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpSetClientInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetClientInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_SEARCH_INFO *SearchInfo,
    LPDHCP_CLIENT_INFO *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpDeleteClientInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_SEARCH_INFO *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnetClients(
    __in_z_opt DHCP_CONST WCHAR         *ServerIpAddress,
               DHCP_IP_ADDRESS          SubnetAddress,
               DHCP_RESUME_HANDLE       *ResumeHandle,
               DWORD                    PreferredMaximum,
               LPDHCP_CLIENT_INFO_ARRAY *ClientInfo,
               DWORD                    *ClientsRead,
               DWORD                    *ClientsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpGetClientOptions(
    __in_z_opt DHCP_CONST WCHAR   *ServerIpAddress,
               DHCP_IP_ADDRESS     ClientIpAddress,
               DHCP_IP_MASK        ClientSubnetMask,
               LPDHCP_OPTION_LIST *ClientOptions
    );

DWORD DHCP_API_FUNCTION
DhcpGetMibInfo(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    LPDHCP_MIB_INFO *MibInfo
    );

DWORD DHCP_API_FUNCTION
DhcpServerSetConfig(
    __in_z_opt DHCP_CONST WCHAR         *ServerIpAddress,
               DWORD                     FieldsToSet,
               LPDHCP_SERVER_CONFIG_INFO ConfigInfo
    );


DWORD DHCP_API_FUNCTION
DhcpServerGetConfig(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    LPDHCP_SERVER_CONFIG_INFO *ConfigInfo
    );


DWORD DHCP_API_FUNCTION
DhcpScanDatabase(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DHCP_IP_ADDRESS   SubnetAddress,
               DWORD             FixFlag,
               LPDHCP_SCAN_LIST *ScanList
    );

VOID DHCP_API_FUNCTION
DhcpRpcFreeMemory(
    PVOID BufferPointer
    );

DWORD DHCP_API_FUNCTION
DhcpGetVersion(
    __in_opt LPWSTR  ServerIpAddress,
             LPDWORD MajorVersion,
             LPDWORD MinorVersion
    );




DWORD DHCP_API_FUNCTION
DhcpAddSubnetElementV4(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS             SubnetAddress,
    DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V4 *AddElementInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnetElementsV4(
    __in_z_opt DHCP_CONST WCHAR                    *ServerIpAddress,
               DHCP_IP_ADDRESS                     SubnetAddress,
               DHCP_SUBNET_ELEMENT_TYPE            EnumElementType,
               DHCP_RESUME_HANDLE                  *ResumeHandle,
               DWORD                               PreferredMaximum,
               LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V4 *EnumElementInfo,
               DWORD                               *ElementsRead,
               DWORD                               *ElementsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpRemoveSubnetElementV4(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS             SubnetAddress,
    DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V4 *RemoveElementInfo,
               DHCP_FORCE_FLAG             ForceFlag
    );


DWORD DHCP_API_FUNCTION
DhcpCreateClientInfoV4(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO_V4 *ClientInfo
    );


DWORD DHCP_API_FUNCTION
DhcpSetClientInfoV4(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO_V4 *ClientInfo
    );


DWORD DHCP_API_FUNCTION
DhcpGetClientInfoV4(
    __in_z_opt DHCP_CONST WCHAR      *ServerIpAddress,
    DHCP_CONST DHCP_SEARCH_INFO      *SearchInfo,
               LPDHCP_CLIENT_INFO_V4 *ClientInfo
    );


DWORD DHCP_API_FUNCTION
DhcpEnumSubnetClientsV4(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS             SubnetAddress,
               DHCP_RESUME_HANDLE          *ResumeHandle,
               DWORD                       PreferredMaximum,
               LPDHCP_CLIENT_INFO_ARRAY_V4 *ClientInfo,
               DWORD                       *ClientsRead,
               DWORD                       *ClientsTotal
    );


DWORD DHCP_API_FUNCTION
DhcpServerSetConfigV4(
    __in_z_opt DHCP_CONST WCHAR             *ServerIpAddress,
               DWORD                        FieldsToSet,
               LPDHCP_SERVER_CONFIG_INFO_V4 ConfigInfo
    );

DWORD DHCP_API_FUNCTION
DhcpServerGetConfigV4(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    LPDHCP_SERVER_CONFIG_INFO_V4 *ConfigInfo
    );


DWORD
DhcpSetSuperScopeV4(
    __in_z_opt DHCP_CONST WCHAR  *ServerIpAddress,
    DHCP_CONST DHCP_IP_ADDRESS    SubnetAddress,
    __in_opt   DHCP_CONST LPWSTR  SuperScopeName,
    DHCP_CONST BOOL               ChangeExisting
    );

DWORD
DhcpDeleteSuperScopeV4(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    __in DHCP_CONST LPWSTR      SuperScopeName
    );

DWORD
DhcpGetSuperScopeInfoV4(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
    LPDHCP_SUPER_SCOPE_TABLE *SuperScopeTable
    );






DWORD DHCP_API_FUNCTION
DhcpEnumSubnetClientsV5(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS             SubnetAddress,
               DHCP_RESUME_HANDLE          *ResumeHandle,
               DWORD                       PreferredMaximum,
               LPDHCP_CLIENT_INFO_ARRAY_V5 *ClientInfo,
               DWORD                       *ClientsRead,
               DWORD                       *ClientsTotal
    );




DWORD                                             
DhcpCreateOptionV5(                               
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionId,      
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION          OptionInfo
) ;


DWORD                                             // ERROR_DHCP_OPTION_NOT_PRESENT if option does not exist
DhcpSetOptionInfoV5(                              // Modify existing option's fields
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION          OptionInfo
) ;


DWORD                                             // ERROR_DHCP_OPTION_NOT_PRESENT
DhcpGetOptionInfoV5(                              // retrieve the information from off the mem structures
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             OUT     LPDHCP_OPTION         *OptionInfo     // allocate memory using MIDL functions
) ;


DWORD                                             // ERROR_DHCP_OPTION_NOT_PRESENT if option does not exist
DhcpEnumOptionsV5(                                // enumerate the options defined
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN OUT  DHCP_RESUME_HANDLE    *ResumeHandle,  
             IN      DWORD                  PreferredMaximum, 
             OUT     LPDHCP_OPTION_ARRAY   *Options,       
             OUT     DWORD                 *OptionsRead,   
             OUT     DWORD                 *OptionsTotal   
) ;


DWORD                                             // ERROR_DHCP_OPTION_NOT_PRESENT if option not existent
DhcpRemoveOptionV5(                               // remove the option definition from the registry
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName
) ;


DWORD                                             // OPTION_NOT_PRESENT if option is not defined
DhcpSetOptionValueV5(                             // replace or add a new option value
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionId,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION_SCOPE_INFO ScopeInfo,
             IN      LPDHCP_OPTION_DATA     OptionValue
) ;


DWORD                                             
DhcpSetOptionValuesV5(                            
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION_SCOPE_INFO  ScopeInfo,
             IN      LPDHCP_OPTION_VALUE_ARRAY OptionValues
) ;


DWORD
DhcpGetOptionValueV5(                             // fetch the required option at required level
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION_SCOPE_INFO ScopeInfo,
             OUT     LPDHCP_OPTION_VALUE   *OptionValue   
) ;

DWORD
DhcpGetOptionValueV6(                             // fetch the required option at required level
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo,
             OUT     LPDHCP_OPTION_VALUE   *OptionValue    
) ;


DWORD
DhcpEnumOptionValuesV5(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION_SCOPE_INFO ScopeInfo,
             IN      DHCP_RESUME_HANDLE    *ResumeHandle,
             IN      DWORD                  PreferredMaximum,
             OUT     LPDHCP_OPTION_VALUE_ARRAY *OptionValues,
             OUT     DWORD                 *OptionsRead,
             OUT     DWORD                 *OptionsTotal
) ;


DWORD
DhcpRemoveOptionValueV5(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION_SCOPE_INFO ScopeInfo
) ;


DWORD
DhcpCreateClass(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN      LPDHCP_CLASS_INFO      ClassInfo
) ;


DWORD
DhcpModifyClass(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN      LPDHCP_CLASS_INFO      ClassInfo
) ;


DWORD
DhcpDeleteClass(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
    __in     IN      LPWSTR                 ClassName
) ;


DWORD
DhcpGetClassInfo(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN      LPDHCP_CLASS_INFO      PartialClassInfo,
             OUT     LPDHCP_CLASS_INFO     *FilledClassInfo
) ;


DWORD
DhcpEnumClasses(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN OUT  DHCP_RESUME_HANDLE    *ResumeHandle,
             IN      DWORD                  PreferredMaximum,
             OUT     LPDHCP_CLASS_INFO_ARRAY *ClassInfoArray,
             OUT     DWORD                 *nRead,
             OUT     DWORD                 *nTotal
) ;



DWORD
DhcpGetAllOptions(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             OUT     LPDHCP_ALL_OPTIONS     *OptionStruct   // fills the fields of this structure
) ;

DWORD DHCP_API_FUNCTION 
DhcpGetAllOptionsV6(
    __in_opt IN       LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,        
             OUT     LPDHCP_ALL_OPTIONS     *OptionStruct   // fills the fields of this structure
);

DWORD
DhcpGetAllOptionValues(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      LPDHCP_OPTION_SCOPE_INFO ScopeInfo,
             OUT     LPDHCP_ALL_OPTION_VALUES *Values
) ;

DWORD DHCP_API_FUNCTION 
DhcpGetAllOptionValuesV6(
    __in_opt       LPWSTR                 ServerIpAddress,
           IN      DWORD                  Flags,
           IN      LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo,
           OUT     LPDHCP_ALL_OPTION_VALUES *Values
);






//DOC DhcpEnumServers enumerates the list of servers found in the DS.  If the DS
//DOC is not accessible, it returns an error. The only currently used parameter
//DOC is the out parameter Servers.  This is a SLOW call.
DWORD
DhcpEnumServers(
    IN      DWORD                  Flags,         // must be zero
    IN      LPVOID                 IdInfo,        // must be NULL
    OUT     LPDHCP_SERVER_INFO_ARRAY *Servers,    // output servers list
    IN      LPVOID                 CallbackFn,    // must be NULL
    IN      LPVOID                 CallbackData   // must be NULL
);

//DOC DhcpAddServer tries to add a new server to the existing list of servers in
//DOC the DS. The function returns error if the Server already exists in the DS.
//DOC The function tries to upload the server configuration to the DS..
//DOC This is a SLOW call.  Currently, the DsLocation and DsLocType are not valid
//DOC fields in the NewServer and they'd be ignored. Version must be zero.
DWORD
DhcpAddServer(
    IN      DWORD                  Flags,         // must be zero
    IN      LPVOID                 IdInfo,        // must be NULL
    IN      LPDHCP_SERVER_INFO     NewServer,     // input server information
    IN      LPVOID                 CallbackFn,    // must be NULL
    IN      LPVOID                 CallbackData   // must be NULL
);

//DOC DhcpDeleteServer tries to delete the server from DS. It is an error if the
//DOC server does not already exist.  This also deletes any objects related to
//DOC this server in the DS (like subnet, reservations etc.).
DWORD
DhcpDeleteServer(
    IN      DWORD                  Flags,         // must be zero
    IN      LPVOID                 IdInfo,        // must be NULL
    IN      LPDHCP_SERVER_INFO     NewServer,     // input server information
    IN      LPVOID                 CallbackFn,    // must be NULL
    IN      LPVOID                 CallbackData   // must be NULL
);





DWORD DHCP_API_FUNCTION
DhcpGetServerBindingInfo(
    __in_z_opt DHCP_CONST WCHAR          *ServerIpAddress,
               ULONG                      Flags,
               LPDHCP_BIND_ELEMENT_ARRAY *BindElementsInfo
);

DWORD DHCP_API_FUNCTION
DhcpSetServerBindingInfo(
    __in_z_opt DHCP_CONST WCHAR          *ServerIpAddress,
               ULONG                     Flags,
               LPDHCP_BIND_ELEMENT_ARRAY BindElementInfo
);




DWORD DHCP_API_FUNCTION
DhcpAddSubnetElementV5(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS             SubnetAddress,
    DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V5 *AddElementInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumSubnetElementsV5(
    __in_z_opt DHCP_CONST WCHAR                    *ServerIpAddress,
               DHCP_IP_ADDRESS                     SubnetAddress,
               DHCP_SUBNET_ELEMENT_TYPE            EnumElementType,
               DHCP_RESUME_HANDLE                  *ResumeHandle,
               DWORD                               PreferredMaximum,
               LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V5 *EnumElementInfo,
               DWORD                               *ElementsRead,
               DWORD                               *ElementsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpRemoveSubnetElementV5(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IP_ADDRESS             SubnetAddress,
    DHCP_CONST DHCP_SUBNET_ELEMENT_DATA_V5 *RemoveElementInfo,
               DHCP_FORCE_FLAG             ForceFlag
    );





//V6 Api's
DWORD DHCP_API_FUNCTION
DhcpCreateOptionV6(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionId,      
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN      LPDHCP_OPTION          OptionInfo
);
DWORD DHCP_API_FUNCTION                          
DhcpRemoveOptionV6(                               
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
             IN      DHCP_OPTION_ID         OptionID,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName
);
DWORD DHCP_API_FUNCTION				
DhcpEnumOptionsV6(                              
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,
    __in_opt IN      LPWSTR                 ClassName,
    __in_opt IN      LPWSTR                 VendorName,
             IN OUT  DHCP_RESUME_HANDLE    *ResumeHandle,  
             IN      DWORD                  PreferredMaximum, 
             OUT     LPDHCP_OPTION_ARRAY   *Options,       
             OUT     DWORD                 *OptionsRead,  
             OUT     DWORD                 *OptionsTotal   
);

DWORD DHCP_API_FUNCTION 
DhcpRemoveOptionValueV6(
    __in_opt       LPWSTR                 ServerIpAddress,
           IN      DWORD                  Flags,
           IN      DHCP_OPTION_ID         OptionID,
    __in_opt       LPWSTR                 ClassName,
    __in_opt       LPWSTR                 VendorName,
           IN      LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo
);
DWORD DHCP_API_FUNCTION
DhcpGetOptionInfoV6(
    __in_opt       LPWSTR                 ServerIpAddress,
           IN      DWORD                  Flags,
           IN      DHCP_OPTION_ID         OptionID,
    __in_opt       LPWSTR                 ClassName,
    __in_opt       LPWSTR                 VendorName,
           OUT     LPDHCP_OPTION         *OptionInfo     
);

DWORD DHCP_API_FUNCTION 
DhcpSetOptionInfoV6(
    __in_opt	LPWSTR	        ServerIpAddress,
          IN	DWORD	        Flags,
          IN	DHCP_OPTION_ID	OptionID,
    __in_opt	LPWSTR	        ClassName,
    __in_opt	LPWSTR	        VendorName,
          IN	LPDHCP_OPTION	OptionInfo
);

DWORD DHCP_API_FUNCTION                           
DhcpSetOptionValueV6(                             
    __in_opt      LPWSTR                 ServerIpAddress,
          IN      DWORD                  Flags,
          IN      DHCP_OPTION_ID         OptionId,
    __in_opt      LPWSTR                 ClassName,
    __in_opt      LPWSTR                 VendorName,
          IN      LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo,
          IN      LPDHCP_OPTION_DATA     OptionValue
);  




DWORD DHCP_API_FUNCTION
DhcpGetSubnetInfoVQ(
    __in_z_opt DHCP_CONST WCHAR      *ServerIpAddress,
               DHCP_IP_ADDRESS       SubnetAddress,
    __out      LPDHCP_SUBNET_INFO_VQ *SubnetInfo
    );

DWORD DHCP_API_FUNCTION
DhcpCreateSubnetVQ(
    __in_z_opt DHCP_CONST WCHAR         *ServerIpAddress,
               DHCP_IP_ADDRESS          SubnetAddress,
    __in DHCP_CONST DHCP_SUBNET_INFO_VQ *SubnetInfo
    );

DWORD DHCP_API_FUNCTION
DhcpSetSubnetInfoVQ(
    __in_z_opt DHCP_CONST WCHAR         *ServerIpAddress,
               DHCP_IP_ADDRESS          SubnetAddress,
    __in DHCP_CONST DHCP_SUBNET_INFO_VQ *SubnetInfo
    );

DWORD DHCP_API_FUNCTION
DhcpEnumOptionValuesV6(
    __in_z_opt DHCP_CONST WCHAR *ServerIpAddress,
               DWORD                     Flags,
    __in_opt   LPWSTR                    ClassName,
    __in_opt   LPWSTR                    VendorName,
               LPDHCP_OPTION_SCOPE_INFO6 ScopeInfo,
               DHCP_RESUME_HANDLE        *ResumeHandle,
               DWORD                     PreferredMaximum,
               LPDHCP_OPTION_VALUE_ARRAY *OptionValues,
               DWORD                     *OptionsRead,
               DWORD                     *OptionsTotal
    );

#endif

//DOC DhcpDsInit must be called exactly once per process.. this initializes the
//DOC memory and other structures for this process.  This initializes some DS
//DOC object handles (memory), and hence is slow as this has to read from DS.
DWORD
DhcpDsInit(
    VOID
);

//DOC DhcpDsCleanup undoes the effect of any DhcpDsInit.  This function should be
//DOC called exactly once for each process, and only at termination.  Note that
//DOC it is safe to call this function even if DhcpDsInit does not succeed.
VOID
DhcpDsCleanup(
    VOID
);


DWORD
DhcpSetThreadOptions(                             // set options for current thread
    IN      DWORD                  Flags,         // options, currently 0 or DHCP_FLAGS_DONT_ACCESS_DS
    IN      LPVOID                 Reserved       // must be NULL, reserved for future
);

//DOC DhcpGetThreadOptions retrieves the current thread options as set by DhcpSetThreadOptions.
//DOC If none were set, the return value is zero.
DWORD
DhcpGetThreadOptions(                             // get current thread options
    OUT     LPDWORD                pFlags,        // this DWORD is filled with current optiosn..
    IN OUT  LPVOID                 Reserved       // must be NULL, reserved for future
);


DWORD                                             // Status code
DhcpServerQueryAttribute(                         // get a server status
    __in_opt IN      LPWSTR                 ServerIpAddr,  // String form of server IP
             IN      ULONG                  dwReserved,    // reserved for future
             IN      DHCP_ATTRIB_ID         DhcpAttribId,  // the attrib being queried
             OUT     LPDHCP_ATTRIB         *pDhcpAttrib    // fill in this field
);

DWORD                                             // Status code
DhcpServerQueryAttributes(                        // query multiple attributes
    __in_opt IN      LPWSTR                 ServerIpAddr,  // String form of server IP
             IN      ULONG                  dwReserved,    // reserved for future
             IN      ULONG                  dwAttribCount, // # of attribs being queried
             IN      DHCP_ATTRIB_ID         pDhcpAttribs[],// array of attribs
             OUT     LPDHCP_ATTRIB_ARRAY   *pDhcpAttribArr // Ptr is filled w/ array
);

DWORD                                             // Status code
DhcpServerRedoAuthorization(                      // retry the rogue server stuff
    __in_opt IN      LPWSTR                 ServerIpAddr,  // String form of server IP
             IN      ULONG                  dwReserved     // reserved for future
);

DWORD
DhcpAuditLogSetParams(                            // set some auditlogging params
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  Flags,         // currently must be zero
    __in_opt IN      LPWSTR                 AuditLogDir,   // directory to log files in..
             IN      DWORD                  DiskCheckInterval, // how often to check disk space?
             IN      DWORD                  MaxLogFilesSize,   // how big can all logs files be..
             IN      DWORD                  MinSpaceOnDisk     // mininum amt of free disk space
);

DWORD
DhcpAuditLogGetParams(                                
    __in_opt        IN      LPWSTR                 ServerIpAddress,
                    IN      DWORD                  Flags,         
    __deref_out_opt OUT     LPWSTR                *AuditLogDir,   
                    OUT     DWORD                 *DiskCheckInterval, 
                    OUT     DWORD                 *MaxLogFilesSize,   
                    OUT     DWORD                 *MinSpaceOnDisk     
);




DWORD
DhcpServerQueryDnsRegCredentials(
    __in_opt IN              LPWSTR ServerIpAddress,
             IN              ULONG  UnameSize, //in BYTES
    __out_ecount(UnameSize)  LPWSTR Uname,
             IN              ULONG  DomainSize, // in BYTES
    __out_ecount(DomainSize) LPWSTR Domain
    );

DWORD
DhcpServerSetDnsRegCredentials(
    __in_opt IN LPWSTR ServerIpAddress,
    __in_opt IN LPWSTR Uname,
    __in_opt IN LPWSTR Domain,
    __in_opt IN LPWSTR Passwd
    );

DWORD
DhcpServerSetDnsRegCredentialsV5(
    __in_opt IN LPWSTR ServerIpAddress,
    __in_opt IN LPWSTR Uname,
    __in_opt IN LPWSTR Domain,
    __in_opt IN LPWSTR Passwd
    );

DWORD
DhcpServerBackupDatabase(
    __in_opt IN LPWSTR ServerIpAddress,
    __in IN LPWSTR Path
    );

DWORD
DhcpServerRestoreDatabase(
    __in_opt IN LPWSTR ServerIpAddress,
    __in IN LPWSTR Path
    );

//
//  All Quarantine related APIs
//

DWORD DHCP_API_FUNCTION
DhcpServerSetConfigVQ(
    __in_z_opt DHCP_CONST WCHAR             *ServerIpAddress,
               DWORD                        FieldsToSet,
               LPDHCP_SERVER_CONFIG_INFO_VQ ConfigInfo
    );

DWORD DHCP_API_FUNCTION
DhcpServerGetConfigVQ(
    __in_z_opt DHCP_CONST WCHAR             *ServerIpAddress,
               LPDHCP_SERVER_CONFIG_INFO_VQ *ConfigInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetServerSpecificStrings(
    __in_z_opt DHCP_CONST WCHAR               *ServerIpAddress,
               LPDHCP_SERVER_SPECIFIC_STRINGS *ServerSpecificStrings
    );

void DHCP_API_FUNCTION 
DhcpServerAuditlogParamsFree(
    DHCP_SERVER_CONFIG_INFO_VQ *ConfigInfo
    );

DWORD DHCP_API_FUNCTION 
DhcpCreateSubnetV6(
    __in_opt LPWSTR                ServerIpAddress,
             DHCP_IPV6_ADDRESS     SubnetAddress,
             LPDHCP_SUBNET_INFO_V6 SubnetInfo
    );

DWORD DHCP_API_FUNCTION 
DhcpDeleteSubnetV6(
    __in_opt LPWSTR            ServerIpAddress,
             DHCP_IPV6_ADDRESS SubnetAddress,
             DHCP_FORCE_FLAG   ForceFlag
);

DWORD DHCP_API_FUNCTION 
DhcpEnumSubnetsV6(
    __in_z_opt DHCP_CONST WCHAR   *ServerIpAddress,
               DHCP_RESUME_HANDLE *ResumeHandle,
               DWORD              PreferredMaximum,
               LPDHCPV6_IP_ARRAY  *EnumInfo,
               DWORD              *ElementsRead,
               DWORD              *ElementsTotal
    );
    
DWORD DHCP_API_FUNCTION 
DhcpAddSubnetElementV6(
    __in_opt LPWSTR                        ServerIpAddress,
             DHCP_IPV6_ADDRESS             SubnetAddress,
             LPDHCP_SUBNET_ELEMENT_DATA_V6 AddElementInfo
    );
   
DWORD DHCP_API_FUNCTION 
DhcpRemoveSubnetElementV6(
    __in_opt LPWSTR                        ServerIpAddress,
             DHCP_IPV6_ADDRESS             SubnetAddress,
             LPDHCP_SUBNET_ELEMENT_DATA_V6 RemoveElementInfo,
             DHCP_FORCE_FLAG               ForceFlag
    );
    
DWORD DHCP_API_FUNCTION 
DhcpEnumSubnetElementsV6(
    __in_opt LPWSTR                              ServerIpAddress,
             DHCP_IPV6_ADDRESS                   SubnetAddress,
             DHCP_SUBNET_ELEMENT_TYPE_V6         EnumElementType,
             DHCP_RESUME_HANDLE                  *ResumeHandle,
             DWORD                               PreferredMaximum,
             LPDHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 *EnumElementInfo,
             DWORD                               *ElementsRead,
             DWORD                               *ElementsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpGetSubnetInfoV6(
    __in_opt LPWSTR                 ServerIpAddress,
             DHCP_IPV6_ADDRESS      SubnetAddress,
             LPDHCP_SUBNET_INFO_V6 *SubnetInfo
    );


DWORD DHCP_API_FUNCTION
DhcpEnumSubnetClientsV6(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               DHCP_IPV6_ADDRESS           SubnetAddress,
               DHCP_RESUME_IPV6_HANDLE     *ResumeHandle,
               DWORD                       PreferredMaximum,
               LPDHCP_CLIENT_INFO_ARRAY_V6 *ClientInfo,
               DWORD                       *ClientsRead,
               DWORD                       *ClientsTotal
    );

DWORD DHCP_API_FUNCTION
DhcpServerGetConfigV6(
    __in_z_opt DHCP_CONST WCHAR             *ServerIpAddress,
               LPDHCP_OPTION_SCOPE_INFO6    ScopeInfo,    
               LPDHCP_SERVER_CONFIG_INFO_V6 *ConfigInfo
    );

DWORD DHCP_API_FUNCTION  
DhcpServerSetConfigV6(
    __in_z_opt DHCP_CONST WCHAR             *ServerIpAddress,
               LPDHCP_OPTION_SCOPE_INFO6    ScopeInfo,    
               DWORD                        FieldsToSet,
               LPDHCP_SERVER_CONFIG_INFO_V6 ConfigInfo
    );

DWORD
DhcpSetSubnetInfoV6(
    __in_z_opt DHCP_CONST WCHAR       *ServerIpAddress,
               DHCP_IPV6_ADDRESS      SubnetAddress,
	
               LPDHCP_SUBNET_INFO_V6  SubnetInfo
);
DWORD
DhcpGetMibInfoV6(
    __in_z_opt DHCP_CONST WCHAR *  ServerIpAddress,
               LPDHCP_MIB_INFO_V6 *MibInfo
);
DWORD DHCP_API_FUNCTION
DhcpGetServerBindingInfoV6(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               ULONG                       Flags,
               LPDHCPV6_BIND_ELEMENT_ARRAY *BindElementsInfo
);
DWORD DHCP_API_FUNCTION
DhcpSetServerBindingInfoV6(
    __in_z_opt DHCP_CONST WCHAR            *ServerIpAddress,
               ULONG                       Flags,
               LPDHCPV6_BIND_ELEMENT_ARRAY BindElementInfo
);
DWORD DHCP_API_FUNCTION
DhcpSetClientInfoV6(
    __in_z_opt DHCP_CONST WCHAR    *ServerIpAddress,
    DHCP_CONST DHCP_CLIENT_INFO_V6 *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpGetClientInfoV6(
    __in_z_opt DHCP_CONST WCHAR      *ServerIpAddress,
    DHCP_CONST DHCP_SEARCH_INFO_V6   *SearchInfo,
               LPDHCP_CLIENT_INFO_V6 *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpDeleteClientInfoV6(
    __in_z_opt DHCP_CONST WCHAR    *ServerIpAddress,
    DHCP_CONST DHCP_SEARCH_INFO_V6 *ClientInfo
    );

DWORD DHCP_API_FUNCTION
DhcpCreateClassV6(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN      LPDHCP_CLASS_INFO_V6   ClassInfo
);

DWORD DHCP_API_FUNCTION
DhcpModifyClassV6(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN      LPDHCP_CLASS_INFO_V6      ClassInfo
);

DWORD DHCP_API_FUNCTION
DhcpDeleteClassV6(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
    __in     IN      LPWSTR                 ClassName
);

DWORD DHCP_API_FUNCTION
DhcpEnumClassesV6(
    __in_opt IN      LPWSTR                 ServerIpAddress,
             IN      DWORD                  ReservedMustBeZero,
             IN OUT  DHCP_RESUME_HANDLE    *ResumeHandle,
             IN      DWORD                  PreferredMaximum,
             OUT     LPDHCP_CLASS_INFO_ARRAY_V6 *ClassInfoArray,
             OUT     DWORD                 *nRead,
             OUT     DWORD                 *nTotal
);

DWORD DHCP_API_FUNCTION
DhcpSetSubnetDelayOffer (
    __in_opt IN          LPWSTR             ServerIpAddress, 
             IN          DHCP_IP_ADDRESS    SubnetAddress, 
             IN          USHORT             TimeDelayInMilliseconds
);

DWORD DHCP_API_FUNCTION
DhcpGetSubnetDelayOffer (
    __in_opt IN          LPWSTR             ServerIpAddress, 
             IN          DHCP_IP_ADDRESS    SubnetAddress, 
             IN          USHORT *           TimeDelayInMilliseconds
);

DWORD DHCP_API_FUNCTION
DhcpGetMibInfoV5(
__in_z_opt DHCP_CONST WCHAR   *ServerIpAddress,
OUT        LPDHCP_MIB_INFO_V5 *MibInfo
    );

DWORD DHCP_API_FUNCTION
DhcpAddSecurityGroup(
__in_opt LPWSTR  pServer
);


#ifdef __cplusplus
}
#endif

#endif // _DHCSPAPI_

