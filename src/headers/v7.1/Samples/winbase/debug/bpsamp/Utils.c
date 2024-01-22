/*---------------------------------------------------------------------------
   THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
   PARTICULAR PURPOSE

   Copyright (C) 1999 - 2000. Microsoft Corporation. All rights reserved.

   utils.c
   
     Contains utility functions that support management of thread
     information for multiple threads of the debuggee, adding and
     remove the breakpoints, and displaying the event information.

----------------------------------------------------------------------------*/
#include <windows.h>
#include <stdio.h>
#include "bpsamp.h"

/*---------------------------------------------------------------------------
    code to manage lists of debuggee threads

    In order for data watchpoints to work, the CPU context of all
    threads in the debuggee process must be set.  Otherwise the debugger
    will catch the data writer of only one thread (the one in which
    the debug registers of its CPU context was set).  We need to manage
    a list of threads as they come and go.

    This list management is simplified in an array of up to 100 threads.
    For an indeterminate number of threads implement a link list.
----------------------------------------------------------------------------*/

typedef struct {
   DWORD dwThreadID;
   HANDLE hThread;
} DBG_THREAD_INFO, *PDBG_THREAD_INFO;

#define MAX_THREADS 100
static DBG_THREAD_INFO dti[MAX_THREADS];

/*---------------------------------------------------------------------------
   add_thread(dwThreadID, hHandle)

  dwThreadID -- thread ID passed to the debugger of a thread created
                in the debuggee
  hHandle --    handle of thread this routine duplicates

  TRUE  if the function succeeds
  FALSE if number of threads added exceeds max.

---------------------------------------------------------------------------*/
BOOL add_thread(DWORD dwThreadID, HANDLE hThread)
{
   DWORD i;

   // find first empty slot
   for (i = 0; i<MAX_THREADS; i++)
   {
      if (dti[i].dwThreadID == 0)
      {
         dti[i].dwThreadID = dwThreadID;

         if (!DuplicateHandle(GetCurrentProcess(),
                  hThread,
                  GetCurrentProcess(),
                  &(dti[i].hThread),
                  THREAD_GET_CONTEXT | THREAD_SET_CONTEXT,
                  FALSE,
                  0))
         {
            printf("add_thread: DuplicateHandle failed: %d\n", 
            GetLastError());
         }

         return TRUE;
      }

   }

   // assume no slot left
   printf("WARNING! tried to add more threads than %d thread in list\n", 
   MAX_THREADS);
   return FALSE;
}


/*---------------------------------------------------------------------------
   remove_thread

  dwThreadID  ID of thread in the list to remove

  returns TRUE if successfully removes thread from list
  returns FALSE if dwThreadID is not found in list.

---------------------------------------------------------------------------*/
BOOL remove_thread(DWORD dwThreadID)
{
   DWORD i;

   // find request thread id
   for (i = 0; i<MAX_THREADS; i++)
   {
      if (dti[i].dwThreadID == dwThreadID)
      {
         dti[i].dwThreadID = 0;
         CloseHandle(dti[i].hThread);
         dti[i].hThread = NULL;
         return TRUE;
      }

   }

   // assume thread ID not found here
   printf("WARNING: request to remove thread %d not found in thread list\n",
   dwThreadID);
   return FALSE;

}


/*---------------------------------------------------------------------------
   display_thread_registers

  dwID  ID of thread for which it's CPU context is displayed

  returns TRUE if ID found and context is displayed
  returns FALSE if ID not found in list or context is not displayed

  Displays registers for a given thread ID.
---------------------------------------------------------------------------*/
BOOL display_thread_registers(DWORD dwID)
{
   DWORD i;
   CONTEXT context;

   // find request thread id
   for (i = 0; i<MAX_THREADS; i++)
   {
      if (dti[i].dwThreadID == dwID)
      {
         context.ContextFlags = CONTEXT_FULL;
         if (!GetThreadContext(dti[i].hThread, &context))
         {
            printf("GetThreadContext failed: %d\n", GetLastError());
            return FALSE;
         }


         printf("eax=%08x ebx=%08x ecx=%08x edx=%08x esi=%08x edi=%08x\n"
                "eip=%08x esp=%08x ebp=%08x\n",
                context.Eax,
                context.Ebx,
                context.Ecx,
                context.Edx,
                context.Esi,
                context.Edi,
                context.Eip,
                context.Esp,
                context.Ebp);

         return TRUE;
      }

   }

   // assume thread ID not found here
   printf("WARNING: request to thread registers for %d not found"
          "in thread list\n", dwID);
   return FALSE;


}

/*---------------------------------------------------------------------------
    code to manipulate EIP

  This function is required because after hitting a code breakpoint,
  in order to continue the EIP must be set back one after restoring
  the original opcode.  Otherwise we continue to execute from the middle
  of an opcode.
---------------------------------------------------------------------------*/

void set_thread_eip_back(DWORD dwThreadID)
{
   HANDLE hThread = NULL;
   int i;
   CONTEXT context;

   for (i=0; i<MAX_THREADS; i++)
   {
      if (dti[i].dwThreadID == dwThreadID)
      {
         hThread = dti[i].hThread;
         break;
      }
   }

   if (hThread == NULL)
   {
      printf("FATAL: cannot find thread %d in thread list to set EIP back\n", dwThreadID);
   }

   context.ContextFlags = CONTEXT_CONTROL;

   GetThreadContext(hThread, &context);
   context.Eip--;
   SetThreadContext(hThread, &context);


}



/*---------------------------------------------------------------------------
    code to set and remove watch point (break on data change) 
----------------------------------------------------------------------------*/


// address of the byte that was replaced with
// an int 3 instruction
DWORD g_dwCodeAddress;  
BYTE  bOpCode;            // original opcode in debuggee
const BYTE X86INT3 = 0xcc;
                       

/// this example is hardcoded to set a debug register to watch
/// when memory changes at a certain address
#define DR7SET   0x000d0101   // exact, local, w, 4 bytes
#define DR7CLEAR 0x00000000

/*---------------------------------------------------------------------------
   setthread_databreakpoint(hThread, dwAddress)

  hThread -- handle of thread for which the debug registers are set
  dwAddress -- address of data to watch

  This sets the CPU context for the given hThread.  The address specifies
  memory in the debuggee process to watch.  The DR7 register is set so
  that if any of the 4 bytes at that address is written to, an exception
  is sent to this debugger.  For more information about the flags in
  the DR7 register please refer to Intel documentation on programming 
  the CPU.
---------------------------------------------------------------------------*/
void setthread_databreakpoint(HANDLE hThread, DWORD dwAddress)
{
   CONTEXT context;

   
   context.ContextFlags = CONTEXT_DEBUG_REGISTERS;

   if (!GetThreadContext(hThread, &context))
   {
      printf("GetThreadContext failed: %d\n", GetLastError());
      return;
   }



   context.Dr0 = dwAddress;
   context.Dr7 = DR7SET;
   context.Dr6 = 0;

   if (!SetThreadContext(hThread, &context))
   {
      printf("SetThreadContext failed: %d\n", GetLastError());
      return;
   }


   if (!GetThreadContext(hThread, &context))
   {
      printf("GetThreadContext failed: %d\n", GetLastError());
      return;
   }


   printf("setthread_databreakpoint set Dr0 = %08X, Dr7 = %08X\n", 
   context.Dr0, context.Dr7);

}


/*---------------------------------------------------------------------------
   clearthread_databreakpoint(hThread)

  hThread   handle to thread for which the CPU context is set

  This routine clear the DR7 register for the CPU context of the given
  thread.
---------------------------------------------------------------------------*/
void clearthread_databreakpoint(HANDLE hThread)
{
   CONTEXT context;


   context.ContextFlags = CONTEXT_DEBUG_REGISTERS;

   if (!GetThreadContext(hThread, &context))
   {
      printf("GetThreadContext failed: %d\n", GetLastError());
      return;
   }



   context.Dr0 = 0;
   context.Dr7 = DR7CLEAR;

   if (!SetThreadContext(hThread, &context))
   {
      printf("SetThreadContext failed: %d\n", GetLastError());
      return;
   }


   if (!GetThreadContext(hThread, &context))
   {
      printf("GetThreadContext failed: %d\n", GetLastError());
      return;
   }


   printf("clearthread_databreakpoint -- Dr0 = %08X, Dr7 = %08X\n", 
   context.Dr0, context.Dr7);

}




/*---------------------------------------------------------------------------
   set_databreakpoint(dwAddress)

  dwAddress  Address of data to watch

  return TRUE

  This routine will call the supporting routine to set the CPU context for
  all threads in the debuggee process. In this case for setting the DR0 and
  DR7 registers to watch for data writing from any thread.
---------------------------------------------------------------------------*/
BOOL set_databreakpoint(DWORD dwAddress)
{
   DWORD i;

   // need to iterate through each thread ID
   // and set the thread context to set the debug
   // threads
   for (i=0; i<MAX_THREADS; i++)
   {
      if (dti[i].dwThreadID)
      {
         setthread_databreakpoint(dti[i].hThread, dwAddress);
      }

   }

   return TRUE;
}


/*---------------------------------------------------------------------------
   clear_databreakpoint

  returns TRUE

  This routine will call the supporting routine to set the CPU context for
  all threads in the debuggee process.  In this case for clearing the DR0
  and DR7 debug registers.
---------------------------------------------------------------------------*/
BOOL clear_databreakpoint(void)
{
   DWORD i;

   // need to iterate through each thread ID
   // and set the thread context to set the debug
   // threads
   for (i=0; i<MAX_THREADS; i++)
   {
      if (dti[i].dwThreadID)
      {
         clearthread_databreakpoint(dti[i].hThread);
      }

   }


   return TRUE;
}


/*---------------------------------------------------------------------------
    code to set and remove code breakpoints
----------------------------------------------------------------------------*/



/*---------------------------------------------------------------------------
   set_codebreakpoint

  dwAddress   address in debuggee process of where to write int 3 opcode

  returns TRUE if opcode written to address
  returns FALSE if opcode failed to be written to address

  This reads the debuggee process memory to get the original opcode to
  restore it when clearing the breakpoint.  Also, in a "real debugger" you
  would restore the opcode or use the opcode when disassembly.  The 
  disassembler should not show int 3 where the bp is at.

  To put the breakpoint in the code this routine writes 0xCC (opcode for
  int 3 instruction).
---------------------------------------------------------------------------*/
BOOL set_codebreakpoint(DWORD dwAddress)
{
   DWORD cbBytes;

   // read the original opcode of where we want to set an int 3 instruction   
   if (!ReadProcessMemory(g_hProcDebuggee, 
                         (LPCVOID)dwAddress, 
                         (LPVOID)&bOpCode, 1, &cbBytes))
   {
      printf("ReadProcessMemory failed: %d\n", GetLastError());
      return FALSE;
   }

   if (!WriteProcessMemory(g_hProcDebuggee, 
                          (LPVOID)dwAddress, 
                          (LPVOID)&X86INT3, 1, &cbBytes)) 
   {
      printf("ReadProcessMemory failed: %d\n", GetLastError());
      return FALSE;
   }

   g_dwCodeAddress = dwAddress;
   printf("Breakpoint set at %08X\n", g_dwCodeAddress);
   return TRUE;
}


/*--------------------------------------------------------------------------
   clear_codebreakpoint


  returns TRUE  if function succees
  returns FALSE if failure to write to the process memory
                if a code breakpoint was not previously set

  This function restores the original opcode to the debuggee process.
---------------------------------------------------------------------------*/
BOOL clear_codebreakpoint(void)
{
   DWORD cbBytes;

   if (g_dwCodeAddress == 0)
   {
      printf("no code breakpoint to clear\n");
      return FALSE;
   }

   if (!WriteProcessMemory(g_hProcDebuggee, 
                          (LPVOID)g_dwCodeAddress, 
                          (LPVOID)&bOpCode, 1, &cbBytes)) 
   {
      printf("ReadProcessMemory failed: %d\n", GetLastError());
      return FALSE;
   }

   g_dwCodeAddress = 0;   

   return TRUE;

}



/*---------------------------------------------------------------------------
    code that dumps debug events to stdout
----------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------
   dump_debug_event_info(de)

  de   pointer to DEBUG_EVENT structure

  This function displays what debug event the debugger receives.
---------------------------------------------------------------------------*/
void dump_debug_event_info(DEBUG_EVENT *de)
{

   switch(de->dwDebugEventCode)
   {
      case EXCEPTION_DEBUG_EVENT:
         printf("%d: EXCEPTION_DEBUG_EVENT\n", de->dwThreadId);

         switch (de->u.Exception.ExceptionRecord.ExceptionCode) 
         {
            case EXCEPTION_ACCESS_VIOLATION:
               printf("\tEXCEPTION_ACCESS_VIOLATION\n");
            break;

            case EXCEPTION_DATATYPE_MISALIGNMENT:
               printf("\tEXCEPTION_DATATYPE_MISALIGNMENT\n");
            break;

            case EXCEPTION_BREAKPOINT:   
               printf("\tEXCEPTION_BREAKPOINT\n");
            break;

            case EXCEPTION_SINGLE_STEP:             
               printf("\tEXCEPTION_SINGLE_STEP\n");
            break;

            case EXCEPTION_ARRAY_BOUNDS_EXCEEDED:   
               printf("\tEXCEPTION_ARRAY_BOUNDS_EXCEEDED\n");
            break;

            case EXCEPTION_FLT_DENORMAL_OPERAND:    
               printf("\tEXCEPTION_FLT_DENORMAL_OPERAND\n");
            break;

            case EXCEPTION_FLT_DIVIDE_BY_ZERO:      
               printf("\tEXCEPTION_FLT_DIVIDE_BY_ZERO\n");
            break;

            case EXCEPTION_FLT_INEXACT_RESULT:      
               printf("\tEXCEPTION_FLT_INEXACT_RESULT\n");
            break;

            case EXCEPTION_FLT_INVALID_OPERATION:   
               printf("\tEXCEPTION_FLT_INVALID_OPERATION\n");
            break;

            case EXCEPTION_FLT_OVERFLOW:            
               printf("\tEXCEPTION_FLT_OVERFLOW\n");
            break;

            case EXCEPTION_FLT_STACK_CHECK:         
               printf("\tEXCEPTION_FLT_STACK_CHECK\n");
            break;

            case EXCEPTION_FLT_UNDERFLOW:           
               printf("\tEXCEPTION_FLT_UNDERFLOW\n");
            break;

            case EXCEPTION_INT_DIVIDE_BY_ZERO:      
               printf("\tEXCEPTION_INT_DIVIDE_BY_ZERO\n");
            break;

            case EXCEPTION_INT_OVERFLOW:            
               printf("\tEXCEPTION_INT_OVERFLOW\n");
            break;

            case EXCEPTION_PRIV_INSTRUCTION:        
               printf("\tEXCEPTION_PRIV_INSTRUCTION\n");
            break;

            case EXCEPTION_IN_PAGE_ERROR:           
               printf("\tEXCEPTION_IN_PAGE_ERROR\n");
            break;

            case EXCEPTION_ILLEGAL_INSTRUCTION:     
               printf("\tEXCEPTION_ILLEGAL_INSTRUCTION\n");
            break;

            case EXCEPTION_NONCONTINUABLE_EXCEPTION:
               printf("\tEXCEPTION_NONCONTINUABLE_EXCEPTION\n");
            break;

            case EXCEPTION_STACK_OVERFLOW:          
               printf("\tEXCEPTION_STACK_OVERFLOW\n");
            break;

            case EXCEPTION_INVALID_DISPOSITION:     
               printf("\tEXCEPTION_INVALID_DISPOSITION\n");
            break;

            case EXCEPTION_GUARD_PAGE:              
               printf("\tEXCEPTION_GUARD_PAGE\n");
            break;

            case EXCEPTION_INVALID_HANDLE:          
               printf("\tEXCEPTION_INVALID_HANDLE\n");
            break;

            case CONTROL_C_EXIT:                    
               printf("\tCONTROL_C_EXIT\n");
            break;

            case DBG_CONTROL_C:
               printf("\tDBG_CONTROL_C\n");
            break;

            case DBG_CONTROL_BREAK:
               printf("\tDBG_CONTROL_BREAK\n");
            break;

            default:
               printf("\tUnknown exception raised: %08X\n", 
               de->u.Exception.ExceptionRecord.ExceptionCode);
            break;											
         } 

      break;

      case CREATE_THREAD_DEBUG_EVENT:
         printf("%d: CREATE_THREAD_DEBUG_EVENT.\n", de->dwThreadId);
      break;

      case CREATE_PROCESS_DEBUG_EVENT:
         printf("%d: CREATE_PROCESS_DEBUG_EVENT\n", de->dwThreadId);
      break;

      case EXIT_THREAD_DEBUG_EVENT:
         printf("%d: EXIT_THREAD_DEBUG_EVENT\n", de->dwThreadId);
      break;

      case EXIT_PROCESS_DEBUG_EVENT:
         printf("%d: EXIT_PROCESS_DEBUG_EVENT\n", de->dwThreadId);
      break;

      case LOAD_DLL_DEBUG_EVENT:
         printf("%d: LOAD_DLL_DEBUG_EVENT\n", de->dwThreadId);
      break;

      case UNLOAD_DLL_DEBUG_EVENT:		
         printf("%d: UNLOAD_DLL_DEBUG_EVENT\n", de->dwThreadId);
      break;

      case OUTPUT_DEBUG_STRING_EVENT:
         printf("%d: OUTPUT_DEBUG_STRING_EVENT\n", de->dwThreadId);
      break;

      case RIP_EVENT:
         printf("%d: RIP_EVENT\n", de->dwThreadId);
      break;

      default:  // we should never get here
         printf("%d: de.dwDebugEventCode default case %08X\n", 
         de->dwThreadId, de->dwDebugEventCode);
      break;
   }

}
