/*************************************************************************
*                                                                        *
* t2embapi.h -- OpenType embedding services dll (T2EMBED.DLL)            *
*                                                                        *
* (c) Microsoft Corporation. All Rights Reserved.                        *
*                                                                        *
*************************************************************************/

#ifndef __t2embapi__
#define __t2embapi__
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

// Charset flags for ulCharSet field of TTEmbedFont
#define CHARSET_UNICODE                    1
#define CHARSET_DEFAULT                    1
#define CHARSET_SYMBOL                     2
#define CHARSET_GLYPHIDX                   3

// Status returned by TTLoadEmbeddedFont
#define EMBED_PREVIEWPRINT                 1
#define EMBED_EDITABLE                     2
#define EMBED_INSTALLABLE                  3
#define EMBED_NOEMBEDDING                  4

// Use restriction flags
#define LICENSE_INSTALLABLE             0x0000
#define LICENSE_DEFAULT                 0x0000
#define LICENSE_NOEMBEDDING             0x0002
#define LICENSE_PREVIEWPRINT            0x0004
#define LICENSE_EDITABLE                0x0008

// Options given to TTEmbedFont in uFlags parameter
#define TTEMBED_RAW                         0x00000000
#define TTEMBED_SUBSET                      0x00000001
#define TTEMBED_TTCOMPRESSED                0x00000004
#define TTEMBED_FAILIFVARIATIONSIMULATED    0x00000010
// Embed EUDC font. If there is typeface EUDC embed it otherwise embed system EUDC.
#define TTEMBED_EMBEDEUDC                   0x00000020
#define TTEMBED_WEBOBJECT                   0x00000080
#define TTEMBED_XORENCRYPTDATA              0x10000000

// Bits returned through pulStatus for TTEmbedFont
#define TTEMBED_VARIATIONSIMULATED      0x00000001
// Bit set if EUDC embed success.       
#define TTEMBED_EUDCEMBEDDED            0x00000002
// Bit set if font embedding permissions indicate no subset and subset requested by client. 
#define TTEMBED_SUBSETCANCEL            0x00000004      

// Flag options for TTLoadEmbeddedFont
#define TTLOAD_PRIVATE                  0x00000001
// If typeface already has EUDC, overwrite setting.
#define TTLOAD_EUDC_OVERWRITE           0x00000002

// Bits returned through pulStatus for TTLoadEmbeddedFont
#define TTLOAD_FONT_SUBSETTED       0x00000001
#define TTLOAD_FONT_IN_SYSSTARTUP   0x00000002
#define TTLOAD_EUDC_SET             0x00000004

// Flag options for TTDeleteEmbeddedFont
#define TTDELETE_DONTREMOVEFONT     0x00000001  

// Error codes
#define E_NONE                      0x0000L
#define E_API_NOTIMPL               0x0001L

// Top level error codes
#define E_CHARCODECOUNTINVALID      0x0002L
#define E_CHARCODESETINVALID        0x0003L
#define E_DEVICETRUETYPEFONT        0x0004L
#define E_HDCINVALID                0x0006L
#define E_NOFREEMEMORY              0x0007L
#define E_FONTREFERENCEINVALID      0x0008L
#define E_NOTATRUETYPEFONT          0x000AL
#define E_ERRORACCESSINGFONTDATA    0x000CL
#define E_ERRORACCESSINGFACENAME    0x000DL
#define E_ERRORUNICODECONVERSION    0x0011L
#define E_ERRORCONVERTINGCHARS      0x0012L
#define E_EXCEPTION                 0x0013L
#define E_RESERVEDPARAMNOTNULL      0x0014L 
#define E_CHARSETINVALID            0x0015L
#define E_FILE_NOT_FOUND            0x0017L
#define E_TTC_INDEX_OUT_OF_RANGE    0x0018L
#define E_INPUTPARAMINVALID         0x0019L

// Indep level error codes
#define E_ERRORCOMPRESSINGFONTDATA    0x0100L
#define E_FONTDATAINVALID             0x0102L
#define E_NAMECHANGEFAILED            0x0103L
#define E_FONTNOTEMBEDDABLE           0x0104L
#define E_PRIVSINVALID                0x0105L
#define E_SUBSETTINGFAILED            0x0106L
#define E_READFROMSTREAMFAILED        0x0107L
#define E_SAVETOSTREAMFAILED          0x0108L
#define E_NOOS2                       0x0109L
#define E_T2NOFREEMEMORY              0x010AL
#define E_ERRORREADINGFONTDATA        0x010BL
#define E_FLAGSINVALID                0x010CL
#define E_ERRORCREATINGFONTFILE       0x010DL
#define E_FONTALREADYEXISTS           0x010EL
#define E_FONTNAMEALREADYEXISTS       0x010FL
#define E_FONTINSTALLFAILED           0x0110L
#define E_ERRORDECOMPRESSINGFONTDATA  0x0111L
#define E_ERRORACCESSINGEXCLUDELIST   0x0112L
#define E_FACENAMEINVALID             0x0113L
#define E_STREAMINVALID               0x0114L
#define E_STATUSINVALID               0x0115L
#define E_PRIVSTATUSINVALID           0x0116L
#define E_PERMISSIONSINVALID          0x0117L
#define E_PBENABLEDINVALID            0x0118L
#define E_SUBSETTINGEXCEPTION         0x0119L
#define E_SUBSTRING_TEST_FAIL         0x011AL
#define E_FONTVARIATIONSIMULATED      0x011BL
#define E_FONTFAMILYNAMENOTINFULL     0x011DL

// Bottom level error codes
#define E_ADDFONTFAILED             0x0200L
#define E_COULDNTCREATETEMPFILE     0x0201L
#define E_FONTFILECREATEFAILED      0x0203L
#define E_WINDOWSAPI                0x0204L
#define E_FONTFILENOTFOUND          0x0205L
#define E_RESOURCEFILECREATEFAILED  0x0206L
#define E_ERROREXPANDINGFONTDATA    0x0207L
#define E_ERRORGETTINGDC            0x0208L
#define E_EXCEPTIONINDECOMPRESSION  0x0209L
#define E_EXCEPTIONINCOMPRESSION    0x020AL

// 1st argument - Stream identifier (file handle or other) (dwStream) */
// 2nd argument - Address of buffer with data to read or write */
// 3rd argument - Number of bytes to read or write */
typedef unsigned long( WINAPIV *READEMBEDPROC ) ( void*, void*, const unsigned long );
typedef unsigned long( WINAPIV *WRITEEMBEDPROC ) ( void*, const void*, const unsigned long );

typedef struct
{
    unsigned short usStructSize;    // size in bytes of structure client should set to sizeof(TTLOADINFO)
    unsigned short usRefStrSize;    // size in wide characters of pusRefStr including NULL terminator
    unsigned short *pusRefStr;      // reference or actual string.
}TTLOADINFO;

typedef struct
{
    unsigned short usStructSize;    // size in bytes of structure client should set to sizeof(TTEMBEDINFO)
    unsigned short usRootStrSize;   // size in wide chars of pusSubStr including NULL terminator(s)
    unsigned short *pusRootStr;     // substring(s) of strings given at load time. can have multiple strings separated
                                    //  by a NULL terminator.
}TTEMBEDINFO;

typedef struct
{
    unsigned long ulStructSize;
    long lTestFromSize;
    long lTestToSize;
    unsigned long ulCharSet; // Same as ulCharSet param to TTEmbedFont.
    unsigned short usReserved1;
    unsigned short usCharCodeCount; // If zero, we test over all glyphs.
    unsigned short* pusCharCodeSet; // Pointer to array of Unicode chars. 
}TTVALIDATIONTESTSPARAMS;

typedef struct
{
    unsigned long ulStructSize;
    long lTestFromSize;
    long lTestToSize;
    unsigned long ulCharSet; // Same as ulCharSet param to TTEmbedFont.
    unsigned short usReserved1;
    unsigned short usCharCodeCount; // If zero, we test over all glyphs.
    unsigned long* pulCharCodeSet; // Pointer to array of Unicode chars. 
}TTVALIDATIONTESTSPARAMSEX;

/* Font Embedding APIs ----------------------------------------------------*/

LONG WINAPI TTEmbedFont
(
    __in HDC       hDC,                    // device-context handle
    __in ULONG     ulFlags,                // flags specifying the request
    __in ULONG     ulCharSet,              // flags specifying char set
    __out ULONG*    pulPrivStatus,          // upon completion contains embedding priv of font
    __out ULONG*    pulStatus,              // on completion may contain status flags for request
    __callback WRITEEMBEDPROC lpfnWriteToStream, // callback function for doc/disk writes
    __in LPVOID    lpvWriteStream,         // the output stream tokin
    __in_ecount(usCharCodeCount) USHORT*   pusCharCodeSet,         // address of buffer containing optional
                                      // character codes for subsetting
    __in USHORT    usCharCodeCount,        // number of characters in the
                                      // lpvCharCodeSet buffer
    __in USHORT    usLanguage,             // specifies the language in the name table to keep
                                      //  set to 0 to keep all
    __in_opt TTEMBEDINFO* pTTEmbedInfo         // optional security
);

LONG WINAPI TTEmbedFontFromFileA
(
    __in    HDC       hDC,                    // device-context handle
    __in    LPCSTR    szFontFileName,         // TrueType font file name
    __in    USHORT    usTTCIndex,             // If file image is a TTC, this must be zero based index
    __in    ULONG     ulFlags,                // flags specifying the request
    __in    ULONG     ulCharSet,              // flags specifying char set
    __out   ULONG*    pulPrivStatus,          // upon completion contains embedding priv of font
    __out   ULONG*    pulStatus,              // on completion may contain status flags for request
    __callback WRITEEMBEDPROC lpfnWriteToStream, // callback function for doc/disk writes
    __in    LPVOID    lpvWriteStream,         // the output stream tokin
    __in_ecount(usCharCodeCount) USHORT*   pusCharCodeSet,         // address of buffer containing optional
                                      // character codes for subsetting
    __in USHORT    usCharCodeCount,        // number of characters in the
                                      // lpvCharCodeSet buffer
    __in USHORT    usLanguage,             // specifies the language in the name table to keep
                                      //  set to 0 to keep all
    __in_opt TTEMBEDINFO* pTTEmbedInfo         // optional security
);

LONG WINAPI TTLoadEmbeddedFont
(
    __out HANDLE*   phFontReference,            // on completion, contains handle to identify embedded font installed
                                        // on system
    __in ULONG    ulFlags,                  // flags specifying the request 
    __out ULONG*    pulPrivStatus,          // on completion, contains the embedding status
    __in ULONG     ulPrivs,                 // allows for the reduction of licensing privileges
    __out ULONG*    pulStatus,              // on completion, may contain status flags for request 
    __in READEMBEDPROC lpfnReadFromStream,  // callback function for doc/disk reads
    __in LPVOID    lpvReadStream,           // the input stream tokin
    __in_opt LPWSTR    szWinFamilyName,         // the new 16 bit windows family name can be NULL
    __in_opt LPSTR    szMacFamilyName,          // the new 8 bit mac family name can be NULL
    __in_opt TTLOADINFO* pTTLoadInfo                // optional security
);

LONG WINAPI TTGetEmbeddedFontInfo
(   
    __in ULONG     ulFlags,                  // flags specifying the request
    __out ULONG*    pulPrivStatus,            // on completion, contains the embedding status
    __in ULONG     ulPrivs,                  // allows for the reduction of licensing privileges
    __out ULONG*    pulStatus,                // on completion, may contain status flags for request
    __callback READEMBEDPROC lpfnReadFromStream,   // callback function for doc/disk reads
    __in LPVOID    lpvReadStream,            // the input stream tokin   
    __in_opt TTLOADINFO* pTTLoadInfo             // optional security
);

LONG WINAPI TTDeleteEmbeddedFont
(
    __in HANDLE    hFontReference,   // Reference to font value provided by load functions                                       
    __in ULONG     ulFlags,
    __out ULONG*    pulStatus
);

LONG WINAPI TTGetEmbeddingType
(
    __in HDC         hDC,                   // device context handle
    __out ULONG*      pulEmbedType           // upon completion, contains the
                                       // embedding status
);

LONG WINAPI TTCharToUnicode
(   
    __in HDC         hDC,                // device context handle
    __in_ecount(ulCharCodeSize) UCHAR*      pucCharCodes,       // array of 8 bit character codes to convert
    __in ULONG       ulCharCodeSize,     // size of 8 bit character code array
    __out_ecount(ulShortCodeSize) USHORT*     pusShortCodes,      // buffer to recieve Unicode code points
    __in ULONG       ulShortCodeSize,    // size in wide characters of 16 bit character code array
    __in ULONG       ulFlags             // Control flags
);

LONG WINAPI TTRunValidationTests
(
    __in HDC                         hDC,        // device context handle
    __in TTVALIDATIONTESTSPARAMS*    pTestParam  // 
);


/* Font Enabling APIs -----------------------------------------------------*/

LONG WINAPI TTIsEmbeddingEnabled
(
    __in HDC                     hDC,            // device context handle
    __out BOOL*           pbEnabled       // upon completion will indicate if enabled
);

LONG WINAPI TTIsEmbeddingEnabledForFacename
(
    __in LPCSTR           lpszFacename,   // facename
    __out BOOL*           pbEnabled       // upon completion will indicate if enabled
);

LONG WINAPI TTEnableEmbeddingForFacename
(                                   // If fEnable != 0, it removes the indicated
    __in LPCSTR           lpszFacename,   // typeface name from the "embedding
    __in BOOL            bEnable         // exclusion list".  Else, it enters the
);                                  // indicated typeface name in the "embedding
                                    // exclusion list".

LONG WINAPI TTEmbedFontEx
(
    __in HDC       hDC,                    // device-context handle
    __in ULONG     ulFlags,                // flags specifying the request
    __in ULONG     ulCharSet,              // flags specifying char set
    __out ULONG*    pulPrivStatus,          // upon completion contains embedding priv of font
    __out ULONG*    pulStatus,              // on completion may contain status flags for request
    __callback WRITEEMBEDPROC lpfnWriteToStream, // callback function for doc/disk writes
    __in LPVOID    lpvWriteStream,         // the output stream tokin
    __in_ecount(usCharCodeCount) ULONG*    pulCharCodeSet,         // address of buffer containing optional
                                      // character codes for subsetting
    __in USHORT    usCharCodeCount,        // number of characters in the
                                      // lpvCharCodeSet buffer
    __in USHORT    usLanguage,             // specifies the language in the name table to keep
                                      //  set to 0 to keep all
    __in_opt TTEMBEDINFO* pTTEmbedInfo         // optional security
);

LONG WINAPI TTRunValidationTestsEx
(
    __in HDC                         hDC,        // device context handle
    __in TTVALIDATIONTESTSPARAMSEX*  pTestParam  // 
);

LONG WINAPI TTGetNewFontName
(
    __deref_in                  HANDLE* phFontReference,    // contains handle to identify embedded font installed
                                                            // on system
    __out_ecount(cchMaxWinName) LPWSTR  wzWinFamilyName,    // the new 16 bit windows family name. Must be at least LF_FACESIZE long.
    __in                        LONG    cchMaxWinName,      // actual length of the windows name.
    __out_ecount(cchMaxMacName) LPSTR   szMacFamilyName,    // the new 8 bit mac family name. Must be at least LF_FACESIZE long.
    __in                        LONG    cchMaxMacName       // actual length of the macintosh name.
);

#ifdef __cplusplus
}
#endif

#endif //__t2embapi__

