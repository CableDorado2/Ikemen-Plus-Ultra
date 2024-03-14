@echo off
SETLOCAL

if not [%1]==[GCC] (
  if not [%1]==[MS] (
    echo.
    echo Bad first parameter, specify either GCC or MS
    echo Usage: scripts\build.bat GCC^|MS [--nocompat]
    echo.
    exit /b 1
  )
)
set TOOLCHAIN=%1

if [%2]==[--nocompat] (
  set COMPAT=--NOCOMPAT
) else (
  set COMPAT=
  if not [%2]==[] (
    echo.
    echo Invalid commandline option; %2
    echo Usage: scripts\build.bat GCC^|MS [--nocompat]
    echo.
    exit /b 1
  )
)

SET MAKE=luawinmake

REM Build 51
if exist lua-5.1\src\lua51.dll (
  echo Skipping Lua 5.1 build, binaries already exist
) else (
  XCOPY /E/Y/Q "%MAKE%" "lua-5.1"
  CD lua-5.1
  CALL etc\winmake clean
  CALL etc\winmake %TOOLCHAIN% %COMPAT%
  CD ..
)

REM Build 52
if exist lua-5.2\src\lua52.dll (
  echo Skipping Lua 5.2 build, binaries already exist
) else (
  XCOPY /E/Y/Q "%MAKE%" "lua-5.2"
  CD lua-5.2
  CALL etc\winmake clean
  CALL etc\winmake %TOOLCHAIN% %COMPAT%
  CD ..
)

REM Build 53
if exist lua-5.3\src\lua53.dll (
  echo Skipping Lua 5.3 build, binaries already exist
) else (
  XCOPY /E/Y/Q "%MAKE%" "lua-5.3"
  CD lua-5.3
  CALL etc\winmake clean
  CALL etc\winmake %TOOLCHAIN% %COMPAT%
  CD ..
)

REM Build 54
if exist lua-5.4\src\lua54.dll (
  echo Skipping Lua 5.4 build, binaries already exist
) else (
  XCOPY /E/Y/Q "%MAKE%" "lua-5.4"
  CD lua-5.4
  CALL etc\winmake clean
  CALL etc\winmake %TOOLCHAIN% %COMPAT%
  CD ..
)

