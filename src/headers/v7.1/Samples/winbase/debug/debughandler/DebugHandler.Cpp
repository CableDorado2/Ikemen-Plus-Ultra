/*----------------------------------------------------------------
* THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
* ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
* THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
* PARTICULAR PURPOSE.
*
* Copyright (c) Microsoft Corporation.  All Rights Reserved.

DebugHandler.cpp

This file implements a command line utility that shows how to use
Debugging API to trace an unhandled exception in a Win32 application
as a post mortem debugger.
--------------------------------------------------------------------*/

#include <windows.h>
#include <stdio.h>
#include <dbghelp.h>
#include <tlhelp32.h>

void  InstallDebugger();
DWORD DispatchDebugEventThread(DWORD pid, HANDLE hEvent);
DWORD LogStackWalk(HANDLE fh,
                   HANDLE hProcess,
                   HANDLE hThread,
                   DWORD exceptionAddress);

#define MAX_THREADS   1024

/*  InstallDebugger installs the debugHandler.exe as a system debugger.
This capability is controlled by the following registry key on
Windows NT:

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
*/
void InstallDebugger()
{
    OSVERSIONINFO   osver;
    char            Auto[3] = "0";
    char            Debugger[MAX_PATH + 64];

    Debugger[0] = '\"';

    /* Get the full path to the executable name */
    if (!GetModuleFileName(NULL, &Debugger[1], MAX_PATH))
    {
        printf("GetModuleFileName failed with error code : %d\n",
            GetLastError());
        Debugger[1] = '.';
        Debugger[2] = 0;
    }

	strcat_s(Debugger, ARRAYSIZE(Debugger), "\"");

    /* Add -p and -e command line options */
	strcat_s(Debugger, ARRAYSIZE(Debugger), " -p %ld -e %ld");

    /* Check to see if we are running under Windows 9x or Windows NT */
    osver.dwOSVersionInfoSize = sizeof(osver);
    if (!GetVersionEx(&osver))
    {
        printf("GetVersionEx failed with error code : %d\n",
            GetLastError());
        return;
    }

    if (osver.dwPlatformId == VER_PLATFORM_WIN32_NT)
    {
        /* On Windows NT, create registry values under AeDebug */
        HKEY hRegKey;
        LONG lResult;

        lResult = RegOpenKeyEx(HKEY_LOCAL_MACHINE,
            "SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\AeDebug",
            0,
            KEY_SET_VALUE,
            &hRegKey);
        if (lResult != ERROR_SUCCESS)
        {
            printf("RegOpenKeyEx failed with error code : %d\n",
                lResult);
            return;
        }
        lResult = RegSetValueEx(hRegKey,
            "Auto",
            0,
            REG_SZ,
            (LPBYTE)Auto,
            2);
        if (lResult != ERROR_SUCCESS)
        {
            printf("RegSetValueEx failed with error code : %d\n",
                lResult);
        }

        lResult = RegSetValueEx(hRegKey,
            "Debugger",
            0,
            REG_SZ,
            (LPBYTE)Debugger,
            (DWORD)strnlen(Debugger, ARRAYSIZE(Debugger)) + 1);
        if (lResult != ERROR_SUCCESS)
        {
            printf("RegSetValueEx failed with error code : %d\n",
                lResult);
        }

        RegCloseKey(hRegKey);
    }
    else if (osver.dwPlatformId == VER_PLATFORM_WIN32_WINDOWS)
    {
        /* On Windows 9x, create appropriate section values in win.ini */
        if (!WritePrivateProfileString("AeDebug",
									   "Auto",
             						   Auto,
									   "win.ini"))
        {
            printf("WritePrivateProfileString failed with error code : %d\n",
                GetLastError());
        }

        if (!WritePrivateProfileString("AeDebug",
									   "Debugger",
									   Debugger,
									   "win.ini"))
        {
            printf("WritePrivateProfileString failed with error code : %d\n",
                GetLastError());
        }
    }
}

/* DispatchDebugEventThread attaches to a debuggee and waits for the
debug events as a debugger using the debugging APIs. This function
assumes a maximum of 1024 threads or 1024 child processes created by
the debuggee process */
DWORD DispatchDebugEventThread(DWORD pid, HANDLE hEvent)
{
    HANDLE hProcess = NULL;

    DWORD  dwThreadId[MAX_THREADS];
    HANDLE hThread[MAX_THREADS];

    DEBUG_EVENT   de;
    DWORD         ContinueStatus;
    int           i;
    char          logFile[MAX_PATH + 64];
    BOOL          rc;
    DWORD64       base;
	HANDLE        fh = INVALID_HANDLE_VALUE;

    /* Get the Windows directory for creating the log file */
    logFile[0] = 0;
    if(!GetWindowsDirectory(logFile, MAX_PATH))
    {
        // GetWindowsDirectory Failed
        return 0;
    }


    if (logFile[0])
    {
        strcat_s(logFile, ARRAYSIZE(logFile), "\\DebugHandler.log");
		fh = CreateFile(logFile, 
			            GENERIC_WRITE,
				        FILE_SHARE_WRITE,
				        NULL,
				        OPEN_ALWAYS,
				        0,
				        0);
        if (fh == INVALID_HANDLE_VALUE) return 0;
    }
    else
        return 0;

    /* Attach to the debuggee process */
    if (!DebugActiveProcess(pid))
    {
        CloseHandle(fh);
        fh = 0;
        return 0;
    }

    ZeroMemory(hThread, sizeof(hThread));
    ZeroMemory(dwThreadId, sizeof(dwThreadId));

    while (TRUE)
    {
        /* Wait for a debug event */
        if (!WaitForDebugEvent(&de, 10000))
        {
            goto exit;
        }
        ContinueStatus = DBG_CONTINUE;

        switch (de.dwDebugEventCode)
        {
        case EXCEPTION_DEBUG_EVENT:
            /* The debugger process first initiates a breakpoint
            in the debuggee. When this breakpoint debug event
            is received by the debugger, we can set the event
            handle here and break from the case to continue
            the debuggee. When the debuggee continues, we will
            get an exception debug event for the thread in the
            debuggee. This event will be the exception that is
            unhandled by the corresponding thread in the
            debuggee */
            if (de.u.Exception.ExceptionRecord.ExceptionCode
                == EXCEPTION_BREAKPOINT)
            {
                if (hEvent)
                {
                    SetEvent(hEvent);
                }
                break;
            }
            ContinueStatus = DBG_EXCEPTION_NOT_HANDLED;

            /* Search and find the handle to the thread
            corresponding to the thread id. Then call
            LogStackWalk for dumping the exception
            stack trace of the corresponding thread
            in the debuggee process */
            for (i = 0; i < MAX_THREADS; i++)
            {
                if (dwThreadId[i] != de.dwThreadId) continue;
                LogStackWalk(fh,
                    hProcess,
                    hThread[i],
                    (DWORD)(UINT_PTR)(de.u.Exception.ExceptionRecord.ExceptionAddress));
                break;
            }
            break;

        case CREATE_THREAD_DEBUG_EVENT:
            /* Store the thread handle and the thread id to be
            used later in the EXCEPTION_DEBUG_EVENT */
            for (i = 0; i < MAX_THREADS; i++)
            {
                if (dwThreadId[i]) continue;
                dwThreadId[i] = de.dwThreadId;
                hThread[i] = de.u.CreateThread.hThread;
                break;
            }
            break;

        case CREATE_PROCESS_DEBUG_EVENT:
            /* Store the process handle to be used later in the
            EXCEPTION_DEBUG_EVENT. Also the primary thread
            handle and the corresponding thread id can be
            stored here */

            hProcess = de.u.CreateProcessInfo.hProcess;

            /* We can initialize Symbol Handler functions of
            dbghelp here and load the symbolic information
            of the executable module */

            rc = SymInitialize(hProcess, 0, FALSE);
            if (!rc)
            {
                printf("Error 0x%x calling SymInitialize()\n", GetLastError());
                break;
            }
            base = SymLoadModuleEx(hProcess,
                de.u.CreateProcessInfo.hFile,
                0,
                0,
                0,
                0,
                NULL,
                0);
            if (!base)
            {
                printf("Error 0x%x calling SymLoadModule(%s)\n",
                    GetLastError(),
                    de.u.CreateProcessInfo.hFile);
                break;
            }
            for (i = 0; i < MAX_THREADS; i++)
            {
                if (dwThreadId[i]) continue;
                dwThreadId[i] = de.dwThreadId;
                hThread[i] = de.u.CreateProcessInfo.hThread;
                break;
            }
            break;

        case EXIT_THREAD_DEBUG_EVENT:
            /* Remove the thread handle and the thread id from
            our data structures */
            for (i = 0; i < MAX_THREADS; i++)
            {
                if (dwThreadId[i] != de.dwThreadId) continue;
                dwThreadId[i] = 0;
                hThread[i] = 0;
                break;
            }
            break;

        case EXIT_PROCESS_DEBUG_EVENT:
            /* Remove the thread handle and the thread id from
            our data structures */

            /* We can also cleanup Symbol Handler functions of
            dbghelp here */

            SymCleanup(hProcess);
            hProcess = NULL;

            for (i = 0; i < MAX_THREADS; i++)
            {
                if (dwThreadId[i] != de.dwThreadId) continue;
                dwThreadId[i] = 0;
                hThread[i] = 0;
                break;
            }
            goto exit;
            break;

        case LOAD_DLL_DEBUG_EVENT:
            /* Load the symbolic information of the corresponding
            DLL module */
            base = SymLoadModuleEx(hProcess,
                de.u.LoadDll.hFile,
                0,
                0,
                0,
                0,
                NULL,
                0);
            if (!base)
                printf("Error 0x%x calling SymLoadModule(%s)\n",
                GetLastError(),
                de.u.CreateProcessInfo.hFile);
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
        ContinueDebugEvent(de.dwProcessId, de.dwThreadId, ContinueStatus);
    }

exit:
    CloseHandle(fh);
    fh = INVALID_HANDLE_VALUE;
    return 0;
}

BOOL
__stdcall
ReadProcessMemory64(
                    HANDLE      hProcess,
                    DWORD64     qwBaseAddress,
                    PVOID       lpBuffer,
                    DWORD       nSize,
                    LPDWORD     lpNumberOfBytesRead
                    )
{
    return ReadProcessMemory(hProcess,
        (LPCVOID)(ULONG_PTR)qwBaseAddress,
        lpBuffer,
        nSize,
        lpNumberOfBytesRead);
}

/* LogStackWalk function to use dbghelp API for dumping the stack trace
of the corresponding exception in a debuggee thread */

DWORD LogStackWalk(HANDLE fh,
                   HANDLE hProcess,
                   HANDLE hThread,
                   DWORD exceptionAddress)
{
    DWORD64           dwDisplacement = 0;
    DWORD             frames = 0;
    LPSTR             szSymName;
    IMAGEHLP_MODULE64 mi;
    DWORD             machType;
    CONTEXT           Context;
    STACKFRAME64      stk;
    char              buffer[1024];
	char              sz[1024];
	DWORD			  cb;

    PIMAGEHLP_SYMBOL64  sym = (PIMAGEHLP_SYMBOL64)buffer;

    /* Get the thread context of hThread for calling StackWalk */
    Context.ContextFlags = CONTEXT_FULL;
    if (!GetThreadContext(hThread, &Context))
    {
        sprintf_s(sz, sizeof(sz) / sizeof(sz[0]), "GetThreadContext returned error code : %d\n",
            GetLastError());
		WriteFile(fh, sz, (DWORD)strlen(sz), &cb, 0);
        return EXCEPTION_EXECUTE_HANDLER;
    }
    ZeroMemory(&stk, sizeof(stk));

    machType = IMAGE_FILE_MACHINE_I386;
    stk.AddrPC.Offset       = exceptionAddress;
    stk.AddrPC.Mode         = AddrModeFlat;
    stk.AddrStack.Offset    = Context.Esp;
    stk.AddrStack.Mode      = AddrModeFlat;
    stk.AddrFrame.Offset    = Context.Ebp;
    stk.AddrFrame.Mode      = AddrModeFlat;

    memset(buffer, 0, sizeof(buffer));
    sym->SizeOfStruct = sizeof(IMAGEHLP_SYMBOL);
    sym->MaxNameLength = sizeof(buffer) - sizeof(IMAGEHLP_SYMBOL);

    /* Call StackWalk to retrieve all the stack frames */
    while (StackWalk64(machType,
        hProcess,
        hThread,
        &stk,
        &Context,
        ReadProcessMemory64,
        SymFunctionTableAccess64,
        SymGetModuleBase64,
        0) && stk.AddrPC.Offset)
    {
        sym->Address = stk.AddrPC.Offset;
        dwDisplacement = 0;

        /* Get the function name corresponding to the code address */
        if (SymGetSymFromAddr64(hProcess,
            stk.AddrPC.Offset,
            &dwDisplacement,
            sym))
        {
            szSymName = sym->Name;
        }
        else
        {

            szSymName = "<nosymbols>";
			sprintf_s(sz, 
				      sizeof(sz) / sizeof(sz[0]), 
					  "SymGetSymFromAddr returned error code : %d\n", 
					  GetLastError());
			WriteFile(fh, sz, (DWORD)strlen(sz), &cb, 0);
        }
        sprintf_s(sz, sizeof(sz) / sizeof(sz[0]), "%08x %08x %08x %08x %08x %08x ",
            stk.AddrFrame.Offset,
            stk.AddrReturn.Offset,
            stk.Params[0],
            stk.Params[1],
            stk.Params[2],
            stk.Params[3]);
		WriteFile(fh, sz, (DWORD)strlen(sz), &cb, 0);

        /* Get the module name corresponding to the code address */
        if (SymGetModuleInfo64(hProcess, stk.AddrPC.Offset, &mi))
        {
            sprintf_s(sz, sizeof(sz) / sizeof(sz[0]), "%s!", mi.ModuleName);
			WriteFile(fh, sz, (DWORD)strlen(sz), &cb, 0);
        }

        sprintf_s(sz, sizeof(sz) / sizeof(sz[0]), "%s\n", szSymName);
		WriteFile(fh, sz, (DWORD)strlen(sz), &cb, 0);

        if (!stk.AddrReturn.Offset)
        {
            break;
        }
    }

    sprintf_s(sz, sizeof(sz) / sizeof(sz[0]), "\n");
	WriteFile(fh, sz, (DWORD)strlen(sz), &cb, 0);

    return EXCEPTION_EXECUTE_HANDLER;
}

void main(int argc, char** argv)
{
    DWORD   pid = 0;
    HANDLE  hEvent = 0;

    // This program will accept the following command line arguments similar
    // to all post mortem debuggers
    // -p <process id>
    // -e <event handle>

    if (argc > 1)
    {
        // If "-i" option is specified, then install the debugger
        if (!_stricmp(argv[1], "-i"))
        {
            InstallDebugger();
            return;
        }

        // If "-p" option is specified, get the process id value from
        // the next argument
        if (!_stricmp(argv[1], "-p"))
        {
            if (argc > 2)
            {
                pid = atoi(argv[2]);
            }
        }
    }

    if (argc > 3)
    {
        // If "-e" option is specified, get the event handle value from
        // the next argument
        if (!_stricmp(argv[3], "-e"))
        {
            if (argc > 4)
            {
                hEvent = (HANDLE)(UINT_PTR)atoi(argv[4]);
            }
        }
    }

    if (pid)
    {
        DispatchDebugEventThread(pid, hEvent);
    }
}
