/*---------------------------------------------------------------------------
   THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
   PARTICULAR PURPOSE

   Copyright (C) 1999 - 2000. Microsoft Corporation. All rights reserved.

   bpsamp.h
   
     Contains declarations for functions and globals that are used
     across all C files in this project.

----------------------------------------------------------------------------*/
void dump_debug_event_info(DEBUG_EVENT *de);
void display_help(void);


BOOL add_thread(DWORD dwThreadID, HANDLE hThread);
BOOL remove_thread(DWORD dwThreadID);
BOOL display_thread_registers(DWORD dwID);

void set_thread_eip_back(DWORD dwThreadID);



BOOL WINAPI control_C_handler(DWORD dwCtrlType);
BOOL do_debug_command(void);
BOOL set_databreakpoint(DWORD dwAddress);
BOOL clear_databreakpoint(void);

BOOL set_codebreakpoint(DWORD dwAddress);
BOOL clear_codebreakpoint(void);

extern BOOL g_fInDbgCmd;

extern BOOL g_fAtCodeBreakpoint;
extern DWORD g_dwCodeAddress;
extern DWORD g_dwCurrentThreadID;

extern HANDLE g_hProcDebuggee;



