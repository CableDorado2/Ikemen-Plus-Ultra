#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#if !defined(_CERT_POL_ENG_)
#define CERTPOLENGAPI DECLSPEC_IMPORT
#else 
#define CERTPOLENGAPI
#endif

CERTPOLENGAPI
NTSTATUS 
NTAPI
PstGetTrustAnchors(
    __in                            PUNICODE_STRING                             pTargetName,
    __in                            DWORD                                       cCriteria,
    __in_ecount_opt(cCriteria)      PCCERT_SELECT_CRITERIA                      rgpCriteria,
    __deref_out                     PSecPkgContext_IssuerListInfoEx*            ppTrustedIssuers
    );

CERTPOLENGAPI
NTSTATUS 
NTAPI
PstGetCertificates(
    __in                                    PUNICODE_STRING                     pTargetName,
    __in                                    DWORD                               cCriteria,
    __in_ecount_opt(cCriteria)              PCCERT_SELECT_CRITERIA              rgpCriteria,
    __in                                    BOOL                                bIsClient,
    __out                                   PDWORD                              pdwCertChainContextCount,
   __deref_out_ecount(*pdwCertChainContextCount) PCCERT_CHAIN_CONTEXT**         ppCertChainContexts
    );
    

CERTPOLENGAPI
NTSTATUS
NTAPI
PstAcquirePrivateKey(
    __in                                    PCCERT_CONTEXT                      pCert
    );


CERTPOLENGAPI
NTSTATUS 
NTAPI
PstValidate(
    __in_opt                                PUNICODE_STRING                     pTargetName,
    __in                                    BOOL                                bIsClient,
    __in_opt                                CERT_USAGE_MATCH*                   pRequestedIssuancePolicy,
    __in_opt                                HCERTSTORE*                         phAdditionalCertStore,
    __in                                    PCCERT_CONTEXT                      pCert,
    __out_opt                               GUID*                               pProvGUID
   );

CERTPOLENGAPI
NTSTATUS 
NTAPI
PstMapCertificate(
    __in                                    PCCERT_CONTEXT                      pCert,
    __out                                   LSA_TOKEN_INFORMATION_TYPE*         pTokenInformationType,
    __deref_out                             PVOID*                              ppTokenInformation
  );

CERTPOLENGAPI
NTSTATUS 
NTAPI
PstGetUserNameForCertificate(
    __in                                    PCCERT_CONTEXT                      pCertContext,
    __out                                   PUNICODE_STRING                     UserName
    );

#ifdef __cplusplus
}
#endif

