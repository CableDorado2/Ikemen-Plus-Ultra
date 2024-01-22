/*---------------------------------------------------------------------------
   THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
   PARTICULAR PURPOSE

   Copyright (C) 1999 - 2000. Microsoft Corporation. All rights reserved.

   dbgcmd.c
   
     Contains a simple debugger command parser.
     This debugger only supports setting one code breakpoint and
     one data watchpoint.  The code is simplified to demonstrate
     how to set these type of breakpoint, not be a general purpose
     debugger. Use the Windows 2000 debugger tools (NTSD or CDB) for
     you debugging needs.

----------------------------------------------------------------------------*/
#include <windows.h>
#include <stdio.h>
#include <conio.h>
#include "bpsamp.h"



#define BPITEM_WATCHPOINT 1
#define BPITEM_BREAKPOINT 2
typedef struct {
   DWORD dwAddress;   // address to set breakpoint at
   DWORD dwBPType;    // which breakpoint to clear
} CMD_ARGS, *PCMD_ARGS;

static CMD_ARGS cmd_args;

#define DBGCMD_UNKNOWN      -1
#define DBGCMD_QUIT         1
#define DBGCMD_GO           2
#define DBGCMD_WATCHPOINT   3
#define DBGCMD_BREAKPOINT   4
#define DBGCMD_CLEARBP      5
#define DBGCMD_SHOWHELP     6

BOOL g_fInDbgCmd = FALSE;  // so that we don't create multiple 
                           // debugger threads
BOOL g_fAtCodeBreakpoint = FALSE;
DWORD g_dwCurrentThreadID = 0;

DWORD parse_command(char *szCmd, PCMD_ARGS pcmd_args);
char szCmd[0x1000];

/*---------------------------------------------------------------------------
   do_debug_command

  TRUE - means exit the debugger (this program)
  FALSE - continue executing program after executing the command

  This return interprets the command typed in by the user at the command
  prompt (obtained by the gets function call) and executes the command.  
  The text input is parsed by parse_command and then interpreted by the 
  switch statement in this routine.

  DBGCMD_QUIT          -- quits the debugger
  DBGCMD_GO            -- continues executing the debuggee
  DBGCMD_WATCHPOINT    -- sets a watchpoint (data access breakpoint)
  DBGCMD_BREAKPOINT    -- sets a code breakpoint
  DBGCMD_CLEARBP       -- clears a breakpoint
  DBGCMD_SHOWHELP      -- displays user help

---------------------------------------------------------------------------*/

BOOL do_debug_command(void)
{
   DWORD dwCmd;



   while (TRUE)
   {
      printf("dbg>");
      if (!fgets(szCmd, sizeof(szCmd), stdin))
      {
          // unable to read input, quit
          g_fInDbgCmd = FALSE;
          return TRUE;
      }

      dwCmd = parse_command(szCmd, &cmd_args);

      switch(dwCmd)
      {
      case DBGCMD_QUIT:
         g_fInDbgCmd = FALSE;
         return TRUE;  // means quit debugger
         break;

      case DBGCMD_WATCHPOINT:
         set_databreakpoint(cmd_args.dwAddress);
         break;

      case DBGCMD_BREAKPOINT:
         set_codebreakpoint(cmd_args.dwAddress);
         break;

      case DBGCMD_CLEARBP:

         if (cmd_args.dwBPType == BPITEM_WATCHPOINT)
            clear_databreakpoint();

         if (cmd_args.dwBPType == BPITEM_BREAKPOINT)
            clear_codebreakpoint();
            
         break;

      case DBGCMD_GO:

         // in order to continue from a code breakpoint
         // we must clear the breakpoint (restore the
         // original opcode) before continuing.

         // an implementation of "sticky breakpoints"
         // is much more complex.

         if (g_fAtCodeBreakpoint)
         {

            clear_codebreakpoint();
            set_thread_eip_back(g_dwCurrentThreadID);
         }

         g_fInDbgCmd = FALSE;
         return FALSE; // means do not quit debugger
         break;

      case DBGCMD_SHOWHELP:
         display_help();
         break;
      case DBGCMD_UNKNOWN:
         printf("unknown command\n");
         break;

      default:
         printf("do_debug_command: should never get here\n");
         break;

      }

   }

   g_fInDbgCmd = FALSE;
   return FALSE;  // should not get here

}



/*---------------------------------------------------------------------------
   parse_command

  szCmd -- text command typed in by the user at the command prompt
  pcmd_args -- packet of arguments interpreted

  Returns a code that indicates why type of command was added.
  See comments for do_debug_command.

  The following commands are supported
  ?         displays help
  b <addr>  sets a code breakpoint
  cb        clears the code breakpoint
  cw        clears the data watchpoint
  g         continues debuggee execution
  q         quits the debugger program
  w <addr>  sets the data watchpoint
---------------------------------------------------------------------------*/

DWORD parse_command(char *szCmd, PCMD_ARGS pcmd_args)
{
   char *ptr;

   // swallow any leading spaces
   ptr = szCmd;
   while (' ' == *ptr)
      ptr++;

   // we found the go command 
   if (('g' == *ptr) || ('G' == *ptr))
      return DBGCMD_GO;

   // quit command
   if (('q' == *ptr) || ('Q' == *ptr))
      return DBGCMD_QUIT;
   
   // set watchpoint
   // w XXXXXXXX address 
   if (('w' == *ptr) || ('W' == *ptr))
   {
      char *stopstring;

      ptr++;
      pcmd_args->dwAddress = strtoul( ptr, &stopstring, 16 );

      if (pcmd_args->dwAddress == 0)
      {
         printf("cannot set watchpoint at address 0\n");
         return DBGCMD_UNKNOWN;
      }

      
      return DBGCMD_WATCHPOINT;
   }

   // set breakpoint
   // b XXXXXXXX address
   if (('b' == *ptr) || ('B' == *ptr))
   {
      char *stopstring;   // for strtoul

      ptr++;
      pcmd_args->dwAddress = strtoul( ptr, &stopstring, 16 );

      if (pcmd_args->dwAddress == 0)
      {
         printf("cannot set watchpoint at address 0\n");
         return DBGCMD_UNKNOWN;
      }


      return DBGCMD_BREAKPOINT;
   }

   // clear breakpoints
   // either cw or cb
   if (('c' == *ptr) || ('C' == *ptr))
   {
      ptr++;
      if (('w' == *ptr) || ('W' == *ptr))
      {
         pcmd_args->dwBPType = BPITEM_WATCHPOINT; 
         return DBGCMD_CLEARBP;
      }

      if (('b' == *ptr) || ('B' == *ptr))
      {
         pcmd_args->dwBPType = BPITEM_BREAKPOINT; 
         return DBGCMD_CLEARBP;
      }


      return DBGCMD_UNKNOWN;
   }

   // for displaying help
   if ('?' == *ptr)
   {
      return DBGCMD_SHOWHELP;
   }


   return DBGCMD_UNKNOWN;

}

/*---------------------------------------------------------------------------
   display_help


  Displays help information.
---------------------------------------------------------------------------*/

void display_help(void)
{
   printf("b <addr>        sets a breakpoint in code at addr\n");
   printf("w <addr>        sets a data watchpoint at addr\n");
   printf("cb              clears the code breakpoint\n");
   printf("cw              clears the data watchpoint\n");
   printf("g               go\n");
   printf("q               quits the debugger\n");
   printf("?               displays this help\n");

   printf("\n\n");
   printf("To break into the running debuggee, press Ctrl+C\n");
   printf("\n");
}
