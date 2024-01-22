   THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
   PARTICULAR PURPOSE

   Copyright (C) 1999. Microsoft Corporation. All rights reserved.



API demonstrated
================
	GetThreadContext
	SetThreadContext
	CreateRemoteThread
	ReadProcessMemory
	WriteProcessMemory
	CreateProcess with DEBUG_PROCESS flag
	WaitForDebugEvent
	SetConsoleCtrlHandler
	DuplicateHandle

Platform Support
================
Windows NT 4.0, Windows 2000.  X86 Only.

Demonstration
=============
The sample demonstrates the use of SetThreadContext to set the
debug registers of the x86 processor (386 or above) so that an
exception is raised when memory of a process is written to. This
is how debuggers typically implement "break when expression changes"
or "break when data changes".

Also a code breakpoint implementation is demonstrated by writing
an int 3 instruction in the debuggee process address space using
WriteProcessMemory.  It does not implement a "sticky breakpoint".
If you continue executing (hit g for go) after this sample
debugger hits the code breakpoint, the int 3 instruction is
removed.

The sample provides a simple debugging interface (similar to the
CDB.EXE debugger) to debug a process, break into the running process,
continue execution, set and clear a code or data breakpoint.

How to run
==========
To run the example use the following command line:
    bpsamp <exe to debug>  

    for example:  bpsamp notepad.exe


There is a simple command prompt interface that is explained below

How to build
============
To build use the Platform SDK build environment with VC++ and run
nmake.


Background
==========
The need for this sample stems from the fact that in order to
set the thread context, the thread must be stopped by the debugger.
The current SDK samples that demonstrate the debugging API could
not be modified easily to add watchpoint support and would be
an obscure implementation.

Command prompt interface
========================
When a debuggee is executing press Ctrl+C in the debuggee
window to break into the debugger.

When broke in the debugger the command prompt displays "dbg>"
and access the following commands

Setting a code breakpoint
b <addr>     address must be in hex
   for example 
   dbg>b 40114C

Setting a data watchpoint
This watches 4 bytes at this address and will
get an exception when a thread writes at the address
w <addr>
   for example
   dbg>w 40be20
   
Clearing a breakpoint or watchpoint
cb   clears the code breakpoint
cw   clears the data watchpoint

Continue execution
g    go

Windows 9x Support
==================
For the most part this example is functional on
Windows 95 or Windows 98. There are two main reasons why this 
it will not work.
  
  1. The debugger will break into the debugger by creating a
     remote thread in the debuggee to force it to break.
	 CreateRemoteThread is only supported on Windows NT/Win2000.
  2. Control C handling on Win9x will send the Control C event
     to the debuggee before the debugger thus killing the debuggee.

There are ways to implement around this however it detracts from
the sample goal of demonstrating how to set breakpoints.
