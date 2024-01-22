#pragma once

#if(_WIN32_WINNT >= 0x0600)
typedef enum _WSC_SECURITY_PROVIDER
{
    // Represents the aggregation of all firewalls for this computer.
    WSC_SECURITY_PROVIDER_FIREWALL =                   0x1,
    // Represents the Automatic updating settings for this computer.
    WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS  =       0x2,
    // Represents the aggregation of all antivirus products for this comptuer.
    WSC_SECURITY_PROVIDER_ANTIVIRUS =                  0x4,
    // Represents the aggregation of all antispyware products for this comptuer.
    WSC_SECURITY_PROVIDER_ANTISPYWARE =                0x8,
    // Represents the settings that restrict the access of web sites in each of the internet zones.
    WSC_SECURITY_PROVIDER_INTERNET_SETTINGS =          0x10,
    // Represents the User Account Control settings on this machine.
    WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL =       0x20,
    // Represents the running state of the Security Center service on this machine.
    WSC_SECURITY_PROVIDER_SERVICE =                    0x40,

    WSC_SECURITY_PROVIDER_NONE =                       0,

    // Aggregates all of the items that Security Center monitors.
    WSC_SECURITY_PROVIDER_ALL =                             WSC_SECURITY_PROVIDER_FIREWALL | 
                                                            WSC_SECURITY_PROVIDER_AUTOUPDATE_SETTINGS | 
                                                            WSC_SECURITY_PROVIDER_ANTIVIRUS | 
                                                            WSC_SECURITY_PROVIDER_ANTISPYWARE | 
                                                            WSC_SECURITY_PROVIDER_INTERNET_SETTINGS | 
                                                            WSC_SECURITY_PROVIDER_USER_ACCOUNT_CONTROL | 
                                                            WSC_SECURITY_PROVIDER_SERVICE
} WSC_SECURITY_PROVIDER, *PWSC_SECURITY_PROVIDER;

typedef enum _WSC_SECURITY_PROVIDER_HEALTH
{
    WSC_SECURITY_PROVIDER_HEALTH_GOOD, // Green pillar in English locales
    WSC_SECURITY_PROVIDER_HEALTH_NOTMONITORED, // Yellow pillar in English locales
    WSC_SECURITY_PROVIDER_HEALTH_POOR,  // Red pillar in English locales
    WSC_SECURITY_PROVIDER_HEALTH_SNOOZE, // Yellow pillar in English locales
} WSC_SECURITY_PROVIDER_HEALTH, *PWSC_SECURITY_PROVIDER_HEALTH;


// The WscRegisterForChanges function registers a callback function to be run when Windows Security Center (WSC) detects 
// a change that could affect the health of one of the security providers.
// 
// Parameters:
// Reserved [in]: Reserved. Must be NULL.
// phCallbackRegistration [out]: A pointer to a handle to the callback registration. When you are finished using 
//                               the callback function, unregister it by calling the WscUnRegisterChanges function.
// lpCallbackAddress [in]: A pointer to the application-defined function to be called when a change to the WSC 
//                         service occurs. This function is also called when the WSC service is started or stopped.
// pContext [in]: A pointer to a variable to be passed as the lpParameter parameter to the function pointed to by the 
//                lpCallbackAddress parameter.
//
// Return Values:
// Returns S_OK if the function succeeds, otherwise returns an error code.
//
// Remarks:
// When you want to cease receiving notification to your callback method, you can unregister it by calling the 
// WscUnRegisterChanges function.




STDAPI WscRegisterForChanges(LPVOID Reserved, 
                             PHANDLE phCallbackRegistration,
                             LPTHREAD_START_ROUTINE lpCallbackAddress, 
                             PVOID pContext);

// The WscUnRegisterChanges function cancels a callback registration that was made by a call to the WscRegisterForChanges 
// function.
// 
// Parameters:
// hRegistrationHandle [in]: The handle to the registration context returned as the phCallbackRegistration of the 
//                           WscRegisterForChanges function. 
//
// Return Values:
// Returns S_OK if the function succeeds, otherwise returns an error code.

STDAPI WscUnRegisterChanges(HANDLE hRegistrationHandle);

// The WscGetSecurityProviderHealth function gets the aggregate health state of the security provider categories represented 
// by the specified WSC_SECURITY_PROVIDER enumeration values.
// 
// Parameters:
// Providers [in]: One or more of the values in the WSC_SECURITY_PROVIDER enumeration. To specify more than one value, 
//                 combine the individual values by performing a bitwise OR operation.
// pHealth [out]: A pointer to a variable that takes the value of one of the members of the WSC_SECURITY_PROVIDER_HEALTH 
//                enumeration. If more than one provider is specified in the Providers parameter, the value of this parameter 
//                is the health of the least healthy of the specified provider categories. 
//
// Return values:  
// Returns S_OK if the function succeeds, otherwise returns an error code. If the WSC service is not running, the return value 
// is always S_FALSE and the pHealth out parameter is always set to WSC_SECURITY_PROVIDER_HEALTH_POOR.
// 

STDAPI WscGetSecurityProviderHealth(DWORD Providers,
                                    PWSC_SECURITY_PROVIDER_HEALTH pHealth);
#endif


