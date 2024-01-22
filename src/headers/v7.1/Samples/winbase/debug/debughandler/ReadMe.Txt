DebugHandler Sample
===================

This sample demonstrates how an application can set itself as a system
debugger and use Debugging APIs to trace an unhandled exception in a
Win32 application for post mortem analysis similar to 32-bit Dr. Watson
tool on Windows NT. The DebugHandler is a simplified version of a debugger
sample that has been tailored to demonstrate the debugging usage on Windows
NT as well as Windows 95/98 platforms. This utility takes the following
command line parameters.

-p %ld -e %ld

similar to other post mortem debuggers.

The unhandled exception filter function of the system will spawn
the system debugger with
(a) -p the process id of the debuggee and
(b) -e the event handle to be signaled for continuing the debuggee after
receiving the exception breakpoint debug event in the debugger.

If the command line parameter is -i, then the debugHandler.exe will be
installed as the system debugger.

DebugHandler.exe
----------------
It is possible to have the system spawn a debugger whenever a Win32
application faults. This capability is controlled by the following
Registry key on Windows NT:

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug

This key contains the following entries:

   Auto
   Debugger

These entries are also available on Windows 95/98. However, on
Windows 95/98, they are contained in the win.ini file instead of
the registry.  The section [aedebug] has entries that are similar
to these registry values.

If the value of Auto is set to "0" (zero), then the system will generate
a pop-up window, and if the user chooses Cancel, spawn the debugger that
is specified in the Debugger value. If the value of Auto is set to "1",
then the system will automatically spawn the debugger that is specified
in the Debugger value.

After installing Windows NT,

(a) The Debugger value is set to DRWTSN32 -p %ld -e %ld -g
(b) The Auto value is set to 1.

If the Win32 SDK is installed,

(a) The Debugger value is changed to C:\MSSDK\BIN\WINDBG -p %ld -e %ld
(b) The Auto value is set to 0.

Microsoft Visual C++ Version 6.0 makes the following entry for the
Debugger value:

"D:\Program Files\Microsoft Visual Studio\Common\MSDev98\Bin\msdev.exe"
    -p %ld -e %ld

If we want to spawn DebugHandler as the system debugger, the Debugger
value needs to be changed to

"C:\MSSDK\SAMPLES\WINBASE\WINNT\DEBUG\DebugHandler.exe" -p %ld -e %ld

The DebugHandler sample is similar in functionality to DRWTSN32
post-mortem debugger and generates a log file containing fault
information about the offending application. But only the stack
trace of the thread that caused the exception in the debuggee is
generated in the log file. This data is stored in a log file named
DebugHandler.LOG, which by default is placed in the Windows directory.
This sample will work on Windows NT as well as on Windows 95/98
platforms.

Building DebugHandler.exe
----------------------------
Use nmake from the command line.  The makefile for this sample
creates DebugHandler.exe with debug information.

Usage notes
--------------
The sample code does the following.

(a) Demonstrates how an application can process the command
    line parameters as a system debugger and attach to a faulting
    debuggee process using the debugging APIs. This sample can be
    used on Windows 95/98 as well as Windows NT platforms.

(b) Demonstrates how an application can load the symbolic information
    of the corresponding executable and DLL modules of the debuggee
    when the debugger receives the debug events.

(c) Demonstrates how the system debugger continues the debuggee by
    setting the corresponding event handle passed as the parameter.

THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.

Copyright (C) 1999.  Microsoft Corporation.  All rights reserved.
