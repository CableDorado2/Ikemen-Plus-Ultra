//--------------------------------------------------------------------------
// OEStore6.h
// Copyright (c) Microsoft Corporation. All rights reserved.
//--------------------------------------------------------------------------

#pragma once

typedef DWORD FLDRFLAGS;
typedef BYTE FOLDERTYPE;
typedef DWORD RULEID;
typedef DWORD MESSAGEFLAGS;
typedef DWORDLONG FOLDERID;

#include "syncop.h"

//------------------------------------------------------------------
// Folder Database Version
//------------------------------------------------------------------
const DWORD FOLDER_DATABASE_VERSION_OE6     = 5;

DEFINE_GUID(CLSID_MessageDatabase_OE6, 0x6f74fdc5, 0xe366, 0x11d1, 0x9a, 0x4e, 0x0, 0xc0, 0x4f, 0xa3, 0x9, 0xd4);
DEFINE_GUID(CLSID_FolderDatabase_OE6, 0x6f74fdc6, 0xe366, 0x11d1, 0x9a, 0x4e, 0x0, 0xc0, 0x4f, 0xa3, 0x9, 0xd4);
DEFINE_GUID(CLSID_SyncOpDatabase_OE6, 0x26fe9d30, 0x1a8f, 0x11d2, 0xaa, 0xbf, 0x0, 0x60, 0x97, 0xd4, 0x74, 0xc4);

//------------------------------------------------------------------
// STOREUSERDATA_OE6
//------------------------------------------------------------------
typedef struct tagSTOREUSERDATA_OE6 {
    FILETIME            ftCreated;
    BYTE                fConvertedToDBX;
    BYTE                rgbReserved[255];
} STOREUSERDATA_OE6, *LPSTOREUSERDATA_OE6;

//------------------------------------------------------------------
// FLDCOLID_OE6
//------------------------------------------------------------------
typedef enum tagFLDCOLID_OE6 {
    FLDCOL_OE6_ID=0,
    FLDCOL_OE6_PARENT,
    FLDCOL_OE6_NAME,
    FLDCOL_OE6_FILE,
    FLDCOL_OE6_DESCRIPTION,
    FLDCOL_OE6_ACCOUNTID,
    FLDCOL_OE6_FLAGS,
    FLDCOL_OE6_MESSAGES,
    FLDCOL_OE6_UNREAD,
    FLDCOL_OE6_SPECIAL,
    FLDCOL_OE6_TYPE,
    FLDCOL_OE6_HIERARCHY,
    FLDCOL_OE6_LISTSTAMP,
    FLDCOL_OE6_SERVERHIGH,
    FLDCOL_OE6_SERVERLOW,
    FLDCOL_OE6_SERVERCOUNT,
    FLDCOL_OE6_CLIENTHIGH,
    FLDCOL_OE6_CLIENTLOW,
    FLDCOL_OE6_NOTDOWNLOADED,
    FLDCOL_OE6_REQUESTED,
    FLDCOL_OE6_URLCOMPONENT,
    FLDCOL_OE6_READ,
    FLDCOL_OE6_THREADUNREAD,
    FLDCOL_OE6_VIEWUNREAD,
    FLDCOL_OE6_STATUSMSGDELTA,
    FLDCOL_OE6_STATUSUNREADDELTA,
    FLDCOL_OE6_WATCHEDHIGH,
    FLDCOL_OE6_WATCHEDUNREAD,
    FLDCOL_OE6_WATCHED,
    FLDCOL_OE6_LAST,
} FLDCOLID_OE6;

//------------------------------------------------------------------
// FOLDERINFO
//------------------------------------------------------------------
typedef struct tagFOLDERINFO_OE6 {
    BYTE               *pAllocated;
    BYTE                bVersion;
    FOLDERID            idFolder;
    FOLDERID            idParent;
    LPSTR               pszName;
    LPSTR               pszFile;
    LPSTR               pszDescription;
    LPSTR               pszAccountId;           // Server Nodes Only
    LPSTR               pszUrlComponent;
    FLDRFLAGS           dwFlags;
    DWORD               cMessages;
    DWORD               cUnread;
    DWORD               cWatched;
    DWORD               cThreadUnreadOld;
    DWORD               cViewUnreadOld;
    DWORD               cWatchedUnread;
    SPECIALFOLDER       tySpecial;
    FOLDERTYPE          tyFolder;
    BYTE                bHierarchy;
    DWORD               dwListStamp;
    DWORD               dwServerHigh;           // highest numbered article on server (news)
    DWORD               dwServerLow;            // lowest numbered article on server (news)
    DWORD               dwServerCount;          // count of articles on server (news)
    DWORD               dwClientHigh;           // highest numbered article known to client (news)
    DWORD               dwClientLow;            // lowest numbered article known to client (news)
    DWORD               dwStatusMsgDelta;       // total number of msgs added via STATUS resp. (IMAP)
    DWORD               dwStatusUnreadDelta;    // number of unread added via STATUS resp. (IMAP)
    DWORD               dwNotDownloaded;
    BLOB                Requested;
    BLOB                Read;
    DWORD               dwClientWatchedHigh;    // Highest numbered article we've checked for watch info (news)
} FOLDERINFO_OE6, *LPFOLDERINFO_OE6;

//------------------------------------------------------------------
// Folder Record Members
//------------------------------------------------------------------
BEGIN_COLUMN_ARRAY(g_rgOE6FldTblColumns, FLDCOL_OE6_LAST)
    DEFINE_COLUMN(FLDCOL_OE6_ID,                 CDT_UNIQUE,  FOLDERINFO_OE6, idFolder)
    DEFINE_COLUMN(FLDCOL_OE6_PARENT,             CDT_DWORD,   FOLDERINFO_OE6, idParent)
    DEFINE_COLUMN(FLDCOL_OE6_NAME,               CDT_VARSTRA, FOLDERINFO_OE6, pszName)
    DEFINE_COLUMN(FLDCOL_OE6_FILE,               CDT_VARSTRA, FOLDERINFO_OE6, pszFile)
    DEFINE_COLUMN(FLDCOL_OE6_DESCRIPTION,        CDT_VARSTRA, FOLDERINFO_OE6, pszDescription)
    DEFINE_COLUMN(FLDCOL_OE6_ACCOUNTID,          CDT_VARSTRA, FOLDERINFO_OE6, pszAccountId)
    DEFINE_COLUMN(FLDCOL_OE6_FLAGS,              CDT_FLAGS,   FOLDERINFO_OE6, dwFlags)
    DEFINE_COLUMN(FLDCOL_OE6_MESSAGES,           CDT_DWORD,   FOLDERINFO_OE6, cMessages)
    DEFINE_COLUMN(FLDCOL_OE6_UNREAD,             CDT_DWORD,   FOLDERINFO_OE6, cUnread)
    DEFINE_COLUMN(FLDCOL_OE6_SPECIAL,            CDT_BYTE,    FOLDERINFO_OE6, tySpecial)
    DEFINE_COLUMN(FLDCOL_OE6_TYPE,               CDT_BYTE,    FOLDERINFO_OE6, tyFolder)
    DEFINE_COLUMN(FLDCOL_OE6_HIERARCHY,          CDT_BYTE,    FOLDERINFO_OE6, bHierarchy)
    DEFINE_COLUMN(FLDCOL_OE6_LISTSTAMP,          CDT_DWORD,   FOLDERINFO_OE6, dwListStamp)
    DEFINE_COLUMN(FLDCOL_OE6_SERVERHIGH,         CDT_DWORD,   FOLDERINFO_OE6, dwServerHigh)
    DEFINE_COLUMN(FLDCOL_OE6_SERVERLOW,          CDT_DWORD,   FOLDERINFO_OE6, dwServerLow)
    DEFINE_COLUMN(FLDCOL_OE6_SERVERCOUNT,        CDT_DWORD,   FOLDERINFO_OE6, dwServerCount)
    DEFINE_COLUMN(FLDCOL_OE6_CLIENTHIGH,         CDT_DWORD,   FOLDERINFO_OE6, dwClientHigh)
    DEFINE_COLUMN(FLDCOL_OE6_CLIENTLOW,          CDT_DWORD,   FOLDERINFO_OE6, dwClientLow)
    DEFINE_COLUMN(FLDCOL_OE6_NOTDOWNLOADED,      CDT_DWORD,   FOLDERINFO_OE6, dwNotDownloaded)
    DEFINE_COLUMN(FLDCOL_OE6_REQUESTED,          CDT_VARBLOB, FOLDERINFO_OE6, Requested)
    DEFINE_COLUMN(FLDCOL_OE6_URLCOMPONENT,       CDT_VARSTRA, FOLDERINFO_OE6, pszUrlComponent)
    DEFINE_COLUMN(FLDCOL_OE6_READ,               CDT_VARBLOB, FOLDERINFO_OE6, Read)
    DEFINE_COLUMN(FLDCOL_OE6_THREADUNREAD,       CDT_DWORD,   FOLDERINFO_OE6, cThreadUnreadOld)
    DEFINE_COLUMN(FLDCOL_OE6_VIEWUNREAD,         CDT_DWORD,   FOLDERINFO_OE6, cViewUnreadOld)
    DEFINE_COLUMN(FLDCOL_OE6_STATUSMSGDELTA,     CDT_DWORD,   FOLDERINFO_OE6, dwStatusMsgDelta)
    DEFINE_COLUMN(FLDCOL_OE6_STATUSUNREADDELTA,  CDT_DWORD,   FOLDERINFO_OE6, dwStatusUnreadDelta)
    DEFINE_COLUMN(FLDCOL_OE6_WATCHEDHIGH,        CDT_DWORD,   FOLDERINFO_OE6, dwClientWatchedHigh)
    DEFINE_COLUMN(FLDCOL_OE6_WATCHEDUNREAD,      CDT_DWORD,   FOLDERINFO_OE6, cWatchedUnread)
    DEFINE_COLUMN(FLDCOL_OE6_WATCHED,            CDT_DWORD,   FOLDERINFO_OE6, cWatched)
END_COLUMN_ARRAY

//------------------------------------------------------------------
// Folder Database Symbol Table for Regular Expression Support
//------------------------------------------------------------------
BEGIN_SYMBOL_TABLE(g_OE6FldSymbolTable, 2)
    DEFINE_SYMBOL(SYMBOL_DWORD, "FOLDER_SUBSCRIBED", FOLDER_SUBSCRIBED)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "FLDCOL_FLAGS", FLDCOL_OE6_FLAGS)
END_SYMBOL_TABLE

//------------------------------------------------------------------
// Folder Table Primary Index Definition
//------------------------------------------------------------------
BEGIN_TABLE_INDEX(g_OE6FldTblPrimaryIndex, 1)
    DEFINE_KEY(FLDCOL_OE6_ID, 0, 0)
END_TABLE_INDEX


//------------------------------------------------------------------
// Folder Record Format
//------------------------------------------------------------------
BEGIN_TABLE_SCHEMA(g_OE6FolderTableSchema, CLSID_FolderDatabase_OE6, FOLDERINFO_OE6)
    SCHEMA_PROPERTY(FOLDER_DATABASE_VERSION_OE6)
    SCHEMA_PROPERTY(TSF_RESETIFBADVERSION | TSF_HASEXTENSION)
    SCHEMA_PROPERTY(sizeof(STOREUSERDATA_OE6))
    SCHEMA_PROPERTY(offsetof(FOLDERINFO_OE6, idFolder))
    SCHEMA_PROPERTY(FLDCOL_OE6_LAST)
    SCHEMA_PROPERTY(g_rgOE6FldTblColumns)
    SCHEMA_PROPERTY(&g_OE6FldTblPrimaryIndex)
    SCHEMA_PROPERTY(&g_OE6FldSymbolTable)
END_TABLE_SCHEMA

extern const TABLESCHEMA g_OE6FolderTableSchema;

//------------------------------------------------------------------
// Message Database Version
//------------------------------------------------------------------
const DWORD MESSAGE_DATABASE_VERSION_OE6 = 5;
const DWORD CB_COLUMNS_OE6               = 256;

//------------------------------------------------------------------
// MSGTABLECOLID_OE6
//------------------------------------------------------------------
typedef enum tagMSGTABLECOLID_OE6 {
    MSGCOL_OE6_ID=0,
    MSGCOL_OE6_FLAGS,
    MSGCOL_OE6_DATE,
    MSGCOL_OE6_LINECOUNT,
    MSGCOL_OE6_STREAM,
    MSGCOL_OE6_NORMALSUBJ,
    MSGCOL_OE6_DOWNLOADTIME,
    MSGCOL_OE6_MESSAGEID,
    MSGCOL_OE6_SUBJECT,
    MSGCOL_OE6_FROMHEADER,
    MSGCOL_OE6_REFERENCES,
    MSGCOL_OE6_XREF,
    MSGCOL_OE6_SERVER,
    MSGCOL_OE6_DISPLAYFROM,
    MSGCOL_OE6_EMAILFROM,
    MSGCOL_OE6_LANGUAGE,
    MSGCOL_OE6_PRIORITY,
    MSGCOL_OE6_SIZE,
    MSGCOL_OE6_RECEIVEDDATE,
    MSGCOL_OE6_DISPLAYTO,
    MSGCOL_OE6_EMAILTO,
    MSGCOL_OE6_PARTIALINFO,
    MSGCOL_OE6_POP3UIDL,
    MSGCOL_OE6_USERNAMEOLD,
    MSGCOL_OE6_PARTIALID,
    MSGCOL_OE6_FORWARDTO,
    MSGCOL_OE6_ACCOUNTNAME,
    MSGCOL_OE6_ACCOUNTID,
    MSGCOL_OE6_OFFSETTABLE,
    MSGCOL_OE6_HIGHLIGHT,
    MSGCOL_OE6_FOLDER,
    MSGCOL_OE6_FINDFOLDER,
    MSGCOL_OE6_FINDSOURCE,
    MSGCOL_OE6_PARENTOLD,
    MSGCOL_OE6_THREADIDOLD,
    MSGCOL_OE6_URLCOMPONENT,
    MSGCOL_OE6_STREAMIDOLD,
    MSGCOL_OE6_VERSION,
    MSGCOL_OE6_MSOESREC,
    MSGCOL_OE6_LASTID
} MSGTABLECOLID_OE6;

//------------------------------------------------------------------
// FOLDERUSERDATA_OE6 - 1560 Bytes Long
//------------------------------------------------------------------
typedef struct tagFOLDERUSERDATA_OE6 {
    DWORD               fInitialized;                   // 4   Has this folder been initialized yet
    FOLDERTYPE          tyFolder;                       // the folder type
    CHAR                szAcctId[CCHMAX_ACCOUNT_NAME];  // 276 Account Id that folder belongs to
    CHAR                szFolder[CCHMAX_FOLDER_NAME];   // 532 Folder Name
    SPECIALFOLDER       tySpecial;                      // 536 Special Folder Type
    DWORD               fSubscribed;                    // 540 Is the folder subscribed ?
    DWORD               idSort;                         // 544 Current View Sort Order
    DWORD               fAscending;                     // 548 Current view is ascending ?
    DWORD               fThreaded;                      // 552 Current view is threaded
    RULEID              ridFilter;                      // 556 Current Filter for this Folder
    DWORD               dwFilterVersion;                // 560 Version of the filter
    FOLDERID            idFolder;                       // 564 Id of this folder
    DWORD               fWelcomeAdded;                  // 568 I have already added a welcome message...
    DWORD               dwUIDValidity;                  // 572 IMAP: Tells us if current acache is invalid
    DWORD               idMsgSelected;                  // The last Selected row
    BYTE                rgbColumns[CB_COLUMNS_OE6];         // Persisted Column Set
    DWORD               dwReserved1;                    // Used for sorting children
    DWORD               dwReserved2;                    // Reserved
    DWORD               fExpandAll;                     // Expand All Threads?
    DWORD               dwReserved3;                    // Do we have a dead filter?
    BYTE                fViewCounts;                    // Converted to view counts
    BYTE                fNewThreadModel;                // Converted to shared stream table ?
    BYTE                fWatchedCounts;                 // Converted to watched unread counts?
    BYTE                fTotalWatched;                  // Total Watched has been migrated.
    BYTE                fShowDeleted;                   // Current view shows deleted messages
    BYTE                fShowReplies;                   // Current view shows message replies
    BYTE                fNoIndexes;                     // No more indexes
    BYTE                rgReserved[717];                // Reserved
} FOLDERUSERDATA_OE6, *LPFOLDERUSERDATA_OE6;

//------------------------------------------------------------------
// MESSAGEINFO_OE6
//------------------------------------------------------------------
typedef struct tagMESSAGEINFO_OE6 {
    BYTE               *pAllocated;
    BYTE                bVersion;
    DWORD_PTR           dwReserved;
    MESSAGEID           idMessage;
    MESSAGEFLAGS        dwFlags;
    FILETIME            ftSent;
    DWORD               cLines;
    FILEADDRESS         faStream;
    DWORD               idStreamOld;
    LPSTR               pszNormalSubj;
    FILETIME            ftDownloaded;
    LPSTR               pszMessageId;
    LPSTR               pszSubject;
    LPSTR               pszFromHeader;
    LPSTR               pszReferences;
    LPSTR               pszXref;
    LPSTR               pszServer;
    LPSTR               pszDisplayFrom;
    LPSTR               pszEmailFrom;
    WORD                wLanguage;
    WORD                wPriority;          // IMSGPRIORITY
    DWORD               cbMessage;
    FILETIME            ftReceived;
    LPSTR               pszDisplayTo;
    LPSTR               pszEmailTo;
    DWORD               dwPartial;          // Set to MESSAGE_COMBINED to indicate its a combined message
    LPSTR               pszUidl;
    LPSTR               pszUserNameOld;
    LPSTR               pszPartialId;
    LPSTR               pszForwardTo;
    LPSTR               pszAcctName;
    LPSTR               pszAcctId;
    LPSTR               pszUrlComponent;
    BLOB                Offsets;
    WORD                wHighlight;
    LPSTR               pszFolder;          // Only used in a find folder
    DWORD               iFindFolder;        // Only used in a find folder
    MESSAGEID           idFindSource;       // Only used in a find folder
    MESSAGEID           idParentOld;        // Used for Message Threading
    BLOB                ThreadIdOld;        // Used for custom threaded view
    BYTE                bUnused;            // The major version of oe in which this was downloaded by
    LPSTR               pszMSOESRec;
} MESSAGEINFO_OE6, *LPMESSAGEINFO_OE6;

//------------------------------------------------------------------
// Message Record Members
//------------------------------------------------------------------
BEGIN_COLUMN_ARRAY(g_rgOE6MsgTblColumns, MSGCOL_OE6_LASTID)
    DEFINE_COLUMN(MSGCOL_OE6_ID,            CDT_UNIQUE,   MESSAGEINFO_OE6, idMessage)
    DEFINE_COLUMN(MSGCOL_OE6_FLAGS,         CDT_FLAGS,    MESSAGEINFO_OE6, dwFlags)
    DEFINE_COLUMN(MSGCOL_OE6_DATE,          CDT_FILETIME, MESSAGEINFO_OE6, ftSent)
    DEFINE_COLUMN(MSGCOL_OE6_LINECOUNT,     CDT_DWORD,    MESSAGEINFO_OE6, cLines)
    DEFINE_COLUMN(MSGCOL_OE6_STREAM,        CDT_STREAM,   MESSAGEINFO_OE6, faStream)
    DEFINE_COLUMN(MSGCOL_OE6_NORMALSUBJ,    CDT_VARSTRA,  MESSAGEINFO_OE6, pszNormalSubj)
    DEFINE_COLUMN(MSGCOL_OE6_DOWNLOADTIME,  CDT_FILETIME, MESSAGEINFO_OE6, ftDownloaded)
    DEFINE_COLUMN(MSGCOL_OE6_MESSAGEID,     CDT_VARSTRA,  MESSAGEINFO_OE6, pszMessageId)
    DEFINE_COLUMN(MSGCOL_OE6_SUBJECT,       CDT_VARSTRA,  MESSAGEINFO_OE6, pszSubject)
    DEFINE_COLUMN(MSGCOL_OE6_FROMHEADER,    CDT_VARSTRA,  MESSAGEINFO_OE6, pszFromHeader)
    DEFINE_COLUMN(MSGCOL_OE6_REFERENCES,    CDT_VARSTRA,  MESSAGEINFO_OE6, pszReferences)
    DEFINE_COLUMN(MSGCOL_OE6_XREF,          CDT_VARSTRA,  MESSAGEINFO_OE6, pszXref)
    DEFINE_COLUMN(MSGCOL_OE6_SERVER,        CDT_VARSTRA,  MESSAGEINFO_OE6, pszServer)
    DEFINE_COLUMN(MSGCOL_OE6_DISPLAYFROM,   CDT_VARSTRA,  MESSAGEINFO_OE6, pszDisplayFrom)
    DEFINE_COLUMN(MSGCOL_OE6_EMAILFROM,     CDT_VARSTRA,  MESSAGEINFO_OE6, pszEmailFrom)
    DEFINE_COLUMN(MSGCOL_OE6_LANGUAGE,      CDT_WORD,     MESSAGEINFO_OE6, wLanguage)
    DEFINE_COLUMN(MSGCOL_OE6_PRIORITY,      CDT_WORD,     MESSAGEINFO_OE6, wPriority)
    DEFINE_COLUMN(MSGCOL_OE6_SIZE,          CDT_DWORD,    MESSAGEINFO_OE6, cbMessage)
    DEFINE_COLUMN(MSGCOL_OE6_RECEIVEDDATE,  CDT_FILETIME, MESSAGEINFO_OE6, ftReceived)
    DEFINE_COLUMN(MSGCOL_OE6_DISPLAYTO,     CDT_VARSTRA,  MESSAGEINFO_OE6, pszDisplayTo)
    DEFINE_COLUMN(MSGCOL_OE6_EMAILTO,       CDT_VARSTRA,  MESSAGEINFO_OE6, pszEmailTo)
    DEFINE_COLUMN(MSGCOL_OE6_PARTIALINFO,   CDT_DWORD,    MESSAGEINFO_OE6, dwPartial)
    DEFINE_COLUMN(MSGCOL_OE6_POP3UIDL,      CDT_VARSTRA,  MESSAGEINFO_OE6, pszUidl)
    DEFINE_COLUMN(MSGCOL_OE6_USERNAMEOLD,   CDT_VARSTRA,  MESSAGEINFO_OE6, pszUserNameOld)
    DEFINE_COLUMN(MSGCOL_OE6_PARTIALID,     CDT_VARSTRA,  MESSAGEINFO_OE6, pszPartialId)
    DEFINE_COLUMN(MSGCOL_OE6_FORWARDTO,     CDT_VARSTRA,  MESSAGEINFO_OE6, pszForwardTo)
    DEFINE_COLUMN(MSGCOL_OE6_ACCOUNTNAME,   CDT_VARSTRA,  MESSAGEINFO_OE6, pszAcctName)
    DEFINE_COLUMN(MSGCOL_OE6_ACCOUNTID,     CDT_VARSTRA,  MESSAGEINFO_OE6, pszAcctId)
    DEFINE_COLUMN(MSGCOL_OE6_OFFSETTABLE,   CDT_VARBLOB,  MESSAGEINFO_OE6, Offsets)
    DEFINE_COLUMN(MSGCOL_OE6_HIGHLIGHT,     CDT_WORD,     MESSAGEINFO_OE6, wHighlight)
    DEFINE_COLUMN(MSGCOL_OE6_FOLDER,        CDT_VARSTRA,  MESSAGEINFO_OE6, pszFolder)
    DEFINE_COLUMN(MSGCOL_OE6_FINDFOLDER,    CDT_DWORD,    MESSAGEINFO_OE6, iFindFolder)
    DEFINE_COLUMN(MSGCOL_OE6_FINDSOURCE,    CDT_DWORD,    MESSAGEINFO_OE6, idFindSource)
    DEFINE_COLUMN(MSGCOL_OE6_PARENTOLD,     CDT_DWORD,    MESSAGEINFO_OE6, idParentOld)
    DEFINE_COLUMN(MSGCOL_OE6_THREADIDOLD,   CDT_VARBLOB,  MESSAGEINFO_OE6, ThreadIdOld)
    DEFINE_COLUMN(MSGCOL_OE6_URLCOMPONENT,  CDT_VARSTRA,  MESSAGEINFO_OE6, pszUrlComponent)
    DEFINE_COLUMN(MSGCOL_OE6_STREAMIDOLD,   CDT_DWORD,    MESSAGEINFO_OE6, idStreamOld)
    DEFINE_COLUMN(MSGCOL_OE6_VERSION,       CDT_BYTE,     MESSAGEINFO_OE6, bUnused)
    DEFINE_COLUMN(MSGCOL_OE6_MSOESREC,      CDT_VARSTRA,  MESSAGEINFO_OE6, pszMSOESRec)
END_COLUMN_ARRAY

//------------------------------------------------------------------
// g_MsgTblPrimaryIndex
//------------------------------------------------------------------
BEGIN_TABLE_INDEX(g_OE6MsgTblPrimaryIndex, 1)
    DEFINE_KEY(MSGCOL_OE6_ID, 0, 0)
END_TABLE_INDEX

//------------------------------------------------------------------
// Message Database Symbol Table for Regular Expression Support
//------------------------------------------------------------------
BEGIN_SYMBOL_TABLE(g_OE6MsgSymbolTable, 21)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_READ", ARF_READ)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_HASBODY", ARF_HASBODY)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_ENDANGERED", ARF_ENDANGERED)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_FLAGS", MSGCOL_OE6_FLAGS)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_EMAILFROM", MSGCOL_OE6_EMAILFROM)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_WATCH", ARF_WATCH)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_IGNORE", ARF_IGNORE)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_HASATTACH", ARF_HASATTACH)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_SIGNED", ARF_SIGNED)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_ENCRYPTED", ARF_ENCRYPTED)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_PRIORITY", MSGCOL_OE6_PRIORITY)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_SUBJECT", MSGCOL_OE6_SUBJECT)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_FROMHEADER", MSGCOL_OE6_FROMHEADER)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_ACCOUNTID", MSGCOL_OE6_ACCOUNTID)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_LINECOUNT", MSGCOL_OE6_LINECOUNT)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "IMSG_PRI_HIGH", IMSG_PRI_HIGH)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "IMSG_PRI_LOW", IMSG_PRI_LOW)
    DEFINE_SYMBOL(SYMBOL_COLUMN, "MSGCOL_DISPLAYFROM", MSGCOL_OE6_DISPLAYFROM)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_FLAGGED", ARF_FLAGGED)
    DEFINE_SYMBOL(SYMBOL_METHOD, "MessageAgeInDays", METHODID_MESSAGEAGEINDAYS)
    DEFINE_SYMBOL(SYMBOL_DWORD,  "ARF_DELETED_OFFLINE", ARF_DELETED_OFFLINE)
END_SYMBOL_TABLE

//------------------------------------------------------------------
// Message Record Format
//------------------------------------------------------------------
BEGIN_TABLE_SCHEMA(g_OE6MessageTableSchema, CLSID_MessageDatabase_OE6, MESSAGEINFO_OE6)
    SCHEMA_PROPERTY(MESSAGE_DATABASE_VERSION_OE6)
    SCHEMA_PROPERTY(TSF_HASSTREAMS | TSF_RESETIFBADVERSION)
    SCHEMA_PROPERTY(sizeof(FOLDERUSERDATA_OE6))
    SCHEMA_PROPERTY(offsetof(MESSAGEINFO_OE6, idMessage))
    SCHEMA_PROPERTY(MSGCOL_OE6_LASTID)
    SCHEMA_PROPERTY(g_rgOE6MsgTblColumns)
    SCHEMA_PROPERTY(&g_OE6MsgTblPrimaryIndex)
    SCHEMA_PROPERTY(&g_OE6MsgSymbolTable)
END_TABLE_SCHEMA

extern const TABLESCHEMA g_OE6MessageTableSchema;

//------------------------------------------------------------------
// POP3UIDL Database Version
//------------------------------------------------------------------
const DWORD POP3UIDL_DATABASE_VERSION_OE6   = 5;

//------------------------------------------------------------------
// UIDL Store Record Ordinals
//------------------------------------------------------------------
typedef enum tagUIDLCOLID_OE6 {
    UIDLCOL_OE6_DLTIME,
    UIDLCOL_OE6_DELETED,
    UIDLCOL_OE6_DOWNLOADED,
    UIDLCOL_OE6_UIDL,
    UIDLCOL_OE6_SERVER,
    UIDLCOL_OE6_ACCOUNTID,
    UIDLCOL_OE6_LAST
} UIDLCOLID_OE6;

//------------------------------------------------------------------
// UIDLRECORD
//------------------------------------------------------------------
typedef struct tagUIDLRECORD_OE6 {
    BYTE               *pAllocated;
    BYTE                bVersion;
    BYTE                fDownloaded;
    BYTE                fDeleted;
    FILETIME            ftDownload;
    LPSTR               pszUidl;
    LPSTR               pszServer;
    LPSTR               pszAccountId;
} UIDLRECORD_OE6, *LPUIDLRECORD_OE6;

//------------------------------------------------------------------
// UIDL Record Members
//------------------------------------------------------------------
BEGIN_COLUMN_ARRAY(g_rgOE6UidlTblColumns, UIDLCOL_OE6_LAST)
    DEFINE_COLUMN(UIDLCOL_OE6_DLTIME,     CDT_FILETIME, UIDLRECORD_OE6, ftDownload)
    DEFINE_COLUMN(UIDLCOL_OE6_DELETED,    CDT_BYTE,     UIDLRECORD_OE6, fDeleted)
    DEFINE_COLUMN(UIDLCOL_OE6_DOWNLOADED, CDT_BYTE,     UIDLRECORD_OE6, fDownloaded)
    DEFINE_COLUMN(UIDLCOL_OE6_UIDL,       CDT_VARSTRA,  UIDLRECORD_OE6, pszUidl)
    DEFINE_COLUMN(UIDLCOL_OE6_SERVER,     CDT_VARSTRA,  UIDLRECORD_OE6, pszServer)
    DEFINE_COLUMN(UIDLCOL_OE6_ACCOUNTID,  CDT_VARSTRA,  UIDLRECORD_OE6, pszAccountId)
END_COLUMN_ARRAY

//------------------------------------------------------------------
// UIDL Table Primary Index Definition
//------------------------------------------------------------------
BEGIN_TABLE_INDEX(g_OE6UidlTblPrimaryIndex, 3)
    DEFINE_KEY(UIDLCOL_OE6_UIDL,     COMPARE_ASANSI,                      0)
    DEFINE_KEY(UIDLCOL_OE6_SERVER,   COMPARE_ASANSI | COMPARE_IGNORECASE, 0)
    DEFINE_KEY(UIDLCOL_OE6_ACCOUNTID,COMPARE_ASANSI | COMPARE_IGNORECASE, 0)
END_TABLE_INDEX

//------------------------------------------------------------------
// UIDL Record Format
//------------------------------------------------------------------
BEGIN_TABLE_SCHEMA(g_OE6UidlTableSchema, CLSID_Pop3UidlDatabase, UIDLRECORD_OE6)
    SCHEMA_PROPERTY(POP3UIDL_DATABASE_VERSION_OE6)
    SCHEMA_PROPERTY(TSF_RESETIFBADVERSION)
    SCHEMA_PROPERTY(0)
    SCHEMA_PROPERTY(0xffffffff)
    SCHEMA_PROPERTY(UIDLCOL_OE6_LAST)
    SCHEMA_PROPERTY(g_rgOE6UidlTblColumns)
    SCHEMA_PROPERTY(&g_OE6UidlTblPrimaryIndex)
    SCHEMA_PROPERTY(NULL)
END_TABLE_SCHEMA

//------------------------------------------------------------------
// Extern'ed Record Formats
//------------------------------------------------------------------
extern const TABLESCHEMA g_OE6UidlTableSchema;

//------------------------------------------------------------------
// SyncOp Database Version
//------------------------------------------------------------------
const DWORD SYNCOP_DATABASE_VERSION_OE6 = 2;

//------------------------------------------------------------------
// SYNCOPTABLECOLID
//------------------------------------------------------------------
typedef enum tagSYNCOPTABLECOLID_OE6 {
    OPCOL_OE6_ID = 0,
    OPCOL_OE6_SERVER,
    OPCOL_OE6_FOLDER,
    OPCOL_OE6_MESSAGE,
    OPCOL_OE6_OPTYPE,
    OPCOL_OE6_FLAGS,
    OPCOL_OE6_ADD_FLAGS,
    OPCOL_OE6_REMOVE_FLAGS,
    OPCOL_OE6_FOLDER_DEST,
    OPCOL_OE6_MESSAGE_DEST,
    OPCOL_OE6_LASTID
} SYNCOPTABLECOLID_OE6;

//------------------------------------------------------------------
// SYNCUSERDATA
//------------------------------------------------------------------
typedef struct tagSYNCOPUSERDATA_OE6 {
    DWORD               fInitialized;                   // 4   Has this folder been initialized yet
    BYTE                rgReserved[248];                // Reserved
} SYNCOPUSERDATA_OE6, *LPSYNCOPUSERDATA_OE6;

//------------------------------------------------------------------
// SYNCOPINFO
//------------------------------------------------------------------
typedef struct tagSYNCOPINFO_OE6 {
    BYTE               *pAllocated;
    BYTE                bVersion;
    SYNCOPID            idOperation;
    FOLDERID            idServer;
    FOLDERID            idFolder;
    MESSAGEID           idMessage;
    SYNCOPTYPE          tyOperation;
    SYNCOPFLAGS         dwFlags;
    MESSAGEFLAGS        dwAdd;
    MESSAGEFLAGS        dwRemove;
    FOLDERID            idFolderDest;
    MESSAGEID           idMessageDest;
} SYNCOPINFO_OE6, *LPSYNCOPINFO_OE6;

//------------------------------------------------------------------
// Operation Record Members
//------------------------------------------------------------------
BEGIN_COLUMN_ARRAY(g_rgOE6OpTblColumns, OPCOL_OE6_LASTID)
    DEFINE_COLUMN(OPCOL_OE6_ID,             CDT_DWORD,    SYNCOPINFO, idOperation)
    DEFINE_COLUMN(OPCOL_OE6_SERVER,         CDT_DWORD,    SYNCOPINFO, idServer)
    DEFINE_COLUMN(OPCOL_OE6_FOLDER,         CDT_DWORD,    SYNCOPINFO, idFolder)
    DEFINE_COLUMN(OPCOL_OE6_MESSAGE,        CDT_DWORD,    SYNCOPINFO, idMessage)
    DEFINE_COLUMN(OPCOL_OE6_OPTYPE,         CDT_WORD,     SYNCOPINFO, tyOperation)
    DEFINE_COLUMN(OPCOL_OE6_FLAGS,          CDT_DWORD,    SYNCOPINFO, dwFlags)
    DEFINE_COLUMN(OPCOL_OE6_ADD_FLAGS,      CDT_DWORD,    SYNCOPINFO, dwAdd)
    DEFINE_COLUMN(OPCOL_OE6_REMOVE_FLAGS,   CDT_DWORD,    SYNCOPINFO, dwRemove)
    DEFINE_COLUMN(OPCOL_OE6_FOLDER_DEST,    CDT_DWORD,    SYNCOPINFO, idFolderDest)
    DEFINE_COLUMN(OPCOL_OE6_MESSAGE_DEST,   CDT_DWORD,    SYNCOPINFO, idMessageDest)
END_COLUMN_ARRAY

//------------------------------------------------------------------
// g_OE6OpTblPrimaryIndex
//------------------------------------------------------------------
BEGIN_TABLE_INDEX(g_OE6OpTblPrimaryIndex, 1)
    DEFINE_KEY(OPCOL_OE6_ID,        0,  0)
END_TABLE_INDEX

//------------------------------------------------------------------
// Operation Record Format
//------------------------------------------------------------------
BEGIN_TABLE_SCHEMA(g_OE6SyncOpTableSchema, CLSID_SyncOpDatabase_OE6, SYNCOPINFO_OE6)
    SCHEMA_PROPERTY(SYNCOP_DATABASE_VERSION_OE6)
    SCHEMA_PROPERTY(TSF_RESETIFBADVERSION)
    SCHEMA_PROPERTY(sizeof(SYNCOPUSERDATA_OE6))
    SCHEMA_PROPERTY(offsetof(SYNCOPINFO_OE6, idOperation))
    SCHEMA_PROPERTY(OPCOL_OE6_LASTID)
    SCHEMA_PROPERTY(g_rgOE6OpTblColumns)
    SCHEMA_PROPERTY(&g_OE6OpTblPrimaryIndex)
    SCHEMA_PROPERTY(NULL)
END_TABLE_SCHEMA

extern const TABLESCHEMA g_OE6SyncOpTableSchema;
