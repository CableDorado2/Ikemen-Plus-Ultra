//
// Copyright (c) 1998-2008  Microsoft Corporation. All Rights Reserved.
//
// Module Name: tscerror.h
//
// Abstract:
//
//      Session Broker TSV Internal Error Codes
//
// Author:
//
//      Mahadev Alladi
//
// Revision History:
//
//      1/24/2008 Created
//


#ifndef _SB_ERRORS_H_
#define _SB_ERRORS_H_


///////////////////////////////////////////////////////////////////////////////
//
// Error codes
//

#define FACILITY_SB  0x813

#define MAKE_SBTSV_ERR(x) MAKE_HRESULT(SEVERITY_ERROR, FACILITY_SB, x)

///////////////////////////////////////////////////////////////////////////////
//
// Base error codes
//

// TSV SBerrors start at 1
#define MAKE_SB_ERR(x)                                  MAKE_SBTSV_ERR(x)

//
// No disconnected session found
//
#define E_SB_NO_DISCONNECTED_SESSION                    MAKE_SB_ERR(1)

//
// Unable to find a resource plugin
//
#define E_SB_NO_RESOURCE_PLUGIN                         MAKE_SB_ERR(2)

//
// Host not found
//
#define E_SB_TARGET_NOT_FOUND                           MAKE_SB_ERR(3)

//
// host environment not found
//
#define E_SB_ENVIRONMENT_NOT_FOUND                      MAKE_SB_ERR(4)

//
// Unable to find a filter plugin
//
#define E_SB_NO_FILTER_PLUGIN                           MAKE_SB_ERR(5)

//
// no hint data
//
#define E_SB_NO_HINT_DATA                               MAKE_SB_ERR(6)

//
// Load Balancing failed
//
#define E_SB_LOAD_BAL_FAILED                            MAKE_SB_ERR(7)

//
// Query Placement Failed
//
#define E_SB_QUERY_PLACEMENT_FAILED                     MAKE_SB_ERR(8)

//
// Create Placement failed
//
#define E_SB_CREATE_PLACEMENT_FAILED                    MAKE_SB_ERR(9)

//
// Orchestration failed
//
#define E_SB_ORCHESTRATION_FAILED                       MAKE_SB_ERR(10)

//
// Disconnected session check failed
//
#define E_SB_DISCONN_SESSION_CHECK_FAILED               MAKE_SB_ERR(11)

//
// Policy Plugin process request failed
//
#define E_SB_POLICY_PLUGIN_PROC_REQ_FAILED              MAKE_SB_ERR(12)

//
// CLSID of the Plugin (in the registry) is invalid or absent
//
#define E_SB_NO_PLUGIN_CLSID_REG                        MAKE_SB_ERR(13)

//
// Provider of the Plugin (in the registry) is invalid or absent
//
#define E_SB_NO_PLUGIN_PROVIDER_REG                     MAKE_SB_ERR(14)

//
// Plugin is disabled (from the registry) or IsEnabled=0
//
#define E_SB_PLUGIN_DISABLED_REG                        MAKE_SB_ERR(15)

//
// Plugin has implemented ITsSbResourcePlugin, but did not implement from
// ITsSbLoadBalancing, ITsSbPlacement, ITsSbOrchestration. All should be 
// implemented by a resource plugin
//
#define E_SB_BAD_RESOURCE_PLUGIN                        MAKE_SB_ERR(16)

//
// A Filter Plugin should implement atleast one of the following interfaces
// ITsSbLoadBalancing, ITsSbPlacement, ITsSbOrchestration. 
//
#define E_SB_BAD_FILTER_PLUGIN                          MAKE_SB_ERR(17)

//
// Session Broker Computers group is empty
//
#define E_SB_GROUP_EMPTY                                MAKE_SB_ERR(18)

//
// Session Broker Computers group does not exist
//
#define E_SB_GROUP_NOT_EXIST                            MAKE_SB_ERR(19)

//
// Target supplied by the plugin doesnt have IP address.
//
#define E_SB_NO_TARGET_IP_ADDRESS                       MAKE_SB_ERR(20)

//
// Failed to redirect to destination
//
#define E_SB_REDIRECT_TO_DESTINATION_FAILED             MAKE_SB_ERR(21)

//
// Failed to wake VM (specific to VM plugin)
//
#define E_SB_VM_WAKE_FAILED                             MAKE_SB_ERR(22)

//
// Failed to boot a VM (specific to VM plugin)
//
#define E_SB_VM_BOOT_FAILED                             MAKE_SB_ERR(23)

//
// Target supplied by the plugin doesnt have IP address.
//
#define E_SB_FARM_NOT_FOUND                             MAKE_SB_ERR(24)

//
// Session Broker Service is stopping.
//
#define E_SB_SERVICE_STOPPING                           MAKE_SB_ERR(25)

//
// Target is not in the same Farm as expected
//
#define E_SB_TARGET_IN_DIFFERENT_FARM                   MAKE_SB_ERR(26)

//
// Target and Target Type don't match
//
#define E_SB_TARGET_TYPE_MISMATCH                       MAKE_SB_ERR(27)

//
// The format of the TSV URL is incorrect
//
#define E_SB_WRONG_TSV_URL_FORMAT                       MAKE_SB_ERR(28)

//
// Unidentified Target Type
//
#define E_SB_UNIDENTIFIED_TARGET_TYPE                   MAKE_SB_ERR(29)

//
// Error in publishing service returned data
//
#define E_SB_WRONG_USER_DATA_FROM_PUB_SERVICE           MAKE_SB_ERR(30)

//
// The tsv URL is not present
//
#define E_SB_TSV_URL_NOT_PRESENT                        MAKE_SB_ERR(31)

//
// Unknown Resource Plugin Provider
//
#define E_SB_UNKNOWN_RESOURCE_PLUGIN                    MAKE_SB_ERR(32)

//
// Unknown Central Publishing Plugin Guid
//
#define E_SB_UNKNOWN_CP_PLUGIN                          MAKE_SB_ERR(33)

//
// NULL Central Publishing Plugin Guid
//
#define E_SB_NULL_CP_PLUGIN                             MAKE_SB_ERR(34)

//
// State of a resource (target/session) is unchanged 
// but broker still received a OnStateChange call.
//
#define E_SB_RESOURCE_STATE_UNCHANGED                   MAKE_SB_ERR(35)

//
// Unknown error occurred
//
#define E_SB_UNKNOWN                                    MAKE_SB_ERR(500)

#endif //_SB_ERRORS_H_
