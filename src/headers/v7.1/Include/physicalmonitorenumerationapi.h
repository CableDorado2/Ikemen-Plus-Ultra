#ifndef PhysicalMonitorEnumerationAPI_h
#define PhysicalMonitorEnumerationAPI_h

#include <d3d9.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus 

#pragma pack( push, 1  )    

/******************************************************************************
    Physical Monitor Type Definitions
******************************************************************************/

typedef __success(return == TRUE) BOOL _BOOL;

/******************************************************************************
    Physical Monitor Constants
******************************************************************************/

// A physical monitor description is always an array of 128 characters.  Some
// of the characters may not be used.
#define PHYSICAL_MONITOR_DESCRIPTION_SIZE                   128

/******************************************************************************
    Physical Monitor Structures 
******************************************************************************/
typedef struct _PHYSICAL_MONITOR
{
    HANDLE hPhysicalMonitor;
    WCHAR szPhysicalMonitorDescription[PHYSICAL_MONITOR_DESCRIPTION_SIZE];
} PHYSICAL_MONITOR, *LPPHYSICAL_MONITOR;

/******************************************************************************
    Physical Monitor Enumeration Functions
******************************************************************************/
_BOOL WINAPI GetNumberOfPhysicalMonitorsFromHMONITOR
    ( 
    HMONITOR hMonitor, 
    __out LPDWORD pdwNumberOfPhysicalMonitors
    );
HRESULT WINAPI GetNumberOfPhysicalMonitorsFromIDirect3DDevice9
    (
    __in IDirect3DDevice9* pDirect3DDevice9,
    __out LPDWORD pdwNumberOfPhysicalMonitors
    );

_BOOL WINAPI GetPhysicalMonitorsFromHMONITOR
    ( 
    __in HMONITOR hMonitor,
    __in DWORD dwPhysicalMonitorArraySize,
    __out_ecount(dwPhysicalMonitorArraySize) LPPHYSICAL_MONITOR pPhysicalMonitorArray
    );
HRESULT WINAPI GetPhysicalMonitorsFromIDirect3DDevice9
    ( 
    __in IDirect3DDevice9* pDirect3DDevice9,
    __in DWORD dwPhysicalMonitorArraySize,
    __out_ecount(dwPhysicalMonitorArraySize) LPPHYSICAL_MONITOR pPhysicalMonitorArray
    );

_BOOL WINAPI DestroyPhysicalMonitor( __in HANDLE hMonitor );
_BOOL WINAPI DestroyPhysicalMonitors
    ( 
    __in DWORD dwPhysicalMonitorArraySize,
    __in_ecount(dwPhysicalMonitorArraySize) LPPHYSICAL_MONITOR pPhysicalMonitorArray
    );

#pragma pack( pop )

#ifdef __cplusplus
}
#endif // __cplusplus 

#endif // PhysicalMonitorEnumerationAPI_h

