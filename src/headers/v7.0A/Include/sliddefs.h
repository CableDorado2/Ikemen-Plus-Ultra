/*++

Copyright (C) Microsoft Corporation, 2006

Module Name:

    sliddefs.h

Abstract:

    Software Licensing GUID definitions
   
--*/
#pragma once

#ifndef _SLIDDEFS_H_
#define _SLIDDEFS_H_

#if defined(SPP_CODE_PROJECT_MARKER) || defined(SPP_CODE_PROJECT_MARKER_SECURE)
#if !defined(SPP_PUBLISHING_INCLUDED_FROM_TRAMPOLINE) && !defined(SPP_PUBLISHING_USE_FORCE_OFFICIAL)
#error this header file cannot be included directly from SPP projects; use sppinc_* prefix instead.
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifndef _WINDOWS_SLID_
#define _WINDOWS_SLID_
DEFINE_GUID(WINDOWS_SLID, 0x55c92734, 0xd682, 0x4d71, 0x98, 0x3e, 0xd6, 0xec, 0x3f, 0x16, 0x05, 0x9f);
#endif

#ifdef __cplusplus
}
#endif

#endif

