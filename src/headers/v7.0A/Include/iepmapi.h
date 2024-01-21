//+-------------------------------------------------------------------------
//
//  iepmapi.h -- This module defines the IE Protected Mode APIs
// 
//  Copyright (c) Microsoft Corp. All rights reserved.
//
//--------------------------------------------------------------------------
#ifndef _IEPMAPI_
#define _IEPMAPI_


#if _MSC_VER > 1000
#pragma once
#endif

// Remap old API names to new ones.
#define IEGetWriteableHKCU      IEGetWriteableLowHKCU


// IE Launch Option Flags

typedef enum {
    IELAUNCHOPTION_SCRIPTDEBUG = 0x00000001,
} IELAUNCHOPTION_FLAGS;

//+-------------------------------------------------------------------------
//
// Structure:   IELAUNCHURLINFO
//
// Members:
//              cbSize - Size of the structure, in bytes.
//              dwCreationFlags - Process Creation flags used by CreateProcess 
//                                and CreateProcessAsUser functions.
//              dwLaunchOptions - Combination of IELAUNCHOPTION_FLAGS
//--------------------------------------------------------------------------
typedef struct _IELAUNCHURLINFO {
    DWORD cbSize;
    DWORD dwCreationFlags;
    DWORD dwLaunchOptionFlags;
} IELAUNCHURLINFO, *LPIELAUNCHURLINFO;

//+-------------------------------------------------------------------------
//
//  Method:     IESaveFile
// 
//  Synopsis:   Saves the file to the location selected by the user in a 
//              previous call to IEShowSaveFileDialog
//
//--------------------------------------------------------------------------
STDAPI IESaveFile(                                   
    __in HANDLE    hState,                           
    __in LPCWSTR   lpwstrSourceFile                  
    );                          


//+-------------------------------------------------------------------------
//
//  Method:     IECancelSaveFile
// 
//  Synopsis:   Cancels the save operation and releases the resources 
//              allocated for the previous call to IEShowSaveFileDialog
//
//--------------------------------------------------------------------------
STDAPI IECancelSaveFile(
    __in HANDLE    hState
    );


//+-------------------------------------------------------------------------
//
//  Method:     IEShowSaveFileDialog
// 
//  Synopsis:   Shows the standard SaveFile dialog from a higher integrity 
//              user context
//
//  Remarks:    When no longer needed, call CoTaskMemFree to release
//              lppwstrDestinationFilePath 
//
//--------------------------------------------------------------------------
STDAPI IEShowSaveFileDialog(                         
    __in        HWND     hwnd,                       
    __in        LPCWSTR  lpwstrInitialFileName,      
    __in_opt    LPCWSTR  lpwstrInitialDir,           
    __in_opt    LPCWSTR  lpwstrFilter,               
    __in_opt    LPCWSTR  lpwstrDefExt,               
    __in        DWORD    dwFilterIndex,              
    __in        DWORD    dwFlags,                    
    __deref_out LPWSTR   *lppwstrDestinationFilePath,
    __out       HANDLE   *phState                    
    );                                               


//+-------------------------------------------------------------------------
//
//  Method:     IEGetWriteableLowHKCU
// 
//  Synopsis:   Returns a handle to a write accessible location under 
//              HKEY_CURRENT_USER for MIC Low process
//
//  Remarks:    When no longer needed, call RegCloseKey function to close 
//              the HKEY
//
//--------------------------------------------------------------------------
STDAPI IEGetWriteableLowHKCU(                           
    __out HKEY    *pHKey                             
    );                                               


//+-------------------------------------------------------------------------
//
//  Method:     IEGetWriteableFolderPath
// 
//  Synopsis:   Returns the current location of the specified folder. 
//              In protected mode, the path points to a location where 
//              the user has write permissions
//
//  Remarks:    When no longer needed, call CoTaskMemFree to release the
//              lppwstrPath
//
//--------------------------------------------------------------------------
STDAPI IEGetWriteableFolderPath(                     
    __in        REFGUID clsidFolderID,               
    __deref_out LPWSTR   *lppwstrPath                
    );                                               


//+-------------------------------------------------------------------------
//
//  Method:     IEIsProtectedModeProcess
// 
//  Synopsis:   Determines if Internet Explorer is running in protected mode
//
//--------------------------------------------------------------------------
STDAPI IEIsProtectedModeProcess(                     
    __out BOOL     *pbResult                         
    );                                               


//+-------------------------------------------------------------------------
//
//  Method:     IEIsProtectedModeURL
// 
//  Synopsis:   Determines if the URL runs in Protected Mode or not
//
//--------------------------------------------------------------------------
STDAPI IEIsProtectedModeURL(                     
    __in LPCWSTR lpwstrUrl
    );

//+-------------------------------------------------------------------------
//
//  Method:     IELaunchURL
// 
//  Synopsis:   Launches the appropriate IE to handle the navigation to 
//              the URL
//
//--------------------------------------------------------------------------
STDAPI IELaunchURL(                     
    __in        LPCWSTR lpwstrUrl,
    __inout     PROCESS_INFORMATION *lpProcInfo,
    __in_opt    VOID *lpInfo
    );

//+-------------------------------------------------------------------------
//
//  Method:     IERefreshElevationPolicy
// 
//  Synopsis:   Causes the next elevation policy look up to refresh from
//              the registry
//
//--------------------------------------------------------------------------
STDAPI IERefreshElevationPolicy();

//+-------------------------------------------------------------------------
//
//  Method:     IEGetProtectedModeCookie
// 
//  Synopsis:   Retrieves the cookie data from the Protected Mode Cookie store
//
//--------------------------------------------------------------------------
STDAPI IEGetProtectedModeCookie(__in LPCWSTR lpszURL,
                                __in LPCWSTR lpszCookieName,
                                __inout_ecount(*pcchCookieData) LPWSTR lpszCookieData,
                                __inout DWORD *pcchCookieData,
                                __in DWORD dwFlags);

//+-------------------------------------------------------------------------
//
//  Method:     IESetProtectedModeCookie
// 
//  Synopsis:   Set the cookie data in the Protected Mode Cookie store
//
//--------------------------------------------------------------------------
STDAPI IESetProtectedModeCookie(__in LPCWSTR lpszURL,
                                __in LPCWSTR lpszCookieName,
                                __in LPCWSTR lpszCookieData,
                                __in DWORD dwFlags);

//+-------------------------------------------------------------------------
//
//  Method:     IERegisterWritableRegistryKey
// 
//  Synopsis:   Register a subkey path during installation so that 
//              low process can write into this location during run time.
//
//--------------------------------------------------------------------------
STDAPI IERegisterWritableRegistryKey(
    GUID guid,
    __in LPCWSTR lpSubkey,
    BOOL fSubkeyAllowed
);

//+-------------------------------------------------------------------------
//
//  Method:     IERegisterWritableRegistryValue
// 
//  Synopsis:   Register a value in a subkey path during installation so that 
//              low process can write into this location during run time.
//
//--------------------------------------------------------------------------
STDAPI IERegisterWritableRegistryValue(
    GUID guid,
    __in LPCWSTR lpPath, 
    __in LPCWSTR lpValueName, 
    DWORD dwType, 
    __in_opt const BYTE* lpData, 
    DWORD cbMaxData
);

//+-------------------------------------------------------------------------
//
//  Method:     IEUnregisterWritableRegistryKey
// 
//  Synopsis:   Unregister a registry path during uninstallation so that 
//              low process can not write into this location
//
//--------------------------------------------------------------------------
STDAPI IEUnregisterWritableRegistry(
    GUID guid
);

//+-------------------------------------------------------------------------
//
//  Method:     IERegCreateKeyEx
// 
//  Synopsis:   Call Broker to do RegCreateKeyEx on pre-registered locations
//
//--------------------------------------------------------------------------
STDAPI IERegCreateKeyEx(
  __in      LPCWSTR lpSubKey,
  __in      DWORD Reserved,
  __in_opt  LPWSTR lpClass,
  __in      DWORD dwOptions,
  __in      REGSAM samDesired,
  __in_opt  LPSECURITY_ATTRIBUTES lpSecurityAttributes,
  __out     PHKEY phkResult,
  __out     LPDWORD lpdwDisposition);

//+-------------------------------------------------------------------------
//
//  Method:     IERegSetValueEx
// 
//  Synopsis:   Call Broker to do RegSetValueEx on pre-registered location
//
//--------------------------------------------------------------------------
STDAPI IERegSetValueEx(
  __in LPCWSTR lpSubKey,
  __in LPCWSTR lpValueName,
  __in DWORD Reserved,
  __in DWORD dwType,
  __in const BYTE* lpData,
  __in DWORD cbData);

//+-------------------------------------------------------------------------
//
//  Method:     IECreateFile
// 
//  Synopsis:   wrapper to CreateFile
//
//--------------------------------------------------------------------------
HANDLE IECreateFile(
  __in LPCWSTR lpFileName,
  DWORD dwDesiredAccess,
  DWORD dwShareMode,
  __in LPSECURITY_ATTRIBUTES lpSecurityAttributes,
  DWORD dwCreationDisposition,
  DWORD dwFlagsAndAttributes,
  __in_opt HANDLE hTemplateFile
);

//+-------------------------------------------------------------------------
//
//  Method:     IEDeleteFile   
// 
//  Synopsis:   wrapper to DeleteFile
//
//--------------------------------------------------------------------------
BOOL IEDeleteFile(
  __in LPCWSTR lpFileName
);

//+-------------------------------------------------------------------------
//
//  Method:     IERemoveDirectory
// 
//  Synopsis:   wrapper to RemoveDirectory
//
//--------------------------------------------------------------------------
BOOL IERemoveDirectory(
  __in LPCWSTR lpPathName
);

//+-------------------------------------------------------------------------
//
//  Method:     IEMoveFileEx
// 
//  Synopsis:   wrapper to MoveFileEx
//
//--------------------------------------------------------------------------
BOOL IEMoveFileEx(
  __in LPCWSTR lpExistingFileName,
  __in LPCWSTR lpNewFileName,
  DWORD dwFlags
);

//+-------------------------------------------------------------------------
//
//  Method:     IECreateDirectory
// 
//  Synopsis:   wrapper to CreateDirectory
//
//--------------------------------------------------------------------------
BOOL IECreateDirectory(
  __in LPCWSTR lpPathName,
  __in LPSECURITY_ATTRIBUTES lpSecurityAttributes
);

//+-------------------------------------------------------------------------
//
//  Method:     IEGetFileAttributesEx
// 
//  Synopsis:   wrapper to GetFileAttributesEx
//
//--------------------------------------------------------------------------
BOOL IEGetFileAttributesEx(
  __in LPCWSTR lpFileName,
  GET_FILEEX_INFO_LEVELS fInfoLevelId,
  __in LPVOID lpFileInformation
);

//+-------------------------------------------------------------------------
//
//  Method:     IEFindFirstFile
// 
//  Synopsis:   wrapper to FindFirstFile
//
//--------------------------------------------------------------------------
HANDLE IEFindFirstFile(
  __in LPCWSTR lpFileName,
  __in LPWIN32_FIND_DATA lpFindFileData
);

#endif //_IEPMAPI_

