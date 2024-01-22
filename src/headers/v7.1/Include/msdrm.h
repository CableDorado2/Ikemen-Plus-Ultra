#pragma once

#ifndef __MSDRM_H_
#define __MSDRM_H_

//-----------------------------------------------------------------------------
//
// 
// File: msdrm.h
//
// Copyright (C) 2001-2004 Microsoft Corporation.  All Rights Reserved.
//
//-----------------------------------------------------------------------------

#include "msdrmdefs.h"

// environment & handle control

DRMEXPORT HRESULT UDAPICALL DRMSetGlobalOptions(
                    IN DRMGLOBALOPTIONS eGlobalOptions,
                    IN LPVOID pvdata,
                    IN DWORD  dwlen);

DRMEXPORT HRESULT UDAPICALL DRMGetClientVersion(
                    OUT DRM_CLIENT_VERSION_INFO   *pDRMClientVersionInfo);

DRMEXPORT HRESULT UDAPICALL DRMInitEnvironment (
                    IN DRMSECURITYPROVIDERTYPE eSecurityProviderType,
                    IN DRMSPECTYPE eSpecification,
                    __in_opt PWSTR wszSecurityProvider,
                    __in_opt PWSTR wszManifestCredentials,
                    __in     PWSTR wszMachineCredentials,
                    OUT DRMENVHANDLE* phEnv,
                    OUT DRMHANDLE* phDefaultLibrary);

DRMEXPORT HRESULT UDAPICALL DRMLoadLibrary (
                    IN DRMENVHANDLE hEnv,
                    IN DRMSPECTYPE eSpecification,
                    __in     PWSTR wszLibraryProvider,
                    __in_opt PWSTR wszCredentials,
                    OUT DRMHANDLE* phLibrary);

DRMEXPORT HRESULT UDAPICALL DRMCreateEnablingPrincipal (
                    IN DRMENVHANDLE hEnv,
                    IN DRMHANDLE hLibrary,
                    __in PWSTR wszObject,
                    IN DRMID* pidPrincipal,
                    __in PWSTR wszCredentials,
                    OUT DRMHANDLE* phEnablingPrincipal);

DRMEXPORT HRESULT UDAPICALL DRMCloseHandle(
                    IN DRMHANDLE handle);

DRMEXPORT HRESULT UDAPICALL DRMCloseEnvironmentHandle(
                    IN DRMENVHANDLE hEnv);

DRMEXPORT HRESULT UDAPICALL DRMDuplicateHandle(
                    IN DRMHANDLE hToCopy,
                    OUT DRMHANDLE* phCopy);

DRMEXPORT HRESULT UDAPICALL DRMDuplicateEnvironmentHandle(
                    IN DRMENVHANDLE hToCopy,
                    OUT DRMENVHANDLE* phCopy);
 
DRMEXPORT HRESULT UDAPICALL DRMRegisterRevocationList (
                    IN DRMENVHANDLE hEnv,
                    __in_opt PWSTR wszRevocationList);

DRMEXPORT HRESULT UDAPICALL DRMCheckSecurity(
                    IN DRMENVHANDLE hEnv,
                    IN UINT cLevel);

DRMEXPORT HRESULT UDAPICALL DRMRegisterContent(
                    IN BOOL fRegister);

// cryptographic functions 

DRMEXPORT HRESULT UDAPICALL DRMEncrypt (
                    IN DRMHANDLE hCryptoProvider,
                    IN UINT iPosition,
                    IN UINT cNumInBytes,
                    IN BYTE* pbInData,
                    IN OUT UINT* pcNumOutBytes,
                    OUT BYTE* pbOutData);

DRMEXPORT HRESULT UDAPICALL DRMDecrypt (
                    IN DRMHANDLE hCryptoProvider,
                    IN UINT iPosition,
                    IN UINT cNumInBytes,
                    IN BYTE* pbInData,
                    IN OUT UINT* pcNumOutBytes,
                    OUT BYTE* pbOutData);

// license binding and enabling bits

DRMEXPORT HRESULT UDAPICALL DRMCreateBoundLicense (
                    IN DRMENVHANDLE hEnv,
                    IN DRMBOUNDLICENSEPARAMS* pParams,
                    __in PWSTR wszLicenseChain,
                    OUT DRMHANDLE* phBoundLicense,
                    OUT DRMHANDLE* phErrorLog);

DRMEXPORT HRESULT UDAPICALL DRMCreateEnablingBitsDecryptor (
                    IN DRMHANDLE hBoundLicense,
                    __in_opt PWSTR wszRight,
                    IN DRMHANDLE hAuxLib,
                    __in_opt PWSTR wszAuxPlug,
                    OUT DRMHANDLE* phDecryptor);

DRMEXPORT HRESULT UDAPICALL DRMCreateEnablingBitsEncryptor (
                    IN DRMHANDLE hBoundLicense,
                    __in_opt PWSTR wszRight,
                    IN DRMHANDLE hAuxLib,
                    __in_opt PWSTR wszAuxPlug,
                    OUT DRMHANDLE* phEncryptor);

// inter-environment security attestation

DRMEXPORT HRESULT UDAPICALL DRMAttest (
                    IN DRMHANDLE hEnablingPrincipal,
                    __in PWSTR wszData,
                    IN DRMATTESTTYPE eType,
                    __inout UINT* pcAttestedBlob,
                    __out_ecount(*pcAttestedBlob) PWSTR wszAttestedBlob);


// miscellaneous calls and helper functions

DRMEXPORT HRESULT UDAPICALL DRMGetTime (
                    IN DRMENVHANDLE hEnv,
                    IN DRMTIMETYPE eTimerIdType,
                    OUT SYSTEMTIME* poTimeObject);

DRMEXPORT HRESULT UDAPICALL DRMGetInfo(
                    __in DRMHANDLE handle,
                    __in PWSTR wszAttribute,
                    __in DRMENCODINGTYPE* peEncoding,
                    __inout UINT* pcBuffer,
                    OUT BYTE* pbBuffer);

DRMEXPORT HRESULT UDAPICALL DRMGetEnvironmentInfo(
                    IN DRMENVHANDLE handle,
                    __in_opt PWSTR wszAttribute,
                    OUT DRMENCODINGTYPE* peEncoding,
                    IN OUT UINT* pcBuffer,
                    OUT BYTE* pbBuffer);

DRMEXPORT HRESULT UDAPICALL DRMGetProcAddress(
                    IN DRMHANDLE hLibrary,
                    __in PWSTR wszProcName,
                    OUT FARPROC* ppfnProcAddress);

// support for querying bound licenses

DRMEXPORT HRESULT UDAPICALL DRMGetBoundLicenseObjectCount(
                    IN DRMHANDLE hQueryRoot,
                    __in PWSTR wszSubObjectType,
                    OUT UINT* pcSubObjects);

DRMEXPORT HRESULT UDAPICALL DRMGetBoundLicenseObject(
                    IN DRMHANDLE hQueryRoot,
                    __in PWSTR wszSubObjectType,
                    IN UINT iWhich,
                    OUT DRMHANDLE* phSubObject);

DRMEXPORT HRESULT UDAPICALL DRMGetBoundLicenseAttributeCount(
                    IN DRMHANDLE hQueryRoot,
                    __in PWSTR wszAttribute,
                    OUT UINT* pcAttributes);

DRMEXPORT HRESULT UDAPICALL DRMGetBoundLicenseAttribute(
                    IN DRMHANDLE hQueryRoot,
                    __in PWSTR wszAttribute,
                    IN UINT iWhich,
                    OUT DRMENCODINGTYPE* peEncoding,
                    IN OUT UINT* pcBuffer,
                    OUT BYTE* pbBuffer);



DRMEXPORT HRESULT UDAPICALL DRMCreateClientSession(
                        IN  DRMCALLBACK  pfnCallback,            // Callback 
                        IN  UINT         uCallbackVersion,        // Version of the callback
                        __in     PWSTR        wszGroupIDProviderType, // one of WINDOWSAUTH/PASSPORT
                        __in_opt PWSTR        wszGroupID,             // Group ID
                        OUT DRMHSESSION* phClient );


DRMEXPORT HRESULT UDAPICALL DRMIsActivated(
                        IN  DRMHSESSION       hClient,      // Client session
                        IN  UINT              uFlags,       // One of DRM_ACTIVATE_MACHINE/GROUPIDENTITY
                        IN  DRM_ACTSERV_INFO* pActServInfo);// Optional activation server info


DRMEXPORT HRESULT UDAPICALL DRMActivate(
                        IN DRMHSESSION    hClient,            // Client session
                        IN UINT           uFlags,             // One/both: DRM_ACTIVATE_MACHINE/GROUPIDENTITY
                        IN UINT           uLangID,            // Language ID
                        IN DRM_ACTSERV_INFO* pActServInfo,  // Optional activation server info
                        IN VOID*          pvContext,          // Context used for callback
                        IN HWND           hParentWnd);        // Parent window Handle


DRMEXPORT HRESULT UDAPICALL DRMGetServiceLocation(
                        IN    DRMHSESSION    hClient,            // Client session
                        IN    UINT           uServiceType,       //One of DRM_SERVICE_TYPE
                        IN    UINT           uServiceLocation,   //One of DRM_SERVICE_LOCATION
                        __in_opt    PWSTR          wszIssuanceLicense, //Optional
                        IN OUT UINT*         puServiceURLLength,
                        __out_ecount_opt(*puServiceURLLength)   PWSTR          wszServiceURL);



//    LicenseStorage
DRMEXPORT HRESULT UDAPICALL DRMCreateLicenseStorageSession(
                        IN  DRMENVHANDLE hEnv,               // Environment Handle ( o/p of DRMInitEnvironment)
                        IN  DRMHANDLE    hDefaultLibrary,    // Default Library Handle (o/p of DRMInitEnvironment)
                        IN  DRMHSESSION  hClient,            // Client session
                        IN  UINT         uFlags,             // Reserved
                        __in  PWSTR        wszIssuanceLicense, // IssuanceLicense
                        OUT DRMHSESSION* phLicenseStorage);

DRMEXPORT HRESULT UDAPICALL DRMAddLicense(
                        IN DRMHSESSION  hLicenseStorage,    // LicenseStorage session
                        IN UINT         uFlags,             // One of DRM_ADD_LICENSE_FLAGS
                        __in PWSTR        wszLicense);        // License to add to the inmemory license store

DRMEXPORT HRESULT UDAPICALL DRMAcquireAdvisories(
                        IN    DRMHSESSION   hLicenseStorage,
                        __in    PWSTR         wszLicense,
                        __in_opt    PWSTR         wszURL,//Optional
                        IN    VOID*         pvContext);



DRMEXPORT HRESULT UDAPICALL DRMEnumerateLicense(
                        IN    DRMHSESSION  hSession,                   // Client/License Storage session
                        IN    UINT         uFlags,                     // One of DRM_ENUMERATE_LICENSE_FLAGS
                        IN    UINT         uIndex,                     // Cert index
                        IN OUT BOOL*       pfSharedFlag,               // Shared Flag
                        IN OUT UINT*       puCertificateDataLen,       // String Length of wszCertificateData buffer 
                        __out_ecount_opt(*puCertificateDataLen)   PWSTR        wszCertificateData );       // CertChain 

DRMEXPORT HRESULT UDAPICALL DRMAcquireLicense(
                        IN    DRMHSESSION  hSession,           //Client/License Storage session
                        IN    UINT         uFlags,             //DRM_ACQUIRE_LICENSE_FLAGS
                        __in_opt    PWSTR        wszGroupIdentityCredential,// Optional
                        __in_opt    PWSTR        wszRequestedRights, //RESERVED, must be NULL.
                        __in_opt    PWSTR        wszCustomData,      //Custom data that goes with the request
                        __in_opt    PWSTR        wszURL,             //
                        IN    VOID*        pvContext );

DRMEXPORT HRESULT UDAPICALL DRMDeleteLicense( 
                        IN DRMHSESSION  hSession,           //Client/License Storage session
                        __in PWSTR        wszLicenseId);


DRMEXPORT HRESULT UDAPICALL DRMCloseSession(
                        IN DRMHSESSION hSession);

DRMEXPORT HRESULT UDAPICALL DRMDuplicateSession(
                        IN  DRMHSESSION hSessionIn, 
                        OUT DRMHSESSION *phSessionOut);

DRMEXPORT HRESULT UDAPICALL DRMGetSecurityProvider(
                        IN    UINT      uFlags,
                        IN OUT UINT*    puTypeLen,
                        __out_ecount_opt(*puTypeLen)   PWSTR     wszType,
                        IN OUT UINT*    puPathLen,
                        __out_ecount_opt(*puPathLen)   PWSTR     wszPath);

DRMEXPORT HRESULT UDAPICALL DRMEncode(
                        __in PWSTR    wszAlgID,
                        IN UINT     uDataLen,
                        IN BYTE*    pbDecodedData,
                        IN OUT UINT* puEncodedStringLen,
                        __out_ecount_opt(*puEncodedStringLen) PWSTR   wszEncodedString);

DRMEXPORT HRESULT UDAPICALL DRMDecode(
                        __in PWSTR    wszAlgID,
                        __in PWSTR    wszEncodedString,
                        IN OUT UINT* puDecodedDataLen,
                        OUT BYTE*   pbDecodedData);

DRMEXPORT HRESULT UDAPICALL DRMConstructCertificateChain(
                        IN      UINT cCertificates,
                        __in_ecount(cCertificates)      PWSTR* rgwszCertificates,
                        IN OUT   UINT* pcChain,
                        __out_ecount_opt(*pcChain)     PWSTR wszChain);


// support for unbound license querying

DRMEXPORT HRESULT UDAPICALL DRMParseUnboundLicense(
                        __in      PWSTR wszCertificate,
                        OUT     DRMQUERYHANDLE* phQueryRoot);

DRMEXPORT HRESULT UDAPICALL DRMCloseQueryHandle(
                        IN      DRMQUERYHANDLE hQuery);

DRMEXPORT HRESULT UDAPICALL DRMGetUnboundLicenseObjectCount(
                        IN      DRMQUERYHANDLE hQueryRoot,
                        __in      PWSTR wszSubObjectType,
                        OUT     UINT* pcSubObjects);

DRMEXPORT HRESULT UDAPICALL DRMGetUnboundLicenseObject(
                        IN      DRMQUERYHANDLE hQueryRoot,
                        __in      PWSTR wszSubObjectType,
                        IN      UINT iIndex,
                        OUT     DRMQUERYHANDLE* phSubQuery);

DRMEXPORT HRESULT UDAPICALL DRMGetUnboundLicenseAttributeCount(
                        IN      DRMQUERYHANDLE hQueryRoot,
                        __in      PWSTR wszAttributeType,
                        OUT     UINT* pcAttributes);

DRMEXPORT HRESULT UDAPICALL DRMGetUnboundLicenseAttribute(
                        IN      DRMQUERYHANDLE hQueryRoot,
                        __in      PWSTR wszAttributeType,
                        IN      UINT iWhich,
                        OUT     DRMENCODINGTYPE* peEncoding,
                        IN OUT   UINT* pcBuffer,
                        OUT     BYTE* pbBuffer);

DRMEXPORT HRESULT UDAPICALL DRMGetCertificateChainCount(
                        __in      PWSTR wszChain,
                        OUT     UINT* pcCertCount);

DRMEXPORT HRESULT UDAPICALL DRMDeconstructCertificateChain(
                        __in      PWSTR wszChain,
                        IN      UINT iWhich,
                        IN OUT   UINT* pcCert,
                        __out_ecount_opt(*pcCert)     PWSTR wszCert);

DRMEXPORT HRESULT UDAPICALL DRMVerify (
                    __in_opt PWSTR wszData,
                    UINT* pcAttestedData,
                    __out_ecount_opt(*pcAttestedData) PWSTR wszAttestedData,
                    DRMATTESTTYPE* peType,
                    UINT* pcPrincipal,
                    __out_ecount_opt(*pcPrincipal) PWSTR wszPrincipal,
                    UINT* pcManifest,
                    __out_ecount_opt(*pcManifest) PWSTR wszManifest);




DRMEXPORT HRESULT UDAPICALL DRMCreateUser(
                                __in_opt  PWSTR           wszUserName,
                                __in_opt  PWSTR           wszUserId,
                                __in_opt  PWSTR           wszUserIdType,
                                OUT DRMPUBHANDLE*   phUser);


DRMEXPORT HRESULT UDAPICALL DRMCreateRight(
                                __in PWSTR           wszRightName,
                                IN  SYSTEMTIME*     pstFrom,
                                IN  SYSTEMTIME*     pstUntil,
                                IN  UINT            cExtendedInfo,
                                __in_ecount_opt(cExtendedInfo) PWSTR*          pwszExtendedInfoName,
                                __in_ecount_opt(cExtendedInfo) PWSTR*          pwszExtendedInfoValue,
                                OUT DRMPUBHANDLE    *phRight);

DRMEXPORT HRESULT UDAPICALL DRMCreateIssuanceLicense(
                                IN  SYSTEMTIME*     pstTimeFrom,
                                IN  SYSTEMTIME*     pstTimeUntil,
                                __in_opt  PWSTR           wszReferralInfoName,
                                __in_opt  PWSTR           wszReferralInfoURL,
                                IN  DRMPUBHANDLE    hOwner,//Use created using DRMCreateUser.

                                __in_opt  PWSTR           wszIssuanceLicense,//Issuance License Template or Signed Issuance License
                                IN  DRMHANDLE       hBoundLicense,
                                OUT DRMPUBHANDLE*   phIssuanceLicense);

    
DRMEXPORT HRESULT UDAPICALL DRMAddRightWithUser(
                                IN  DRMPUBHANDLE     hIssuanceLicense,
                                IN  DRMPUBHANDLE     hRight,
                                IN  DRMPUBHANDLE     hUser);

DRMEXPORT HRESULT UDAPICALL DRMClearAllRights(
                                IN  DRMPUBHANDLE     hIssuanceLicense);


DRMEXPORT HRESULT UDAPICALL DRMSetMetaData(
                                IN  DRMPUBHANDLE    hIssuanceLicense,
                                __in  PWSTR           wszContentId,
                                __in  PWSTR           wszContentIdType,
                                __in_opt  PWSTR           wszSKUId,
                                __in_opt  PWSTR           wszSKUIdType,
                                __in_opt  PWSTR           wszContentType,
                                __in_opt  PWSTR           wszContentName);

DRMEXPORT HRESULT UDAPICALL DRMSetUsagePolicy(
                                IN  DRMPUBHANDLE    hIssuanceLicense,
                                IN  DRM_USAGEPOLICY_TYPE eUsagePolicyType,
                                IN  BOOL            fDelete,
                                IN  BOOL            fExclusion,

                                __in_opt  PWSTR           wszName,//Set usage policy by Name
                                __in_opt  PWSTR           wszMinVersion,
                                __in_opt  PWSTR           wszMaxVersion,

                                __in_opt  PWSTR           wszPublicKey,//Set usage policy by public key

                                __in_opt  PWSTR           wszDigestAlgorithm,//Set usage policy by digest
                                IN  BYTE*           pbDigest,
                                IN  UINT            cbDigest);

DRMEXPORT HRESULT UDAPICALL DRMSetRevocationPoint(
                                IN  DRMPUBHANDLE    hIssuanceLicense,
                                IN  BOOL            fDelete,
                                __in  PWSTR           wszId,
                                __in  PWSTR           wszIdType,
                                __in  PWSTR           wszURL,
                                IN  SYSTEMTIME*     pstFrequency,
                                __in_opt  PWSTR           wszName,//Optional
                                __in_opt  PWSTR           wszPublicKey);

DRMEXPORT HRESULT UDAPICALL DRMSetApplicationSpecificData(
                                IN  DRMPUBHANDLE    hIssuanceLicense,
                                IN  BOOL            fDelete,
                                __in_opt  PWSTR           wszName,
                                __in_opt  PWSTR           wszValue);

DRMEXPORT HRESULT UDAPICALL DRMSetNameAndDescription(
                                IN   DRMPUBHANDLE    hIssuanceLicense,
                                IN   BOOL            fDelete,
                                IN   UINT            lcid,
                                __in_opt   PWSTR           wszName,
                                __in_opt   PWSTR           wszDescription);

DRMEXPORT HRESULT UDAPICALL DRMSetIntervalTime(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN      UINT            cDays);


DRMEXPORT HRESULT UDAPICALL DRMGetIssuanceLicenseTemplate(
                                IN      DRMPUBHANDLE hIssuanceLicense,
                                IN OUT   UINT*       puIssuanceLicenseTemplateLength,
                                __out_ecount_opt(*puIssuanceLicenseTemplateLength)     PWSTR        wszIssuanceLicenseTemplate);


DRMEXPORT HRESULT UDAPICALL DRMGetSignedIssuanceLicense(
                                IN      DRMENVHANDLE hEnv,//Optional.Mandatory for DRM_SIGN_OFFLINE
                                IN      DRMPUBHANDLE hIssuanceLicense,
                                IN      UINT         uFlags,//DRM_SIGN_ONLINE/DRM_SIGN_OFFLINE/DRM_SIGN_CANCEL
                                
                                IN      BYTE*        pbSymKey,
                                IN      UINT         cbSymKey,
                                __in_opt      PWSTR        wszSymKeyType,
                                
                                __in_opt      PWSTR        wszClientLicensorCertificate,//Should be NULL for DRM_SIGN_ONLINE , not NULL otherwise
                                IN      DRMCALLBACK  pfnCallback,
                                __in_opt      PWSTR        wszURL,//Mandatory if uFlags is DRM_SIGN_ONLINE

                                IN      VOID*        pvContext);//Optional

DRMEXPORT HRESULT UDAPICALL DRMGetSignedIssuanceLicenseEx(
                                DRMENVHANDLE                hEnv,
                                DRMPUBHANDLE                hIssuanceLicense,
                                UINT                        uFlags,
    __in_bcount_opt(cbSymKey)   BYTE*                       pbSymKey,
                                UINT                        cbSymKey,
            __in_opt            PWSTR                       wszSymKeyType,                                
            __in_opt            PVOID                       pvReserved,                                
            __in                DRMHANDLE                   hEnablingPrincipal,
            __in                DRMHANDLE                   hBoundLicenseCLC,
            __in                DRMCALLBACK                 pfnCallback,
            __in                PVOID                       pvContext);

DRMEXPORT HRESULT UDAPICALL DRMClosePubHandle(
                                IN      DRMPUBHANDLE hPub);

DRMEXPORT HRESULT UDAPICALL DRMDuplicatePubHandle(
                                IN      DRMPUBHANDLE  hPubIn,
                                OUT     DRMPUBHANDLE* phPubOut);


DRMEXPORT HRESULT UDAPICALL DRMGetUserInfo(  
                                 IN     DRMPUBHANDLE    hUser,
                                 IN OUT UINT*           puUserNameLength,
                                 __out_ecount_opt(*puUserNameLength) PWSTR           wszUserName,
                                 IN OUT UINT*           puUserIdLength,
                                 __out_ecount_opt(*puUserIdLength) PWSTR           wszUserId,
                                 IN OUT UINT*           puUserIdTypeLength,
                                 __out_ecount_opt(*puUserIdTypeLength) PWSTR           wszUserIdType);

DRMEXPORT HRESULT UDAPICALL DRMGetRightInfo(  
                                 IN    DRMPUBHANDLE     hRight,
                                 IN OUT UINT*           puRightNameLength,
                                 __out_ecount_opt(*puRightNameLength)   PWSTR            wszRightName,
                                 OUT   SYSTEMTIME*      pstFrom,
                                 OUT   SYSTEMTIME*      pstUntil);

DRMEXPORT HRESULT UDAPICALL DRMGetRightExtendedInfo(  
                                 IN     DRMPUBHANDLE    hRight,
                                 IN     UINT            uIndex,
                                 IN OUT  UINT*          puExtendedInfoNameLength,
                                 __out_ecount_opt(*puExtendedInfoNameLength)    PWSTR           wszExtendedInfoName,
                                 IN OUT  UINT*          puExtendedInfoValueLength,
                                 __out_ecount_opt(*puExtendedInfoValueLength)    PWSTR           wszExtendedInfoValue);

DRMEXPORT HRESULT UDAPICALL DRMGetUsers(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN      UINT            uIndex,
                                OUT     DRMPUBHANDLE*   phUser);

DRMEXPORT HRESULT UDAPICALL DRMGetUserRights(  
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN      DRMPUBHANDLE    hUser,
                                IN      UINT            uIndex,
                                OUT     DRMPUBHANDLE*   phRight);

DRMEXPORT HRESULT UDAPICALL DRMGetMetaData(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN OUT  UINT*           puContentIdLength,
                                __out_ecount_opt(*puContentIdLength)      PWSTR           wszContentId,
                                IN OUT  UINT*           puContentIdTypeLength,
                                __out_ecount_opt(*puContentIdTypeLength)  PWSTR           wszContentIdType,
                                IN OUT  UINT*           puSKUIdLength,
                                __out_ecount_opt(*puSKUIdLength)          PWSTR           wszSKUId,
                                IN OUT  UINT*           puSKUIdTypeLength,
                                __out_ecount_opt(*puSKUIdTypeLength)      PWSTR           wszSKUIdType,
                                IN OUT  UINT*           puContentTypeLength,
                                __out_ecount_opt(*puContentTypeLength)    PWSTR           wszContentType,
                                IN OUT  UINT*           puContentNameLength,
                                __out_ecount_opt(*puContentNameLength)    PWSTR           wszContentName);

DRMEXPORT HRESULT UDAPICALL DRMGetApplicationSpecificData(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN      UINT            uIndex,
                                IN OUT   UINT*          puNameLength,
                                __out_ecount_opt(*puNameLength)     PWSTR   wszName,
                                IN OUT   UINT*          puValueLength,
                                __out_ecount_opt(*puValueLength)    PWSTR   wszValue);



DRMEXPORT HRESULT UDAPICALL DRMGetIssuanceLicenseInfo(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                OUT     SYSTEMTIME*     pstTimeFrom,
                                OUT     SYSTEMTIME*     pstTimeUntil,
                                IN      UINT            uFlags,
                                IN OUT  UINT*           puDistributionPointNameLength,
                                __out_ecount_opt(*puDistributionPointNameLength)    PWSTR   wszDistributionPointName,
                                IN OUT  UINT*           puDistributionPointURLLength,
                                __out_ecount_opt(*puDistributionPointURLLength)     PWSTR   wszDistributionPointURL,
                                OUT     DRMPUBHANDLE*   phOwner,
                                OUT     BOOL*           pfOfficial);


DRMEXPORT HRESULT UDAPICALL DRMGetRevocationPoint(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN OUT  UINT*           puIdLength,
                                __out_ecount_opt(*puIdLength)      PWSTR      wszId,
                                IN OUT  UINT*           puIdTypeLength,
                                __out_ecount_opt(*puIdTypeLength)  PWSTR      wszIdType,
                                IN OUT  UINT*           puURLLength,
                                __out_ecount_opt(*puURLLength)     PWSTR      wszRL,
                                OUT     SYSTEMTIME*     pstFrequency,
                                IN OUT  UINT*           puNameLength,
                                __out_ecount_opt(*puNameLength)    PWSTR      wszName,
                                IN OUT  UINT*           puPublicKeyLength,
                                __out_ecount_opt(*puPublicKeyLength) PWSTR    wszPublicKey);

DRMEXPORT HRESULT UDAPICALL DRMGetUsagePolicy(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN      UINT            uIndex,
                                OUT     DRM_USAGEPOLICY_TYPE* peUsagePolicyType,
                                OUT     BOOL*           pfExclusion,
                                IN OUT  UINT*           puNameLength,
                                __out_ecount_opt(*puNameLength)       PWSTR           wszName,
                                IN OUT  UINT*           puMinVersionLength,
                                __out_ecount_opt(*puMinVersionLength) PWSTR           wszMinVersion,
                                IN OUT  UINT*           puMaxVersionLength,
                                __out_ecount_opt(*puMaxVersionLength) PWSTR           wszMaxVersion,
                                IN OUT  UINT*           puPublicKeyLength,
                                __out_ecount_opt(*puPublicKeyLength)  PWSTR           wszPublicKey,
                                IN OUT  UINT*           puDigestAlgorithmLength,
                                __out_ecount_opt(*puDigestAlgorithmLength)  PWSTR     wszDigestAlgorithm,
                                IN OUT  UINT*           pcbDigest,
                                OUT     BYTE*           pbDigest);

DRMEXPORT HRESULT UDAPICALL DRMGetNameAndDescription(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN      UINT            uIndex,
                                OUT     UINT*           pulcid,
                                IN OUT   UINT*          puNameLength,
                                __out_ecount_opt(*puNameLength)     PWSTR           wszName,
                                IN OUT   UINT*          puDescriptionLength,
                                __out_ecount_opt(*puDescriptionLength)     PWSTR           wszDescription);

DRMEXPORT HRESULT UDAPICALL DRMGetOwnerLicense(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                IN OUT  UINT*           puOwnerLicenseLength,
                                __out_ecount_opt(*puOwnerLicenseLength)     PWSTR           wszOwnerLicense);

DRMEXPORT HRESULT UDAPICALL DRMGetIntervalTime(
                                IN      DRMPUBHANDLE    hIssuanceLicense,
                                OUT     UINT*           pcDays);


DRMEXPORT HRESULT UDAPICALL DRMRepair();

DRMEXPORT HRESULT UDAPICALL DRMRegisterProtectedWindow(
								IN		DRMENVHANDLE hEnv,
								IN		HWND hwnd);

DRMEXPORT HRESULT UDAPICALL DRMIsWindowProtected(
								IN		HWND	hwnd,
								OUT		BOOL*	pfProtected);

DRMEXPORT HRESULT UDAPICALL DRMAcquireIssuanceLicenseTemplate(
								IN		DRMHSESSION	hClient,
								IN		UINT uFlags,
								IN		VOID* pvReserved,
								IN		UINT cTemplates,
								__in_ecount_opt(cTemplates) PWSTR* pwszTemplateIds,
								__in PWSTR wszUrl,
								IN		VOID* pvContext);


#endif // #ifndef __MSDRM_H_

