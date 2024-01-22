/*********************************************************************
*
* WTSDEFS.H
*
*   Windows Terminal Server Interface Header File
*
*   Copyright (c) 1997-2001 Microsoft Corporation
*
**********************************************************************/

#ifndef _INC_WTSDEFS
#define _INC_WTSDEFS

#if _MSC_VER > 1000
#pragma once
#endif

#ifdef __cplusplus
extern "C" {
#endif


/*****************************************************************
 *  DEFINES
 ****************************************************************/
 
#define WTS_DOMAIN_LENGTH            255
#define WTS_USERNAME_LENGTH          255
#define WTS_PASSWORD_LENGTH          255
#define WTS_DIRECTORY_LENGTH         256
#define WTS_INITIALPROGRAM_LENGTH    256
#define WTS_PROTOCOL_NAME_LENGTH     8
#define WTS_DRIVER_NAME_LENGTH       8
#define WTS_DEVICE_NAME_LENGTH       19
#define WTS_IMEFILENAME_LENGTH       32
#define WTS_CLIENTNAME_LENGTH        20
#define WTS_CLIENTADDRESS_LENGTH     30
#define WTS_CLIENT_PRODUCT_ID_LENGTH 32
#define WTS_MAX_PROTOCOL_CACHE       4
#define WTS_MAX_CACHE_RESERVED       20
#define WTS_MAX_RESERVED             100
#define WTS_MAX_COUNTERS             100
#define WTS_MAX_DISPLAY_IOCTL_DATA   256

//
// Fields used in the PerformanceFlags property in WTS_CONNECTION_CONFIG
// Setting a flag disables that feature
//
#define WTS_PERF_DISABLE_NOTHING                              0x00000000
#define WTS_PERF_DISABLE_WALLPAPER                            0x00000001
#define WTS_PERF_DISABLE_FULLWINDOWDRAG                       0x00000002
#define WTS_PERF_DISABLE_MENUANIMATIONS                       0x00000004
#define WTS_PERF_DISABLE_THEMING                              0x00000008
#define WTS_PERF_ENABLE_ENHANCED_GRAPHICS                     0x00000010
#define WTS_PERF_DISABLE_CURSOR_SHADOW                        0x00000020
#define WTS_PERF_DISABLE_CURSORSETTINGS                       0x00000040
#define WTS_PERF_ENABLE_FONT_SMOOTHING                        0x00000080
#define WTS_PERF_ENABLE_DESKTOP_COMPOSITION                   0x00000100


/*****************************************************************
 *  STRUCTURES
 ****************************************************************/

typedef BYTE *PBYTE;

// IP address
//
typedef struct _WTS_SOCKADDR {
#ifdef __midl
    USHORT sin_family;
    union switch (unsigned short sin_family) u 
    {
        case 2:         // AF_INET
        struct{
            USHORT sin_port;
            ULONG  in_addr;
            UCHAR  sin_zero[8];
        } ipv4;
        case 23:        // AF_INET6
        struct {
            USHORT sin6_port;
            ULONG  sin6_flowinfo;
            USHORT sin6_addr[8];
            ULONG  sin6_scope_id;
        } ipv6;
    };
#else
    USHORT sin_family;
    union {
        struct{
            USHORT sin_port;
            ULONG  in_addr;
            UCHAR  sin_zero[8];
        } ipv4;
        struct {
            USHORT sin6_port;
            ULONG  sin6_flowinfo;
            USHORT sin6_addr[8];
            ULONG  sin6_scope_id;
        } ipv6;               
    } u;
#endif
} WTS_SOCKADDR, *PWTS_SOCKADDR;

typedef struct _WTS_SMALL_RECT {  
    SHORT Left;  
    SHORT Top;  
    SHORT Right;  
    SHORT Bottom;
} WTS_SMALL_RECT, *PWTS_SMALL_RECT;

// =================================================================
//  Service State Change
// =================================================================
typedef enum {
    WTS_SERVICE_NONE,                   // No service (start/stop) state change
    WTS_SERVICE_START,                  // RCM Service starting
    WTS_SERVICE_STOP                    // RCM Service stopping
} WTS_RCM_SERVICE_STATE;

typedef enum {
    WTS_DRAIN_STATE_NONE,               // No drain state change
    WTS_DRAIN_IN_DRAIN,                 // RCM In drain.
    WTS_DRAIN_NOT_IN_DRAIN              // RCM Out of drain.
} WTS_RCM_DRAIN_STATE;

typedef struct _WTS_SERVICE_STATE {
    WTS_RCM_SERVICE_STATE   RcmServiceState;
    WTS_RCM_DRAIN_STATE     RcmDrainState;
}WTS_SERVICE_STATE, *PWTS_SERVICE_STATE;

typedef struct _WTS_SESSION_ID {
    GUID    SessionUniqueGuid;
    ULONG   SessionId;
}WTS_SESSION_ID, *PWTS_SESSION_ID;

typedef struct _WTS_USER_CREDENTIAL {
    WCHAR   UserName[ WTS_USERNAME_LENGTH + 1 ];
    WCHAR   Password[ WTS_PASSWORD_LENGTH + 1 ];
    WCHAR   Domain[ WTS_DOMAIN_LENGTH + 1 ];
} WTS_USER_CREDENTIAL, *PWTS_USER_CREDENTIAL;


/* -------------------------------------------------------------------
 * Structures used to query connectoin specific data from the protocol
 * ------------------------------------------------------------------*/
typedef struct _WTS_SYSTEMTIME {
    USHORT wYear;
    USHORT wMonth;
    USHORT wDayOfWeek;
    USHORT wDay;
    USHORT wHour;
    USHORT wMinute;
    USHORT wSecond;
    USHORT wMilliseconds;
} WTS_SYSTEMTIME, *PWTS_SYSTEMTIME;

typedef struct _WTS_TIME_ZONE_INFORMATION {
    LONG Bias;
    WCHAR StandardName[ 32 ];
    WTS_SYSTEMTIME StandardDate;
    LONG StandardBias;
    WCHAR DaylightName[ 32 ];
    WTS_SYSTEMTIME DaylightDate;
    LONG DaylightBias;
} WTS_TIME_ZONE_INFORMATION, *PWTS_TIME_ZONE_INFORMATION;

typedef struct _WTS_CLIENT_DATA {
  
    /* --------------------------------------------------------
     * Properties that will be used by RCM for the session. 
     * These MIGHT be exposed through WTSAPI
     * -------------------------------------------------------*/
     
    // Disable Ctrl-Atl-Del
    BOOLEAN fDisableCtrlAltDel;    
    
    // Detect Double Click
    BOOLEAN fDoubleClickDetect;    
    
    // Enable Windows key
    // Will be sent to win32k
    BOOLEAN fEnableWindowsKey;
         
    // Hide the title bar
    // Will be sent to win32k
    BOOLEAN fHideTitleBar; 
   
    // This will overwrite the fInheritAutoLogon flag 
    // from listener registry
    BOOL fInheritAutoLogon;
    
    // Prompt for password even if autologon set
    // Will be used if fInheritAutoLogon is set
    // and policy not set on the machine
    BOOLEAN fPromptForPassword;
        
    // Client used saved credentials
    BOOLEAN fUsingSavedCreds;
    
    // User credentials
    // Will be used if fInheritAutoLogon is set
    WCHAR Domain[WTS_DOMAIN_LENGTH + 1];   // WTS_DOMAIN_LENGTH + 1
    WCHAR UserName[ WTS_USERNAME_LENGTH + 1 ];
    WCHAR Password[ WTS_PASSWORD_LENGTH + 1 ];

    // Smartcard PIN is used to log in 
    // Will be used if fInheritAutoLogon is set
    BOOLEAN fPasswordIsScPin;
    
    // This will overwrite the fInheritInitialProgram flag 
    // from listener registry
    BOOL fInheritInitialProgram;
    
    // Working directory
    // Will be used if fInheritInitialProgram is set
    WCHAR WorkDirectory[ WTS_DIRECTORY_LENGTH + 1 ];
    
    // Intial Program to start in TS session
    // Will be used if fInheritInitialProgram is set
    WCHAR InitialProgram[ WTS_INITIALPROGRAM_LENGTH + 1 ];
    
    // Maximize the shell
    // Will be used if fInheritInitialProgram is set
    BOOLEAN fMaximizeShell;        
    
    // Security level of encryption
    BYTE EncryptionLevel;
        
    // List of features to disable for perf
    // Will be used to disable specific features
    ULONG PerformanceFlags;

    // Name of the protocol
    // Will be sent to win32k
    WCHAR ProtocolName[ WTS_PROTOCOL_NAME_LENGTH + 1 ];

    // Protocol type
    USHORT ProtocolType;
    
    // This will overwrite the fInheritColorDepth flag 
    // from listener registry
    BOOL fInheritColorDepth;
    
    // Display properties
    // Will be sent to win32k
    USHORT HRes;
    USHORT VRes;
    USHORT ColorDepth;
    WCHAR  DisplayDriverName[ WTS_DRIVER_NAME_LENGTH + 1 ];
    WCHAR  DisplayDeviceName[ WTS_DEVICE_NAME_LENGTH + 1 ];
        
    // Enable Mouse input
    // Will be sent to win32k
    BOOLEAN fMouse;

    // Keyboard information
    // Will be sent to win32k
    ULONG KeyboardLayout;
    ULONG KeyboardType;
    ULONG KeyboardSubType;
    ULONG KeyboardFunctionKey;
    WCHAR imeFileName[ WTS_IMEFILENAME_LENGTH + 1 ];

    // Client's active input locale HKL
    ULONG ActiveInputLocale; 
    
    // Client selected no audio
    BOOLEAN fNoAudioPlayback;
    
    // Client selected leave audio at remote computer
    BOOLEAN fRemoteConsoleAudio;  

    // Name of the audio driver
    // Will be sent to win32k
    WCHAR AudioDriverName[ WTS_DRIVER_NAME_LENGTH + 1 ];

    // Client time zone information
    // Will be sent to win32k
    WTS_TIME_ZONE_INFORMATION ClientTimeZone;
   
    /* ----------------------------------------------------
     * Properties that are not used by RCM but exposed 
     * through WTS API
     * ---------------------------------------------------*/ 
     
    // Client machine name
    WCHAR ClientName[ WTS_CLIENTNAME_LENGTH + 1 ];
    
    // Client computer's unique serial number
    ULONG SerialNumber; 
        
    // Client IP address
    ULONG ClientAddressFamily;
    WCHAR ClientAddress[ WTS_CLIENTADDRESS_LENGTH + 1 ];
    WTS_SOCKADDR ClientSockAddress;
    
    // Client Directory
    WCHAR ClientDirectory[ WTS_DIRECTORY_LENGTH + 1 ];
    
    // Client build number
    ULONG ClientBuildNumber;
    
    // Client software product id
    USHORT ClientProductId;     
    
    // number of output buffers on host
    USHORT OutBufCountHost;
      
    // number of output buffers on client
    USHORT OutBufCountClient;
    
    // length of output buffers in bytes
    USHORT OutBufLength;
    
    // Client Session ID
    ULONG ClientSessionId;
    
    // Client Product ID
    WCHAR ClientDigProductId[ WTS_CLIENT_PRODUCT_ID_LENGTH + 1 ];
    
    // ******* REDIRECTIONS ********//
    // These will be prepopulated with data from policies
    // Changing them will led to policies being overwritten 
    
    // Disable Printer Mapping
    BOOLEAN fDisableCpm;
    
    // Disable Drive Mapping
    BOOLEAN fDisableCdm;
    
    // Disable COM port Mapping
    BOOLEAN fDisableCcm;
    
    // Disable LPT printer redirection
    BOOLEAN fDisableLPT;
    
    // Disable Clipboard redirection
    BOOLEAN fDisableClip;

    // Disable PNP redirection
    BOOLEAN fDisablePNP;
} WTS_CLIENT_DATA, *PWTS_CLIENT_DATA;

typedef struct _WTS_USER_DATA {
  
    /* --------------------------------------------------------
     * Should be filled in with user specific properties.
     * Queried after user has logged in and User GP merged.
     * This will be pre-populated with client data. Hence if user 
     * property doesn't exist for any field, do not change it.
     * -------------------------------------------------------*/
     
    // Corresponding to WorkDirectory in WTS_CLIENT_DATA
    WCHAR WorkDirectory[ WTS_DIRECTORY_LENGTH + 1 ];
    
    // Corresponding to InitialProgram in WTS_CLIENT_DATA
    WCHAR InitialProgram[ WTS_INITIALPROGRAM_LENGTH + 1 ];
    
    // Corresponding to ClientTimeZone in WTS_CLIENT_DATA
    WTS_TIME_ZONE_INFORMATION UserTimeZone;

}WTS_USER_DATA, *PWTS_USER_DATA;

/* -------------------------------------------------------------------
 * Structures used to pass down policy data to the protocol
 * ------------------------------------------------------------------*/
typedef struct _WTS_POLICY_DATA {
    // Disable encryption
    BOOLEAN fDisableEncryption;

    // Disable auto-reconnect
    BOOLEAN fDisableAutoReconnect;

    // Color Depth
    ULONG ColorDepth;

    // Minimum allowed Encryption Level
    BYTE MinEncryptionLevel;
    
    // ******* REDIRECTIONS ********//
    // Disable Printer Mapping
    BOOLEAN fDisableCpm;
    
    // Disable Drive Mapping
    BOOLEAN fDisableCdm;
    
    // Disable COM port Mapping
    BOOLEAN fDisableCcm;
    
    // Disable LPT printer redirection
    BOOLEAN fDisableLPT;
    
    // Disable Clipboard redirection
    BOOLEAN fDisableClip;

    // Disable PNP redirection
    BOOLEAN fDisablePNPRedir;
} WTS_POLICY_DATA, *PWTS_POLICY_DATA;

/* -------------------------------------------------------------------
 * Structures used to query performance data from the protocol using
 * GetProtocolStatus call 
 * -------------------------------------------------------------------*/

// Protocol Cache stats
//
typedef struct _WTS_PROTOCOL_CACHE {
    ULONG CacheReads;
    ULONG CacheHits;
} WTS_PROTOCOL_CACHE, *PWTS_PROTOCOL_CACHE;

// Union of Protocol cache, TShare Cache and Reserved stats
//
#ifdef __midl
typedef [switch_type(DWORD)] union _WTS_CACHE_STATS_UN {
    [case(1)]
        WTS_PROTOCOL_CACHE ProtocolCache[ WTS_MAX_PROTOCOL_CACHE ];  
    [case(2)]
        ULONG TShareCacheStats;
    [case(3)]
        ULONG Reserved[ WTS_MAX_CACHE_RESERVED ];    // Protocol specific Reserved data
} WTS_CACHE_STATS_UN, *PWTS_CACHE_STATS_UN;

// Cache Statistics
//
typedef struct _WTS_CACHE_STATS {
    DWORD Specific;
    [switch_is(Specific)] WTS_CACHE_STATS_UN Data;
    USHORT ProtocolType;        // Protocol Type
    USHORT Length;              // Length of Data
} WTS_CACHE_STATS, *PWTS_CACHE_STATS;
#else
typedef union _WTS_CACHE_STATS_UN {
    WTS_PROTOCOL_CACHE ProtocolCache[ WTS_MAX_PROTOCOL_CACHE ];  
    ULONG TShareCacheStats;
    ULONG Reserved[ WTS_MAX_CACHE_RESERVED ];    // Protocol specific Reserved data
} WTS_CACHE_STATS_UN, *PWTS_CACHE_STATS_UN;

// Cache Statistics
//
typedef struct _WTS_CACHE_STATS {
    DWORD Specific;
    WTS_CACHE_STATS_UN Data;
    USHORT ProtocolType;        // Protocol Type
    USHORT Length;              // Length of Data
} WTS_CACHE_STATS, *PWTS_CACHE_STATS;
#endif

// Protocol Counters Data
//
typedef struct _WTS_PROTOCOL_COUNTERS {
    ULONG WdBytes;              // wd common
    ULONG WdFrames;             // wd common
    ULONG WaitForOutBuf;        // wd common
    ULONG Frames;               // td common
    ULONG Bytes;                // td common
    ULONG CompressedBytes;      // pdcomp
    ULONG CompressFlushes;      // pdcomp
    ULONG Errors;               // pdreli
    ULONG Timeouts;             // pdreli
    ULONG AsyncFramingError;    // pdasync
    ULONG AsyncOverrunError;    // pdasync
    ULONG AsyncOverflowError;   // pdasync
    ULONG AsyncParityError;     // pdasync
    ULONG TdErrors;             // td common
    USHORT ProtocolType;        // Protocol Type
    USHORT Length;              // Length of Reserved
    USHORT Specific;            // Specifies type of Reserved
    ULONG Reserved[ WTS_MAX_RESERVED ];        
} WTS_PROTOCOL_COUNTERS, * PWTS_PROTOCOL_COUNTERS;

// Protocol Status
//
typedef struct _WTS_PROTOCOL_STATUS {
    WTS_PROTOCOL_COUNTERS Output;
    WTS_PROTOCOL_COUNTERS Input;
    WTS_CACHE_STATS Cache;
    ULONG AsyncSignal;                  // MS_CTS_ON, MS_DSR_ON, etc...
    ULONG AsyncSignalMask;              // EV_CTS, EV_DSR, etc...
    LARGE_INTEGER  Counters[ WTS_MAX_COUNTERS ];      
} WTS_PROTOCOL_STATUS, * PWTS_PROTOCOL_STATUS;

// Display IOCTL data
typedef struct _WTS_DISPLAY_IOCTL {
    BYTE  pDisplayIOCtlData[ WTS_MAX_DISPLAY_IOCTL_DATA ];
    ULONG cbDisplayIOCtlData;
} WTS_DISPLAY_IOCTL, * PWTS_DISPLAY_IOCTL;

/* -------------------------------------------------------------------
 * LogonUI Error Redirector Response
 * -------------------------------------------------------------------*/
typedef enum _WTS_LOGON_ERROR_REDIRECTOR_RESPONSE
{
    // Used only as a safe initialization value.
    WTS_LOGON_ERR_INVALID = 0,

    // The call was not handled by the redirector.   
    // The call should be handled normally by LogonUI.
    WTS_LOGON_ERR_NOT_HANDLED,

    // The call was handled by the redirector.
    // LogonUI should paint itself normally.
    WTS_LOGON_ERR_HANDLED_SHOW,

    // The call was handled by the redirector and should not be passed to
    // the next redirector.  LogonUI should not paint the normal error screen.
    // LogonUI will then attempt to gather credentials again.
    WTS_LOGON_ERR_HANDLED_DONT_SHOW,

    // The call was handled by the redirector and should not be passed to
    // the next redirector.  LogonUI should not show itself and should
    // NOT attempt to gather credentials again.
    WTS_LOGON_ERR_HANDLED_DONT_SHOW_START_OVER,

} WTS_LOGON_ERROR_REDIRECTOR_RESPONSE;


/* -------------------------------------------------------------------
 * QueryProperty GUIDs
 * These are the mandatory properties that the protocol must implement.
 * For any other QueryProperty that the protocol doesn't understand,
 * it should return E_NOTIMPL
 * -------------------------------------------------------------------*/

#define WTS_VALUE_TYPE_ULONG        1
#define WTS_VALUE_TYPE_STRING       2
#define WTS_VALUE_TYPE_BINARY       3
#define WTS_VALUE_TYPE_GUID         4

// Basic structure used to query properties.
// This can be used as both input and output parameter
typedef struct __WTS_PROPERTY_VALUE
{
#ifdef __midl
    union switch ( unsigned short Type ) u {
        case WTS_VALUE_TYPE_ULONG:
            ULONG   ulVal;
        case WTS_VALUE_TYPE_STRING:
            struct {
                [range(0, 0x8000)]  ULONG size;
                [string, size_is(size)] WCHAR* pstrVal;
            } strVal;
        case WTS_VALUE_TYPE_BINARY:
            struct {
                [range(0, 0x8000)]  ULONG size;
                [size_is(size)]     char* pbVal;
            } bVal;                
        case WTS_VALUE_TYPE_GUID:
            GUID   guidVal;
        };

#else
    unsigned short Type;
    union {
        ULONG ulVal;
        struct {
            ULONG size;
            WCHAR* pstrVal;
        } strVal;
        struct {
            ULONG size;
            char* pbVal;
        } bVal; 
        GUID guidVal;               
    } u;
#endif
} WTS_PROPERTY_VALUE, *PWTS_PROPERTY_VALUE;

#ifndef __midl

//
// **************** WTS_QUERY_ALLOWED_INITIAL_APP *********************
//
// This is used to query if protocol wants to allow an initial app to run.
// If protocol wants initial app to run, it must implement this property 
// query and return success.
// 
// Input to this query - It passes 3 WTS_PROPERTY_VALUE structures
//          pPropertyEntriesIn[0].Type = WTS_VALUE_TYPE_STRING;
//          pPropertyEntriesIn[0].u.strVal.pstrVal = NAME of the inital app, ex. notepad.exe
//          pPropertyEntriesIn[0].u.strVal.size = Length of the name string
//      
//          pPropertyEntriesIn[1].Type = WTS_VALUE_TYPE_STRING;
//          pPropertyEntriesIn[1].u.strVal.pstrVal = PARAMETERS for the inital app
//          pPropertyEntriesIn[1].u.strVal.size = Length of the parameter string
//      
//          pPropertyEntriesIn[2].Type = WTS_VALUE_TYPE_ULONG;
//          pPropertyEntriesIn[2].u.ulVal = Reserved
//      
// Output to this query - It passes 3 WTS_PROPERTY_VALUE structures. Protocol needs to set it to:
//          pPropertyEntriesOut[0].Type = WTS_VALUE_TYPE_STRING;
//          pPropertyEntriesOut[0].u.strVal.pstrVal = Full command line to execute. Protocol should 
//                                                    append current working dir to the app name and put here
//          pPropertyEntriesOut[0].u.strVal.size = Length of command line
//
//          pPropertyEntriesOut[1].Type = WTS_VALUE_TYPE_STRING;
//          pPropertyEntriesOut[1].u.strVal.pstrVal = PARAMETERS for the inital app
//          pPropertyEntriesOut[1].u.strVal.size = Length of the parameter string
//
//      If protocol want to maintain the initial app and parameters passed in input parameter, 
//      it should just copy them to the corresponding fields (two above) in output paramters
//      
//          pPropertyEntriesOut[2].Type = WTS_VALUE_TYPE_ULONG;
//          pPropertyEntriesOut[2].u.ulVal = 0 indicates don't allow initial app to run, allow otherwise
//
EXTERN_C const __declspec(selectany) GUID WTS_QUERY_ALLOWED_INITIAL_APP = /*C77D1B30-5BE1-4c6b-A0E1-BD6D2E5C9FCC*/
{ 0xc77d1b30, 0x5be1, 0x4c6b, { 0xa0, 0xe1, 0xbd, 0x6d, 0x2e, 0x5c, 0x9f, 0xcc} };

// **************** WTS_QUERY_LOGON_SCREEN_SIZE *********************
//
// This is used by LogonUI to query the size of the logon screen.
// 
// Input to this query - NONE
//      
// Output to this query - It passes 1 WTS_PROPERTY_VALUE structure. Protocol needs to set it to:
//          pPropertyEntriesOut[0].Type = WTS_VALUE_TYPE_ULONG;
//          pPropertyEntriesOut[0].u.strVal.pstrVal = Size of the LogonUI screen.
//
// If protocol doesn't want to keep the default size of the LogonUI screen, it must fail this call with error E_NOTIMPL.
//
EXTERN_C const __declspec(selectany) GUID WTS_QUERY_LOGON_SCREEN_SIZE = /* 8b8e0fe7-0804-4a0e-b279-8660b1df0049 */
{ 0x8b8e0fe7, 0x0804, 0x4a0e, {0xb2, 0x79, 0x86, 0x60, 0xb1, 0xdf, 0x00, 0x49} };

// **************** WTS_QUERY_AUDIOENUM_DLL **************************
//
// This is used by to query Remote audio enumerator DLL name.
// 
// Input to this query - NONE
//      
// Output to this query - 
//          pPropertyEntriesOut[0].Type = WTS_VALUE_TYPE_STRING;
//          pPropertyEntriesOut[0].u.strVal.pstrVal =  Remote audio enumerator DLL name
//          pPropertyEntriesOut[0].u.strVal.size = Length of DLL name
//
//
EXTERN_C const __declspec(selectany) GUID WTS_QUERY_AUDIOENUM_DLL = /* 9bf4fa97-c883-4c2a-80ab-5a39c9af00db */
{ 0x9bf4fa97, 0xc883, 0x4c2a, {0x80, 0xab, 0x5a, 0x39, 0xc9, 0xaf, 0x00, 0xdb} };

// ************************************************************************

// **************** WTS_QUERY_MF_FORMAT_SUPPORT **************************
//
// This is used by Remote Desktop Media Foundation Plugin to query the sink 
// objects to be used for specified media formats.
// 
// Input to this query is a WTS_PROPERTY_VALUE structures containing
//          pPropertyEntriesOut[0].Type = WTS_VALUE_TYPE_BINARY;
//          pPropertyEntriesOut[0].u.bVal.pbVal = TSMF_SUPPORT_DATA_IN structure
//          pPropertyEntriesOut[0].u.bVal.size = Size of TSMF_SUPPORT_DATA_IN structure. 
//               This will vary based on the size of the variable data in the structure.
//      
// Output to this query is a WTS_PROPERTY_VALUE structures containing
//          pPropertyEntriesOut[0].Type = WTS_VALUE_TYPE_BINARY;
//          pPropertyEntriesOut[0].u.bVal.pbVal = TSMF_SUPPORT_DATA_OUT structure
//          pPropertyEntriesOut[0].u.bVal.size = Size of TSMF_SUPPORT_DATA_OUT structure.
//                This will vary based on the size of the variable data in the structure.
//
//  STRUCTURE DEFINITIONS
//
//          typedef struct tagTSMF_SUPPORT_DATA_IN {
//              GUID        guidMfSession;
//              //number of nodes in input data.
//              UINT32      numEntries;   
//              //
//              // variable length data. The data is of type TSMF_SUPPORT_NODEDATA_IN
//              // for each node corresponding to numEntries
//              //
//          } TSMF_SUPPORT_DATA_IN, *PTSMF_SUPPORT_DATA_IN;
//           
//          typedef struct tagTSMF_SUPPORT_NODEDATA_IN {
//              UINT32      byteCount;
//              INT64       nodeId;
//              // Number of media type entries for this node
//              UINT32      numMediaTypes;    
//              //
//              // variable length media format data. It should be read as a set of TS_AM_MEDIA_TYPE structs.
//              // The format itself is of type FORMAT_WaveFormatEx for audio and FORMAT_MFVideoFormat
//              // for video
//              //
//          } TSMF_SUPPORT_NODEDATA_IN, *PTSMF_SUPPORT_NODEDATA_IN;
//           
//           
//          // 
//          // Structures used to format data output from RCM. This is the format expected from protocol extension
//          //
//          typedef struct tagTSMF_SUPPORT_DATA_OUT {
//              GUID        guidMfSession; // must match the MF session guid in input data
//              UINT32      numEntries; // must match the number of entries in input data
//           
//              //
//              // variable length data. The data is of type TSMF_SUPPORT_NODEDATA_OUT
//              // for each entry corresponding to numEntries
//              //
//          } TSMF_SUPPORT_DATA_OUT, *PTSMF_SUPPORT_DATA_OUT;
//           
//          typedef struct tagTSMF_SUPPORT_NODEDATA_OUT {
//              INT64       nodeId;
//              //
//              // Status of 0 means not supported, 1 means supported.  
//              // Other values reserved for future use
//              // If supported, the sink given by clsidNewSink will be used
//              //
//              HRESULT     hrSupportStatus; 
//              CLSID       clsidNewSink;
//              // 0 based index of the media type for which support is being expressed.
//              UINT32      supportedMediaTypeIndex;
//          } TSMF_SUPPORT_NODEDATA_OUT, *PTSMF_SUPPORT_NODEDATA_OUT;
//           
//
//          // The following struct is used to express the media type. The fields in this struct have the same meaning as AM_MEDIA_TYPE
//          // This struct is used to ensure consistency between 32-bit and 64-bit callers
//          //
//          typedef struct tagTS_AM_MEDIA_TYPE {
//              GUID        majortype;
//              GUID        subtype;
//              UINT32    bFixedSizeSamples;
//              UINT32    bTemporalCompression;
//              UINT32    lSampleSize;
//              GUID        formattype;
//              UINT32    cbFormat;
//              // Variable size data appened at the end
//          } TS_AM_MEDIA_TYPE, *PTS_AM_MEDIA_TYPE;
//          
//
EXTERN_C const __declspec(selectany) GUID WTS_QUERY_MF_FORMAT_SUPPORT = /*41869ad0-6332-4dc8-95d5-db749e2f1d94*/
{ 0x41869ad0, 0x6332, 0x4dc8, {0x95, 0xd5, 0xdb, 0x74, 0x9e, 0x2f, 0x1d, 0x94} };

// ************************************************************************

#endif


/* -------------------------------------------------------------------
 * Licensing structures
 * 
 * For more informtion on the licensing structures and sequence
 * please refer to [MS-RDPBCGR] - 
 * http://msdn.microsoft.com/en-us/library/cc241880(PROT.10).aspx
 *
 * -------------------------------------------------------------------*/

///////////////////////////////////////////////////////////////////////////////
//
// Key exchange algorithms
//

#define WTS_KEY_EXCHANGE_ALG_RSA    1
#define WTS_KEY_EXCHANGE_ALG_DH     2

#define WTS_LICENSE_PROTOCOL_VERSION            0x00010000
#define WTS_LICENSE_PREAMBLE_VERSION            0x03
#define WTS_LICENSE_CURRENT_PROTOCOL_VERSION    WTS_LICENSE_PROTOCOL_VERSION | WTS_LICENSE_PREAMBLE_VERSION

//-----------------------------------------------------------------------------
//
// Types of certificate used by the server to authenticate itself to the clients
//
// CERT_TYPE_PROPRIETORY
//      Proprietory format certificate
//
// CERT_TYPE_X509
//      X509 format certificate
//
//-----------------------------------------------------------------------------
typedef enum
{
    WTS_CERT_TYPE_INVALID       = 0,
    WTS_CERT_TYPE_PROPRIETORY   = 1,
    WTS_CERT_TYPE_X509          = 2
} WTS_CERT_TYPE;


//-----------------------------------------------------------------------------
//
// WTS_LICENSE_CAPABILITIES
//
// Data structure used in RequestLicensingCapabilities.
//
// KeyExchangeAlg       - The key exchange algorithm: RSA or Diffie Helman (see defines above)
// ProtocolVer          - The supported licensing protocol. 
//                        Always set it to WTS_LICENSE_CURRENT_PROTOCOL_VERSION.
// fAuthenticateServer  - Whether the client is going to authenticate the server
// CertType             - Indicate the type of certificate that has already been transmitted
//                        to the client.
// cbClientName         - Size of the client name in bytes
// rgbClientName        - Name of the client
//
//-----------------------------------------------------------------------------

#define WTS_LICENSE_CLIENT_NAME_BYTE_LENGTH (WTS_CLIENTNAME_LENGTH + 1) * sizeof( WCHAR )

typedef struct _WTS_LICENSE_CAPABILITIES
{
    DWORD           KeyExchangeAlg;
    DWORD           ProtocolVer;    
    BOOL            fAuthenticateServer;
    WTS_CERT_TYPE   CertType;
    DWORD           cbClientName;
    BYTE            rgbClientName[WTS_LICENSE_CLIENT_NAME_BYTE_LENGTH];

} WTS_LICENSE_CAPABILITIES, *PWTS_LICENSE_CAPABILITIES;


#ifdef __cplusplus
}
#endif

#endif  /* !_INC_WTSDEFS */

