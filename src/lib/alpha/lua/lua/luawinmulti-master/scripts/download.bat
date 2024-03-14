@echo off
REM Will download and unpack LuaWinMake, LuaRocks and Lua tarballs

REM  ***************  CUSTOMIZATION SECTION  *********************

REM relative nameparts with source code
SET LUA51=lua-5.1.5
SET LUA52=lua-5.2.4
SET LUA53=lua-5.3.6
SET LUA54=lua-5.4.6
SET LRVERSION=2.4.4

REM Archive suffix to use for all downloads
SET DL_SUFFIX=.tar.gz
REM URL for Lua archives (relative nameparts and archive suffixes will be appended)
SET DL_PREFIX=http://www.lua.org/ftp/

REM LuaWinMake url and top folder name
SET DL_LUAWINMAKE=https://github.com/Tieske/luawinmake/archive/master
SET LUAWINMAKE_TOPFOLDER=luawinmake-master

REM LuaRocks url and top folder name
SET DL_LUAROCKS=https://github.com/keplerproject/luarocks/archive/v%LRVERSION%
SET LUAROCKS_TOPFOLDER=luarocks-%LRVERSION%

REM  ***************  NOTHING TO CUSTOMIZE BELOW  *********************

REM location for temp files
SET DOWNLOADS=%temp%\lwm-downloads\

if [%1]==[--clean] (
echo start cleaning...
  RMDIR /S /Q "%DOWNLOADS%" 
  RMDIR /S /Q "lua-5.1"
  RMDIR /S /Q "lua-5.2"
  RMDIR /S /Q "lua-5.3"
  RMDIR /S /Q "lua-5.4"
  RMDIR /S /Q "luawinmake"
  RMDIR /S /Q "luarocks"
  echo done cleaning...
) else (
  if not [%1]==[] (
    echo.
    echo Invalid commandline option; %1
    echo Usage: scripts\download.bat [--clean]
    echo.
    exit /b 1
  )
)

set WORKDIR=%CD%\
RMDIR /S /Q "%DOWNLOADS%" 
mkdir "%DOWNLOADS%"
cd "%DOWNLOADS%"

if not exist "%WORKDIR%luawinmake\*.*" (
  "%WORKDIR%tools\wget" --no-check-certificate --output-document=luawinmake%DL_SUFFIX% %DL_LUAWINMAKE%%DL_SUFFIX%
  "%WORKDIR%tools\7z" x -y luawinmake.tar.gz >NUL
  "%WORKDIR%tools\7z" x -y luawinmake.tar >NUL
  mkdir "%WORKDIR%luawinmake"
  xcopy "%LUAWINMAKE_TOPFOLDER%\*.*" "%workdir%luawinmake\" /E /Y /Q
) else (
  echo Skipping LuaWinMake download, directory already exists
)

if not exist "%WORKDIR%luarocks\*.*" (
  "%WORKDIR%tools\wget" --no-check-certificate --output-document=luarocks%DL_SUFFIX% %DL_LUAROCKS%%DL_SUFFIX%
  "%WORKDIR%tools\7z" x -y luarocks.tar.gz >NUL
  "%WORKDIR%tools\7z" x -y luarocks.tar >NUL
  xcopy "%LUAROCKS_TOPFOLDER%\*.*" "%WORKDIR%luarocks\" /E /Y /Q
) else (
  echo Skipping LuaRocks download, directory already exists
)

if not exist "%WORKDIR%lua-5.1\*.*" (
  "%WORKDIR%tools\wget" --no-check-certificate --output-document=%LUA51%%DL_SUFFIX% %DL_PREFIX%%LUA51%%DL_SUFFIX%
  "%WORKDIR%tools\7z" x -y %LUA51%.tar.gz >NUL
  "%WORKDIR%tools\7z" x -y %LUA51%.tar >NUL
  xcopy "%LUA51%\*.*" "%WORKDIR%lua-5.1\" /E /Y /Q
) else (
  echo Skipping Lua 5.1 download, directory already exists
)

if not exist "%WORKDIR%lua-5.2\*.*" (
  "%WORKDIR%tools\wget" --no-check-certificate --output-document=%LUA52%%DL_SUFFIX% %DL_PREFIX%%LUA52%%DL_SUFFIX%
  "%WORKDIR%tools\7z" x -y %LUA52%.tar.gz >NUL
  "%WORKDIR%tools\7z" x -y %LUA52%.tar >NUL
  xcopy "%LUA52%\*.*" "%WORKDIR%lua-5.2\" /E /Y /Q
) else (
  echo Skipping Lua 5.2 download, directory already exists
)

if not exist "%WORKDIR%lua-5.3\*.*" (
  "%WORKDIR%tools\wget" --no-check-certificate --output-document=%LUA53%%DL_SUFFIX% %DL_PREFIX%%LUA53%%DL_SUFFIX%
  "%WORKDIR%tools\7z" x -y %LUA53%.tar.gz >NUL
  "%WORKDIR%tools\7z" x -y %LUA53%.tar >NUL
  xcopy "%LUA53%\*.*" "%WORKDIR%lua-5.3\" /E /Y /Q
) else (
  echo Skipping Lua 5.3 download, directory already exists
)

if not exist "%WORKDIR%lua-5.4\*.*" (
  "%WORKDIR%tools\wget" --no-check-certificate --output-document=%LUA54%%DL_SUFFIX% %DL_PREFIX%%LUA54%%DL_SUFFIX%
  "%WORKDIR%tools\7z" x -y %LUA54%.tar.gz >NUL
  "%WORKDIR%tools\7z" x -y %LUA54%.tar >NUL
  xcopy "%LUA54%\*.*" "%WORKDIR%lua-5.4\" /E /Y /Q
) else (
  echo Skipping Lua 5.4 download, directory already exists
)

REM The 'RMDIR' below might fail because of background processes like virus scanners etc having files open
RMDIR /S /Q "%DOWNLOADS%" 
CD "%WORKDIR%"
