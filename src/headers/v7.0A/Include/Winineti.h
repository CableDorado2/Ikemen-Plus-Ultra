
#include <iedial.h>
#include <schannel.h>
#define SECURITY_WIN32
#include <sspi.h>
#if !defined(_WININETEX_)
#define _WININETEX_

#if defined(__cplusplus)
extern "C" {
#endif

#define MAX_CACHE_ENTRY_INFO_SIZE       4096

//
// These two flags should really be included in a new mask called INTERNET_FLAGS_INTERNAL_MASK.
// Since BGUPDATE is included in INTERNET_FLAGS_MASK already it will cause compile
// errors when used without winineti.h.  FTP_FOLDER_VIEW is not being included
// so as to not compound the problem.
//

#define INTERNET_FLAG_BGUPDATE          0x00000008
#define INTERNET_FLAG_FTP_FOLDER_VIEW   0x00000004
#define INTERNET_FLAGS_MASK_INTERNAL (INTERNET_FLAGS_MASK | \
                                      INTERNET_FLAG_FTP_FOLDER_VIEW)

//
// INTERNET_PREFETCH_STATUS -
//

typedef struct {

    //
    // dwStatus - status of download. See INTERNET_PREFETCH_ flags
    //

    DWORD dwStatus;

    //
    // dwSize - size of file downloaded so far
    //

    DWORD dwSize;
} INTERNET_PREFETCH_STATUS, * LPINTERNET_PREFETCH_STATUS;

//
// INTERNET_PREFETCH_STATUS - dwStatus values
//

#define INTERNET_PREFETCH_PROGRESS  0
#define INTERNET_PREFETCH_COMPLETE  1
#define INTERNET_PREFETCH_ABORTED   2



#define INTERNET_ONLINE_OFFLINE_INFO    INTERNET_CONNECTED_INFO
#define LPINTERNET_ONLINE_OFFLINE_INFO  LPINTERNET_CONNECTED_INFO
#define dwOfflineState                  dwConnectedState


#define ISO_FORCE_OFFLINE       ISO_FORCE_DISCONNECTED


// These flags keep track of security errors on a cached certificate entry
// from WinVerify that was ignored in order to complete the security handshake.
// These flags should not use the same bits as any other SECURITY_FLAGS.

#define DLG_FLAGS_INVALID_CA                    0x01000000
#define DLG_FLAGS_SEC_CERT_CN_INVALID           0x02000000
#define DLG_FLAGS_SEC_CERT_DATE_INVALID         0x04000000
#define DLG_FLAGS_SEC_CERT_REV_FAILED           0x00800000

#ifdef __WINCRYPT_H__
#ifdef ALGIDDEF

//
// INTERNET_SECURITY_INFO - contains information about certificate
// and encryption settings for a connection.
//

#define INTERNET_SECURITY_INFO_DEFINED

typedef struct {

    //
    // dwSize - Size of INTERNET_SECURITY_INFO structure.
    //
    DWORD dwSize;

    //
    // pCertificate - Cert context pointing to leaf of certificate chain.
    //
    PCCERT_CONTEXT pCertificate;


    //
    // pcCertChain - Certificate chain for the certificate
    //

    PCCERT_CHAIN_CONTEXT pcCertChain;


    // SECPKG_ATTR_CONNECTION_INFO
    SecPkgContext_ConnectionInfo connectionInfo;

    // SECPKG_ATTR_CIPHER_INFO (Supported on >= LH)
    SecPkgContext_CipherInfo cipherInfo;

    //
    // pcUnverifiedCertChain - Cert chain from initial WinVerifyTrust state
    //
    PCCERT_CHAIN_CONTEXT pcUnverifiedCertChain;

    //
    // Channel Binding Token
    //

    SecPkgContext_Bindings channelBindingToken;

} INTERNET_SECURITY_INFO, * LPINTERNET_SECURITY_INFO;


typedef struct {
    //
    // dwSize - size of INTERNET_SECURITY_CONNECTION_INFO
    //
    DWORD dwSize;

    // fSecure - Is this a secure connection.
    BOOL fSecure;

    // SECPKG_ATTR_CONNECTION_INFO
    SecPkgContext_ConnectionInfo connectionInfo;

    // SECPKG_ATTR_CIPHER_INFO (Supported on >= LH)
    SecPkgContext_CipherInfo cipherInfo;
} INTERNET_SECURITY_CONNECTION_INFO , * LPINTERNET_SECURITY_CONNECTION_INFO;


INTERNETAPI_(BOOL) InternetAlgIdToStringA(
    __in ALG_ID                             ai,
    __out_ecount(*lpdwBufferLength) LPSTR lpstr,
    __inout LPDWORD                         lpdwBufferLength,
    __reserved DWORD                        dwReserved
    );
INTERNETAPI_(BOOL) InternetAlgIdToStringW(
    __in ALG_ID                             ai,
    __out_ecount(*lpdwBufferLength) LPWSTR lpstr,
    __inout LPDWORD                         lpdwBufferLength,
    __reserved DWORD                        dwReserved
    );
#ifdef UNICODE
#define InternetAlgIdToString  InternetAlgIdToStringW
#else
#define InternetAlgIdToString  InternetAlgIdToStringA
#endif // !UNICODE

INTERNETAPI_(BOOL) InternetSecurityProtocolToStringA(
    __in DWORD                              dwProtocol,
    __out_ecount(*lpdwBufferLength) LPSTR lpstr,
    __inout LPDWORD                         lpdwBufferLength,
    __reserved DWORD                        dwReserved
    );
INTERNETAPI_(BOOL) InternetSecurityProtocolToStringW(
    __in DWORD                              dwProtocol,
    __out_ecount(*lpdwBufferLength) LPWSTR lpstr,
    __inout LPDWORD                         lpdwBufferLength,
    __reserved DWORD                        dwReserved
    );
#ifdef UNICODE
#define InternetSecurityProtocolToString  InternetSecurityProtocolToStringW
#else
#define InternetSecurityProtocolToString  InternetSecurityProtocolToStringA
#endif // !UNICODE

#if (_WIN32_IE >= _WIN32_IE_IE70)

//
// This is an API for BrowseUI.  It retrieves
// security info based on a URL
//

INTERNETAPI_(BOOL) InternetGetSecurityInfoByURLA(
    __in       LPSTR    lpszURL,
    __out      PCCERT_CHAIN_CONTEXT * ppCertChain,
    __out      DWORD  *pdwSecureFlags
    );

INTERNETAPI_(BOOL) InternetGetSecurityInfoByURLW(
    __in       LPCWSTR  lpszURL,
    __out      PCCERT_CHAIN_CONTEXT * ppCertChain,
    __out      DWORD  *pdwSecureFlags
    );

#ifdef UNICODE
#define InternetGetSecurityInfoByURL  InternetGetSecurityInfoByURLW
#else
#ifdef _WINX32_
#define InternetGetSecurityInfoByURL  InternetGetSecurityInfoByURLA
#else
INTERNETAPI_(BOOL) InternetGetSecurityInfoByURL(
    __in       LPSTR    lpszURL,
    __out      PCCERT_CHAIN_CONTEXT * ppCertChain,
    __out      DWORD  *pdwSecureFlags
    );
#endif // _WINX32_
#endif // !UNICODE

#endif // _WIN32_IE >= _WIN32_IE_IE70

#endif // ALGIDDEF
#endif // __WINCRYPT_H__

#ifdef INTERNET_SECURITY_INFO_DEFINED

INTERNETAPI_(DWORD) ShowSecurityInfo(
    __in HWND                          hWndParent,
    __in LPINTERNET_SECURITY_INFO      pSecurityInfo
    );
#endif // INTERNET_SECURITY_INFO_DEFINED



INTERNETAPI_(DWORD) ShowX509EncodedCertificate(
    __in                HWND    hWndParent,
    __in_bcount(cbCert) LPBYTE  lpCert,
    __in                DWORD   cbCert
    );

INTERNETAPI_(DWORD) ShowClientAuthCerts(
    __in HWND hWndParent
    );

INTERNETAPI_(DWORD) ParseX509EncodedCertificateForListBoxEntry(
    __in_bcount(cbCert)                     LPBYTE  lpCert,
    __in                                    DWORD   cbCert,
    __out_ecount_opt(*lpdwListBoxEntry)     LPSTR   lpszListBoxEntry,
    __inout                                 LPDWORD lpdwListBoxEntry
    );

//
// This is a private API for Trident.  It displays
// security info based on a URL
//

INTERNETAPI_(BOOL) InternetShowSecurityInfoByURLA(
    __in       LPSTR    lpszURL,
    __in       HWND     hwndParent
    );

INTERNETAPI_(BOOL) InternetShowSecurityInfoByURLW(
    __in       LPCWSTR  lpszURL,
    __in       HWND     hwndParent
    );

// The InternetGetCertByURL function was never declared in the wininet header
// files.  It is obsolete and deprecated. An attempt was made to add it for
// completeness since it is still exported from wininet.dll. However other
// code has declared it incorrectly.  This causes compiler errors because
// the function ends up with two different declarations in the same compilation
// unit.  It is again not included in the header as anything but this comment.
//
// INTERNETAPI_(BOOL) InternetGetCertByURL(
//    __in        LPSTR   lpszURL,
//    __inout_bcount(dwcbCertText) LPSTR lpszCertText,
//    __inout     DWORD    dwcbCertText
//    );

#ifdef UNICODE
#define InternetShowSecurityInfoByURL  InternetShowSecurityInfoByURLW
#else
#ifdef _WINX32_
#define InternetShowSecurityInfoByURL  InternetShowSecurityInfoByURLA
#else
INTERNETAPI_(BOOL) InternetShowSecurityInfoByURL(
    __in       LPSTR    lpszURL,
    __in       HWND     hwndParent
    );
#endif // _WINX32_
#endif // !UNICODE

//Fortezza related exports. not public

// The commands that InternetFortezzaCommand supports.

typedef enum {
    FORTCMD_LOGON                   = 1,
    FORTCMD_LOGOFF                  = 2,
    FORTCMD_CHG_PERSONALITY         = 3,
} FORTCMD;


INTERNETAPI_(BOOL) InternetFortezzaCommand(
    __in DWORD dwCommand,
    __in HWND hwnd,
    __reserved DWORD_PTR dwReserved);


typedef enum {
    FORTSTAT_INSTALLED          = 0x00000001,
    FORTSTAT_LOGGEDON           = 0x00000002,
}   FORTSTAT ;

INTERNETAPI_(BOOL) InternetQueryFortezzaStatus(
    __out DWORD *pdwStatus,
    __reserved DWORD_PTR dwReserved
);



BOOLAPI InternetDebugGetLocalTime(
    __out SYSTEMTIME * pstLocalTime,
    __out_opt DWORD      * pdwReserved
    );


// causes InternetCreateUrlA to escape chars in authority components (user, pwd, host)
#define ICU_ESCAPE_AUTHORITY 0x00002000

#define INTERNET_SERVICE_URL    0
//
// InternetConnectUrl() - a macro which allows you to specify an URL instead of
// the component parts to InternetConnect(). If any API which uses the returned
// connect handle specifies a NULL path then the URL-path part of the URL
// specified in InternetConnectUrl() will be used
//

#define InternetConnectUrl(hInternet, lpszUrl, dwFlags, dwContext) \
    InternetConnect(hInternet,                      \
                    lpszUrl,                        \
                    INTERNET_INVALID_PORT_NUMBER,   \
                    NULL,                           \
                    NULL,                           \
                    INTERNET_SERVICE_URL,           \
                    dwFlags,                        \
                    dwContext                       \
                    )

INTERNETAPI_(BOOL) InternetWriteFileExA(
    __in HINTERNET hFile,
    __in LPINTERNET_BUFFERSA lpBuffersIn,
    __in DWORD dwFlags,
    __in_opt DWORD_PTR dwContext
    );
INTERNETAPI_(BOOL) InternetWriteFileExW(
    __in HINTERNET hFile,
    __in LPINTERNET_BUFFERSW lpBuffersIn,
    __in DWORD dwFlags,
    __in_opt DWORD_PTR dwContext
    );
#ifdef UNICODE
#define InternetWriteFileEx  InternetWriteFileExW
#else
#define InternetWriteFileEx  InternetWriteFileExA
#endif // !UNICODE

#define INTERNET_OPTION_CONTEXT_VALUE_OLD       10
#define INTERNET_OPTION_NET_SPEED               61
// Pass in pointer to INTERNET_SECURITY_CONNECTION_INFO to be filled in.
#define INTERNET_OPTION_SECURITY_CONNECTION_INFO  66
#define INTERNET_OPTION_DETECT_POST_SEND        71
#define INTERNET_OPTION_DISABLE_NTLM_PREAUTH    72
#define INTERNET_OPTION_ORIGINAL_CONNECT_FLAGS                  97


#define INTERNET_OPTION_CERT_ERROR_FLAGS             98
#define INTERNET_OPTION_IGNORE_CERT_ERROR_FLAGS      99

#define INTERNET_OPTION_SESSION_START_TIME           106
#define INTERNET_OPTION_PROXY_CREDENTIALS            107
#define INTERNET_OPTION_EXTENDED_CALLBACKS           108
#define INTERNET_OPTION_PROXY_FROM_REQUEST           109
#define INTERNET_OPTION_ALLOW_FAILED_CONNECT_CONTENT 110
#define INTERNET_OPTION_CACHE_PARTITION              111
#define INTERNET_OPTION_AUTODIAL_HWND                112
#define INTERNET_OPTION_SERVER_CREDENTIALS           113
#define INTERNET_OPTION_WPAD_SLEEP                   114
#define INTERNET_LAST_OPTION_INTERNAL           INTERNET_OPTION_WPAD_SLEEP


#define INTERNET_OPTION_OFFLINE_TIMEOUT INTERNET_OPTION_DISCONNECTED_TIMEOUT
#define INTERNET_OPTION_LINE_STATE      INTERNET_OPTION_CONNECTED_STATE

#define AUTH_FLAG_RESET                         0x00000000 /* let registry decide */

//
// Extended callbacks.
//
// They can happen outside the context of the registered session's API calls.
//

#define INTERNET_STATUS_PROXY_CREDENTIALS       400
#define INTERNET_STATUS_SERVER_CREDENTIALS      401
#define INTERNET_STATUS_SERVER_CONNECTION_STATE 410
#define INTERNET_STATUS_END_BROWSER_SESSION     420
#define INTERNET_STATUS_COOKIE                  430

//
// Extended callback data structures.
//

typedef struct _INTERNET_SERVER_CONNECTION_STATE {
    LPCWSTR lpcwszHostName;
    BOOL fProxy;                    // Is this a proxy?
    DWORD dwCounter;                // Server connection state callback counter.
    DWORD dwConnectionLimit;        // Current Limit.
    DWORD dwAvailableCreates;       // Connections allowed to be created.
    DWORD dwAvailableKeepAlives;    // Keep alive connections available to be used.
    DWORD dwActiveConnections;      // Current number of active connections.
    DWORD dwWaiters;                // Number of request waiting on connections.
} INTERNET_SERVER_CONNECTION_STATE, *PINTERNET_SERVER_CONNECTION_STATE;

typedef struct _INTERNET_END_BROWSER_SESSION_DATA {
    LPVOID lpBuffer;
    DWORD dwBufferLength;
} INTERNET_END_BROWSER_SESSION_DATA, *PINTERNET_END_BROWSER_SESSION_DATA;

typedef struct _INTERNET_CALLBACK_COOKIE {
    PCWSTR pcwszName;
    PCWSTR pcwszValue;
    PCWSTR pcwszDomain;
    PCWSTR pcwszPath;
    FILETIME ftExpires;
    DWORD dwFlags;
} INTERNET_CALLBACK_COOKIE, *PINTERNET_CALLBACK_COOKIE;

#if _MSC_VER >= 1200
#pragma warning(push)
#endif
#pragma warning(disable:4201)

typedef struct _INTERNET_CREDENTIALS {
    LPCWSTR lpcwszHostName;
    DWORD dwPort;
    DWORD dwScheme;
    LPCWSTR lpcwszUrl;
    LPCWSTR lpcwszRealm;
    BOOL fAuthIdentity;  // TRUE if pAuthIdentityOpaque is used in below struct.
    union {
        struct {
            LPCWSTR lpcwszUserName;
            LPCWSTR lpcwszPassword;
        };
        PVOID pAuthIdentityOpaque;
    };
} INTERNET_CREDENTIALS, *PINTERNET_CREDENTIALS;

#if _MSC_VER >= 1200
#pragma warning(pop)
#else
#pragma warning(default:4201)
#endif

//
// !!! NOTE !!!
//
// these defines are needed beecause PREFAST donesn't understand enums in
// range specifications. Make sue that these are always in sync with any
// changes to the InternetCookieState enum, above.
//
#define COOKIE_STATE_LB     0   // COOKIE_STATE_UNKNOWN
#define COOKIE_STATE_UB     5   // COOKIE_STATE_MAX

/* maximum length of privacy-settings in Unicode characters */
#define     MaxPrivacySettings      0x4000

// Utility for mapping P3P compact-policy tokens to unique indexes
INTERNETAPI_(int)   FindP3PPolicySymbol(__in const char *pszSymbol);



#define INTERNET_STATE_ONLINE       INTERNET_STATE_CONNECTED
#define INTERNET_STATE_OFFLINE      INTERNET_STATE_DISCONNECTED
#define INTERNET_STATE_OFFLINE_USER INTERNET_STATE_DISCONNECTED_BY_USER
#define INTERNET_LINE_STATE_MASK    (INTERNET_STATE_ONLINE | INTERNET_STATE_OFFLINE)
#define INTERNET_BUSY_STATE_MASK    (INTERNET_STATE_IDLE | INTERNET_STATE_BUSY)



//
// the following are used with InternetSetOption(..., INTERNET_OPTION_CALLBACK_FILTER, ...)
// to filter out unrequired callbacks. INTERNET_STATUS_REQUEST_COMPLETE cannot
// be filtered out
//

#define INTERNET_STATUS_FILTER_RESOLVING        0x00000001
#define INTERNET_STATUS_FILTER_RESOLVED         0x00000002
#define INTERNET_STATUS_FILTER_CONNECTING       0x00000004
#define INTERNET_STATUS_FILTER_CONNECTED        0x00000008
#define INTERNET_STATUS_FILTER_SENDING          0x00000010
#define INTERNET_STATUS_FILTER_SENT             0x00000020
#define INTERNET_STATUS_FILTER_RECEIVING        0x00000040
#define INTERNET_STATUS_FILTER_RECEIVED         0x00000080
#define INTERNET_STATUS_FILTER_CLOSING          0x00000100
#define INTERNET_STATUS_FILTER_CLOSED           0x00000200
#define INTERNET_STATUS_FILTER_HANDLE_CREATED   0x00000400
#define INTERNET_STATUS_FILTER_HANDLE_CLOSING   0x00000800
#define INTERNET_STATUS_FILTER_PREFETCH         0x00001000
#define INTERNET_STATUS_FILTER_REDIRECT         0x00002000
#define INTERNET_STATUS_FILTER_STATE_CHANGE     0x00004000


//
// Note that adding any HTTP_QUERY_* codes here must be followed
//   by an equivlent line in wininet\http\hashgen\hashgen.cpp
//   please see that file for further information regarding
//   the addition of new HTTP headers
//


// These are not part of HTTP 1.1 yet. We will propose these to the
// HTTP extensions working group. These are required for the client-caps support
// we are doing in conjuntion with IIS.

typedef struct _INTERNET_COOKIE {
    DWORD cbSize;
    LPSTR pszName;
    LPSTR pszData;
    LPSTR pszDomain;
    LPSTR pszPath;
    FILETIME *pftExpires;
    DWORD dwFlags;
    LPSTR pszUrl;
    LPSTR pszP3PPolicy;
} INTERNET_COOKIE, *PINTERNET_COOKIE;

//
// Support for handling cookie policy
//

typedef struct _COOKIE_DLG_INFO {
    LPWSTR  pszServer;
    PINTERNET_COOKIE pic;
    DWORD   dwStopWarning;
    INT     cx;
    INT     cy;
    LPWSTR  pszHeader;
    DWORD   dwOperation;
} COOKIE_DLG_INFO, *PCOOKIE_DLG_INFO;

// values returned from cookie UI, for dwStopWarning member
#define COOKIE_DONT_ALLOW       1
#define COOKIE_ALLOW            2
#define COOKIE_ALLOW_ALL        4
#define COOKIE_DONT_ALLOW_ALL   8

// values for dwOperation member
#define COOKIE_OP_SET           0x01
#define COOKIE_OP_MODIFY        0x02
#define COOKIE_OP_GET           0x04
#define COOKIE_OP_SESSION       0x08
#define COOKIE_OP_PERSISTENT    0x10
#define COOKIE_OP_3RD_PARTY     0x20


// INTERNET_COOKIE_RESTRICTED_ZONE is the same as INTERNET_FLAG_RESTRICTED_ZONE
#define INTERNET_COOKIE_RESTRICTED_ZONE 0x00020000
#define INTERNET_COOKIE_NO_CALLBACK     0x40000000
#define INTERNET_COOKIE_ECTX_3RDPARTY   0x80000000
//
// DAV Detection
//
BOOLAPI HttpCheckDavComplianceA(
    __in LPCSTR lpszUrl,
    __in LPCSTR lpszComplianceToken,
    __inout LPBOOL lpfFound,
    __in HWND hWnd,
    __in LPVOID lpvReserved
    );
// INTERNET_COOKIE_RESTRICTED_ZONE is the same as INTERNET_FLAG_RESTRICTED_ZONE
#define INTERNET_COOKIE_RESTRICTED_ZONE 0x00020000
#define INTERNET_COOKIE_NO_CALLBACK     0x40000000
#define INTERNET_COOKIE_ECTX_3RDPARTY   0x80000000
//
// DAV Detection
//
BOOLAPI HttpCheckDavComplianceW(
    __in LPCWSTR lpszUrl,
    __in LPCWSTR lpszComplianceToken,
    __inout LPBOOL lpfFound,
    __in HWND hWnd,
    __in LPVOID lpvReserved
    );
#ifdef UNICODE
#define HttpCheckDavCompliance  HttpCheckDavComplianceW
#else
#define HttpCheckDavCompliance  HttpCheckDavComplianceA
#endif // !UNICODE

BOOLAPI HttpCheckCachedDavStatusA(
    __in LPCSTR lpszUrl,
    __inout LPDWORD lpdwStatus
    );
BOOLAPI HttpCheckCachedDavStatusW(
    __in LPCWSTR lpszUrl,
    __inout LPDWORD lpdwStatus
    );
#ifdef UNICODE
#define HttpCheckCachedDavStatus  HttpCheckCachedDavStatusW
#else
#define HttpCheckCachedDavStatus  HttpCheckCachedDavStatusA
#endif // !UNICODE

BOOLAPI HttpCheckDavCollectionA(
    __in LPCSTR lpszUrl,
    __inout LPBOOL lpfFound,
    __in HWND hWnd,
    __in LPVOID lpvReserved
    );
BOOLAPI HttpCheckDavCollectionW(
    __in LPCWSTR lpszUrl,
    __inout LPBOOL lpfFound,
    __in HWND hWnd,
    __in LPVOID lpvReserved
    );
#ifdef UNICODE
#define HttpCheckDavCollection  HttpCheckDavCollectionW
#else
#define HttpCheckDavCollection  HttpCheckDavCollectionA
#endif // !UNICODE

// DAV detection defines
#define DAV_LEVEL1_STATUS               0x00000001
#define DAV_COLLECTION_STATUS           0x00004000
#define DAV_DETECTION_REQUIRED          0x00008000
#define FLAGS_ERROR_UI_SHOW_IDN_HOSTNAME        0x20
#define ERROR_INTERNET_NO_NEW_CONTAINERS        (INTERNET_ERROR_BASE + 51)

#define ERROR_INTERNET_OFFLINE  ERROR_INTERNET_DISCONNECTED

//
// internal error codes that are used to communicate specific information inside
// of Wininet but which are meaningless at the interface
//

#define INTERNET_INTERNAL_ERROR_BASE            (INTERNET_ERROR_BASE + 900)

#define ERROR_INTERNET_INTERNAL_SOCKET_ERROR    (INTERNET_INTERNAL_ERROR_BASE + 1)
#define ERROR_INTERNET_CONNECTION_AVAILABLE     (INTERNET_INTERNAL_ERROR_BASE + 2)
#define ERROR_INTERNET_NO_KNOWN_SERVERS         (INTERNET_INTERNAL_ERROR_BASE + 3)
#define ERROR_INTERNET_PING_FAILED              (INTERNET_INTERNAL_ERROR_BASE + 4)
#define ERROR_INTERNET_NO_PING_SUPPORT          (INTERNET_INTERNAL_ERROR_BASE + 5)
#define ERROR_INTERNET_CACHE_SUCCESS            (INTERNET_INTERNAL_ERROR_BASE + 6)
#define ERROR_HTTP_COOKIE_NEEDS_CONFIRMATION_EX (INTERNET_INTERNAL_ERROR_BASE + 7)
#define HTTP_1_1_CACHE_ENTRY            0x00000040
#define STATIC_CACHE_ENTRY              0x00000080
#define MUST_REVALIDATE_CACHE_ENTRY     0x00000100
#define SHORTPATH_CACHE_ENTRY           0x00000200
#define COOKIE_ACCEPTED_CACHE_ENTRY     0x00001000
#define COOKIE_LEASHED_CACHE_ENTRY      0x00002000
#define COOKIE_DOWNGRADED_CACHE_ENTRY   0x00004000
#define COOKIE_REJECTED_CACHE_ENTRY     0x00008000
#define PRIVACY_MODE_CACHE_ENTRY        0x00020000
#define XDR_CACHE_ENTRY                 0x00040000
#define PENDING_DELETE_CACHE_ENTRY      0x00400000
#define OTHER_USER_CACHE_ENTRY          0x00800000
#define PRIVACY_IMPACTED_CACHE_ENTRY    0x02000000
#define POST_RESPONSE_CACHE_ENTRY       0x04000000
#define INSTALLED_CACHE_ENTRY           0x10000000
#define POST_CHECK_CACHE_ENTRY          0x20000000
#define IDENTITY_CACHE_ENTRY            0x80000000
#define ANY_CACHE_ENTRY                 0xFFFFFFFF

// We include some entry types even if app doesn't specifically ask for them.
#define INCLUDE_BY_DEFAULT_CACHE_ENTRY \
  ( HTTP_1_1_CACHE_ENTRY \
  | STATIC_CACHE_ENTRY \
  | MUST_REVALIDATE_CACHE_ENTRY \
  | PRIVACY_IMPACTED_CACHE_ENTRY \
  | POST_CHECK_CACHE_ENTRY \
  | COOKIE_ACCEPTED_CACHE_ENTRY \
  | COOKIE_LEASHED_CACHE_ENTRY \
  | COOKIE_DOWNGRADED_CACHE_ENTRY \
  | COOKIE_REJECTED_CACHE_ENTRY \
  | SHORTPATH_CACHE_ENTRY \
  )

#define CACHEGROUP_FLAG_VALID               0x00000007

//
// Well known sticky group ID
//
#define CACHEGROUP_ID_BUILTIN_STICKY       0x1000000000000007

//
// INTERNET_CACHE_CONFIG_PATH_ENTRY
//

typedef struct _INTERNET_CACHE_CONFIG_PATH_ENTRYA {
    CHAR   CachePath[MAX_PATH];
    DWORD dwCacheSize;  // in KBytes
} INTERNET_CACHE_CONFIG_PATH_ENTRYA, * LPINTERNET_CACHE_CONFIG_PATH_ENTRYA;
typedef struct _INTERNET_CACHE_CONFIG_PATH_ENTRYW {
    WCHAR  CachePath[MAX_PATH];
    DWORD dwCacheSize;  // in KBytes
} INTERNET_CACHE_CONFIG_PATH_ENTRYW, * LPINTERNET_CACHE_CONFIG_PATH_ENTRYW;
#ifdef UNICODE
typedef INTERNET_CACHE_CONFIG_PATH_ENTRYW INTERNET_CACHE_CONFIG_PATH_ENTRY;
typedef LPINTERNET_CACHE_CONFIG_PATH_ENTRYW LPINTERNET_CACHE_CONFIG_PATH_ENTRY;
#else
typedef INTERNET_CACHE_CONFIG_PATH_ENTRYA INTERNET_CACHE_CONFIG_PATH_ENTRY;
typedef LPINTERNET_CACHE_CONFIG_PATH_ENTRYA LPINTERNET_CACHE_CONFIG_PATH_ENTRY;
#endif // UNICODE

//
// INTERNET_CACHE_CONFIG_INFO
//

#if _MSC_VER >= 1200
#pragma warning(push)
#endif
#pragma warning(disable:4201)

typedef struct _INTERNET_CACHE_CONFIG_INFOA {
    DWORD dwStructSize;
    DWORD dwContainer;
    DWORD dwQuota;
    DWORD dwReserved4;
    BOOL  fPerUser;
    DWORD dwSyncMode;
    DWORD dwNumCachePaths;
    union
    {
        struct
        {
            CHAR   CachePath[MAX_PATH];
            DWORD dwCacheSize;
        };
        INTERNET_CACHE_CONFIG_PATH_ENTRYA CachePaths[ANYSIZE_ARRAY];
    };
    DWORD dwNormalUsage;
    DWORD dwExemptUsage;
} INTERNET_CACHE_CONFIG_INFOA, * LPINTERNET_CACHE_CONFIG_INFOA;
typedef struct _INTERNET_CACHE_CONFIG_INFOW {
    DWORD dwStructSize;
    DWORD dwContainer;
    DWORD dwQuota;
    DWORD dwReserved4;
    BOOL  fPerUser;
    DWORD dwSyncMode;
    DWORD dwNumCachePaths;
    union
    {
        struct
        {
            WCHAR  CachePath[MAX_PATH];
            DWORD dwCacheSize;
        };
        INTERNET_CACHE_CONFIG_PATH_ENTRYW CachePaths[ANYSIZE_ARRAY];
    };
    DWORD dwNormalUsage;
    DWORD dwExemptUsage;
} INTERNET_CACHE_CONFIG_INFOW, * LPINTERNET_CACHE_CONFIG_INFOW;
#ifdef UNICODE
typedef INTERNET_CACHE_CONFIG_INFOW INTERNET_CACHE_CONFIG_INFO;
typedef LPINTERNET_CACHE_CONFIG_INFOW LPINTERNET_CACHE_CONFIG_INFO;
#else
typedef INTERNET_CACHE_CONFIG_INFOA INTERNET_CACHE_CONFIG_INFO;
typedef LPINTERNET_CACHE_CONFIG_INFOA LPINTERNET_CACHE_CONFIG_INFO;
#endif // UNICODE

#if _MSC_VER >= 1200
#pragma warning(pop)
#else
#pragma warning(default:4201)
#endif


BOOLAPI IsUrlCacheEntryExpiredA(
    __in      LPCSTR        lpszUrlName,
    __in      DWORD           dwFlags,
    __inout   FILETIME*       pftLastModified
    );
BOOLAPI IsUrlCacheEntryExpiredW(
    __in      LPCWSTR        lpszUrlName,
    __in      DWORD           dwFlags,
    __inout   FILETIME*       pftLastModified
    );
#ifdef UNICODE
#define IsUrlCacheEntryExpired  IsUrlCacheEntryExpiredW
#else
#define IsUrlCacheEntryExpired  IsUrlCacheEntryExpiredA
#endif // !UNICODE


#define INTERNET_CACHE_FLAG_ALLOW_COLLISIONS     0x00000100
#define INTERNET_CACHE_FLAG_INSTALLED_ENTRY      0x00000200
#define INTERNET_CACHE_FLAG_ENTRY_OR_MAPPING     0x00000400
#define INTERNET_CACHE_FLAG_ADD_FILENAME_ONLY    0x00000800
#define INTERNET_CACHE_FLAG_GET_STRUCT_ONLY      0x00001000
#define CACHE_ENTRY_TYPE_FC         0x00001000
#define CACHE_ENTRY_MODIFY_DATA_FC  0x80000000 // this appears unused

// Flags for CreateContainer

#define INTERNET_CACHE_CONTAINER_NOSUBDIRS (0x1)
#define INTERNET_CACHE_CONTAINER_AUTODELETE (0x2)
#define INTERNET_CACHE_CONTAINER_RESERVED1 (0x4)
#define INTERNET_CACHE_CONTAINER_NODESKTOPINIT (0x8)
#define INTERNET_CACHE_CONTAINER_MAP_ENABLED (0x10)

BOOLAPI CreateUrlCacheContainerA(
     __in LPCSTR Name,
     __in LPCSTR lpCachePrefix,
     __in_opt LPCSTR lpszCachePath,
     __in DWORD KBCacheLimit,
     __in DWORD dwContainerType,
     __in DWORD dwOptions,
     __reserved LPVOID pvBuffer,
     __reserved LPDWORD cbBuffer
     );
BOOLAPI CreateUrlCacheContainerW(
     __in LPCWSTR Name,
     __in LPCWSTR lpCachePrefix,
     __in_opt LPCWSTR lpszCachePath,
     __in DWORD KBCacheLimit,
     __in DWORD dwContainerType,
     __in DWORD dwOptions,
     __reserved LPVOID pvBuffer,
     __reserved LPDWORD cbBuffer
     );
#ifdef UNICODE
#define CreateUrlCacheContainer  CreateUrlCacheContainerW
#else
#define CreateUrlCacheContainer  CreateUrlCacheContainerA
#endif // !UNICODE

BOOLAPI DeleteUrlCacheContainerA(
     __in LPCSTR Name,
     __in DWORD dwOptions
     );
BOOLAPI DeleteUrlCacheContainerW(
     __in LPCWSTR Name,
     __in DWORD dwOptions
     );
#ifdef UNICODE
#define DeleteUrlCacheContainer  DeleteUrlCacheContainerW
#else
#define DeleteUrlCacheContainer  DeleteUrlCacheContainerA
#endif // !UNICODE

//
// INTERNET_CACHE_ENTRY_INFO -
//


typedef struct _INTERNET_CACHE_CONTAINER_INFOA {
    DWORD dwCacheVersion;       // version of software
    LPSTR   lpszName;             // embedded pointer to the container name string.
    LPSTR   lpszCachePrefix;      // embedded pointer to the container URL prefix
    LPSTR   lpszVolumeLabel;      // embedded pointer to the container volume label if any.
    LPSTR   lpszVolumeTitle;      // embedded pointer to the container volume title if any.
} INTERNET_CACHE_CONTAINER_INFOA, * LPINTERNET_CACHE_CONTAINER_INFOA;
typedef struct _INTERNET_CACHE_CONTAINER_INFOW {
    DWORD dwCacheVersion;       // version of software
    LPWSTR  lpszName;             // embedded pointer to the container name string.
    LPWSTR  lpszCachePrefix;      // embedded pointer to the container URL prefix
    LPWSTR  lpszVolumeLabel;      // embedded pointer to the container volume label if any.
    LPWSTR  lpszVolumeTitle;      // embedded pointer to the container volume title if any.
} INTERNET_CACHE_CONTAINER_INFOW, * LPINTERNET_CACHE_CONTAINER_INFOW;
#ifdef UNICODE
typedef INTERNET_CACHE_CONTAINER_INFOW INTERNET_CACHE_CONTAINER_INFO;
typedef LPINTERNET_CACHE_CONTAINER_INFOW LPINTERNET_CACHE_CONTAINER_INFO;
#else
typedef INTERNET_CACHE_CONTAINER_INFOA INTERNET_CACHE_CONTAINER_INFO;
typedef LPINTERNET_CACHE_CONTAINER_INFOA LPINTERNET_CACHE_CONTAINER_INFO;
#endif // UNICODE

//  FindFirstContainer options
#define CACHE_FIND_CONTAINER_RETURN_NOCHANGE (0x1)

INTERNETAPI_(HANDLE)
FindFirstUrlCacheContainerA(
    __inout LPDWORD pdwModified,
    __out_bcount(*lpcbContainerInfo) LPINTERNET_CACHE_CONTAINER_INFOA lpContainerInfo,
    __inout LPDWORD lpcbContainerInfo,
    __in DWORD dwOptions
    );
INTERNETAPI_(HANDLE)
FindFirstUrlCacheContainerW(
    __inout LPDWORD pdwModified,
    __out_bcount(*lpcbContainerInfo) LPINTERNET_CACHE_CONTAINER_INFOW lpContainerInfo,
    __inout LPDWORD lpcbContainerInfo,
    __in DWORD dwOptions
    );
#ifdef UNICODE
#define FindFirstUrlCacheContainer  FindFirstUrlCacheContainerW
#else
#define FindFirstUrlCacheContainer  FindFirstUrlCacheContainerA
#endif // !UNICODE

BOOLAPI
FindNextUrlCacheContainerA(
    __in HANDLE hEnumHandle,
    __out_bcount(*lpcbContainerInfo) LPINTERNET_CACHE_CONTAINER_INFOA lpContainerInfo,
    __inout LPDWORD lpcbContainerInfo
    );
BOOLAPI
FindNextUrlCacheContainerW(
    __in HANDLE hEnumHandle,
    __out_bcount(*lpcbContainerInfo) LPINTERNET_CACHE_CONTAINER_INFOW lpContainerInfo,
    __inout LPDWORD lpcbContainerInfo
    );
#ifdef UNICODE
#define FindNextUrlCacheContainer  FindNextUrlCacheContainerW
#else
#define FindNextUrlCacheContainer  FindNextUrlCacheContainerA
#endif // !UNICODE


typedef enum {
    WININET_SYNC_MODE_NEVER=0,
    WININET_SYNC_MODE_ON_EXPIRY, // bogus
    WININET_SYNC_MODE_ONCE_PER_SESSION,
    WININET_SYNC_MODE_ALWAYS,
    WININET_SYNC_MODE_AUTOMATIC,
    WININET_SYNC_MODE_DEFAULT = WININET_SYNC_MODE_AUTOMATIC
} WININET_SYNC_MODE;


BOOLAPI FreeUrlCacheSpaceA(
    __in_opt LPCSTR lpszCachePath,
    __in DWORD dwSize,
    __in DWORD dwFilter
    );
BOOLAPI FreeUrlCacheSpaceW(
    __in_opt LPCWSTR lpszCachePath,
    __in DWORD dwSize,
    __in DWORD dwFilter
    );
#ifdef UNICODE
#define FreeUrlCacheSpace  FreeUrlCacheSpaceW
#else
#define FreeUrlCacheSpace  FreeUrlCacheSpaceA
#endif // !UNICODE

//
// config APIs.
//

#define CACHE_CONFIG_FORCE_CLEANUP_FC           0x00000020
#define CACHE_CONFIG_DISK_CACHE_PATHS_FC        0x00000040
#define CACHE_CONFIG_SYNC_MODE_FC               0x00000080
#define CACHE_CONFIG_CONTENT_PATHS_FC           0x00000100
#define CACHE_CONFIG_COOKIES_PATHS_FC           0x00000200
#define CACHE_CONFIG_HISTORY_PATHS_FC           0x00000400
#define CACHE_CONFIG_QUOTA_FC                   0x00000800
#define CACHE_CONFIG_USER_MODE_FC               0x00001000
#define CACHE_CONFIG_CONTENT_USAGE_FC           0x00002000
#define CACHE_CONFIG_STICKY_CONTENT_USAGE_FC    0x00004000

BOOLAPI
GetUrlCacheConfigInfoA(
    __inout LPINTERNET_CACHE_CONFIG_INFOA lpCacheConfigInfo,
    __reserved LPDWORD lpcbCacheConfigInfo,
    __in DWORD dwFieldControl
    );
BOOLAPI
GetUrlCacheConfigInfoW(
    __inout LPINTERNET_CACHE_CONFIG_INFOW lpCacheConfigInfo,
    __reserved LPDWORD lpcbCacheConfigInfo,
    __in DWORD dwFieldControl
    );
#ifdef UNICODE
#define GetUrlCacheConfigInfo  GetUrlCacheConfigInfoW
#else
#define GetUrlCacheConfigInfo  GetUrlCacheConfigInfoA
#endif // !UNICODE

BOOLAPI SetUrlCacheConfigInfoA(
    __in LPINTERNET_CACHE_CONFIG_INFOA lpCacheConfigInfo,
    __in DWORD dwFieldControl
    );
BOOLAPI SetUrlCacheConfigInfoW(
    __in LPINTERNET_CACHE_CONFIG_INFOW lpCacheConfigInfo,
    __in DWORD dwFieldControl
    );
#ifdef UNICODE
#define SetUrlCacheConfigInfo  SetUrlCacheConfigInfoW
#else
#define SetUrlCacheConfigInfo  SetUrlCacheConfigInfoA
#endif // !UNICODE

INTERNETAPI_(DWORD) RunOnceUrlCache(
        __in HWND      hwnd,
        __in HINSTANCE hinst,
        __in LPSTR     lpszCmd,
        __in int       nCmdShow);

INTERNETAPI_(DWORD) DeleteIE3Cache(
        __in HWND      hwnd,
        __in HINSTANCE hinst,
        __in LPSTR     lpszCmd,
        __in int       nCmdShow);

BOOLAPI UpdateUrlCacheContentPath(__in LPCSTR szNewPath);

// Cache header data defines.

#define CACHE_HEADER_DATA_CURRENT_SETTINGS_VERSION  0
#define CACHE_HEADER_DATA_CONLIST_CHANGE_COUNT      1
#define CACHE_HEADER_DATA_COOKIE_CHANGE_COUNT       2


#define CACHE_HEADER_DATA_NOTIFICATION_HWND         3
#define CACHE_HEADER_DATA_NOTIFICATION_MESG         4
#define CACHE_HEADER_DATA_ROOTGROUP_OFFSET          5
#define CACHE_HEADER_DATA_GID_LOW                   6
#define CACHE_HEADER_DATA_GID_HIGH                  7

#define CACHE_HEADER_DATA_CACHE_RESERVED_8          8
#define CACHE_HEADER_DATA_CACHE_RESERVED_9          9
#define CACHE_HEADER_DATA_CACHE_RESERVED_10         10
#define CACHE_HEADER_DATA_CACHE_RESERVED_11         11
#define CACHE_HEADER_DATA_CACHE_RESERVED_12         12
#define CACHE_HEADER_DATA_CACHE_RESERVED_13         13


#define CACHE_HEADER_DATA_SSL_STATE_COUNT           14
// legacy alias for ssl state count
#define CACHE_HEADER_DATA_DOWNLOAD_PARTIAL CACHE_HEADER_DATA_SSL_STATE_COUNT


#define CACHE_HEADER_DATA_CACHE_RESERVED_15         15
#define CACHE_HEADER_DATA_CACHE_RESERVED_16         16
#define CACHE_HEADER_DATA_CACHE_RESERVED_17         17
#define CACHE_HEADER_DATA_CACHE_RESERVED_18         18
#define CACHE_HEADER_DATA_CACHE_RESERVED_19         19
#define CACHE_HEADER_DATA_CACHE_RESERVED_20         20

#define CACHE_HEADER_DATA_NOTIFICATION_FILTER       21
#define CACHE_HEADER_DATA_ROOT_LEAK_OFFSET          22

#define CACHE_HEADER_DATA_CACHE_RESERVED_23         23
#define CACHE_HEADER_DATA_CACHE_RESERVED_24         24
#define CACHE_HEADER_DATA_CACHE_RESERVED_25         25
#define CACHE_HEADER_DATA_CACHE_RESERVED_26         26

#define CACHE_HEADER_DATA_ROOT_GROUPLIST_OFFSET     27 // offset to group list

#define CACHE_HEADER_DATA_CACHE_RESERVED_28         28
#define CACHE_HEADER_DATA_CACHE_RESERVED_29         29
#define CACHE_HEADER_DATA_CACHE_RESERVED_30         30
#define CACHE_HEADER_DATA_CACHE_RESERVED_31         31

#define CACHE_HEADER_DATA_LAST                      31

// options for cache notification filter
#define CACHE_NOTIFY_ADD_URL                        0x00000001
#define CACHE_NOTIFY_DELETE_URL                     0x00000002
#define CACHE_NOTIFY_UPDATE_URL                     0x00000004
#define CACHE_NOTIFY_DELETE_ALL                     0x00000008
#define CACHE_NOTIFY_URL_SET_STICKY                 0x00000010
#define CACHE_NOTIFY_URL_UNSET_STICKY               0x00000020
#define CACHE_NOTIFY_SET_ONLINE                     0x00000100
#define CACHE_NOTIFY_SET_OFFLINE                    0x00000200

#define CACHE_NOTIFY_FILTER_CHANGED                 0x10000000

BOOLAPI
RegisterUrlCacheNotification(
    __in_opt HWND    hWnd,
    __in       UINT    uMsg,
    __in       GROUPID gid,
    __in       DWORD   dwOpsFilter,
    __in       DWORD   dwReserved
    );



BOOL
GetUrlCacheHeaderData(__in DWORD nIdx, __out LPDWORD lpdwData);

BOOL
SetUrlCacheHeaderData(__in DWORD nIdx, __in DWORD dwData);

BOOL
IncrementUrlCacheHeaderData(__in DWORD nIdx, __out LPDWORD lpdwData);

BOOL
LoadUrlCacheContent();

BOOL
GetUrlCacheContainerInfoA(
    __in LPSTR lpszUrlName,
    __out_bcount(*lpdwContainerInfoBufferSize) LPINTERNET_CACHE_CONTAINER_INFOA lpContainerInfo,
    __inout LPDWORD lpdwContainerInfoBufferSize,
    __in DWORD dwOptions
    );
BOOL
GetUrlCacheContainerInfoW(
    __in LPWSTR lpszUrlName,
    __out_bcount(*lpdwContainerInfoBufferSize) LPINTERNET_CACHE_CONTAINER_INFOW lpContainerInfo,
    __inout LPDWORD lpdwContainerInfoBufferSize,
    __in DWORD dwOptions
    );
#ifdef UNICODE
#define GetUrlCacheContainerInfo  GetUrlCacheContainerInfoW
#else
#define GetUrlCacheContainerInfo  GetUrlCacheContainerInfoA
#endif // !UNICODE


//
// Autodial APIs
//

INTERNETAPI_(DWORD) InternetDialA(
    __in HWND     hwndParent,
    __in_opt LPSTR   lpszConnectoid,
    __in DWORD    dwFlags,
    __out DWORD_PTR *lpdwConnection,
    __in DWORD    dwReserved
    );

INTERNETAPI_(DWORD) InternetDialW(
    __in HWND     hwndParent,
    __in_opt LPWSTR   lpszConnectoid,
    __in DWORD    dwFlags,
    __out DWORD_PTR *lpdwConnection,
    __in DWORD    dwReserved
    );

#ifdef UNICODE
#define InternetDial  InternetDialW
#else
#ifdef _WINX32_
#define InternetDial  InternetDialA
#else
INTERNETAPI_(DWORD) InternetDial(
    __in HWND     hwndParent,
    __in_opt LPSTR   lpszConnectoid,
    __in DWORD    dwFlags,
    __out LPDWORD lpdwConnection,
    __in DWORD    dwReserved
    );
#endif // _WINX32_
#endif // !UNICODE

// Flags for InternetDial - must not conflict with InternetAutodial flags
//                          as they are valid here also.
#define INTERNET_DIAL_FORCE_PROMPT     0x2000
#define INTERNET_DIAL_SHOW_OFFLINE     0x4000
#define INTERNET_DIAL_UNATTENDED       0x8000

INTERNETAPI_(DWORD) InternetHangUp(
    __in   DWORD_PTR    dwConnection,
    __reserved DWORD        dwReserved);

#define INTERENT_GOONLINE_REFRESH 0x00000001
#define INTERENT_GOONLINE_MASK 0x00000001

INTERNETAPI_(BOOL) InternetGoOnlineA(
    __in_opt LPCSTR lpszURL,
    __in HWND     hwndParent,
    __in DWORD    dwFlags
    );

INTERNETAPI_(BOOL) InternetGoOnlineW(
    __in_opt LPCWSTR lpszURL,
    __in HWND     hwndParent,
    __in DWORD    dwFlags
    );

#ifdef UNICODE
#define InternetGoOnline  InternetGoOnlineW
#else
#ifdef _WINX32_
#define InternetGoOnline  InternetGoOnlineA
#else
INTERNETAPI_(BOOL) InternetGoOnline(
    __in_opt LPSTR   lpszURL,
    __in HWND     hwndParent,
    __in DWORD    dwFlags
    );
#endif // _WINX32_
#endif // !UNICODE

INTERNETAPI_(BOOL) InternetAutodial(
    __in       DWORD  dwFlags,
    __in_opt HWND   hwndParent);

// Flags for InternetAutodial
#define INTERNET_AUTODIAL_FORCE_ONLINE          1
#define INTERNET_AUTODIAL_FORCE_UNATTENDED      2
#define INTERNET_AUTODIAL_FAILIFSECURITYCHECK   4
#define INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT  8


#define INTERNET_AUTODIAL_FLAGS_MASK (INTERNET_AUTODIAL_FORCE_ONLINE | INTERNET_AUTODIAL_FORCE_UNATTENDED | INTERNET_AUTODIAL_FAILIFSECURITYCHECK | INTERNET_AUTODIAL_OVERRIDE_NET_PRESENT)
INTERNETAPI_(BOOL) InternetAutodialHangup(
    __in DWORD    dwReserved);

INTERNETAPI_(BOOL) InternetGetConnectedState(
    __out  LPDWORD  lpdwFlags,
    __reserved DWORD    dwReserved);

INTERNETAPI_(BOOL)
InternetGetConnectedStateExA(
    __out_opt LPDWORD lpdwFlags,
    __out_ecount_opt(dwBufLen) LPSTR lpszConnectionName,
    __in DWORD dwBufLen,
    __reserved DWORD dwReserved
    );

INTERNETAPI_(BOOL)
InternetGetConnectedStateExW(
    __out_opt LPDWORD lpdwFlags,
    __out_ecount_opt(dwBufLen) LPWSTR lpszConnectionName,
    __in DWORD dwBufLen,
    __reserved DWORD dwReserved
    );


INTERNETAPI
InternetGetDialEngineW(
    __in LPWSTR               pwzConnectoid,
    __in IDialEventSink *     pdes,
    __out IDialEngine **      ppde
    );

INTERNETAPI
InternetGetDialBrandingW(
    __in LPWSTR               pwzConnectoid,
    __out IDialBranding **    ppdb
    );


BOOLAPI
ReadGuidsForConnectedNetworks(
    __out_opt DWORD *pcNetworks,
    __out_opt PWSTR **pppwszNetworkGuids,
    __out_opt BSTR  **pppbstrNetworkNames,
    __out_opt PWSTR **pppwszGWMacs,
    __out_opt DWORD *pcGatewayMacs,
    __out_opt DWORD *pdwFlags
    );

//
// INTERNET_AUTOPROXY_INIT_FLAGS - Flags for InternetInitializeAutoProxyDll
//
#define INTERNET_AUTOPROXY_INIT_DEFAULT 0x1
#define INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC 0x2
#define INTERNET_AUTOPROXY_INIT_QUERYSTATE 0x4
#define INTERNET_AUTOPROXY_INIT_ONLYQUERY 0x8

#define INTERNET_AUTOPROXY_INIT_MASK (INTERNET_AUTOPROXY_INIT_DEFAULT|INTERNET_AUTOPROXY_INIT_DOWNLOADSYNC|INTERNET_AUTOPROXY_INIT_QUERYSTATE|INTERNET_AUTOPROXY_INIT_ONLYQUERY)


INTERNETAPI_(BOOL) InternetInitializeAutoProxyDll(
    __in DWORD dwReserved
    );

INTERNETAPI_(BOOL) DetectAutoProxyUrl(
    __out_ecount(dwAutoProxyUrlLength) LPSTR lpszAutoProxyUrl,
    __in DWORD dwAutoProxyUrlLength,
    __in DWORD dwDetectFlags
    );

INTERNETAPI_(BOOL) CreateMD5SSOHash (
    __in PWSTR    pszChallengeInfo,
    __in PWSTR    pwszRealm,
    __in PWSTR    pwszTarget,
    __out PBYTE   pbHexHash
    );

#ifdef UNICODE
#define InternetGetConnectedStateEx  InternetGetConnectedStateExW
#else
#ifdef _WINX32_
#define InternetGetConnectedStateEx  InternetGetConnectedStateExA
#else
INTERNETAPI_(BOOL) InternetGetConnectedStateEx(
    __out LPDWORD lpdwFlags,
    __out_ecount_opt(dwNameLen) LPSTR lpszConnectionName,
    __in DWORD dwNameLen,
    __in DWORD dwReserved
    );
#endif // _WINX32_
#endif // !UNICODE

// Flags for InternetGetConnectedState and Ex
#define INTERNET_CONNECTION_MODEM           0x01
#define INTERNET_CONNECTION_LAN             0x02
#define INTERNET_CONNECTION_PROXY           0x04
#define INTERNET_CONNECTION_MODEM_BUSY      0x08  /* no longer used */
#define INTERNET_RAS_INSTALLED              0x10
#define INTERNET_CONNECTION_OFFLINE         0x20
#define INTERNET_CONNECTION_CONFIGURED      0x40

//
// Custom dial handler functions
//

// Custom dial handler prototype
typedef DWORD (CALLBACK * PFN_DIAL_HANDLER) (HWND, LPCSTR, DWORD, LPDWORD);

// Flags for custom dial handler
#define INTERNET_CUSTOMDIAL_CONNECT         0
#define INTERNET_CUSTOMDIAL_UNATTENDED      1
#define INTERNET_CUSTOMDIAL_DISCONNECT      2
#define INTERNET_CUSTOMDIAL_SHOWOFFLINE     4

// Custom dial handler supported functionality flags
#define INTERNET_CUSTOMDIAL_SAFE_FOR_UNATTENDED 1
#define INTERNET_CUSTOMDIAL_WILL_SUPPLY_STATE   2
#define INTERNET_CUSTOMDIAL_CAN_HANGUP          4

INTERNETAPI_(BOOL) InternetSetDialStateA(
    __in_opt LPCSTR lpszConnectoid,
    __in DWORD    dwState,
    __in DWORD    dwReserved
    );

INTERNETAPI_(BOOL) InternetSetDialStateW(
    __in_opt LPCWSTR lpszConnectoid,
    __in DWORD    dwState,
    __in DWORD    dwReserved
    );

#ifdef UNICODE
#define InternetSetDialState  InternetSetDialStateW
#else
#ifdef _WINX32_
#define InternetSetDialState  InternetSetDialStateA
#else
INTERNETAPI_(BOOL) InternetSetDialState(
    __in_opt LPCSTR lpszConnectoid,
    __in DWORD    dwState,
    __in DWORD    dwReserved
    );
#endif // _WINX32_
#endif // !UNICODE

// States for InternetSetDialState
#define INTERNET_DIALSTATE_DISCONNECTED     1

// Registry entries used by the dialing code
// All of these entries are in:
// HKCU\software\microsoft\windows\current version\internet settings

#define REGSTR_DIAL_AUTOCONNECT     "AutoConnect"

// Registry entries for legacy cookies
#define REGSTR_LEASH_LEGACY_COOKIES "LeashLegacyCookies"



// Used by security manager.

INTERNETAPI_(BOOL) IsHostInProxyBypassList(
    __in INTERNET_SCHEME tScheme,
    __in_ecount(cchHost) LPCSTR lpszHost,
    __in DWORD cchHost);

// Used by Shell to determine if anyone has loaded wininet yet
// Shell code calls OpenMutex with this name and if no mutex is
// obtained, we know that no copy of wininet has been loaded yet
#if _WIN32_WINNT >= _WIN32_WINNT_WINXP
#define LOCAL_NAMESPACE_PREFIX            "Local\\"
#else
#define LOCAL_NAMESPACE_PREFIX
#endif
#define WININET_STARTUP_MUTEX LOCAL_NAMESPACE_PREFIX "WininetStartupMutex"


BOOL DoConnectoidsExist(void); // Returns TRUE if any RAS connectoids exist and FALSE otherwise

BOOL GetDiskInfoA(
    __in   PCSTR pszPath,
    __out_opt PDWORD pdwClusterSize,
    __out_opt PDWORDLONG pdlAvail,
    __out_opt PDWORDLONG pdlTotal);

typedef BOOL (*CACHE_OPERATOR)(INTERNET_CACHE_ENTRY_INFO* pcei, PDWORD pcbcei, PVOID pOpData);

BOOL PerformOperationOverUrlCacheA(
    __in_opt    PCSTR     pszUrlSearchPattern,
    __in          DWORD     dwFlags,
    __in          DWORD     dwFilter,
    __in          GROUPID   GroupId,
    __reserved    PVOID     pReserved1,
    __reserved    PDWORD    pdwReserved2,
    __reserved    PVOID     pReserved3,
    __in          CACHE_OPERATOR op,
    __inout       PVOID     pOperatorData
    );

BOOL IsProfilesEnabled();

INTERNETAPI_(DWORD) _GetFileExtensionFromUrl(
    __in LPSTR lpszUrl,
    __in DWORD dwFlags,
    __inout_bcount(*pcchExt) LPSTR lpszExt,
    __inout DWORD *pcchExt
);

INTERNETAPI_(DWORD) InternalInternetGetCookie(
    __in LPCSTR lpszUrl,
    __out_ecount(*lpdwDataSize) LPSTR lpszCookieData,
    __inout DWORD *lpdwDataSize
);


//  in cookimp.cxx and cookexp.cxx
BOOLAPI ImportCookieFileA(
    __in LPCSTR szFilename
);
//  in cookimp.cxx and cookexp.cxx
BOOLAPI ImportCookieFileW(
    __in LPCWSTR szFilename
);
#ifdef UNICODE
#define ImportCookieFile  ImportCookieFileW
#else
#define ImportCookieFile  ImportCookieFileA
#endif // !UNICODE
BOOLAPI ExportCookieFileA(
    __in LPCSTR szFilename,
    __in BOOL fAppend
);
BOOLAPI ExportCookieFileW(
    __in LPCWSTR szFilename,
    __in BOOL fAppend
);
#ifdef UNICODE
#define ExportCookieFile  ExportCookieFileW
#else
#define ExportCookieFile  ExportCookieFileA
#endif // !UNICODE

BOOLAPI IsDomainLegalCookieDomainA(    // in "wininet\http\cookie.cxx"
    __in LPCSTR pchDomain,
    __in LPCSTR pchFullDomain
);
BOOLAPI IsDomainLegalCookieDomainW(    // in "wininet\http\cookie.cxx"
    __in LPCWSTR pchDomain,
    __in LPCWSTR pchFullDomain
);
#ifdef UNICODE
#define IsDomainLegalCookieDomain  IsDomainLegalCookieDomainW
#else
#define IsDomainLegalCookieDomain  IsDomainLegalCookieDomainA
#endif // !UNICODE


INTERNETAPI_(BOOL) InternetEnumPerSiteCookieDecisionA(
    __out_ecount(*pcSiteNameSize) LPSTR pszSiteName,
    __inout unsigned long *pcSiteNameSize,
    __out unsigned long *pdwDecision,
    __in unsigned long dwIndex
);
INTERNETAPI_(BOOL) InternetEnumPerSiteCookieDecisionW(
    __out_ecount(*pcSiteNameSize) LPWSTR pszSiteName,
    __inout unsigned long *pcSiteNameSize,
    __out unsigned long *pdwDecision,
    __in unsigned long dwIndex
);
#ifdef UNICODE
#define InternetEnumPerSiteCookieDecision  InternetEnumPerSiteCookieDecisionW
#else
#define InternetEnumPerSiteCookieDecision  InternetEnumPerSiteCookieDecisionA
#endif // !UNICODE

#define INTERNET_SUPPRESS_COOKIE_PERSIST            0x03
#define INTERNET_SUPPRESS_COOKIE_PERSIST_RESET      0x04
//
// Privacy settings values and APIs
//

#define PRIVACY_TEMPLATE_NO_COOKIES     0
#define PRIVACY_TEMPLATE_HIGH           1
#define PRIVACY_TEMPLATE_MEDIUM_HIGH    2
#define PRIVACY_TEMPLATE_MEDIUM         3
#define PRIVACY_TEMPLATE_MEDIUM_LOW     4
#define PRIVACY_TEMPLATE_LOW            5
#define PRIVACY_TEMPLATE_CUSTOM         100
#define PRIVACY_TEMPLATE_ADVANCED       101

#define PRIVACY_TEMPLATE_MAX            PRIVACY_TEMPLATE_LOW

#define PRIVACY_TYPE_FIRST_PARTY        0
#define PRIVACY_TYPE_THIRD_PARTY        1

INTERNETAPI_(DWORD)
PrivacySetZonePreferenceW(
    __in DWORD       dwZone,
    __in DWORD       dwType,
    __in DWORD       dwTemplate,
    __in_opt LPCWSTR     pszPreference
    );

INTERNETAPI_(DWORD)
PrivacyGetZonePreferenceW(
    __in DWORD dwZone,
    __in DWORD dwType,
    __out_opt LPDWORD pdwTemplate,
    __out_ecount_opt(*pdwBufferLength) LPWSTR pszBuffer,
    __inout_opt LPDWORD pdwBufferLength
    );

#define _P3PGLOBAL_H_

typedef char  P3PCHAR;
typedef char *P3PURL;
typedef char *P3PVERB;
typedef const char *P3PCURL;
typedef BSTR P3PCXSL;
typedef void *P3PHANDLE;

#define URL_LIMIT INTERNET_MAX_URL_LENGTH

struct P3PResource {

   P3PCURL  pszLocation;
   P3PVERB  pszVerb;

   P3PCURL  pszP3PHeaderRef;
   P3PCURL  pszLinkTagRef;

   struct P3PResource *pContainer;
};

struct P3PSignal {

   /* Window handle for PostMessage and corresponding msg value */
   HWND         hwnd;
   unsigned int message;

   /* Event handle to signal */
   HANDLE   hEvent;

   /* Application-defined context */
   void    *pContext;

   /* OUT: request handle */
   P3PHANDLE hRequest;
};

typedef enum {

   P3P_Done       = 0x0,
   P3P_Success    = 0x0,

   P3P_NoPolicy   = 0x2,
   P3P_InProgress = 0x3,
   P3P_Failed     = 0x4,
   P3P_NotFound   = 0x5,
   P3P_FormatErr  = 0x6,
   P3P_Cancelled  = 0x7,
   P3P_NotStarted = 0x8,
   P3P_XMLError   = 0x9,
   P3P_Expired    = 0xA,

   P3P_Error      = 0xFF,
}
P3PStatus;

INTERNETAPI_(int) MapResourceToPolicy(struct P3PResource *pResource, __out_ecount(dwSize) P3PURL pszPolicy, unsigned long dwSize, struct P3PSignal *pSignal);

INTERNETAPI_(int) GetP3PPolicy(__in P3PCURL pszPolicyURL, __in HANDLE hDestination, __in P3PCXSL pszXSLtransform, __out struct P3PSignal *pSignal);

INTERNETAPI_(int) FreeP3PObject(__in P3PHANDLE hObject);

INTERNETAPI_(int) GetP3PRequestStatus(__in P3PHANDLE hObject);


#if defined(__cplusplus)
}
#endif

#endif // !define(_WININETEX_)

