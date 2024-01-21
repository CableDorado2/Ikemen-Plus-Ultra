///////////////////////////////////////////////////////////////////////////////
//
//  File:  Wpc.h
//
//  Comments:
//      This file defines the Windows Parental Controls interfaces and events
//
//  Copyright (C) 2005 Microsoft Corporation  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
#pragma once

#include <WpcApi.h>
#include <WpcEvent.h>

#ifndef E_FILE_NOT_FOUND
#define E_FILE_NOT_FOUND  MAKE_SCODE(SEVERITY_ERROR, FACILITY_WIN32, ERROR_FILE_NOT_FOUND)
#endif

#define FACILITY_WPC    0x999   
#define WPCERR(n) MAKE_SCODE(SEVERITY_ERROR, FACILITY_WPC, n)


