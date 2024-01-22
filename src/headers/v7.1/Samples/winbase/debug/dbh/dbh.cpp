/*
 * THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
 * ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * Copyright (C) 2008.  Microsoft Corporation.  All rights reserved.
 *
 * dbh.cpp
 *
 * This file implements a command line utility that shows how to
 * use the dbghelp API to query symbolic information from an image
 * or pdb file.
 *
 * The program operates in two modes...
 *
 * In "module" mode a single image and it's symbols are loaded from
 * the command line or the "load" command.  All other commands executed
 * on the loaded module.
 *
 * In "process" mode, a process indicated by the "-p" command line
 * parameter is attached to and all modules in the process are loaded.
 * All subsequent commands are executed against all the modules.
 * Some commands will not work or are not appropriate.  You can use
 * a module mask to specify a certain module.  Example:  To enumerate
 * all symbols that start with "a" in all modules that have names that
 * start with "mod",do this...
 *
 *    enum mod*!a*
 *
 * Designed to be used with dbghelp.dll version 6.7 or greater.
 *
 * This version of dbh.cpp was written to be part of the Windows 7 SDK.
 */

#ifdef UNICODE
 #define DBGHELP_TRANSLATE_TCHAR
#endif

#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <assert.h>
#include <tchar.h>
#define _NO_CVCONST_H
#include <dbghelp.h>

// general #defines

#ifdef DBHWCHAR
 #define _ch WHCAR
 #define _sz PWCH
 #define _printff wprintf
#else
 #define _ch char
 #define _sz char *
 #define _printf printf
#endif

#define ccht(Array, EltType) (sizeof(Array) / sizeof(EltType))
#define cch(Array) ccht(Array, (Array)[0])

#ifndef true
 #define true TRUE
 #define false FALSE
#endif

#define MAX_STR 256
#define WILD_UNDERSCORE 1
#define SYM_BUFFER_SIZE (sizeof(IMAGEHLP_SYMBOL64) + MAX_SYM_NAME)
#define SI_BUFFER_SIZE (sizeof(SYMBOL_INFO) + MAX_SYM_NAME)

#ifdef UNICODE
 #define TUCHAR unsigned short
#else
 #define TUCHAR unsigned char
#endif

// for calling SymEnumSymbols

typedef struct {
    TCHAR mask[MAX_STR];
    TCHAR teststring[MAX_STR];
    DWORD64 base;
} ENUMSYMDATA, *PENUMSYMDATA;

/*
 * Adding a new command:
 *
 * To add a command, you need to add a new enum value the table just
 * below.  Add the new value just above 'cmdScrap'.
 *
 * The code for the command needs to be of the type, CMDPROC.  Put the
 * function just above 'fnScrap' and add it to the list of functions
 * that are forward referenced just below the cmd enum.
 *
 * The 'params' parameter of your function will be a text string passed
 * from the command line by the 'InputLoop' function.
 *
 * The 'gCmd' array contains a list of structures that are used by 'InputLoop'
 * to know which function to call when it receives input.  The CMD typedef
 * comments show the meaning of each field in the structure.  Add a
 * structure element to the array just above the one containing 'fnScrap'.
 * When you do this, give your command a meaningful name to be entered by
 * the user when he or she wants to execute your new command.  Most, single
 * character shortcuts are used up, so using one is not recommended.
 *
 * Lastly, add a short description of your command to the 'fnHelp' function.
 *
 * Now, when the user types in text that matches the name you gave for your
 * command, the corresponding CMDPROC function you wrote will be called and
 * all extra text on the command line will be passed to your function.
 */

// available commands

typedef enum
{
    cmdQuit = 0,
    cmdHelp,
    cmdVerbose,
    cmdLoad,
    cmdUnload,
    cmdEnum,
    cmdName,
    cmdAddr,
    cmdBase,
    cmdNext,
    cmdPrev,
    cmdLine,
    cmdLineNext,
    cmdLinePrev,
    cmdUndec,
    cmdSearhTree,
    cmdFindFileInPath,
    cmdEnumSrcFiles,
    cmdAdd,
    cmdDelete,
    cmdEnumForAddr,
    cmdLocals,
    cmdMulti,
    cmdType,
    cmdInfo,
    cmdObj,
    cmdEnumLines,
    cmdSearch,
    cmdDumpTag,
    cmdLineAddr,
    cmdFindExe,
    cmdFindDbgInfo,
    cmdSymPath,
    cmdDir,
    cmdIndex,
    cmdScope,
    cmdEnumTypes,
    cmdEnumMod,
    cmdSupplement,
    cmdSrvInd,
    cmdSrvPath,
    cmdGetSym,
    cmdGetFile,
    cmdStoreAdd,
    cmdEnumSrc,
    cmdMod,
    cmdRefresh,
    cmdHome,
    cmdOmap,
    cmdSetRet,
    cmdEnumProcessMods,
    cmdSymOpt,
    cmdDumpSymbols,
    cmdUnwind,
    cmdFileIndexInfo,
    cmdScrap,
    cmdMax
};

// and here are the functions to match them

BOOL fnQuit(__in PCTSTR);
BOOL fnHelp(__in_opt PCTSTR);
BOOL fnVerbose(__in PCTSTR);
BOOL fnLoad(__in PCTSTR);
BOOL fnUnload(__in_opt PCTSTR);
BOOL fnEnum(__in PCTSTR);
BOOL fnName(__in PCTSTR);
BOOL fnAddr(__in PCTSTR);
BOOL fnBase(__in PCTSTR);
BOOL fnNext(__in PCTSTR);
BOOL fnPrev(__in PCTSTR);
BOOL fnLine(__in PCTSTR);
BOOL fnLineNext(__in PCTSTR);
BOOL fnLinePrev(__in PCTSTR);
BOOL fnUndec(__in PCTSTR);
BOOL fnSearchTree(__in PCTSTR);
BOOL fnFindFileInPath(__in PCTSTR);
BOOL fnEnumSrcFiles(__in PCTSTR);
BOOL fnAdd(__in PCTSTR);
BOOL fnDelete(__in PCTSTR);
BOOL fnEnumForAddr(__in PCTSTR);
BOOL fnLocals(__in PCTSTR);
BOOL fnMulti(__in PCTSTR);
BOOL fnType(__in PCTSTR);
BOOL fnInfo(__in PCTSTR);
BOOL fnObj(__in PCTSTR);
BOOL fnEnumLines(__in PCTSTR);
BOOL fnSearch(__in PCTSTR);
BOOL fnDumpTags(__in PCTSTR);
BOOL fnLineAddr(__in PCTSTR);
BOOL fnFindExe(__in PCTSTR);
BOOL fnFindDbgInfo(__in PCTSTR);
BOOL fnSymPath(__in PCTSTR);
BOOL fnDir(__in PCTSTR);
BOOL fnIndex(__in PCTSTR);
BOOL fnScope(__in PCTSTR);
BOOL fnEnumTypes(__in PCTSTR);
BOOL fnEnumMod(__in PCTSTR);
BOOL fnSupplement(__in PCTSTR);
BOOL fnSrvInd(__in PCTSTR);
BOOL fnSrvPath(__in PCTSTR);
BOOL fnGetSym(__in PCTSTR);
BOOL fnGetFile(__in PCTSTR);
BOOL fnStoreAdd(__in PCTSTR);
BOOL fnSrcLines(__in PCTSTR);
BOOL fnMod(__in PCTSTR);
BOOL fnRefresh(__in PCTSTR);
BOOL fnHome(__in PCTSTR);
BOOL fnOmap(__in PCTSTR);
BOOL fnSetRet(__in PCTSTR);
BOOL fnEnumProcessMods(__in PCTSTR);
BOOL fnSymOpt(__in PCTSTR);
BOOL fnDumpSymbols(__in PCTSTR);
BOOL fnUnwind(__in PCTSTR);
BOOL fnFileIndexInfo(__in PCTSTR);
BOOL fnScrap(__in PCTSTR);

// this struct associates commands with functions

typedef BOOL (*CMDPROC)(PCTSTR __in params);

typedef struct _CMD
{
    TCHAR token[MAX_STR + 1];   // long name of command
    TCHAR shorttoken[4];        // optional 1 character shortcut
    CMDPROC fn;                 // the function to call when the command is matched
} CMD, *PCMD;

// array of command structs

CMD gCmd[cmdMax] =
{
    {_T("quit"),    _T("q"), fnQuit},
    {_T("help"),    _T("?"), fnHelp},
    {_T("verbose"), _T("v"), fnVerbose},
    {_T("load"),    _T(""),  fnLoad},
    {_T("unload"),  _T("u"), fnUnload},
    {_T("enum"),    _T("x"), fnEnum},
    {_T("name"),    _T("n"), fnName},
    {_T("addr"),    _T("a"), fnAddr},
    {_T("base"),    _T("b"), fnBase},
    {_T("next"),    _T("s"), fnNext},
    {_T("prev"),    _T("p"), fnPrev},
    {_T("line"),    _T("l"), fnLine},
    {_T("linenext"),_T("j"), fnLineNext},
    {_T("lineprev"),_T("k"), fnLinePrev},
    {_T("undec"),   _T(""),  fnUndec},
    {_T("srchtree"),_T(""),  fnSearchTree},
    {_T("ffpath"),  _T(""),  fnFindFileInPath},
    {_T("src"),     _T("r"), fnEnumSrcFiles},
    {_T("add"),     _T("+"), fnAdd},
    {_T("del"),     _T("-"), fnDelete},
    {_T("enumaddr"),_T("m"), fnEnumForAddr},
    {_T("locals"),  _T("z"), fnLocals},
    {_T("multi"),   _T(""),  fnMulti},
    {_T("type"),    _T("t"), fnType},
    {_T("info"),    _T("i"), fnInfo},
    {_T("obj"),     _T("o"), fnObj},
    {_T("elines"),  _T("e"), fnEnumLines},
    {_T("srch"),    _T(""),  fnSearch},
    {_T("dtag"),    _T(""),  fnDumpTags},
    {_T("laddr"),   _T(""),  fnLineAddr},
    {_T("findexe"), _T(""),  fnFindExe},
    {_T("finddbg"), _T(""),  fnFindDbgInfo},
    {_T("sympath"), _T(""),  fnSymPath},
    {_T("dir")  ,   _T(""),  fnDir},
    {_T("index"),   _T(""),  fnIndex},
    {_T("scope"),   _T(""),  fnScope},
    {_T("etypes"),  _T(""),  fnEnumTypes},
    {_T("enummod"), _T(""),  fnEnumMod},
    {_T("sup"),     _T(""),  fnSupplement},
    {_T("srvind"),  _T(""),  fnSrvInd},
    {_T("srvpath"), _T(""),  fnSrvPath},
    {_T("getsym"),  _T(""),  fnGetSym},
    {_T("getfile"), _T(""),  fnGetFile},
    {_T("storeadd"),_T(""),  fnStoreAdd},
    {_T("srclines"),_T(""),  fnSrcLines},
    {_T("mod"),     _T(""),  fnMod},
    {_T("refresh"), _T(""),  fnRefresh},
    {_T("home"),    _T(""),  fnHome},
    {_T("omap"),    _T(""),  fnOmap},
    {_T("setret"),  _T(""),  fnSetRet},
    {_T("epmod"),   _T(""),  fnEnumProcessMods},
    {_T("symopt"),  _T(""),  fnSymOpt},
    {_T("dump"),    _T(""),  fnDumpSymbols},
    {_T("uw"),      _T(""),  fnUnwind},
    {_T("fii"),     _T(""),  fnFileIndexInfo},
    {_T("scrap"),   _T(""),  fnScrap},
};

// globals

BOOL gModLoaded = false;
BOOL gInitialized = false;
TCHAR gFileName[MAX_STR] = _T("");
TCHAR gModName[MAX_STR] = _T("");
char gAnsiModName[MAX_STR] = "";
TCHAR gImageName[MAX_STR];
TCHAR gSymbolSearchPath[MAX_STR];
DWORD64 gBase;
DWORD64 gDefaultBase;
DWORD64 gDefaultBaseForVirtualMods;
DWORD gOptions = 0;
HANDLE gTID;
IMAGEHLP_LINE64 gLine;
TCHAR gLineFileName[MAX_PATH + 1];
IMAGEHLP_LINE gLi;
TCHAR gLiFileName[MAX_PATH + 1];
TCHAR gExecCmd[MAX_STR] = _T("");
TCHAR gSrcFileName[MAX_PATH + 1] = _T("");
TCHAR gObj[MAX_PATH + 1] = _T("");
TCHAR *gIndex = NULL;
BOOL grcEnumProc = true;
BOOL gDecPubs = false;
BOOL gVerbose = false;
DWORD gPID = 0;
HANDLE ghProc = 0;
BOOL gCleanup = false;
BOOL gEnumSymbolsTitle = false;
TCHAR gNullString[3] = _T("");
DWORD64 gLastSym = 0;

typedef BOOL (WINAPI *PHSI)(HANDLE, HEAP_INFORMATION_CLASS ,PVOID, SIZE_T);

BOOL 
SetHeapOptions() 
{
    BOOL fRet = FALSE;
    PHSI pHsi = NULL; 
    HMODULE hLib = NULL;
    
    hLib = LoadLibrary(_T("kernel32.dll"));
    if (hLib == NULL) 
    {
       return FALSE;
    }

    pHsi = (PHSI) GetProcAddress(hLib,"HeapSetInformation");
    if (!pHsi) 
    {
       FreeLibrary(hLib);
       return FALSE;
    }

    fRet = (pHsi)(NULL,HeapEnableTerminationOnCorruption,NULL,0) 
             ? TRUE 
             : FALSE;
    if (hLib) 
    {
        FreeLibrary(hLib);
    }

    return fRet;
}

// trims trailing whitespace from a string

void
rtrim(
    __inout PTSTR sz
    )
{
    PTCHAR p;

    if (!sz || !*sz)
        return;

    for (p = sz + _tcslen(sz) - 1; p >= sz; p--) {
        if (!_istspace((TUCHAR)*p))
            break;
        *p = 0;
    }
}


// Use this to display verbose information, when
// the -n switch is used.

int
dprintf(
    __in PCTSTR format,
    ...
    )
{
    static TCHAR buf[1000] = _T("");
    va_list args;

    if ((gOptions & SYMOPT_DEBUG) == 0)
        return 1;

    va_start(args, format);
    _vstprintf_s(buf, cch(buf), format, args);
    va_end(args);
    _fputts(buf, stdout);
    return 1;
}


// converts wide character to ansi

BOOL
wcs2ansi(
    __in PCWSTR pwsz,
    __out_ecount(pszlen) PSTR psz,
    __in DWORD pszlen
    )
{
    BOOL rc;
    size_t len;

    assert(psz && pwsz);

    len = wcslen(pwsz);
    if (!len) 
    {
        *psz = 0;
        return true;
    }

    rc = WideCharToMultiByte(CP_ACP,
                             WC_SEPCHARS | WC_COMPOSITECHECK,
                             pwsz,
                             -1,
                             psz,
                             pszlen,
                             NULL,
                             NULL);
    return rc != 0;
}


// converts tchar to ansi

BOOL
tcs2ansi(
    __in PCTSTR tsz,
    __out_ecount(szlen) PSTR sz,
    __in DWORD szlen
    )
{
#ifdef UNICODE
    return wcs2ansi(tsz, sz, szlen);
#else
    strcpy_s(sz, szlen, tsz);
    return true;
#endif
}


// If the parameter string contains a module mask, then
// use a base of zero.  Otherwise use gBase.  Used in
// many functions that pass a mask to dbghelp.

DWORD64
base(
    __in PCTSTR param
    )
{
    if (!param)
        return gBase;

    if (_tcschr(param, _T('!')))
        return 0;

    return gBase;
}


// displays a 64 bit address in right-justified alignment

PTCHAR
_dispaddr(
    __in ULONG64 addr,
    __in BOOL pad
    )
{
    static TCHAR sz[20];

    if ((addr >> 32) != 0)
        _stprintf_s(sz, cch(sz), _T("%8x`%08x"), (ULONG)(addr>>32), (ULONG)addr);
    else
        _stprintf_s(sz, cch(sz), pad ? _T("         %8x") : _T("%8x"), (ULONG)addr);
    return sz;
}

#define dispaddr(addr) _dispaddr(addr, false)


// tests if a text string is a valid hex number

BOOL
validnum(
    __in PCTSTR sz
    )
{
    int c;

    for (; *sz; sz++)
    {
        c = _totlower(*sz);
        if (c >= '0' && c <= '9')
            continue;
        if (c >= 'a' && c <= 'f')
            continue;
        return false;
    }

    return true;
}


// converts a string to a DWORD64 address

DWORD64
sz2dw64(
    __in PCTSTR str
    )
{
    PTSTR p;
    PCTSTR pstr;
    DWORD64 addr = 0;
    TCHAR sz[MAX_STR] = _T("");

    // get rid of ` character

    for (p = sz, pstr = str; *pstr && p - sz < cch(sz) - 2; pstr++)
    {
        if (*pstr != _T('`'))
            *p++ = *pstr;
    }
    *p = 0;

    // get rid of leading 0x and get the address

    if (*sz)
    {
        p = sz;
        if (*(p + 1) == 'x' || *(p + 1) == 'X')
            p += 2;
        if (!validnum(p))
            return 0;
        if (_stscanf_s(p, _T("%I64x"), &addr) < 1)
            return 0;
    }

    return addr;
}


// displays the contents of a 64 bit symbol structure

void
_dumpsym(
    __in PIMAGEHLP_SYMBOL64 sym,
    __in BOOL pad
    )
{
    printf(" name : %s\n", sym->Name);
    _tprintf(_T(" addr : %s\n"), _dispaddr(sym->Address, pad));
    _tprintf(_T(" size : %x\n"), sym->Size);
    _tprintf(_T("flags : %x\n"), sym->Flags);
}

#define dumpsym(sym) _dumpsym(sym, false)


// displays the contents of a 32 bit symbol structure

void
dumpsym32(
    __in PIMAGEHLP_SYMBOL sym
    )
{
    printf(" name : %s\n", sym->Name);
    _tprintf(_T(" addr : %s\n"), dispaddr(sym->Address));
    _tprintf(_T(" size : %x\n"), sym->Size);
    _tprintf(_T("flags : %x\n"), sym->Flags);
}


// displays the contents of a line number structure

void
dumpLine(
    __in PIMAGEHLP_LINE64 line
    )
{
    _tprintf(_T("   file : %s\n"), line->FileName);
    _tprintf(_T("   line : %d\n"), line->LineNumber);
    _tprintf(_T("   addr : %s\n"), dispaddr(line->Address));
    _tprintf(_T("    key : %p\n"), line->Key);
}


// This code displays the symbol tag descriptions.

#ifndef SymTagMax
 // normally found in cvconst.h which ships with Visual Studio
 #define SymTagMax 0x1f
#endif

PTSTR
dispsymtag(
    __in ULONG symtag
    )
{
    static PTSTR names[] =
    {
        _T("SymTagNull"),
        _T("SymTagExe"),
        _T("SymTagCompiland"),
        _T("SymTagCompilandDetails"),
        _T("SymTagCompilandEnv"),
        _T("SymTagFunction"),
        _T("SymTagBlock"),
        _T("SymTagData"),
        _T("SymTagAnnotation"),
        _T("SymTagLabel"),
        _T("SymTagPublicSymbol"),
        _T("SymTagUDT"),
        _T("SymTagEnum"),
        _T("SymTagFunctionType"),
        _T("SymTagPointerType"),
        _T("SymTagArrayType"),
        _T("SymTagBaseType"),
        _T("SymTagTypedef"),
        _T("SymTagBaseClass"),
        _T("SymTagFriend"),
        _T("SymTagFunctionArgType"),
        _T("SymTagFuncDebugStart"),
        _T("SymTagFuncDebugEnd"),
        _T("SymTagUsingNamespace"),
        _T("SymTagVTableShape"),
        _T("SymTagVTable"),
        _T("SymTagCustom"),
        _T("SymTagThunk"),
        _T("SymTagCustomType"),
        _T("SymTagManagedType"),
        _T("SymTagDimension"),
    };

    if (symtag >= SymTagMax)
        return _T("<Invalid>");

    return names[symtag];
}


// displays the contents of a symbol info structure

void
dumpsi(
    __in PSYMBOL_INFO si
    )
{
    if (!si)
        return;

    _tprintf(_T("   name : %s\n"), si->Name);
    _tprintf(_T("   addr : %s\n"), dispaddr(si->Address));
    _tprintf(_T("   size : %x\n"), si->Size);
    _tprintf(_T("  flags : %x\n"), si->Flags);
    _tprintf(_T("   type : %x\n"), si->TypeIndex);
    _tprintf(_T("modbase : %s\n"), dispaddr(si->ModBase));
    _tprintf(_T("  value : %s\n"), dispaddr(si->Value));
    _tprintf(_T("    reg : %x\n"), si->Register);
    _tprintf(_T("  scope : %s (%x)\n"), dispsymtag(si->Scope), si->Scope);
    _tprintf(_T("    tag : %s (%x)\n"), dispsymtag(si->Tag), si->Tag);
    _tprintf(_T("  index : %x\n"), si->Index);
}


// callback for symbol enumerator - called by
// fnEnum and fnEnumForAddr

BOOL
CALLBACK
cbEnumSymbols(
    __in PSYMBOL_INFO si,
    __in ULONG size,
    __in PVOID context
    )
{
    if (!gEnumSymbolsTitle)
    {
        gEnumSymbolsTitle = true;
        _tprintf(_T(" index            address     name\n"));
    }

   _tprintf(_T("  %4x  %8s : "), si->Index, _dispaddr(si->Address, true));
    if (si->Flags & SYMF_FORWARDER)
        _tprintf(_T("%c "), 'F');
    else if (si->Flags & SYMF_EXPORT)
        _tprintf(_T("%c "), 'E');
    else
        _tprintf(_T("  "));
    _tprintf(_T("%s\n"), si->Name);

    if (si->Tag == SymTagAnnotation)
    {
        PTSTR p;
        for (p = si->Name + _tcslen(si->Name) + 1; *p; p += _tcslen(p) + 1)
            _tprintf(_T("                       %s\n"), p);
    }

    return grcEnumProc;
}


// callback for SymSearch()
// used by fnObj and fnEnumLines

BOOL
CALLBACK
cbEnumObjs(
    __in PSYMBOL_INFO si,
    __in ULONG size,
    __in PVOID context
    )
{
    _tprintf(_T("%s\n"), si->Name);

    return grcEnumProc;
}


// fnQuit - exit this program

BOOL fnQuit(__in PCTSTR param)
{
    _tprintf(_T("goodbye\n"));
    return false;
}


// fnHelp - display command help

BOOL fnHelp(__in_opt PCTSTR param)
{
    _tprintf(_T("          dbh commands :\n"));
    _tprintf(_T("?                 help : prints this message\n"));
    _tprintf(_T("q                 quit : quits this program\n"));
    _tprintf(_T("v     verbose <on/off> : controls debug spew\n"));
    _tprintf(_T("        load <modname> : loads the requested module\n"));
    _tprintf(_T("u               unload : unloads the current module\n"));
    _tprintf(_T("x          enum <mask> : enumerates all matching symbols\n"));
    _tprintf(_T("n       name <symname> : finds a symbol by it's name\n"));
    _tprintf(_T("a          addr <addr> : finds a symbol by it's hex address\n"));
    _tprintf(_T("m      enumaddr <addr> : lists all symbols with a certain hex address\n"));
    _tprintf(_T("b       base <address> : sets the new default base address\n"));
    _tprintf(_T("s       next <add/nam> : finds the symbol after the passed sym\n"));
    _tprintf(_T("p       prev <add/nam> : finds the symbol before the passed sym\n"));
    _tprintf(_T("l      line <file#num> : finds the matching line number\n"));
    _tprintf(_T("       laddr <address> : finds a source line by it's corresponding hex address\n"));
    _tprintf(_T("j             linenext : goes to the next line after the current\n"));
    _tprintf(_T("k             lineprev : goes to the line previous to the current\n"));
    _tprintf(_T("srchtree <path> <file> : finds file in path\n"));
    _tprintf(_T("         ffpath <file> : finds file in symbol path\n"));
    _tprintf(_T("r           src <mask> : lists source files\n"));
    _tprintf(_T("+ add <name addr> <sz> : adds symbols with passed name, address, & size\n"));
    _tprintf(_T("-      del <name/addr> : deletes symbols with passed name or address\n"));
    _tprintf(_T("z locals <func> <mask> : finds all locals a function\n"));
    _tprintf(_T("          multi <name> : loads the requested module 1000 times\n"));
    _tprintf(_T("t          type <name> : lists the type information for the symbol\n"));
    _tprintf(_T("i                 info : displays information about the loaded module\n"));
    _tprintf(_T("o           obj <mask> : displays object files in the loaded module\n"));
    _tprintf(_T("e    elines <src> <obj>: enumerates lines with optional src mask and obj mask\n"));
    _tprintf(_T("     srch <parameters> : enumerates all symbols - use 'srch ?' for help\n"));
    _tprintf(_T("                  dtag : displays all the symtag values\n"));
    _tprintf(_T("          undec <name> : undecorates a given symbol name\n"));
    _tprintf(_T(" findexe <name> <path> : locates an image in the symbol path\n"));
    _tprintf(_T(" finddbg <name> <path> : locates an dbg file in the symbol path\n"));
    _tprintf(_T("        sympath <path> : sets or displays the symbol search path\n"));
    _tprintf(_T("    dir <fname> <path> : calls EnumDirTree to find filename on path\n"));
    _tprintf(_T("           index <val> : finds symbol with matching index value\n"));
    _tprintf(_T("       scope <add/nam> : finds the parent of a symbol\n"));
    _tprintf(_T("                etypes : enumerates all types\n"));
    _tprintf(_T("               enummod : enumerates all modules\n"));
    _tprintf(_T(" sup <pth> <fil> <fil> : finds the symbol server supplement to store\n"));
    _tprintf(_T("         srvind <file> : finds the symbol server index for store\n"));
    _tprintf(_T("        srvpath <path> : tests if path is to a symbol store\n"));
    _tprintf(_T("storeadd <fil> <store> : adds a file to a symbol store\n"));
    _tprintf(_T("    getsym <img> <sym> : finds the matching symbol for and image\n"));
    _tprintf(_T(" getfile <name> <idx>> : finds a file based on the symbol server index\n"));
    _tprintf(_T("srclines <file> <line> : finds matching source lines\n"));
    _tprintf(_T("            mod <base> : changes default module\n"));
    _tprintf(_T("               refresh : refreshes the module list\n"));
    _tprintf(_T("           home <path> : sets the home directory\n"));
    _tprintf(_T("                  omap : dumps the module omaps\n"));
    _tprintf(_T("                setret : toggle the return value of enum procs\n"));
    _tprintf(_T("     symopt <+/-><opt> : sets or displays the current symbol options\n"));
    _tprintf(_T("    epmod <process id> : enumerate the modules loaded for a given process\n"));
    _tprintf(_T("                  dump : dumps all function symbols\n"));
    _tprintf(_T("          uw <address> : gets the unwind info for a function\n"));
    _tprintf(_T("            fii <file> : dumps the symsrv indexes for a binary and assciated files\n"));

    return true;
}


// fnVerbose - display debug spew from dbghelp

BOOL fnVerbose(__in PCTSTR param)
{
    DWORD opts = gOptions;

    if (!param || !*param) 
    {
        _tprintf(_T(""));
    } 
    else if (!_tcsicmp(param, _T("on"))) 
    {
        gVerbose = true;
        opts |= SYMOPT_DEBUG;
    } 
    else if (!_tcsicmp(param, _T("off"))) 
    {
        gVerbose = false;
        opts = gOptions & ~SYMOPT_DEBUG;
    } 
    else 
    {
        _tprintf(_T("verbose <on//off>\n"));
    }

    gOptions = SymSetOptions(opts);

    _tprintf(_T("verbose mode %s.\n"), gOptions & SYMOPT_DEBUG ? _T("on") : _T("off"));

    return true;
}

// fnLoad - load an image

BOOL fnLoad(__in PCTSTR param)
{
    TCHAR ext[MAX_STR];
    TCHAR mod[MAX_STR];
    DWORD flags = 0;
    DWORD64 addr  = 0;
    DWORD size  = 0x1000000;
    HANDLE hf = INVALID_HANDLE_VALUE;
    BOOL dontopen = true;

    if (ghProc)
    {
        _tprintf(_T("no loading or unloading of modules when attached to a process\n"));
        return true;
    }

    if (!*param)
    {
        _tprintf(_T("load <modname> - you must specify a module to load\n"));
        return true;
    }

    _tsplitpath_s(param, NULL, 0, NULL, 0, mod, cch(mod), ext, cch(ext));

    // if no extension is passed, then this is a virtual module that can be used
    // to add and delete symbols with fnAdd and fnDelete

    if (!*ext) 
    {
        flags = SLMFLAG_VIRTUAL;
        addr = gDefaultBaseForVirtualMods;
    } 
    else if (!_tcsicmp(ext, _T(".pdb"))) 
    {
        addr = gDefaultBaseForVirtualMods;
        dontopen = true;
    } else {
        addr = gDefaultBase;
    }

    // unload any currently loaded module

    fnUnload(NULL);

    _tcscpy_s(gModName, cch(gModName), mod);
    tcs2ansi(gModName, gAnsiModName, cch(gAnsiModName));

    // you can do this with or without an open file handle

    if (!dontopen)
    {
        hf = CreateFile(param,
                        GENERIC_READ,
                        0, //FILE_SHARE_READ,
                        NULL,
                        OPEN_EXISTING,
                        0,
                        0);

        if (hf == INVALID_HANDLE_VALUE)
        {
            *gModName = 0;
            _tprintf(_T("error 0x%x loading %s.\n"), GetLastError(), param);
            return true;
        }

        size = GetFileSize(hf, NULL);
    }

    // do it

    addr = SymLoadModuleEx(gTID,
                           hf,         // hFile,
                           param,      // ImageName,
                           mod,        // ModuleName,
                           addr,       // BaseOfDll,
                           size,       // SizeOfDll
                           NULL,       // Data
                           flags);  // SLMFLAG_NO_SYMBOLS);
    if (!addr)
    {
        *gModName = 0;
        _tprintf(_T("error 0x%x loading %s.\n"), GetLastError(), param);
        return true;
    }

    // set up globals

    _tcscpy_s(gImageName, cch(gImageName), param);
    gBase = addr;

    if (hf != INVALID_HANDLE_VALUE)
        CloseHandle(hf);

    gModLoaded = true;

    return true;
}


// fnUnload - unload the image

BOOL fnUnload(__in_opt PCTSTR param)
{
    if (!gBase)
        return true;

    if (ghProc)
    {
        if (!gCleanup)
            _tprintf(_T("no loading or unloading of modules when attached to a process\n"));
        return true;
    }

    if (!SymUnloadModule64(gTID, gBase))
        _tprintf(_T("error unloading %s at %s\n"), gModName, dispaddr(gBase));

    gBase = 0;
    *gModName = 0;
    gModLoaded = false;

    return true;
}


// fnEnum - enumerate the symbols

BOOL fnEnum(__in PCTSTR param)
{
    BOOL rc;

    gEnumSymbolsTitle = false;
    rc = SymEnumSymbols(gTID, base(param), param, cbEnumSymbols, NULL);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumSymbols()\n"), GetLastError());

    return true;
}


// fnEnumSrcFiles - enumerate the source files

BOOL
CALLBACK
cbSrcFiles(
    __in PSOURCEFILE pSourceFile,
    __in PVOID UserContext
    )
{
    if (!pSourceFile)
        return false;

    _tprintf(_T("%s\n"), pSourceFile->FileName);

    return true;
}

BOOL fnEnumSrcFiles(__in PCTSTR param)
{
    BOOL rc;

    rc = SymEnumSourceFiles(gTID, base(param), param, cbSrcFiles, NULL);
    if (!rc)
        _tprintf(_T("error 0x%0 calling SymEnumSourceFiles()\n"), GetLastError());

    return true;
}


// search for a symbol by name

BOOL fnName(__in PCTSTR param)
{
    SYMBOL_INFO_PACKAGE sip;    // this struct saves allocation code
    TCHAR name[MAX_STR];

    if (!param || !*param)
    {
        _tprintf(_T("name <symbolname> - finds a symbol by it's name\n"));
        return true;
    }
    _stprintf_s(name, cch(name), _T("%s!%s"), gModName, param);

    ZeroMemory(&sip, sizeof(sip));
    sip.si.SizeOfStruct = sizeof(SYMBOL_INFO);
    sip.si.MaxNameLen = MAX_SYM_NAME;

    if (!SymFromName(gTID, param, &sip.si))
    {
        _tprintf(_T("no symbol found\n"));
        return true;
    }

    dumpsi(&sip.si);
    gLastSym = sip.si.Address;

#ifdef DISPLAY_LINE_INFO
    // display line number info
    TCHAR addr[MAX_STR];
    _stprintf_s(addr, cch(addr), _T("%I64x"), sip.si.Address);
    fnLineAddr(addr);
#endif

#ifdef TEST_REVERSE_LOOKUP_BY_INDEX
    // do reverse lookup by the returned index value
    _tprintf(_T("\n"));
    if (SymFromIndex(gTID, gBase, sip.si.Index, &sip.si))
        dumpsi(&sip.si);
#endif

    return true;
}


// search for a symbol by address

BOOL fnAddr(__in PCTSTR param)
{
    BOOL rc;
    DWORD64 addr;
    DWORD64 disp;
    SYMBOL_INFO_PACKAGE sip;

    addr = sz2dw64(param);
    if (!addr)
    {
        _tprintf(_T("addr <address> : finds a symbol by it's hex address\n"));
        return true;
    }

    // current API

    sip.si.SizeOfStruct = sizeof(SYMBOL_INFO);
    sip.si.Address = 0;
    sip.si.MaxNameLen = MAX_SYM_NAME;
    rc = SymFromAddr(gTID, addr, &disp, &sip.si);

    // display results

    if (rc)
    {
        _tprintf(_T("%s"), sip.si.Name);
        if (disp)
            _tprintf(_T("+%I64x"), disp);
        _tprintf(_T("\n"));
        dumpsi(&sip.si);
        gLastSym = sip.si.Address;
    }

#ifdef YOU_WANT_TO_USE_THE_OLD_API_FUNCTION
    IMAGEHLP_SYMBOL64_PACKAGE symp;

    symp.sym.Address = 0;
    symp.sym.MaxNameLength = MAX_SYM_NAME;
    rc = SymGetSymFromAddr64(gTID, addr, &disp, &symp.sym);

    if (symp.sym.Address != sip.si.Address)
        _tprintf(_T("SymGetSymFromAddr64() doesn't match SymFromAddr()\n"));
#endif

    return true;
}


// enumerate all symbols with the passed address

BOOL fnEnumForAddr(__in PCTSTR param)
{
    BOOL rc;
    DWORD64 addr;
    ENUMSYMDATA esd;

    addr = sz2dw64(param);
    if (!addr)
    {
        _tprintf(_T("enumaddr <addr> : lists all symbols with a certain hex address\n"));
        return true;
    }

    esd.base = gBase;
    _tcscpy_s(esd.mask, cch(esd.mask), _T(""));

    gEnumSymbolsTitle = false;
    rc = SymEnumSymbolsForAddr(gTID, addr, cbEnumSymbols, &esd);
    if (!rc)
        _tprintf(_T("error 0x%0 calling SymEnumSymbolsForAddr()\n"), GetLastError());

    return true;
}


// find locals for passed symbol

BOOL fnLocals(__in PCTSTR param)
{
    PSYMBOL_INFO si;
    TCHAR name[MAX_STR];
    IMAGEHLP_STACK_FRAME frame;
    ENUMSYMDATA esd;
    TCHAR mask[MAX_SYM_NAME + 1] = _T("");
    TCHAR scopename[MAX_SYM_NAME + 1] = _T("");
    int count;

    // parse the parameters

    if (!param || !*param)
    {
        _tprintf(_T("locals <symbolname> <mask>- finds all locals a function\n"));
        return true;
    }

    count = _stscanf_s(param, _T("%s %s"), scopename, cch(scopename), mask, cch(mask));
    if (count < 2)
        *mask = 0;
    if (count < 1)
        *scopename = 0;

    // if a module is not specified, presume the current module

    if (_tcschr(scopename, _T('!')))
        _tcscpy_s(name, cch(name), scopename);
    else
        _stprintf_s(name, cch(name), _T("%s!%s"), gModName, scopename);

    // set up the structure

    si = (PSYMBOL_INFO)malloc(SI_BUFFER_SIZE);
    if (!si)
        return false;
    ZeroMemory(si, SI_BUFFER_SIZE);
    si->SizeOfStruct = sizeof(SYMBOL_INFO);
    si->MaxNameLen = MAX_SYM_NAME;

    // get the scope

    if (!SymFromName(gTID, name, si))
        goto exit;

    _tprintf(_T("dumping locals for %s...\n"), si->Name);

    // set the current context to match the scoped symbol

    ZeroMemory(&frame, sizeof(frame));
    frame.InstructionOffset = si->Address;

    // We can set the current context from either an address or from the symbol index

    SymSetScopeFromAddr(gTID, si->Address);
    SymSetScopeFromIndex(gTID, si->Address, si->Index);

    // enumerate the locals

    esd.base = gBase;
    _tcscpy_s(esd.mask, cch(esd.mask), *mask ? mask : _T(""));
    gEnumSymbolsTitle = false;
    if (!SymEnumSymbols(gTID, 0, mask, cbEnumSymbols, &esd))
        _tprintf(_T("error 0x%0 calling SymEnumSymbols()\n"), GetLastError());

exit:
    free(si);

    return true;
}


// serves no real purpose - use this to look for leaks in dbghelp

BOOL fnMulti(__in PCTSTR param)
{
    int i;

    for (i = 0; i < 1000; i++)
    {
        if (!fnLoad(param))
            return false;
        if (!fnUnload(param))
            return false;
    }

    return true;
}


// obtain simple type information

BOOL fnType(__in PCTSTR param)
{
    PSYMBOL_INFO si;

    if (!param || !*param)
    {
        _tprintf(_T("type <typename> - finds type info\n"));
        return true;
    }

    si = (PSYMBOL_INFO)malloc(SI_BUFFER_SIZE);
    if (!si)
        return false;
    ZeroMemory(si, SI_BUFFER_SIZE);
    si->SizeOfStruct = sizeof(*si);
    si->MaxNameLen = MAX_SYM_NAME;

    if (SymGetTypeFromName(gTID, gBase, param, si))
        dumpsi(si);

    free(si);

    return true;
}


// get module information

BOOL fnInfo(__in PCTSTR param)
{
    IMAGEHLP_MODULE64 mi;

    static PTSTR symtypes[NumSymTypes] =
    {
        _T("SymNone"),
        _T("SymCoff"),
        _T("SymCv"),
        _T("SymPdb"),
        _T("SymExport"),
        _T("SymDeferred"),
        _T("SymSym"),
        _T("SymDia"),
        _T("SymVirtual")
    };

    ZeroMemory((void *)&mi, sizeof(mi));
    mi.SizeOfStruct = sizeof(mi);

    if (!SymGetModuleInfo64(gTID, gBase, &mi))
    {
        _tprintf(_T("error 0x%x calling SymGetModuleInfo64()\n"), GetLastError());
        return true;
    }

    if (mi.SymType < 0 || mi.SymType >= NumSymTypes)
    {
        _tprintf(_T("SymGetModuleInfo64() returned unrecognized SymType\n"));
        return true;
    }

    _tprintf(_T("    SizeOfStruct : 0x%x\n"), mi.SizeOfStruct);
    _tprintf(_T("     BaseOfImage : 0x%i64x\n"), mi.BaseOfImage);
    _tprintf(_T("       ImageSize : 0x%x\n"), mi.ImageSize);
    _tprintf(_T("   TimeDateStamp : 0x%x\n"), mi.TimeDateStamp);
    _tprintf(_T("        CheckSum : 0x%x\n"), mi.CheckSum);
    _tprintf(_T("         NumSyms : 0x%x\n"), mi.NumSyms);
    _tprintf(_T("         SymType : %s\n"), symtypes[mi.SymType]);
    _tprintf(_T("      ModuleName : %s\n"), mi.ModuleName);
    _tprintf(_T("       ImageName : %s\n"), mi.ImageName);
    _tprintf(_T(" LoadedImageName : %s\n"), mi.LoadedImageName);
    _tprintf(_T("   LoadedPdbName : %s\n"), mi.LoadedPdbName);
    _tprintf(_T("           CVSig : 0x%x\n"), mi.CVSig);
    _tprintf(_T("          CVData : %s\n"), mi.CVData);
    _tprintf(_T("          PdbSig : 0x%x\n"), mi.PdbSig);
    _tprintf(_T("        PdbSig70 : 0x%08x, 0x%04x, 0x%04x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x, 0x%02x\n"),
             mi.PdbSig70.Data1,
             mi.PdbSig70.Data2,
             mi.PdbSig70.Data3,
             mi.PdbSig70.Data4[0],
             mi.PdbSig70.Data4[1],
             mi.PdbSig70.Data4[2],
             mi.PdbSig70.Data4[3],
             mi.PdbSig70.Data4[4],
             mi.PdbSig70.Data4[5],
             mi.PdbSig70.Data4[6],
             mi.PdbSig70.Data4[7]);
    _tprintf(_T("          PdbAge : 0x%x\n"), mi.PdbAge);
    _tprintf(_T("    PdbUnmatched : %s\n"), mi.PdbUnmatched ? _T("true") : _T("false"));
    _tprintf(_T("    DbgUnmatched : %s\n"), mi.DbgUnmatched ? _T("true") : _T("false"));
    _tprintf(_T("     LineNumbers : %s\n"), mi.LineNumbers ? _T("true") : _T("false"));
    _tprintf(_T("   GlobalSymbols : %s\n"), mi.GlobalSymbols ? _T("true") : _T("false"));
    _tprintf(_T("        TypeInfo : %s\n"), mi.TypeInfo ? _T("true") : _T("false"));
    _tprintf(_T("   SourceIndexed : %s\n"), mi.SourceIndexed ? _T("true") : _T("false"));
    _tprintf(_T("   PublicSymbols : %s\n"), mi.Publics ? _T("true") : _T("false"));

    return true;
}


// enumerate objs within a module

BOOL fnObj(__in PCTSTR param)
{
    BOOL rc;
    ENUMSYMDATA esd;

    // The obj names can be quite long and may look something like this...
    // d:\fbrel.obj.amd64fre\base\crts\crtw32\convert\mt\objfre\amd64\atox.obj
    // To find "atox" in the above, search for "*atox*".

    esd.base = gBase;
    _tcscpy_s(esd.mask, cch(esd.mask), param ? param : _T(""));

    rc = SymSearch(gTID, gBase, 0, SymTagCompiland, param, 0, cbEnumObjs, &esd, SYMSEARCH_MASKOBJS);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymSearch()\n"), GetLastError());

    return true;
}


// fnEnumLines - enumerate lines within an image

BOOL
CALLBACK
cbEnumLines(
    __in PSRCCODEINFO sci,
    __in PVOID context
    )
{
    static int cnt;

    if (!sci)
        return false;

    // if this is a new obj file - note it

    if (_tcscmp(gObj, sci->Obj) )
    {
        _tcscpy_s(gObj, cch(gObj), sci->Obj);
        _tprintf(_T("\nOBJ:%s"), sci->Obj);
    }

    // if this is a new source file - note it

    if (_tcscmp(gSrcFileName, sci->FileName))
    {
        _tcscpy_s(gSrcFileName, cch(gSrcFileName), sci->FileName);
        _tprintf(_T("\n   %s "), sci->FileName);
        cnt = 0;
    }

    // formatting

    if (cnt > 15)
        cnt = 0;
    if (!cnt)
        _tprintf(_T("\n     "));

    // display the line number

    _tprintf(_T(" %d"), sci->LineNumber);

    // formatting

    cnt++;

    return grcEnumProc;
}

BOOL fnEnumLines(__in PCTSTR param)
{
    BOOL rc;
    TCHAR obj[MAX_PATH + 1] = _T("");
    TCHAR file[MAX_PATH + 1] = _T("");
    PTSTR pobj = NULL;
    PTSTR pfile = NULL;

    // first parameter is the optional source file mask
    // second parameter is the optional obj file mask

    if (param)
        _stscanf_s(param, _T("%s %s"), file, cch(file), obj, cch(obj));
    if (*file)
        pfile = file;
    if (*obj)
        pobj = obj;

    // these are used by the callbacks - initialize them

    *gSrcFileName = 0;
    *gObj = 0;

    // make the call

    rc = SymEnumLines(gTID, gBase, pobj, pfile, cbEnumLines, NULL);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumLines()\n"), GetLastError());
    else
        _tprintf(_T("\n"));

    return true;
}


// fnSearch - locates and enumerates any item in a pdb

BOOL
CALLBACK
cbSearch(
    __in PSYMBOL_INFO si,
    __in ULONG size,
    __in PVOID context
    )
{
#if 0
    SYMBOL_INFO_PACKAGE sip;
    BOOL scope;

    sip.si.SizeOfStruct = sizeof(SYMBOL_INFO);
    sip.si.MaxNameLen = sizeof(SYMBOL_INFO_PACKAGE) - sip.si.SizeOfStruct;
    scope = SymGetScope(gTID, gBase, si->Index, &sip.si);
#endif

    if (!gEnumSymbolsTitle)
    {
        gEnumSymbolsTitle = true;
        _tprintf(_T(" index            address                             name\n"));
    }


   _tprintf(_T("  %4x  %8s "), si->Index, _dispaddr(si->Address, true));
    if (si->Flags & SYMF_FORWARDER)
        _tprintf(_T("%c "), 'F');
    else if (si->Flags & SYMF_EXPORT)
        _tprintf(_T("%c "), 'E');
    else
        _tprintf(_T("  "));
#if 0
    _tprintf(_T("  %4x "), scope ? sip.si.Index : 0);
#endif
    _tprintf(_T("%-23s "), dispsymtag(si->Tag));
    _tprintf(_T(": %s\n"), si->Name);

    if (si->Tag == SymTagAnnotation)
    {
        PTSTR p;
        for (p = si->Name + _tcslen(si->Name) + 1; *p; p += _tcslen(p) + 1)
            _tprintf(_T("                       %s\n"), p);
    }

    return grcEnumProc;
}


BOOL SearchUsage()
{
    _tprintf(_T("srch: [index=X] [tag=X] [mask=sss] [addr=X] [globals]\n"));
    _tprintf(_T("      index : hex index of symbol to use as the parent for the search\n"));
    _tprintf(_T("      tag   : hex symtag value to filter on (view values with 'dtag' command)\n"));
    _tprintf(_T("      mask  : string to use as a mask for finding items\n"));
    _tprintf(_T("      addr  : hex address of items to match\n"));
    _tprintf(_T("   globals  : process only globals\n"));
    _tprintf(_T("   recurse  : recurse a scopes\n"));
    return false;
}

PCTSTR
NextToken(
    __in PCTSTR buf,
    __out_ecount(size) PTSTR sz,
    __in int size
    )
{
    PCTSTR p;
    int i;

    if (size < 2)
        return NULL;

    *sz = 0;
    if (!buf || !*buf)
        return NULL;

    for (p = buf, i = 0; *p && i < size - 1; p++, i++)
    {
        sz[i] = *p;
        if (!_istspace((TUCHAR)*p))
            continue;
        sz[i] = 0;
        if (*(p + 1))
            return p + 1;
        return NULL;
    }

    sz[i] = 0;
    return NULL;
}

BOOL
SearchParams(
    __in PCTSTR param,
    __out DWORD *index,
    __out DWORD *tag,
    __out_ecount(size) PTSTR mask,
    __in int size,
    __in DWORD64 *addr,
    __out BOOL *globals,
    __out BOOL *recurse,
    __out BOOL *all
    )
{
    PCTSTR p;
    TCHAR sz[MAX_STR] = _T("");;
    PTSTR val;
    DWORD64 dw;

    for (p = NextToken(param, sz, cch(sz)); *sz; p = NextToken(p, sz, cch(sz)))
    {

        if (!_tcsnicmp(sz, _T("index="), 6)) 
        {
            val = _tcschr(sz, _T('='));
            dw = sz2dw64(val + 1);
            if (!dw)
                return SearchUsage();
            *index = (DWORD)dw;
        }
        else if (!_tcsnicmp(sz, _T("tag="), 4)) 
        {
            val = _tcschr(sz, _T('='));
            dw = sz2dw64(val + 1);
            if (!dw)
                return SearchUsage();
            *tag = (DWORD)dw;
        }
        else if (!_tcsnicmp(sz, _T("mask="), 5)) 
        {
            val = _tcschr(sz, _T('='));
            _tcscpy_s(mask, size, val + 1);
        }
        else if (!_tcsnicmp(sz, _T("addr="), 5)) 
        {
            val = _tcschr(sz, _T('='));
            *addr = sz2dw64(val + 1);
        }
        else if (!_tcsicmp(sz, _T("globals"))) 
        {
            *globals = true;
        }        
        else if (!_tcsicmp(sz, _T("recurse"))) 
        {
            *recurse = true;
        }
        else if (!_tcsicmp(sz, _T("all"))) 
        {
            *all = true;
        }
        else
        {
            return SearchUsage();
        }
    }

    return true;
}


BOOL fnSearch(__in PCTSTR param)
{
    DWORD tag = 0;
    TCHAR maskbuf[4098] = _T("");
    PTSTR mask = maskbuf;
    DWORD index = 0;
    DWORD64 addr = 0;
    BOOL globals = 0;
    BOOL recurse = false;
    BOOL all = false;
    DWORD flags = 0;
    ENUMSYMDATA esd;

    if (!SearchParams(param, &index, &tag, maskbuf, cch(maskbuf), &addr, &globals, &recurse, &all))
        return true;

    if (globals) 
        flags |= SYMSEARCH_GLOBALSONLY;
    if (recurse) 
        flags |= SYMSEARCH_RECURSE;
    if (all) 
        flags |= SYMSEARCH_ALLITEMS;

    esd.base = gBase;
    _tcscpy_s(esd.mask, cch(esd.mask), param ? param : _T(""));
    gIndex = (PTSTR )calloc(0xfffffff, 1);

    gEnumSymbolsTitle = false;
    if (!SymSearch(gTID,
                   gBase,
                   index,
                   tag,
                   mask,
                   addr,
                   cbSearch,
                   &esd,
                   flags))
    {
        _tprintf(_T("error 0x% calling SymSearch()\n"), GetLastError());
    }

    free(gIndex);
    gIndex = NULL;

    return true;
}


// fnDumpTags - display all symtag values

BOOL fnDumpTags(__in PCTSTR param)
{
    DWORD tag;

    for (tag = 0; tag < SymTagMax; tag++)
        _tprintf(_T("  0x%02x : %s\n"), tag, dispsymtag(tag));

    return true;
}


// search for a line by address

BOOL fnLineAddr(__in PCTSTR param)
{
    BOOL rc;
    DWORD64 addr;
    DWORD disp;
    IMAGEHLP_LINE64 line;

    addr = sz2dw64(param);
    if (!addr)
    {
        _tprintf(_T("laddr <address> : finds a source line by it's corresponding hex address\n"));
        return true;
    }

    ZeroMemory(&line, sizeof(line));
    line.SizeOfStruct = sizeof(line);
    rc = SymGetLineFromAddr64(gTID, addr, &disp, &line);

    if (!rc) {
        _tprintf(_T("line: error 0x%x looking for source at 0x%I64x\n"),
                 GetLastError(),
                 addr);
        return true;
    }

    dumpLine(&line);
    _tprintf(_T("disp : %x\n"), disp);

    return true;
}


// fnFindExe - find an executable image

BOOL
CALLBACK
cbFindExe(
    __in HANDLE fh,
    __in PCTSTR fname,
    __in PVOID data
    )
{
    _tprintf(_T("%s\n"), fname);

    // if you want FindExecutableImageEx to return anything, then return true here

    return false;
}

BOOL fnFindExe(__in PCTSTR param)
{
    HANDLE fh;
    TCHAR found[MAX_PATH + 1];
    TCHAR path[MAX_PATH + 1] = _T("");
    TCHAR mask[MAX_PATH + 1] = _T("");

    if (!param)
    {
        _tprintf(_T("findexe <filename> <path> - you must specify a file to find\n"));
        return true;
    }

    if (_stscanf_s(param, _T("%s %s"), mask, cch(mask), path, cch(path)) < 1)
    {
        _tprintf(_T("findexe <filename> <path> - you must specify a file to find\n"));
        return true;
    }
    if (!*path)
        _tcscpy_s(path, cch(path), _T("."));

    *found = 0;
    fh = FindExecutableImageEx(mask, path, found, cbFindExe, _T("This is caller data"));
    if (fh)
        _tprintf(_T("FindExe: handle=0x%p file=%s\n"), fh, found);

    return true;
}


// fnFindDbgInfo - find a dbg file

BOOL
CALLBACK
cbFindDbgInfo(
    __in HANDLE fh,
    __in PCTSTR fname,
    __in PVOID data
    )
{
    _tprintf(_T("%s\n"), fname);

    // if you want FindDebugInfoFileEx to return anything, then return true here

    return false;
}

BOOL fnFindDbgInfo(__in PCTSTR param)
{
    HANDLE fh;
    TCHAR found[MAX_PATH + 1];
    TCHAR path[MAX_PATH + 1] = _T("");
    TCHAR mask[MAX_PATH + 1] = _T("");

    if (!param)
    {
        _tprintf(_T("finddbg <filename> <path> - you must specify a file to find\n"));
        return true;
    }

    if (_stscanf_s(param, _T("%s %s"), mask, cch(mask), path, cch(path)) < 1)
    {
        _tprintf(_T("finddbg <filename> <path> - you must specify a file to find\n"));
        return true;
    }
    if (!*path)
        _tcscpy_s(path, cch(path), _T("."));

    *found = 0;
    fh = FindDebugInfoFileEx(mask, path, found, cbFindDbgInfo, _T("This is caller data"));
    if (fh)
        _tprintf(_T("FindDbg: handle=0x%p file=%s\n"), fh, found);

    return true;
}


// fnSymPath - sets or displays the symbol search path

BOOL fnSymPath(__in PCTSTR param)
{
    BOOL rc;
    TCHAR path[MAX_PATH * 4];

    if (*param)
    {
        rc = SymSetSearchPath(gTID, param);
        if (!rc)
            _tprintf(_T("SymSetSearchPath: error 0x%x\n"), GetLastError());
        else
            _tcscpy_s(gSymbolSearchPath, cch(gSymbolSearchPath), param);
    }

    rc = SymGetSearchPath(gTID, path, cch(path));
    _tprintf(_T("Symbol Search Path: "));
    if (rc)
        _tprintf(_T("%s\n"), path);
    else
        _tprintf(_T("error 0x%x\n"), GetLastError());

    return true;
}


// fnDir - walk through a directory tree

BOOL
CALLBACK
cbEnumDirTree(
    __in PCTSTR path,
    __in PVOID data
    )
{
    _tprintf(_T("%s\n"), path);

    return false;
}

BOOL fnDir(__in PCTSTR param)
{
    TCHAR found[MAX_PATH + 1];
    TCHAR path[MAX_PATH + 1] = _T("");
    TCHAR mask[MAX_PATH + 1] = _T("");

    if (!param)
    {
        _tprintf(_T("dir <filename> <path> - you must specify a file to find\n"));
        return true;
    }

    if (_stscanf_s(param, _T("%s %s"), mask, cch(mask), path, cch(path)) < 1)
    {
        _tprintf(_T("dir <filename> <path> - you must specify a file to find\n"));
        return true;
    }
    if (!*path)
        _tcscpy_s(path, cch(path), _T("."));

    EnumDirTree(gTID,
                path,
                mask,
                found,
                cbEnumDirTree,
                _T("This is the callback data."));

    return true;
}


// search for a symbol by index

BOOL fnIndex(__in PCTSTR param)
{
    BOOL rc;
    DWORD index;
    SYMBOL_INFO_PACKAGE sip;

    if (!param || !*param) 
    {
        _tprintf(_T("index <value> : must specify the index of the symbol to find.\n"));
        return true;
    }

    rc = _stscanf_s(param, _T("%x"), &index);
    if ((rc < 1) || (!index))
    {
        _tprintf(_T("index <value> : must specify the index of the symbol to find.\n"));
        return true;
    }

    sip.si.SizeOfStruct = sizeof(sip.si);
    sip.si.MaxNameLen = MAX_SYM_NAME;

    rc = SymFromIndex(gTID, gBase, index, &sip.si);
    if (rc)
        dumpsi(&sip.si);

    return true;
}


// find the parent of a symbol

BOOL fnScope(__in PCTSTR param)
{
    BOOL rc;
    SYMBOL_INFO_PACKAGE sip;
    DWORD index;
    DWORD64 addr;

    ZeroMemory(&sip, sizeof(sip));
    sip.si.SizeOfStruct = sizeof(sip.si);
    sip.si.MaxNameLen = MAX_SYM_NAME;

    addr = sz2dw64(param);
    if (!addr)
        rc = SymFromName(gTID, param, &sip.si);
    else
        rc = SymFromAddr(gTID, addr, NULL, &sip.si);

    if (!rc || !sip.si.Address)
        return true;
    index = sip.si.Index;

    rc = SymGetScope(gTID, gBase, index, &sip.si);
    if (rc)
        dumpsi(&sip.si);

    return true;
}


// fnEnumTypes - enumerate types

BOOL
CALLBACK
cbEnumTypes(
    PSYMBOL_INFO si,
    ULONG size,
    PVOID context
    )
{
    _tprintf(_T("  0x%-8x : %s\n"), si->Index, si->Name);

    return grcEnumProc;
}

BOOL fnEnumTypes(__in PCTSTR param)
{
    BOOL rc;
    ENUMSYMDATA esd;

    esd.base = gBase;

    if (param && *param)
    {
        if (_tcschr(param, _T('!')))
            rc = SymEnumTypesByName(gTID, 0, param, cbEnumTypes, &esd);
        else
            rc = SymEnumTypesByName(gTID, gBase, param, cbEnumTypes, &esd);
    }
    else
        rc = SymEnumTypes(gTID, gBase, cbEnumTypes, &esd);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumTypes()\n"), GetLastError());

    return true;
}


// fnEnumMod - enumerate all loaded modules

BOOL
CALLBACK
cbEnumMod64(
    __in PCTSTR name,
    __in DWORD64 base,
    __in PVOID context
    )
{
    _tprintf(_T("0x%p %s\n"), (PVOID)base, name);

    return true;
}

BOOL fnEnumMod(__in PCTSTR param)
{
    BOOL rc;

    rc = SymEnumerateModules64(gTID, cbEnumMod64, _T("test string"));
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumumerateModules64()\n"), GetLastError());

    return true;
}


// compares two images and stores a text file in the supplement section
// of a symbol store in an index location that recognizes the delta between
// the two images

BOOL CreateTextFile(
    __in PCTSTR inname,
    __out_ecount(size) PTSTR outname,
    __in size_t size
    )
{
    // generate a simple text file

    TCHAR fname[_MAX_FNAME + 1];
    TCHAR ext[_MAX_EXT + 1];
    char  buf[MAX_PATH];
    HANDLE hf;
    DWORD cb;
    int   i;

    _tsplitpath_s(inname, NULL, 0, NULL, 0, fname, cch(fname), ext, cch(ext));
    _stprintf_s(outname, size, _T("%s%s"), fname, ext);

    if (GetFileAttributes(outname) != -1)
        return true;

    hf = CreateFile(outname,
                    GENERIC_WRITE,
                    0,
                    NULL,
                    CREATE_NEW,
                    0,
                    0);

    if (hf == INVALID_HANDLE_VALUE)
    {
        _tprintf(_T("error 0x%x creating %s.\n"), GetLastError(), outname);
        return false;
    }

    for (i = 0; i < 100; i++) {
        sprintf_s(buf, cch(buf), "This is line %d of the test file.\n", i);
        WriteFile(hf, buf, (DWORD)strlen(buf) * sizeof(buf[0]), &cb, NULL);
    }

    CloseHandle(hf);

    return true;
}

BOOL fnSupplement(__in PCTSTR param)
{
    TCHAR one[MAX_PATH + 1];
    TCHAR two[MAX_PATH + 1];
    TCHAR srv[MAX_PATH + 1];
    PCTSTR path;
    TCHAR testfile[MAX_PATH + 1];
    PCTSTR file;

    // parse the commands

    _tcscpy_s(srv, cch(srv), _T("srv*"));
    if (_stscanf_s(param, _T("%s %s %s"), srv + 4, cch(srv) - 4, one, cch(one), two, cch(two)) < 2) 
    {
        _tprintf(_T("sup: must specify a server and two image files\n"));
        return true;
    }

    // generate a name for the delta file base on the target file contents

    file = SymSrvDeltaName(gTID, srv, _T("xml"), one, two);
    if (!file)
    {
        _tprintf(_T("Couldn't create delta file name.\n"));
        return true;
    }
    else
        _tprintf(_T("Delta file name is %s\n"), file);

    // see if such a file is already stored

    path = SymSrvGetSupplement(gTID, srv, one, file);
    if (path) {
        _tprintf(_T("%s\n"), path);
        return true;
    }

    _tprintf(_T("Delta not found.\n"));

    // it's not, generate a dummy file to use

    if (!CreateTextFile(file, testfile, cch(testfile)))
        return true;

    // and store it.

    path = SymSrvStoreSupplement(gTID, srv, one, testfile, SYMSTOREOPT_COMPRESS);
    if (!path)
        _tprintf(_T("error 0x%x calling SymSrvStoreSupplement().\n"), GetLastError());
    else
        _tprintf(_T("%s stored in %s\n"), testfile, path);

    return true;
}


// get the index string for a file as used by symbol server

BOOL fnSrvInd(__in PCTSTR param)
{
    TCHAR index[MAX_PATH + 1];
    BOOL rc;

    rc = SymSrvGetFileIndexString(gTID, NULL, param, index, cch(index), 0);
    if (rc)
        _tprintf(_T("%s : %s\n"), param, index);
    else
        _tprintf(_T("error 0x%x calling SymGetFileIndexString().\n"), GetLastError());

    return true;
}


// determine if a path is a symbol store

BOOL fnSrvPath(__in PCTSTR param)
{
    BOOL rc;

    if (!param || !*param) 
    {
        _tprintf(_T("sympath: must specify a path to test\n"));
        return true;
    }

    rc = SymSrvIsStore(gTID, param);
    if (rc)
        _tprintf(_T("%s is a symbol store\n"), param);
    else
        _tprintf(_T("0x%x: %s is not a symbol store\n"), GetLastError(), param);

    return true;
}


// get a matching symbol file from a symbol store

    BOOL fnGetSym(__in PCTSTR param)
{
    TCHAR image[MAX_PATH + 1];
    int type;
    TCHAR path[MAX_PATH + 1];
    TCHAR dbg[MAX_PATH + 1];
    BOOL rc;

    if (_stscanf_s(param, _T("%s %d"), image, cch(image), &type) < 2) 
    {
        _tprintf(_T("getsym <img> <typ> : finds the matching symbol for and image\n"));
        return true;
    }

    rc = SymGetSymbolFile(gTID, NULL, image, type, path, cch(path), dbg, cch(dbg));

    if (rc)
        _tprintf(_T("found %s\n"), path);
    else
        _tprintf(_T("error 0x%x searching for file\n"), GetLastError());

    return true;
}


// get a matching file from a symbol store

BOOL
CALLBACK
cbGetFile(
    __in PCTSTR filename,
    __in PVOID context
    )
{
    // presume the file is okay

    return false;
}

BOOL fnGetFile(__in PCTSTR param)
{
    TCHAR file[MAX_PATH + 1];
    TCHAR idx[MAX_PATH + 1];
    TCHAR found[MAX_PATH + 1];
    BOOL rc;

    if (_stscanf_s(param, _T("%s %s"), file, cch(file), idx, cch(idx)) < 2)
    {
        _tprintf(_T(" getfile <name> <idx>> : finds a file based on the symbol server index\n"));
        return true;
    }

    rc = SymFindFileInPath(gTID, NULL, file, idx, 0, 0, SSRVOPT_STRING, found, cbGetFile, NULL);
    if (rc)
        _tprintf(_T("found %s\n"), found);

    return true;
}


// add a file to a symbol store

BOOL fnStoreAdd(__in PCTSTR param)
{
    TCHAR file[MAX_PATH + 1];
    TCHAR store[MAX_PATH + 1];
    TCHAR srvpath[MAX_PATH + 20 + 1];
    TCHAR index[MAX_PATH + 1];
    PCTSTR path;
    BOOL rc;

    if (_stscanf_s(param, _T("%s %s"), file, cch(file), store, cch(store)) < 2)
    {
        _tprintf(_T("storeadd <file> <store> : adds a file to a symbol store\n"));
        return true;
    }
    _stprintf_s(srvpath, cch(srvpath), _T("srv*%s"), store);

    rc = SymSrvGetFileIndexString(gTID, srvpath, file, index, cch(index), 0);
    if (rc)
        _tprintf(_T("%s : index is %s\n"), file, index);
    else
        _tprintf(_T("error 0x%x calling SymSrvGetFileIndexString().\n"), GetLastError());

    path = SymSrvStoreFile(gTID, srvpath, file, SYMSTOREOPT_OVERWRITE | SYMSTOREOPT_UNICODE | SYMSTOREOPT_COMPRESS); //  | SYMSTOREOPT_POINTER);
    if (!path)
        _tprintf(_T("error 0x%x storing %s\n"), GetLastError(), file);
    else
        _tprintf(_T("file stored in %s\n"), path);

    return true;
}


// enumerate source lines

BOOL
CALLBACK
cbEnumSourceLines(
    __in PSRCCODEINFO si,
    __in PVOID context
    )
{
    _tprintf(_T("0x%I64x: %s\nline %d %s\n"), si->Address, si->Obj, si->LineNumber, si->FileName);

    return true;
}

BOOL fnSrcLines(__in PCTSTR param)
{
    TCHAR file[MAX_PATH + 1];
    DWORD line;
    BOOL rc;
    DWORD flags;

    if (_stscanf_s(param, _T("%s %d"), file, cch(file), &line) < 2) 
    {
        _tprintf(_T("srclines <file> <line> : finds matching source lines\n"));
        return true;
    }

    flags = ESLFLAG_NEAREST;  //  ESLFLAG_PREV | ESLFLAG_NEXT;  // ESLFLAG_FULLPATH;
    rc = SymEnumSourceLines(gTID, gBase, NULL, file, line, flags, cbEnumSourceLines, NULL);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumSourceLines(%s, %d)\n"), GetLastError(), file, line);

    return true;
}


// Get module info for the address passed in.
// Requires we be attached to a process.

BOOL fnMod(__in PCTSTR param)
{
    DWORD64 base;
    BOOL rc;
    IMAGEHLP_MODULE64 im;

    if (!ghProc)
    {
        _tprintf(_T("mod only applies when attached to a process.\n"));
        return true;
    }

    base = sz2dw64(param);
    if (!base)
    {
        _tprintf(_T("invalid module base.\n"));
        return true;
    }

    ZeroMemory(&im, sizeof(im));
    im.SizeOfStruct = sizeof(im);
    rc = SymGetModuleInfo64(gTID, base, &im);
    if (rc)
    {
        gBase = base;
        _tcscpy_s(gModName, cch(gModName), im.ModuleName);
    }
    else
        _tprintf(_T("couldn't find module at 0x%I64x\n"), base);

    return true;
}


// fnRefresh - refreshes the module list for a process

BOOL
CALLBACK
cbEnumModForList(
    __in PCTSTR name,
    __in DWORD64 base,
    __in PVOID context
    )
{
    _tprintf(_T(" %17s : %s\n"), _dispaddr(base, true), name);

    // if this is 0, then it's the first in the list.  Set it.

    if (!gBase)
    {
        gBase = base;
        gModLoaded = true;
        _tcscpy_s(gModName, cch(gModName), name);
    }

    return true;
}

BOOL EnumModulesForProcess()
{
    BOOL rc;

    gBase = 0;
    rc = SymEnumerateModules64(gTID, cbEnumModForList, NULL);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumumerateModules64()\n"), GetLastError());

    return rc;
}


BOOL fnRefresh(__in PCTSTR param)
{
    DWORD count;

    if (!ghProc)
    {
        _tprintf(_T("refresh only applies when attached to a process.\n"));
        return true;
    }

    count = SymRefreshModuleList(gTID);
    if (count)
    {
        _tprintf(_T("%d modules\n"), count);
        EnumModulesForProcess();
    }
    else
        _tprintf(_T("error 0x%x calling SymRefreshModuleList\n"), GetLastError());

    return true;
}


// fnHome - sets the home directory - also applies to symsrv cache and srcsrv target

BOOL fnHome(__in PCTSTR param)
{
    TCHAR path[MAX_PATH + 1];
    PTSTR rc;

    rc = SymGetHomeDirectory(hdBase ,path, cch(path));
    _tprintf(_T("base:%s\n"), (rc) ? path : _T(""));
    rc = SymGetHomeDirectory(hdSym ,path, cch(path));
    _tprintf(_T(" sym:%s\n"), (rc) ? path : _T(""));
    rc = SymGetHomeDirectory(hdSrc ,path, cch(path));
    _tprintf(_T(" src:%s\n"), (rc) ? path : _T(""));

    if (!*param)
        return true;

    _tprintf(_T("\nsetting home directory to [%s]\n"), param);
    rc = SymSetHomeDirectory(gTID, param);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymSetHomeDirectory()\n"), GetLastError());

    rc = SymGetHomeDirectory(hdBase ,path, cch(path));
    _tprintf(_T("base:%s\n"), (rc) ? path : _T(""));
    rc = SymGetHomeDirectory(hdSym ,path, cch(path));
    _tprintf(_T(" sym:%s\n"), (rc) ? path : _T(""));
    rc = SymGetHomeDirectory(hdSrc ,path, cch(path));
    _tprintf(_T(" src:%s\n"), (rc) ? path : _T(""));

    return true;
}


// worker function for the SymNext and SymPrev code

BOOL
fnNextPrev(
    __in int direction,
    __in PCTSTR param
    )
{
    BOOL rc;
    SYMBOL_INFO_PACKAGE sip;
    DWORD64 addr;

    // initialize

    ZeroMemory(&sip, sizeof(sip));
    sip.si.SizeOfStruct = sizeof(sip.si);
    sip.si.MaxNameLen = MAX_SYM_NAME;

    // If no parameter, then use the last symbol found.  Otherwise try to translate
    // the parameter as an address and use it to find the base.  If that fails,
    // translate the parameter as a symbol name and try to use that.

    if (!*param)
    {
        if (!gLastSym)
        {
            _tprintf(_T("When calling 'next' or 'prev', you must first get a base\n"));
            _tprintf(_T("symbol to work with by calling 'name' or 'addr'.  Otherwise\n"));
            _tprintf(_T("specify a base address or symbol name as a parameter to the\n"));
            _tprintf(_T("'next' or 'prev' call.\n"));
            return true;
        }
        addr = gLastSym;
    }
    else
        addr = sz2dw64(param);

    if (!addr)
        rc = SymFromName(gTID, param, &sip.si);
    else
        rc = SymFromAddr(gTID, addr, NULL, &sip.si);

    if (!rc || !sip.si.Address)
    {
        _tprintf(_T("couldn't find a symbol to match %s\n"), param);
        return true;
    }

    // now find the previous or next symbol from the base

    if (direction > 0)
        rc = SymNext(gTID, &sip.si);
    else
        rc = SymPrev(gTID, &sip.si);

    if (!rc)
        return true;

    // display the results

    dumpsi(&sip.si);
    gLastSym = sip.si.Address;

    return true;
}


// fnNext - find the next symbol

BOOL fnNext(__in PCTSTR param)
{
    return fnNextPrev(1, param);
}


// fnPrev - find the previous symbol

BOOL fnPrev(__in PCTSTR param)
{
    return fnNextPrev(-1, param);
}


// fnBase - set the module base and reload module, if needed

BOOL fnBase(__in PCTSTR param)
{
    DWORD64            addr;

    addr = sz2dw64(param);
    if (!addr)
    {
        _tprintf(_T("base <address> : sets the base address for module loads\n"));
        return true;
    }

    gDefaultBase = addr;
    gDefaultBaseForVirtualMods = addr;
    if (gBase)
        fnLoad(gImageName);

    return true;
}


// fnLine - search for a line by it's name

BOOL fnLine(__in PCTSTR param)
{
    PTSTR file;
    DWORD linenum;
    BOOL rc;
    IMAGEHLP_LINE64 line;
    LONG disp;
    PTSTR szp;

    if (!param || !*param)
        return true;

    // parse the source file and line number from the parameters

    file = NULL;
    szp = _tcsdup(param);
    if (!szp)
    {
        _tprintf(_T("line: filespec#linenum\n"));
        return true;
    }
    file = szp;

    while (*szp != '#') 
    {
        if (!*szp)
        {
            _tprintf(_T("line: filespec#linenum\n"));
            goto end;
        }
        szp++;
    }
    *szp = 0;
    szp++;
    linenum = _tstoi(szp);
    if (!linenum)
    {
        _tprintf(_T("line: filespec#linenum\n"));
        goto end;
    }

    // make the call

    memset(&line, 0, sizeof(line));
    line.SizeOfStruct = sizeof(IMAGEHLP_LINE64);
    rc = SymGetLineFromName64(gTID,
                              gModName,
                              file,
                              linenum,
                              &disp,
                              &line);
    if (!rc)
    {
        _tprintf(_T("line: error 0x%x looking for %s#%d\n"),
               GetLastError(),
               file,
               linenum);
        goto end;
    }

    // display the results

    dumpLine(&line);
    _tprintf(_T("disp : %x\n"), disp);

    // save for future linenext/lineprev calls

    memcpy(&gLine, &line, sizeof(gLine));
    gLine.FileName = gLineFileName;
    _tcscpy_s(gLineFileName, cch(gLineFileName), line.FileName);

#ifndef DBGHELP_TRANSLATE_TCHAR
    // test old interface

    char afile[MAX_PATH + 1];
    IMAGEHLP_LINE li;
    ZeroMemory(&li, sizeof(li));
    li.SizeOfStruct = sizeof(li);
    tcs2ansi(file, afile, cch(afile));
    rc = SymGetLineFromName(gTID,
                            gAnsiModName,
                            afile,
                            linenum,
                            &disp,
                            &li);
    if (rc) 
    {
        memcpy(&gLi, &li, sizeof(gLi));
        gLi.FileName = gLiFileName;
        _tcscpy_s(gLiFileName, cch(gLiFileName), li.FileName);
        if (li.Address != line.Address)
            _tprintf(_T("SymGetLineFromName and SymGetLineFromName64 don't return the same line.\n"));
    } else
        _tprintf(_T("error calling SymGetLineFromName()\n"));
#endif

end:
    // cleanup

    if (file)
        free(file);

    return true;
}


// worker function for the LineNext and LinePrev code

BOOL fnLineNextPrev(__in BOOL prev)
{
    BOOL               rc;
    IMAGEHLP_LINE64    line;

    // copy the base line

    if (!gLine.SizeOfStruct)
    {
        _tprintf(_T("You must first get base line with the 'line' command\n"));
        _tprintf(_T("before calling 'linenext' or 'lineprev'\n"));
        return true;
    }
    memcpy(&line, &gLine, sizeof(line));

    // do it

    if (prev)
        rc = SymGetLinePrev64(gTID, &line);
    else
        rc = SymGetLineNext64(gTID, &line);

    if (!rc) {
        _tprintf(_T("line: error 0x%x looking for %s#%d\n"),
                 GetLastError(),
                 line.FileName,
                 line.LineNumber);
        return true;
    }

    dumpLine(&line);

    // save for future linenext/lineprev calls

    memcpy(&gLine, &line, sizeof(gLine));
    gLine.FileName = gLineFileName;
    _tcscpy_s(gLiFileName, cch(gLiFileName), line.FileName);

    return true;
}


// fnLineNext - find the next line

BOOL fnLineNext(__in PCTSTR param)
{
    return fnLineNextPrev(false);
}


// fnLinePrev - find the previous line

BOOL fnLinePrev(__in PCTSTR param)
{
    return fnLineNextPrev(true);
}


// fnUndec - undecorate a symbol name

BOOL fnUndec(__in PCTSTR param)
{
    DWORD rc;
    TCHAR uname[MAX_SYM_NAME + 1];

    if (!param || !*param)
    {
        _tprintf(_T("undec <symbolname> - undecorates a C++ mangled symbol name\n"));
        return true;
    }

    rc = UnDecorateSymbolName(param, uname, MAX_SYM_NAME, UNDNAME_COMPLETE);
    if (!rc)
        _tprintf(_T("error 0x%u undecorating %s\n"), GetLastError(), param);
    else
        _tprintf(_T("%s =\n%s\n"), param, uname);

    return true;
}


// fnFineFile - search for a file in a tree

BOOL fnSearchTree(__in PCTSTR param)
{
    DWORD rc;
    TCHAR root[MAX_PATH + 1];
    TCHAR file[MAX_PATH + 1];
    TCHAR found[MAX_PATH + 1];

    if (!param)
    {
        _tprintf(_T("ff <root path> <file name> - finds file in path\n"));
        return true;
    }

    rc = _stscanf_s(param, _T("%s %s"), root, cch(root), file, cch(file));
    if ((rc < 2) || !*root || !*file)
    {
        _tprintf(_T("ff <root path> <file name> - finds file in path\n"));
        return true;
    }

    *found = 0;

    rc = SearchTreeForFile(root, file, found);

    if (!rc)
        _tprintf(_T("error 0x%u looking for %s\n"), GetLastError(), file);
    else
        _tprintf(_T("found %s\n"), found);

    return true;
}


// fnFineFileInPath - search for a file in a tree

BOOL
CALLBACK
cbFindFileInPath(
    __in PCTSTR filename,
    __in PVOID context
    )
{
    _tprintf(_T("%s\n"), filename);

    return grcEnumProc;
}

BOOL fnFindFileInPath(__in PCTSTR param)
{
    DWORD rc;
    TCHAR root[MAX_PATH + 1];
    PTSTR proot = root;
    TCHAR file[MAX_PATH + 1];
    TCHAR found[MAX_PATH + 1];
    int cnt = 0;

    if (param)
    {
        cnt = _stscanf_s(param, _T("%s %s"), file, cch(file), root, cch(root));
        if (cnt < 2)
            proot = NULL;
    }
    if (cnt < 1)
    {
        _tprintf(_T("ffpath <file name> <optional root path> - finds file in symbol path\n"));
        return true;
    }

    *found = 0;

    rc = SymFindFileInPath(gTID, proot, file, NULL, 0, 0, 0, found, cbFindFileInPath, NULL);

    if (rc)
        _tprintf(_T("found %s\n"), found);

    return true;
}


// fnAdd - create a virtual symbol

BOOL fnAdd(__in PCTSTR param)
{
    BOOL rc;
    DWORD64 addr;
    DWORD size;
    PCTSTR p;
    TCHAR name[MAX_STR + 1];
    TCHAR *n;

    if (!param || !*param) 
    {
        _tprintf(_T("add <name address> : must specify a symbol name, address, and size.\n"));
        return true;
    }
    if (_tcslen(param) > cch(name)) 
    {
        _tprintf(_T("add - symbol name is too long.\n"));
        return true;
    }
    if (_tcslen(param) >= cch(name)) 
    {
        _tprintf(_T("add : parameter string to too long to handle.\n"));
        return true;
    }

    p = param;
    while (_istspace((TUCHAR)*p)) p++;
    *name = 0;
    for (n = name; *p; p++, n++) 
    {
        if (_istspace((TUCHAR)*p)) 
        {
            *n = 0;
            break;
        }
        *n = *p;
    }

    addr = 0;
    size = 0;
    while (_istspace((TUCHAR)*p)) p++;
    if (*(p + 1) == 'x' || *(p + 1) == 'X')
        p += 2;
    rc = _stscanf_s(p, _T("%I64x %x"), &addr, &size);
    if ((rc < 2) || !addr || !*name)
    {
        _tprintf(_T("add <name address> : must specify a symbol name, address, and size.\n"));
        return true;
    }

    rc = SymAddSymbol(gTID, 0, name, addr, size, 0);
    if (!rc)
        _tprintf(_T("Error 0x%x trying to add symbol\n"), GetLastError());

    return true;
}


// fnDelete - delete a virtual symbol

BOOL fnDelete(__in PCTSTR param)
{
    BOOL rc;
    DWORD64 addr;
    DWORD err;
    PCTSTR name = NULL;

    if (!param || !*param) 
    {
        _tprintf(_T("del <name/address> : must specify a symbol name or address to delete.\n"));
        return true;
    }

    addr = sz2dw64(param);
    if (!addr)
    {
        name = param;
        addr = gBase;
    }

    rc = SymDeleteSymbol(gTID, 0, name, addr, 0);
    if (!rc) 
    {
        err = GetLastError();
        if (err == ERROR_NOT_FOUND)
            _tprintf(_T("Couldn't find %s to delete.\n"), param);
        else
            _tprintf(_T("Error 0x%x trying to delete symbol\n"), err);
    }

    return true;
}


// fnOmap - dump module omap

BOOL fnOmap(__in PCTSTR param)
{
    POMAP omapTo;
    POMAP omapFrom;
    DWORD64 cOmapTo;
    DWORD64 cOmapFrom;
    DWORD64 i;

    if (!SymGetOmaps(gTID, gBase, &omapTo, &cOmapTo, &omapFrom, &cOmapFrom))
        _tprintf(_T("Error 0x%x calling SymGetOmap().\n"), GetLastError());

    _tprintf(_T("to...\n"));
    for (i = 0; i < cOmapTo; i++)
        _tprintf(_T("%x %x\n"), omapTo[i].rva, omapTo[i].rvaTo);
    _tprintf(_T("\nfrom...\n"));
    for (i = 0; i < cOmapFrom; i++)
        _tprintf(_T("%x %x\n"), omapFrom[i].rva, omapFrom[i].rvaTo);

    return true;
}


// fnSetRet - toggle the return value of callbacks

BOOL fnSetRet(__in PCTSTR param)
{
    if (grcEnumProc)
        grcEnumProc = false;
    else
        grcEnumProc = true;

    _tprintf(_T("return value set to %s\n"), grcEnumProc ? _T("true") : _T("false"));

    return true;
}


// fnEnumProcessMods - enumerate all loaded modules for a given process

BOOL
CALLBACK
cbLoadedMod(
    __in PCTSTR ModuleName,
    __in DWORD64 ModuleBase,
    __in ULONG ModuleSize,
    __in_opt PVOID UserContext
    )
{
    _tprintf(_T("%s\n"), ModuleName);

    return true;
}


BOOL fnEnumProcessMods(__in PCTSTR param)
{
    DWORD pid;
    HANDLE hp;

    pid = _tstoi(param);
    if (!pid) 
    {
        _tprintf(_T("epmod <process id> - must enter a valid process id.\n"));
        return true;
    }

    hp = OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ, FALSE, pid);
    if (!hp) 
    {
        _tprintf(_T("epmod <process id> - can't open process %d.\n"), pid);
        return true;
    }

    gOptions |= SYMOPT_INCLUDE_32BIT_MODULES;
    SymSetOptions(gOptions);

    EnumerateLoadedModulesEx(hp, cbLoadedMod, NULL);

    CloseHandle(hp);

    return true;
}


// set or display symbol options

BOOL fnSymOpt(__in PCTSTR param)
{
    DWORD opts;

    opts = SymGetOptions();
    _tprintf(_T("Symbol Options: 0x%x\n"), opts);
    if (!*param)
        return true;

    if (*param == _T('+'))
    {
        opts = (DWORD)sz2dw64(++param);
        gOptions = SymSetOptions(gOptions | opts);
    }
    else if (*param == _T('-'))
    {
        opts = (DWORD)sz2dw64(++param);
        gOptions = SymSetOptions(gOptions & ~opts);
    }
    else
    {
        opts = (DWORD)sz2dw64(param);
        gOptions = SymSetOptions(opts);
    }

    opts = SymGetOptions();
    _tprintf(_T("Symbol Options: 0x%x\n"), opts);

    return true;
}


// fnDumpSymbols - dump all symbols to a tab separated file

BOOL
CALLBACK
cbEnumForDump(
    __in PSYMBOL_INFO si,
    __in ULONG size,
    __in PVOID context
    )
{
    IMAGEHLP_LINE64 line;
    DWORD displacement = 0;
    DWORD cb = 0;
    BOOL rc;
    char buf[SI_BUFFER_SIZE];
    PSYMBOL_INFO psi;
    DWORD index;

    // we only do functions

    if (si->Tag != SymTagFunction)
        return true;

    // get the obj

    index = si->Index;
    psi = (PSYMBOL_INFO)buf;
    do
    {
        ZeroMemory(buf, sizeof(buf));
        psi->SizeOfStruct = sizeof(SYMBOL_INFO);
        psi->MaxNameLen = MAX_SYM_NAME;
        rc = SymGetScope(gTID, gBase, index, psi);
        if (!rc)
            break;
        index = psi->Index;
    }
    while (psi->Tag != SymTagCompiland);

    // get the source information

    ZeroMemory(&line, sizeof(line));
    line.SizeOfStruct = sizeof(line);
    rc = SymGetLineFromAddr64(gTID, si->Address, &displacement, &line);
    if (!rc)
        return true;

    // dump the data

    _tprintf(_T("%s\t%s\t%I64x\t%s\t%d"), gModName, si->Name, si->Address - gBase, line.FileName, line.LineNumber);
    if (psi->Tag == SymTagCompiland)
        _tprintf(_T("\t%s"), psi->Name);
    _tprintf(_T("\n"));

    return true;
}

BOOL fnDumpSymbols(__in PCTSTR param)
{
    BOOL rc;

    // enumerate the symbols

    rc = SymEnumSymbols(gTID, gBase, NULL, cbEnumForDump, NULL);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymEnumSymbols()\n"), GetLastError());

    return true;
}


// get frame unwind information

BOOL fnUnwind(__in PCTSTR param)
{
    DWORD64 addr;
    char *buf = NULL;
    ULONG size = 0;;
    BOOL rc;

    addr = sz2dw64(param);
    if (!addr)
    {
        _tprintf(_T("uw <address> : gets the unwind info for a function\n"));
        return true;
    }

    rc = SymGetUnwindInfo(gTID, addr, buf, &size);
    if (!rc)
    {
        _tprintf(_T("error 0x%x calling SymGetUnwindInfo() when looking for the size.\n"), GetLastError());
        return true;
    }
    if (!size)
    {
        _tprintf(_T("Unwind info size is zero.\n"));
        return true;
    }

    buf = (char *)malloc(size);
    if (!buf)
    {
        _tprintf(_T("coudn't allocate %d bytes to hold the unwind info.\n"), size);
        return true;
    }

    rc = SymGetUnwindInfo(gTID, addr, buf, &size);
    free(buf);
    if (!rc)
        _tprintf(_T("error 0x%x calling SymGetUnwindInfo() when reading the data.\n"), GetLastError());

    return true;
}


// fnFileIndexInfo - get all the symbol indexes for a binary

void
GuidStr(
    __in GUID *guid,
    __inout_ecount(size) PTSTR sz,
    __in DWORD size
    )
{
    TCHAR buf[MAX_PATH + 256];
    BYTE byte;
    int i;

    assert(sz);

    if (!guid)
        return;

    // append the first DWORD in the pointer

    _stprintf_s(buf, cch(buf), _T("%08X"), guid->Data1);
    _tcscat_s(sz, size, buf);

    // this will catch the passing of a PDWORD and avoid
    // all the GUID parsing

    if (!guid->Data2 && !guid->Data3) 
    {
        for (i = 0, byte = 0; i < 8; i++) 
        {
            byte |= guid->Data4[i];
            if (byte)
                break;
        }
        if (!byte)
            return;
    }

    // go ahead and add the rest of the GUID

    _stprintf_s(buf, cch(buf), _T("%04X"), guid->Data2);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%04X"), guid->Data3);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[0]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[1]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[2]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[3]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[4]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[5]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[6]);
    _tcscat_s(sz, size, buf);
    _stprintf_s(buf, cch(buf), _T("%02X"), guid->Data4[7]);

    _tcscat_s(sz, size, buf);
}


BOOL fnFileIndexInfo(__in PCTSTR param)
{
    BOOL rc;
    SYMSRV_INDEX_INFO info;
    TCHAR sz[256] = _T("");
#if 0
    GUID guid;
    DWORD val1;
    DWORD val2;
#endif

    if (!*param)
    {
        _tprintf(_T("fii: you must specify an image to look up the file index info on.\n"));
        return true;
    }

    info.sizeofstruct = sizeof(info);
    rc = SymSrvGetFileIndexInfo(param, &info, 0);
    if (rc)
    {
        GuidStr(&info.guid, sz, cch(sz));
        _tprintf(_T("     file: %s\n"), info.file);
        _tprintf(_T(" stripped: %s\n"), info.stripped ? _T("true") : _T("false"));
        _tprintf(_T("timestamp: 0x%x\n"), info.timestamp);
        _tprintf(_T("     size: 0x%x\n"), info.size);
        _tprintf(_T("      dbg: %s\n"), info.dbgfile);
        _tprintf(_T("      pdb: %s\n"), info.pdbfile);
        _tprintf(_T(" pdb guid: %s\n"), sz);
        _tprintf(_T("  pdb sig: 0x%x\n"), info.sig);
        _tprintf(_T("  pdb age: 0x%x\n"), info.age);
    }
    else
    {
        _tprintf(_T("error 0x%x calling SymSrvGetFileIndexInfo()\n"), GetLastError());
    }

#if 0  // optional test
    rc = SymSrvGetFileIndexes(param, &guid, &val1, &val2, 0);
    if (rc)
    {
        GuidStr(&guid, sz, cch(sz));
        _tprintf(_T("\nguid=%s val1=%d val2=%d\n"), sz, val1, val2);
    }
    else
    {
        _tprintf(_T("\nerror 0x%x calling SymSrvGetFileIndexes()\n"), GetLastError());
    }
#endif

    return true;
}



// fnScrap - for testing new code

BOOL fnScrap(__in PCTSTR param)
{
    return true;
}


// read the command line

PTSTR
GetParameters(
    __inout PTSTR cmd
    )
{
    PTSTR p = cmd;

    while (*p++)
    {
        if (_istspace((TUCHAR)*p))
        {
            *p++ = 0;
             return *p ? p : gNullString;
        }
    }

    return gNullString;
}


void prompt()
{
    if (!gModLoaded)
        _tprintf(_T("\ndbh: "));
    else if (ghProc)
        _tprintf(_T("\npid:%d mod:%s[%I64x]: "), gPID, gModName, gBase);
    else
        _tprintf(_T("\n%s [%I64x]: "), gModName, gBase);
}


PTSTR
getstr(
    __out_ecount(size) PTSTR buf,
    __in int size
    )
{
    PTSTR rc;
    PTSTR p = buf;

    if (size < 2)
        return 0;

    rc = _fgetts(buf, size, stdin);
    if (!rc)
        return 0;

    while (*p)
    {
        switch (*p)
        {
        case 0xa:
            *p = 0;
            // pass through
        case 0:
            return rc;
        }
        p++;
        if ((p - buf) >= size - 2)
        {
            *p = 0;
            return rc;
        }
    }

    return rc;
}


int InputLoop()
{
    TCHAR cmd[MAX_STR + 1];
    PTSTR params;
    int i;
    BOOL rc;

    do
    {
        // get the command string

        rc = true;
        if (*gExecCmd) 
        {
            _tcscpy_s(cmd, cch(cmd), gExecCmd);
        } 
        else 
        {
            prompt();
            if (!getstr(cmd, cch(cmd)))
                return 0;
        }
        params = GetParameters(cmd);

        // find the appropriate function

        for (i = 0; i < cmdMax; i++)
        {
            if (!_tcsicmp(cmd, gCmd[i].token)
                || !_tcsicmp(cmd, gCmd[i].shorttoken))
            {
                break;
            }
        }

        // if there is a match, call it

        if (i < cmdMax)
        {
            _tprintf(_T("\n"));
            rc = gCmd[i].fn(params);
        } else
            _tprintf(_T("[%s] is an unrecognized command.\n"), cmd);

        // no command - bail

        if (*gExecCmd)
            rc = false;

    } 
    while (rc);

    return 0;
}


// callback passed in SymRegisterCallback

BOOL
CALLBACK
cbSymbol(
    __in HANDLE hProcess,
    __in ULONG ActionCode,
    __inout ULONG64 CallbackData,
    __in ULONG64 UserContext
    )
{
    PIMAGEHLP_CBA_EVENT evt;

    switch (ActionCode)
    {
    case CBA_EVENT:
        evt = (PIMAGEHLP_CBA_EVENT)CallbackData;
        _tprintf(_T("%s"), (PTSTR)evt->desc);
        break;

    case CBA_DEBUG_INFO:
        _tprintf(_T("%s"), (PTSTR)CallbackData);
        break;

    default:
        return false;
    }

    return true;
}


// initialize dbghelp, set options, load process if required

BOOL init()
{
    int i;

    *gModName = 0;
    gBase = 0;;
    gDefaultBaseForVirtualMods = 0x1000000;
    gDefaultBase = 0x1000000;
    ZeroMemory(&gLine, sizeof(gLine));

    // get the symbol path

    dprintf(_T("dbh: initializing...\n"));
    i = GetEnvironmentVariable(_T("_NT_SYMBOL_PATH"), gSymbolSearchPath, MAX_STR);
    if (i < 1)
        *gSymbolSearchPath = 0;
    dprintf(_T("Symbol Path = [%s]\n"), gSymbolSearchPath);

    // set the options

    gOptions = SYMOPT_CASE_INSENSITIVE
               | SYMOPT_LOAD_LINES
               | SYMOPT_ALLOW_ABSOLUTE_SYMBOLS
               | SYMOPT_EXACT_SYMBOLS;

    if (gDecPubs)
        gOptions |= SYMOPT_PUBLICS_ONLY;
    else
        gOptions |= (SYMOPT_UNDNAME | SYMOPT_AUTO_PUBLICS);

    if (gVerbose)
        gOptions |= SYMOPT_DEBUG;

    gOptions = SymSetOptions(gOptions);

    dprintf(_T("SymOpts = 0x%x\n"), gOptions);

    // initialize

    if (!ghProc)
        gTID = (HANDLE)(ULONG_PTR)GetCurrentThreadId();
    gInitialized = SymInitialize(gTID, gSymbolSearchPath, (ghProc) ? true : false);
    if (!gInitialized)
    {
        _tprintf(_T("error 0x%x from SymInitialize()\n"), GetLastError());
        return gInitialized;
    }

    // set the callback function

    gInitialized = SymRegisterCallback64(gTID, cbSymbol, 0);
    if (!gInitialized)
    {
        SymCleanup(gTID);
        _tprintf(_T("error 0x%x from SymRegisterCallback64()\n"), GetLastError());
        return gInitialized;
    }

    // if we are attaching to a process, list the modules

    if (ghProc)
        EnumModulesForProcess();

    return gInitialized;
}


void cleanup()
{
    int i;

    gCleanup = true;
    fnUnload(NULL);
    for (i = 0; i < 50; i++)
        SymCleanup(gTID);
    if (ghProc)
        CloseHandle(ghProc);
}


void usage()
{
    _tprintf(_T("usage: dbh [-n] [-c] [-d] [-?] [-??] [-p] [targetmodule] [command]\n"));
    _tprintf(_T("       [-n]             display noisy symbol spew\n"));
    _tprintf(_T("       [-d]             use decorated publics\n"));
    _tprintf(_T("       [-p:XXXX]        attaches to process ID XXXX\n"));
    _tprintf(_T("       [-s:SSSS]        set symbol path to SSSS\n"));
    _tprintf(_T("       [-c]             callbacks return false\n"));
    _tprintf(_T("       [targetmodule]   load symbols for specified module\n"));
    _tprintf(_T("       [command]        execute command and exit\n"));
    _tprintf(_T("       [-?]             display these usage instructions\n"));
    _tprintf(_T("       [-??]            display detailed usage instructions\n"));
}


BOOL
cmdline(
    __in int argc,
    __in_ecount(argc) PCTSTR argv[]
    )
{
    int    i;
    PCTSTR p;

    for (i = 1; i < argc; i++)
    {
        p = argv[i];
        switch (*p)
        {
        case _T('/'):
        case _T('-'):

            // command line switch

            p++;
            switch (_totlower(*p))
            {
            case _T('v'):
            case _T('n'):
                // display symbol spew from CBA_DEBUG
                fnVerbose(_T("on"));
                break;
            case _T('c'):
                // callbacks return false
                grcEnumProc = false;
                break;
            case _T('d'):
                // use only decorated publics
                gDecPubs = true;
                init();
                break;
            case _T('p'):
                // attach to a process
                gPID = 0;
                if (*(p + 1) == _T(':'))
                    gPID = _tstoi(p + 2);
                if (!gPID)
                    _tprintf(_T("-p:XXXX attaches to process ID XXXX\n"));
                ghProc = OpenProcess(PROCESS_ALL_ACCESS, FALSE, gPID);
                if (ghProc)
                    gTID = ghProc;
                else
                    _tprintf(_T("error 0x%x attaching to process %d\n"), GetLastError(), gPID);
                init();
                break;
            case _T('s'):
                // set symbol path
                if (*(p + 1) == _T(':'))
                {
                    fnSymPath(p + 2);
                    break;
                }
                _tprintf(_T("-s must be followed by a valid symbol search path\n"));
                usage();
                return false;
            case _T('?'):
                // command line help
                _tprintf(_T("dbh dbghelp shell\n"));
                usage();
                if (*(p + 1) == '?')
                {
                    _tprintf(_T("\n"));
                    fnHelp(NULL);
                }
                return false;
            default:
                // huh ?
                _tprintf(_T("%s is an unknown switch\n"), argv[i]);
                usage();
                return false;
            }
            break;

        default:
            // no switch - must be a module to load or a command

            // if no module is loaded and we are not attached to a process
            // and there is a period in the text, this must be a file name
            // - load it.  Otherwise, it is a command.

            if (!*gModName
                && !*gExecCmd
                && !ghProc
                && _tcschr(argv[i], _T('.')))
            {
                fnLoad(argv[i]);
                if (!gModLoaded)
                    return false;
            }
            else
            {
                // skip the load command - the file will be loaded anyway
                if (!_tcsicmp(argv[i], _T("load")))
                    continue;
                if (!*gModName)
                    _tcscpy_s(gModName, cch(gModName), _T("NULL"));
                _tcscat_s(gExecCmd, cch(gExecCmd), argv[i]);
                _tcscat_s(gExecCmd, cch(gExecCmd), _T(" "));
            }
            break;
        }
    }

    if (*gExecCmd)
        rtrim(gExecCmd);

    // _tprintf(_T("dbh: mod[%s] proc[0x%x] cmd[%s]\n"), gModName, ghProc, gExecCmd);

    return true;
}

#include <crtdbg.h>

int __cdecl
#ifdef UNICODE
_tmain(
#else
main(
#endif
    __in int argc,
    __in_ecount(argc) PCTSTR argv[],
    __in PCTSTR envp[]
    )
{
    DWORD rc;

    SetHeapOptions();

    _CrtSetDbgFlag( ( _CRTDBG_CHECK_ALWAYS_DF | _CRTDBG_LEAK_CHECK_DF ) | _CrtSetDbgFlag(_CRTDBG_REPORT_FLAG ) );

#if 0
 #ifdef UNICODE
    _tprintf(_T("dbh.exe UNICODE\n"));
 #else
    _tprintf(_T("dbh.exe ANSI\n"));
 #endif
#endif

    if (!init())
        return 1;
    rc = cmdline(argc, argv);
    if (rc)
        rc = InputLoop();
    cleanup();

    _CrtDumpMemoryLeaks();

    return rc;
}
