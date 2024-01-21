/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Abstract:

    @doc
    @module Writer.h | Declaration of Writer
    @end
--*/

#ifndef __CVSS_WRITER_H_
#define __CVSS_WRITER_H_

#include "vsserror.h"

const IID IID_IVssComponent =                   // d2c72c96-c121-4518-b627-e5a93d010ead
{
    0xd2c72c96,
    0xc121,
    0x4518,
    { 0xb6, 0x27, 0xe5, 0xa9, 0x3d, 0x01, 0x0e, 0xad }
};

const IID IID_IVssComponentEx =                 // 156c8b5e-f131-4bd7-9c97-d1923be7e1fa
{
    0x156c8b5e,
    0xf131,
    0x4bd7,
    { 0x9c, 0x97, 0xd1, 0x92, 0x3b, 0xe7, 0xe1, 0xfa }
};

const IID IID_IVssComponentEx2 =                // 3b5be0f2-07a9-4e4b-bdd3-cfdc8e2c0d2d
{
    0x3b5be0f2,
    0x07a9,
    0x4e4b,
    { 0xbd, 0xd3, 0xcf, 0xdc, 0x8e, 0x2c, 0x0d, 0x2d }
};

const IID IID_IVssCreateWriterMetadataEx =      // 9f21981d-d469-4349-b807-39e64e4674e1
{
    0x9f21981d,
    0xd469,
    0x4349,
    { 0xb8, 0x07, 0x39, 0xe6, 0x4e, 0x46, 0x74, 0xe1 }
};


const IID IID_IVssCreateExpressWriterMetadata = // 9c772e77-b26e-427f-92dd-c996f41ea5e3
{
    0x9c772e77,
    0xb26e,
    0x427f,
    { 0x92, 0xdd, 0xc9, 0x96, 0xf4, 0x1e, 0xa5, 0xe3 }
};

const IID IID_IVssExpressWriter =               // e33affdc-59c7-47b1-97d5-4266598f6235
{
    0xe33affdc,
    0x59c7,
    0x47b1,
    {0x97, 0xd5, 0x42, 0x66, 0x59, 0x8f, 0x62, 0x35}
};

// declaration of how application data is used
typedef enum VSS_USAGE_TYPE
{
    VSS_UT_UNDEFINED = 0,
    VSS_UT_BOOTABLESYSTEMSTATE,     // formerly "system state"
    VSS_UT_SYSTEMSERVICE,           // system service
    VSS_UT_USERDATA,                // user data
    VSS_UT_OTHER                    // unclassified
};

typedef enum VSS_SOURCE_TYPE
{
    VSS_ST_UNDEFINED = 0,
    VSS_ST_TRANSACTEDDB,            // transacted db (e.g., SQL Server, JET Blue)
    VSS_ST_NONTRANSACTEDDB,         // not transacted(e.g., Jet Red)
    VSS_ST_OTHER                    // unclassified
};

typedef enum VSS_RESTOREMETHOD_ENUM
{
    VSS_RME_UNDEFINED = 0,
    VSS_RME_RESTORE_IF_NOT_THERE,
    VSS_RME_RESTORE_IF_CAN_REPLACE,
    VSS_RME_STOP_RESTORE_START,
    VSS_RME_RESTORE_TO_ALTERNATE_LOCATION,
    VSS_RME_RESTORE_AT_REBOOT,
    VSS_RME_RESTORE_AT_REBOOT_IF_CANNOT_REPLACE,
    VSS_RME_CUSTOM,
    VSS_RME_RESTORE_STOP_START
};

typedef enum VSS_WRITERRESTORE_ENUM
{
    VSS_WRE_UNDEFINED = 0,
    VSS_WRE_NEVER,
    VSS_WRE_IF_REPLACE_FAILS,
    VSS_WRE_ALWAYS
};

typedef enum VSS_COMPONENT_TYPE
{
    VSS_CT_UNDEFINED = 0,
    VSS_CT_DATABASE,
    VSS_CT_FILEGROUP
};

typedef enum VSS_ALTERNATE_WRITER_STATE
{
    VSS_AWS_UNDEFINED = 0,
    VSS_AWS_NO_ALTERNATE_WRITER,
    VSS_AWS_ALTERNATE_WRITER_EXISTS,
    VSS_AWS_THIS_IS_ALTERNATE_WRITER
};

// Flags to specify which types of events to receive.  Used in Subscribe.
typedef enum VSS_SUBSCRIBE_MASK
{
    VSS_SM_POST_SNAPSHOT_FLAG   = 0x00000001,
    VSS_SM_BACKUP_EVENTS_FLAG   = 0x00000002,
    VSS_SM_RESTORE_EVENTS_FLAG  = 0x00000004,
    VSS_SM_IO_THROTTLING_FLAG   = 0x00000008,
    VSS_SM_ALL_FLAGS            = 0xffffffff
};

// enumeration of restore targets
typedef enum VSS_RESTORE_TARGET
{
    VSS_RT_UNDEFINED = 0,
    VSS_RT_ORIGINAL,
    VSS_RT_ALTERNATE,
    VSS_RT_DIRECTED,
    VSS_RT_ORIGINAL_LOCATION
};

// enumeration of file restore status codes
typedef enum VSS_FILE_RESTORE_STATUS
{
    VSS_RS_UNDEFINED = 0,
    VSS_RS_NONE,
    VSS_RS_ALL,
    VSS_RS_FAILED
};

typedef enum VSS_COMPONENT_FLAGS
{
    VSS_CF_BACKUP_RECOVERY          = 0x00000001,
    VSS_CF_APP_ROLLBACK_RECOVERY    = 0x00000002,
    VSS_CF_NOT_SYSTEM_STATE         = 0x00000004
};

class IVssExamineWriterMetadata;

// file description
class IVssWMFiledesc
    : public IUnknown
{
public:
    // get path to toplevel directory
    STDMETHOD(GetPath)(
        __out   BSTR *pbstrPath
        ) = 0;

    // get filespec (may include wildcards)
    STDMETHOD(GetFilespec)(
        __out   BSTR *pbstrFilespec
        ) = 0;

    // is path a directory or root of a tree
    STDMETHOD(GetRecursive)(
        __out   bool *pbRecursive
        ) = 0;

    // alternate location for files
    STDMETHOD(GetAlternateLocation)(
        __out   BSTR *pbstrAlternateLocation
        ) = 0;

    // backup type
    STDMETHOD(GetBackupTypeMask)(
        __out   DWORD *pdwTypeMask
        ) = 0;
};


// dependency description
class IVssWMDependency
    : public IUnknown
{
public:
    STDMETHOD(GetWriterId)(OUT VSS_ID *pWriterId) = 0;
    STDMETHOD(GetLogicalPath)(OUT BSTR *pbstrLogicalPath) = 0;
    STDMETHOD(GetComponentName)(OUT BSTR *pbstrComponentName) = 0;
};

// backup components interface
class __declspec(uuid("d2c72c96-c121-4518-b627-e5a93d010ead")) IVssComponent
    : public IUnknown
{
public:
    // obtain logical path of component
    STDMETHOD(GetLogicalPath)(OUT BSTR *pbstrPath) = 0;

    // obtain component type(VSS_CT_DATABASE or VSS_CT_FILEGROUP)
    STDMETHOD(GetComponentType)(VSS_COMPONENT_TYPE *pct) = 0;

    // get component name
    STDMETHOD(GetComponentName)(OUT BSTR *pbstrName) = 0;

    // determine whether the component was successfully backed up.
    STDMETHOD(GetBackupSucceeded)(OUT bool *pbSucceeded) = 0;

    // get altermative location mapping count
    STDMETHOD(GetAlternateLocationMappingCount)
        (
        OUT UINT *pcMappings
        ) = 0;

    // get a paraticular alternative location mapping
    STDMETHOD(GetAlternateLocationMapping)
        (
        IN UINT iMapping,
        OUT IVssWMFiledesc **ppFiledesc
        ) = 0;

    // set the backup metadata for a component
    STDMETHOD(SetBackupMetadata)
        (
        IN LPCWSTR wszData
        ) = 0;

    // get the backup metadata for a component
    STDMETHOD(GetBackupMetadata)
        (
        OUT BSTR *pbstrData
        ) = 0;

    // indicate that only ranges in the file are to be backed up
    STDMETHOD(AddPartialFile)
        (
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilename,
        IN LPCWSTR wszRanges,
        IN LPCWSTR wszMetadata
        ) = 0;

    // get count of partial file declarations
    STDMETHOD(GetPartialFileCount)
        (
        OUT UINT *pcPartialFiles
        ) = 0;

    // get a partial file declaration
    STDMETHOD(GetPartialFile)
        (
        IN UINT iPartialFile,
        OUT BSTR *pbstrPath,
        OUT BSTR *pbstrFilename,
        OUT BSTR *pbstrRange,
        OUT BSTR *pbstrMetadata
        ) = 0;

    // determine if the component is selected to be restored
    STDMETHOD(IsSelectedForRestore)
        (
        OUT bool *pbSelectedForRestore
        ) = 0;

    STDMETHOD(GetAdditionalRestores)
        (
        OUT bool *pbAdditionalRestores
        ) = 0;

    // get count of new target specifications
    STDMETHOD(GetNewTargetCount)
        (
        OUT UINT *pcNewTarget
        ) = 0;

    STDMETHOD(GetNewTarget)
        (
        IN UINT iNewTarget,
        OUT IVssWMFiledesc **ppFiledesc
        ) = 0;

    // add a directed target specification
    STDMETHOD(AddDirectedTarget)
        (
        IN LPCWSTR wszSourcePath,
        IN LPCWSTR wszSourceFilename,
        IN LPCWSTR wszSourceRangeList,
        IN LPCWSTR wszDestinationPath,
        IN LPCWSTR wszDestinationFilename,
        IN LPCWSTR wszDestinationRangeList
        ) = 0;

    // get count of directed target specifications
    STDMETHOD(GetDirectedTargetCount)
        (
        OUT UINT *pcDirectedTarget
        ) = 0;

    // obtain a particular directed target specification
    STDMETHOD(GetDirectedTarget)
        (
        IN UINT iDirectedTarget,
        OUT BSTR *pbstrSourcePath,
        OUT BSTR *pbstrSourceFileName,
        OUT BSTR *pbstrSourceRangeList,
        OUT BSTR *pbstrDestinationPath,
        OUT BSTR *pbstrDestinationFilename,
        OUT BSTR *pbstrDestinationRangeList
        ) = 0;

    // set restore metadata associated with the component
    STDMETHOD(SetRestoreMetadata)
        (
        IN LPCWSTR wszRestoreMetadata
        ) = 0;

    // obtain restore metadata associated with the component
    STDMETHOD(GetRestoreMetadata)
        (
        OUT BSTR *pbstrRestoreMetadata
        ) = 0;

     // set the restore target
     STDMETHOD(SetRestoreTarget)
           (
        IN VSS_RESTORE_TARGET target
        ) = 0;

    // obtain the restore target
    STDMETHOD(GetRestoreTarget)
        (
        OUT VSS_RESTORE_TARGET *pTarget
        ) = 0;

    // set failure message during pre restore event
    STDMETHOD(SetPreRestoreFailureMsg)
        (
        IN LPCWSTR wszPreRestoreFailureMsg
        ) = 0;

    // obtain failure message during pre restore event
    STDMETHOD(GetPreRestoreFailureMsg)
        (
        OUT BSTR *pbstrPreRestoreFailureMsg
        ) = 0;

    // set the failure message during the post restore event
    STDMETHOD(SetPostRestoreFailureMsg)
        (
        IN LPCWSTR wszPostRestoreFailureMsg
        ) = 0;

    // obtain the failure message set during the post restore event
    STDMETHOD(GetPostRestoreFailureMsg)
        (
        OUT BSTR *pbstrPostRestoreFailureMsg
        ) = 0;

    // set the backup stamp of the backup
    STDMETHOD(SetBackupStamp)
        (
        IN LPCWSTR wszBackupStamp
        ) = 0;

    // obtain the stamp of the backup
    STDMETHOD(GetBackupStamp)
        (
        OUT BSTR *pbstrBackupStamp
        ) = 0;


    // obtain the backup stamp that the differential or incremental
    // backup is baed on
    STDMETHOD(GetPreviousBackupStamp)
        (
        OUT BSTR *pbstrBackupStamp
        ) = 0;

    // obtain backup options for the writer
    STDMETHOD(GetBackupOptions)
        (
        OUT BSTR *pbstrBackupOptions
        ) = 0;

    // obtain the restore options
    STDMETHOD(GetRestoreOptions)
        (
        OUT BSTR *pbstrRestoreOptions
        ) = 0;

    // obtain count of subcomponents to be restored
    STDMETHOD(GetRestoreSubcomponentCount)
        (
        OUT UINT *pcRestoreSubcomponent
        ) = 0;

    // obtain a particular subcomponent to be restored
    STDMETHOD(GetRestoreSubcomponent)
        (
        UINT iComponent,
        OUT BSTR *pbstrLogicalPath,
        OUT BSTR *pbstrComponentName,
        OUT bool *pbRepair
        ) = 0;


    // obtain whether files were successfully restored
    STDMETHOD(GetFileRestoreStatus)
        (
        OUT VSS_FILE_RESTORE_STATUS *pStatus
        ) = 0;

    // add differenced files by last modify time
    STDMETHOD(AddDifferencedFilesByLastModifyTime)
        (
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN BOOL bRecursive,
        IN FILETIME ftLastModifyTime
        ) = 0;

    STDMETHOD(AddDifferencedFilesByLastModifyLSN)
        (
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN BOOL bRecursive,
        IN BSTR bstrLsnString
        ) = 0;

    STDMETHOD(GetDifferencedFilesCount)
        (
        OUT UINT *pcDifferencedFiles
        ) = 0;

    STDMETHOD(GetDifferencedFile)
        (
        IN UINT iDifferencedFile,
        OUT BSTR *pbstrPath,
        OUT BSTR *pbstrFilespec,
        OUT BOOL *pbRecursive,
        OUT BSTR *pbstrLsnString,
        OUT FILETIME *pftLastModifyTime
        ) = 0;
};


// backup writer components interface (i.e., all components for an
// individual writer
class IVssWriterComponents
{
public:
    // get count of components
    STDMETHOD(GetComponentCount)(OUT UINT *pcComponents) = 0;

    // get information about the writer
    STDMETHOD(GetWriterInfo)
        (
        OUT VSS_ID *pidInstance,
        OUT VSS_ID *pidWriter
        ) = 0;

    // obtain a specific component
    STDMETHOD(GetComponent)
        (
        IN UINT iComponent,
        OUT IVssComponent **ppComponent
        ) = 0;
};


class __declspec(uuid("156c8b5e-f131-4bd7-9c97-d1923be7e1fa")) IVssComponentEx
    : public IVssComponent
{
public:
    // set a failure message during prepareforbackup
    STDMETHOD(SetPrepareForBackupFailureMsg)
        (
        __in LPCWSTR wszFailureMsg
        ) = 0;

    // set a failure message during postsnapshot
    STDMETHOD(SetPostSnapshotFailureMsg)
        (
        __in LPCWSTR wszFailureMsg
        ) = 0;

    // get the failure message set during prepareforbackup
    STDMETHOD(GetPrepareForBackupFailureMsg)
        (
        __deref_out_opt BSTR* pbstrFailureMsg
        ) = 0;

    // get the failure message set during postsnapshot
    STDMETHOD(GetPostSnapshotFailureMsg)
        (
        __deref_out_opt BSTR* pbstrFailureMsg
        ) = 0;


    // get the authoritative restore status
    STDMETHOD(GetAuthoritativeRestore)
        (
        __out bool* pbAuth
        ) = 0;

    // get the roll-forward status
    STDMETHOD(GetRollForward)
        (
        __out VSS_ROLLFORWARD_TYPE* pRollType,
        __deref_out_opt BSTR* pbstrPoint
        ) = 0;

    // get the restore name
    STDMETHOD(GetRestoreName)
        (
        __deref_out_opt BSTR* pbstrName
        ) = 0;
};


class __declspec(uuid("3b5be0f2-07a9-4e4b-bdd3-cfdc8e2c0d2d")) IVssComponentEx2
    : public IVssComponentEx
{
public:
    STDMETHOD(SetFailure)
        (
        __in        HRESULT hr,
        __in        HRESULT hrApplication,
        __in_opt    LPCWSTR wszApplicationMessage,
        __in        DWORD   dwReserved
        ) = 0;

    STDMETHOD(GetFailure)
        (
        __out       HRESULT *phr,
        __out       HRESULT *phrApplication,
        __out       BSTR    *pbstrApplicationMessage,
        __out       DWORD   *pdwReserved
        ) = 0;
};


// create backup metadata interface
class IVssCreateWriterMetadata
{
public:
    // add files to include to metadata document
    STDMETHOD(AddIncludeFiles)
        (
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN bool bRecursive,
        IN LPCWSTR wszAlternateLocation
        ) = 0;

    // add files to exclude to metadata document
    STDMETHOD(AddExcludeFiles)
        (
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN bool bRecursive
        ) = 0;

    // add component to metadata document
    STDMETHOD(AddComponent)
        (
        IN VSS_COMPONENT_TYPE ct,
        IN LPCWSTR wszLogicalPath,
        IN LPCWSTR wszComponentName,
        IN LPCWSTR wszCaption,
        IN const BYTE *pbIcon,
        IN UINT cbIcon,
        IN bool bRestoreMetadata,
        IN bool bNotifyOnBackupComplete,
        IN bool bSelectable,
        IN bool bSelectableForRestore = false,
        IN DWORD dwComponentFlags = 0
        ) = 0;

    // add physical database files to a database component
    STDMETHOD(AddDatabaseFiles)
        (
        IN LPCWSTR wszLogicalPath,
        IN LPCWSTR wszDatabaseName,
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN DWORD dwBackupTypeMask = (VSS_FSBT_ALL_BACKUP_REQUIRED |
                                     VSS_FSBT_ALL_SNAPSHOT_REQUIRED)
        ) = 0;

    // add log files to a database component
    STDMETHOD(AddDatabaseLogFiles)
        (
        IN LPCWSTR wszLogicalPath,
        IN LPCWSTR wszDatabaseName,
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN DWORD dwBackupTypeMask = (VSS_FSBT_ALL_BACKUP_REQUIRED |
                                     VSS_FSBT_ALL_SNAPSHOT_REQUIRED)
        ) = 0;


    // add files to a FILE_GROUP component
    STDMETHOD(AddFilesToFileGroup)
        (
        IN LPCWSTR wszLogicalPath,
        IN LPCWSTR wszGroupName,
        IN LPCWSTR wszPath,
        IN LPCWSTR wszFilespec,
        IN bool bRecursive,
        IN LPCWSTR wszAlternateLocation,
        IN DWORD dwBackupTypeMask = (VSS_FSBT_ALL_BACKUP_REQUIRED |
                                     VSS_FSBT_ALL_SNAPSHOT_REQUIRED)
        ) = 0;

    // create a restore method
    STDMETHOD(SetRestoreMethod)
        (
        IN VSS_RESTOREMETHOD_ENUM method,
        IN LPCWSTR wszService,
        IN LPCWSTR wszUserProcedure,
        IN VSS_WRITERRESTORE_ENUM writerRestore,
        IN bool bRebootRequired
        ) = 0;

    // add alternative location mappings to the restore method
    STDMETHOD(AddAlternateLocationMapping)
        (
        IN LPCWSTR wszSourcePath,
        IN LPCWSTR wszSourceFilespec,
        IN bool bRecursive,
        IN LPCWSTR wszDestination
        ) = 0;

    // add a dependency to another writer's component
    STDMETHOD(AddComponentDependency)
                (
                IN LPCWSTR wszForLogicalPath,
                IN LPCWSTR wszForComponentName,
                IN VSS_ID onWriterId,
                IN LPCWSTR wszOnLogicalPath,
                IN LPCWSTR wszOnComponentName
                ) = 0;

    // Set the schema used during backup
    STDMETHOD(SetBackupSchema)
                (
                IN DWORD dwSchemaMask
                ) = 0;

    // obtain reference to actual XML document
    STDMETHOD(GetDocument)(IXMLDOMDocument **pDoc) = 0;

    // save document as an XML string
    STDMETHOD(SaveAsXML)(BSTR *pbstrXML) = 0;
};

class __declspec(uuid("9f21981d-d469-4349-b807-39e64e4674e1")) IVssCreateWriterMetadataEx : public IVssCreateWriterMetadata, public IUnknown
{
public:
    // add files to exclude to metadata document
    STDMETHOD(AddExcludeFilesFromSnapshot)
        (
        __in LPCWSTR wszPath,
        __in LPCWSTR wszFilespec,
        __in bool bRecursive
        ) = 0;
};


// implementation class for writers
class IVssWriterImpl : public IUnknown
{
public:
    // initialize writer
    virtual HRESULT Initialize(
        __in    VSS_ID                      writerId,
        __in    LPCWSTR                     wszWriterName,
        __in    LPCWSTR                     wszWriterInstanceName,
        __in    DWORD                       dwMajorVersion,
        __in    DWORD                       dwMinorVersion,
        __in    VSS_USAGE_TYPE              ut,
        __in    VSS_SOURCE_TYPE             st,
        __in    VSS_APPLICATION_LEVEL       nLevel,
        __in    DWORD                       dwTimeout,
        __in    VSS_ALTERNATE_WRITER_STATE  aws,
        __in    bool                        bIOThrottlingOnly
        ) = 0;

    // subscribe to events
    virtual HRESULT Subscribe(
        __in    DWORD   dwSubscribeTimeout,
        __in    DWORD   dwEventFlags
        ) = 0;

    // unsubscribe from events
    virtual HRESULT Unsubscribe() = 0;

    virtual void Uninitialize() = 0;

    // get array of volume names
    virtual LPCWSTR *GetCurrentVolumeArray() const = 0;

    // get # of volumes in volume array
    virtual UINT GetCurrentVolumeCount() const = 0;

    // get the snapshot device name for a particular volume
    virtual HRESULT GetSnapshotDeviceName(
        __in            LPCWSTR wszOriginalVolume,
        __deref_out_opt LPCWSTR *ppwszSnapshotDevice
        ) const = 0;

    // get id of snapshot set
    virtual VSS_ID GetCurrentSnapshotSetId() const = 0;

    // get the current backup context
    virtual LONG GetContext() const = 0;

    // determine which Freeze event writer responds to
    virtual VSS_APPLICATION_LEVEL GetCurrentLevel() const = 0;

    // determine if path is included in the snapshot
    virtual bool IsPathAffected(__in LPCWSTR wszPath) const = 0;

    // determine if bootable state is backed up
    virtual bool IsBootableSystemStateBackedUp() const = 0;

    // determine if the backup application is selecting components
    virtual bool AreComponentsSelected() const = 0;

    // determine the backup type for the backup
    virtual VSS_BACKUP_TYPE GetBackupType() const = 0;

    // determine the type of restore
    virtual VSS_RESTORE_TYPE GetRestoreType() const = 0;

    // let writer pass back indication of reason for failure
    virtual HRESULT SetWriterFailure(
        __in    HRESULT hr
        ) = 0;

    // determine if requestor support partial file backups
    virtual bool IsPartialFileSupportEnabled() const = 0;

    virtual HRESULT InstallAlternateWriter(
        __in    VSS_ID  idWriter,
        __in    CLSID   clsid
        ) = 0;

    // determine the current identity information
    virtual IVssExamineWriterMetadata* GetIdentityInformation() const = 0;

    // let writer pass back indication of reason for failure
    virtual HRESULT SetWriterFailureEx(
        __in    HRESULT hr,
        __in    HRESULT hrApplication,
        __in    LPCWSTR wszApplicationMessage
        ) = 0;

    virtual HRESULT GetSessionId(
        __out   VSS_ID  *idSession
        ) = 0;

    virtual bool IsWriterShuttingDown(
        ) = 0;
};


class __declspec(uuid("9c772e77-b26e-427f-92dd-c996f41ea5e3")) IVssCreateExpressWriterMetadata
    : public IUnknown
{
public:
    // add files to exclude to metadata document
    STDMETHOD(AddExcludeFiles)(
        __in    LPCWSTR wszPath,
        __in    LPCWSTR wszFilespec,
        __in    bool bRecursive
        ) = 0;

    // add component to metadata document
    STDMETHOD(AddComponent)(
        __in    VSS_COMPONENT_TYPE ct,
        __in    LPCWSTR wszLogicalPath,
        __in    LPCWSTR wszComponentName,
        __in    LPCWSTR wszCaption,
        __in    const BYTE *pbIcon,
        __in    UINT cbIcon,
        __in    bool bRestoreMetadata,
        __in    bool bNotifyOnBackupComplete,
        __in    bool bSelectable,
        __in    bool bSelectableForRestore = false,
        __in    DWORD dwComponentFlags = 0
        ) = 0;

    // add files to a FILE_GROUP component
    STDMETHOD(AddFilesToFileGroup)(
        __in    LPCWSTR wszLogicalPath,
        __in    LPCWSTR wszGroupName,
        __in    LPCWSTR wszPath,
        __in    LPCWSTR wszFilespec,
        __in    bool bRecursive,
        __in    LPCWSTR wszAlternateLocation,
        __in    DWORD dwBackupTypeMask = (VSS_FSBT_ALL_BACKUP_REQUIRED | VSS_FSBT_ALL_SNAPSHOT_REQUIRED)
        ) = 0;

    // create a restore method
    STDMETHOD(SetRestoreMethod)(
        __in    VSS_RESTOREMETHOD_ENUM method,
        __in    LPCWSTR wszService,
        __in    LPCWSTR wszUserProcedure,
        __in    VSS_WRITERRESTORE_ENUM writerRestore,
        __in    bool bRebootRequired
        ) = 0;

    // add a dependency to another writer's component
    STDMETHOD(AddComponentDependency)(
        __in    LPCWSTR wszForLogicalPath,
        __in    LPCWSTR wszForComponentName,
        __in    VSS_ID onWriterId,
        __in    LPCWSTR wszOnLogicalPath,
        __in    LPCWSTR wszOnComponentName
        ) = 0;

    // Set the schema used during backup
    STDMETHOD(SetBackupSchema)(
        __in    DWORD dwSchemaMask
        ) = 0;

    // save document as an XML string
    STDMETHOD(SaveAsXML)(
        __out   BSTR *pbstrXML
        ) = 0;
};


class __declspec(uuid("e33affdc-59c7-47b1-97d5-4266598f6235")) IVssExpressWriter
    : public IUnknown
{
public:
    STDMETHOD(CreateMetadata)(
        __in    VSS_ID                          writerId,
        __in    LPCWSTR                         writerName,
        __in    VSS_USAGE_TYPE                  usageType,
        __in    DWORD                           versionMajor,
        __in    DWORD                           versionMinor,
        __in    DWORD                           reserved,
        __out   IVssCreateExpressWriterMetadata **ppMetadata
        ) = 0;

    STDMETHOD(LoadMetadata)(
        __in    LPCWSTR metadata,
        __in    DWORD   reserved
        ) = 0;

    STDMETHOD(Register)() = 0;

    STDMETHOD(Unregister)(
        __in    VSS_ID  writerId
        ) = 0;
};


class CVssWriter;


/////////////////////////////////////////////////////////////////////////////
// CVssWriter

extern "C"  {
    HRESULT STDAPICALLTYPE CreateWriter(__in CVssWriter* pWriter, __out IVssWriterImpl** pWriterImpl);
}


class CVssWriter
{
// Constants
public:

// Constructors & Destructors
public:
    STDMETHODCALLTYPE CVssWriter()
        : m_pWriterImpl(NULL)
    {
    }

    virtual STDMETHODCALLTYPE ~CVssWriter()
    {
        if (m_pWriterImpl != NULL)
        {
            m_pWriterImpl->Uninitialize();
            m_pWriterImpl->Release();
            m_pWriterImpl = NULL;
        }
    }

// Exposed operations
public:
    // initialize the writer object
    HRESULT STDMETHODCALLTYPE Initialize(
        __in VSS_ID WriterId,
        __in LPCWSTR wszWriterName,
        __in VSS_USAGE_TYPE ut,
        __in VSS_SOURCE_TYPE st,
        __in VSS_APPLICATION_LEVEL nLevel = VSS_APP_FRONT_END,
        __in DWORD dwTimeoutFreeze = 60000,         // Maximum milliseconds between Freeze/Thaw
        __in VSS_ALTERNATE_WRITER_STATE aws = VSS_AWS_NO_ALTERNATE_WRITER,
        __in bool bIOThrottlingOnly = false,
        __in LPCWSTR wszWriterInstanceName = NULL
        )
    {
        if (m_pWriterImpl != NULL)
            return E_FAIL;

        HRESULT hr = CreateWriter(this, &m_pWriterImpl);
        if (FAILED(hr))
            return hr;

        hr = m_pWriterImpl->Initialize(WriterId, wszWriterName, wszWriterInstanceName, 0, 0, ut, st, nLevel, dwTimeoutFreeze, aws, bIOThrottlingOnly);
        if (FAILED(hr))
        {
            m_pWriterImpl->Release();
            m_pWriterImpl = NULL;
        }

        return hr;
    }

    // cause the writer to subscribe to events.
    HRESULT STDMETHODCALLTYPE Subscribe
        (
        __in DWORD dwEventFlags = VSS_SM_BACKUP_EVENTS_FLAG | VSS_SM_RESTORE_EVENTS_FLAG
        )
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->Subscribe(0, dwEventFlags);
    }

    // cause the writer to unsubscribe from events
    HRESULT STDMETHODCALLTYPE Unsubscribe()
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        m_pWriterImpl->Unsubscribe();


        return S_OK;
    }

    // installs an alternative writer
    HRESULT STDMETHODCALLTYPE InstallAlternateWriter
        (
        __in VSS_ID writerId,
        __in CLSID persistentWriterClassId
        )
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->InstallAlternateWriter(writerId, persistentWriterClassId);
    }

    // Internal properties - accessible from OnXXX methods
protected:

    // get array of volume names
    LPCWSTR* STDMETHODCALLTYPE GetCurrentVolumeArray() const
    {
        if (m_pWriterImpl == NULL)
            return NULL;

        return m_pWriterImpl->GetCurrentVolumeArray();
    }

    // get count of volume names in array
    UINT STDMETHODCALLTYPE GetCurrentVolumeCount() const
    {
        if (m_pWriterImpl == NULL)
            return 0;

        return m_pWriterImpl->GetCurrentVolumeCount();
    }

    // get the name of the snapshot device corresponding to a given volume.
    HRESULT STDMETHODCALLTYPE GetSnapshotDeviceName
    (
        __in LPCWSTR wszOriginalVolume,
        __deref_out_opt LPCWSTR* ppwszSnapshotDevice
    ) const
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->GetSnapshotDeviceName(wszOriginalVolume, ppwszSnapshotDevice);
    }

    // current snapshot set GUID
    VSS_ID STDMETHODCALLTYPE GetCurrentSnapshotSetId() const
    {
        if (m_pWriterImpl == NULL)
            return GUID_NULL;

        return m_pWriterImpl->GetCurrentSnapshotSetId();
    }

    // Current backup context.
    LONG STDMETHODCALLTYPE GetContext() const
    {
        if (m_pWriterImpl == NULL)
            return 0;

        return m_pWriterImpl->GetContext();
    }

    // current app level (either 1,2,3)
    VSS_APPLICATION_LEVEL STDMETHODCALLTYPE GetCurrentLevel() const
    {
        if (m_pWriterImpl == NULL)
            return VSS_APP_AUTO;

        return m_pWriterImpl->GetCurrentLevel();
    }

    // determine if path is in set of volumes being snapshotted
    bool STDMETHODCALLTYPE IsPathAffected
        (
        __in LPCWSTR wszPath
        ) const
        {
        if (m_pWriterImpl == NULL)
            return false;

        return m_pWriterImpl->IsPathAffected(wszPath);
        }

    // does the backup include bootable state (formerly system state backup)
    bool STDMETHODCALLTYPE IsBootableSystemStateBackedUp() const
    {
        if (m_pWriterImpl == NULL)
            return false;

        return m_pWriterImpl->IsBootableSystemStateBackedUp();
    }

    // is the backup application smart (i.e., selecting components) or
    // dump (i.e., just selecting volumes)
    bool STDMETHODCALLTYPE AreComponentsSelected() const
    {
        if (m_pWriterImpl == NULL)
            return false;

        return m_pWriterImpl->AreComponentsSelected();
    }

    VSS_BACKUP_TYPE STDMETHODCALLTYPE GetBackupType() const
    {
        if (m_pWriterImpl == NULL)
            return VSS_BT_UNDEFINED;

        return m_pWriterImpl->GetBackupType();
    }

    VSS_RESTORE_TYPE STDMETHODCALLTYPE GetRestoreType() const
    {
        if (m_pWriterImpl == NULL)
            return VSS_RTYPE_UNDEFINED;

        return m_pWriterImpl->GetRestoreType();
    }

    bool STDMETHODCALLTYPE IsPartialFileSupportEnabled() const
    {
        if (m_pWriterImpl == NULL)
            return false;

        return m_pWriterImpl->IsPartialFileSupportEnabled();
    }

    HRESULT STDMETHODCALLTYPE SetWriterFailure(HRESULT hr)
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->SetWriterFailure(hr);
    }

// Ovverides
public:
    // callback when request for metadata comes in
    virtual bool STDMETHODCALLTYPE OnIdentify(IN IVssCreateWriterMetadata *pMetadata)
    {
        UNREFERENCED_PARAMETER(pMetadata);
        return true;
    }

    // callback for prepare backup event
    virtual bool STDMETHODCALLTYPE OnPrepareBackup(
        __in IVssWriterComponents *pComponent
        )
    {
        UNREFERENCED_PARAMETER(pComponent);
        return true;
    }

    // callback for prepare snapsot event
    virtual bool STDMETHODCALLTYPE OnPrepareSnapshot() = 0;

    // callback for freeze event
    virtual bool STDMETHODCALLTYPE OnFreeze() = 0;

    // callback for thaw event
    virtual bool STDMETHODCALLTYPE OnThaw() = 0;

    // callback if current sequence is aborted
    virtual bool STDMETHODCALLTYPE OnAbort() = 0;

    // callback on backup complete event
    virtual bool STDMETHODCALLTYPE OnBackupComplete
        (
        __in IVssWriterComponents *pComponent
        )
    {
        UNREFERENCED_PARAMETER(pComponent);
        return true;
    }

    // callback indicating that the backup process has either completed or has shut down
    virtual bool STDMETHODCALLTYPE OnBackupShutdown
        (
        __in VSS_ID SnapshotSetId
        )
    {
        UNREFERENCED_PARAMETER(SnapshotSetId);
        return true;
    }

    // callback on pre-restore event
    virtual bool STDMETHODCALLTYPE OnPreRestore
        (
        __in IVssWriterComponents *pComponent
        )
    {
        UNREFERENCED_PARAMETER(pComponent);
        return true;
    }

    // callback on post-restore event
    virtual bool STDMETHODCALLTYPE OnPostRestore
        (
        __in IVssWriterComponents *pComponent
        )
    {
        UNREFERENCED_PARAMETER(pComponent);
        return true;
    }

    // callback on post snapshot event
    virtual bool STDMETHODCALLTYPE OnPostSnapshot
        (
        __in IVssWriterComponents *pComponent
        )
    {
        UNREFERENCED_PARAMETER(pComponent);
        return true;
    }

    // callback on back off I/O volume event
    virtual bool STDMETHODCALLTYPE OnBackOffIOOnVolume
        (
        __in VSS_PWSZ wszVolumeName,
        __in VSS_ID snapshotId,
        __in VSS_ID providerId
        )
    {
        UNREFERENCED_PARAMETER(wszVolumeName);
        UNREFERENCED_PARAMETER(snapshotId);
        UNREFERENCED_PARAMETER(providerId);

        return true;
    }

    // callback on Continue I/O on volume event
    virtual bool STDMETHODCALLTYPE OnContinueIOOnVolume
        (
        __in VSS_PWSZ wszVolumeName,
        __in VSS_ID snapshotId,
        __in VSS_ID providerId
        )
    {
        UNREFERENCED_PARAMETER(wszVolumeName);
        UNREFERENCED_PARAMETER(snapshotId);
        UNREFERENCED_PARAMETER(providerId);

        return true;
    }


    // callback to specify that the volume snaphost service is shutting down.  Used
    // by alternative writers to signal when to shutdown.
    virtual bool STDMETHODCALLTYPE OnVSSShutdown()
    {
        return true;
    }


    // callback to an alternative writer when the application writer subscribes.  Used to
    // signal the alternative writer to shutdown.
    virtual bool STDMETHODCALLTYPE OnVSSApplicationStartup()
    {
        return true;
    }


protected:

    IVssWriterImpl *m_pWriterImpl;
};


class CVssWriterEx;
extern "C"  {
    HRESULT STDMETHODCALLTYPE CreateWriterEx(
        __in    CVssWriterEx    *pWriter,
        __out   IVssWriterImpl  **pWriterImpl
        );
}


class CVssWriterEx : public CVssWriter
{
public:
  HRESULT STDMETHODCALLTYPE Initialize
        (
        __in VSS_ID WriterId,
        __in LPCWSTR wszWriterName,
        __in VSS_USAGE_TYPE ut,
        __in VSS_SOURCE_TYPE st,
        __in VSS_APPLICATION_LEVEL nLevel = VSS_APP_FRONT_END,
        __in DWORD dwTimeoutFreeze = 60000,         // Maximum milliseconds between Freeze/Thaw
        __in VSS_ALTERNATE_WRITER_STATE aws = VSS_AWS_NO_ALTERNATE_WRITER,
        __in bool bIOThrottlingOnly = false,
        __in LPCWSTR wszWriterInstanceName = NULL
        )
    {
        if (m_pWriterImpl != NULL)
            return E_FAIL;

        HRESULT hr = CreateWriterEx(this, &m_pWriterImpl);
        if (FAILED(hr))
            return hr;

        hr = m_pWriterImpl->Initialize(WriterId, wszWriterName, wszWriterInstanceName, 0, 0, ut, st, nLevel, dwTimeoutFreeze, aws, bIOThrottlingOnly);
        if (FAILED(hr))
        {
            m_pWriterImpl->Release();
            m_pWriterImpl = NULL;
        }

        return hr;
    }

    HRESULT STDMETHODCALLTYPE InitializeEx
        (
        __in VSS_ID WriterId,
        __in LPCWSTR wszWriterName,
        __in DWORD dwMajorVersion,
        __in DWORD dwMinorVersion,
        __in VSS_USAGE_TYPE ut,
        __in VSS_SOURCE_TYPE st,
        __in VSS_APPLICATION_LEVEL nLevel = VSS_APP_FRONT_END,
        __in DWORD dwTimeoutFreeze = 60000,         // Maximum milliseconds between Freeze/Thaw
        __in VSS_ALTERNATE_WRITER_STATE aws = VSS_AWS_NO_ALTERNATE_WRITER,
        __in bool bIOThrottlingOnly = false,
        __in LPCWSTR wszWriterInstanceName = NULL
        )
    {
        if (m_pWriterImpl != NULL)
            return E_FAIL;

        HRESULT hr = CreateWriterEx(this, &m_pWriterImpl);
        if (FAILED(hr))
            return hr;

        hr = m_pWriterImpl->Initialize(WriterId, wszWriterName, wszWriterInstanceName, dwMajorVersion, dwMinorVersion, ut, st, nLevel, dwTimeoutFreeze, aws, bIOThrottlingOnly);
        if (FAILED(hr))
        {
            m_pWriterImpl->Release();
            m_pWriterImpl = NULL;
        }

        return hr;
    }

    virtual bool STDMETHODCALLTYPE OnIdentify(IN IVssCreateWriterMetadata *pMetadata)
    {
        UNREFERENCED_PARAMETER(pMetadata);
        return false;
    }

    virtual bool STDMETHODCALLTYPE OnIdentifyEx(__in IVssCreateWriterMetadataEx *pMetadata)
    {
        UNREFERENCED_PARAMETER(pMetadata);
        return false;
    }

protected:
    HRESULT GetIdentifyInformation
    (
        __out IVssExamineWriterMetadata** ppMetadata
    )
    {
    UNREFERENCED_PARAMETER(ppMetadata);

    if (m_pWriterImpl == NULL)
        return E_FAIL;

    *ppMetadata = m_pWriterImpl->GetIdentityInformation();

    return S_OK;
    }

    // cause the writer to subscribe to events.
    HRESULT STDMETHODCALLTYPE SubscribeEx
        (
        __in DWORD dwUnsubscribeTimeout,
        __in DWORD dwEventFlags = VSS_SM_BACKUP_EVENTS_FLAG | VSS_SM_RESTORE_EVENTS_FLAG
        )
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->Subscribe(dwUnsubscribeTimeout, dwEventFlags);
    }
};


class CVssWriterEx2 : public CVssWriterEx
{
public:

    HRESULT STDMETHODCALLTYPE SetWriterFailureEx(
        __in HRESULT hrWriter,
        __in HRESULT hrApplication = S_FALSE,
        __in LPCWSTR wszApplicationMessage = NULL
        )
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->SetWriterFailureEx(hrWriter, hrApplication, wszApplicationMessage);
    }

    HRESULT STDMETHODCALLTYPE GetSessionId(
        __out VSS_ID *idSession
        )
    {
        if (m_pWriterImpl == NULL)
            return E_FAIL;

        return m_pWriterImpl->GetSessionId(idSession);
    }

    bool STDMETHODCALLTYPE IsWriterShuttingDown()
    {
        return m_pWriterImpl->IsWriterShuttingDown();
    }
};


extern "C"  {
    HRESULT STDAPICALLTYPE CreateVssExpressWriterInternal
        (
        __out IVssExpressWriter **ppWriter
        );
}


inline HRESULT  CreateVssExpressWriter
    (
    __out IVssExpressWriter **ppWriter
    )
{
    return CreateVssExpressWriterInternal(ppWriter);
}


#endif //__CVSS_WRITER_H_



