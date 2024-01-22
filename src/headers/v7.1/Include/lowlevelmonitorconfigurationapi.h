#ifndef LowLevelMonitorConfigurationAPI_h
#define LowLevelMonitorConfigurationAPI_h

#include <PhysicalMonitorEnumerationAPI.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus 

#pragma pack( push, 1  )

typedef struct _MC_TIMING_REPORT
{
    DWORD dwHorizontalFrequencyInHZ;
    DWORD dwVerticalFrequencyInHZ;
    BYTE bTimingStatusByte;

} MC_TIMING_REPORT, *LPMC_TIMING_REPORT;

typedef enum _MC_VCP_CODE_TYPE
{
    MC_MOMENTARY,
    MC_SET_PARAMETER

} MC_VCP_CODE_TYPE, *LPMC_VCP_CODE_TYPE;

_BOOL WINAPI GetVCPFeatureAndVCPFeatureReply
    (
    HANDLE hMonitor,
    BYTE bVCPCode,
    __out_opt LPMC_VCP_CODE_TYPE pvct,
    __out LPDWORD pdwCurrentValue, 
    __out_opt LPDWORD pdwMaximumValue
    );

_BOOL WINAPI SetVCPFeature( HANDLE hMonitor, BYTE bVCPCode, DWORD dwNewValue );

_BOOL WINAPI SaveCurrentSettings( HANDLE hMonitor );

_BOOL WINAPI GetCapabilitiesStringLength( HANDLE hMonitor, __out LPDWORD pdwCapabilitiesStringLengthInCharacters );

_BOOL WINAPI CapabilitiesRequestAndCapabilitiesReply 
    (
    HANDLE hMonitor, 
    __out_ecount(dwCapabilitiesStringLengthInCharacters) LPSTR pszASCIICapabilitiesString, 
    DWORD dwCapabilitiesStringLengthInCharacters
    );

_BOOL WINAPI GetTimingReport( HANDLE hMonitor, __out LPMC_TIMING_REPORT pmtrMonitorTimingReport );

#pragma pack( pop )

#ifdef __cplusplus
}
#endif // __cplusplus 

#endif // LowLevelMonitorConfigurationAPI_h

