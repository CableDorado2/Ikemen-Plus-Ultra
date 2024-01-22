/*++

    THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
    ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
    THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
    PARTICULAR PURPOSE.

    Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    FailFast.c

Abstract:

    This sample demonstrates how to use the RaiseFailFastException API.

    The RaiseFailFastException API differs from its RaiseException counterpart in that it bypasses any
    frame-based or vectored exception handlers, including the process' unhandled exception filter.

    In this sample, we will simply call RaiseFailFastException to raise a custom exception. We will set-up a
    frame-based handler before raising the exception, and verify that this handler will NOT be called.

    This API should be used for:

    1) Particularly bad exceptions - whenever there is a chance that the process state is too corrupt to go
       on.

    2) Cases where your code is wrapped by an outer exception handler (perhaps from a function
       that called you, a function you have no control of), and you wish for the exception to go straight to
       the operating system.
       In practice, this is typical of plugin extensions where the plugin host wraps calls to the plugin modules
       in a __try/__except and handles exceptions by itself. Calling RaiseFailFastException will bypass these
       handlers.

--*/

#include <stdio.h>

#include <windows.h>

int
wmain (
    int argc,
    const wchar_t* argv[],
    const wchar_t* envp[]
)
{
    UNREFERENCED_PARAMETER (argc);
    UNREFERENCED_PARAMETER (argv);
    UNREFERENCED_PARAMETER (envp);


    //
    // Set-up a SEH frame.
    //
    __try {

        wprintf (L"Calling RaiseFailFastException...\n");
        fflush (stdout);

        //
        // Raise an exception in a fail-fast manner.
        //
        RaiseFailFastException (NULL,
                                NULL,
                                FAIL_FAST_GENERATE_EXCEPTION_ADDRESS);

    }
    __except (EXCEPTION_EXECUTE_HANDLER) {
        //
        // This should not be executed, since RaiseFailFastException will bypass this handler.
        //
        wprintf (L"This handler should NOT have been called!\n");
    }

    return 0;
}
