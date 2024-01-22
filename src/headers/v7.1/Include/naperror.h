////////////////////////////////////////////////////////////
//
// Copyright (c) Microsoft Corporation
//
// SYNOPSIS
//
//   Declares the NAP-specific HRESULTs.
//
////////////////////////////////////////////////////////////

#ifndef NAPERROR_H
#define NAPERROR_H

#pragma once

#define FACILITY_NAP       0x27


//
// MessageId: NAP_E_INVALID_PACKET
//
// MessageText:
//
//  The NAP SoH packet is invalid.
//
#define NAP_E_INVALID_PACKET  _HRESULT_TYPEDEF_(0x80270001L)


//
// MessageId: NAP_E_MISSING_SOH
//
// MessageText:
//
// An SoH was missing from the NAP packet.
//
#define NAP_E_MISSING_SOH     _HRESULT_TYPEDEF_(0x80270002L)


//
// MessageId: NAP_E_CONFLICTING_ID
//
// MessageText:
//
//  The entity ID conflicts with an already registered id.
//
#define NAP_E_CONFLICTING_ID  _HRESULT_TYPEDEF_(0x80270003L)


//
// MessageId: NAP_E_NO_CACHED_SOH
//
// MessageText:
//
//  No cached SoH is present.
//
#define NAP_E_NO_CACHED_SOH    _HRESULT_TYPEDEF_(0x80270004L)


//
// MessageId: NAP_E_STILL_BOUND
//
// MessageText:
//
//  The entity is still bound to the NAP system.
//
#define NAP_E_STILL_BOUND      _HRESULT_TYPEDEF_(0x80270005L)


//
// MessageId: NAP_E_NOT_REGISTERED
//
// MessageText:
//
//  The entity is not registered with the NAP system.
//
#define NAP_E_NOT_REGISTERED   _HRESULT_TYPEDEF_(0x80270006L)


//
// MessageId: NAP_E_NOT_INITIALIZED
//
// MessageText:
//
//  The entity is not initialized with the NAP system.
//
#define NAP_E_NOT_INITIALIZED   _HRESULT_TYPEDEF_(0x80270007L)


//
// MessageId: NAP_E_MISMATCHED_ID
//
// MessageText:
//
//  The correlation id in the SoH-Request and SoH-Response do not match up.
//
#define NAP_E_MISMATCHED_ID   _HRESULT_TYPEDEF_(0x80270008L)


//
// MessageId: NAP_E_NOT_PENDING
//
// MessageText:
//
//  Completion was indicated on a request that is not currently pending.
//
#define NAP_E_NOT_PENDING    _HRESULT_TYPEDEF_(0x80270009L)


//
// MessageId: NAP_E_ID_NOT_FOUND
//
// MessageText:
//
//  The NAP component's id was not found.
//
#define NAP_E_ID_NOT_FOUND    _HRESULT_TYPEDEF_(0x8027000AL)


//
// MessageId: NAP_E_MAXSIZE_TOO_SMALL
//
// MessageText:
//
//  The maximum size of the connection is too small for an SoH packet.
//
#define NAP_E_MAXSIZE_TOO_SMALL    _HRESULT_TYPEDEF_(0x8027000BL)


//
// MessageId: NAP_E_SERVICE_NOT_RUNNING
//
// MessageText:
//
//  The NapAgent service is not running.
//
#define NAP_E_SERVICE_NOT_RUNNING    _HRESULT_TYPEDEF_(0x8027000CL)


//
// MessageId: NAP_S_CERT_ALREADY_PRESENT
//
// MessageText:
//
//  A certificate is already present in the cert store
//
#define NAP_S_CERT_ALREADY_PRESENT    _HRESULT_TYPEDEF_(0x0027000DL)

//
// MessageId: NAP_E_ENTITY_DISABLED
//
// MessageText:
//
//  The entity is disabled with the NapAgent service.
//
#define NAP_E_ENTITY_DISABLED    _HRESULT_TYPEDEF_(0x8027000EL)

//
// MessageId: NAP_E_NETSH_GROUPPOLICY_ERROR
//
// MessageText:
//
//  Group Policy is not configured
//
#define NAP_E_NETSH_GROUPPOLICY_ERROR    _HRESULT_TYPEDEF_(0x8027000FL)

//
// MessageId: NAP_E_TOO_MANY_CALLS
//
// MessageText:
//
//  Too many simultaneous calls
//
#define NAP_E_TOO_MANY_CALLS    _HRESULT_TYPEDEF_(0x80270010L)

//
// MessageId: NAP_E_SHV_CONFIG_EXISTED
//
// MessageText:
// 
// SHV configuration already existed
//
#define NAP_E_SHV_CONFIG_EXISTED _HRESULT_TYPEDEF_(0x80270011L)

//
// MessageId: NAP_E_SHV_CONFIG_NOT_FOUND
//
// MessageText:
// 
// SHV configuration is not found
//
#define NAP_E_SHV_CONFIG_NOT_FOUND _HRESULT_TYPEDEF_(0x80270012L)

//
// MessageId: NAP_E_SHV_TIMEOUT
//
// MessageText:
// 
// SHV timed out on the request
//
#define NAP_E_SHV_TIMEOUT _HRESULT_TYPEDEF_(0x80270013L)
#endif // NAPERROR_H

