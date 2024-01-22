Logging Basics Sample
==============================

This sample demonstrates the basic usage of the IO.Log APIs to record data and
clean up the logged records. This sample logs the system's CPU utilization
every 200 ms and after a small interval writes the running avarage in a restart area.
It moves the base of the log on subsequent writing of restart area and toggles this
operation.


Sample Source Files
===================
Readme.txt                  This file
LoggingBasics.cs            Visual C# main program
LoggingBasics.sln           Visual Studio Solution file
LoggingBasics.csproj        Visual C# project file
Properties\AssemblyInfo.cs  Visual Studio assembly file


System Requirements
===================
The sample requires the IO.Log assembly to be present on the system. This assembly
is included as part of Microsoft .NET Framework 3.0.

The optional use of the LogRecordSequence requires the Common Log File System (CLFS).
This is included with Windows Server 2003 R2, Windows Vista and Windows Server 2008.


To build and run the sample
===========================
The application can be compiled with Visual Studio .NET 2005 or by running "msbuild.exe"
from the command line.

To run, open a command prompt, navigate to the "\bin" folder and run "LoggingBasics.exe".
On Windows Vista and later this must be done with "Run as administrator" privileges.


Supported Platforms
===================
Windows XP SP2
Windows 2003 Server
Windows Server 2003 R2
Windows Vista
Windows Server 2008