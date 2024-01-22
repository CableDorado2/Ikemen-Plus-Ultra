/*---------------------------------------------------------------------------
   THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
   PARTICULAR PURPOSE

   Copyright (C) 1999 - 2000. Microsoft Corporation. All rights reserved.

   main.c
   
     Contains the main routine of this program including the control-C
     handler and the main debug event loop.

----------------------------------------------------------------------------*/
#include <windows.h>
#include <stdio.h>
#include "bpsamp.h"

HANDLE g_hProcDebuggee;

/*----------------------------------------------------------------------------
   main(argc, argv)

  Main only expects a name of an EXE to debug.

  The main routine starts the process as a debuggee by the given EXE name.
  It then continues to execute in a loop waiting for debug events delivered
  by the OS.
----------------------------------------------------------------------------*/

void main(int argc, char **argv)
{
   BOOL fExit = FALSE;
   STARTUPINFO si;
   PROCESS_INFORMATION pi;
   LPSTR lpszCmdLine = NULL;
   DEBUG_EVENT de;
   DWORD dwContinue = 0;
   OSVERSIONINFO osvi;


   if (argc < 2)
   {
      printf("please pass name of exe to debug\n");
      return;

   }

   lpszCmdLine = argv[1];

   osvi.dwOSVersionInfoSize = sizeof(osvi);
   GetVersionEx(&osvi);
   if (osvi.dwPlatformId != VER_PLATFORM_WIN32_NT)
   {
      printf("This sample is only supported on Windows NT\n");
      return;
   }

   // register a control C handler to get user commands
   if (!SetConsoleCtrlHandler(control_C_handler, TRUE))
   {
      printf("FATAL! SetConsoleCtrlHandler failed: %d\n", GetLastError());
      return;
   }


   memset(&si, 0, sizeof(STARTUPINFO));
   si.cb = sizeof(STARTUPINFO);
   if (!CreateProcess(NULL, lpszCmdLine, NULL, NULL, 1, 
        NORMAL_PRIORITY_CLASS | DEBUG_PROCESS, NULL, NULL, &si, &pi))
   {
      printf("CreateProcess(%s) failed: %d.\n", lpszCmdLine, GetLastError() );
      return;
   }

   display_help();


   g_hProcDebuggee = pi.hProcess;
		

   while(!fExit && WaitForDebugEvent(&de, INFINITE))
   {

      dump_debug_event_info(&de);

      dwContinue = DBG_CONTINUE;
      switch(de.dwDebugEventCode)
      {
         case EXCEPTION_DEBUG_EVENT:

         switch (de.u.Exception.ExceptionRecord.ExceptionCode) 
         {
            case EXCEPTION_BREAKPOINT:

               display_thread_registers(de.dwThreadId);

               // if Eip is at the g_dwCodeAddress for
               // the code breakpoint, indicate the the
               // rest of the debugger we are at a code
               // breakpoint.

               if (de.u.Exception.ExceptionRecord.ExceptionAddress ==
                     (LPVOID)g_dwCodeAddress)
               {
                  printf("code breakpoint hit!\n");
                  g_fAtCodeBreakpoint = TRUE;
                  g_dwCurrentThreadID = de.dwThreadId;
               }
               else
               {
                  g_fAtCodeBreakpoint = FALSE;
               }

               fExit = do_debug_command();

               dwContinue = DBG_CONTINUE;

            break;

            case EXCEPTION_SINGLE_STEP:

               display_thread_registers(de.dwThreadId);

               fExit = do_debug_command();
               dwContinue = DBG_CONTINUE;

            break;

            case DBG_CONTROL_C:
            case DBG_CONTROL_BREAK:
               
               
               fExit = do_debug_command();
               dwContinue = DBG_CONTINUE;

            break;


            default:
               dwContinue = DBG_EXCEPTION_NOT_HANDLED;
            break;											
         } 

         break;

         case CREATE_THREAD_DEBUG_EVENT:
            add_thread(de.dwThreadId, de.u.CreateThread.hThread);
         break;

         case CREATE_PROCESS_DEBUG_EVENT:
            add_thread(de.dwThreadId, de.u.CreateProcessInfo.hThread);
         break;

         case EXIT_THREAD_DEBUG_EVENT:
            remove_thread(de.dwThreadId);
         break;

         case EXIT_PROCESS_DEBUG_EVENT: 
               fExit = TRUE;
         break;

         case LOAD_DLL_DEBUG_EVENT:
         break;

         case UNLOAD_DLL_DEBUG_EVENT:		
         break;

         case OUTPUT_DEBUG_STRING_EVENT:
         break;

         case RIP_EVENT:
         break;
         default:  
         break;
      }


      ContinueDebugEvent(de.dwProcessId, de.dwThreadId, dwContinue);

   }  // while(!fExit && WaitForDebugEvent(&de, INFINITE))


}


/*----------------------------------------------------------------------------
   control_C_handler(dwCtrlType)

  dwCtrlType tells the type of event that activated this handler routine.

  TRUE if handled.
  FALSE if not handled.

  This particular Control C handler will create a remote thread in the
  debuggee processes.  While it is not necessary to have a stopped process
  to set code breakpoints (using embedded int 3 opcode) it is necessary
  for data access breakpoints.   This allows the debugger to stop the
  debuggee so that the user can type in a debugging command (ie set a 
  breakpoint).
----------------------------------------------------------------------------*/

BOOL WINAPI control_C_handler(DWORD dwCtrlType)
{
   DWORD dwThreadID = 0;
   HANDLE hThread;


   if ((CTRL_C_EVENT == dwCtrlType) || (CTRL_BREAK_EVENT == dwCtrlType))
   {
      // don't start new debug command threads if one already started
      if (g_fInDbgCmd)
         return TRUE;  
      // to start the command prompt create a thread and 
      // return

      g_fInDbgCmd = TRUE;  // keeps from calling CreateRemoteThread 
                         // multiple times when debugger command thread 
                         // is active
      hThread = CreateRemoteThread(g_hProcDebuggee, NULL, 0, 
         (LPTHREAD_START_ROUTINE)DebugBreak, NULL, 0, &dwThreadID);
      if (hThread == NULL)
      {
         printf("ERROR: CreateRemoteThread failed: %d\n", GetLastError());
         g_fInDbgCmd = FALSE;
      }
      else
      {
         CloseHandle(hThread);
      }


      return TRUE;
   }

   return FALSE;
}