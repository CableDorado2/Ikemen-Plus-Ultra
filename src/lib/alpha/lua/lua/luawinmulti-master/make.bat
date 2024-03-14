@echo off
SETLOCAL

REM __NOTE__: Some additional customizations in 'scripts\download.bat'

REM Target locations for Lua
SET TARGET=
SET COMPAT=
SET ALLVERSIONS=TRUE
SET VERSION51=
SET VERSION52=
SET VERSION53=
SET VERSION54=
SET CLEAN=
SET CLEANTARGET=
SET DEFAULT=
SET TOOLCHAIN=
SET LRCOMPILER=

:HandleParameter
IF [%1]==[] GOTO Continue
IF [%1]==[--help] GOTO Help
IF [%1]==[-help] GOTO Help
IF [%1]==[help] GOTO Help
IF [%1]==[--?] GOTO Help
IF [%1]==[-?] GOTO Help
IF [%1]==[?] GOTO Help
IF [%1]==[/?] GOTO Help

if [%1]==[--clean] (
  set CLEAN=--clean
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--cleantarget] (
  set CLEANTARGET=--clean
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--nocompat] (
  set COMPAT=--nocompat
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--gcc] (
  set TOOLCHAIN=GCC
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--ms] (
  set TOOLCHAIN=MS
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--51] (
  set ALLVERSIONS=
  set VERSION51=%1
  if [%DEFAULT%]==[] SET DEFAULT=51
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--52] (
  set ALLVERSIONS=
  set VERSION52=%1
  if [%DEFAULT%]==[] SET DEFAULT=52
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--53] (
  set ALLVERSIONS=
  set VERSION53=%1
  if [%DEFAULT%]==[] SET DEFAULT=53
  SHIFT
  GOTO HandleParameter
)
if [%1]==[--54] (
  set ALLVERSIONS=
  set VERSION54=%1
  if [%DEFAULT%]==[] SET DEFAULT=54
  SHIFT
  GOTO HandleParameter
)
if [%1]==[install] (
  if [%2]==[] (
    SHIFT
    SET TARGET=C:\Lua
    GOTO Continue
  )
  SET TARGET=%~2
  if [%3]==[] GOTO Continue
  echo Error: 'install' must be the final option on the commandline, '%3' is not allowed here.
  exit /b 1
)

echo Error handling commandline option '%1'. Use '--help' for usage information.
echo.
exit /b 1

:Help
echo Commandline script to download and install Lua 5.1, 5.2, 5.3, and 5.4 with a LuaRocks installation for each.
echo A 'setlua' script is made available to setup the environment for each version.
echo.
echo Usage:
echo   MAKE [--clean] [--cleantarget] [--nocompat] [--51] [--52] [--53] [--54] [--ms^|gcc] [install [^<location^>]]
echo.
echo   --51,--52,--53,--54: specify the versions to install, default is to install
echo                        all versions. Applies only to installing, all versions will be
echo                        build independent of this option.
echo                        The first version listed will be set as the unversioned default.
echo   --clean            : removes downloaded and build artifacts, forcing a rebuild
echo   --cleantarget      : removes the target directory before installing. NOTE: the LuaRocks
echo                        installation will ALWAYS be removed, independent of this option!
echo   --nocompat         : build Lua without compatibility options. NOTE: this option
echo                        will not automatically clean. So clean when switching compatibility.
echo   --ms^|gcc           : force usage of either Microsoft (--ms) or gcc (--gcc) toolchain, if
echo                        not provided it will be auto-detected.
echo   install ^<location^> : will install (and build if necessary) the Lua versions. Default 
echo                        location is 'C:\Lua'
echo.
echo   --help             : Display this help text
echo.
echo Example: the following commands, executed after each other will;
echo   make install                     
echo                  Will download, build and install 4 Lua versions in 'C:\Lua', 5.1 will
echo                  be set as the default.
echo.
echo   make --51 --52 install C:\lua2   
echo                  Will only install (no rebuild, binaries allready exist) 5.1 and 5.2 in 
echo                  'C:\Lua2'. 5.1 will be set as the default.
echo.
echo   make --clean --53 --nocompat install C:\Lua_NoCompat
echo                  Will download and build all versions again, without compatibility options,
echo                  and then install only 5.3 in 'C:\Lua_NoCompat'. 5.3 will be set as the 
echo                  default.
echo.
exit /b
:Continue

if [%ALLVERSIONS%]==[TRUE] (
  SET VERSION51=--51
  SET VERSION52=--52
  SET VERSION53=--53
  SET VERSION54=--54
  SET DEFAULT=51
)

REM Commands which, if exiting without error, indicate presence of the toolchain
SET CHECK_GCC=gcc --version
SET CHECK_MS=cl /help ^> %TEMP%\NULL

SET LRTARGET=%TARGET%\LuaRocks
SET MAKE=luawinmake

REM Cleanup first
if not [%CLEANTARGET%]==[] (
  if "%TARGET%"=="" (
    echo Error: '--cleantarget' requires the 'install' option to be specified.
    exit /b 1
  )
  echo Cleaning target: %TARGET%
  RMDIR /S /Q "%LRTARGET%"
  RMDIR /S /Q "%TARGET%"
  echo .
)

if not [%TOOLCHAIN%]==[] goto TOOLCHAIN_SET
REM Auto-detect compiler
Echo Testing for Microsoft toolchain...
%CHECK_MS%
IF %ERRORLEVEL%==0 (
  echo Found Microsoft toolchain
  SET TOOLCHAIN=MS
  goto TOOLCHAIN_SET
)
Echo Testing for GCC...
%CHECK_GCC%
IF %ERRORLEVEL%==0 (
  SET TOOLCHAIN=GCC
  echo Found gcc toolchain
  goto TOOLCHAIN_SET
)
echo.
echo No toolchain detected, please make sure you have the toolchain
echo set up in your system path.
exit /b 1


:TOOLCHAIN_SET
if [%TOOLCHAIN%]==[MS] (
   echo Using Microsoft toolchain
   SET LRCOMPILER=
) else (
   echo Using GCC/MinGW toolchain
   SET LRCOMPILER=/MW
)

REM Download and unpack sources
Echo.
Echo Starting download...
call scripts\download.bat %CLEAN%

REM Temporary fix until upgrade to LuaRocks 3
REM Fix LR 2.4.4 installer to support Lua 5.4
copy lr244_install.bat_54 luarocks\install.bat
copy lr244_cfg.lua_54 luarocks\src\luarocks\cfg.lua

REM Build the binaries
Echo.
Echo Start building...
call scripts\build.bat %TOOLCHAIN% %COMPAT%

Echo Build completed
Echo.
if "%TARGET%"=="" goto SkipInstall

if not [%VERSION51%]==[] (
  REM Install 51
  CD lua-5.1
  CALL etc\winmake installv "%TARGET%"
  CD ..\luarocks
  CALL install /P "%LRTARGET%" /LV 5.1 /LUA "%TARGET%" /F /NOADMIN /Q /NOREG %LRCOMPILER%
  COPY "%LRTARGET%\luarocks.bat" "%TARGET%\bin\luarocks51.bat"
  CD ..
  REM Now pulling a trick to insert a versioned path to the rocks directory into the
  REM created 'site_config' file
  SET INSERTLINE=site_config.LUAROCKS_ROCKS_SUBDIR=[[/lib/luarocks/rocks-5.1]]
  SETLOCAL ENABLEDELAYEDEXPANSION
  for /F "usebackq tokens=*" %%A in ("%LRTARGET%\lua\luarocks\site_config_5_1.lua") do (
    echo %%A             >> "%LRTARGET%\lua\luarocks\site_config_5_1.lua2"
    echo !INSERTLINE!    >> "%LRTARGET%\lua\luarocks\site_config_5_1.lua2"
    SET INSERTLINE=--
  )
  copy "%LRTARGET%\lua\luarocks\site_config_5_1.lua2" "%LRTARGET%\lua\luarocks\site_config_5_1.lua"
  del "%LRTARGET%\lua\luarocks\site_config_5_1.lua2"
  ENDLOCAL
)

if not [%VERSION52%]==[] (
  REM Install 52
  CD lua-5.2
  CALL etc\winmake installv "%TARGET%"
  CD ..\luarocks
  CALL install /P "%LRTARGET%" /LV 5.2 /LUA "%TARGET%" /F /NOADMIN /Q /NOREG %LRCOMPILER%
  COPY "%LRTARGET%\luarocks.bat" "%TARGET%\bin\luarocks52.bat"
  CD ..
  REM Now pulling a trick to insert a versioned path to the rocks directory into the
  REM created 'site_config' file
  SET INSERTLINE=site_config.LUAROCKS_ROCKS_SUBDIR=[[/lib/luarocks/rocks-5.2]]
  SETLOCAL ENABLEDELAYEDEXPANSION
  for /F "usebackq tokens=*" %%A in ("%LRTARGET%\lua\luarocks\site_config_5_2.lua") do (
    echo %%A             >> "%LRTARGET%\lua\luarocks\site_config_5_2.lua2"
    echo !INSERTLINE!    >> "%LRTARGET%\lua\luarocks\site_config_5_2.lua2"
    SET INSERTLINE=--
  )
  copy "%LRTARGET%\lua\luarocks\site_config_5_2.lua2" "%LRTARGET%\lua\luarocks\site_config_5_2.lua"
  del "%LRTARGET%\lua\luarocks\site_config_5_2.lua2"
  ENDLOCAL
)

if not [%VERSION53%]==[] (
  REM Install 53
  CD lua-5.3
  CALL etc\winmake installv "%TARGET%"
  CD ..\luarocks
  CALL install /P "%LRTARGET%" /LV 5.3 /LUA "%TARGET%" /F /NOADMIN /Q /NOREG %LRCOMPILER%
  COPY "%LRTARGET%\luarocks.bat" "%TARGET%\bin\luarocks53.bat"
  CD ..
  REM Now pulling a trick to insert a versioned path to the rocks directory into the
  REM created 'site_config' file
  SET INSERTLINE=site_config.LUAROCKS_ROCKS_SUBDIR=[[/lib/luarocks/rocks-5.3]]
  SETLOCAL ENABLEDELAYEDEXPANSION
  for /F "usebackq tokens=*" %%A in ("%LRTARGET%\lua\luarocks\site_config_5_3.lua") do (
    echo %%A             >> "%LRTARGET%\lua\luarocks\site_config_5_3.lua2"
    echo !INSERTLINE!    >> "%LRTARGET%\lua\luarocks\site_config_5_3.lua2"
    SET INSERTLINE=--
  )
  copy "%LRTARGET%\lua\luarocks\site_config_5_3.lua2" "%LRTARGET%\lua\luarocks\site_config_5_3.lua"
  del "%LRTARGET%\lua\luarocks\site_config_5_3.lua2"
  ENDLOCAL
)

if not [%VERSION54%]==[] (
  REM Install 54
  CD lua-5.4
  CALL etc\winmake installv "%TARGET%"
  CD ..\luarocks
  CALL install /P "%LRTARGET%" /LV 5.4 /LUA "%TARGET%" /F /NOADMIN /Q /NOREG %LRCOMPILER%
  COPY "%LRTARGET%\luarocks.bat" "%TARGET%\bin\luarocks54.bat"
  CD ..
  REM Now pulling a trick to insert a versioned path to the rocks directory into the
  REM created 'site_config' file
  SET INSERTLINE=site_config.LUAROCKS_ROCKS_SUBDIR=[[/lib/luarocks/rocks-5.4]]
  SETLOCAL ENABLEDELAYEDEXPANSION
  for /F "usebackq tokens=*" %%A in ("%LRTARGET%\lua\luarocks\site_config_5_4.lua") do (
    echo %%A             >> "%LRTARGET%\lua\luarocks\site_config_5_4.lua2"
    echo !INSERTLINE!    >> "%LRTARGET%\lua\luarocks\site_config_5_4.lua2"
    SET INSERTLINE=--
  )
  copy "%LRTARGET%\lua\luarocks\site_config_5_4.lua2" "%LRTARGET%\lua\luarocks\site_config_5_4.lua"
  del "%LRTARGET%\lua\luarocks\site_config_5_4.lua2"
  ENDLOCAL
)

REM install setlua.bat utility
copy .\scripts\setlua.bat "%TARGET%\bin"
copy .\scripts\clean_path.lua "%TARGET%\bin"

echo.
Echo Done installing, now setting an unversioned default;
REM set the default now
call "%TARGET%\bin\setlua.bat" %DEFAULT%

:SkipInstall
