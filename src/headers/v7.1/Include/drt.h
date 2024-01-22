//+---------------------------------------------------------------------------
//
// Microsoft Windows
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
// File:     drt.h
//
// Contents: Win32 APIs and structures for the Microsoft Distributed Routing Table. 
//
// Questions or feedback:
//
// Email:     peerfb@microsoft.com
// Website:   http://www.microsoft.com/p2p
// Newsgroup: microsoft.public.win32.programmer.networks
//
//----------------------------------------------------------------------------

#ifndef _DRT_H_
#define _DRT_H_

#ifndef MIDL_PASS
#include <specstrings.h>
#include <winsock2.h>
#include <ws2tcpip.h>  // for sockaddrin_6
#include <wincrypt.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

//////////////////////////////////////////////////////////////////////////////
// Constants

typedef PVOID HDRT;
typedef PVOID HDRT_SEARCH_CONTEXT;
typedef PVOID HDRT_TRANSPORT;
typedef PVOID HDRT_REGISTRATION_CONTEXT;

#define FACILITY_DRT      98
#define DRT_E_TIMEOUT                             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1001)
#define DRT_E_INVALID_KEY_SIZE                    MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1002)
#define DRT_E_INVALID_CERT_CHAIN                  MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1004)
#define DRT_E_INVALID_MESSAGE                     MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1005)
#define DRT_E_NO_MORE                             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1006)
#define DRT_E_INVALID_MAX_ADDRESSES               MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1007)
#define DRT_E_SEARCH_IN_PROGRESS                  MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1008)
#define DRT_E_INVALID_KEY                         MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1009)

#define DRT_S_RETRY                               MAKE_HRESULT(SEVERITY_SUCCESS, FACILITY_DRT, 0x1010)
#define DRT_E_INVALID_MAX_ENDPOINTS               MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1011)
#define DRT_E_INVALID_SEARCH_RANGE                MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x1012)

#define DRT_E_INVALID_PORT                        MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2000)
#define DRT_E_INVALID_TRANSPORT_PROVIDER          MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2001)
#define DRT_E_INVALID_SECURITY_PROVIDER           MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2002)
#define DRT_E_STILL_IN_USE                        MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2003)
#define DRT_E_INVALID_BOOTSTRAP_PROVIDER          MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2004)
#define DRT_E_INVALID_ADDRESS                     MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2005)
#define DRT_E_INVALID_SCOPE                       MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2006)
#define DRT_E_TRANSPORT_SHUTTING_DOWN             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2007)
#define DRT_E_NO_ADDRESSES_AVAILABLE              MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2008)
#define DRT_E_DUPLICATE_KEY                       MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2009)
#define DRT_E_TRANSPORTPROVIDER_IN_USE            MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x200a)
#define DRT_E_TRANSPORTPROVIDER_NOT_ATTACHED      MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x200b)
#define DRT_E_SECURITYPROVIDER_IN_USE             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x200c)
#define DRT_E_SECURITYPROVIDER_NOT_ATTACHED       MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x200d)
#define DRT_E_BOOTSTRAPPROVIDER_IN_USE            MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x200e)
#define DRT_E_BOOTSTRAPPROVIDER_NOT_ATTACHED      MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x200f)

#define DRT_E_TRANSPORT_ALREADY_BOUND             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2101)
#define DRT_E_TRANSPORT_NOT_BOUND                 MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2102)
#define DRT_E_TRANSPORT_UNEXPECTED                MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2103)
#define DRT_E_TRANSPORT_INVALID_ARGUMENT          MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2104)
#define DRT_E_TRANSPORT_NO_DEST_ADDRESSES         MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2105)
#define DRT_E_TRANSPORT_EXECUTING_CALLBACK        MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2106)
#define DRT_E_TRANSPORT_ALREADY_EXISTS_FOR_SCOPE  MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2107)
#define DRT_E_INVALID_SETTINGS                    MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2108)
#define DRT_E_INVALID_SEARCH_INFO                 MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x2109)
#define DRT_E_FAULTED                             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x210a)
#define DRT_E_TRANSPORT_STILL_BOUND               MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x210b)
#define DRT_E_INSUFFICIENT_BUFFER                 MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x210c)
#define DRT_E_INVALID_INSTANCE_PREFIX             MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x210d)
#define DRT_E_INVALID_SECURITY_MODE               MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x210e)
#define DRT_E_CAPABILITY_MISMATCH                 MAKE_HRESULT(SEVERITY_ERROR,   FACILITY_DRT, 0x210f)



#define DRT_PAYLOAD_REVOKED     (1<<0)
#define DRT_MIN_ROUTING_ADDRESSES 1
#define DRT_MAX_ROUTING_ADDRESSES 20
#define DRT_MAX_PAYLOAD_SIZE 5120
#define DRT_MAX_INSTANCE_PREFIX_LEN  128

#define DRT_LINK_LOCAL_ISATAP_SCOPEID 0xffffffff


//////////////////////////////////////////////////////////////////////////////
// Enums

typedef enum drt_scope_tag
{
    DRT_GLOBAL_SCOPE     = 1,
    DRT_SITE_LOCAL_SCOPE = 2,
    DRT_LINK_LOCAL_SCOPE = 3,
} DRT_SCOPE;

typedef enum drt_status_tag
{
    DRT_ACTIVE        = 0,
    DRT_ALONE         = 1,
    DRT_NO_NETWORK    = 10,
    DRT_FAULTED       = 20,
} DRT_STATUS;

typedef enum drt_match_type_tag
{
    DRT_MATCH_EXACT        = 0,
    DRT_MATCH_NEAR         = 1,
    DRT_MATCH_INTERMEDIATE = 2,
} DRT_MATCH_TYPE;

typedef enum drt_leafset_key_change_type_tag
{
    DRT_LEAFSET_KEY_ADDED    = 0,
    DRT_LEAFSET_KEY_DELETED  = 1,
} DRT_LEAFSET_KEY_CHANGE_TYPE;

typedef enum drt_event_type_tag
{
    DRT_EVENT_STATUS_CHANGED      = 0,
    DRT_EVENT_LEAFSET_KEY_CHANGED = 1,
    DRT_EVENT_REGISTRATION_STATE_CHANGED = 2,
} DRT_EVENT_TYPE;

typedef enum drt_security_mode_tag
{
    DRT_SECURE_RESOLVE = 0,
    DRT_SECURE_MEMBERSHIP = 1,
    DRT_SECURE_CONFIDENTIALPAYLOAD = 2,
} DRT_SECURITY_MODE;

typedef enum _DRT_REGISTRATION_STATE
{
    DRT_REGISTRATION_STATE_UNRESOLVEABLE = 1

} DRT_REGISTRATION_STATE, *PDRT_REGISTRATION_STATE;

typedef enum _DRT_ADDRESS_FLAGS
{
    DRT_ADDRESS_FLAG_ACCEPTED                   = 0x01,
    DRT_ADDRESS_FLAG_REJECTED                   = 0x02,
    DRT_ADDRESS_FLAG_UNREACHABLE                = 0x04,
    DRT_ADDRESS_FLAG_LOOP                       = 0x08,
    DRT_ADDRESS_FLAG_TOO_BUSY                   = 0x10,
    DRT_ADDRESS_FLAG_BAD_VALIDATE_ID            = 0x20,
    DRT_ADDRESS_FLAG_SUSPECT_UNREGISTERED_ID    = 0x40,
    DRT_ADDRESS_FLAG_INQUIRE                    = 0x80

} DRT_ADDRESS_FLAGS, *PDRT_ADDRESS_FLAGS;

//////////////////////////////////////////////////////////////////////////////
// Structures

typedef struct drt_data_tag
{
    ULONG cb;
    BYTE* pb;
} DRT_DATA, *PDRT_DATA;
typedef const DRT_DATA *PCDRT_DATA;

typedef struct drt_registration_tag
{
    DRT_DATA key;
    DRT_DATA appData;
} DRT_REGISTRATION, *PDRT_REGISTRATION;
typedef const DRT_REGISTRATION *PCDRT_REGISTRATION;

typedef struct drt_security_provider_tag
{
    PVOID pvContext;

    HRESULT (*Attach)(
        __in        const PVOID pvContext);

    VOID    (*Detach)(
        __in        const PVOID pvContext);

    HRESULT (*RegisterKey)(
        __in        const PVOID pvContext,
        __in        const DRT_REGISTRATION* pRegistration,
        __in_opt    PVOID pvKeyContext);

    HRESULT (*UnregisterKey)(
        __in        const PVOID pvContext,
        __in        const DRT_DATA* pKey,
        __in_opt    PVOID pvKeyContext);

    HRESULT (*ValidateAndUnpackPayload)(
        __in        const PVOID pvContext,
        __in        DRT_DATA* pSecuredAddressPayload,
        __in_opt    DRT_DATA* pCertChain,
        __in_opt    DRT_DATA* pClassifier,
        __in_opt    DRT_DATA* pNonce,
        __in_opt    DRT_DATA* pSecuredPayload,

        __out       BYTE* pbProtocolMajor,
        __out       BYTE* pbProtocolMinor,
        __out       DRT_DATA* pKey,
        __out_opt   DRT_DATA* pPayload,
        __out       CERT_PUBLIC_KEY_INFO** ppPublicKey,
        __out_opt   SOCKET_ADDRESS_LIST** ppAddressList,
        __out       DWORD* pdwFlags);

    HRESULT (*SecureAndPackPayload)(
        __in        const PVOID pvContext,
        __in_opt    PVOID pvKeyContext,
                    BYTE bProtocolMajor,
                    BYTE bProtocolMinor,
                    DWORD dwFlags,
        __in        const DRT_DATA* pKey,
        __in_opt    const DRT_DATA* pPayload,
        __in_opt    const SOCKET_ADDRESS_LIST* pAddressList,
        __in        const DRT_DATA* pNonce,

        __out       DRT_DATA* pSecuredAddressPayload,
        __out_opt   DRT_DATA* pClassifier,
        __out_opt   DRT_DATA* pSecuredPayload,
        __out_opt   DRT_DATA* pCertChain);

    void (*FreeData)(
        __in        const PVOID pvContext,
        __in_opt    PVOID pv);


    HRESULT (*EncryptData)(
        __in                                    const PVOID pvContext,
        __in                                    const DRT_DATA* pRemoteCredential,
        __in                                    DWORD dwBuffers,
        __in_ecount(dwBuffers)      DRT_DATA* pDataBuffers,
        __out_ecount(dwBuffers)     DRT_DATA* pEncryptedBuffers,
        __out                                   DRT_DATA *pKeyToken
        );
        
    HRESULT (*DecryptData)(
        __in                                    const PVOID pvContext,
        __in                                    DRT_DATA* pKeyToken,
        __in                                    const PVOID pvKeyContext,
        __in                                    DWORD dwBuffers,
        __inout_ecount(dwBuffers) DRT_DATA* pData
        );

    HRESULT (*GetSerializedCredential)(
        __in                             const PVOID pvContext,
        __out                           DRT_DATA *pSelfCredential);

    HRESULT (*ValidateRemoteCredential)(
        __in                                const PVOID pvContext,
        __in                                DRT_DATA *pRemoteCredential);

    HRESULT (*SignData)(
        __in                                const PVOID pvContext,
        __in                                DWORD dwBuffers,
        __in_ecount(dwBuffers) DRT_DATA* pDataBuffers,
        __out                               DRT_DATA *pKeyIdentifier,
        __out                               DRT_DATA *pSignature);

    HRESULT (*VerifyData)(
        __in                                const PVOID pvContext,
        __in                                DWORD dwBuffers,
        __in_ecount(dwBuffers) DRT_DATA* pDataBuffers,
        __in                                DRT_DATA *pRemoteCredentials,
        __in                                DRT_DATA *pKeyIdentifier,
        __in                                DRT_DATA *pSignature);

} DRT_SECURITY_PROVIDER, *PDRT_SECURITY_PROVIDER;
typedef const DRT_SECURITY_PROVIDER *PCDRT_SECURITY_PROVIDER;

typedef PVOID   DRT_BOOTSTRAP_RESOLVE_CONTEXT;

typedef void (CALLBACK* DRT_BOOTSTRAP_RESOLVE_CALLBACK)(HRESULT hr, PVOID pvContext, SOCKET_ADDRESS_LIST* pAddresses, BOOL fFatalError);

typedef struct drt_bootstrap_provider_tag
{
    PVOID pvContext;

    HRESULT (*Attach)(
        __in        const PVOID pvContext);

    VOID (*Detach)(
        __in        const PVOID pvContext);

    HRESULT (*InitResolve)(
        __in        const PVOID pvContext,
        __in        BOOL fSplitDetect,
        __in        ULONG timeout,
        __in        ULONG cMaxResults,
        __out       DRT_BOOTSTRAP_RESOLVE_CONTEXT* ResolveContext,
        __out       BOOL* fFatalError
                    );
    HRESULT (*IssueResolve)(
        __in        const PVOID pvContext,
        __in        const PVOID pvCallbackContext,
        __in        DRT_BOOTSTRAP_RESOLVE_CALLBACK callback,
        __in        DRT_BOOTSTRAP_RESOLVE_CONTEXT  ResolveContext,
        __out       BOOL* fFatalError
        );

    VOID (*EndResolve)(
        __in        const PVOID pvContext,
        __in        DRT_BOOTSTRAP_RESOLVE_CONTEXT  ResolveContext
        );

    HRESULT (*Register)(
        __in        const PVOID pvContext,
        __in        const SOCKET_ADDRESS_LIST* pAddressList);

    VOID (*Unregister)(
        __in        const PVOID pvContext
        );

} DRT_BOOTSTRAP_PROVIDER, *PDRT_BOOTSTRAP_PROVIDER;
typedef const DRT_BOOTSTRAP_PROVIDER *PCDRT_BOOTSTRAP_PROVIDER;

typedef struct drt_settings_tag
{
    DWORD dwSize;
    ULONG cbKey;

    BYTE  bProtocolMajorVersion;
    BYTE  bProtocolMinorVersion;

    ULONG ulMaxRoutingAddresses;
    PWSTR pwzDrtInstancePrefix;
    HDRT_TRANSPORT hTransport;
    
    DRT_SECURITY_PROVIDER* pSecurityProvider;
    DRT_BOOTSTRAP_PROVIDER* pBootstrapProvider;
    DRT_SECURITY_MODE eSecurityMode;

} DRT_SETTINGS, *PDRT_SETTINGS;

typedef const DRT_SETTINGS *PCDRT_SETTINGS;

typedef struct drt_search_info_tag
{
    DWORD dwSize;
    BOOL fIterative;
    BOOL fAllowCurrentInstanceMatch;
    BOOL fAnyMatchInRange;
    ULONG cMaxEndpoints;
    DRT_DATA* pMaximumKey;
    DRT_DATA* pMinimumKey;

} DRT_SEARCH_INFO, *PDRT_SEARCH_INFO;
typedef const DRT_SEARCH_INFO *PCDRT_SEARCH_INFO;

typedef struct _DRT_ADDRESS
{
    SOCKADDR_STORAGE    socketAddress;
    ULONG               flags;
    LONG                nearness;
    ULONG               latency;

} DRT_ADDRESS, *PDRT_ADDRESS;

typedef struct _DRT_ADDRESS_LIST {

    ULONG                                       AddressCount;
    __field_ecount(AddressCount) DRT_ADDRESS    AddressList[1];

} DRT_ADDRESS_LIST, *PDRT_ADDRESS_LIST;
typedef const DRT_ADDRESS_LIST *PCDRT_ADDRESS_LIST;

typedef struct drt_search_result_tag
{
    DWORD dwSize;
    DRT_MATCH_TYPE type;
    PVOID pvContext;
    DRT_REGISTRATION registration;

} DRT_SEARCH_RESULT, *PDRT_SEARCH_RESULT;
typedef const DRT_SEARCH_RESULT *PCDRT_SEARCH_RESULT;

typedef struct drt_event_data_tag
{
    DRT_EVENT_TYPE type;
    HRESULT hr;
    PVOID pvContext;

    union
    {
        struct
        {
            DRT_LEAFSET_KEY_CHANGE_TYPE change;
            DRT_DATA localKey;
            DRT_DATA remoteKey;
        } leafsetKeyChange;

        struct
        {
            DRT_REGISTRATION_STATE  state;
            DRT_DATA localKey;
        } registrationStateChange;

        struct
        {
            DRT_STATUS status;
            struct
            {
                ULONG                   cntAddress;
                PSOCKADDR_STORAGE       pAddresses;
            } bootstrapAddresses;
        } statusChange;
    };
} DRT_EVENT_DATA, *PDRT_EVENT_DATA;
typedef const DRT_EVENT_DATA *PCDRT_EVENT_DATA;


//////////////////////////////////////////////////////////////////////////////
// DRT Default Module Management APIs

HRESULT WINAPI DrtCreatePnrpBootstrapResolver(
    __in        BOOL   fPublish,
    __in        PCWSTR pwzPeerName,
    __in_opt    PCWSTR pwzCloudName,
    __in_opt    PCWSTR pwzPublishingIdentity,
    __out       DRT_BOOTSTRAP_PROVIDER** ppResolver);

void WINAPI DrtDeletePnrpBootstrapResolver(
    __in        DRT_BOOTSTRAP_PROVIDER* pResolver);

HRESULT WINAPI DrtCreateDnsBootstrapResolver(
    __in USHORT port,
    __in PCWSTR pwszAddress,
    __out DRT_BOOTSTRAP_PROVIDER** ppModule
    );

void WINAPI DrtDeleteDnsBootstrapResolver(
    __in DRT_BOOTSTRAP_PROVIDER* pResolver
    );

HRESULT WINAPI DrtCreateIpv6UdpTransport(
                DRT_SCOPE scope,
                ULONG dwScopeId,
                ULONG dwLocalityThreshold,
    __inout     USHORT *pwPort,
    __out       HDRT_TRANSPORT *phTransport);

HRESULT WINAPI DrtDeleteIpv6UdpTransport(
    __in        HDRT_TRANSPORT hTransport);

HRESULT WINAPI DrtCreateDerivedKeySecurityProvider(
    __in        PCCERT_CONTEXT pRootCert,
    __in_opt    PCCERT_CONTEXT pLocalCert,
    __out       DRT_SECURITY_PROVIDER** ppSecurityProvider);

HRESULT WINAPI DrtCreateDerivedKey(
    __in        PCCERT_CONTEXT pLocalCert,
    __out       DRT_DATA* pKey);

void WINAPI DrtDeleteDerivedKeySecurityProvider(
    __in        DRT_SECURITY_PROVIDER* pSecurityProvider);

HRESULT WINAPI DrtCreateNullSecurityProvider(
    __out DRT_SECURITY_PROVIDER** ppSecurityProvider);

void WINAPI DrtDeleteNullSecurityProvider(
    __in DRT_SECURITY_PROVIDER* pSecurityProvider);

//////////////////////////////////////////////////////////////////////////////
// DRT Lifetime Management APIs

HRESULT WINAPI DrtOpen(
    __in        const DRT_SETTINGS* pSettings,
    __in_opt    HANDLE hEvent,
    __in_opt    const PVOID pvContext,
    __out       HDRT *phDrt);

VOID WINAPI DrtClose(
    __in        HDRT hDrt);

HRESULT WINAPI DrtGetEventDataSize(
    __in        HDRT hDrt,
    __out       ULONG          *pulEventDataLen);
    
HRESULT WINAPI DrtGetEventData(
    __in        HDRT hDrt,
    __in        ULONG          ulEventDataLen,
    __out_bcount_full(ulEventDataLen) DRT_EVENT_DATA *pEventData);

//////////////////////////////////////////////////////////////////////////////
// DRT Key Registration APIs

HRESULT WINAPI DrtRegisterKey(
    __in        HDRT hDrt,
    __in        DRT_REGISTRATION *pRegistration,
    __in_opt    PVOID pvKeyContext,
    __out       HDRT_REGISTRATION_CONTEXT *phKeyRegistration);

HRESULT WINAPI DrtUpdateKey(
    __in        HDRT_REGISTRATION_CONTEXT hKeyRegistration,
    __in        DRT_DATA *pAppData
    );

VOID WINAPI DrtUnregisterKey(
    __in        HDRT_REGISTRATION_CONTEXT hKeyRegistration);

//////////////////////////////////////////////////////////////////////////////
// DRT Search APIs

HRESULT WINAPI DrtStartSearch(
    __in        HDRT hDrt,
    __in        DRT_DATA *pKey,
    __in_opt    const DRT_SEARCH_INFO *pInfo,
                ULONG timeout,
    __in        HANDLE hEvent,
    __in_opt    const PVOID pvContext,
    __out       HDRT_SEARCH_CONTEXT* hSearchContext);

HRESULT WINAPI DrtContinueSearch(
    __in        HDRT_SEARCH_CONTEXT hSearchContext);

HRESULT WINAPI DrtGetSearchResultSize(
    __in        HDRT_SEARCH_CONTEXT hSearchContext,
    __out       ULONG               *pulSearchResultSize);

HRESULT WINAPI DrtGetSearchResult(
    __in        HDRT_SEARCH_CONTEXT hSearchContext,
    __inout     ULONG               ulSearchResultSize, 
    __out_bcount_full(ulSearchResultSize) DRT_SEARCH_RESULT   *pSearchResult);

HRESULT WINAPI DrtGetSearchPathSize(
    __in        HDRT_SEARCH_CONTEXT hSearchContext,
    __out       ULONG               *pulSearchPathSize);

HRESULT WINAPI DrtGetSearchPath(
    __in        HDRT_SEARCH_CONTEXT hSearchContext,
    __inout     ULONG               ulSearchPathSize, 
    __out_bcount_full(ulSearchPathSize) DRT_ADDRESS_LIST   *pSearchPath);

HRESULT WINAPI DrtEndSearch(
    __in        HDRT_SEARCH_CONTEXT hSearchContext);

//////////////////////////////////////////////////////////////////////////////
// DRT Instance name related APIs

HRESULT WINAPI DrtGetInstanceName(
    __in        HDRT    hDrt,
    __in        ULONG   ulcbInstanceNameSize,
    __out_bcount_full(ulcbInstanceNameSize) PWSTR  pwzDrtInstanceName);

HRESULT WINAPI DrtGetInstanceNameSize(
    __in        HDRT    hDrt,
    __out       ULONG*  pulcbInstanceNameSize);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif  // _DRT_H_

