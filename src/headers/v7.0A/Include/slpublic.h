/*++

Copyright (C) Microsoft Corporation, 2006

Module Name:

    slpublic.h

Abstract:

    Software Licensing and Geniune Advantage Client public API
   
--*/
#pragma once

#ifndef _SLPUBLIC_H_
#define _SLPUBLIC_H_

#if defined(SPP_CODE_PROJECT_MARKER) || defined(SPP_CODE_PROJECT_MARKER_SECURE)
#if !defined(SPP_PUBLISHING_INCLUDED_FROM_TRAMPOLINE) && !defined(SPP_PUBLISHING_USE_FORCE_OFFICIAL)
#error this header file cannot be included directly from SPP projects; use sppinc_* prefix instead.
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define SLFreeMemory(p) LocalFree(p)
    
#define SLWGAFreeMemory(p) LocalFree(p)

typedef GUID SLID;
    
typedef enum _tagSLDATATYPE
{
    SL_DATA_NONE        = REG_NONE,
    SL_DATA_SZ          = REG_SZ,
    SL_DATA_DWORD       = REG_DWORD,
    SL_DATA_BINARY      = REG_BINARY,
    SL_DATA_MULTI_SZ    = REG_MULTI_SZ,
    SL_DATA_SUM         = 100,
} SLDATATYPE;

typedef enum _SL_GENUINE_STATE
{
    SL_GEN_STATE_IS_GENUINE         = 0,
    SL_GEN_STATE_INVALID_LICENSE,
    SL_GEN_STATE_TAMPERED,
    SL_GEN_STATE_LAST, 
} SL_GENUINE_STATE;

typedef struct _tagSL_NONGENUINE_UI_OPTIONS
{
    DWORD                       cbSize;
    CONST SLID*                 pComponentId;
    HRESULT                     hResultUI;

} SL_NONGENUINE_UI_OPTIONS;


#define SL_PROP_BRT_DATA                                    L"SL_BRT_DATA"
#define SL_PROP_BRT_COMMIT                                  L"SL_BRT_COMMIT"
#define SL_PROP_GENUINE_RESULT                              L"SL_GENUINE_RESULT"
#define SL_PROP_NONGENUINE_GRACE_FLAG                       L"SL_NONGENUINE_GRACE_FLAG"

#define SL_POLICY_EVALUATION_MODE_ENABLED                   L"Security-SPP-EvaluationModeEnabled"

__control_entrypoint(DllExport)
HRESULT 
WINAPI
SLGetWindowsInformation(
    __in                        PCWSTR                      pwszValueName,
    __out_opt                   SLDATATYPE*                 peDataType,
    __out                       UINT*                       pcbValue,
    __deref_out_bcount(*pcbValue) PBYTE*                    ppbValue
    );
/*++
Routine Description:

    This function is used to for Windows components to get 
    component policy value.
    
Arguments:

    pwszValueName
        The name of the requested value.
        
    peDataType
        Data type. Following types are supported:
            SL_DATA_SZ     - UNICODE string
            SL_DATA_DWORD  - DWORD
            SL_DATA_BINARY - Binary blob
        
    pcbValue
        Size of the allocated buffer.
        
    ppbValue
        The value. If successful, the data is returned in the buffer 
        allocated by SLC.
        The caller has to call SLFreeMemory to free the memory. 
        
Return Error:
    E_INVALIDARG
    SL_E_VALUE_NOT_FOUND
    SL_E_RIGHT_NOT_GRANTED
    
--*/

__control_entrypoint(DllExport)
HRESULT 
WINAPI
SLGetWindowsInformationDWORD(
    __in PCWSTR pwszValueName,
    __out DWORD* pdwValue
    );
/*++
Routine Description:

    This function is used to for Windows components to get 
    component policy DWORD value.

Arguments:

    pwszValueName
        The name of the requested value.
        
    pdwValue
        The buffer to receive DWORD value
        
Return Error:
    E_INVALIDARG
    SL_E_VALUE_NOT_FOUND
    SL_E_RIGHT_NOT_GRANTED
    SL_E_DATATYPE_MISMATCHED
    
--*/

__control_entrypoint(DllExport)
HRESULT
WINAPI
SLIsGenuineLocal(
    __in                        CONST SLID*                 pAppId,
    __out                       SL_GENUINE_STATE*           pGenuineState, 
    __inout_opt                 SL_NONGENUINE_UI_OPTIONS*   pUIOptions
    );
/*++
Routine Description:

    Determines if an installation is a Genuine installation.
    It interrogates the license for pAppId and inspects the "Tampered"
    flag.  If either the license for pAppId is invalid or the "Tampered"
    flag is set, the installation is assumed to be invalid.

    pGenuineState is ONLY modified if the result is S_OK.  Otherwise, it is
    left in the state in which it was found on function entry.

Arguments:

    pAppId
        Application identifier. 

    pbGenuineState
        Output state value - one of the SL_GENUINE_STATE values

    pUIOptions
        Non genuine UI options. If NULL, no UI is displayed if 
        state is non-genuine. 

Return Error:

    S_OK
        Operation completed successfully.

    E_INVALIDARG
        pGenuineState is NULL.

--*/

__control_entrypoint(DllExport)
HRESULT
WINAPI
SLIsGenuineLocalEx(
    __in                        CONST SLID*                 pAppId,
    __in_opt                    CONST SLID*                 pSkuId,
    __out                       SL_GENUINE_STATE*           pGenuineState
    );
/*++
Routine Description:

    Determines if an installation is a Genuine installation.
    If the SkuId is provided, it is used for the primary check.  If the Sku license
    contains a ProductUniquenessGroupId value, that is also used.  Finally, the AppId is used.
    If the AppId, ProductUniquenessGroupId, or SkuId contains a "Tampered" flag or if the license
    state is invalid or "Tampered", the installation is assumed to be invalid.
    

    pGenuineState is ONLY modified if the result is S_OK.  Otherwise, it is
    left in the state in which it was found on function entry.

Arguments:

    pAppId
        Application identifier.
    
    pSkuId
        Sku identifier, optional.  If specified and the Sku license contains a
        ProductUniquenessGroupId then that is also checked.

    pbGenuineState
        Output state value - one of the SL_GENUINE_STATE values

Return Error:

    S_OK
        Operation completed successfully.

    E_INVALIDARG
        pGenuineState is NULL.

--*/


__control_entrypoint(DllExport)
HRESULT
WINAPI
SLAcquireGenuineTicket(
    __deref_out_bcount(*pcbTicketBlob) VOID**               ppTicketBlob,  
    __out                       UINT*                       pcbTicketBlob,
    __in                        PCWSTR                      pwszTemplateId, 
    __in                        PCWSTR                      pwszServerUrl, 
    __in_opt                    PCWSTR                      pwszClientToken 
    );
/*++
Routine Description:

    Returns genuine ticket acquired from Software Licensing Server based
    on SLWGA template blob. 
    
    The client is responsible for freeing the buffer returned in ppGenuineBlob.
    SLWGAFreeMemory should be used to free the memory.

    The output parameters are only set if the function returns S_OK.  Otherwise,
    they are left as they were when the function was entered.

Arguments:

    ppTicketBlob
        Pointer to output pointer to be returned (XrML genuine ticket).

    pcbTicketBlob
        An output pointer that will contain the size, in bytes, of the region
        returned in ppTicketBlob.

    pwszTemplateId
        Id of genuine blob template kept on the server side. 

    pwszServerUrl
        Ticket acquisition server url. 

    pwszClientToken
        Client custom token. 

Return Error:

    S_OK
        Operation completed successfully.

--*/

__control_entrypoint(DllExport)
HRESULT
WINAPI
SLSetGenuineInformation(
    __in                        CONST SLID*                 pAppId,
    __in                        PCWSTR                      pwszValueName,
    __in                        SLDATATYPE                  eDataType,
    __in_opt                    UINT                        cbValue,
    __in_bcount_opt(cbValue)    CONST BYTE*                 pbValue
    );
/*++
Routine Description:

    This function sets genuine information.

Arguments:

    pAppId
        Application Id. E.g. Windows AppId
        
    pwszValueName
        The name of value.
        TBD
                                                
    eType
        See SLDATATYPE
        
    cbValue
        Size of value
    
    pbValue
        Value.
        Some properties allows NULL pointer, which can be used to delete
        the property but some properties can't.

Return Value:

    HRESULT_FROM_WIN32(ERROR_BUFFER_OVERFLOW)
        The size of value is over expected size
    E_ACCESSDENIED
        Admin privilege required
    E_INVALIDARG
        Some property does not allow NULL value
    SL_E_NOT_SUPPORTED
        The name of value is not supported
    SL_E_DEPENDENT_PROPERTY_NOT_SET    
        If entry has been set
    SL_E_DATATYPE_MISMATCHED
        The type of data is mismatched with the expected type 
        of specified value name
--*/

__control_entrypoint(DllExport)
HRESULT
WINAPI
SLGetGenuineInformation(
    __in                        CONST SLID*                 pAppId,
    __in                        PCWSTR                      pwszValueName,
    __out_opt                   SLDATATYPE*                 peDataType,
    __out                       UINT*                       pcbValue,
    __deref_out_bcount(*pcbValue) BYTE**                    ppbValue
    );
/*++
Routine Description:

    This function gets genuine information.

Arguments:

    hSLC
        Handle to current SLC session.

    pAppId
        Application ID. E.g. Windows AppId
        
    pwszValueName
        See SLSetOfflineGenuineInformation
        
    eType
        See SLDATATYPE
        
    cbValue
        Size of value
        
    pbValue
        Value

Return Value:

    SL_E_NOT_SUPPORTED
        The name of value is not supported

    SL_E_VALUE_NOT_FOUND
        The specified value can not be found    

--*/                


#ifdef __cplusplus
}
#endif

#endif

