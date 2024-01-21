@echo off
set _WSTRACE_PROVIDER={e04fe2e0-c6cf-4273-b59d-5c97c9c374a4}
rem set _WSTRACE_PROVIDER=WsTrace
set _TRACE_LEVEL_NONE=0x0
set _TRACE_LEVEL_FATAL=0x1
set _TRACE_LEVEL_ERROR=0x2
set _TRACE_LEVEL_WARNING=0x3
set _TRACE_LEVEL_INFORMATION=0x4
set _TRACE_LEVEL_VERBOSE=0x5

rem 0x1 - API entry/exit traces.
rem 0x2 - Error traces.
rem 0x4 - IO traces.
rem 0x8 - SOAP message traces.
rem 0x10 - Binary message traces.
set _WSTRACE_FLAGS=0x1f

if (%1)==(create) goto ParseCreate
if (%1)==(update) goto ParseUpdate
if (%1)==(delete) goto Delete
if (%1)==(on) goto On
if (%1)==(off) goto Off
if (%1)==(dump) goto Dump
if (%1)==(status) goto Status
goto ShowUsage

:ParseUpdate
if (%2)==(all) goto UpdateAll
if (%2)==(verbose) goto UpdateVerbose
if (%2)==(message) goto UpdateMessage
if (%2)==(info) goto UpdateInfo
if (%2)==(warning) goto UpdateWarning
if (%2)==(error) goto UpdateError
goto ShowUsage

:UpdateAll
set _WSTRACE_LEVEL=%_TRACE_LEVEL_VERBOSE%
goto Update

:UpdateVerbose
set _WSTRACE_LEVEL=%_TRACE_LEVEL_VERBOSE%
set _WSTRACE_FLAGS=0xf
goto Update

:UpdateMessage
set _WSTRACE_LEVEL=%_TRACE_LEVEL_VERBOSE%
set _WSTRACE_FLAGS=0x8
goto Update

:UpdateInfo
set _WSTRACE_LEVEL=%_TRACE_LEVEL_INFORMATION%
goto Update

:UpdateWarning
set _WSTRACE_LEVEL=%_TRACE_LEVEL_WARNING%
goto Update

:UpdateError
set _WSTRACE_LEVEL=%_TRACE_LEVEL_ERROR%
goto Update

:Update
logman update wstrace -bs 64 -ft 1 -rt -p "%_WSTRACE_PROVIDER%" %_WSTRACE_FLAGS% %_WSTRACE_LEVEL%
goto Exit

:ParseCreate
if (%2)==(all) goto CreateAll
if (%2)==(verbose) goto CreateVerbose
if (%2)==(message) goto CreateMessage
if (%2)==(info) goto CreateInfo
if (%2)==(warning) goto CreateWarning
if (%2)==(error) goto CreateError
goto ShowUsage

:CreateAll
set _WSTRACE_LEVEL=%_TRACE_LEVEL_VERBOSE%
goto Create

:CreateVerbose
set _WSTRACE_LEVEL=%_TRACE_LEVEL_VERBOSE%
set _WSTRACE_FLAGS=0xf
goto Create

:CreateMessage
set _WSTRACE_LEVEL=%_TRACE_LEVEL_VERBOSE%
set _WSTRACE_FLAGS=0x8
goto Create

:CreateInfo
set _WSTRACE_LEVEL=%_TRACE_LEVEL_INFORMATION%
goto Create

:CreateWarning
set _WSTRACE_LEVEL=%_TRACE_LEVEL_WARNING%
goto Create

:CreateError
set _WSTRACE_LEVEL=%_TRACE_LEVEL_ERROR%
goto Create

:Create
logman create trace wstrace -bs 64 -ft 1 -rt -p "%_WSTRACE_PROVIDER%" %_WSTRACE_FLAGS% %_WSTRACE_LEVEL%
goto Exit

:Delete
logman delete wstrace
goto Exit

:Off
logman stop wstrace
goto Exit

:On
logman start wstrace
goto Exit

:Status
logman query wstrace
goto Exit

:ShowUsage
echo.usage^: wstrace [command]
echo.
echo.commands^:
echo.  create [error^|info^|message^|verbose^|all] create a trace log at
echo.                                 error - operational errors
echo.                                 informational - errors, API enter/exit
echo.                                 and I/O traces.
echo.                                 message - only SOAP message exchange traces
echo.                                 verbose - errors, API enter/exit, I/O and 
echo.                                 SOAP message exchange traces. 
echo.                                 all - all traces (errors, API enter/exit,
echo.                                 I/O , SOAP and binary message exchange).
echo.  on                             turn on tracing
echo.  off                            turn off tracing
echo.  update [error^|info^|message^|verbose^|all]   change trace log level.
echo.  dump                           dump trace information in .csv format
echo.  status                         show current status of trace
echo.  delete                         delete the trace log
echo.
echo example^:
echo   wstrace create info      // create trace log (only need to do this once)
echo   wstrace on               // turn tracing on
echo   wstrace dump ^>temp.csv   // start capturing tracing output to a file
echo   run scenario             // run the scenario
echo   ctrl-C                   // hit ctrl-C to stop dump
echo   wstrace off              // turn tracing off
echo   wstrace delete           // delete tracing
goto Exit

:Dump
wstracedump wstrace
goto Exit

:Exit

