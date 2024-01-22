/*++

Copyright (c) 2000 Microsoft Corporation

Module Name:

    authz.h

Abstract:

    This module contains the authorization framework APIs and any public data
    structures needed to call these APIs.

Revision History:

    Created - March 2000

--*/

#ifndef __AUTHZ_H__
#define __AUTHZ_H__

#ifdef __cplusplus
extern "C" {
#endif

#if !defined(_AUTHZ_)
#define AUTHZAPI DECLSPEC_IMPORT
#else 
#define AUTHZAPI
#endif

#include <windows.h>
#include <adtgen.h>

//
// Flags which may be used at the time of client context creation using a sid.
//

#define AUTHZ_SKIP_TOKEN_GROUPS  0x2
#define AUTHZ_REQUIRE_S4U_LOGON  0x4
#define AUTHZ_COMPUTE_PRIVILEGES 0x8
              
DECLARE_HANDLE(AUTHZ_ACCESS_CHECK_RESULTS_HANDLE);
DECLARE_HANDLE(AUTHZ_CLIENT_CONTEXT_HANDLE);
DECLARE_HANDLE(AUTHZ_RESOURCE_MANAGER_HANDLE);
DECLARE_HANDLE(AUTHZ_AUDIT_EVENT_HANDLE);
DECLARE_HANDLE(AUTHZ_AUDIT_EVENT_TYPE_HANDLE);
DECLARE_HANDLE(AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE);

typedef AUTHZ_ACCESS_CHECK_RESULTS_HANDLE    *PAUTHZ_ACCESS_CHECK_RESULTS_HANDLE;
typedef AUTHZ_CLIENT_CONTEXT_HANDLE          *PAUTHZ_CLIENT_CONTEXT_HANDLE;
typedef AUTHZ_RESOURCE_MANAGER_HANDLE        *PAUTHZ_RESOURCE_MANAGER_HANDLE;
typedef AUTHZ_AUDIT_EVENT_HANDLE             *PAUTHZ_AUDIT_EVENT_HANDLE;
typedef AUTHZ_AUDIT_EVENT_TYPE_HANDLE        *PAUTHZ_AUDIT_EVENT_TYPE_HANDLE;
typedef AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE *PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE;

//
// Structure defining the access check request.
//

typedef struct _AUTHZ_ACCESS_REQUEST
{
    ACCESS_MASK DesiredAccess;

    //
    // To replace the principal self sid in the acl.
    //

    PSID PrincipalSelfSid;

    //
    // Object type list represented by an array of (level, guid) pair and the
    // number of elements in the array. This is a post-fix representation of the
    // object tree.
    // These fields should be set to NULL and 0 respectively except when per
    // property access is desired.
    //

    POBJECT_TYPE_LIST ObjectTypeList;
    DWORD ObjectTypeListLength;

    //
    // To support completely business rules based access. This will be passed as
    // input to the callback access check function. Access check algorithm does
    // not interpret these.
    //

    PVOID OptionalArguments;
    
} AUTHZ_ACCESS_REQUEST, *PAUTHZ_ACCESS_REQUEST;

//
// Structure to return the results of the access check call.
//

typedef struct _AUTHZ_ACCESS_REPLY
{
    //
    // The length of the array representing the object type list structure. If
    // no object type is used to represent the object, then the length must be
    // set to 1.
    //
    // Note: This parameter must be filled!
    //

    DWORD ResultListLength;

    //
    // Array of granted access masks. This memory is allocated by the RM. Access
    // check routines just fill in the values.
    //

    PACCESS_MASK GrantedAccessMask;
    
    //
    // Array of SACL evaluation results.  This memory is allocated by the RM, if SACL
    // evaluation results are desired. Access check routines just fill in the values.
    // Sacl evaluation will only be performed if auditing is requested.
    //
    
#define AUTHZ_GENERATE_SUCCESS_AUDIT 0x1
#define AUTHZ_GENERATE_FAILURE_AUDIT 0x2

    PDWORD SaclEvaluationResults OPTIONAL;
    
    //
    // Array of results for each element of the array. This memory is allocated
    // by the RM. Access check routines just fill in the values.
    //

    PDWORD Error;

} AUTHZ_ACCESS_REPLY, *PAUTHZ_ACCESS_REPLY;

//
// Typedefs for callback functions to be provided by the resource manager.
//

//
// Callback access check function takes in
//     AuthzClientContext - a client context
//     pAce - pointer to a callback ace
//     pArgs - Optional arguments that were passed to AuthzAccessCheck thru
//             AuthzAccessRequest->OptionalArguments are passed back here.
//     pbAceApplicable - The resource manager must supply whether the ace should
//         be used in the computation of access evaluation
//
// Returns
//     TRUE if the API succeeded.
//     FALSE on any intermediate errors (like failed memory allocation)
//         In case of failure, the caller must use SetLastError(ErrorValue).
//

typedef BOOL (CALLBACK *PFN_AUTHZ_DYNAMIC_ACCESS_CHECK) (
                  IN AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext,
                  IN PACE_HEADER                 pAce,
                  IN PVOID                       pArgs                OPTIONAL,
                  IN OUT PBOOL                   pbAceApplicable
                  );

//
// Callback compute dynamic groups function takes in
//     AuthzClientContext - a client context
//     pArgs - Optional arguments that supplied to AuthzInitializeClientContext*
//         thru DynamicGroupArgs are passed back here..
//     pSidAttrArray - To allocate and return an array of (sids, attribute)
//         pairs to be added to the normal part of the client context.
//     pSidCount - Number of elements in pSidAttrArray
//     pRestrictedSidAttrArray - To allocate and return an array of (sids, attribute)
//         pairs to be added to the restricted part of the client context.
//     pRestrictedSidCount - Number of elements in pRestrictedSidAttrArray
//
// Note:
//    Memory returned thru both these array will be freed by the callback
//    free function defined by the resource manager.
//
// Returns
//     TRUE if the API succeeded.
//     FALSE on any intermediate errors (like failed memory allocation)
//         In case of failure, the caller must use SetLastError(ErrorValue).
//

typedef BOOL (CALLBACK *PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS) (
                  IN  AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext,
                  IN  PVOID                       Args,
                  OUT PSID_AND_ATTRIBUTES         *pSidAttrArray,
                  OUT PDWORD                      pSidCount,
                  OUT PSID_AND_ATTRIBUTES         *pRestrictedSidAttrArray,
                  OUT PDWORD                      pRestrictedSidCount
                  );

//
// Callback free function takes in
//     pSidAttrArray - To be freed. This has been allocated by the compute
//     dynamic groups function.
//

typedef VOID (CALLBACK *PFN_AUTHZ_FREE_DYNAMIC_GROUPS) (
                  IN PSID_AND_ATTRIBUTES pSidAttrArray
                  );


//
//  BEGIN: *** (Subject) Security attributes ***
//
//  WARNING!!!:
//      These #defines and data structures exactly mirror
//      the TOKEN_XXX definitions in ntseapi.w. Keep them
//      in sync.
//


//
//  Security attribute data types ...
//

#define AUTHZ_SECURITY_ATTRIBUTE_TYPE_INVALID   0x00

#define AUTHZ_SECURITY_ATTRIBUTE_TYPE_INT64     0x01
#define AUTHZ_SECURITY_ATTRIBUTE_TYPE_UINT64    0x02

//
//  Case insensitive attribute value string by default.
//  Unless the flag AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE
//  is set indicating otherwise.
//

#define AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING    0x03

//
//  Fully-qualified binary name.
//

typedef struct _AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE {
    ULONG64 Version;
    PWSTR   pName;
} AUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE, *PAUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE;

#define AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN      0x04

//
//  This is the 'catch all' type. The attribute manipulation
//  code really doesn't care about the actual format of the
//  value. Value subtypes are defined only for this type.
//  Value subtypes permit easy addition of new subtypes
//  without having to change the attribute manipulation
//  (and WOW64 thunking!) code.
//

typedef struct _AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE {
    PVOID   pValue;         //  Pointer is BYTE aligned.
    ULONG   ValueLength;    //  In bytes
} AUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE,
    *PAUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE;

#define AUTHZ_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING  0x10

//
//  Attribute operations that can be specified for a 'set' API:
//


typedef enum {

    //
    //  No-op
    //

    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_NONE = 0,

    //
    //  Delete all existing security attributes and their values in
    //  the NT token and replace it with the specified attributes/values.
    //  If attributes to replace with are not specified, all existing
    //  attributes and values are deleted.
    //
    //  This operation can be specified at most once and must be the
    //  only operation specified.
    //

    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE_ALL,

    //
    //  Add a new attribute or a new value to an existing attribute.
    //  If the value specified for any attribute already exists for
    //  that attribute, the call fails.
    //

    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_ADD,

    //
    //  Delete the specified value(s) of the specified attribute(s).
    //  If the last value is deleted from an attribute, the attribute
    //  itself is removed. If no matching attribute name was found, no
    //  modifications are done and the call fails. If no value is specified
    //  for the attribute, the attribute itself will be deleted.
    //

    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_DELETE,

    //
    //  The value(s) of the specified security attribute(s) completely
    //  replace(s) the existing value(s) of the attribute(s). If the
    //  attribute does not already exist, it is added.  When no value
    //  is specified, the attribute is deleted, if it exists; otherwise,
    //  the operation is simply ignored and no failure is reported.
    //

    AUTHZ_SECURITY_ATTRIBUTE_OPERATION_REPLACE
} AUTHZ_SECURITY_ATTRIBUTE_OPERATION, *PAUTHZ_SECURITY_ATTRIBUTE_OPERATION;


//
//  An individual security attribute.
//

typedef struct _AUTHZ_SECURITY_ATTRIBUTE_V1 {

    //
    //  Name of the attribute.
    //  Case insensitive Windows Unicode string.
    //

    PWSTR   pName;

    //
    //  Data type of attribute.
    //

    USHORT  ValueType;

    //
    //  Pass 0 in a set operation and check for 0 in
    //  a get operation.
    //

    USHORT  Reserved;

//
//  Attribute must not be inherited across process spawns.
//

#define AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE      0x0001


//
//  Attribute value is compared in a case sensitive way. It is valid with string value
//  or composite type containing string value. For other types of value, this flag
//  will be ignored. Currently, it is valid with the two types:
//  AUTHZ_SECURITY_ATTRIBUTE_TYPE_STRING and AUTHZ_SECURITY_ATTRIBUTE_TYPE_FQBN.
//
#define AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE         0x0002

#define AUTHZ_SECURITY_ATTRIBUTE_VALID_FLAGS   (    \
                        AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE |  \
                        AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE     \
                        )

    ULONG   Flags;

    //
    //  Number of values.
    //

    ULONG   ValueCount;

    //
    //  The actual value itself.
    //

    union {
        PLONG64                                         pInt64;
        PULONG64                                        pUint64;
        PWSTR                                           *ppString;
        PAUTHZ_SECURITY_ATTRIBUTE_FQBN_VALUE            pFqbn;
        PAUTHZ_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE    pOctetString;
    } Values;
} AUTHZ_SECURITY_ATTRIBUTE_V1, *PAUTHZ_SECURITY_ATTRIBUTE_V1;


//
//  Set of security attributes.
//

typedef struct _AUTHZ_SECURITY_ATTRIBUTES_INFORMATION {

    //
    //  Versioning. The interpretation of the pointers in the
    //  Attribute field below is dependent on the version field.
    //
    //  Get operations return the version while the set operation
    //  MUST specify the version of the data structure passed in.
    //

#define AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1    1

#define AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION       \
    AUTHZ_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1

    //
    //  MUST BE first.
    //

    USHORT  Version;

    //
    //  Pass 0 in set operations and ignore on get operations.
    //

    USHORT  Reserved;

    ULONG   AttributeCount;
    union {
        PAUTHZ_SECURITY_ATTRIBUTE_V1    pAttributeV1;
    } Attribute;
} AUTHZ_SECURITY_ATTRIBUTES_INFORMATION,
    *PAUTHZ_SECURITY_ATTRIBUTES_INFORMATION;




//
// Valid flags for AuthzAccessCheck
//

#define AUTHZ_ACCESS_CHECK_NO_DEEP_COPY_SD 0x00000001

AUTHZAPI
BOOL
WINAPI
AuthzAccessCheck(
    IN     DWORD                              Flags,
    IN     AUTHZ_CLIENT_CONTEXT_HANDLE        hAuthzClientContext,
    IN     PAUTHZ_ACCESS_REQUEST              pRequest,
    IN     AUTHZ_AUDIT_EVENT_HANDLE           hAuditEvent                      OPTIONAL,
    IN     PSECURITY_DESCRIPTOR               pSecurityDescriptor,
    IN     PSECURITY_DESCRIPTOR               *OptionalSecurityDescriptorArray OPTIONAL,
    IN     DWORD                              OptionalSecurityDescriptorCount,
    IN OUT PAUTHZ_ACCESS_REPLY                pReply,
    OUT    PAUTHZ_ACCESS_CHECK_RESULTS_HANDLE phAccessCheckResults             OPTIONAL
    );

AUTHZAPI
BOOL
WINAPI
AuthzCachedAccessCheck(
    IN     DWORD                             Flags,
    IN     AUTHZ_ACCESS_CHECK_RESULTS_HANDLE hAccessCheckResults,
    IN     PAUTHZ_ACCESS_REQUEST             pRequest,
    IN     AUTHZ_AUDIT_EVENT_HANDLE          hAuditEvent          OPTIONAL,
    IN OUT PAUTHZ_ACCESS_REPLY               pReply
    );

AUTHZAPI
BOOL
WINAPI
AuthzOpenObjectAudit(
    IN DWORD                       Flags,
    IN AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext,
    IN PAUTHZ_ACCESS_REQUEST       pRequest,
    IN AUTHZ_AUDIT_EVENT_HANDLE    hAuditEvent,
    IN PSECURITY_DESCRIPTOR        pSecurityDescriptor,
    IN PSECURITY_DESCRIPTOR        *OptionalSecurityDescriptorArray OPTIONAL,
    IN DWORD                       OptionalSecurityDescriptorCount,
    IN PAUTHZ_ACCESS_REPLY         pReply
    );

AUTHZAPI
BOOL
WINAPI
AuthzFreeHandle(
    IN OUT AUTHZ_ACCESS_CHECK_RESULTS_HANDLE hAccessCheckResults
    );

//
// Flags for AuthzInitializeResourceManager
//

#define AUTHZ_RM_FLAG_NO_AUDIT 0x1
#define AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION 0x2
#define AUTHZ_VALID_RM_INIT_FLAGS (AUTHZ_RM_FLAG_NO_AUDIT | AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION)

AUTHZAPI
BOOL
WINAPI
AuthzInitializeResourceManager(
    IN DWORD                            Flags,
    IN PFN_AUTHZ_DYNAMIC_ACCESS_CHECK   pfnDynamicAccessCheck   OPTIONAL,
    IN PFN_AUTHZ_COMPUTE_DYNAMIC_GROUPS pfnComputeDynamicGroups OPTIONAL,
    IN PFN_AUTHZ_FREE_DYNAMIC_GROUPS    pfnFreeDynamicGroups    OPTIONAL,
    IN PCWSTR                           szResourceManagerName,
    OUT PAUTHZ_RESOURCE_MANAGER_HANDLE  phAuthzResourceManager
    );

AUTHZAPI
BOOL
WINAPI
AuthzFreeResourceManager(
    IN AUTHZ_RESOURCE_MANAGER_HANDLE hAuthzResourceManager
    );

AUTHZAPI
BOOL
WINAPI
AuthzInitializeContextFromToken(
    IN  DWORD                         Flags,
    IN  HANDLE                        TokenHandle,
    IN  AUTHZ_RESOURCE_MANAGER_HANDLE hAuthzResourceManager,
    IN  PLARGE_INTEGER                pExpirationTime        OPTIONAL,
    IN  LUID                          Identifier,
    IN  PVOID                         DynamicGroupArgs       OPTIONAL,
    OUT PAUTHZ_CLIENT_CONTEXT_HANDLE  phAuthzClientContext
    );

AUTHZAPI
BOOL
WINAPI
AuthzInitializeContextFromSid(
    IN  DWORD                         Flags,
    IN  PSID                          UserSid,
    IN  AUTHZ_RESOURCE_MANAGER_HANDLE hAuthzResourceManager,
    IN  PLARGE_INTEGER                pExpirationTime        OPTIONAL,
    IN  LUID                          Identifier,
    IN  PVOID                         DynamicGroupArgs       OPTIONAL,
    OUT PAUTHZ_CLIENT_CONTEXT_HANDLE  phAuthzClientContext
    );

AUTHZAPI
BOOL
WINAPI
AuthzInitializeContextFromAuthzContext(
    IN  DWORD                        Flags,
    IN  AUTHZ_CLIENT_CONTEXT_HANDLE  hAuthzClientContext,
    IN  PLARGE_INTEGER               pExpirationTime         OPTIONAL,
    IN  LUID                         Identifier,
    IN  PVOID                        DynamicGroupArgs,
    OUT PAUTHZ_CLIENT_CONTEXT_HANDLE phNewAuthzClientContext
    );

AUTHZAPI
BOOL
WINAPI
AuthzAddSidsToContext(
    IN  AUTHZ_CLIENT_CONTEXT_HANDLE  hAuthzClientContext,
    IN  PSID_AND_ATTRIBUTES          Sids                    OPTIONAL,
    IN  DWORD                        SidCount,
    IN  PSID_AND_ATTRIBUTES          RestrictedSids          OPTIONAL,
    IN  DWORD                        RestrictedSidCount,
    OUT PAUTHZ_CLIENT_CONTEXT_HANDLE phNewAuthzClientContext
    );

//
//  API to modify security attributes in AUTHZ client context.
//

AUTHZAPI
BOOL
WINAPI
AuthzModifySecurityAttributes(
    __in    AUTHZ_CLIENT_CONTEXT_HANDLE             hAuthzClientContext,
    __in    PAUTHZ_SECURITY_ATTRIBUTE_OPERATION     pOperations,
    __in    PAUTHZ_SECURITY_ATTRIBUTES_INFORMATION  pAttributes
    );

//
// Enumeration type to be used to specify the type of information to be
// retrieved from an existing AuthzClientContext.
//

typedef enum _AUTHZ_CONTEXT_INFORMATION_CLASS
{
    AuthzContextInfoUserSid = 1,
    AuthzContextInfoGroupsSids,
    AuthzContextInfoRestrictedSids,
    AuthzContextInfoPrivileges,
    AuthzContextInfoExpirationTime,
    AuthzContextInfoServerContext,
    AuthzContextInfoIdentifier,
    AuthzContextInfoSource,
    AuthzContextInfoAll,
    AuthzContextInfoAuthenticationId,
    AuthzContextInfoSecurityAttributes
} AUTHZ_CONTEXT_INFORMATION_CLASS;

AUTHZAPI
BOOL
WINAPI
AuthzGetInformationFromContext(
    IN  AUTHZ_CLIENT_CONTEXT_HANDLE     hAuthzClientContext,
    IN  AUTHZ_CONTEXT_INFORMATION_CLASS InfoClass,
    IN  DWORD                           BufferSize,
    OUT PDWORD                          pSizeRequired,
    OUT PVOID                           Buffer
);

AUTHZAPI
BOOL
WINAPI
AuthzFreeContext(
    IN AUTHZ_CLIENT_CONTEXT_HANDLE hAuthzClientContext
    );


//
// Valid flags that may be used in AuthzInitializeObjectAccessAuditEvent().
//

#define AUTHZ_NO_SUCCESS_AUDIT                   0x00000001
#define AUTHZ_NO_FAILURE_AUDIT                   0x00000002
#define AUTHZ_NO_ALLOC_STRINGS                   0x00000004

#define AUTHZ_VALID_OBJECT_ACCESS_AUDIT_FLAGS    (AUTHZ_NO_SUCCESS_AUDIT | \
                                                  AUTHZ_NO_FAILURE_AUDIT | \
                                                  AUTHZ_NO_ALLOC_STRINGS)
                             
AUTHZAPI
BOOL
WINAPI
AuthzInitializeObjectAccessAuditEvent(
    IN    DWORD                         Flags,
    IN    AUTHZ_AUDIT_EVENT_TYPE_HANDLE hAuditEventType,
    __in  PWSTR                         szOperationType,
    __in  PWSTR                         szObjectType,
    __in  PWSTR                         szObjectName,
    __in  PWSTR                         szAdditionalInfo,
    OUT   PAUTHZ_AUDIT_EVENT_HANDLE     phAuditEvent,
    IN    DWORD                         dwAdditionalParameterCount,
    ...
    );
    
AUTHZAPI
BOOL
WINAPI
AuthzInitializeObjectAccessAuditEvent2(
    IN    DWORD                         Flags,
    IN    AUTHZ_AUDIT_EVENT_TYPE_HANDLE hAuditEventType,
    __in  PWSTR                         szOperationType,
    __in  PWSTR                         szObjectType,
    __in  PWSTR                         szObjectName,
    __in  PWSTR                         szAdditionalInfo,
    __in  PWSTR                         szAdditionalInfo2,
    OUT   PAUTHZ_AUDIT_EVENT_HANDLE     phAuditEvent,
    IN    DWORD                         dwAdditionalParameterCount,
    ...
    );

//
// Enumeration type to be used to specify the type of information to be
// retrieved from an existing AUTHZ_AUDIT_EVENT_HANDLE.
//

typedef enum _AUTHZ_AUDIT_EVENT_INFORMATION_CLASS
{
    AuthzAuditEventInfoFlags = 1,
    AuthzAuditEventInfoOperationType,
    AuthzAuditEventInfoObjectType,
    AuthzAuditEventInfoObjectName,
    AuthzAuditEventInfoAdditionalInfo,
} AUTHZ_AUDIT_EVENT_INFORMATION_CLASS;

AUTHZAPI
BOOL
WINAPI
AuthzFreeAuditEvent(
    IN AUTHZ_AUDIT_EVENT_HANDLE hAuditEvent
    );

//
// Support for SACL evaluation
//

AUTHZAPI
BOOL 
WINAPI
AuthzEvaluateSacl(
    IN  AUTHZ_CLIENT_CONTEXT_HANDLE AuthzClientContext,
    IN  PAUTHZ_ACCESS_REQUEST       pRequest,
    IN  PACL                        Sacl,
    IN  ACCESS_MASK                 GrantedAccess,
    IN  BOOL                        AccessGranted,
    OUT PBOOL                       pbGenerateAudit
    );

//
// Support for generic auditing.
//

typedef struct _AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET
{
    PWSTR szObjectTypeName;
    DWORD dwOffset;
} AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET, *PAUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET;

#if _MSC_VER >= 1200
#pragma warning(push)
#pragma warning(disable:4201) //  nonstandard extension used : nameless struct/union
#endif

typedef struct _AUTHZ_SOURCE_SCHEMA_REGISTRATION
{
    DWORD dwFlags;
    PWSTR szEventSourceName;
    PWSTR szEventMessageFile;
    PWSTR szEventSourceXmlSchemaFile;
    PWSTR szEventAccessStringsFile;
    PWSTR szExecutableImagePath;

    //
    // The meaning of the data is defined by dwFlags. Make sure
    // new types are pointers.
    //

    union
    {
        PVOID pReserved;

        //
        // Must be supplied when dwFlags contains AUTHZ_MIGRATED_LEGACY_PUBLISHER
        //

        GUID* pProviderGuid;
    };

    DWORD dwObjectTypeNameCount;
    AUTHZ_REGISTRATION_OBJECT_TYPE_NAME_OFFSET ObjectTypeNames[ANYSIZE_ARRAY];
} AUTHZ_SOURCE_SCHEMA_REGISTRATION, *PAUTHZ_SOURCE_SCHEMA_REGISTRATION;

#if _MSC_VER >= 1200
#pragma warning(pop)
#endif


#define AUTHZ_FLAG_ALLOW_MULTIPLE_SOURCE_INSTANCES 0x1

AUTHZAPI
BOOL 
WINAPI
AuthzInstallSecurityEventSource(
    IN DWORD                             dwFlags,
    IN PAUTHZ_SOURCE_SCHEMA_REGISTRATION pRegistration
    );

AUTHZAPI
BOOL
WINAPI
AuthzUninstallSecurityEventSource(
    IN DWORD  dwFlags,
    IN PCWSTR szEventSourceName
    );


AUTHZAPI
BOOL
WINAPI
AuthzEnumerateSecurityEventSources(
    IN     DWORD                             dwFlags,
    OUT    PAUTHZ_SOURCE_SCHEMA_REGISTRATION Buffer,
    OUT    PDWORD                            pdwCount,
    IN OUT PDWORD                            pdwLength
    );
    
AUTHZAPI
BOOL
WINAPI
AuthzRegisterSecurityEventSource(
    IN  DWORD                                 dwFlags,
    IN  PCWSTR                                szEventSourceName,
    OUT PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE phEventProvider
    );
    
AUTHZAPI
BOOL
WINAPI
AuthzUnregisterSecurityEventSource(
    IN     DWORD                                 dwFlags,
    IN OUT PAUTHZ_SECURITY_EVENT_PROVIDER_HANDLE phEventProvider
    );

AUTHZAPI
BOOL
WINAPI
AuthzReportSecurityEvent(
    IN     DWORD                                dwFlags,
    IN OUT AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE hEventProvider,
    IN     DWORD                                dwAuditId,
    IN     PSID                                 pUserSid        OPTIONAL,
    IN     DWORD                                dwCount,
    ...    
    );

AUTHZAPI
BOOL
WINAPI
AuthzReportSecurityEventFromParams(
    IN     DWORD                                dwFlags,
    IN OUT AUTHZ_SECURITY_EVENT_PROVIDER_HANDLE hEventProvider,
    IN     DWORD                                dwAuditId,
    IN     PSID                                 pUserSid       OPTIONAL,
    IN     PAUDIT_PARAMS                        pParams
    );

#ifdef __cplusplus
}
#endif

#endif                                                 

