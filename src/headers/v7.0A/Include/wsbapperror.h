/*--

 Copyright (C) 2007 Microsoft Corporation

 Module Name:

     wsbapperror.h

 Abstract:

     This module contains the specific error codes returned by
     the COM interfaces implemented by the application to integrate 
     with Windows Server Backup

 --*/

#ifndef _WSBAPPERROR_H
#define _WSBAPPERROR_H

#define SEVERITY_OF(code)          ((code>>30) & 0x00000003)
#define FACILITY_OF(code)          ((code>>16) & 0x00000FFF)

//
//  Values are 32 bit values laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//
#define FACILITY_WSBAPP                  0x7A


//
// Define the severity codes
//
#define STATUS_SEVERITY_WARNING          0x2
#define STATUS_SEVERITY_SUCCESS          0x0
#define STATUS_SEVERITY_INFORMATIONAL    0x1
#define STATUS_SEVERITY_ERROR            0x3


//
// MessageId: WSBAPP_E_COMPONENT_CONSISTENCY_CHECK_FAILED
//
// MessageText:
//
// The component consistency check failed.
//
#define WSBAPP_E_COMPONENT_CONSISTENCY_CHECK_FAILED ((HRESULT)0x807A0001L)

//
// MessageId: WSBAPP_E_COMPONENT_PRE_RESTORE_FAILED
//
// MessageText:
//
// The pre-restore steps for the component failed.
//
#define WSBAPP_E_COMPONENT_PRE_RESTORE_FAILED ((HRESULT)0x807A0002L)

//
// MessageId: WSBAPP_E_COMPONENT_POST_RESTORE_FAILED
//
// MessageText:
//
// The post-restore steps for the component failed.
//
#define WSBAPP_E_COMPONENT_POST_RESTORE_FAILED ((HRESULT)0x807A0003L)

//
// MessageId: WSBAPP_ASYNC_IN_PROGRESS
//
// MessageText:
//
// An asynchronous operation is in progress.
//
#define WSBAPP_ASYNC_IN_PROGRESS         ((HRESULT)0x407A0004L)

#endif // _WSBAPPERROR_H

