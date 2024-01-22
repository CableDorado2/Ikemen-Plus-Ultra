/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    ElsCore.h

Abstract:

    This file contains macros/typedef/function prototypes that are common for ELS.

--*/

#ifndef __ELS_CORE__
#define __ELS_CORE__


#ifdef __cplusplus
extern "C" {
#endif


struct _MAPPING_PROPERTY_BAG;

typedef void (CALLBACK* PFN_MAPPINGCALLBACKPROC)(struct _MAPPING_PROPERTY_BAG *pBag, LPVOID data, DWORD dwDataSize, HRESULT Result);

//
// Service types constants used in MAPPING_ENUM_OPTIONS (ServiceType field)
//

#define ALL_SERVICE_TYPES           0
#define HIGHLEVEL_SERVICE_TYPES     1
#define LOWLEVEL_SERVICE_TYPES      2

//
// Online service constants used in MAPPING_ENUM_OPTIONS (OnlineService field)
//
#define ALL_SERVICES                0
#define ONLINE_SERVICES             1
#define OFFLINE_SERVICES            2

//
// Public ELS structures
//

typedef struct _MAPPING_SERVICE_INFO
{
    size_t      Size;
    LPWSTR      pszCopyright;
    WORD        wMajorVersion;
    WORD        wMinorVersion;
    WORD        wBuildVersion;
    WORD        wStepVersion;
    DWORD       dwInputContentTypesCount;
    LPWSTR      *prgInputContentTypes;
    DWORD       dwOutputContentTypesCount;
    LPWSTR      *prgOutputContentTypes;
    DWORD       dwInputLanguagesCount;
    LPWSTR      *prgInputLanguages;
    DWORD       dwOutputLanguagesCount;
    LPWSTR      *prgOutputLanguages;
    DWORD       dwInputScriptsCount;
    LPWSTR      *prgInputScripts;
    DWORD       dwOutputScriptsCount;
    LPWSTR      *prgOutputScripts;
    GUID        guid;
    LPWSTR      pszCategory;
    LPWSTR      pszDescription;
    DWORD       dwPrivateDataSize;
    LPVOID      pPrivateData;
    LPVOID      pContext;
    unsigned    IsOneToOneLanguageMapping : 1;
    unsigned    HasSubservices            : 1;
    unsigned    OnlineOnly                : 1;
    unsigned    ServiceType               : 2;
} MAPPING_SERVICE_INFO, *PMAPPING_SERVICE_INFO;


typedef struct _MAPPING_ENUM_OPTIONS
{
    size_t                  Size;
    LPWSTR                  pszCategory;
    LPWSTR                  pszInputLanguage;
    LPWSTR                  pszOutputLanguage;
    LPWSTR                  pszInputScript;
    LPWSTR                  pszOutputScript;
    LPWSTR                  pszInputContentType;
    LPWSTR                  pszOutputContentType;
    GUID                    *pGuid;
    unsigned                OnlineService : 2;
    unsigned                ServiceType   : 2;
} MAPPING_ENUM_OPTIONS, *PMAPPING_ENUM_OPTIONS;


typedef struct _MAPPING_OPTIONS
{
    size_t                  Size;
    LPWSTR                  pszInputLanguage;
    LPWSTR                  pszOutputLanguage;
    LPWSTR                  pszInputScript;
    LPWSTR                  pszOutputScript;
    LPWSTR                  pszInputContentType;
    LPWSTR                  pszOutputContentType;
    LPWSTR                  pszUILanguage;
    PFN_MAPPINGCALLBACKPROC pfnRecognizeCallback;
    LPVOID                  pRecognizeCallerData;
    DWORD                   dwRecognizeCallerDataSize;
    PFN_MAPPINGCALLBACKPROC pfnActionCallback;
    LPVOID                  pActionCallerData;
    DWORD                   dwActionCallerDataSize;
    DWORD                   dwServiceFlag;
    unsigned                GetActionDisplayName : 1;
} MAPPING_OPTIONS, *PMAPPING_OPTIONS;


typedef struct _MAPPING_DATA_RANGE
{
    DWORD    dwStartIndex;
    DWORD    dwEndIndex;
    LPWSTR   pszDescription;
    DWORD    dwDescriptionLength;
    LPVOID   pData;
    DWORD    dwDataSize;
    LPWSTR   pszContentType;
    LPWSTR   *prgActionIds;
    DWORD    dwActionsCount;
    LPWSTR   *prgActionDisplayNames;
} MAPPING_DATA_RANGE, *PMAPPING_DATA_RANGE;


typedef struct _MAPPING_PROPERTY_BAG
{
    size_t               Size;
    PMAPPING_DATA_RANGE  prgResultRanges;
    DWORD                dwRangesCount;
    LPVOID               pServiceData;
    DWORD                dwServiceDataSize;
    LPVOID               pCallerData;
    DWORD                dwCallerDataSize;
    LPVOID               pContext;
} MAPPING_PROPERTY_BAG, *PMAPPING_PROPERTY_BAG;


//
// Public ELS APIs
//

HRESULT
WINAPI
MappingGetServices(
    __in_opt  PMAPPING_ENUM_OPTIONS  pOptions,
    __out     PMAPPING_SERVICE_INFO *prgServices,
    __out     DWORD                 *pdwServicesCount
    );


HRESULT
WINAPI
MappingFreeServices(
    __in PMAPPING_SERVICE_INFO pServiceInfo
    );


HRESULT
WINAPI
MappingRecognizeText(
    __in                  PMAPPING_SERVICE_INFO  pServiceInfo,
    __in_ecount(dwLength) LPCWSTR                pszText,
    __in                  DWORD                  dwLength,
    __in                  DWORD                  dwIndex,
    __in_opt              PMAPPING_OPTIONS       pOptions,
    __inout               PMAPPING_PROPERTY_BAG  pbag
    );


HRESULT
WINAPI
MappingDoAction(
    __inout PMAPPING_PROPERTY_BAG pBag,
    __in    DWORD                 dwRangeIndex,
    __in    LPCWSTR               pszActionId
    );


HRESULT
WINAPI
MappingFreePropertyBag(
    __in PMAPPING_PROPERTY_BAG pBag
    );

#ifdef __cplusplus
};
#endif

#endif // __ELS_CORE__

