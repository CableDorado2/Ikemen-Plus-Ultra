/*++ BUILD Version: 0000     Increment this if a change has global effects

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    esent.h

Abstract:

    This module defines the types and constants that are
    exposed through the ESE API.

--*/

#if _MSC_VER > 1000
#pragma once
#endif

#if !defined(_JET_INCLUDED)
#define _JET_INCLUDED

#ifdef	__cplusplus
extern "C" {
#endif

#include <specstrings.h>


// JET_VERSION is similar to WINVER. It allows the most recent header to be used
// against older targets. Supported versions are:
// 0x0500  - Windows 2000
// 0x0501  - Windows XP
// 0x0502  - Windows Server 2003
// 0x0600  - Windows Vista / Windows Server 2008
// 0x0601  - Windows 7

#ifndef JET_VERSION
#  ifdef WINVER
#    define JET_VERSION WINVER
#  else
     // JET_VERSION has not been specified. Assume all functions are available.
#    define JET_VERSION 0x0601
#  endif
#endif



#if defined(_M_AMD64) || defined(_M_IA64)
#include <pshpack8.h>
#else
#include <pshpack4.h>
#endif


#pragma warning(push)
#pragma warning(disable: 4201)		//	nonstandard extension used : nameless struct/union


#define JET_API     __stdcall
#define JET_NODSAPI __stdcall

#if defined(_WIN64)
    typedef unsigned __int64 JET_API_PTR;
#elif !defined(__midl) && (defined(_X86_) || defined(_M_IX86)) && _MSC_VER >= 1300
	typedef __w64 unsigned long JET_API_PTR;
#else
	typedef unsigned long JET_API_PTR;
#endif


typedef long JET_ERR;

typedef JET_API_PTR JET_HANDLE;	/* backup file handle */
typedef JET_API_PTR JET_INSTANCE;	/* Instance Identifier */
typedef JET_API_PTR JET_SESID;  	/* Session Identifier */
typedef JET_API_PTR JET_TABLEID;	/* Table Identifier */
#if ( JET_VERSION >= 0x0501 )
typedef JET_API_PTR JET_LS;		/* Local Storage */
#endif // JET_VERSION >= 0x0501

typedef unsigned long JET_COLUMNID;	/* Column Identifier */

typedef struct tagJET_INDEXID
	{
	unsigned long	cbStruct;
	unsigned char	rgbIndexId[sizeof(JET_API_PTR)+sizeof(unsigned long)+sizeof(unsigned long)];
	} JET_INDEXID;

typedef unsigned long JET_DBID;   	/* Database Identifier */
typedef unsigned long JET_OBJTYP;	/* Object Type */
typedef unsigned long JET_COLTYP;	/* Column Type */
typedef unsigned long JET_GRBIT;  	/* Group of Bits */

typedef unsigned long JET_SNP;		/* Status Notification Process */
typedef unsigned long JET_SNT;		/* Status Notification Type */
typedef double JET_DATESERIAL;		/* JET_coltypDateTime format */
#if ( JET_VERSION >= 0x0501 )
typedef unsigned long JET_CBTYP;	/* Callback Types */
#endif // JET_VERSION >= 0x0501

typedef JET_ERR (JET_API *JET_PFNSTATUS)(
	__in JET_SESID	sesid,
	__in JET_SNP	snp,
	__in JET_SNT	snt,
	__in_opt void *	pv );

/*	required to make RSTMAP RPC capable
/**/
#ifdef	MIDL_PASS
#define	xRPC_STRING [string]
#else
#define	xRPC_STRING
#if !defined(_NATIVE_WCHAR_T_DEFINED)
typedef unsigned short WCHAR;
#else
typedef wchar_t WCHAR;
#endif
#endif

typedef __nullterminated char *  JET_PSTR;    /* ASCII string (char *) null terminated */
typedef __nullterminated const char *  JET_PCSTR;   /* const ASCII string (char *) null terminated */
typedef __nullterminated WCHAR * JET_PWSTR;   /* Unicode string (char *) null terminated */
typedef __nullterminated const WCHAR * JET_PCWSTR;  /* const Unicode string (char *) null terminated */

typedef struct
	{
	xRPC_STRING char		*szDatabaseName;
	xRPC_STRING char		*szNewDatabaseName;
	} JET_RSTMAP_A;			/* restore map */

typedef struct
	{
	xRPC_STRING WCHAR		*szDatabaseName;
	xRPC_STRING WCHAR		*szNewDatabaseName;
	} JET_RSTMAP_W;			/* restore map */

#ifdef JET_UNICODE
#define JET_RSTMAP JET_RSTMAP_W
#else
#define JET_RSTMAP JET_RSTMAP_A
#endif


typedef struct tagCONVERT_A
	{
	char					*szOldDll;
	union
		{
		unsigned long		fFlags;
		struct
			{
			unsigned long	fSchemaChangesOnly:1;
			};
		};
	} JET_CONVERT_A;

typedef struct tagCONVERT_W
	{
	WCHAR					*szOldDll;
	union
		{
		unsigned long		fFlags;
		struct
			{
			unsigned long	fSchemaChangesOnly:1;
			};
		};
	} JET_CONVERT_W;

#ifdef JET_UNICODE
#define JET_CONVERT JET_CONVERT_W
#else
#define JET_CONVERT JET_CONVERT_A
#endif


//	Online defragmentation options
#define JET_bitDefragmentBatchStart				0x00000001
#define JET_bitDefragmentBatchStop				0x00000002

#if ( JET_VERSION >= 0x0501 )
#define JET_bitDefragmentAvailSpaceTreesOnly	0x00000040	/* only defrag AvailExt trees */
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0601 )
#define JET_bitDefragmentNoPartialMerges		0x00000080	/* don't do partial merges during OLD */

#define JET_bitDefragmentBTree					0x00000100	/* defrag one B-Tree (testing only) */
#endif // JET_VERSION >= 0x0601

#if ( JET_VERSION >= 0x0501 )
	/* Callback-function types */

#define JET_cbtypNull							0x00000000
#define JET_cbtypFinalize						0x00000001	/* a finalizable column has gone to zero */
#define JET_cbtypBeforeInsert					0x00000002	/* about to insert a record */
#define JET_cbtypAfterInsert					0x00000004	/* finished inserting a record */
#define JET_cbtypBeforeReplace					0x00000008	/* about to modify a record */
#define JET_cbtypAfterReplace					0x00000010	/* finished modifying a record */
#define JET_cbtypBeforeDelete					0x00000020	/* about to delete a record */
#define JET_cbtypAfterDelete					0x00000040	/* finished deleting the record */
#define JET_cbtypUserDefinedDefaultValue		0x00000080	/* calculating a user-defined default */
#define JET_cbtypOnlineDefragCompleted			0x00000100	/* a call to JetDefragment2 has completed */
#define JET_cbtypFreeCursorLS					0x00000200	/* the Local Storage associated with a cursor must be freed */
#define JET_cbtypFreeTableLS					0x00000400	/* the Local Storage associated with a table must be freed */

	/* Callback-function prototype */

typedef JET_ERR (JET_API *JET_CALLBACK)(
	__in JET_SESID 		sesid,
	__in JET_DBID 		dbid,
	__in JET_TABLEID 	tableid,
	__in JET_CBTYP 		cbtyp,
	__inout_opt void *	pvArg1,
	__inout_opt void *	pvArg2,
	__in_opt void *		pvContext,
	__in JET_API_PTR	ulUnused );
#endif // JET_VERSION >= 0x0501

	/* Status Notification Structures */

typedef struct				/* Status Notification Progress */
	{
	unsigned long	cbStruct;	/* Size of this structure */
	unsigned long	cunitDone;	/* Number of units of work completed */
	unsigned long	cunitTotal;	/* Total number of units of work */
	} JET_SNPROG;

typedef struct
	{
	unsigned long			cbStruct;

	unsigned long			cbFilesizeLow;			//	file's current size (low DWORD)
	unsigned long			cbFilesizeHigh;			//	file's current size (high DWORD)

	unsigned long			cbFreeSpaceRequiredLow;	//	estimate of free disk space required for in-place upgrade (low DWORD)
	unsigned long			cbFreeSpaceRequiredHigh;//	estimate of free disk space required for in-place upgrade (high DWORD)

	unsigned long			csecToUpgrade;			//	estimate of time required, in seconds, for upgrade

	union
		{
		unsigned long		ulFlags;
		struct
			{
			unsigned long	fUpgradable:1;
			unsigned long	fAlreadyUpgraded:1;
			};
		};
	} JET_DBINFOUPGRADE;

typedef struct
	{
	unsigned long		cbStruct;
	JET_OBJTYP			objtyp;
	JET_DATESERIAL		dtCreate;	//  Deprecated.
	JET_DATESERIAL		dtUpdate;	//  Deprecated.
	JET_GRBIT			grbit;
	unsigned long		flags;
	unsigned long		cRecord;
	unsigned long		cPage;
	} JET_OBJECTINFO;

	/* The following flags appear in the grbit field above */

#define JET_bitTableInfoUpdatable	0x00000001
#define JET_bitTableInfoBookmark	0x00000002
#define JET_bitTableInfoRollback	0x00000004

	/* The following flags occur in the flags field above */

#define JET_bitObjectSystem			0x80000000	// Internal use only
#define JET_bitObjectTableFixedDDL	0x40000000	// Table's DDL is fixed
#define JET_bitObjectTableTemplate	0x20000000	// Table's DDL is inheritable (implies FixedDDL)
#define JET_bitObjectTableDerived	0x10000000	// Table's DDL is inherited from a template table
#if ( JET_VERSION >= 0x0501 )
#define JET_bitObjectTableNoFixedVarColumnsInDerivedTables	0x04000000	//	used in conjunction with JET_bitObjectTableTemplate
	                                                                        //    to disallow fixed/var columns in derived tables (so that
	                                                                        //    fixed/var columns may be added to the template in the future)
#endif // JET_VERSION >= 0x0501

typedef struct
	{
	unsigned long	cbStruct;
	JET_TABLEID		tableid;
	unsigned long	cRecord;
	JET_COLUMNID	columnidcontainername;
	JET_COLUMNID	columnidobjectname;
	JET_COLUMNID	columnidobjtyp;
	JET_COLUMNID	columniddtCreate;	//  XXX -- to be deleted
	JET_COLUMNID	columniddtUpdate;	//  XXX -- to be deleted
	JET_COLUMNID	columnidgrbit;
	JET_COLUMNID	columnidflags;
	JET_COLUMNID	columnidcRecord;	/* Level 2 info */
	JET_COLUMNID	columnidcPage;		/* Level 2 info */
	} JET_OBJECTLIST;

#define cObjectInfoCols 9

typedef struct
	{
	unsigned long	cbStruct;
	JET_TABLEID		tableid;
	unsigned long	cRecord;
	JET_COLUMNID	columnidPresentationOrder;
	JET_COLUMNID	columnidcolumnname;
	JET_COLUMNID	columnidcolumnid;
	JET_COLUMNID	columnidcoltyp;
	JET_COLUMNID	columnidCountry;
	JET_COLUMNID	columnidLangid;
	JET_COLUMNID	columnidCp;
	JET_COLUMNID	columnidCollate;
	JET_COLUMNID	columnidcbMax;
	JET_COLUMNID	columnidgrbit;
	JET_COLUMNID	columnidDefault;
	JET_COLUMNID	columnidBaseTableName;
	JET_COLUMNID	columnidBaseColumnName;
	JET_COLUMNID	columnidDefinitionName;
	} JET_COLUMNLIST;

#define cColumnInfoCols 14

typedef struct
	{
	unsigned long	cbStruct;
	JET_COLUMNID	columnid;
	JET_COLTYP		coltyp;
	unsigned short	wCountry;
	unsigned short	langid;
	unsigned short	cp;
	unsigned short	wCollate;       /* Must be 0 */
	unsigned long	cbMax;
	JET_GRBIT		grbit;
	} JET_COLUMNDEF;


typedef struct
	{
	unsigned long	cbStruct;
	JET_COLUMNID	columnid;
	JET_COLTYP		coltyp;
	unsigned short	wCountry;
	unsigned short	langid;
	unsigned short	cp;
	unsigned short	wFiller;       /* Must be 0 */
	unsigned long	cbMax;
	JET_GRBIT		grbit;
	char			szBaseTableName[256];
	char			szBaseColumnName[256];
	} JET_COLUMNBASE_A;


typedef struct
	{
	unsigned long	cbStruct;
	JET_COLUMNID	columnid;
	JET_COLTYP		coltyp;
	unsigned short	wCountry;
	unsigned short	langid;
	unsigned short	cp;
	unsigned short	wFiller;       /* Must be 0 */
	unsigned long	cbMax;
	JET_GRBIT		grbit;
	WCHAR			szBaseTableName[256];
	WCHAR			szBaseColumnName[256];
	} JET_COLUMNBASE_W;


#ifdef JET_UNICODE
#define JET_COLUMNBASE JET_COLUMNBASE_W
#else
#define JET_COLUMNBASE JET_COLUMNBASE_A
#endif


typedef struct
	{
	unsigned long	cbStruct;
	JET_TABLEID		tableid;
	unsigned long	cRecord;
	JET_COLUMNID	columnidindexname;
	JET_COLUMNID	columnidgrbitIndex;
	JET_COLUMNID	columnidcKey;
	JET_COLUMNID	columnidcEntry;
	JET_COLUMNID	columnidcPage;
	JET_COLUMNID	columnidcColumn;
	JET_COLUMNID	columnidiColumn;
	JET_COLUMNID	columnidcolumnid;
	JET_COLUMNID	columnidcoltyp;
	JET_COLUMNID	columnidCountry;
	JET_COLUMNID	columnidLangid;
	JET_COLUMNID	columnidCp;
	JET_COLUMNID	columnidCollate;
	JET_COLUMNID	columnidgrbitColumn;
	JET_COLUMNID	columnidcolumnname;
	JET_COLUMNID	columnidLCMapFlags;
	} JET_INDEXLIST;


#define cIndexInfoCols 15

typedef struct tag_JET_COLUMNCREATE_A
	{
	unsigned long	cbStruct;				// size of this structure (for future expansion)
	char			*szColumnName;			// column name
	JET_COLTYP		coltyp;					// column type
	unsigned long	cbMax;					// the maximum length of this column (only relevant for binary and text columns)
	JET_GRBIT		grbit;					// column options
	void			*pvDefault;				// default value (NULL if none)
	unsigned long	cbDefault;				// length of default value
	unsigned long	cp;						// code page (for text columns only)
	JET_COLUMNID	columnid;				// returned column id
	JET_ERR			err;					// returned error code
	} JET_COLUMNCREATE_A;

typedef struct tag_JET_COLUMNCREATE_W
	{
	unsigned long	cbStruct;				// size of this structure (for future expansion)
	WCHAR			*szColumnName;			// column name
	JET_COLTYP		coltyp;					// column type
	unsigned long	cbMax;					// the maximum length of this column (only relevant for binary and text columns)
	JET_GRBIT		grbit;					// column options
	void			*pvDefault;				// default value (NULL if none)
	unsigned long	cbDefault;				// length of default value
	unsigned long	cp;						// code page (for text columns only)
	JET_COLUMNID	columnid;				// returned column id
	JET_ERR			err;					// returned error code
	} JET_COLUMNCREATE_W;

#ifdef JET_UNICODE
#define JET_COLUMNCREATE JET_COLUMNCREATE_W
#else
#define JET_COLUMNCREATE JET_COLUMNCREATE_A
#endif

#if ( JET_VERSION >= 0x0501 )
//  This is the information needed to create a column with a user-defined default. It should be passed in using
//  the pvDefault and cbDefault in a JET_COLUMNCREATE structure

typedef struct tag_JET_USERDEFINEDDEFAULT_A
	{
	char * szCallback;
	unsigned char * pbUserData;
	unsigned long cbUserData;
	char * szDependantColumns;
	} JET_USERDEFINEDDEFAULT_A;

typedef struct tag_JET_USERDEFINEDDEFAULT_W
	{
	WCHAR * szCallback;
	unsigned char * pbUserData;
	unsigned long cbUserData;
	WCHAR * szDependantColumns;
	} JET_USERDEFINEDDEFAULT_W;

#ifdef JET_UNICODE
#define JET_USERDEFINEDDEFAULT JET_USERDEFINEDDEFAULT_W
#else
#define JET_USERDEFINEDDEFAULT JET_USERDEFINEDDEFAULT_A
#endif

#endif // JET_VERSION >= 0x0501

typedef struct tagJET_CONDITIONALCOLUMN_A
	{
	unsigned long	cbStruct;				// size of this structure (for future expansion)
	char 			*szColumnName;			// column that we are conditionally indexed on
	JET_GRBIT		grbit;					// conditional column options
	} JET_CONDITIONALCOLUMN_A;

typedef struct tagJET_CONDITIONALCOLUMN_W
	{
	unsigned long	cbStruct;				// size of this structure (for future expansion)
	WCHAR 			*szColumnName;			// column that we are conditionally indexed on
	JET_GRBIT		grbit;					// conditional column options
	} JET_CONDITIONALCOLUMN_W;

#ifdef JET_UNICODE
#define JET_CONDITIONALCOLUMN JET_CONDITIONALCOLUMN_W
#else
#define JET_CONDITIONALCOLUMN JET_CONDITIONALCOLUMN_A
#endif

typedef struct tagJET_UNICODEINDEX
	{
	unsigned long	lcid;
	unsigned long	dwMapFlags;
	} JET_UNICODEINDEX;

#if ( JET_VERSION >= 0x0502 )
typedef struct tagJET_TUPLELIMITS
	{
	unsigned long	chLengthMin;
	unsigned long	chLengthMax;
	unsigned long	chToIndexMax;
#if ( JET_VERSION >= 0x0600 )
	unsigned long	cchIncrement;
	unsigned long	ichStart;
#endif // JET_VERSION >= 0x0600
	} JET_TUPLELIMITS;
#endif // JET_VERSION >= 0x0502

#if ( JET_VERSION >= 0x0601 )
//	This structure describes some of the hints we can give to a given B-tree, be it a
//	table, index, or the internal long values tree.
typedef struct tagJET_SPACEHINTS
	{
	unsigned long		cbStruct;			//	size of this structure 
	unsigned long		ulInitialDensity;	//	density at (append) layout.
	unsigned long		cbInitial;			//	initial size (in bytes).

	JET_GRBIT			grbit;				//	Combination of one or more flags from
											//		JET_bitSpaceHints* flags
											//		JET_bitCreateHints* flags
											//		JET_bitRetrieveHints* flags
											//		JET_bitUpdateHints* flags
											//		JET_bitDeleteHints* flags
	unsigned long		ulMaintDensity;		//	density to maintain at.
	unsigned long		ulGrowth;			//	percent growth from:
											//	  last growth or initial size (possibly rounded to nearest native JET allocation size).
	unsigned long		cbMinExtent;		//	This overrides ulGrowth if too small.
	unsigned long		cbMaxExtent;		//	This caps ulGrowth.
	} JET_SPACEHINTS;
#endif // JET_VERSION >= 0x0601


typedef struct tagJET_INDEXCREATE_A
	{
	unsigned long			cbStruct;				// size of this structure (for future expansion)
	char					*szIndexName;			// index name
	char					*szKey;					// index key definition
	unsigned long			cbKey;					// size of key definition in szKey
	JET_GRBIT				grbit;					// index options
	unsigned long			ulDensity;				// index density

	union
		{
		unsigned long		lcid;					// lcid for the index (if JET_bitIndexUnicode NOT specified)
		JET_UNICODEINDEX	*pidxunicode;			// pointer to JET_UNICODEINDEX struct (if JET_bitIndexUnicode specified)
		};

	union
		{
		unsigned long		cbVarSegMac;			// maximum length of variable length columns in index key (if JET_bitIndexTupleLimits specified)
#if ( JET_VERSION >= 0x0502 )
		JET_TUPLELIMITS		*ptuplelimits;			// pointer to JET_TUPLELIMITS struct (if JET_bitIndexTupleLimits specified)
#endif // ! JET_VERSION >= 0x0502
		};

	JET_CONDITIONALCOLUMN_A	*rgconditionalcolumn;	// pointer to conditional column structure
	unsigned long			cConditionalColumn;		// number of conditional columns
	JET_ERR					err;					// returned error code
#if ( JET_VERSION >= 0x0600 )
	unsigned long			cbKeyMost;				// size of key preserved in index, e.g. without truncation (if JET_bitIndexKeyMost specified)
#endif // JET_VERSION >= 0x0600
	} JET_INDEXCREATE_A;

typedef struct tagJET_INDEXCREATE_W
	{
	unsigned long			cbStruct;				// size of this structure (for future expansion)
	WCHAR					*szIndexName;			// index name
	WCHAR					*szKey;					// index key definition
	unsigned long			cbKey;					// size of key definition in szKey
	JET_GRBIT				grbit;					// index options
	unsigned long			ulDensity;				// index density

	union
		{
		unsigned long		lcid;					// lcid for the index (if JET_bitIndexUnicode NOT specified)
		JET_UNICODEINDEX	*pidxunicode;			// pointer to JET_UNICODEINDEX struct (if JET_bitIndexUnicode specified)
		};

	union
		{
		unsigned long		cbVarSegMac;			// maximum length of variable length columns in index key (if JET_bitIndexTupleLimits specified)
#if ( JET_VERSION >= 0x0502 )
		JET_TUPLELIMITS		*ptuplelimits;			// pointer to JET_TUPLELIMITS struct (if JET_bitIndexTupleLimits specified)
#endif // ! JET_VERSION >= 0x0502
		};

	JET_CONDITIONALCOLUMN_W	*rgconditionalcolumn;	// pointer to conditional column structure
	unsigned long			cConditionalColumn;		// number of conditional columns
	JET_ERR					err;					// returned error code
#if ( JET_VERSION >= 0x0600 )
	unsigned long			cbKeyMost;				// size of key preserved in index, e.g. without truncation (if JET_bitIndexKeyMost specified)
#endif // JET_VERSION >= 0x0600
	} JET_INDEXCREATE_W;

#ifdef JET_UNICODE
#define JET_INDEXCREATE JET_INDEXCREATE_W
#else
#define JET_INDEXCREATE JET_INDEXCREATE_A
#endif

#if ( JET_VERSION >= 0x0601 )

typedef struct tagJET_INDEXCREATE2_A
	{
	unsigned long			cbStruct;				// size of this structure (for future expansion)
	char					*szIndexName;			// index name
	char					*szKey;					// index key definition
	unsigned long			cbKey;					// size of key definition in szKey
	JET_GRBIT				grbit;					// index options
	unsigned long			ulDensity;				// index density

	union
		{
		unsigned long		lcid;					// lcid for the index (if JET_bitIndexUnicode NOT specified)
		JET_UNICODEINDEX	*pidxunicode;			// pointer to JET_UNICODEINDEX struct (if JET_bitIndexUnicode specified)
		};

	union
		{
		unsigned long		cbVarSegMac;			// maximum length of variable length columns in index key (if JET_bitIndexTupleLimits specified)
		JET_TUPLELIMITS		*ptuplelimits;			// pointer to JET_TUPLELIMITS struct (if JET_bitIndexTupleLimits specified)
		};

	JET_CONDITIONALCOLUMN_A	*rgconditionalcolumn;	// pointer to conditional column structure
	unsigned long			cConditionalColumn;		// number of conditional columns
	JET_ERR					err;					// returned error code
	unsigned long			cbKeyMost;				// size of key preserved in index, e.g. without truncation (if JET_bitIndexKeyMost specified)
	JET_SPACEHINTS *        pSpacehints;			// space allocation, maintenance, and usage hints 
	} JET_INDEXCREATE2_A;

typedef struct tagJET_INDEXCREATE2_W
	{
	unsigned long			cbStruct;				// size of this structure (for future expansion)
	WCHAR					*szIndexName;			// index name
	WCHAR					*szKey;					// index key definition
	unsigned long			cbKey;					// size of key definition in szKey
	JET_GRBIT				grbit;					// index options
	unsigned long			ulDensity;				// index density

	union
		{
		unsigned long		lcid;					// lcid for the index (if JET_bitIndexUnicode NOT specified)
		JET_UNICODEINDEX	*pidxunicode;			// pointer to JET_UNICODEINDEX struct (if JET_bitIndexUnicode specified)
		};

	union
		{
		unsigned long		cbVarSegMac;			// maximum length of variable length columns in index key (if JET_bitIndexTupleLimits specified)
		JET_TUPLELIMITS		*ptuplelimits;			// pointer to JET_TUPLELIMITS struct (if JET_bitIndexTupleLimits specified)
		};

	JET_CONDITIONALCOLUMN_W	*rgconditionalcolumn;	// pointer to conditional column structure
	unsigned long			cConditionalColumn;		// number of conditional columns
	JET_ERR					err;					// returned error code
	unsigned long			cbKeyMost;				// size of key preserved in index, e.g. without truncation (if JET_bitIndexKeyMost specified)
	JET_SPACEHINTS *		pSpacehints;			// space allocation, maintenance, and usage hints
	} JET_INDEXCREATE2_W;

#ifdef JET_UNICODE
#define JET_INDEXCREATE2 JET_INDEXCREATE2_W
#else
#define JET_INDEXCREATE2 JET_INDEXCREATE2_A
#endif
#endif // JET_VERSION >= 0x0601

//
//		Table Creation Structures
//

typedef struct tagJET_TABLECREATE_A
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	char				*szTableName;			// name of table to create.
	char				*szTemplateTableName;	// name of table from which to inherit base DDL
	unsigned long		ulPages;				// initial pages to allocate for table.
	unsigned long		ulDensity;				// table density.
	JET_COLUMNCREATE_A	*rgcolumncreate;		// array of column creation info
	unsigned long		cColumns;				// number of columns to create
	JET_INDEXCREATE_A		*rgindexcreate;			// array of index creation info
	unsigned long		cIndexes;				// number of indexes to create
	JET_GRBIT			grbit;
	JET_TABLEID			tableid;				// returned tableid.
	unsigned long		cCreated;				// count of objects created (columns+table+indexes).
	} JET_TABLECREATE_A;

typedef struct tagJET_TABLECREATE_W
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	WCHAR				*szTableName;			// name of table to create.
	WCHAR				*szTemplateTableName;	// name of table from which to inherit base DDL
	unsigned long		ulPages;				// initial pages to allocate for table.
	unsigned long		ulDensity;				// table density.
	JET_COLUMNCREATE_W	*rgcolumncreate;		// array of column creation info
	unsigned long		cColumns;				// number of columns to create
	JET_INDEXCREATE_W		*rgindexcreate;			// array of index creation info
	unsigned long		cIndexes;				// number of indexes to create
	JET_GRBIT			grbit;
	JET_TABLEID			tableid;				// returned tableid.
	unsigned long		cCreated;				// count of objects created (columns+table+indexes).
	} JET_TABLECREATE_W;

#ifdef JET_UNICODE
#define JET_TABLECREATE JET_TABLECREATE_W
#else
#define JET_TABLECREATE JET_TABLECREATE_A
#endif

#if ( JET_VERSION >= 0x0501 )
typedef struct tagJET_TABLECREATE2_A
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	char				*szTableName;			// name of table to create.
	char				*szTemplateTableName;	// name of table from which to inherit base DDL
	unsigned long		ulPages;				// initial pages to allocate for table.
	unsigned long		ulDensity;				// table density.
	JET_COLUMNCREATE_A	*rgcolumncreate;		// array of column creation info
	unsigned long		cColumns;				// number of columns to create
	JET_INDEXCREATE_A	*rgindexcreate;			// array of index creation info
	unsigned long		cIndexes;				// number of indexes to create
	char				*szCallback;			// callback to use for this table
	JET_CBTYP			cbtyp;					// when the callback should be called
	JET_GRBIT			grbit;
	JET_TABLEID			tableid;				// returned tableid.
	unsigned long		cCreated;				// count of objects created (columns+table+indexes+callbacks).
	} JET_TABLECREATE2_A;

typedef struct tagJET_TABLECREATE2_W
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	WCHAR				*szTableName;			// name of table to create.
	WCHAR				*szTemplateTableName;	// name of table from which to inherit base DDL
	unsigned long		ulPages;				// initial pages to allocate for table.
	unsigned long		ulDensity;				// table density.
	JET_COLUMNCREATE_W	*rgcolumncreate;		// array of column creation info
	unsigned long		cColumns;				// number of columns to create
	JET_INDEXCREATE_W	*rgindexcreate;			// array of index creation info
	unsigned long		cIndexes;				// number of indexes to create
	WCHAR				*szCallback;			// callback to use for this table
	JET_CBTYP			cbtyp;					// when the callback should be called
	JET_GRBIT			grbit;
	JET_TABLEID			tableid;				// returned tableid.
	unsigned long		cCreated;				// count of objects created (columns+table+indexes+callbacks).
	} JET_TABLECREATE2_W;

#ifdef JET_UNICODE
#define JET_TABLECREATE2 JET_TABLECREATE2_W
#else
#define JET_TABLECREATE2 JET_TABLECREATE2_A
#endif

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION >= 0x0601 )
typedef struct tagJET_TABLECREATE3_A
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	char				*szTableName;			// name of table to create.
	char				*szTemplateTableName;	// name of table from which to inherit base DDL
	unsigned long		ulPages;				// initial pages to allocate for table.
	unsigned long		ulDensity;				// table density.
	JET_COLUMNCREATE_A	*rgcolumncreate;		// array of column creation info
	unsigned long		cColumns;				// number of columns to create
	JET_INDEXCREATE2_A	*rgindexcreate;			// array of index creation info
	unsigned long		cIndexes;				// number of indexes to create
	char				*szCallback;			// callback to use for this table
	JET_CBTYP			cbtyp;					// when the callback should be called
	JET_GRBIT			grbit;
	JET_SPACEHINTS *	pSeqSpacehints;			// space allocation, maintenance, and usage hints for default sequential index 
	JET_SPACEHINTS *	pLVSpacehints;			// space allocation, maintenance, and usage hints for Separated LV tree.
	unsigned long		cbSeparateLV;			// heuristic size to separate a intrinsic LV from the primary record

	JET_TABLEID			tableid;				// returned tableid.
	unsigned long		cCreated;				// count of objects created (columns+table+indexes+callbacks).
	} JET_TABLECREATE3_A;

typedef struct tagJET_TABLECREATE3_W
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	WCHAR				*szTableName;			// name of table to create.
	WCHAR				*szTemplateTableName;	// name of table from which to inherit base DDL
	unsigned long		ulPages;				// initial pages to allocate for table.
	unsigned long		ulDensity;				// table density.
	JET_COLUMNCREATE_W	*rgcolumncreate;		// array of column creation info
	unsigned long		cColumns;				// number of columns to create
	JET_INDEXCREATE2_W	*rgindexcreate;			// array of index creation info
	unsigned long		cIndexes;				// number of indexes to create
	WCHAR				*szCallback;			// callback to use for this table
	JET_CBTYP			cbtyp;					// when the callback should be called
	JET_GRBIT			grbit;
	JET_SPACEHINTS *	pSeqSpacehints;			// space allocation, maintenance, and usage hints for default sequential index 
	JET_SPACEHINTS *	pLVSpacehints;			// space allocation, maintenance, and usage hints for Separated LV tree.
	unsigned long		cbSeparateLV;			// heuristic size to separate a intrinsic LV from the primary record
	JET_TABLEID			tableid;				// returned tableid.
	unsigned long		cCreated;				// count of objects created (columns+table+indexes+callbacks).
	} JET_TABLECREATE3_W;

#ifdef JET_UNICODE
#define JET_TABLECREATE3 JET_TABLECREATE3_W
#else
#define JET_TABLECREATE3 JET_TABLECREATE3_A
#endif

#endif // JET_VERSION >= 0x0601

#if ( JET_VERSION >= 0x0600 )
typedef struct tagJET_OPENTEMPORARYTABLE
	{
	unsigned long		cbStruct;				// size of this structure (for future expansion)
	const JET_COLUMNDEF	*prgcolumndef;
	unsigned long		ccolumn;
	JET_UNICODEINDEX	*pidxunicode;
	JET_GRBIT			grbit;
	JET_COLUMNID		*prgcolumnid;
	unsigned long		cbKeyMost;
	unsigned long		cbVarSegMac;
	JET_TABLEID			tableid;
	} JET_OPENTEMPORARYTABLE;
#endif // JET_VERSION >= 0x0600

typedef struct
	{
	unsigned long	cbStruct;
	unsigned long	ibLongValue;
	unsigned long	itagSequence;
	JET_COLUMNID	columnidNextTagged;
	} JET_RETINFO;

typedef struct
	{
	unsigned long	cbStruct;
	unsigned long	ibLongValue;
	unsigned long	itagSequence;
	} JET_SETINFO;

typedef struct
	{
	unsigned long	cbStruct;
	unsigned long	centriesLT;
	unsigned long	centriesInRange;
	unsigned long	centriesTotal;
	} JET_RECPOS;

typedef struct
	{
	unsigned long	cbStruct;
	JET_TABLEID		tableid;
	unsigned long	cRecord;
	JET_COLUMNID	columnidBookmark;
	} JET_RECORDLIST;

typedef struct
	{
	unsigned long	cbStruct;
	JET_TABLEID		tableid;
	JET_GRBIT		grbit;
	} JET_INDEXRANGE;



#include <pshpack1.h>
#define JET_MAX_COMPUTERNAME_LENGTH 15

typedef struct	{
	char		bSeconds;				//	0 - 59
	char		bMinutes;				//	0 - 59
	char		bHours;					//	0 - 23
	char		bDay;					//	1 - 31
	char		bMonth;					//	1 - 12
	char		bYear;					//	current year - 1900
	union
		{
		char		bFiller1;
		struct
			{
			unsigned char fTimeIsUTC:1;
			unsigned char fUnused:7;
			};
		};
	char		bFiller2;
	} JET_LOGTIME;

#if ( JET_VERSION >= 0x0600 )
// the JET_BKLOGTIME is an extention of JET_LOGTIME to be used
// in the JET_BKINFO structure. They should have the same size for
// compatibility reasons
typedef struct	{
	char		bSeconds;				//	0 - 59
	char		bMinutes;				//	0 - 59
	char		bHours;					//	0 - 23
	char		bDay;					//	1 - 31
	char		bMonth;					//	1 - 12
	char		bYear;					//	current year - 1900
	union
		{
		char		bFiller1;
		struct
			{
			unsigned char fTimeIsUTC:1;
			unsigned char fUnused:7;
			};
		};
	union
		{
		char		bFiller2;
		struct
			{
			unsigned char fOSSnapshot:1;
			unsigned char fReserved:7;
			};
		};
	} JET_BKLOGTIME;
#endif // JET_VERSION >= 0x0600

typedef struct
	{
	unsigned short	ib;				// must be the last so that lgpos can
	unsigned short	isec;			// index of disksec starting logsec
	long 			lGeneration;	// generation of logsec
	} JET_LGPOS;					// be casted to TIME.

typedef struct
	{
	unsigned long	ulRandom;			//	a random number
	JET_LOGTIME		logtimeCreate;		//	time db created, in logtime format
	char			szComputerName[ JET_MAX_COMPUTERNAME_LENGTH + 1 ];	// where db is created
	} JET_SIGNATURE;

typedef struct
	{
	JET_LGPOS		lgposMark;			//	id for this backup
	union
		{
		JET_LOGTIME		logtimeMark;
#if ( JET_VERSION >= 0x0600 )
		JET_BKLOGTIME	bklogtimeMark;
#endif // JET_VERSION >= 0x0600
		};
	unsigned long	genLow;
	unsigned long	genHigh;
	} JET_BKINFO;

#include <poppack.h>

typedef struct {
	unsigned long	ulVersion;		//	version of DAE the db created (see ulDAEVersion)
	unsigned long	ulUpdate;			//	used to track incremental database format updates that
										//	are backward-compatible (see ulDAEUpdate)
	JET_SIGNATURE	signDb;			//	(28 bytes) signature of the db (incl. creation time).
	unsigned long	dbstate;		//	consistent/inconsistent state

	JET_LGPOS		lgposConsistent;	//	null if in inconsistent state
	JET_LOGTIME		logtimeConsistent;	// null if in inconsistent state

	JET_LOGTIME		logtimeAttach;	//	Last attach time.
	JET_LGPOS		lgposAttach;

	JET_LOGTIME		logtimeDetach;	//	Last detach time.
 	JET_LGPOS		lgposDetach;

	JET_SIGNATURE	signLog;		//	(28 bytes) log signature for this attachments

	JET_BKINFO		bkinfoFullPrev;	//	Last successful full backup.

	JET_BKINFO		bkinfoIncPrev;	//	Last successful Incremental backup.
									//	Reset when bkinfoFullPrev is set
	JET_BKINFO		bkinfoFullCur;	//	current backup. Succeed if a
									//	corresponding pat file generated.
	unsigned long	fShadowingDisabled;
	unsigned long	fUpgradeDb;

	//	NT version information. This is needed to decide if an index need
	//	be recreated due to sort table changes.

	unsigned long	dwMajorVersion;		/*	OS version info								*/
	unsigned long	dwMinorVersion;
	unsigned long	dwBuildNumber;
	long			lSPNumber;

	unsigned long	cbPageSize;			//	database page size (0 = 4k pages)

	} JET_DBINFOMISC;

#if ( JET_VERSION >= 0x0600 )
typedef struct {

	unsigned long	ulVersion;		//	version of DAE the db created (see ulDAEVersion)
	unsigned long	ulUpdate;			//	used to track incremental database format updates that
										//	are backward-compatible (see ulDAEUpdate)
	JET_SIGNATURE	signDb;			//	(28 bytes) signature of the db (incl. creation time).
	unsigned long	dbstate;		//	consistent/inconsistent state

	JET_LGPOS		lgposConsistent;	//	null if in inconsistent state
	JET_LOGTIME		logtimeConsistent;	// null if in inconsistent state

	JET_LOGTIME		logtimeAttach;	//	Last attach time.
	JET_LGPOS		lgposAttach;

	JET_LOGTIME		logtimeDetach;	//	Last detach time.
 	JET_LGPOS		lgposDetach;

	JET_SIGNATURE	signLog;		//	(28 bytes) log signature for this attachments

	JET_BKINFO		bkinfoFullPrev;	//	Last successful full backup.

	JET_BKINFO		bkinfoIncPrev;	//	Last successful Incremental backup.
									//	Reset when bkinfoFullPrev is set
	JET_BKINFO		bkinfoFullCur;	//	current backup. Succeed if a
									//	corresponding pat file generated.
	unsigned long	fShadowingDisabled;
	unsigned long	fUpgradeDb;

	//	NT version information. This is needed to decide if an index need
	//	be recreated due to sort table changes.

	unsigned long	dwMajorVersion;		/*	OS version info								*/
	unsigned long	dwMinorVersion;
	unsigned long	dwBuildNumber;
	long			lSPNumber;

	unsigned long	cbPageSize;			//	database page size (0 = 4k pages)

	// new fields added on top of the above JET_DBINFOMISC
	unsigned long	genMinRequired;			//	the minimum log generation required for replaying the logs. Typically the checkpoint generation
	unsigned long	genMaxRequired;			//	the maximum log generation required for replaying the logs.
	JET_LOGTIME 	logtimeGenMaxCreate;	//	creation time of the genMax log file

	unsigned long	ulRepairCount;			//	number of times repair has been called on this database
	JET_LOGTIME		logtimeRepair;			//	the date of the last time that repair was run
	unsigned long	ulRepairCountOld;		//	number of times ErrREPAIRAttachForRepair has been called on this database before the last defrag

	unsigned long	ulECCFixSuccess;		//	number of times a one bit error was fixed and resulted in a good page
	JET_LOGTIME		logtimeECCFixSuccess;	//	the date of the last time that a one bit error was fixed and resulted in a good page
	unsigned long	ulECCFixSuccessOld;		//	number of times a one bit error was fixed and resulted in a good page before last repair

	unsigned long	ulECCFixFail;			//	number of times a one bit error was fixed and resulted in a bad page
	JET_LOGTIME		logtimeECCFixFail;	    //	the date of the last time that a one bit error was fixed and resulted in a bad page
	unsigned long	ulECCFixFailOld;		//	number of times a one bit error was fixed and resulted in a bad page before last repair

	unsigned long	ulBadChecksum;			//	number of times a non-correctable ECC/checksum error was found
	JET_LOGTIME		logtimeBadChecksum;	    //	the date of the last time that a non-correctable ECC/checksum error was found
	unsigned long	ulBadChecksumOld;		//	number of times a non-correctable ECC/checksum error was found before last repair

	} JET_DBINFOMISC2;
#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION >= 0x0601 )
typedef struct {

	unsigned long	ulVersion;		//	version of DAE the db created (see ulDAEVersion)
	unsigned long	ulUpdate;			//	used to track incremental database format updates that
										//	are backward-compatible (see ulDAEUpdate)
	JET_SIGNATURE	signDb;			//	(28 bytes) signature of the db (incl. creation time).
	unsigned long	dbstate;		//	consistent/inconsistent state

	JET_LGPOS		lgposConsistent;	//	null if in inconsistent state
	JET_LOGTIME		logtimeConsistent;	// null if in inconsistent state

	JET_LOGTIME		logtimeAttach;	//	Last attach time.
	JET_LGPOS		lgposAttach;

	JET_LOGTIME		logtimeDetach;	//	Last detach time.
 	JET_LGPOS		lgposDetach;

	JET_SIGNATURE	signLog;		//	(28 bytes) log signature for this attachments

	JET_BKINFO		bkinfoFullPrev;	//	Last successful full backup.

	JET_BKINFO		bkinfoIncPrev;	//	Last successful Incremental backup.
									//	Reset when bkinfoFullPrev is set
	JET_BKINFO		bkinfoFullCur;	//	current backup. Succeed if a
									//	corresponding pat file generated.
	unsigned long	fShadowingDisabled;
	unsigned long	fUpgradeDb;

	//	NT version information. This is needed to decide if an index need
	//	be recreated due to sort table changes.

	unsigned long	dwMajorVersion;		/*	OS version info								*/
	unsigned long	dwMinorVersion;
	unsigned long	dwBuildNumber;
	long			lSPNumber;

	unsigned long	cbPageSize;			//	database page size (0 = 4k pages)

	// new fields added on top of the above JET_DBINFOMISC
	unsigned long	genMinRequired;			//	the minimum log generation required for replaying the logs. Typically the checkpoint generation
	unsigned long	genMaxRequired;			//	the maximum log generation required for replaying the logs.
	JET_LOGTIME 	logtimeGenMaxCreate;	//	creation time of the genMax log file

	unsigned long	ulRepairCount;			//	number of times repair has been called on this database
	JET_LOGTIME		logtimeRepair;			//	the date of the last time that repair was run
	unsigned long	ulRepairCountOld;		//	number of times ErrREPAIRAttachForRepair has been called on this database before the last defrag

	unsigned long	ulECCFixSuccess;		//	number of times a one bit error was fixed and resulted in a good page
	JET_LOGTIME		logtimeECCFixSuccess;	//	the date of the last time that a one bit error was fixed and resulted in a good page
	unsigned long	ulECCFixSuccessOld;		//	number of times a one bit error was fixed and resulted in a good page before last repair

	unsigned long	ulECCFixFail;			//	number of times a one bit error was fixed and resulted in a bad page
	JET_LOGTIME		logtimeECCFixFail;	    //	the date of the last time that a one bit error was fixed and resulted in a bad page
	unsigned long	ulECCFixFailOld;		//	number of times a one bit error was fixed and resulted in a bad page before last repair

	unsigned long	ulBadChecksum;			//	number of times a non-correctable ECC/checksum error was found
	JET_LOGTIME		logtimeBadChecksum;	    //	the date of the last time that a non-correctable ECC/checksum error was found
	unsigned long	ulBadChecksumOld;		//	number of times a non-correctable ECC/checksum error was found before last repair

	// new fields added on top of the above JET_DBINFOMISC2
	unsigned long	genCommitted;			//	the maximum log generation committed to the database. Typically the current log generation

	} JET_DBINFOMISC3;

typedef struct {
	unsigned long	ulVersion;		//	version of DAE the db created (see ulDAEVersion)
	unsigned long	ulUpdate;			//	used to track incremental database format updates that
										//	are backward-compatible (see ulDAEUpdate)
	JET_SIGNATURE	signDb;			//	(28 bytes) signature of the db (incl. creation time).
	unsigned long	dbstate;		//	consistent/inconsistent state

	JET_LGPOS		lgposConsistent;	//	null if in inconsistent state
	JET_LOGTIME		logtimeConsistent;	// null if in inconsistent state

	JET_LOGTIME		logtimeAttach;	//	Last attach time.
	JET_LGPOS		lgposAttach;

	JET_LOGTIME		logtimeDetach;	//	Last detach time.
 	JET_LGPOS		lgposDetach;

	JET_SIGNATURE	signLog;		//	(28 bytes) log signature for this attachments

	JET_BKINFO		bkinfoFullPrev;	//	Last successful full backup.

	JET_BKINFO		bkinfoIncPrev;	//	Last successful Incremental backup.
									//	Reset when bkinfoFullPrev is set
	JET_BKINFO		bkinfoFullCur;	//	current backup. Succeed if a
									//	corresponding pat file generated.
	unsigned long	fShadowingDisabled;
	unsigned long	fUpgradeDb;

	//	NT version information. This is needed to decide if an index need
	//	be recreated due to sort table changes.

	unsigned long	dwMajorVersion;		/*	OS version info								*/
	unsigned long	dwMinorVersion;
	unsigned long	dwBuildNumber;
	long			lSPNumber;

	unsigned long	cbPageSize;			//	database page size (0 = 4k pages)

	// new fields added on top of the above JET_DBINFOMISC
	unsigned long	genMinRequired;			//	the minimum log generation required for replaying the logs. Typically the checkpoint generation
	unsigned long	genMaxRequired;			//	the maximum log generation required for replaying the logs.
	JET_LOGTIME 	logtimeGenMaxCreate;	//	creation time of the genMax log file

	unsigned long	ulRepairCount;			//	number of times repair has been called on this database
	JET_LOGTIME		logtimeRepair;			//	the date of the last time that repair was run
	unsigned long	ulRepairCountOld;		//	number of times ErrREPAIRAttachForRepair has been called on this database before the last defrag

	unsigned long	ulECCFixSuccess;		//	number of times a one bit error was fixed and resulted in a good page
	JET_LOGTIME		logtimeECCFixSuccess;	//	the date of the last time that a one bit error was fixed and resulted in a good page
	unsigned long	ulECCFixSuccessOld;		//	number of times a one bit error was fixed and resulted in a good page before last repair

	unsigned long	ulECCFixFail;			//	number of times a one bit error was fixed and resulted in a bad page
	JET_LOGTIME		logtimeECCFixFail;	    //	the date of the last time that a one bit error was fixed and resulted in a bad page
	unsigned long	ulECCFixFailOld;		//	number of times a one bit error was fixed and resulted in a bad page before last repair

	unsigned long	ulBadChecksum;			//	number of times a non-correctable ECC/checksum error was found
	JET_LOGTIME		logtimeBadChecksum;	    //	the date of the last time that a non-correctable ECC/checksum error was found
	unsigned long	ulBadChecksumOld;		//	number of times a non-correctable ECC/checksum error was found before last repair

	// new fields added on top of the above JET_DBINFOMISC2
	unsigned long	genCommitted;			//	the maximum log generation committed to the database. Typically the current log generation

	// new fields added on top of the above JET_DBINFOMISC3
	JET_BKINFO	bkinfoCopyPrev;			//	Last successful Copy backup
	JET_BKINFO	bkinfoDiffPrev;			//	Last successful Differential backup, reset when bkinfoFullPrev is set
	} JET_DBINFOMISC4;
#endif // JET_VERSION >= 0x0601

#if ( JET_VERSION >= 0x0600 )
//  JET performance counters accumulated by thread
//
struct JET_THREADSTATS {
	unsigned long	cbStruct;			//  size of this struct
	unsigned long	cPageReferenced;	//  pages referenced
	unsigned long	cPageRead;			//  pages read from disk
	unsigned long	cPagePreread;		//  pages preread from disk
	unsigned long	cPageDirtied;		//  clean pages modified
	unsigned long	cPageRedirtied;		//  dirty pages modified
	unsigned long	cLogRecord;			//  log records generated
	unsigned long	cbLogRecord;		//  log record bytes generated
};

typedef struct
	{
	unsigned long			cbStruct;

	JET_RSTMAP_A *			rgrstmap;
	long 					crstmap;

	JET_LGPOS				lgposStop;
	JET_LOGTIME				logtimeStop;

	JET_PFNSTATUS 			pfnStatus;
	} JET_RSTINFO_A;

typedef struct
	{
	unsigned long			cbStruct;

	JET_RSTMAP_W *			rgrstmap;
	long 					crstmap;

	JET_LGPOS				lgposStop;
	JET_LOGTIME				logtimeStop;

	JET_PFNSTATUS 			pfnStatus;
	} JET_RSTINFO_W;

#ifdef JET_UNICODE
#define JET_RSTINFO JET_RSTINFO_W
#else
#define JET_RSTINFO JET_RSTINFO_A
#endif

#endif // JET_VERSION >= 0x0600


/************************************************************************/
/*************************     JET CONSTANTS	 ************************/
/************************************************************************/

#if ( JET_VERSION >= 0x0501 )
#define JET_instanceNil				(~(JET_INSTANCE)0)
#endif // JET_VERSION >= 0x0501
#define JET_sesidNil				(~(JET_SESID)0)
#define JET_tableidNil				(~(JET_TABLEID)0)
#define JET_bitNil					((JET_GRBIT)0)

	/* Max size of a bookmark */

#define JET_cbBookmarkMost			256
#if ( JET_VERSION >= 0x0601 )
#define JET_cbBookmarkMostMost		JET_cbKeyMostMost
#endif // JET_VERSION >= 0x0601

	/* Max length of a object/column/index/property name */

#ifndef JET_UNICODE
#define JET_cbNameMost				64
#else
#define JET_cbNameMost				128
#endif

	/* Max length of a "name.name.name..." construct */

#ifndef JET_UNICODE
#define JET_cbFullNameMost			255
#else
#define JET_cbFullNameMost			510
#endif

	/* Max size of long-value (LongBinary or LongText) column chunk */

//	#define JET_cbColumnLVChunkMost		( JET_cbPage - 82 ) to the following:
//	Get cbPage from GetSystemParameter.
// 	changed JET_cbColumnLVChunkMost reference to cbPage - JET_cbColumnLVPageOverhead

#define JET_cbColumnLVPageOverhead		82		// ONLY for small (<=8kiB) page, otherwise, query JET_paramLVChunkSizeMost


	/* Max size of long-value (LongBinary or LongText) column default value */

#define JET_cbLVDefaultValueMost	255

	/* Max size of non-long-value column data */

#define JET_cbColumnMost			255

	/* Max size of a sort/index key */

#if ( JET_VERSION >= 0x0601 )
#define JET_cbKeyMostMost				JET_cbKeyMost32KBytePage
#define JET_cbKeyMost32KBytePage		JET_cbKeyMost8KBytePage
#define JET_cbKeyMost16KBytePage		JET_cbKeyMost8KBytePage
#endif // JET_VERSION >= 0x0601
#if ( JET_VERSION >= 0x0600 )
#define JET_cbKeyMost8KBytePage		2000
#define JET_cbKeyMost4KBytePage		1000
#define JET_cbKeyMost2KBytePage		500
#define JET_cbKeyMostMin			255
#endif // JET_VERSION >= 0x0600

#define JET_cbKeyMost				255		//	defunct constant retained for backward compatibility
#define JET_cbLimitKeyMost			256		//	defunct constant retained for backward compatibility
#define JET_cbPrimaryKeyMost		255		//	defunct constant retained for backward compatibility
#define JET_cbSecondaryKeyMost		255		//	defunct constant retained for backward compatibility


	/* Max number of components in a sort/index key */

#if ( JET_VERSION >= 0x0600 )
#define JET_ccolKeyMost				16
#else // !JET_VERSION >= 0x0600
#define JET_ccolKeyMost				12
#endif // !JET_VERSION >= 0x0600

//	maximum number of columns
#if ( JET_VERSION >= 0x0501 )
#define JET_ccolMost				0x0000fee0
#else // !JET_VERSION >= 0x0501
#define JET_ccolMost				0x00007ffe
#endif // !JET_VERSION >= 0x0501
#define JET_ccolFixedMost			0x0000007f
#define JET_ccolVarMost				0x00000080
#define JET_ccolTaggedMost			( JET_ccolMost - 0x000000ff )

#if ( JET_VERSION >= 0x0501 )
#define JET_EventLoggingDisable		0
#if ( JET_VERSION >= 0x0601 )
#define JET_EventLoggingLevelMin	1
#define JET_EventLoggingLevelLow	25
#define JET_EventLoggingLevelMedium	50
#define JET_EventLoggingLevelHigh	75
#endif // JET_VERSION >= 0x0601
#define JET_EventLoggingLevelMax	100
#endif // JET_VERSION >= 0x0501

//	system paramters
//
//  NOTE:  the default values of these parameters used to be documented here.
//  this can no longer be done because we now support multiple sets of default
//  values as set by JET_paramConfiguration
//
//	location parameters
//
#define JET_paramSystemPath						0	//	path to check point file
#define JET_paramTempPath						1	//	path to the temporary database
#define JET_paramLogFilePath 					2	//	path to the log file directory
#define JET_paramBaseName						3	//	base name for all DBMS object names
#define JET_paramEventSource					4	//	language independent process descriptor string

//	performance parameters
//
#define JET_paramMaxSessions					5	//	maximum number of sessions
#define JET_paramMaxOpenTables  				6	//	maximum number of open directories
													//  	need 1 for each open table index,
													//  	plus 1 for each open table with no indexes,
													//  	plus 1 for each table with long column data,
													//  	plus a few more.
													//		for 4.1, 1/3 for regular table, 2/3 for index
#define JET_paramPreferredMaxOpenTables			7	//	preferred maximum number of open directories
#if ( JET_VERSION >= 0x0600 )
#define JET_paramCachedClosedTables				125	//	number of closed tables to cache the meta-data for
#endif // JET_VERSION >= 0x0600
#define JET_paramMaxCursors						8	//	maximum number of open cursors
#define JET_paramMaxVerPages					9	//	maximum version store size in version pages
#define JET_paramPreferredVerPages				63	//	preferred version store size in version pages
#if ( JET_VERSION >= 0x0501 )
#define JET_paramGlobalMinVerPages				81	//	minimum version store size for all instances in version pages
#define JET_paramVersionStoreTaskQueueMax		105	//	maximum number of tasks in the task queue before start dropping the tasks
#endif // JET_VERSION >= 0x0501
#define JET_paramMaxTemporaryTables				10	//	maximum concurrent open temporary table/index creation
#define JET_paramLogFileSize					11	//	log file size in kBytes
#define JET_paramLogBuffers						12	//	log buffers in 512 byte units.
#define JET_paramWaitLogFlush					13	//	log flush wait time in milliseconds
#define JET_paramLogCheckpointPeriod			14	//	checkpoint period in sectors
#define JET_paramLogWaitingUserMax				15	//	maximum sessions waiting log flush
#define JET_paramCommitDefault					16	//	default grbit for JetCommitTransaction
#define JET_paramCircularLog					17	//	boolean flag for circular logging
#define JET_paramDbExtensionSize				18	//	database extension size in pages
#define JET_paramPageTempDBMin					19  //	minimum size temporary database in pages
#define JET_paramPageFragment					20	//	maximum disk extent considered fragment in pages
#if ( JET_VERSION >= 0x0600 )
#define JET_paramEnableFileCache				126	//  enable the use of the OS file cache for all managed files
#define JET_paramVerPageSize					128	//  the version store page size
#define JET_paramConfiguration					129	//  RESETs all parameters to their default for a given configuration
#define JET_paramEnableAdvanced					130	//  enables the modification of advanced settings
#define JET_paramMaxColtyp						131	//	maximum coltyp supported by this version of ESE
#endif // JET_VERSION >= 0x0600

//  cache performance parameters
//
#define JET_paramBatchIOBufferMax				22	//	maximum batch I/O buffers in pages
#define JET_paramCacheSize						41	//	current cache size in pages
#define JET_paramCacheSizeMin					60	//	minimum cache size in pages
#define JET_paramCacheSizeMax					23	//	maximum cache size in pages
#define JET_paramCheckpointDepthMax				24	//	maximum checkpoint depth in bytes
#define JET_paramLRUKCorrInterval				25  //	time (usec) under which page accesses are correlated
#define JET_paramLRUKHistoryMax					26  //	maximum LRUK history records
#define JET_paramLRUKPolicy						27  //	K-ness of LRUK page eviction algorithm (1...2)
#define JET_paramLRUKTimeout					28  //	time (sec) after which cached pages are always evictable
#define JET_paramLRUKTrxCorrInterval			29  //	Not Used: time (usec) under which page accesses by the same transaction are correlated
#define JET_paramOutstandingIOMax				30	//	maximum outstanding I/Os
#define JET_paramStartFlushThreshold			31	//	evictable pages at which to start a flush (proportional to CacheSizeMax)
#define JET_paramStopFlushThreshold				32	//	evictable pages at which to stop a flush (proportional to CacheSizeMax)
#if ( JET_VERSION >= 0x0600 )
#define JET_paramEnableViewCache				127	//  enable the use of memory mapped file I/O for database files
#define JET_paramCheckpointIOMax				135	//  maxiumum number of pending flush writes
#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION >= 0x0600 )
// TableClass names
#define JET_paramTableClass1Name				137 	// name of tableclass1
#define JET_paramTableClass2Name				138 	// name of tableclass2
#define JET_paramTableClass3Name				139 	// name of tableclass3
#define JET_paramTableClass4Name				140 	// name of tableclass4
#define JET_paramTableClass5Name				141 	// name of tableclass5
#define JET_paramTableClass6Name				142 	// name of tableclass6
#define JET_paramTableClass7Name				143 	// name of tableclass7
#define JET_paramTableClass8Name				144 	// name of tableclass8
#define JET_paramTableClass9Name				145 	// name of tableclass9
#define JET_paramTableClass10Name				146 	// name of tableclass10
#define JET_paramTableClass11Name				147 	// name of tableclass11
#define JET_paramTableClass12Name				148 	// name of tableclass12
#define JET_paramTableClass13Name				149 	// name of tableclass13
#define JET_paramTableClass14Name				150 	// name of tableclass14
#define JET_paramTableClass15Name				151 	// name of tableclass15
#endif // JET_VERSION >= 0x0600
#if ( JET_VERSION >= 0x0600 )
// Values for JET_paramIOPriority
#define JET_IOPriorityNormal                    0       // default
#define JET_IOPriorityLow                       1
#define JET_paramIOPriority			            152     //	adjust IO priority per instance, anytime. Mainly for background recovery
                                                        //  Doesn't affect pending IOs, just subsequent ones
#endif // JET_VERSION >= 0x0600

//	debug only parameters
//
#define JET_paramRecovery						34	//	enable recovery
#define JET_paramEnableOnlineDefrag				35	//	enable online defrag

//	Application specific parameter
//
#define JET_paramCheckFormatWhenOpenFail		44	//	JetInit may return JET_errDatabaseXXXformat instead of database corrupt when it is set
#define JET_paramEnableTempTableVersioning		46	//	Enable versioning of temp tables
#define JET_paramIgnoreLogVersion				47	//	Do not check the log version
#define JET_paramDeleteOldLogs					48	//	Delete the log files if the version is old, after deleting may make database non-recoverable
#define JET_paramEventSourceKey					49	//	Event source registration key value
#define JET_paramNoInformationEvent				50	//	Disable logging information event
#if ( JET_VERSION >= 0x0501 )
#define JET_paramEventLoggingLevel				51	//	Set the type of information that goes to event log
#define JET_paramDeleteOutOfRangeLogs			52	//	Delete the log files that are not matching (generation wise) during soft recovery
#define JET_paramAccessDeniedRetryPeriod		53	//	Number of milliseconds to retry when about to fail with AccessDenied
#endif // JET_VERSION >= 0x0501

//	Index-checking parameters
//
//	Different versions of windows normalize unicode text in different ways. That means indexes built under one version of Windows may
//	not work on other versions. Windows Server 2003 Beta 3 introduced GetNLSVersion() which can be used to determine the version of unicode normalization
//	that the OS currently provides. Indexes built in server 2003 are flagged with the version of unicode normalization that they were
//	built with (older indexes have no version information). Most unicode normalization changes consist of adding new characters -- codepoints
//	which were previously undefined are defined and normalize differently. Thus, if binary data is stored in a unicode column it will normalize
//	differently as new codepoints are defined.
//
//	As of Windows Server 2003 RC1 ESENT tracks unicode index entries that contain undefined codepoints. These can be used to fixup an index when the
//	set of defined unicode characters changes.
//
//	These parameters control what happens when ESENT attaches to a database that was last used under a different build of the OS (the OS version
//	is stamped in the database header).
//
//	If JET_paramEnableIndexChecking is TRUE JetAttachDatabase() will delete indexes if JET_bitDbDeleteCorruptIndexes or return an error if
//	the grbit was not specified and there are indexes which need deletion. If it is set to FALSE then JetAttachDatabase() will succeed, even
//	if there are potentially corrupt indexes.
//
//	If JET_paramEnableIndexCleanup is set, the internal fixup table will be used to fixup index entries. This may not fixup all index corruptions
//	but will be transparent to the application.
//

#define JET_paramEnableIndexChecking			45  //	Enable checking OS version for indexes
#if ( JET_VERSION >= 0x0502 )
#define JET_paramEnableIndexCleanup				54  //	Enable cleanup of out-of-date index entries
#endif // JET_VERSION >= 0x0502

//												60	//	JET_paramCacheSizeMin defined above
//												63	//	JET_paramPreferredVerPages defined above
#define JET_paramDatabasePageSize				64	//	set database page size
#if ( JET_VERSION >= 0x0501 )
#define JET_paramDisableCallbacks				65	//	turn off callback resolution (for defrag/repair)
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0600 )
#define JET_paramDisablePerfmon					107 //  disable perfmon support for this process
#endif // JET_VERSION >= 0x0600
#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION >= 0x0600 )
#define JET_paramEnablePersistedCallbacks		156  //  allow the database engine to resolve and use callbacks persisted in a database
#endif // JET_VERSION >= 0x0600

//  Backup performance parameters
//
#define JET_paramBackupChunkSize				66  //	backup read size in pages
#define JET_paramBackupOutstandingReads			67	//	backup maximum reads outstanding

#define JET_paramSLVProviderEnable				68  //	Enable SLV Provider
// begin_PubEsent
#define JET_paramLogFileCreateAsynch			69	//	prepares next log file while logging to the current one to smooth response time
#endif // JET_VERSION >= 0x0501
#define JET_paramErrorToString					70  //	turns a JET_err into a string (taken from the comment in jet.h)
#if ( JET_VERSION >= 0x0501 )
#define JET_paramZeroDatabaseDuringBackup		71	//	Overwrite deleted records/LVs during backup
#endif // JET_VERSION >= 0x0501
#define JET_paramUnicodeIndexDefault			72	//	default LCMapString() lcid and flags to use for CreateIndex() and unique multi-values check
													//		(pass JET_UNICODEINDEX structure for lParam)
#if ( JET_VERSION >= 0x0501 )
#define JET_paramRuntimeCallback				73	//	pointer to runtime-only callback function
#endif // JET_VERSION >= 0x0501
#define JET_paramCleanupMismatchedLogFiles		77	//	instead of erroring out after a successful recovery with JET_errLogFileSizeMismatchDatabasesConsistent, ESE will silently delete the old log files and checkpoint file and continue operations
#if ( JET_VERSION >= 0x0501 )
#define JET_paramRecordUpgradeDirtyLevel		78	//	how aggresively should pages with their record format converted be flushed (0-3)
//												81	//	JET_paramGlobalMinVerPages defined above
#define JET_paramOSSnapshotTimeout				82	//	timeout for the freeze period in msec
#endif // JET_VERSION >= 0x0501

#define JET_paramExceptionAction				98	//	what to do with exceptions generated within JET
#define JET_paramEventLogCache					99  //	number of bytes of eventlog records to cache if service is not available
#if ( JET_VERSION >= 0x0501 )
#define JET_paramCreatePathIfNotExist			100	//	create system/temp/log/log-failover paths if they do not exist
#define JET_paramPageHintCacheSize				101 //	maximum size of the fast page latch hint cache in bytes
#define JET_paramOneDatabasePerSession			102	//	allow just one open user database per session
#define JET_paramMaxInstances					104	//	maximum number of instances per process

#define JET_paramIndexTuplesLengthMin			110	//	for tuple indexes, minimum length of a tuple
#define JET_paramIndexTuplesLengthMax			111	//	for tuple indexes, maximum length of a tuple
#define JET_paramIndexTuplesToIndexMax			112	//	for tuple indexes, maximum number of characters in a given string to index
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0502 )
#define JET_paramAlternateDatabaseRecoveryPath	113	//	recovery-only - search for dirty-shutdown databases in specified location only
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0600 )
#define JET_paramIndexTupleIncrement			132 //	for tuple indexes, offset increment for each succesive tuple
#define JET_paramIndexTupleStart				133 //	for tuple indexes, offset to start tuple indexing
#define JET_paramKeyMost						134 //	read only maximum settable key length before key trunctation occurs
#define JET_paramLegacyFileNames				136  //	Legacy  file name characteristics to preserve ( JET_bitESE98FileNames | JET_bitEightDotThreeSoftCompat )
#endif // JET_VERSION >= 0x0600
#if ( JET_VERSION >= 0x0601 )
#define JET_paramWaypointLatency				153  //	The latency (in logs) behind the tip / highest committed log to defer database page flushes.
#define JET_paramDefragmentSequentialBTrees		160  // Turn on/off automatic sequential B-tree defragmentation
#define JET_paramDefragmentSequentialBTreesDensityCheckFrequency	161  // Determine how frequently B-tree density is checked
#define JET_paramIOThrottlingTimeQuanta			162  // Max time (in MS) that the I/O throttling mechanism gives a task to run for it to be considered 'completed'.
#define JET_paramLVChunkSizeMost				163  // Max LV chuck size supported wrt the chosen page size (R/O)
#define JET_paramMaxCoalesceReadSize			164  // Max number of bytes that can be grouped for a coalesced read operation.
#define JET_paramMaxCoalesceWriteSize			165  // Max number of bytes that can be grouped for a coalesced write operation.
#define JET_paramMaxCoalesceReadGapSize		166  // Max number of bytes that can be gapped for a coalesced read IO operation.
#define JET_paramMaxCoalesceWriteGapSize		167	// Max number of bytes that can be gapped for a coalesced write IO operation.
#endif // JET_VERSION >= 0x0601


#if ( JET_VERSION >= 0x0600 )

	/* Flags for JET_paramLegacyFileNames */

#define JET_bitESE98FileNames			0x00000001	//	Preserve the .log and .chk extension for compatibility reasons (i.e. Exchange)
#define JET_bitEightDotThreeSoftCompat	0x00000002	//	Preserve the 8.3 naming syntax for as long as possible. (this should not be changed, w/o ensuring there are no log files)
#endif // JET_VERSION >= 0x0600

	/* Flags for JetInit2, JetInit3 */

#if ( JET_VERSION >= 0x0501 )
// IGNORE_MISSING_ATTACH, ignoring hanging asserts for missing databases during recovery
#define JET_bitReplayIgnoreMissingDB		0x00000004	//	ignore missing databases
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0600 )
#define JET_bitRecoveryWithoutUndo			0x00000008	//	perform recovery, but halt at the Undo phase
#define JET_bitTruncateLogsAfterRecovery	0x00000010	//	on successful soft recovery, truncate log files
#define JET_bitReplayMissingMapEntryDB		0x00000020 /* missing database map entry default to same location */
#define JET_bitLogStreamMustExist			0x00000040	//	transaction logs must exist in the logfile directory (ie. cannot auto-start a new log stream)
#endif // JET_VERSION >= 0x0600
#if ( JET_VERSION >= 0x0601 )
#define	JET_bitReplayIgnoreLostLogs			0x00000080	//	ignore logs lost from the end of the log stream
#endif // JET_VERSION >= 0x0601

	/* Flags for JetTerm2 */

#define JET_bitTermComplete				0x00000001
#define JET_bitTermAbrupt				0x00000002
#define JET_bitTermStopBackup			0x00000004
#if ( JET_VERSION >= 0x0601 )
#define JET_bitTermDirty				0x00000008
#endif // JET_VERSION >= 0x0601

	/* Flags for JetIdle */

#define JET_bitIdleFlushBuffers			0x00000001
#define JET_bitIdleCompact				0x00000002
#define JET_bitIdleStatus				0x00000004

	/* Flags for JetEndSession */


	/* Flags for JetAttach/OpenDatabase */

#define JET_bitDbReadOnly				0x00000001
#define JET_bitDbExclusive				0x00000002 /* multiple opens allowed */
#define JET_bitDbDeleteCorruptIndexes	0x00000010 /* delete indexes possibly corrupted by NT version upgrade */
#if ( JET_VERSION >= 0x0502 )
#define JET_bitDbDeleteUnicodeIndexes	0x00000400 /* delete all indexes with unicode columns */
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0501 )
#define JET_bitDbUpgrade				0x00000200 /* */
#endif // JET_VERSION >= 0x0501

	/* Flags for JetDetachDatabase2 */

#if ( JET_VERSION >= 0x0501 )
#define JET_bitForceDetach			  		0x00000001
#define JET_bitForceCloseAndDetach			(0x00000002 | JET_bitForceDetach)
#endif // JET_VERSION >= 0x0501

	/* Flags for JetCreateDatabase */

#define JET_bitDbRecoveryOff 			0x00000008 /* disable logging/recovery for this database */
#define JET_bitDbShadowingOff			0x00000080 /* disable catalog shadowing */
#if ( JET_VERSION >= 0x0501 )
#define JET_bitDbOverwriteExisting		0x00000200 /* overwrite existing database with same name */
#endif // JET_VERSION >= 0x0501

	/* Flags for JetBackup, JetBeginExternalBackup, JetBeginExternalBackupInstance, JetBeginSurrogateBackup */

#define JET_bitBackupIncremental		0x00000001
#define JET_bitBackupAtomic				0x00000004
#if ( JET_VERSION >= 0x0501 )
#define JET_bitBackupSnapshot			0x00000010
#endif // JET_VERSION >= 0x0501

	/* Flags for JetEndExternalBackupInstance2, JetEndSurrogateBackup */

#if ( JET_VERSION >= 0x0501 )
#define JET_bitBackupEndNormal				0x0001
#define JET_bitBackupEndAbort				0x0002
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0600 )
#define JET_bitBackupTruncateDone			0x0100
#endif // JET_VERSION >= 0x0600

	/* Database types */

#define JET_dbidNil			((JET_DBID) 0xFFFFFFFF)


	/* Flags for JetCreateTableColumnIndex */
#define JET_bitTableCreateFixedDDL			0x00000001	/* DDL is fixed */
#define JET_bitTableCreateTemplateTable		0x00000002	/* DDL is inheritable (implies FixedDDL) */
#if ( JET_VERSION >= 0x0501 )
#define JET_bitTableCreateNoFixedVarColumnsInDerivedTables	0x00000004
														//	used in conjunction with JET_bitTableCreateTemplateTable
														//	to disallow fixed/var columns in derived tables (so that
														//	fixed/var columns may be added to the template in the future)
#endif // JET_VERSION >= 0x0501


	/* Flags for JetAddColumn, JetGetColumnInfo, JetOpenTempTable */

#define JET_bitColumnFixed				0x00000001
#define JET_bitColumnTagged				0x00000002
#define JET_bitColumnNotNULL			0x00000004
#define JET_bitColumnVersion				0x00000008
#define JET_bitColumnAutoincrement		0x00000010
#define JET_bitColumnUpdatable			0x00000020 /* JetGetColumnInfo only */
#define JET_bitColumnTTKey				0x00000040 /* JetOpenTempTable only */
#define JET_bitColumnTTDescending		0x00000080 /* JetOpenTempTable only */
#define JET_bitColumnMultiValued			0x00000400
#define JET_bitColumnEscrowUpdate		0x00000800 /* escrow updated */
#define JET_bitColumnUnversioned		0x00001000 /* for add column only - add column unversioned */
#if ( JET_VERSION >= 0x0501 )
#define JET_bitColumnMaybeNull			0x00002000 /* for retrieve column info of outer join where no match from the inner table */
#define JET_bitColumnFinalize				0x00004000 /* this is a finalizable column (issue callback if escrow value equals 0) */
#define JET_bitColumnUserDefinedDefault	0x00008000 /* default value from a user-provided callback */
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0502 )
#define JET_bitColumnDeleteOnZero		0x00020000 /* this is a finalizable column (delete record if escrow value equals 0) */
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0601 )
#define JET_bitColumnCompressed			0x00080000 /* data in the column can be compressed */
#endif

#if ( JET_VERSION >= 0x0501 )
//	flags for JetDeleteColumn
#define JET_bitDeleteColumnIgnoreTemplateColumns	0x00000001	//	for derived tables, don't bother looking in template columns
#endif // JET_VERSION >= 0x0501


	/* Flags for JetSetCurrentIndex */

#define JET_bitMoveFirst				0x00000000
#define JET_bitNoMove					0x00000002

	/* Flags for JetMakeKey */

#define JET_bitNewKey					0x00000001
#define JET_bitStrLimit 				0x00000002
#define JET_bitSubStrLimit				0x00000004
#define JET_bitNormalizedKey 			0x00000008
#define JET_bitKeyDataZeroLength		0x00000010
#if ( JET_VERSION >= 0x0501 )
#define JET_bitFullColumnStartLimit		0x00000100
#define JET_bitFullColumnEndLimit		0x00000200
#define JET_bitPartialColumnStartLimit	0x00000400
#define JET_bitPartialColumnEndLimit	0x00000800
#endif // JET_VERSION >= 0x0501

	/* Flags for JetSetIndexRange */

#define JET_bitRangeInclusive			0x00000001
#define JET_bitRangeUpperLimit			0x00000002
#define JET_bitRangeInstantDuration		0x00000004
#define JET_bitRangeRemove				0x00000008

	/* Flags for JetGetLock */

#define JET_bitReadLock					0x00000001
#define JET_bitWriteLock				0x00000002

	/* Constants for JetMove */

#define JET_MoveFirst					(0x80000000)
#define JET_MovePrevious				(-1)
#define JET_MoveNext					(+1)
#define JET_MoveLast					(0x7fffffff)

	/* Flags for JetMove */

#define JET_bitMoveKeyNE				0x00000001

	/* Flags for JetSeek */

#define JET_bitSeekEQ					0x00000001
#define JET_bitSeekLT					0x00000002
#define JET_bitSeekLE					0x00000004
#define JET_bitSeekGE					0x00000008
#define JET_bitSeekGT		 			0x00000010
#define JET_bitSetIndexRange			0x00000020
#if ( JET_VERSION >= 0x0502 )
#define JET_bitCheckUniqueness			0x00000040	//	to be used with JET_bitSeekEQ only, returns JET_wrnUniqueKey if seek lands on a key which has no dupes
#endif // JET_VERSION >= 0x0502

#if ( JET_VERSION >= 0x0501 )
	//	Flags for JetGotoSecondaryIndexBookmark
#define JET_bitBookmarkPermitVirtualCurrency	0x00000001	//	place cursor on relative position in index if specified bookmark no longer exists
#endif // JET_VERSION >= 0x0501

	/* Flags for JET_CONDITIONALCOLUMN */
#define JET_bitIndexColumnMustBeNull	0x00000001
#define JET_bitIndexColumnMustBeNonNull	0x00000002

	/* Flags for JET_INDEXRANGE */
#define JET_bitRecordInIndex			0x00000001
#define JET_bitRecordNotInIndex			0x00000002

	/* Flags for JetCreateIndex */

#define JET_bitIndexUnique				0x00000001
#define JET_bitIndexPrimary				0x00000002
#define JET_bitIndexDisallowNull		0x00000004
#define JET_bitIndexIgnoreNull			0x00000008
#define JET_bitIndexIgnoreAnyNull		0x00000020
#define JET_bitIndexIgnoreFirstNull		0x00000040
#define JET_bitIndexLazyFlush			0x00000080
#define JET_bitIndexEmpty				0x00000100	// don't attempt to build index, because all entries would evaluate to NULL (MUST also specify JET_bitIgnoreAnyNull)
#define JET_bitIndexUnversioned			0x00000200
#define JET_bitIndexSortNullsHigh		0x00000400	// NULL sorts after data for all columns in the index
#define JET_bitIndexUnicode				0x00000800	// LCID field of JET_INDEXCREATE actually points to a JET_UNICODEINDEX struct to allow user-defined LCMapString() flags
#if ( JET_VERSION >= 0x0501 )
#define JET_bitIndexTuples				0x00001000	// index on substring tuples (text columns only)
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0502 )
#define JET_bitIndexTupleLimits			0x00002000	// cbVarSegMac field of JET_INDEXCREATE actually points to a JET_TUPLELIMITS struct to allow custom tuple index limits (implies JET_bitIndexTuples)
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0600 )
#define JET_bitIndexCrossProduct		0x00004000	// index over multiple multi-valued columns has full cross product
#define JET_bitIndexKeyMost				0x00008000	// custom index key size set instead of default of 255 bytes
#define JET_bitIndexDisallowTruncation	0x00010000	// fail update rather than truncate index keys
#define JET_bitIndexNestedTable			0x00020000	// index over multiple multi-valued columns but only with values of same itagSequence
#endif // JET_VERSION >= 0x0600

	/* Flags for index key definition */

#define JET_bitKeyAscending				0x00000000
#define JET_bitKeyDescending			0x00000001

	/* Flags for JetOpenTable */

#define JET_bitTableDenyWrite			0x00000001
#define JET_bitTableDenyRead			0x00000002
#define JET_bitTableReadOnly			0x00000004
#define JET_bitTableUpdatable			0x00000008
#define JET_bitTablePermitDDL			0x00000010	/*  override table flagged as FixedDDL (must be used with DenyRead) */
#define JET_bitTableNoCache			0x00000020	/*	don't cache the pages for this table */
#define JET_bitTablePreread			0x00000040	/*	assume the table is probably not in the buffer cache */
#define JET_bitTableOpportuneRead	0x00000080	/* attempt to opportunely read physically adjacent leaf pages using larger physical IOs */
#define JET_bitTableSequential			0x00008000  /*  assume the table will be scanned sequentially */


#define JET_bitTableClassMask		0x000F0000	/*  table stats class mask  */
#define JET_bitTableClassNone		0x00000000  /*  table belongs to no stats class (default)  */
#define JET_bitTableClass1			0x00010000  /*  table belongs to stats class 1  */
#define JET_bitTableClass2			0x00020000  /*  table belongs to stats class 2  */
#define JET_bitTableClass3			0x00030000  /*  table belongs to stats class 3  */
#define JET_bitTableClass4			0x00040000  /*  table belongs to stats class 4  */
#define JET_bitTableClass5			0x00050000  /*  table belongs to stats class 5  */
#define JET_bitTableClass6			0x00060000  /*  table belongs to stats class 6  */
#define JET_bitTableClass7			0x00070000  /*  table belongs to stats class 7  */
#define JET_bitTableClass8			0x00080000  /*  table belongs to stats class 8  */
#define JET_bitTableClass9			0x00090000  /*  table belongs to stats class 9  */
#define JET_bitTableClass10			0x000A0000  /*  table belongs to stats class 10  */
#define JET_bitTableClass11			0x000B0000  /*  table belongs to stats class 11  */
#define JET_bitTableClass12			0x000C0000  /*  table belongs to stats class 12  */
#define JET_bitTableClass13			0x000D0000  /*  table belongs to stats class 13  */
#define JET_bitTableClass14			0x000E0000  /*  table belongs to stats class 14  */
#define JET_bitTableClass15			0x000F0000  /*  table belongs to stats class 15  */

#if ( JET_VERSION >= 0x0501 )
#define JET_bitLSReset				0x00000001	/*	reset LS value */
#define JET_bitLSCursor				0x00000002	/*	set/retrieve LS of table cursor */
#define JET_bitLSTable				0x00000004	/*	set/retrieve LS of table */

#define JET_LSNil					(~(JET_LS)0)
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION >= 0x0601 )
	/* Flags for JetSetTableSequential */

#define JET_bitPrereadForward		0x00000001	/*	Hint that the sequential traversal will be in the forward direction */
#define JET_bitPrereadBackward		0x00000002	/*	Hint that the sequential traversal will be in the backward direction */
#endif // JET_VERSION >= 0x0601

	/* Flags for JetOpenTempTable */

#define JET_bitTTIndexed			0x00000001	/* Allow seek */
#define JET_bitTTUnique 			0x00000002	/* Remove duplicates */
#define JET_bitTTUpdatable			0x00000004	/* Allow updates */
#define JET_bitTTScrollable			0x00000008	/* Allow backwards scrolling */
#define JET_bitTTSortNullsHigh		0x00000010	/* NULL sorts after data for all columns in the index */
#define JET_bitTTForceMaterialization		0x00000020						/* Forces temp. table to be materialized into a btree (allows for duplicate detection) */
#if ( JET_VERSION >= 0x0501 )
#define JET_bitTTErrorOnDuplicateInsertion	JET_bitTTForceMaterialization	/* Error always returned when duplicate is inserted (instead of dupe being silently removed) */
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0502 )
#define JET_bitTTForwardOnly		0x00000040	/* Prevents temp. table from being materialized into a btree (and enables duplicate keys) */
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0601 )
#define JET_bitTTIntrinsicLVsOnly	0x00000080	//	permit only intrinsic LV's (so materialisation is not required simply because a TT has an LV column)
#endif // JET_VERSION >= 0x0601

	/* Flags for JetSetColumn */

#define JET_bitSetAppendLV					0x00000001
#define JET_bitSetOverwriteLV				0x00000004 /* overwrite JET_coltypLong* byte range */
#define JET_bitSetSizeLV					0x00000008 /* set JET_coltypLong* size */
#define JET_bitSetZeroLength				0x00000020
#define JET_bitSetSeparateLV 				0x00000040 /* force LV separation */
#define JET_bitSetUniqueMultiValues			0x00000080 /* prevent duplicate multi-values */
#define JET_bitSetUniqueNormalizedMultiValues	0x00000100 /* prevent duplicate multi-values, normalizing all data before performing comparisons */
#if ( JET_VERSION >= 0x0501 )
#define JET_bitSetRevertToDefaultValue		0x00000200 /* if setting last tagged instance to NULL, revert to default value instead if one exists */
#define JET_bitSetIntrinsicLV				0x00000400 /* store whole LV in record without bursting or return an error */
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0601 )
#define JET_bitSetCompressed				0x00020000 /* attempt compression when storing the data */
#define JET_bitSetUncompressed				0x00010000 /* don't attempt compression when storing the data */
#endif



#if ( JET_VERSION >= 0x0601 )
	/*	Space Hint Flags / JET_SPACEHINTS	*/

//	Generic 
#define JET_bitSpaceHintsUtilizeParentSpace			0x00000001	//	This changes the internal allocation policy to get space heirarchically from a B-Tree's immediate parent.
//	Create
#define JET_bitCreateHintAppendSequential			0x00000002	//	This bit will enable Append split behavior to grow according to the growth dynamics of the table (set by cbMinExtent, ulGrowth, cbMaxExtent).
#define JET_bitCreateHintHotpointSequential			0x00000004	//	This bit will enable Hotpoint split behavior to grow according to the growth dynamics of the table (set by cbMinExtent, ulGrowth, cbMaxExtent).
//	Retrieve
#define JET_bitRetrieveHintReserve1					0x00000008	//	Reserved and ignored
#define JET_bitRetrieveHintTableScanForward			0x00000010	//	By setting this the client indicates that forward sequential scan is the predominant usage pattern of this table.
#define JET_bitRetrieveHintTableScanBackward		0x00000020	//	By setting this the client indicates that backwards sequential scan is the predominant usage pattern of this table.
#define JET_bitRetrieveHintReserve2					0x00000040	//	Reserved and ignored
#define JET_bitRetrieveHintReserve3					0x00000080	//	Reserved and ignored
//	Update
//#define JET_bitUpdateReserved						0x00000000	//	TBD.
//	Delete / .grbitDelete
#define JET_bitDeleteHintTableSequential			0x00000100	//	This means that the application expects this table to be cleaned up in-order sequentially (from lowest key to highest key)
#endif // JET_VERSION >= 0x0601


	/*	Set column parameter structure for JetSetColumns */

typedef struct {
	JET_COLUMNID			columnid;
	const void 				*pvData;
	unsigned long 			cbData;
	JET_GRBIT				grbit;
	unsigned long			ibLongValue;
	unsigned long			itagSequence;
	JET_ERR					err;
} JET_SETCOLUMN;

#if ( JET_VERSION >= 0x0501 )
typedef struct {
	unsigned long	paramid;
	JET_API_PTR		lParam;
	const char		*sz;
	JET_ERR			err;
} JET_SETSYSPARAM_A;

typedef struct {
	unsigned long	paramid;
	JET_API_PTR		lParam;
	const WCHAR		*sz;
	JET_ERR			err;
} JET_SETSYSPARAM_W;


#ifdef JET_UNICODE
#define JET_SETSYSPARAM JET_SETSYSPARAM_W
#else
#define JET_SETSYSPARAM JET_SETSYSPARAM_A
#endif

#endif // JET_VERSION >= 0x0501

	/* Options for JetPrepareUpdate */

#define JET_prepInsert						0
#define JET_prepReplace 					2
#define JET_prepCancel						3
#define JET_prepReplaceNoLock				4
#define JET_prepInsertCopy					5
#if ( JET_VERSION >= 0x0501 )
#define JET_prepInsertCopyDeleteOriginal	7	//	used for updating a record in the primary key; avoids the delete/insert process */
#endif // JET_VERSION >= 0x0501

	//	Flags for JetUpdate
#if ( JET_VERSION >= 0x0502 )
#define JET_bitUpdateCheckESE97Compatibility	0x00000001	//	check whether record fits if represented in ESE97 database format
#endif // JET_VERSION >= 0x0502

	/* Flags for JetEscrowUpdate */
#define JET_bitEscrowNoRollback				0x0001

	/* Flags for JetRetrieveColumn */

#define JET_bitRetrieveCopy					0x00000001
#define JET_bitRetrieveFromIndex			0x00000002
#define JET_bitRetrieveFromPrimaryBookmark	0x00000004
#define JET_bitRetrieveTag					0x00000008
#define JET_bitRetrieveNull					0x00000010	/*	for columnid 0 only */
#define JET_bitRetrieveIgnoreDefault		0x00000020	/*	for columnid 0 only */
#define JET_bitRetrieveLongId				0x00000040
#define JET_bitRetrieveLongValueRefCount	0x00000080	/*  for testing use only */
#if ( JET_VERSION >= 0x0600 )
#define JET_bitRetrieveTuple				0x00000800 /* retrieve tuple fragment from index */
#endif // JET_VERSION >= 0x0600

	/* Retrieve column parameter structure for JetRetrieveColumns */

typedef struct {
	JET_COLUMNID		columnid;
	void 				*pvData;
	unsigned long 		cbData;
	unsigned long 		cbActual;
	JET_GRBIT			grbit;
	unsigned long		ibLongValue;
	unsigned long		itagSequence;
	JET_COLUMNID		columnidNextTagged;
	JET_ERR				err;
} JET_RETRIEVECOLUMN;




#if ( JET_VERSION >= 0x0501 )
	/* Flags for JetEnumerateColumns */

#define JET_bitEnumerateCopy						JET_bitRetrieveCopy
#define JET_bitEnumerateIgnoreDefault				JET_bitRetrieveIgnoreDefault
#define JET_bitEnumeratePresenceOnly				0x00020000
#define JET_bitEnumerateTaggedOnly					0x00040000
#define JET_bitEnumerateCompressOutput				0x00080000
#if ( JET_VERSION >= 0x0502 )
// Available on Server 2003 SP1
#define JET_bitEnumerateIgnoreUserDefinedDefault	0x00100000
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0601 )
#define JET_bitEnumerateInRecordOnly				0x00200000
#endif // JET_VERSION >= 0x0601

	/* Parameter structures for JetEnumerateColumns */

typedef struct {
	JET_COLUMNID			columnid;
	unsigned long			ctagSequence;
	unsigned long*			rgtagSequence;
} JET_ENUMCOLUMNID;

typedef struct {
	unsigned long			itagSequence;
	JET_ERR					err;
	unsigned long			cbData;
	void*					pvData;
} JET_ENUMCOLUMNVALUE;

typedef struct {
	JET_COLUMNID			columnid;
	JET_ERR					err;
	union {
		struct { /* err != JET_wrnColumnSingleValue */
			unsigned long			cEnumColumnValue;
			JET_ENUMCOLUMNVALUE*	rgEnumColumnValue;
		};
		struct { /* err == JET_wrnColumnSingleValue */
			unsigned long			cbData;
			void*					pvData;
		};
	};
} JET_ENUMCOLUMN;

	/* Realloc callback for JetEnumerateColumns */

typedef void* (JET_API *JET_PFNREALLOC)(
	__in_opt void *		pvContext,
	__in_opt void *		pv,
	__in unsigned long	cb );

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION >= 0x0600 )
	/* Flags for JetGetRecordSize */

#define JET_bitRecordSizeInCopyBuffer			0x00000001	//	use record in copy buffer
#define JET_bitRecordSizeRunningTotal			0x00000002	//	increment totals in output buffer instead of setting them
#define JET_bitRecordSizeLocal					0x00000004	//	ignore Long Values (and other data otherwise not in the same page as the record)

	/* parameter structures for JetGetRecordSize */

typedef struct {
	unsigned __int64	cbData;					//	user data in record
	unsigned __int64	cbLongValueData;		//	user data associated with the record but stored in the long-value tree (NOTE: does NOT count intrinsic long-values)
	unsigned __int64	cbOverhead;				//	record overhead
	unsigned __int64	cbLongValueOverhead;	//	overhead of long-value data (NOTE: does not count intrinsic long-values)
	unsigned __int64	cNonTaggedColumns;		//	total number of fixed/variable columns
	unsigned __int64	cTaggedColumns;			//	total number of tagged columns
	unsigned __int64	cLongValues;			//	total number of values stored in the long-value tree for this record (NOTE: does NOT count intrinsic long-values)
	unsigned __int64	cMultiValues;			//	total number of values beyond the first for each column in the record
} JET_RECSIZE;
#endif // JET_VERSION >= 0x0600


#if ( JET_VERSION >= 0x0601 )
typedef struct {
	unsigned __int64	cbData;					//	user data in record
	unsigned __int64	cbLongValueData;		//	user data associated with the record but stored in the long-value tree (NOTE: does NOT count intrinsic long-values)
	unsigned __int64	cbOverhead;				//	record overhead
	unsigned __int64	cbLongValueOverhead;	//	overhead of long-value data (NOTE: does not count intrinsic long-values)
	unsigned __int64	cNonTaggedColumns;		//	total number of fixed/variable columns
	unsigned __int64	cTaggedColumns;			//	total number of tagged columns
	unsigned __int64	cLongValues;			//	total number of values stored in the long-value tree for this record (NOTE: does NOT count intrinsic long-values)
	unsigned __int64	cMultiValues;			//	total number of values beyond the first for each column in the record
	unsigned __int64	cCompressedColumns;		//	total number of columns which are compressed
	unsigned __int64	cbDataCompressed;		//	compressed size of user data in record (same as cbData if no intrinsic long-values are compressed)
	unsigned __int64	cbLongValueDataCompressed;	// compressed size of user data in the long-value tree (same as cbLongValue data if no separated long values are compressed)
} JET_RECSIZE2;
#endif // JET_VERSION >= 0x0601

#pragma warning(pop)		//	nonstandard extension used : nameless struct/union


	/* Flags for JetBeginTransaction2 */

#if ( JET_VERSION >= 0x0501 )
#define JET_bitTransactionReadOnly		0x00000001	/* transaction will not modify the database */
#endif // JET_VERSION >= 0x0501

	/* Flags for JetCommitTransaction */

#define JET_bitCommitLazyFlush			0x00000001	/* lazy flush log buffers. */
#define JET_bitWaitLastLevel0Commit		0x00000002	/* wait for last level 0 commit record flushed */
#if ( JET_VERSION >= 0x0502 )
#define JET_bitWaitAllLevel0Commit		0x00000008	/* wait for all level 0 commits to be flushed */
#endif // JET_VERSION >= 0x0502
#if ( JET_VERSION >= 0x0601 )
#define JET_bitForceNewLog				0x00000010
#endif // JET_VERSION >= 0x0601

	/* Flags for JetRollback */

#define JET_bitRollbackAll				0x00000001


#if ( JET_VERSION >= 0x0600 )
	/* Flags for JetOSSnapshot APIs */

	/* Flags for JetOSSnapshotPrepare */
#define JET_bitIncrementalSnapshot		0x00000001	/* bit 0: full (0) or incremental (1) snapshot */
#define JET_bitCopySnapshot				0x00000002	/* bit 1: normal (0) or copy (1) snapshot */
#define JET_bitContinueAfterThaw		0x00000004	/* bit 2: end on thaw (0) or wait for [truncate +] end snapshot */
#if ( JET_VERSION >= 0x0601 )
#define JET_bitExplicitPrepare			0x00000008	/* bit 3: all instaces prepared by default (0) or no instance prepared by default (1)  */
#endif // JET_VERSION >= 0x0601

	/* Flags for JetOSSnapshotTruncateLog & JetOSSnapshotTruncateLogInstance */
#define JET_bitAllDatabasesSnapshot		0x00000001	/* bit 0: there are detached dbs in the instance (i.e. can't truncate logs) */

	/* Flags for JetOSSnapshotEnd */
#define JET_bitAbortSnapshot			0x00000001  /* snapshot process failed */
#endif // JET_VERSION >= 0x0600


	/* Info parameter for JetGetDatabaseInfo and JetGetDatabaseFileInfo */

#define JET_DbInfoFilename			0
#define JET_DbInfoConnect			1
#define JET_DbInfoCountry			2
#if ( JET_VERSION >= 0x0501 )
#define JET_DbInfoLCID				3
#endif // JET_VERSION >= 0x0501
#define JET_DbInfoLangid			3		// OBSOLETE: use JET_DbInfoLCID instead
#define JET_DbInfoCp				4
#define JET_DbInfoCollate			5
#define JET_DbInfoOptions			6
#define JET_DbInfoTransactions		7
#define JET_DbInfoVersion			8
#define JET_DbInfoIsam				9
#define JET_DbInfoFilesize			10
#define JET_DbInfoSpaceOwned		11
#define JET_DbInfoSpaceAvailable	12
#define JET_DbInfoUpgrade			13
#define JET_DbInfoMisc				14
#if ( JET_VERSION >= 0x0501 )
#define JET_DbInfoDBInUse			15
#define JET_DbInfoPageSize			17
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0600 )
#define JET_DbInfoFileType			19

#endif // JET_VERSION >= 0x0600

	/* Dbstates from JetGetDatabaseFileInfo */

#define JET_dbstateJustCreated					1
#define JET_dbstateDirtyShutdown				2
#define JET_dbstateCleanShutdown				3
#define JET_dbstateBeingConverted				4
#if ( JET_VERSION >= 0x0501 )
#define JET_dbstateForceDetach					5
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION >= 0x0600 )

	//	supported file types (returned from JetGetDatabaseFileInfo with JET_DbInfoFileType)

#define JET_filetypeUnknown			0
#define JET_filetypeDatabase		1
#define JET_filetypeLog				3
#define JET_filetypeCheckpoint		4
#define JET_filetypeTempDatabase	5

#endif // JET_VERSION >= 0x0600

	/* Column data types */

#define JET_coltypNil				0
#define JET_coltypBit				1	/* True, False, or NULL */
#define JET_coltypUnsignedByte		2	/* 1-byte integer, unsigned */
#define JET_coltypShort 			3	/* 2-byte integer, signed */
#define JET_coltypLong				4	/* 4-byte integer, signed */
#define JET_coltypCurrency			5	/* 8 byte integer, signed */
#define JET_coltypIEEESingle		6	/* 4-byte IEEE single precision */
#define JET_coltypIEEEDouble		7	/* 8-byte IEEE double precision */
#define JET_coltypDateTime			8	/* Integral date, fractional time */
#define JET_coltypBinary			9	/* Binary data, < 255 bytes */
#define JET_coltypText				10	/* ANSI text, case insensitive, < 255 bytes */
#define JET_coltypLongBinary		11	/* Binary data, long value */
#define JET_coltypLongText			12	/* ANSI text, long value */
#if ( JET_VERSION >= 0x0600 )
#define JET_coltypSLV				13	/* SLV's */
#define JET_coltypUnsignedLong		14	/* 4-byte unsigned integer */
#define JET_coltypLongLong			15	/* 8-byte signed integer */
#define JET_coltypGUID				16	/* 16-byte globally unique identifier */
#define JET_coltypUnsignedShort		17	/* 2-byte unsigned integer */
#define JET_coltypMax				18	/* the number of column types  */
										/* used for validity tests and */
										/* array declarations.		   */
#elif ( JET_VERSION >= 0x0501 )
#define JET_coltypSLV				13	/* SLV's */
#define JET_coltypMax				14	/* the number of column types  */
										/* used for validity tests and */
										/* array declarations.		   */
#else // !JET_VERSION >= 0x0501
#define JET_coltypMax				13	/* the number of column types  */
										/* used for validity tests and */
										/* array declarations.		   */
#endif // !JET_VERSION >= 0x0501

	/* Info levels for JetGetObjectInfo */

#define JET_ObjInfo					0U
#define JET_ObjInfoListNoStats		1U
#define JET_ObjInfoList 			2U
#define JET_ObjInfoSysTabCursor 	3U
#define JET_ObjInfoListACM			4U /* Blocked by JetGetObjectInfo */
#define JET_ObjInfoNoStats			5U
#define JET_ObjInfoSysTabReadOnly	6U
#define JET_ObjInfoRulesLoaded		7U
#define JET_ObjInfoMax				8U

	/* Info levels for JetGetTableInfo */

#define JET_TblInfo				0U
#define JET_TblInfoName			1U
#define JET_TblInfoDbid			2U
#define JET_TblInfoMostMany  	3U
#define JET_TblInfoRvt			4U
#define JET_TblInfoOLC			5U
#define JET_TblInfoResetOLC 	6U
#define JET_TblInfoSpaceUsage	7U
#define JET_TblInfoDumpTable	8U
#define JET_TblInfoSpaceAlloc	9U
#define JET_TblInfoSpaceOwned	10U					// OwnExt
#define JET_TblInfoSpaceAvailable		11U			// AvailExt
#define JET_TblInfoTemplateTableName	12U

	/* Info levels for JetGetIndexInfo and JetGetTableIndexInfo */

#define JET_IdxInfo					0U
#define JET_IdxInfoList 			1U
#define JET_IdxInfoSysTabCursor 	2U
#define JET_IdxInfoOLC				3U
#define JET_IdxInfoResetOLC			4U
#define JET_IdxInfoSpaceAlloc		5U
#if ( JET_VERSION >= 0x0501 )
#define JET_IdxInfoLCID				6U
#endif // JET_VERSION >= 0x0501
#define JET_IdxInfoLangid			6U		//	OBSOLETE: use JET_IdxInfoLCID instead
#define JET_IdxInfoCount			7U
#define JET_IdxInfoVarSegMac		8U
#define JET_IdxInfoIndexId			9U
#if ( JET_VERSION >= 0x0600 )
#define JET_IdxInfoKeyMost			10U
#endif // JET_VERSION >= 0x0600
#if ( JET_VERSION >= 0x0601 )
#define JET_IdxInfoCreateIndex		11U		//	return a JET_INDEXCREATE structure suitable for use by JetCreateIndex2()
#define JET_IdxInfoCreateIndex2		12U		//	return a JET_INDEXCREATE2 structure suitable for use by JetCreateIndex2()
#endif // JET_VERSION >= 0x0601

	/* Info levels for JetGetColumnInfo and JetGetTableColumnInfo */

#define JET_ColInfo					0U
#define JET_ColInfoList 			1U
#define JET_ColInfoSysTabCursor 	3U
#define JET_ColInfoBase 			4U
#define JET_ColInfoListCompact 		5U		//	INTERNAL USE ONLY
#if ( JET_VERSION >= 0x0501 )
#define JET_ColInfoByColid			6U
#define JET_ColInfoListSortColumnid	7U		//	OBSOLETE: use grbit instead
#endif // JET_VERSION >= 0x0501
#if ( JET_VERSION >= 0x0600 )
#define JET_ColInfoBaseByColid		8U
#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION >= 0x0600 )

		// Grbits for JET_GetColumnInfo and JetGetTableColumnInfo (OR together with the info level)
#define JET_ColInfoGrbitNonDerivedColumnsOnly	0x80000000	//	for lists, only return non-derived columns (if the table is derived from a template)
#define JET_ColInfoGrbitMinimalInfo				0x40000000	//	for lists, only return the column name and columnid of each column
#define JET_ColInfoGrbitSortByColumnid			0x20000000	//	for lists, sort returned column list by columnid (default is to sort list by column name)

#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION >= 0x0600 )

	/* Info levels for JetGetInstanceMiscInfo, which is very different than JetGetInstanceInfo, as that retrieves a list of all instances */

#define JET_InstanceMiscInfoLogSignature	0U

#endif // JET_VERSION >= 0x0600



	/* Engine Object Types */

#define JET_objtypNil				0
#define JET_objtypTable 			1

	/* Compact Options */

#define JET_bitCompactStats				0x00000020	/* Dump off-line compaction stats (only when progress meter also specified) */
#define JET_bitCompactRepair			0x00000040	/* Don't preread and ignore duplicate keys */

	/* Status Notification Processes */

#define JET_snpRepair					2
#define JET_snpCompact					4
#define JET_snpRestore					8
#define JET_snpBackup					9
#define JET_snpUpgrade					10
#if ( JET_VERSION >= 0x0501 )
#define JET_snpScrub					11
#define JET_snpUpgradeRecordFormat		12
#endif // JET_VERSION >= 0x0501


	/* Status Notification Types */

#define JET_sntBegin			5	/* callback for beginning of operation */
#define JET_sntRequirements		7	/* callback for returning operation requirements */
#define JET_sntProgress 		0	/* callback for progress */
#define JET_sntComplete 		6	/* callback for completion of operation */
#define JET_sntFail				3	/* callback for failure during progress */

	/* Exception action */

#define JET_ExceptionMsgBox		0x0001		/* Display message box on exception */
#define JET_ExceptionNone		0x0002		/* Do nothing on exceptions */


#if ( JET_VERSION >= 0x0501 )
	//	Online defragmentation options
#define JET_OnlineDefragDisable			0x0000		//	disable online defrag
#define JET_OnlineDefragAllOBSOLETE		0x0001		//	enable online defrag for everything (must be 1 for backward compatibility)
#define JET_OnlineDefragDatabases		0x0002		//	enable online defrag of databases
#define JET_OnlineDefragSpaceTrees		0x0004		//	enable online defrag of space trees
#define JET_OnlineDefragAll				0xffff		//	enable online defrag for everything

#endif // JET_VERSION >= 0x0501




/**********************************************************************/
/***********************     ERROR CODES     **************************/
/**********************************************************************/

/* The Error codes are not versioned with WINVER. */

/* SUCCESS */

#define JET_errSuccess						 0    /* Successful Operation */

/* ERRORS */

#define JET_wrnNyi							-1    /* Function Not Yet Implemented */

/*	SYSTEM errors
/**/
#define JET_errRfsFailure			   		-100  /* Resource Failure Simulator failure */
#define JET_errRfsNotArmed					-101  /* Resource Failure Simulator not initialized */
#define JET_errFileClose					-102  /* Could not close file */
#define JET_errOutOfThreads					-103  /* Could not start thread */
#define JET_errTooManyIO		  			-105  /* System busy due to too many IOs */
#define JET_errTaskDropped					-106  /* A requested async task could not be executed */
#define JET_errInternalError				-107  /* Fatal internal error */

//	BUFFER MANAGER errors
//
#define JET_errDatabaseBufferDependenciesCorrupted	-255	/* Buffer dependencies improperly set. Recovery failure */

/*	DIRECTORY MANAGER errors
/**/
#define JET_wrnRemainingVersions 			 321  /* The version store is still active */
#define JET_errPreviousVersion				-322  /* Version already existed. Recovery failure */
#define JET_errPageBoundary					-323  /* Reached Page Boundary */
#define JET_errKeyBoundary		  			-324  /* Reached Key Boundary */
#define JET_errBadPageLink					-327  /* Database corrupted */
#define JET_errBadBookmark					-328  /* Bookmark has no corresponding address in database */
#define JET_errNTSystemCallFailed 			-334  // A call to the operating system failed
#define	JET_errBadParentPageLink			-338  // Database corrupted
#define JET_errSPAvailExtCacheOutOfSync		-340  // AvailExt cache doesn't match btree
#define JET_errSPAvailExtCorrupted			-341  // AvailExt space tree is corrupt
#define JET_errSPAvailExtCacheOutOfMemory	-342  // Out of memory allocating an AvailExt cache node
#define JET_errSPOwnExtCorrupted			-343  // OwnExt space tree is corrupt
#define JET_errDbTimeCorrupted				-344  // Dbtime on current page is greater than global database dbtime
#define JET_wrnUniqueKey					 345  // seek on non-unique index yielded a unique key
#define JET_errKeyTruncated					-346  // key truncated on index that disallows key truncation

/*	RECORD MANAGER errors
/**/
#define JET_wrnSeparateLongValue			 406  /* Column is a separated long-value */
#define JET_wrnRecordFoundGreater			JET_wrnSeekNotEqual
#define JET_wrnRecordFoundLess    			JET_wrnSeekNotEqual
#define JET_errColumnIllegalNull  			JET_errNullInvalid
#define JET_errKeyTooBig					-408  /* Key is too large */

/*	LOGGING/RECOVERY errors
/**/
#define JET_errInvalidLoggedOperation		-500  /* Logged operation cannot be redone */
#define JET_errLogFileCorrupt		  		-501  /* Log file is corrupt */
#define JET_errNoBackupDirectory 			-503  /* No backup directory given */
#define JET_errBackupDirectoryNotEmpty 		-504  /* The backup directory is not emtpy */
#define JET_errBackupInProgress 			-505  /* Backup is active already */
#define JET_errRestoreInProgress			-506  /* Restore in progress */
#define JET_errMissingPreviousLogFile		-509  /* Missing the log file for check point */
#define JET_errLogWriteFail					-510  /* Failure writing to log file */
#define JET_errLogDisabledDueToRecoveryFailure	-511 /* Try to log something after recovery faild */
#define JET_errCannotLogDuringRecoveryRedo	-512	/* Try to log something during recovery redo */
#define JET_errLogGenerationMismatch		-513  /* Name of logfile does not match internal generation number */
#define JET_errBadLogVersion  	  			-514  /* Version of log file is not compatible with Jet version */
#define JET_errInvalidLogSequence  			-515  /* Timestamp in next log does not match expected */
#define JET_errLoggingDisabled 				-516  /* Log is not active */
#define JET_errLogBufferTooSmall			-517  /* Log buffer is too small for recovery */
#define JET_errLogSequenceEnd				-519  /* Maximum log file number exceeded */
#define JET_errNoBackup						-520  /* No backup in progress */
#define JET_errInvalidBackupSequence		-521  /* Backup call out of sequence */
#define JET_errBackupNotAllowedYet			-523  /* Cannot do backup now */
#define JET_errDeleteBackupFileFail	   		-524  /* Could not delete backup file */
#define JET_errMakeBackupDirectoryFail 		-525  /* Could not make backup temp directory */
#define JET_errInvalidBackup		 		-526  /* Cannot perform incremental backup when circular logging enabled */
#define JET_errRecoveredWithErrors			-527  /* Restored with errors */
#define JET_errMissingLogFile				-528  /* Current log file missing */
#define JET_errLogDiskFull					-529  /* Log disk full */
#define JET_errBadLogSignature				-530  /* Bad signature for a log file */
#define JET_errBadDbSignature				-531  /* Bad signature for a db file */
#define JET_errBadCheckpointSignature		-532  /* Bad signature for a checkpoint file */
#define JET_errCheckpointCorrupt			-533  /* Checkpoint file not found or corrupt */
#define JET_errMissingPatchPage				-534  /* Patch file page not found during recovery */
#define JET_errBadPatchPage					-535  /* Patch file page is not valid */
#define JET_errRedoAbruptEnded				-536  /* Redo abruptly ended due to sudden failure in reading logs from log file */
#define JET_errBadSLVSignature				-537  /* Signature in SLV file does not agree with database */
#define JET_errPatchFileMissing				-538  /* Hard restore detected that patch file is missing from backup set */
#define JET_errDatabaseLogSetMismatch		-539  /* Database does not belong with the current set of log files */
#define JET_errDatabaseStreamingFileMismatch	-540 /* Database and streaming file do not match each other */
#define JET_errLogFileSizeMismatch			-541  /* actual log file size does not match JET_paramLogFileSize */
#define JET_errCheckpointFileNotFound		-542  /* Could not locate checkpoint file */
#define JET_errRequiredLogFilesMissing		-543  /* The required log files for recovery is missing. */
#define JET_errSoftRecoveryOnBackupDatabase	-544  /* Soft recovery is intended on a backup database. Restore should be used instead */
#define JET_errLogFileSizeMismatchDatabasesConsistent	-545  /* databases have been recovered, but the log file size used during recovery does not match JET_paramLogFileSize */
#define JET_errLogSectorSizeMismatch		-546  /* the log file sector size does not match the current volume's sector size */
#define JET_errLogSectorSizeMismatchDatabasesConsistent	-547  /* databases have been recovered, but the log file sector size (used during recovery) does not match the current volume's sector size */
#define JET_errLogSequenceEndDatabasesConsistent		-548 /* databases have been recovered, but all possible log generations in the current sequence are used; delete all log files and the checkpoint file and backup the databases before continuing */

#define JET_errStreamingDataNotLogged		-549  /* Illegal attempt to replay a streaming file operation where the data wasn't logged. Probably caused by an attempt to roll-forward with circular logging enabled */

#define JET_errDatabaseDirtyShutdown		-550  /* Database was not shutdown cleanly. Recovery must first be run to properly complete database operations for the previous shutdown. */
#define JET_errDatabaseInconsistent			JET_errDatabaseDirtyShutdown	/* OBSOLETE */
#define JET_errConsistentTimeMismatch		-551  /* Database last consistent time unmatched */
#define JET_errDatabasePatchFileMismatch	-552  /* Patch file is not generated from this backup */
#define JET_errEndingRestoreLogTooLow		-553  /* The starting log number too low for the restore */
#define JET_errStartingRestoreLogTooHigh	-554  /* The starting log number too high for the restore */
#define JET_errGivenLogFileHasBadSignature	-555  /* Restore log file has bad signature */
#define JET_errGivenLogFileIsNotContiguous	-556  /* Restore log file is not contiguous */
#define JET_errMissingRestoreLogFiles		-557  /* Some restore log files are missing */
#define JET_wrnExistingLogFileHasBadSignature	558  /* Existing log file has bad signature */
#define JET_wrnExistingLogFileIsNotContiguous	559  /* Existing log file is not contiguous */
#define JET_errMissingFullBackup			-560  /* The database miss a previous full backup befor incremental backup */
#define JET_errBadBackupDatabaseSize		-561  /* The backup database size is not in 4k */
#define JET_errDatabaseAlreadyUpgraded		-562  /* Attempted to upgrade a database that is already current */
#define JET_errDatabaseIncompleteUpgrade	-563  /* Attempted to use a database which was only partially converted to the current format -- must restore from backup */
#define JET_wrnSkipThisRecord				 564  /* INTERNAL ERROR */
#define JET_errMissingCurrentLogFiles		-565  /* Some current log files are missing for continuous restore */

#define JET_errDbTimeTooOld						-566  /* dbtime on page smaller than dbtimeBefore in record */
#define JET_errDbTimeTooNew						-567  /* dbtime on page in advance of the dbtimeBefore in record */
#define JET_errMissingFileToBackup				-569  /* Some log or patch files are missing during backup */

#define JET_errLogTornWriteDuringHardRestore	-570	/* torn-write was detected in a backup set during hard restore */
#define JET_errLogTornWriteDuringHardRecovery	-571	/* torn-write was detected during hard recovery (log was not part of a backup set) */
#define JET_errLogCorruptDuringHardRestore		-573	/* corruption was detected in a backup set during hard restore */
#define JET_errLogCorruptDuringHardRecovery	 	-574	/* corruption was detected during hard recovery (log was not part of a backup set) */

#define JET_errMustDisableLoggingForDbUpgrade	-575	/* Cannot have logging enabled while attempting to upgrade db */

#define JET_errBadRestoreTargetInstance			-577	/* TargetInstance specified for restore is not found or log files don't match */
#define JET_wrnTargetInstanceRunning			 578	/* TargetInstance specified for restore is running */

#define JET_errRecoveredWithoutUndo				-579	/* Soft recovery successfully replayed all operations, but the Undo phase of recovery was skipped */

#define	JET_errDatabasesNotFromSameSnapshot		-580	/* Databases to be restored are not from the same shadow copy backup */
#define	JET_errSoftRecoveryOnSnapshot			-581	/* Soft recovery on a database from a shadow copy backup set */
#define JET_errCommittedLogFilesMissing			-582	/* One or more logs that were committed to this database, are missing.  These log files are required to maintain durable ACID semantics, but not required to maintain consistency if the JET_bitReplayIgnoreLostLogs bit is specified during recovery. */
#define	JET_errSectorSizeNotSupported			-583	/* The physical sector size reported by the disk subsystem, is unsupported by ESE for a specific file type. */
#define JET_errRecoveredWithoutUndoDatabasesConsistent	-584	/* Soft recovery successfully replayed all operations and intended to skip the Undo phase of recovery, but the Undo phase was not required */
#define JET_wrnCommittedLogFilesLost			585		/* One or more logs that were committed to this database, were not recovered.  The database is still clean/consistent, as though the lost log's transactions were committed lazily (and lost). */
#define JET_errCommittedLogFileCorrupt			-586	/* One or more logs were found to be corrupt during recovery.  These log files are required to maintain durable ACID semantics, but not required to maintain consistency if the JET_bitIgnoreLostLogs bit and JET_paramDeleteOutOfRangeLogs is specified during recovery. */
#define JET_wrnCommittedLogFilesRemoved			587		/* One or more logs that were committed to this database, were no recovered.  The database is still clean/consistent, as though the corrupted log's transactions were committed lazily (and lost). */

#define JET_wrnDatabaseRepaired					 595	/* Database corruption has been repaired */

#define JET_errUnicodeTranslationBufferTooSmall	-601	/* Unicode translation buffer too small */
#define JET_errUnicodeTranslationFail			-602	/* Unicode normalization failed */
#define JET_errUnicodeNormalizationNotSupported	-603	/* OS does not provide support for Unicode normalisation (and no normalisation callback was specified) */

#define JET_errExistingLogFileHasBadSignature	-610	/* Existing log file has bad signature */
#define JET_errExistingLogFileIsNotContiguous	-611	/* Existing log file is not contiguous */

#define JET_errLogReadVerifyFailure			-612  /* Checksum error in log file during backup */
#define JET_errSLVReadVerifyFailure			-613  /* Checksum error in SLV file during backup */

#define JET_errCheckpointDepthTooDeep		-614	//	too many outstanding generations between checkpoint and current generation

#define JET_errRestoreOfNonBackupDatabase	-615	//	hard recovery attempted on a database that wasn't a backup database
#define JET_errLogFileNotCopied				-616	//	log truncation attempted but not all required logs were copied

#define JET_errInvalidGrbit					-900  /* Invalid parameter */

#define JET_errTermInProgress		  		-1000 /* Termination in progress */
#define JET_errFeatureNotAvailable			-1001 /* API not supported */
#define JET_errInvalidName					-1002 /* Invalid name */
#define JET_errInvalidParameter 			-1003 /* Invalid API parameter */
#define JET_wrnColumnNull					 1004 /* Column is NULL-valued */
#define JET_wrnBufferTruncated				 1006 /* Buffer too small for data */
#define JET_wrnDatabaseAttached 			 1007 /* Database is already attached */
#define JET_errDatabaseFileReadOnly			-1008 /* Tried to attach a read-only database file for read/write operations */
#define JET_wrnSortOverflow					 1009 /* Sort does not fit in memory */
#define JET_errInvalidDatabaseId			-1010 /* Invalid database id */
#define JET_errOutOfMemory					-1011 /* Out of Memory */
#define JET_errOutOfDatabaseSpace 			-1012 /* Maximum database size reached */
#define JET_errOutOfCursors					-1013 /* Out of table cursors */
#define JET_errOutOfBuffers					-1014 /* Out of database page buffers */
#define JET_errTooManyIndexes				-1015 /* Too many indexes */
#define JET_errTooManyKeys					-1016 /* Too many columns in an index */
#define JET_errRecordDeleted				-1017 /* Record has been deleted */
#define JET_errReadVerifyFailure			-1018 /* Checksum error on a database page */
#define JET_errPageNotInitialized			-1019 /* Blank database page */
#define JET_errOutOfFileHandles	 			-1020 /* Out of file handles */
#define JET_errDiskReadVerificationFailure	-1021 /* The OS returned ERROR_CRC from file IO */
#define JET_errDiskIO						-1022 /* Disk IO error */
#define JET_errInvalidPath					-1023 /* Invalid file path */
#define JET_errInvalidSystemPath			-1024 /* Invalid system path */
#define JET_errInvalidLogDirectory			-1025 /* Invalid log directory */
#define JET_errRecordTooBig					-1026 /* Record larger than maximum size */
#define JET_errTooManyOpenDatabases			-1027 /* Too many open databases */
#define JET_errInvalidDatabase				-1028 /* Not a database file */
#define JET_errNotInitialized				-1029 /* Database engine not initialized */
#define JET_errAlreadyInitialized			-1030 /* Database engine already initialized */
#define JET_errInitInProgress				-1031 /* Database engine is being initialized */
#define JET_errFileAccessDenied 			-1032 /* Cannot access file, the file is locked or in use */
#define JET_errBufferTooSmall				-1038 /* Buffer is too small */
#define JET_wrnSeekNotEqual					 1039 /* Exact match not found during seek */
#define JET_errTooManyColumns				-1040 /* Too many columns defined */
#define JET_errContainerNotEmpty			-1043 /* Container is not empty */
#define JET_errInvalidFilename				-1044 /* Filename is invalid */
#define JET_errInvalidBookmark				-1045 /* Invalid bookmark */
#define JET_errColumnInUse					-1046 /* Column used in an index */
#define JET_errInvalidBufferSize			-1047 /* Data buffer doesn't match column size */
#define JET_errColumnNotUpdatable			-1048 /* Cannot set column value */
#define JET_errIndexInUse					-1051 /* Index is in use */
#define JET_errLinkNotSupported 			-1052 /* Link support unavailable */
#define JET_errNullKeyDisallowed			-1053 /* Null keys are disallowed on index */
#define JET_errNotInTransaction 			-1054 /* Operation must be within a transaction */
#define JET_wrnNoErrorInfo					 1055 /* No extended error information */
#define JET_wrnNoIdleActivity		 		 1058 /* No idle activity occured */
#define JET_errTooManyActiveUsers			-1059 /* Too many active database users */
#define JET_errInvalidCountry				-1061 /* Invalid or unknown country code */
#define JET_errInvalidLanguageId			-1062 /* Invalid or unknown language id */
#define JET_errInvalidCodePage				-1063 /* Invalid or unknown code page */
#define JET_errInvalidLCMapStringFlags		-1064 /* Invalid flags for LCMapString() */
#define JET_errVersionStoreEntryTooBig		-1065 /* Attempted to create a version store entry (RCE) larger than a version bucket */
#define JET_errVersionStoreOutOfMemoryAndCleanupTimedOut	-1066 /* Version store out of memory (and cleanup attempt failed to complete) */
#define JET_wrnNoWriteLock					 1067 /* No write lock at transaction level 0 */
#define JET_wrnColumnSetNull		   		 1068 /* Column set to NULL-value */
#define JET_errVersionStoreOutOfMemory		-1069 /* Version store out of memory (cleanup already attempted) */
#define JET_errCannotIndex		 	  		-1071 /* Cannot index escrow column or SLV column */
#define JET_errRecordNotDeleted				-1072 /* Record has not been deleted */
#define JET_errTooManyMempoolEntries		-1073 /* Too many mempool entries requested */
#define JET_errOutOfObjectIDs				-1074 /* Out of btree ObjectIDs (perform offline defrag to reclaim freed/unused ObjectIds) */
#define JET_errOutOfLongValueIDs			-1075 /* Long-value ID counter has reached maximum value. (perform offline defrag to reclaim free/unused LongValueIDs) */
#define JET_errOutOfAutoincrementValues		-1076 /* Auto-increment counter has reached maximum value (offline defrag WILL NOT be able to reclaim free/unused Auto-increment values). */
#define JET_errOutOfDbtimeValues			-1077 /* Dbtime counter has reached maximum value (perform offline defrag to reclaim free/unused Dbtime values) */
#define JET_errOutOfSequentialIndexValues	-1078 /* Sequential index counter has reached maximum value (perform offline defrag to reclaim free/unused SequentialIndex values) */

#define JET_errRunningInOneInstanceMode		-1080 /* Multi-instance call with single-instance mode enabled */
#define JET_errRunningInMultiInstanceMode	-1081 /* Single-instance call with multi-instance mode enabled */
#define JET_errSystemParamsAlreadySet		-1082 /* Global system parameters have already been set */

#define JET_errSystemPathInUse				-1083 /* System path already used by another database instance */
#define JET_errLogFilePathInUse				-1084 /* Logfile path already used by another database instance */
#define JET_errTempPathInUse				-1085 /* Temp path already used by another database instance */
#define JET_errInstanceNameInUse			-1086 /* Instance Name already in use */

#define JET_errInstanceUnavailable			-1090 /* This instance cannot be used because it encountered a fatal error */
#define JET_errDatabaseUnavailable			-1091 /* This database cannot be used because it encountered a fatal error */
#define JET_errInstanceUnavailableDueToFatalLogDiskFull	-1092 /* This instance cannot be used because it encountered a log-disk-full error performing an operation (likely transaction rollback) that could not tolerate failure */

#define JET_errOutOfSessions  				-1101 /* Out of sessions */
#define JET_errWriteConflict				-1102 /* Write lock failed due to outstanding write lock */
#define JET_errTransTooDeep					-1103 /* Transactions nested too deeply */
#define JET_errInvalidSesid					-1104 /* Invalid session handle */
#define JET_errWriteConflictPrimaryIndex	-1105 /* Update attempted on uncommitted primary index */
#define JET_errInTransaction				-1108 /* Operation not allowed within a transaction */
#define JET_errRollbackRequired				-1109 /* Must rollback current transaction -- cannot commit or begin a new one */
#define JET_errTransReadOnly				-1110 /* Read-only transaction tried to modify the database */
#define JET_errSessionWriteConflict			-1111 /* Attempt to replace the same record by two diffrerent cursors in the same session */

#define JET_errRecordTooBigForBackwardCompatibility				-1112 /* record would be too big if represented in a database format from a previous version of Jet */
#define JET_errCannotMaterializeForwardOnlySort					-1113 /* The temp table could not be created due to parameters that conflict with JET_bitTTForwardOnly */

#define JET_errSesidTableIdMismatch			-1114 /* This session handle can't be used with this table id */
#define JET_errInvalidInstance				-1115 /* Invalid instance handle */
#define JET_errDirtyShutdown				-1116 /* The instance was shutdown successfully but all the attached databases were left in a dirty state by request via JET_bitTermDirty */


#define JET_errDatabaseDuplicate			-1201 /* Database already exists */
#define JET_errDatabaseInUse				-1202 /* Database in use */
#define JET_errDatabaseNotFound 			-1203 /* No such database */
#define JET_errDatabaseInvalidName			-1204 /* Invalid database name */
#define JET_errDatabaseInvalidPages			-1205 /* Invalid number of pages */
#define JET_errDatabaseCorrupted			-1206 /* Non database file or corrupted db */
#define JET_errDatabaseLocked				-1207 /* Database exclusively locked */
#define JET_errCannotDisableVersioning		-1208 /* Cannot disable versioning for this database */
#define JET_errInvalidDatabaseVersion		-1209 /* Database engine is incompatible with database */

/*	The following error code are for NT clients only. It will return such error during
 *	JetInit if JET_paramCheckFormatWhenOpenFail is set.
 */
#define JET_errDatabase200Format			-1210 /* The database is in an older (200) format */
#define JET_errDatabase400Format			-1211 /* The database is in an older (400) format */
#define JET_errDatabase500Format			-1212 /* The database is in an older (500) format */

#define JET_errPageSizeMismatch				-1213 /* The database page size does not match the engine */
#define JET_errTooManyInstances				-1214 /* Cannot start any more database instances */
#define JET_errDatabaseSharingViolation		-1215 /* A different database instance is using this database */
#define JET_errAttachedDatabaseMismatch		-1216 /* An outstanding database attachment has been detected at the start or end of recovery, but database is missing or does not match attachment info */
#define JET_errDatabaseInvalidPath			-1217 /* Specified path to database file is illegal */
#define JET_errDatabaseIdInUse				-1218 /* A database is being assigned an id already in use */
#define JET_errForceDetachNotAllowed 		-1219 /* Force Detach allowed only after normal detach errored out */
#define JET_errCatalogCorrupted				-1220 /* Corruption detected in catalog */
#define JET_errPartiallyAttachedDB			-1221 /* Database is partially attached. Cannot complete attach operation */
#define JET_errDatabaseSignInUse			-1222 /* Database with same signature in use */

#define JET_errDatabaseCorruptedNoRepair	-1224 /* Corrupted db but repair not allowed */
#define JET_errInvalidCreateDbVersion		-1225 /* recovery tried to replay a database creation, but the database was originally created with an incompatible (likely older) version of the database engine */



#define JET_wrnTableEmpty			 		 1301 /* Opened an empty table */
#define JET_errTableLocked					-1302 /* Table is exclusively locked */
#define JET_errTableDuplicate				-1303 /* Table already exists */
#define JET_errTableInUse					-1304 /* Table is in use, cannot lock */
#define JET_errObjectNotFound				-1305 /* No such table or object */
#define JET_errDensityInvalid				-1307 /* Bad file/index density */
#define JET_errTableNotEmpty				-1308 /* Table is not empty */
#define JET_errInvalidTableId				-1310 /* Invalid table id */
#define JET_errTooManyOpenTables			-1311 /* Cannot open any more tables (cleanup already attempted) */
#define JET_errIllegalOperation 			-1312 /* Oper. not supported on table */
#define JET_errTooManyOpenTablesAndCleanupTimedOut	-1313 /* Cannot open any more tables (cleanup attempt failed to complete) */
#define JET_errObjectDuplicate				-1314 /* Table or object name in use */
#define JET_errInvalidObject				-1316 /* Object is invalid for operation */
#define JET_errCannotDeleteTempTable		-1317 /* Use CloseTable instead of DeleteTable to delete temp table */
#define JET_errCannotDeleteSystemTable		-1318 /* Illegal attempt to delete a system table */
#define JET_errCannotDeleteTemplateTable	-1319 /* Illegal attempt to delete a template table */
#define JET_errExclusiveTableLockRequired	-1322 /* Must have exclusive lock on table. */
#define JET_errFixedDDL						-1323 /* DDL operations prohibited on this table */
#define JET_errFixedInheritedDDL			-1324 /* On a derived table, DDL operations are prohibited on inherited portion of DDL */
#define JET_errCannotNestDDL				-1325 /* Nesting of hierarchical DDL is not currently supported. */
#define JET_errDDLNotInheritable			-1326 /* Tried to inherit DDL from a table not marked as a template table. */
#define JET_wrnTableInUseBySystem			 1327 /* System cleanup has a cursor open on the table */
#define JET_errInvalidSettings				-1328 /* System parameters were set improperly */
#define JET_errClientRequestToStopJetService			-1329	/* Client has requested stop service */
#define JET_errCannotAddFixedVarColumnToDerivedTable	-1330	/* Template table was created with NoFixedVarColumnsInDerivedTables */

/*	DDL errors
/**/
// Note: Some DDL errors have snuck into other categories.
#define JET_errIndexCantBuild				-1401 /* Index build failed */
#define JET_errIndexHasPrimary				-1402 /* Primary index already defined */
#define JET_errIndexDuplicate				-1403 /* Index is already defined */
#define JET_errIndexNotFound				-1404 /* No such index */
#define JET_errIndexMustStay				-1405 /* Cannot delete clustered index */
#define JET_errIndexInvalidDef				-1406 /* Illegal index definition */
#define JET_errInvalidCreateIndex	 		-1409 /* Invalid create index description */
#define JET_errTooManyOpenIndexes			-1410 /* Out of index description blocks */
#define JET_errMultiValuedIndexViolation	-1411 /* Non-unique inter-record index keys generated for a multivalued index */
#define JET_errIndexBuildCorrupted			-1412 /* Failed to build a secondary index that properly reflects primary index */
#define JET_errPrimaryIndexCorrupted		-1413 /* Primary index is corrupt. The database must be defragmented */
#define JET_errSecondaryIndexCorrupted		-1414 /* Secondary index is corrupt. The database must be defragmented */
#define JET_wrnCorruptIndexDeleted			 1415 /* Out of date index removed */
#define JET_errInvalidIndexId				-1416 /* Illegal index id */

#define JET_errIndexTuplesSecondaryIndexOnly		-1430	//	tuple index can only be on a secondary index
#define JET_errIndexTuplesTooManyColumns			-1431	//	tuple index may only have eleven columns in the index
#define JET_errIndexTuplesOneColumnOnly				JET_errIndexTuplesTooManyColumns	/* OBSOLETE */
#define JET_errIndexTuplesNonUniqueOnly				-1432	//	tuple index must be a non-unique index
#define JET_errIndexTuplesTextBinaryColumnsOnly		-1433	//	tuple index must be on a text/binary column
#define JET_errIndexTuplesTextColumnsOnly			JET_errIndexTuplesTextBinaryColumnsOnly		/* OBSOLETE */
#define JET_errIndexTuplesVarSegMacNotAllowed		-1434	//	tuple index does not allow setting cbVarSegMac
#define JET_errIndexTuplesInvalidLimits				-1435	//	invalid min/max tuple length or max characters to index specified
#define JET_errIndexTuplesCannotRetrieveFromIndex	-1436	//	cannot call RetrieveColumn() with RetrieveFromIndex on a tuple index
#define JET_errIndexTuplesKeyTooSmall				-1437	//	specified key does not meet minimum tuple length

/*	DML errors
/**/
// Note: Some DML errors have snuck into other categories.
// Note: Some DDL errors have inappropriately snuck in here.
#define JET_errColumnLong					-1501 /* Column value is long */
#define JET_errColumnNoChunk				-1502 /* No such chunk in long value */
#define JET_errColumnDoesNotFit 			-1503 /* Field will not fit in record */
#define JET_errNullInvalid					-1504 /* Null not valid */
#define JET_errColumnIndexed				-1505 /* Column indexed, cannot delete */
#define JET_errColumnTooBig					-1506 /* Field length is greater than maximum */
#define JET_errColumnNotFound				-1507 /* No such column */
#define JET_errColumnDuplicate				-1508 /* Field is already defined */
#define JET_errMultiValuedColumnMustBeTagged	-1509 /* Attempted to create a multi-valued column, but column was not Tagged */
#define JET_errColumnRedundant				-1510 /* Second autoincrement or version column */
#define JET_errInvalidColumnType			-1511 /* Invalid column data type */
#define JET_wrnColumnMaxTruncated	 		 1512 /* Max length too big, truncated */
#define JET_errTaggedNotNULL				-1514 /* No non-NULL tagged columns */
#define JET_errNoCurrentIndex				-1515 /* Invalid w/o a current index */
#define JET_errKeyIsMade					-1516 /* The key is completely made */
#define JET_errBadColumnId					-1517 /* Column Id Incorrect */
#define JET_errBadItagSequence				-1518 /* Bad itagSequence for tagged column */
#define JET_errColumnInRelationship			-1519 /* Cannot delete, column participates in relationship */
#define JET_wrnCopyLongValue				 1520 /* Single instance column bursted */
#define JET_errCannotBeTagged				-1521 /* AutoIncrement and Version cannot be tagged */
#define JET_errDefaultValueTooBig			-1524 /* Default value exceeds maximum size */
#define JET_errMultiValuedDuplicate			-1525 /* Duplicate detected on a unique multi-valued column */
#define JET_errLVCorrupted					-1526 /* Corruption encountered in long-value tree */
#define JET_errMultiValuedDuplicateAfterTruncation	-1528 /* Duplicate detected on a unique multi-valued column after data was normalized, and normalizing truncated the data before comparison */
#define JET_errDerivedColumnCorruption		-1529 /* Invalid column in derived table */
#define JET_errInvalidPlaceholderColumn		-1530 /* Tried to convert column to a primary index placeholder, but column doesn't meet necessary criteria */
#define JET_wrnColumnSkipped				 1531 /* Column value(s) not returned because the corresponding column id or itagSequence requested for enumeration was null */
#define JET_wrnColumnNotLocal				 1532 /* Column value(s) not returned because they could not be reconstructed from the data at hand */
#define JET_wrnColumnMoreTags				 1533 /* Column values exist that were not requested for enumeration */
#define JET_wrnColumnTruncated				 1534 /* Column value truncated at the requested size limit during enumeration */
#define JET_wrnColumnPresent				 1535 /* Column values exist but were not returned by request */
#define JET_wrnColumnSingleValue			 1536 /* Column value returned in JET_COLUMNENUM as a result of JET_bitEnumerateCompressOutput */
#define JET_wrnColumnDefault				 1537 /* Column value(s) not returned because they were set to their default value(s) and JET_bitEnumerateIgnoreDefault was specified */
#define JET_errColumnCannotBeCompressed		-1538 /* Only JET_coltypLongText and JET_coltypLongBinary columns can be compressed */
#define JET_wrnColumnNotInRecord			 1539 /* Column value(s) not returned because they could not be reconstructed from the data in the record */

#define JET_errRecordNotFound				-1601 /* The key was not found */
#define JET_errRecordNoCopy					-1602 /* No working buffer */
#define JET_errNoCurrentRecord				-1603 /* Currency not on a record */
#define JET_errRecordPrimaryChanged			-1604 /* Primary key may not change */
#define JET_errKeyDuplicate					-1605 /* Illegal duplicate key */
#define JET_errAlreadyPrepared				-1607 /* Attempted to update record when record update was already in progress */
#define JET_errKeyNotMade					-1608 /* No call to JetMakeKey */
#define JET_errUpdateNotPrepared			-1609 /* No call to JetPrepareUpdate */
#define JET_wrnDataHasChanged		 		 1610 /* Data has changed */
#define JET_errDataHasChanged				-1611 /* Data has changed, operation aborted */
#define JET_wrnKeyChanged			 		 1618 /* Moved to new key */
#define JET_errLanguageNotSupported			-1619 /* Windows installation does not support language */
#define JET_errDecompressionFailed			-1620 /* Internal error: data could not be decompressed */

/*	Sort Table errors
/**/
#define JET_errTooManySorts					-1701 /* Too many sort processes */
#define JET_errInvalidOnSort				-1702 /* Invalid operation on Sort */

/*	Other errors
/**/
#define JET_errTempFileOpenError			-1803 /* Temp file could not be opened */
#define JET_errTooManyAttachedDatabases 	-1805 /* Too many open databases */
#define JET_errDiskFull 					-1808 /* No space left on disk */
#define JET_errPermissionDenied 			-1809 /* Permission denied */
#define JET_errFileNotFound					-1811 /* File not found */
#define JET_errFileInvalidType				-1812 /* Invalid file type */
#define JET_wrnFileOpenReadOnly				 1813 /* Database file is read only */

#define JET_errAfterInitialization			-1850 /* Cannot Restore after init. */
#define JET_errLogCorrupted					-1852 /* Logs could not be interpreted */

#define JET_errInvalidOperation 			-1906 /* Invalid operation */
#define JET_errAccessDenied					-1907 /* Access denied */
#define JET_wrnIdleFull						 1908 /* Idle registry full */
#define JET_errTooManySplits				-1909 /* Infinite split */
#define JET_errSessionSharingViolation		-1910 /* Multiple threads are using the same session */
#define JET_errEntryPointNotFound			-1911 /* An entry point in a DLL we require could not be found */
#define JET_errSessionContextAlreadySet		-1912 /* Specified session already has a session context set */
#define JET_errSessionContextNotSetByThisThread	-1913 /* Tried to reset session context, but current thread did not orignally set the session context */
#define JET_errSessionInUse					-1914 /* Tried to terminate session in use */

#define JET_errRecordFormatConversionFailed	-1915 /* Internal error during dynamic record format conversion */
#define JET_errOneDatabasePerSession		-1916 /* Just one open user database per session is allowed (JET_paramOneDatabasePerSession) */
#define JET_errRollbackError				-1917 /* error during rollback */

#define JET_wrnDefragAlreadyRunning			 2000 /* Online defrag already running on specified database */
#define JET_wrnDefragNotRunning				 2001 /* Online defrag not running on specified database */


#define JET_wrnCallbackNotRegistered         2100 /* Unregistered a non-existant callback function */
#define JET_errCallbackFailed				-2101 /* A callback failed */
#define JET_errCallbackNotResolved			-2102 /* A callback function could not be found */

#define JET_errSpaceHintsInvalid			-2103 /* An element of the JET space hints structure was not correct or actionable. */


#define JET_errOSSnapshotInvalidSequence	-2401 /* OS Shadow copy API used in an invalid sequence */
#define JET_errOSSnapshotTimeOut			-2402 /* OS Shadow copy ended with time-out */
#define JET_errOSSnapshotNotAllowed			-2403 /* OS Shadow copy not allowed (backup or recovery in progress) */
#define JET_errOSSnapshotInvalidSnapId		-2404 /* invalid JET_OSSNAPID */

#define JET_errLSCallbackNotSpecified		-3000 /* Attempted to use Local Storage without a callback function being specified */
#define JET_errLSAlreadySet					-3001 /* Attempted to set Local Storage for an object which already had it set */
#define JET_errLSNotSet						-3002 /* Attempted to retrieve Local Storage from an object which didn't have it set */

/** FILE and DISK ERRORS
 **/
//JET_errFileAccessDenied					-1032
//JET_errFileNotFound						-1811
//JET_errInvalidFilename					-1044
#define JET_errFileIOSparse					-4000 /* an I/O was issued to a location that was sparse */
#define JET_errFileIOBeyondEOF				-4001 /* a read was issued to a location beyond EOF (writes will expand the file) */
#define JET_errFileIOAbort					-4002 /* instructs the JET_ABORTRETRYFAILCALLBACK caller to abort the specified I/O */
#define JET_errFileIORetry					-4003 /* instructs the JET_ABORTRETRYFAILCALLBACK caller to retry the specified I/O */
#define JET_errFileIOFail					-4004 /* instructs the JET_ABORTRETRYFAILCALLBACK caller to fail the specified I/O */
#define JET_errFileCompressed				-4005 /* read/write access is not supported on compressed files */

/**********************************************************************/
/***********************     PROTOTYPES      **************************/
/**********************************************************************/

#if !defined(_JET_NOPROTOTYPES)

#ifdef __cplusplus
extern "C" {
#endif


JET_ERR JET_API
JetInit(
	__inout_opt JET_INSTANCE *	pinstance );


#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetInit2(
	__inout_opt JET_INSTANCE *	pinstance,
	__in JET_GRBIT				grbit );

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION >= 0x0600 )
#if ( JET_VERSION < 0x0600 )
#define JetInit3A JetInit3
#endif

JET_ERR JET_API
JetInit3A(
	__inout_opt JET_INSTANCE *	pinstance,
	__in_opt JET_RSTINFO_A *	prstInfo,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetInit3W(
	__inout_opt JET_INSTANCE *	pinstance,
	__in_opt JET_RSTINFO_W *	prstInfo,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetInit3 JetInit3W
#else
#define JetInit3 JetInit3A
#endif
#endif


#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetCreateInstanceA JetCreateInstance
#endif

JET_ERR JET_API
JetCreateInstanceA(
	__out JET_INSTANCE *	pinstance,
	__in_opt JET_PCSTR		szInstanceName );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateInstanceW(
	__out JET_INSTANCE *	pinstance,
	__in_opt JET_PCWSTR		szInstanceName );

#ifdef JET_UNICODE
#define JetCreateInstance JetCreateInstanceW
#else
#define JetCreateInstance JetCreateInstanceA
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetCreateInstance2A JetCreateInstance2
#endif

JET_ERR JET_API
JetCreateInstance2A(
	__out JET_INSTANCE *	pinstance,
	__in_opt JET_PCSTR		szInstanceName,
	__in_opt JET_PCSTR		szDisplayName,
	__in JET_GRBIT			grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateInstance2W(
	__out JET_INSTANCE *	pinstance,
	__in_opt JET_PCWSTR		szInstanceName,
	__in_opt JET_PCWSTR		szDisplayName,
	__in JET_GRBIT			grbit );

#ifdef JET_UNICODE
#define JetCreateInstance2 JetCreateInstance2W
#else
#define JetCreateInstance2 JetCreateInstance2A
#endif
#endif

#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetInstanceMiscInfo(
	__in JET_INSTANCE				instance,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#endif // JET_VERSION >= 0x0600

JET_ERR JET_API
JetTerm(
	__in JET_INSTANCE	instance );
JET_ERR JET_API
JetTerm2(
	__in JET_INSTANCE	instance,
	__in JET_GRBIT		grbit );

JET_ERR JET_API
JetStopService();
#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetStopServiceInstance(
	__in JET_INSTANCE	instance );
#endif // JET_VERSION >= 0x0501

JET_ERR JET_API
JetStopBackup();
#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetStopBackupInstance(
	__in JET_INSTANCE	instance );
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION < 0x0600 )
#define JetSetSystemParameterA JetSetSystemParameter
#endif

JET_ERR JET_API
JetSetSystemParameterA(
	__inout_opt JET_INSTANCE *	pinstance,
	__in JET_SESID				sesid,
	__in unsigned long			paramid,
	__in JET_API_PTR			lParam,
	__in_opt JET_PCSTR			szParam );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetSystemParameterW(
	__inout_opt JET_INSTANCE *	pinstance,
	__in JET_SESID				sesid,
	__in unsigned long			paramid,
	__in JET_API_PTR			lParam,
	__in_opt JET_PCWSTR			szParam );

#ifdef JET_UNICODE
#define JetSetSystemParameter JetSetSystemParameterW
#else
#define JetSetSystemParameter JetSetSystemParameterA
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetGetSystemParameterA JetGetSystemParameter
#endif

JET_ERR JET_API
JetGetSystemParameterA(
	__in JET_INSTANCE					instance,
	__in JET_SESID						sesid,
	__in unsigned long					paramid,
	__inout_opt JET_API_PTR *			plParam,
	__out_bcount_opt( cbMax ) JET_PSTR	szParam,
	__in unsigned long					cbMax );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetSystemParameterW(
	__in JET_INSTANCE					instance,
	__in JET_SESID						sesid,
	__in unsigned long					paramid,
	__inout_opt JET_API_PTR *			plParam,
	__out_bcount_opt( cbMax ) JET_PWSTR	szParam,
	__in unsigned long					cbMax );

#ifdef JET_UNICODE
#define JetGetSystemParameter JetGetSystemParameterW
#else
#define JetGetSystemParameter JetGetSystemParameterA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )

#if ( JET_VERSION < 0x0600 )
#define JetEnableMultiInstanceA JetEnableMultiInstance
#endif

JET_ERR JET_API
JetEnableMultiInstanceA(
	__in_ecount_opt( csetsysparam ) JET_SETSYSPARAM_A *	psetsysparam,
	__in unsigned long									csetsysparam,
	__out_opt unsigned long *							pcsetsucceed );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetEnableMultiInstanceW(
	__in_ecount_opt( csetsysparam ) JET_SETSYSPARAM_W *	psetsysparam,
	__in unsigned long									csetsysparam,
	__out_opt unsigned long *							pcsetsucceed );


#ifdef JET_UNICODE
#define JetEnableMultiInstance JetEnableMultiInstanceW
#else
#define JetEnableMultiInstance JetEnableMultiInstanceA
#endif
#endif

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION >= 0x0600 )
JET_ERR JET_API
JetGetThreadStats(
    __out_bcount( cbMax ) void *	pvResult,
    __in unsigned long				cbMax );
#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION < 0x0600 )
#define JetBeginSessionA JetBeginSession
#endif

JET_ERR JET_API JetBeginSessionA(
	__in JET_INSTANCE	instance,
	__out JET_SESID *	psesid,
	__in_opt JET_PCSTR	szUserName,
	__in_opt JET_PCSTR	szPassword );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API JetBeginSessionW(
	__in JET_INSTANCE	instance,
	__out JET_SESID *	psesid,
	__in_opt JET_PCWSTR	szUserName,
	__in_opt JET_PCWSTR	szPassword );

#ifdef JET_UNICODE
#define JetBeginSession JetBeginSessionW
#else
#define JetBeginSession JetBeginSessionA
#endif
#endif

JET_ERR JET_API
JetDupSession(
	__in JET_SESID		sesid,
	__out JET_SESID *	psesid );

JET_ERR JET_API
JetEndSession(
	__in JET_SESID	sesid,
	__in JET_GRBIT	grbit );

JET_ERR JET_API
JetGetVersion(
	__in JET_SESID			sesid,
	__out unsigned long *	pwVersion );

JET_ERR JET_API
JetIdle(
	__in JET_SESID	sesid,
	__in JET_GRBIT	grbit );

#if ( JET_VERSION < 0x0600 )
#define JetCreateDatabaseA JetCreateDatabase
#endif

JET_ERR JET_API
JetCreateDatabaseA(
	__in JET_SESID		sesid,
	__in JET_PCSTR		szFilename,
	__in_opt JET_PCSTR	szConnect,
	__out JET_DBID *	pdbid,
	__in JET_GRBIT		grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateDatabaseW(
	__in JET_SESID		sesid,
	__in JET_PCWSTR		szFilename,
	__in_opt JET_PCWSTR	szConnect,
	__out JET_DBID *	pdbid,
	__in JET_GRBIT		grbit );

#ifdef JET_UNICODE
#define JetCreateDatabase JetCreateDatabaseW
#else
#define JetCreateDatabase JetCreateDatabaseA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetCreateDatabase2A JetCreateDatabase2
#endif

JET_ERR JET_API
JetCreateDatabase2A(
	__in JET_SESID				sesid,
	__in JET_PCSTR				szFilename,
	__in const unsigned long	cpgDatabaseSizeMax,
	__out JET_DBID *			pdbid,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API JetCreateDatabase2W(
	__in JET_SESID				sesid,
	__in JET_PCWSTR				szFilename,
	__in const unsigned long	cpgDatabaseSizeMax,
	__out JET_DBID *			pdbid,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetCreateDatabase2 JetCreateDatabase2W
#else
#define JetCreateDatabase2 JetCreateDatabase2A
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetAttachDatabaseA JetAttachDatabase
#endif

JET_ERR JET_API
JetAttachDatabaseA(
	__in JET_SESID	sesid,
	__in JET_PCSTR	szFilename,
	__in JET_GRBIT	grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetAttachDatabaseW(
	__in JET_SESID	sesid,
	__in JET_PCWSTR	szFilename,
	__in JET_GRBIT	grbit );

#ifdef JET_UNICODE
#define JetAttachDatabase JetAttachDatabaseW
#else
#define JetAttachDatabase JetAttachDatabaseA
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetAttachDatabase2A JetAttachDatabase2
#endif

JET_ERR JET_API
JetAttachDatabase2A(
	__in JET_SESID				sesid,
	__in JET_PCSTR				szFilename,
	__in const unsigned long	cpgDatabaseSizeMax,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetAttachDatabase2W(
	__in JET_SESID				sesid,
	__in JET_PCWSTR				szFilename,
	__in const unsigned long	cpgDatabaseSizeMax,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetAttachDatabase2 JetAttachDatabase2W
#else
#define JetAttachDatabase2 JetAttachDatabase2A
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetDetachDatabaseA JetDetachDatabase
#endif

JET_ERR JET_API
JetDetachDatabaseA(
	__in JET_SESID	sesid,
	__in JET_PCSTR	szFilename );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDetachDatabaseW(
	__in JET_SESID	sesid,
	__in JET_PCWSTR	szFilename );

#ifdef JET_UNICODE
#define JetDetachDatabase JetDetachDatabaseW
#else
#define JetDetachDatabase JetDetachDatabaseA
#endif
#endif

#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetDetachDatabase2A JetDetachDatabase2
#endif

JET_ERR JET_API
JetDetachDatabase2A(
	__in JET_SESID	sesid,
	__in JET_PCSTR	szFilename,
	__in JET_GRBIT	grbit);

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDetachDatabase2W(
	__in JET_SESID	sesid,
	__in JET_PCWSTR	szFilename,
	__in JET_GRBIT	grbit);

#ifdef JET_UNICODE
#define JetDetachDatabase2 JetDetachDatabase2W
#else
#define JetDetachDatabase2 JetDetachDatabase2A
#endif
#endif

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION < 0x0600 )
#define JetGetObjectInfoA JetGetObjectInfo
#endif

JET_ERR JET_API
JetGetObjectInfoA(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__in JET_OBJTYP					objtyp,
	__in_opt JET_PCSTR				szContainerName,
	__in_opt JET_PCSTR				szObjectName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetObjectInfoW(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__in JET_OBJTYP					objtyp,
	__in_opt JET_PCWSTR				szContainerName,
	__in_opt JET_PCWSTR				szObjectName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetObjectInfo JetGetObjectInfoW
#else
#define JetGetObjectInfo JetGetObjectInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetTableInfoA JetGetTableInfo
#endif

JET_ERR JET_API
JetGetTableInfoA(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetTableInfoW(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetTableInfo JetGetTableInfoW
#else
#define JetGetTableInfo JetGetTableInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetCreateTableA JetCreateTable
#endif

JET_ERR JET_API
JetCreateTableA(
	__in JET_SESID		sesid,
	__in JET_DBID		dbid,
	__in JET_PCSTR		szTableName,
	__in unsigned long	lPages,
	__in unsigned long	lDensity,
	__out JET_TABLEID *	ptableid );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateTableW(
	__in JET_SESID		sesid,
	__in JET_DBID		dbid,
	__in JET_PCWSTR		szTableName,
	__in unsigned long	lPages,
	__in unsigned long	lDensity,
	__out JET_TABLEID *	ptableid );

#ifdef JET_UNICODE
#define JetCreateTable JetCreateTableW
#else
#define JetCreateTable JetCreateTableA
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetCreateTableColumnIndexA JetCreateTableColumnIndex
#endif

JET_ERR JET_API
JetCreateTableColumnIndexA(
	__in JET_SESID				sesid,
	__in JET_DBID				dbid,
	__inout JET_TABLECREATE_A *	ptablecreate );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateTableColumnIndexW(
	__in JET_SESID				sesid,
	__in JET_DBID				dbid,
	__inout JET_TABLECREATE_W *	ptablecreate );

#ifdef JET_UNICODE
#define JetCreateTableColumnIndex JetCreateTableColumnIndexW
#else
#define JetCreateTableColumnIndex JetCreateTableColumnIndexA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetCreateTableColumnIndex2A JetCreateTableColumnIndex2
#endif

JET_ERR JET_API
JetCreateTableColumnIndex2A(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__inout JET_TABLECREATE2_A *	ptablecreate );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateTableColumnIndex2W(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__inout JET_TABLECREATE2_W *	ptablecreate );

#ifdef JET_UNICODE
#define JetCreateTableColumnIndex2 JetCreateTableColumnIndex2W
#else
#define JetCreateTableColumnIndex2 JetCreateTableColumnIndex2A
#endif
#endif // JET_VERSION >= 0x0600
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION >= 0x0601 )

JET_ERR JET_API
JetCreateTableColumnIndex3A(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__inout JET_TABLECREATE3_A *	ptablecreate );

JET_ERR JET_API
JetCreateTableColumnIndex3W(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__inout JET_TABLECREATE3_W *	ptablecreate );

#ifdef JET_UNICODE
#define JetCreateTableColumnIndex3 JetCreateTableColumnIndex3W
#else
#define JetCreateTableColumnIndex3 JetCreateTableColumnIndex3A
#endif
#endif // JET_VERSION >= 0x0601


#if ( JET_VERSION < 0x0600 )
#define JetDeleteTableA JetDeleteTable
#endif

JET_ERR JET_API
JetDeleteTableA(
	__in JET_SESID	sesid,
	__in JET_DBID	dbid,
	__in JET_PCSTR	szTableName );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDeleteTableW(
	__in JET_SESID	sesid,
	__in JET_DBID	dbid,
	__in JET_PCWSTR	szTableName );

#ifdef JET_UNICODE
#define JetDeleteTable JetDeleteTableW
#else
#define JetDeleteTable JetDeleteTableA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetRenameTableA JetRenameTable
#endif

JET_ERR JET_API
JetRenameTableA(
	__in JET_SESID	sesid,
	__in JET_DBID	dbid,
	__in JET_PCSTR	szName,
	__in JET_PCSTR	szNameNew );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API JetRenameTableW(
	__in JET_SESID	sesid,
	__in JET_DBID	dbid,
	__in JET_PCWSTR	szName,
	__in JET_PCWSTR	szNameNew );

#ifdef JET_UNICODE
#define JetRenameTable JetRenameTableW
#else
#define JetRenameTable JetRenameTableA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetTableColumnInfoA JetGetTableColumnInfo
#endif

JET_ERR JET_API
JetGetTableColumnInfoA(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__in JET_PCSTR					szColumnName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API JetGetTableColumnInfoW(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__in JET_PCWSTR					szColumnName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );


#ifdef JET_UNICODE
#define JetGetTableColumnInfo JetGetTableColumnInfoW
#else
#define JetGetTableColumnInfo JetGetTableColumnInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetColumnInfoA JetGetColumnInfo
#endif

JET_ERR JET_API
JetGetColumnInfoA(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__in JET_PCSTR					szTableName,
	__in JET_PCSTR					szColumnName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API JetGetColumnInfoW(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__in JET_PCWSTR					szTableName,
	__in JET_PCWSTR					szColumnName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetColumnInfo JetGetColumnInfoW
#else
#define JetGetColumnInfo JetGetColumnInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetAddColumnA JetAddColumn
#endif

JET_ERR JET_API
JetAddColumnA(
	__in JET_SESID								sesid,
	__in JET_TABLEID							tableid,
	__in JET_PCSTR								szColumnName,
	__in const JET_COLUMNDEF *					pcolumndef,
	__in_bcount_opt( cbDefault ) const void *	pvDefault,
	__in unsigned long							cbDefault,
	__out_opt JET_COLUMNID *					pcolumnid );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API JetAddColumnW(
	__in JET_SESID								sesid,
	__in JET_TABLEID							tableid,
	__in JET_PCWSTR								szColumnName,
	__in const JET_COLUMNDEF *					pcolumndef,
	__in_bcount_opt( cbDefault ) const void *	pvDefault,
	__in unsigned long							cbDefault,
	__out_opt JET_COLUMNID *					pcolumnid );

#ifdef JET_UNICODE
#define JetAddColumn JetAddColumnW
#else
#define JetAddColumn JetAddColumnA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetDeleteColumnA JetDeleteColumn
#endif

JET_ERR JET_API
JetDeleteColumnA(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_PCSTR		szColumnName );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDeleteColumnW(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_PCWSTR		szColumnName );

#ifdef JET_UNICODE
#define JetDeleteColumn JetDeleteColumnW
#else
#define JetDeleteColumn JetDeleteColumnA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetDeleteColumn2A JetDeleteColumn2
#endif

JET_ERR JET_API
JetDeleteColumn2A(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__in JET_PCSTR			szColumnName,
	__in const JET_GRBIT	grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDeleteColumn2W(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__in JET_PCWSTR			szColumnName,
	__in const JET_GRBIT	grbit );

#ifdef JET_UNICODE
#define JetDeleteColumn2 JetDeleteColumn2W
#else
#define JetDeleteColumn2 JetDeleteColumn2A
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetRenameColumnA JetRenameColumn
#endif

JET_ERR JET_API
JetRenameColumnA(
	__in JET_SESID 		sesid,
	__in JET_TABLEID	tableid,
	__in JET_PCSTR		szName,
	__in JET_PCSTR		szNameNew,
	__in JET_GRBIT		grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetRenameColumnW(
	__in JET_SESID 		sesid,
	__in JET_TABLEID	tableid,
	__in JET_PCWSTR		szName,
	__in JET_PCWSTR		szNameNew,
	__in JET_GRBIT		grbit );

#ifdef JET_UNICODE
#define JetRenameColumn JetRenameColumnW
#else
#define JetRenameColumn JetRenameColumnA
#endif
#endif


#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION < 0x0600 )
#define JetSetColumnDefaultValueA JetSetColumnDefaultValue
#endif

JET_ERR JET_API
JetSetColumnDefaultValueA(
	__in JET_SESID						sesid,
	__in JET_DBID						dbid,
	__in JET_PCSTR						szTableName,
	__in JET_PCSTR						szColumnName,
	__in_bcount( cbData ) const void *	pvData,
	__in const unsigned long			cbData,
	__in const JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetColumnDefaultValueW(
	__in JET_SESID						sesid,
	__in JET_DBID						dbid,
	__in JET_PCWSTR						szTableName,
	__in JET_PCWSTR						szColumnName,
	__in_bcount( cbData ) const void *	pvData,
	__in const unsigned long			cbData,
	__in const JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetSetColumnDefaultValue JetSetColumnDefaultValueW
#else
#define JetSetColumnDefaultValue JetSetColumnDefaultValueA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetTableIndexInfoA JetGetTableIndexInfo
#endif

JET_ERR JET_API
JetGetTableIndexInfoA(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__in JET_PCSTR					szIndexName,
	__out_bcount( cbResult ) void *	pvResult,
	__in unsigned long				cbResult,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetTableIndexInfoW(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__in JET_PCWSTR					szIndexName,
	__out_bcount( cbResult ) void *	pvResult,
	__in unsigned long				cbResult,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetTableIndexInfo JetGetTableIndexInfoW
#else
#define JetGetTableIndexInfo JetGetTableIndexInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetIndexInfoA JetGetIndexInfo
#endif

JET_ERR JET_API
JetGetIndexInfoA(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__in JET_PCSTR					szTableName,
	__in JET_PCSTR					szIndexName,
	__out_bcount( cbResult ) void *	pvResult,
	__in unsigned long				cbResult,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetIndexInfoW(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__in JET_PCWSTR					szTableName,
	__in JET_PCWSTR					szIndexName,
	__out_bcount( cbResult ) void *	pvResult,
	__in unsigned long				cbResult,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetIndexInfo JetGetIndexInfoW
#else
#define JetGetIndexInfo JetGetIndexInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetCreateIndexA JetCreateIndex
#endif

JET_ERR JET_API
JetCreateIndexA(
	__in JET_SESID						sesid,
	__in JET_TABLEID					tableid,
	__in JET_PCSTR  					szIndexName,
	__in JET_GRBIT						grbit,
	__in_bcount( cbKey ) const char *	szKey,
	__in unsigned long					cbKey,
	__in unsigned long					lDensity );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateIndexW(
	__in JET_SESID						sesid,
	__in JET_TABLEID					tableid,
	__in JET_PCWSTR  					szIndexName,
	__in JET_GRBIT						grbit,
	__in_bcount( cbKey ) const WCHAR *	szKey,
	__in unsigned long					cbKey,
	__in unsigned long					lDensity );

#ifdef JET_UNICODE
#define JetCreateIndex JetCreateIndexW
#else
#define JetCreateIndex JetCreateIndexA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetCreateIndex2A JetCreateIndex2
#endif

JET_ERR JET_API
JetCreateIndex2A(
	__in JET_SESID									sesid,
	__in JET_TABLEID								tableid,
	__in_ecount( cIndexCreate ) JET_INDEXCREATE_A *	pindexcreate,
    __in unsigned long								cIndexCreate );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCreateIndex2W(
	__in JET_SESID									sesid,
	__in JET_TABLEID								tableid,
	__in_ecount( cIndexCreate ) JET_INDEXCREATE_W *	pindexcreate,
    __in unsigned long								cIndexCreate );

#ifdef JET_UNICODE
#define JetCreateIndex2 JetCreateIndex2W
#else
#define JetCreateIndex2 JetCreateIndex2A
#endif
#endif

#if ( JET_VERSION >= 0x0601 )

JET_ERR JET_API
JetCreateIndex3A(
	__in JET_SESID									sesid,
	__in JET_TABLEID								tableid,
	__in_ecount( cIndexCreate ) JET_INDEXCREATE2_A *pindexcreate,
    __in unsigned long								cIndexCreate );

JET_ERR JET_API
JetCreateIndex3W(
	__in JET_SESID									sesid,
	__in JET_TABLEID								tableid,
	__in_ecount( cIndexCreate ) JET_INDEXCREATE2_W *pindexcreate,
    __in unsigned long								cIndexCreate );

#ifdef JET_UNICODE
#define JetCreateIndex3 JetCreateIndex3W
#else
#define JetCreateIndex3 JetCreateIndex3A
#endif

#endif

#if ( JET_VERSION < 0x0600 )
#define JetDeleteIndexA JetDeleteIndex
#endif

JET_ERR JET_API
JetDeleteIndexA(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_PCSTR		szIndexName );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDeleteIndexW(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_PCWSTR		szIndexName );

#ifdef JET_UNICODE
#define JetDeleteIndex JetDeleteIndexW
#else
#define JetDeleteIndex JetDeleteIndexA
#endif
#endif


JET_ERR JET_API
JetBeginTransaction(
	__in JET_SESID	sesid );

JET_ERR JET_API
JetBeginTransaction2(
	__in JET_SESID	sesid,
	__in JET_GRBIT	grbit );


JET_ERR JET_API
JetCommitTransaction(
	__in JET_SESID	sesid,
	__in JET_GRBIT	grbit );

JET_ERR JET_API
JetRollback(
	__in JET_SESID	sesid,
	__in JET_GRBIT	grbit );


#if ( JET_VERSION < 0x0600 )
#define JetGetDatabaseInfoA JetGetDatabaseInfo
#endif

JET_ERR JET_API JetGetDatabaseInfoA(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetDatabaseInfoW(
	__in JET_SESID					sesid,
	__in JET_DBID					dbid,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetDatabaseInfo JetGetDatabaseInfoW
#else
#define JetGetDatabaseInfo JetGetDatabaseInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetDatabaseFileInfoA JetGetDatabaseFileInfo
#endif

JET_ERR JET_API
JetGetDatabaseFileInfoA(
	__in JET_PCSTR					szDatabaseName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetDatabaseFileInfoW(
	__in JET_PCWSTR					szDatabaseName,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

#ifdef JET_UNICODE
#define JetGetDatabaseFileInfo JetGetDatabaseFileInfoW
#else
#define JetGetDatabaseFileInfo JetGetDatabaseFileInfoA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetOpenDatabaseA JetOpenDatabase
#endif

JET_ERR JET_API
JetOpenDatabaseA(
	__in JET_SESID		sesid,
	__in JET_PCSTR		szFilename,
	__in_opt JET_PCSTR	szConnect,
	__out JET_DBID*		pdbid,
	__in JET_GRBIT		grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetOpenDatabaseW(
	__in JET_SESID		sesid,
	__in JET_PCWSTR		szFilename,
	__in_opt JET_PCWSTR	szConnect,
	__out JET_DBID*		pdbid,
	__in JET_GRBIT		grbit );

#ifdef JET_UNICODE
#define JetOpenDatabase JetOpenDatabaseW
#else
#define JetOpenDatabase JetOpenDatabaseA
#endif
#endif

JET_ERR JET_API
JetCloseDatabase(
	__in JET_SESID	sesid,
	__in JET_DBID	dbid,
	__in JET_GRBIT	grbit );

#if ( JET_VERSION < 0x0600 )
#define JetOpenTableA JetOpenTable
#endif

JET_ERR JET_API
JetOpenTableA(
	__in JET_SESID									sesid,
	__in JET_DBID									dbid,
	__in JET_PCSTR									szTableName,
	__in_bcount_opt( cbParameters ) const void *	pvParameters,
	__in unsigned long								cbParameters,
	__in JET_GRBIT									grbit,
	__out JET_TABLEID *								ptableid );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetOpenTableW(
	__in JET_SESID									sesid,
	__in JET_DBID									dbid,
	__in JET_PCWSTR									szTableName,
	__in_bcount_opt( cbParameters ) const void *	pvParameters,
	__in unsigned long								cbParameters,
	__in JET_GRBIT									grbit,
	__out JET_TABLEID *								ptableid );

#ifdef JET_UNICODE
#define JetOpenTable JetOpenTableW
#else
#define JetOpenTable JetOpenTableA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetSetTableSequential(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_GRBIT		grbit );

JET_ERR JET_API
JetResetTableSequential(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_GRBIT		grbit );
#endif // JET_VERSION >= 0x0501

JET_ERR JET_API
JetCloseTable(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid );

JET_ERR JET_API
JetDelete(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid );

JET_ERR JET_API
JetUpdate(
	__in JET_SESID											sesid,
	__in JET_TABLEID										tableid,
	__out_bcount_part_opt( cbBookmark, *pcbActual ) void *	pvBookmark,
	__in unsigned long										cbBookmark,
	__out_opt unsigned long *								pcbActual );

#if ( JET_VERSION >= 0x0502 )
JET_ERR JET_API
JetUpdate2(
	__in JET_SESID											sesid,
	__in JET_TABLEID										tableid,
	__out_bcount_part_opt( cbBookmark, *pcbActual ) void *	pvBookmark,
	__in unsigned long										cbBookmark,
	__out_opt unsigned long *								pcbActual,
	__in const JET_GRBIT									grbit );
#endif // JET_VERSION >= 0x0502

JET_ERR JET_API
JetEscrowUpdate(
	__in JET_SESID											sesid,
	__in JET_TABLEID										tableid,
	__in JET_COLUMNID										columnid,
	__in_bcount( cbMax ) void *								pv,
	__in unsigned long										cbMax,
	__out_bcount_part_opt( cbOldMax, *pcbOldActual ) void *	pvOld,
	__in unsigned long										cbOldMax,
	__out_opt unsigned long *								pcbOldActual,
	__in JET_GRBIT											grbit );

JET_ERR JET_API
JetRetrieveColumn(
	__in JET_SESID										sesid,
	__in JET_TABLEID									tableid,
	__in JET_COLUMNID									columnid,
	__out_bcount_part_opt( cbData, *pcbActual ) void *	pvData,
	__in unsigned long									cbData,
	__out_opt unsigned long *							pcbActual,
	__in JET_GRBIT										grbit,
	__inout_opt JET_RETINFO *							pretinfo );

JET_ERR JET_API
JetRetrieveColumns(
	__in JET_SESID												sesid,
	__in JET_TABLEID											tableid,
	__inout_ecount_opt( cretrievecolumn ) JET_RETRIEVECOLUMN *	pretrievecolumn,
	__in unsigned long											cretrievecolumn );

#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetEnumerateColumns(
	__in JET_SESID											sesid,
	__in JET_TABLEID										tableid,
	__in unsigned long										cEnumColumnId,
	__in_ecount_opt( cEnumColumnId ) JET_ENUMCOLUMNID *		rgEnumColumnId,
	__out unsigned long *									pcEnumColumn,
	__deref_out_ecount( *pcEnumColumn ) JET_ENUMCOLUMN **	prgEnumColumn,
	__in JET_PFNREALLOC										pfnRealloc,
	__in void *												pvReallocContext,
	__in unsigned long										cbDataMost,
	__in JET_GRBIT											grbit );
#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION >= 0x0600 )
JET_ERR JET_API
JetGetRecordSize(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__out JET_RECSIZE *		precsize,
	__in const JET_GRBIT	grbit );
#endif // JET_VERSION >= 0x0600

#if ( JET_VERSION >= 0x0601 )
JET_ERR JET_API
JetGetRecordSize2(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__out JET_RECSIZE2 *	precsize,
	__in const JET_GRBIT	grbit );
#endif // JET_VERSION >= 0x0601

JET_ERR JET_API
JetSetColumn(
	__in JET_SESID							sesid,
	__in JET_TABLEID						tableid,
	__in JET_COLUMNID						columnid,
	__in_bcount_opt( cbData ) const void *	pvData,
	__in unsigned long						cbData,
	__in JET_GRBIT							grbit,
	__in_opt JET_SETINFO *					psetinfo );

JET_ERR JET_API
JetSetColumns(
	__in JET_SESID									sesid,
	__in JET_TABLEID								tableid,
	__in_ecount_opt( csetcolumn ) JET_SETCOLUMN *	psetcolumn,
	__in unsigned long								csetcolumn );

JET_ERR JET_API
JetPrepareUpdate(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in unsigned long	prep );

JET_ERR JET_API
JetGetRecordPosition(
	__in JET_SESID							sesid,
	__in JET_TABLEID						tableid,
	__out_bcount( cbRecpos ) JET_RECPOS *	precpos,
	__in unsigned long						cbRecpos );

JET_ERR JET_API
JetGotoPosition(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_RECPOS *	precpos );

JET_ERR JET_API
JetGetCursorInfo(
	__in JET_SESID					sesid,
	__in JET_TABLEID				tableid,
	__out_bcount( cbMax ) void *	pvResult,
	__in unsigned long				cbMax,
	__in unsigned long				InfoLevel );

JET_ERR JET_API
JetDupCursor(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__out JET_TABLEID *	ptableid,
	__in JET_GRBIT		grbit );


#if ( JET_VERSION < 0x0600 )
#define JetGetCurrentIndexA JetGetCurrentIndex
#endif

JET_ERR JET_API
JetGetCurrentIndexA(
	__in JET_SESID							sesid,
	__in JET_TABLEID						tableid,
	__out_bcount( ccbIndexName ) JET_PSTR	szIndexName,
	__in unsigned long						ccbIndexName );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetCurrentIndexW(
	__in JET_SESID							sesid,
	__in JET_TABLEID						tableid,
	__out_bcount( ccbIndexName ) JET_PWSTR	szIndexName,
	__in unsigned long						ccbIndexName );

#ifdef JET_UNICODE
#define JetGetCurrentIndex JetGetCurrentIndexW
#else
#define JetGetCurrentIndex JetGetCurrentIndexA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetSetCurrentIndexA JetSetCurrentIndex
#endif

JET_ERR JET_API
JetSetCurrentIndexA(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in_opt JET_PCSTR	szIndexName );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetCurrentIndexW(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in_opt JET_PCWSTR	szIndexName );

#ifdef JET_UNICODE
#define JetSetCurrentIndex JetSetCurrentIndexW
#else
#define JetSetCurrentIndex JetSetCurrentIndexA
#endif
#endif

#if ( JET_VERSION < 0x0600 )
#define JetSetCurrentIndex2A JetSetCurrentIndex2
#endif

JET_ERR JET_API
JetSetCurrentIndex2A(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in_opt JET_PCSTR	szIndexName,
	__in JET_GRBIT		grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetCurrentIndex2W(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in_opt JET_PCWSTR	szIndexName,
	__in JET_GRBIT		grbit );

#ifdef JET_UNICODE
#define JetSetCurrentIndex2 JetSetCurrentIndex2W
#else
#define JetSetCurrentIndex2 JetSetCurrentIndex2A
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetSetCurrentIndex3A JetSetCurrentIndex3
#endif

JET_ERR JET_API
JetSetCurrentIndex3A(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in_opt JET_PCSTR	szIndexName,
	__in JET_GRBIT		grbit,
	__in unsigned long	itagSequence );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetCurrentIndex3W(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in_opt JET_PCWSTR	szIndexName,
	__in JET_GRBIT		grbit,
	__in unsigned long	itagSequence );

#ifdef JET_UNICODE
#define JetSetCurrentIndex3 JetSetCurrentIndex3W
#else
#define JetSetCurrentIndex3 JetSetCurrentIndex3A
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetSetCurrentIndex4A JetSetCurrentIndex4
#endif

JET_ERR JET_API
JetSetCurrentIndex4A(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__in_opt JET_PCSTR		szIndexName,
	__in_opt JET_INDEXID *	pindexid,
	__in JET_GRBIT			grbit,
	__in unsigned long		itagSequence );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetCurrentIndex4W(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__in_opt JET_PCWSTR		szIndexName,
	__in_opt JET_INDEXID *	pindexid,
	__in JET_GRBIT			grbit,
	__in unsigned long		itagSequence );

#ifdef JET_UNICODE
#define JetSetCurrentIndex4 JetSetCurrentIndex4W
#else
#define JetSetCurrentIndex4 JetSetCurrentIndex4A
#endif
#endif


JET_ERR JET_API
JetMove(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in long			cRow,
	__in JET_GRBIT		grbit );

JET_ERR JET_API
JetGetLock(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_GRBIT		grbit );

JET_ERR JET_API
JetMakeKey(
	__in JET_SESID							sesid,
	__in JET_TABLEID						tableid,
	__in_bcount_opt( cbData ) const void *	pvData,
	__in unsigned long						cbData,
	__in JET_GRBIT							grbit );

JET_ERR JET_API
JetSeek(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_GRBIT		grbit );

#if ( JET_VERSION >= 0x0601 )
JET_ERR JET_API
JetPrereadKeys(
	__in JET_SESID										sesid,
	__in JET_TABLEID									tableid,
	__in_ecount(ckeys) const void **					rgpvKeys,
	__in_ecount(ckeys) const unsigned long *			rgcbKeys,
	__in long											ckeys,
	__out_opt long *									pckeysPreread,
	__in JET_GRBIT										grbit );
#endif // JET_VERSION >= 0x0601

JET_ERR JET_API
JetGetBookmark(
	__in JET_SESID										sesid,
	__in JET_TABLEID									tableid,
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pvBookmark,
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual );

#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetGetSecondaryIndexBookmark(
	__in JET_SESID																sesid,
	__in JET_TABLEID															tableid,
	__out_bcount_part_opt( cbSecondaryKeyMax, *pcbSecondaryKeyActual ) void *	pvSecondaryKey,
	__in unsigned long															cbSecondaryKeyMax,
	__out_opt unsigned long *													pcbSecondaryKeyActual,
	__out_bcount_part_opt( cbPrimaryBookmarkMax, *pcbPrimaryKeyActual ) void *	pvPrimaryBookmark,
	__in unsigned long															cbPrimaryBookmarkMax,
	__out_opt unsigned long *													pcbPrimaryKeyActual,
	__in const JET_GRBIT														grbit );
#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION < 0x0600 )
#define JetCompactA JetCompact
#endif

JET_ERR JET_API
JetCompactA(
	__in JET_SESID				sesid,
	__in JET_PCSTR				szDatabaseSrc,
	__in JET_PCSTR				szDatabaseDest,
	__in JET_PFNSTATUS			pfnStatus,
	__in_opt JET_CONVERT_A *	pconvert,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetCompactW(
	__in JET_SESID				sesid,
	__in JET_PCWSTR				szDatabaseSrc,
	__in JET_PCWSTR				szDatabaseDest,
	__in JET_PFNSTATUS			pfnStatus,
	__in_opt JET_CONVERT_W *	pconvert,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetCompact JetCompactW
#else
#define JetCompact JetCompactA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetDefragmentA JetDefragment
#endif

JET_ERR JET_API
JetDefragmentA(
	__in JET_SESID				sesid,
	__in JET_DBID				dbid,
	__in JET_PCSTR				szTableName,
	__out_opt unsigned long *	pcPasses,
	__out_opt unsigned long *	pcSeconds,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDefragmentW(
	__in JET_SESID				sesid,
	__in JET_DBID				dbid,
	__in JET_PCWSTR				szTableName,
	__out_opt unsigned long *	pcPasses,
	__out_opt unsigned long *	pcSeconds,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetDefragment JetDefragmentW
#else
#define JetDefragment JetDefragmentA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetDefragment2A JetDefragment2
#endif

JET_ERR JET_API
JetDefragment2A(
	__in JET_SESID				sesid,
	__in JET_DBID				dbid,
	__in JET_PCSTR				szTableName,
	__out_opt unsigned long *	pcPasses,
	__out_opt unsigned long *	pcSeconds,
	__in JET_CALLBACK			callback,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDefragment2W(
	__in JET_SESID				sesid,
	__in JET_DBID				dbid,
	__in JET_PCWSTR				szTableName,
	__out_opt unsigned long *	pcPasses,
	__out_opt unsigned long *	pcSeconds,
	__in JET_CALLBACK			callback,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetDefragment2 JetDefragment2W
#else
#define JetDefragment2 JetDefragment2A
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetDefragment3A JetDefragment3
#endif

JET_ERR JET_API
JetDefragment3A(
	__in JET_SESID				sesid,
	__in JET_PCSTR				szDatabaseName,
	__in JET_PCSTR				szTableName,
	__out_opt unsigned long *	pcPasses,
	__out_opt unsigned long *	pcSeconds,
	__in JET_CALLBACK			callback,
	__in void *					pvContext,
	__in JET_GRBIT				grbit );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetDefragment3W(
	__in JET_SESID				sesid,
	__in JET_PCWSTR				szDatabaseName,
	__in JET_PCWSTR				szTableName,
	__out_opt unsigned long *	pcPasses,
	__out_opt unsigned long *	pcSeconds,
	__in JET_CALLBACK			callback,
	__in void *					pvContext,
	__in JET_GRBIT				grbit );

#ifdef JET_UNICODE
#define JetDefragment3 JetDefragment3W
#else
#define JetDefragment3 JetDefragment3A
#endif
#endif

#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION < 0x0600 )
#define JetSetDatabaseSizeA JetSetDatabaseSize
#endif

JET_ERR JET_API
JetSetDatabaseSizeA(
	__in JET_SESID			sesid,
	__in JET_PCSTR			szDatabaseName,
	__in unsigned long		cpg,
	__out unsigned long *	pcpgReal );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetSetDatabaseSizeW(
	__in JET_SESID			sesid,
	__in JET_PCWSTR			szDatabaseName,
	__in unsigned long		cpg,
	__out unsigned long *	pcpgReal );

#ifdef JET_UNICODE
#define JetSetDatabaseSize JetSetDatabaseSizeW
#else
#define JetSetDatabaseSize JetSetDatabaseSizeA
#endif
#endif


JET_ERR JET_API
JetGrowDatabase(
	__in JET_SESID			sesid,
	__in JET_DBID			dbid,
	__in unsigned long		cpg,
	__in unsigned long *	pcpgReal );

JET_ERR JET_API
JetSetSessionContext(
	__in JET_SESID		sesid,
	__in JET_API_PTR	ulContext );

JET_ERR JET_API
JetResetSessionContext(
	__in JET_SESID		sesid );

JET_ERR JET_API
JetGotoBookmark(
	__in JET_SESID						sesid,
	__in JET_TABLEID					tableid,
	__in_bcount( cbBookmark ) void *	pvBookmark,
	__in unsigned long					cbBookmark );

#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetGotoSecondaryIndexBookmark(
	__in JET_SESID								sesid,
	__in JET_TABLEID							tableid,
	__in_bcount( cbSecondaryKey ) void *		pvSecondaryKey,
	__in unsigned long							cbSecondaryKey,
	__in_bcount_opt( cbPrimaryBookmark ) void *	pvPrimaryBookmark,
	__in unsigned long							cbPrimaryBookmark,
	__in const JET_GRBIT						grbit );
#endif // JET_VERSION >= 0x0501

JET_ERR JET_API
JetIntersectIndexes(
	__in JET_SESID								sesid,
	__in_ecount( cindexrange ) JET_INDEXRANGE *	rgindexrange,
	__in unsigned long							cindexrange,
	__inout JET_RECORDLIST *					precordlist,
	__in JET_GRBIT								grbit );

JET_ERR JET_API
JetComputeStats(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid );

JET_ERR JET_API
JetOpenTempTable(
	__in JET_SESID									sesid,
	__in_ecount( ccolumn ) const JET_COLUMNDEF *	prgcolumndef,
	__in unsigned long								ccolumn,
	__in JET_GRBIT									grbit,
	__out JET_TABLEID *								ptableid,
	__out_ecount( ccolumn ) JET_COLUMNID *			prgcolumnid );

JET_ERR JET_API
JetOpenTempTable2(
	__in JET_SESID									sesid,
	__in_ecount( ccolumn ) const JET_COLUMNDEF *	prgcolumndef,
	__in unsigned long								lcid,
	__in unsigned long								ccolumn,
	__in JET_GRBIT									grbit,
	__out JET_TABLEID *								ptableid,
	__out_ecount( ccolumn ) JET_COLUMNID *			prgcolumnid );

JET_ERR JET_API
JetOpenTempTable3(
	__in JET_SESID									sesid,
	__in_ecount( ccolumn ) const JET_COLUMNDEF *	prgcolumndef,
	__in unsigned long								ccolumn,
	__in_opt JET_UNICODEINDEX *						pidxunicode,
	__in JET_GRBIT									grbit,
	__out JET_TABLEID *								ptableid,
	__out_ecount( ccolumn ) JET_COLUMNID *			prgcolumnid );

#if ( JET_VERSION >= 0x0600 )
JET_ERR JET_API
JetOpenTemporaryTable(
	__in JET_SESID					sesid,
	__in JET_OPENTEMPORARYTABLE *	popentemporarytable );
#endif // JET_VERSION >= 0x0600


#if ( JET_VERSION < 0x0600 )
#define JetBackupA JetBackup
#endif

JET_ERR JET_API
JetBackupA(
    __in JET_PCSTR		szBackupPath,
    __in JET_GRBIT		grbit,
    __in JET_PFNSTATUS	pfnStatus );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetBackupW(
    __in JET_PCWSTR		szBackupPath,
    __in JET_GRBIT		grbit,
    __in JET_PFNSTATUS	pfnStatus );

#ifdef JET_UNICODE
#define JetBackup JetBackupW
#else
#define JetBackup JetBackupA
#endif
#endif

#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetBackupInstanceA JetBackupInstance
#endif

JET_ERR JET_API
JetBackupInstanceA(
	__in JET_INSTANCE	instance,
    __in JET_PCSTR		szBackupPath,
    __in JET_GRBIT		grbit,
    __in JET_PFNSTATUS	pfnStatus );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetBackupInstanceW(
	__in JET_INSTANCE	instance,
    __in JET_PCWSTR		szBackupPath,
    __in JET_GRBIT		grbit,
    __in JET_PFNSTATUS	pfnStatus );

#ifdef JET_UNICODE
#define JetBackupInstance JetBackupInstanceW
#else
#define JetBackupInstance JetBackupInstanceA
#endif
#endif

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION < 0x0600 )
#define JetRestoreA JetRestore
#endif

JET_ERR JET_API
JetRestoreA(
	__in JET_PCSTR		sz,
	__in JET_PFNSTATUS	pfn );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetRestoreW(
	__in JET_PCWSTR		sz,
	__in JET_PFNSTATUS	pfn );

#ifdef JET_UNICODE
#define JetRestore JetRestoreW
#else
#define JetRestore JetRestoreA
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetRestore2A JetRestore2
#endif

JET_ERR JET_API
JetRestore2A(
	__in JET_PCSTR		sz,
	__in_opt JET_PCSTR	szDest,
	__in JET_PFNSTATUS	pfn );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetRestore2W(
	__in JET_PCWSTR		sz,
	__in_opt JET_PCWSTR	szDest,
	__in JET_PFNSTATUS	pfn );

#ifdef JET_UNICODE
#define JetRestore2 JetRestore2W
#else
#define JetRestore2 JetRestore2A
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetRestoreInstanceA JetRestoreInstance
#endif

JET_ERR JET_API
JetRestoreInstanceA(
	__in JET_INSTANCE	instance,
	__in JET_PCSTR		sz,
	__in_opt JET_PCSTR	szDest,
	__in JET_PFNSTATUS	pfn );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetRestoreInstanceW(
	__in JET_INSTANCE	instance,
	__in JET_PCWSTR		sz,
	__in_opt JET_PCWSTR	szDest,
	__in JET_PFNSTATUS	pfn );

#ifdef JET_UNICODE
#define JetRestoreInstance JetRestoreInstanceW
#else
#define JetRestoreInstance JetRestoreInstanceA
#endif
#endif

#endif // JET_VERSION >= 0x0501

JET_ERR JET_API
JetSetIndexRange(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableidSrc,
	__in JET_GRBIT		grbit );

JET_ERR JET_API
JetIndexRecordCount(
	__in JET_SESID			sesid,
	__in JET_TABLEID		tableid,
	__out unsigned long *	pcrec,
	__in unsigned long		crecMax );

JET_ERR JET_API
JetRetrieveKey(
	__in JET_SESID										sesid,
	__in JET_TABLEID									tableid,
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pvData,
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual,
	__in JET_GRBIT										grbit );

JET_ERR JET_API JetBeginExternalBackup(
	JET_GRBIT grbit );

#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API JetBeginExternalBackupInstance(
	JET_INSTANCE instance,
	JET_GRBIT grbit );
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION < 0x0600 )
#define JetGetAttachInfoA JetGetAttachInfo
#endif

JET_ERR JET_API
JetGetAttachInfoA(
#if ( JET_VERSION < 0x0600 )
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pv,
#else
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PSTR	szz,
#endif
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetAttachInfoW(
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PWSTR	szz,
	__in unsigned long										cbMax,
	__out_opt unsigned long *								pcbActual );


#ifdef JET_UNICODE
#define JetGetAttachInfo JetGetAttachInfoW
#else
#define JetGetAttachInfo JetGetAttachInfoA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetGetAttachInfoInstanceA JetGetAttachInfoInstance
#endif

JET_ERR JET_API
JetGetAttachInfoInstanceA(
	__in JET_INSTANCE									instance,
#if ( JET_VERSION < 0x0600 )
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pv,
#else
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PSTR	szz,
#endif
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetAttachInfoInstanceW(
	__in JET_INSTANCE										instance,
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PWSTR	szz,
	__in unsigned long										cbMax,
	__out_opt unsigned long *								pcbActual );

#ifdef JET_UNICODE
#define JetGetAttachInfoInstance JetGetAttachInfoInstanceW
#else
#define JetGetAttachInfoInstance JetGetAttachInfoInstanceA
#endif
#endif

#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION < 0x0600 )
#define JetOpenFileA JetOpenFile
#endif

JET_ERR JET_API
JetOpenFileA(
	__in JET_PCSTR			szFileName,
	__out JET_HANDLE *		phfFile,
	__out unsigned long *	pulFileSizeLow,
	__out unsigned long *	pulFileSizeHigh );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetOpenFileW(
	__in JET_PCWSTR			szFileName,
	__out JET_HANDLE *		phfFile,
	__out unsigned long *	pulFileSizeLow,
	__out unsigned long *	pulFileSizeHigh );

#ifdef JET_UNICODE
#define JetOpenFile JetOpenFileW
#else
#define JetOpenFile JetOpenFileA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetOpenFileInstanceA JetOpenFileInstance
#endif

JET_ERR JET_API
JetOpenFileInstanceA(
	__in JET_INSTANCE		instance,
	__in JET_PCSTR			szFileName,
	__out JET_HANDLE *		phfFile,
	__out unsigned long *	pulFileSizeLow,
	__out unsigned long *	pulFileSizeHigh );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetOpenFileInstanceW(
	__in JET_INSTANCE		instance,
	__in JET_PCWSTR			szFileName,
	__out JET_HANDLE *		phfFile,
	__out unsigned long *	pulFileSizeLow,
	__out unsigned long *	pulFileSizeHigh );

#ifdef JET_UNICODE
#define JetOpenFileInstance JetOpenFileInstanceW
#else
#define JetOpenFileInstance JetOpenFileInstanceA
#endif
#endif

#endif // JET_VERSION >= 0x0501

JET_ERR JET_API
JetReadFile(
	__in JET_HANDLE								hfFile,
	__out_bcount_part( cb, *pcbActual ) void *	pv,
	__in unsigned long							cb,
	__out_opt unsigned long *					pcbActual );

#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetReadFileInstance(
	__in JET_INSTANCE							instance,
	__in JET_HANDLE								hfFile,
	__out_bcount_part( cb, *pcbActual ) void *	pv,
	__in unsigned long							cb,
	__out_opt unsigned long *					pcbActual );
#endif // JET_VERSION >= 0x0501


JET_ERR JET_API
JetCloseFile(
	__in JET_HANDLE		hfFile );

#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetCloseFileInstance(
	__in JET_INSTANCE	instance,
	__in JET_HANDLE		hfFile );
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION < 0x0600 )
#define JetGetLogInfoA JetGetLogInfo
#endif

JET_ERR JET_API
JetGetLogInfoA(
#if ( JET_VERSION < 0x0600 )
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pv,
#else
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PSTR	szz,
#endif
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetLogInfoW(
		__out_bcount_part_opt( cbMax, *pcbActual ) JET_PWSTR	szz,
		__in unsigned long										cbMax,
		__out_opt unsigned long *								pcbActual );

#ifdef JET_UNICODE
#define JetGetLogInfo JetGetLogInfoW
#else
#define JetGetLogInfo JetGetLogInfoA
#endif
#endif


#if ( JET_VERSION >= 0x0501 )
#if ( JET_VERSION < 0x0600 )
#define JetGetLogInfoInstanceA JetGetLogInfoInstance
#endif

JET_ERR JET_API
JetGetLogInfoInstanceA(
	__in JET_INSTANCE									instance,
#if ( JET_VERSION < 0x0600 )
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pv,
#else
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PSTR szz,
#endif
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetLogInfoInstanceW(
	__in JET_INSTANCE										instance,
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PWSTR	szz,
	__in unsigned long										cbMax,
	__out_opt unsigned long *								pcbActual );

#ifdef JET_UNICODE
#define JetGetLogInfoInstance JetGetLogInfoInstanceW
#else
#define JetGetLogInfoInstance JetGetLogInfoInstanceA
#endif
#endif


#define JET_BASE_NAME_LENGTH 	3
typedef struct
	{
	unsigned long 	cbSize;
	unsigned long	ulGenLow;
	unsigned long	ulGenHigh;
	char			szBaseName[ JET_BASE_NAME_LENGTH + 1 ];
	} JET_LOGINFO_A;

typedef struct
	{
	unsigned long 	cbSize;
	unsigned long	ulGenLow;
	unsigned long	ulGenHigh;
	WCHAR			szBaseName[ JET_BASE_NAME_LENGTH + 1 ];
	} JET_LOGINFO_W;

#ifdef JET_UNICODE
#define JET_LOGINFO JET_LOGINFO_W
#else
#define JET_LOGINFO JET_LOGINFO_A
#endif

#if ( JET_VERSION < 0x0600 )
#define JetGetLogInfoInstance2A JetGetLogInfoInstance2
#endif

JET_ERR JET_API
JetGetLogInfoInstance2A(
	__in JET_INSTANCE									instance,
#if ( JET_VERSION < 0x0600 )
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pv,
#else
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PSTR	szz,
#endif
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual,
	__inout_opt JET_LOGINFO_A *							pLogInfo );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetLogInfoInstance2W(
	__in JET_INSTANCE										instance,
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PWSTR	szz,
	__in unsigned long										cbMax,
	__out_opt unsigned long *								pcbActual,
	__inout_opt JET_LOGINFO_W *								pLogInfo );

#ifdef JET_UNICODE
#define JetGetLogInfoInstance2 JetGetLogInfoInstance2W
#else
#define JetGetLogInfoInstance2 JetGetLogInfoInstance2A
#endif
#endif


#if ( JET_VERSION < 0x0600 )
#define JetGetTruncateLogInfoInstanceA JetGetTruncateLogInfoInstance
#endif

JET_ERR JET_API
JetGetTruncateLogInfoInstanceA(
	__in JET_INSTANCE									instance,
#if ( JET_VERSION < 0x0600 )
	__out_bcount_part_opt( cbMax, *pcbActual ) void *	pv,
#else
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PSTR	szz,
#endif
	__in unsigned long									cbMax,
	__out_opt unsigned long *							pcbActual );


#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetTruncateLogInfoInstanceW(
	__in JET_INSTANCE										instance,
	__out_bcount_part_opt( cbMax, *pcbActual ) JET_PWSTR	szz,
	__in unsigned long										cbMax,
	__out_opt unsigned long *								pcbActual );

#ifdef JET_UNICODE
#define JetGetTruncateLogInfoInstance JetGetTruncateLogInfoInstanceW
#else
#define JetGetTruncateLogInfoInstance JetGetTruncateLogInfoInstanceA
#endif
#endif


#endif // JET_VERSION >= 0x0501

JET_ERR JET_API JetTruncateLog( void );
#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetTruncateLogInstance(
	__in JET_INSTANCE	instance );
#endif // JET_VERSION >= 0x0501

JET_ERR JET_API JetEndExternalBackup( void );
#if ( JET_VERSION >= 0x0501 )
JET_ERR JET_API
JetEndExternalBackupInstance(
	__in JET_INSTANCE	instance );

JET_ERR JET_API
JetEndExternalBackupInstance2(
	__in JET_INSTANCE	instance,
	__in JET_GRBIT		grbit );
#endif // JET_VERSION >= 0x0501


#if ( JET_VERSION < 0x0600 )
#define JetExternalRestoreA JetExternalRestore
#endif

JET_ERR JET_API
JetExternalRestoreA(
	__in JET_PSTR									szCheckpointFilePath,
	__in JET_PSTR									szLogPath,
	__in_ecount_opt( crstfilemap ) JET_RSTMAP_A *	rgrstmap,
	__in long 										crstfilemap,
	__in JET_PSTR									szBackupLogPath,
	__in long										genLow,
	__in long										genHigh,
	__in JET_PFNSTATUS								pfn );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetExternalRestoreW(
	__in JET_PWSTR									szCheckpointFilePath,
	__in JET_PWSTR									szLogPath,
	__in_ecount_opt( crstfilemap ) JET_RSTMAP_W *	rgrstmap,
	__in long 										crstfilemap,
	__in JET_PWSTR									szBackupLogPath,
	__in long										genLow,
	__in long										genHigh,
	__in JET_PFNSTATUS								pfn );

#ifdef JET_UNICODE
#define JetExternalRestore JetExternalRestoreW
#else
#define JetExternalRestore JetExternalRestoreA
#endif
#endif


#if JET_VERSION >= 0x0501
#if ( JET_VERSION < 0x0600 )
#define JetExternalRestore2A JetExternalRestore2
#endif

JET_ERR JET_API
JetExternalRestore2A(
	__in JET_PSTR									szCheckpointFilePath,
	__in JET_PSTR									szLogPath,
	__in_ecount_opt( crstfilemap ) JET_RSTMAP_A *	rgrstmap,
	__in long 										crstfilemap,
	__in JET_PSTR									szBackupLogPath,
	__inout JET_LOGINFO_A *							pLogInfo,
	__in_opt JET_PSTR								szTargetInstanceName,
	__in_opt JET_PSTR								szTargetInstanceLogPath,
	__in_opt JET_PSTR								szTargetInstanceCheckpointPath,
	__in JET_PFNSTATUS								pfn );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetExternalRestore2W(
	__in JET_PWSTR									szCheckpointFilePath,
	__in JET_PWSTR									szLogPath,
	__in_ecount_opt( crstfilemap ) JET_RSTMAP_W *	rgrstmap,
	__in long 										crstfilemap,
	__in JET_PWSTR									szBackupLogPath,
	__inout JET_LOGINFO_W *							pLogInfo,
	__in_opt JET_PWSTR								szTargetInstanceName,
	__in_opt JET_PWSTR								szTargetInstanceLogPath,
	__in_opt JET_PWSTR								szTargetInstanceCheckpointPath,
	__in JET_PFNSTATUS								pfn );

#ifdef JET_UNICODE
#define JetExternalRestore2 JetExternalRestore2W
#else
#define JetExternalRestore2 JetExternalRestore2A
#endif
#endif

JET_ERR JET_API
JetRegisterCallback(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_CBTYP		cbtyp,
	__in JET_CALLBACK	pCallback,
	__in void *			pvContext,
	__out JET_HANDLE *	phCallbackId );


JET_ERR JET_API
JetUnregisterCallback(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_CBTYP		cbtyp,
	__in JET_HANDLE		hCallbackId );

typedef struct _JET_INSTANCE_INFO_A
	{
	JET_INSTANCE		hInstanceId;
	char * 				szInstanceName;

	JET_API_PTR	 		cDatabases;
	char ** 			szDatabaseFileName;
	char ** 			szDatabaseDisplayName;
	char ** 			szDatabaseSLVFileName;
	} JET_INSTANCE_INFO_A;

typedef struct _JET_INSTANCE_INFO_W
	{
	JET_INSTANCE		hInstanceId;
	WCHAR * 			szInstanceName;

	JET_API_PTR	 		cDatabases;
	WCHAR ** 			szDatabaseFileName;
	WCHAR ** 			szDatabaseDisplayName;
	WCHAR ** 			szDatabaseSLVFileName;
	} JET_INSTANCE_INFO_W;

#ifdef JET_UNICODE
#define JET_INSTANCE_INFO JET_INSTANCE_INFO_W
#else
#define JET_INSTANCE_INFO JET_INSTANCE_INFO_A
#endif

#if ( JET_VERSION < 0x0600 )
#define JetGetInstanceInfoA JetGetInstanceInfo
#endif

JET_ERR JET_API
JetGetInstanceInfoA(
	__out unsigned long *											pcInstanceInfo,
	__deref_out_ecount( *pcInstanceInfo ) JET_INSTANCE_INFO_A **	paInstanceInfo );

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetGetInstanceInfoW(
	__out unsigned long *											pcInstanceInfo,
	__deref_out_ecount( *pcInstanceInfo ) JET_INSTANCE_INFO_W **	paInstanceInfo );

#ifdef JET_UNICODE
#define JetGetInstanceInfo JetGetInstanceInfoW
#else
#define JetGetInstanceInfo JetGetInstanceInfoA
#endif
#endif


JET_ERR JET_API
JetFreeBuffer(
	__notnull char *	pbBuf );

JET_ERR JET_API
JetSetLS(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__in JET_LS			ls,
	__in JET_GRBIT		grbit );

JET_ERR JET_API
JetGetLS(
	__in JET_SESID		sesid,
	__in JET_TABLEID	tableid,
	__out JET_LS *		pls,
	__in JET_GRBIT		grbit );

typedef JET_API_PTR JET_OSSNAPID;  	/* Snapshot Session Identifier */

JET_ERR JET_API
JetOSSnapshotPrepare(
	__out JET_OSSNAPID *	psnapId,
	__in const JET_GRBIT	grbit );
#if ( JET_VERSION >= 0x0600 )
JET_ERR JET_API
JetOSSnapshotPrepareInstance(
	__in JET_OSSNAPID		snapId,
	__in JET_INSTANCE		instance,
	__in const JET_GRBIT	grbit );
#endif // JET_VERSION >= 0x0600
#if ( JET_VERSION < 0x0600 )
#define JetOSSnapshotFreezeA JetOSSnapshotFreeze
#endif
JET_ERR JET_API
JetOSSnapshotFreezeA(
	__in const JET_OSSNAPID											snapId,
	__out unsigned long *											pcInstanceInfo,
	__deref_out_ecount( *pcInstanceInfo ) JET_INSTANCE_INFO_A **	paInstanceInfo,
	__in const JET_GRBIT											grbit );
#if ( JET_VERSION >= 0x0600 )
JET_ERR JET_API
JetOSSnapshotFreezeW(
	__in const JET_OSSNAPID											snapId,
	__out unsigned long *											pcInstanceInfo,
	__deref_out_ecount( *pcInstanceInfo ) JET_INSTANCE_INFO_W **	paInstanceInfo,
	__in const JET_GRBIT											grbit );
#ifdef JET_UNICODE
#define JetOSSnapshotFreeze JetOSSnapshotFreezeW
#else
#define JetOSSnapshotFreeze JetOSSnapshotFreezeA
#endif
#endif


JET_ERR JET_API
JetOSSnapshotThaw(
	__in const JET_OSSNAPID	snapId,
	__in const JET_GRBIT	grbit );
#endif // JET_VERSION >= 0x0501

#if ( JET_VERSION >= 0x0502 )
JET_ERR JET_API
JetOSSnapshotAbort(
	__in const JET_OSSNAPID	snapId,
	__in const JET_GRBIT	grbit );
#endif // JET_VERSION >= 0x0502

#if ( JET_VERSION >= 0x0600 )

JET_ERR JET_API
JetOSSnapshotTruncateLog(
	__in const JET_OSSNAPID	snapId,
	__in const JET_GRBIT	grbit );

JET_ERR JET_API
JetOSSnapshotTruncateLogInstance(
	__in const JET_OSSNAPID	snapId,
	__in JET_INSTANCE		instance,
	__in const JET_GRBIT	grbit );

#if ( JET_VERSION < 0x0600 )
#define JetOSSnapshotGetFreezeInfoA JetOSSnapshotGetFreezeInfo
#endif
JET_ERR JET_API
JetOSSnapshotGetFreezeInfoA(
	__in const JET_OSSNAPID											snapId,
	__out unsigned long *											pcInstanceInfo,
	__deref_out_ecount( *pcInstanceInfo ) JET_INSTANCE_INFO_A **	paInstanceInfo,
	__in const JET_GRBIT											grbit );
#if ( JET_VERSION >= 0x0600 )
JET_ERR JET_API
JetOSSnapshotGetFreezeInfoW(
	__in const JET_OSSNAPID											snapId,
	__out unsigned long *											pcInstanceInfo,
	__deref_out_ecount( *pcInstanceInfo ) JET_INSTANCE_INFO_W **	paInstanceInfo,
	__in const JET_GRBIT											grbit );
#ifdef JET_UNICODE
#define JetOSSnapshotGetFreezeInfo JetOSSnapshotGetFreezeInfoW
#else
#define JetOSSnapshotGetFreezeInfo JetOSSnapshotGetFreezeInfoA
#endif
#endif

JET_ERR JET_API
JetOSSnapshotEnd(
	__in const JET_OSSNAPID	snapId,
	__in const JET_GRBIT	grbit );

#endif // JET_VERSION >= 0x0600



#if ( JET_VERSION >= 0x0601 )

//  Options for JetConfigureProcessForCrashDump

#define JET_bitDumpMinimum						0x00000001
//  dump minimum includes cache minimum
#define JET_bitDumpMaximum						0x00000002
//  dump maximum includes dump minimum
//  dump maximum includes cache maximum
#define JET_bitDumpCacheMinimum					0x00000004
//  cache minimum includes pages that are latched
//  cache minimum includes pages that are used for memory
//  cache minimum includes pages that are flagged with errors
#define JET_bitDumpCacheMaximum					0x00000008
//  cache maximum includes cache minimum
//  cache maximum includes the entire cache image
#define JET_bitDumpCacheIncludeDirtyPages		0x00000010
//  dump includes pages that are modified
#define JET_bitDumpCacheIncludeCachedPages		0x00000020
//  dump includes pages that contain valid data
#define JET_bitDumpCacheIncludeCorruptedPages	0x00000040
//  dump includes pages that are corrupted (expensive to compute)


JET_ERR JET_API
JetConfigureProcessForCrashDump(
	__in const JET_GRBIT grbit );

#endif // JET_VERSION >= 0x0601

#if ( JET_VERSION >= 0x0601 )


#endif // JET_VERSION >= 0x0601


#ifdef	__cplusplus
}
#endif

#endif	/* _JET_NOPROTOTYPES */

#include <poppack.h>

#ifdef	__cplusplus
}
#endif

#endif	/* _JET_INCLUDED */


