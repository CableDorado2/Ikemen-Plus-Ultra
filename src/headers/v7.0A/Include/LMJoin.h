/*++

Copyright (c) 1998-1999  Microsoft Corporation

Module Name:

    netsetup.h

Abstract:

    Definitions and prototypes for the Net setup apis, for joining/unjoinging
    domains and promoting/demoting servers

Environment:

    User Mode - Win32
    Portable to any flat, 32-bit environment.  (Uses Win32 typedefs.)
    Requires ANSI C extensions: slash-slash comments, long external names.

Notes:

--*/

#ifndef __LMJOIN_H__
#define __LMJOIN_H__

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif

//
// Types of name that can be validated
//
typedef enum  _NETSETUP_NAME_TYPE {

    NetSetupUnknown = 0,
    NetSetupMachine,
    NetSetupWorkgroup,
    NetSetupDomain,
    NetSetupNonExistentDomain,
#if(_WIN32_WINNT >= 0x0500)
    NetSetupDnsMachine
#endif

} NETSETUP_NAME_TYPE, *PNETSETUP_NAME_TYPE;


//
// Status of a workstation
//
typedef enum _NETSETUP_JOIN_STATUS {

    NetSetupUnknownStatus = 0,
    NetSetupUnjoined,
    NetSetupWorkgroupName,
    NetSetupDomainName

} NETSETUP_JOIN_STATUS, *PNETSETUP_JOIN_STATUS;

//
// Flags to determine the behavior of the join/unjoin APIs
//
#define NETSETUP_JOIN_DOMAIN    0x00000001      // If not present, workgroup is joined
#define NETSETUP_ACCT_CREATE    0x00000002      // Do the server side account creation/rename
#define NETSETUP_ACCT_DELETE    0x00000004      // Delete the account when a domain is left
#define NETSETUP_WIN9X_UPGRADE  0x00000010      // Invoked during upgrade of Windows 9x to
                                                // Windows NT
#define NETSETUP_DOMAIN_JOIN_IF_JOINED  0x00000020  // Allow the client to join a new domain
                                                // even if it is already joined to a domain
#define NETSETUP_JOIN_UNSECURE  0x00000040      // Performs an unsecure join
#define NETSETUP_MACHINE_PWD_PASSED 0x00000080  // Indicates that the machine (not user) password
                                                //  is passed. Valid only for unsecure joins
#define NETSETUP_DEFER_SPN_SET  0x00000100      // Specifies that writting SPN and DnsHostName
                                                //  attributes on the computer object should be
                                                //  defered until rename that will follow join
                                                
#define NETSETUP_JOIN_DC_ACCOUNT    0x00000200  // Allow join if existing account is a DC
#define NETSETUP_JOIN_WITH_NEW_NAME 0x00000400  // Check for computer name change
#define NETSETUP_JOIN_READONLY      0x00000800  // Perform join using a pre-created account w/o requiring a writable DC
#define NETSETUP_DNS_NAME_CHANGES_ONLY 0x00001000      // When performing machine rename only update DNS based names 

#define NETSETUP_INSTALL_INVOCATION 0x00040000  // The APIs were invoked during install

#define NETSETUP_AMBIGUOUS_DC       0x00001000  // When joiing the domain don't try to set the
                                                // preferred DC in the registry.
#define NETSETUP_NO_NETLOGON_CACHE  0x00002000  // Don't create the netlogon cache
#define NETSETUP_DONT_CONTROL_SERVICES 0x00004000 // Don't force netlogon to start
#define NETSETUP_SET_MACHINE_NAME   0x00008000  // For offline join only, set target machine hostname and NB name.
#define NETSETUP_FORCE_SPN_SET      0x00010000  // Override other settings during domain join
                                                // and attempt to set the SPN.
#define NETSETUP_NO_ACCT_REUSE      0x00020000  // Do not reuse an existing account

#define NETSETUP_IGNORE_UNSUPPORTED_FLAGS  0x10000000  // If this bit is set, unrecognized flags
                                                       //  will be ignored by the NetJoin API and
                                                       //  the API will behave as if the flags
                                                       //  were not set.

#define NETSETUP_VALID_UNJOIN_FLAGS (NETSETUP_ACCT_DELETE | NETSETUP_IGNORE_UNSUPPORTED_FLAGS | NETSETUP_JOIN_DC_ACCOUNT)

// The following flags are used when the system is processing information left from a prior offline
// join.  We want to force DC discovery and we don't want to create the netlogon cache.  We also
// don't want to immediately force netlogon to start, let it start on its own.
#define NETSETUP_PROCESS_OFFLINE_FLAGS ( NETSETUP_JOIN_DOMAIN |                     \
                                         NETSETUP_DOMAIN_JOIN_IF_JOINED |           \
                                         NETSETUP_JOIN_WITH_NEW_NAME |              \
                                         NETSETUP_DONT_CONTROL_SERVICES |           \
                                         NETSETUP_MACHINE_PWD_PASSED)  

//
// 0x80000000 is reserved for internal use only
//


//
// Joins a machine to the domain.
//
NET_API_STATUS
NET_API_FUNCTION
NetJoinDomain(
    IN  LPCWSTR lpServer OPTIONAL,
    IN  LPCWSTR lpDomain,
    IN  LPCWSTR lpAccountOU, OPTIONAL
    IN  LPCWSTR lpAccount OPTIONAL,
    __in_opt IN  LPCWSTR lpPassword OPTIONAL,
    IN  DWORD   fJoinOptions
    );
    

#if(_WIN32_WINNT >= 0x0601)  

//
// Flags to determine the behavior of NetProvisionComputerAccount
//

// The caller requires account creation by privilege, this option will cause a retry 
// on failure using down level account creation APIs.
//
#define NETSETUP_PROVISION_DOWNLEVEL_PRIV_SUPPORT 0x00000001 

// If the named account already exists an attempt will be made to reuse. Requires 
// sufficient credentials i.e. Domain Administrator or the object owner.
//
#define NETSETUP_PROVISION_REUSE_ACCOUNT          0x00000002 
                                                    
// Use the default machine account password which is the machine name in lowercase.
//
#define NETSETUP_PROVISION_USE_DEFAULT_PASSWORD   0x00000004 
                                                 
// Do not try to find the account on any DC in the domain. This is faster but 
// should only be used when the caller is certain that an account by the same 
// name hasn't recently been created. Only valid when specifying the target DC. 
// When the pre-requisites are met, this option allows for must faster provisioning 
// useful for scenarios such as batch processing.         
//
#define NETSETUP_PROVISION_SKIP_ACCOUNT_SEARCH    0x00000008   

//
// The following are reserved for internal use.
//

// The operation is online.
// This is an internal option not available through the API.
//
#define NETSETUP_PROVISION_ONLINE_CALLER          0x40000000          

// Validate the machine password only. This is an internal option not available
// through the API.          
//
#define NETSETUP_PROVISION_CHECK_PWD_ONLY         0x80000000



NET_API_STATUS
NET_API_FUNCTION
NetProvisionComputerAccount( 
   __in            LPCWSTR lpDomain,
   __in            LPCWSTR lpMachineName,
   __in_opt        LPCWSTR lpMachineAccountOU,
   __in_opt        LPCWSTR lpDcName,  
   __in            DWORD   dwOptions,
   __deref_opt_out PBYTE  *pProvisionBinData,
   __out_opt       DWORD  *pdwProvisionBinDataSize,
   __deref_opt_out LPWSTR *pProvisionTextData
);

NET_API_STATUS
NET_API_FUNCTION
NetRequestOfflineDomainJoin(
    __in_bcount(cbProvisionBinDataSize) BYTE *pProvisionBinData,
    __in DWORD   cbProvisionBinDataSize,
    __in DWORD   dwOptions,
    __in LPCWSTR lpWindowsPath
);

#endif // (_WIN32_WINNT >= 0x0601)  

NET_API_STATUS
NET_API_FUNCTION
NetUnjoinDomain(
    IN  LPCWSTR lpServer OPTIONAL,
    IN  LPCWSTR lpAccount OPTIONAL,
    __in_opt IN  LPCWSTR lpPassword OPTIONAL,
    IN  DWORD   fUnjoinOptions
    );

NET_API_STATUS
NET_API_FUNCTION
NetRenameMachineInDomain(
    IN  LPCWSTR lpServer OPTIONAL,
    IN  LPCWSTR lpNewMachineName OPTIONAL,
    IN  LPCWSTR lpAccount OPTIONAL,
    __in_opt IN  LPCWSTR lpPassword OPTIONAL,
    IN  DWORD   fRenameOptions
    );


//
// Determine the validity of a name
//
NET_API_STATUS
NET_API_FUNCTION
NetValidateName(
    IN  LPCWSTR             lpServer OPTIONAL,
    IN  LPCWSTR             lpName,
    IN  LPCWSTR             lpAccount OPTIONAL,
    __in_opt IN  LPCWSTR             lpPassword OPTIONAL,
    IN  NETSETUP_NAME_TYPE  NameType
    );

//
// Determines whether a workstation is joined to a domain or not
//
NET_API_STATUS
NET_API_FUNCTION
NetGetJoinInformation(
    __in_opt IN   LPCWSTR                lpServer OPTIONAL,
    __out_opt OUT  LPWSTR                *lpNameBuffer,
    OUT  PNETSETUP_JOIN_STATUS  BufferType
    );


//
// Determines the list of OUs that the client can create a machine account in
//
NET_API_STATUS
NET_API_FUNCTION
NetGetJoinableOUs(
    IN  LPCWSTR     lpServer OPTIONAL,
    IN  LPCWSTR     lpDomain,
    IN  LPCWSTR     lpAccount OPTIONAL,
    __in_opt IN  LPCWSTR     lpPassword OPTIONAL,
    __out_opt OUT DWORD      *OUCount,
    __deref_out OUT LPWSTR    **OUs
    );
    
#if(_WIN32_WINNT >= 0x0501)

//
// Computer rename preparation APIs
//

#define NET_IGNORE_UNSUPPORTED_FLAGS  0x01

NET_API_STATUS
NET_API_FUNCTION
NetAddAlternateComputerName(
    IN  LPCWSTR Server OPTIONAL,
    IN  LPCWSTR AlternateName,
    IN  LPCWSTR DomainAccount OPTIONAL,
    __in_opt IN  LPCWSTR DomainAccountPassword OPTIONAL,
    IN  ULONG Reserved
    );

NET_API_STATUS
NET_API_FUNCTION
NetRemoveAlternateComputerName(
    IN  LPCWSTR Server OPTIONAL,
    IN  LPCWSTR AlternateName,
    IN  LPCWSTR DomainAccount OPTIONAL,
    __in_opt IN  LPCWSTR DomainAccountPassword OPTIONAL,
    IN  ULONG Reserved
    );

NET_API_STATUS
NET_API_FUNCTION
NetSetPrimaryComputerName(
    IN  LPCWSTR Server OPTIONAL,
    IN  LPCWSTR PrimaryName,
    IN  LPCWSTR DomainAccount OPTIONAL,
    __in_opt IN  LPCWSTR DomainAccountPassword OPTIONAL,
    IN  ULONG Reserved
    );

//
// The following enumeration must be kept
// in sync with COMPUTER_NAME_TYPE defined
// in winbase.h
//

typedef enum _NET_COMPUTER_NAME_TYPE {
    NetPrimaryComputerName,
    NetAlternateComputerNames,
    NetAllComputerNames,
    NetComputerNameTypeMax
} NET_COMPUTER_NAME_TYPE, *PNET_COMPUTER_NAME_TYPE;

NET_API_STATUS
NET_API_FUNCTION
NetEnumerateComputerNames(
    IN  LPCWSTR Server OPTIONAL,
    IN  NET_COMPUTER_NAME_TYPE NameType,
    IN  ULONG Reserved,
    __out OUT PDWORD EntryCount,
    __deref_out OUT LPWSTR **ComputerNames
    );
    
#endif // (_WIN32_WINNT >= 0x0501) 

#ifdef __cplusplus
}
#endif

#endif // __LMJOIN_H__

