FailFast Sample
===============

Demonstrates
------------
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

Languages
---------
This sample is implemented in the C programming language.

Files
-----
     FailFast.c            Source code for the sample
     FailFast.vcproj       Visual C++ 2008 project file
     FailFast.sln          Visual Studio 2008 solution file
 
Prerequisites
-------------
Windows SDK v7.0 or newer.
Windows 7 or Windows Server 2008 R2 operating system, or newer.

Building the Sample
-------------------
To build the sample using the command prompt:
     1. Open the Windows SDK command line shell and navigate to the directory.
     2. Type: msbuild FailFast.sln

To build the sample using Visual Studio 2008 or Visual C++ 2008 Express:
     1. Open Windows Explorer and navigate to the FailFast directory.
     2. Double-click the icon for the FailFast.sln file to open the file in Visual Studio.
     3. Add the path to the Windows SDK Include folder to the "Additional Include Directories" setting of the project.
     4. Add the path to the Windows SDK Lib folder to the "Additional Library Directories" setting of the project.
     5. In the Build menu, select Build Solution. The application will be built in the default \Debug or \Release directory.

Running the Sample
------------------
1. Open a command prompt and navigate to the Release or Debug directory under FailFast.
2. Run FailFast.exe (no command-line arguments).

Expected outcome: The exception handler block is not called. The application crashes with the exception code
                  C0000602 (STATUS_FAIL_FAST_EXCEPTION).


THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.

Copyright (c) Microsoft Corporation. All rights reserved.
