/*++

Copyright (c) 1999 - 2008  Microsoft Corporation

Module Name:

    VirtDisk.w - Virtual Disk user mode interface

Abstract:

    This is the header file defining the data structures and user mode interface
    implemented by the virtual disk system.


Environment:

    User mode


--*/


#ifndef VIRT_DISK_API_DEF
#define VIRT_DISK_API_DEF

#if ((WINVER >= _WIN32_WINNT_WIN7) || defined(VIRTDISK_DEFINE_FLAGS))

#pragma warning(push)
#pragma warning(disable : 4200)
#pragma warning(disable : 4201)

#ifdef __cplusplus
extern "C" {
#endif

//
// Identifiers for virtual storage types and providers
//

#ifndef _VIRTUAL_STORAGE_TYPE_DEFINED
#define _VIRTUAL_STORAGE_TYPE_DEFINED
typedef struct _VIRTUAL_STORAGE_TYPE
{
    ULONG DeviceId;
    GUID  VendorId;
} VIRTUAL_STORAGE_TYPE, *PVIRTUAL_STORAGE_TYPE;
#endif

#ifdef DEFINE_GUID
DEFINE_GUID(VIRTUAL_STORAGE_TYPE_VENDOR_UNKNOWN, 0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

// {EC984AEC-A0F9-47e9-901F-71415A66345B}
DEFINE_GUID(VIRTUAL_STORAGE_TYPE_VENDOR_MICROSOFT, 0xec984aec, 0xa0f9, 0x47e9, 0x90, 0x1f, 0x71, 0x41, 0x5a, 0x66, 0x34, 0x5b);
#endif


#define VIRTUAL_STORAGE_TYPE_DEVICE_UNKNOWN     0
#define VIRTUAL_STORAGE_TYPE_DEVICE_ISO         1
#define VIRTUAL_STORAGE_TYPE_DEVICE_VHD         2


#if !defined(VIRTDISK_DEFINE_FLAGS)


//
// CreateVirtualDisk
//

//
// This value causes the implementation defaults to be used for block size:
//
// Fixed VHDs: 0 is the only valid value since block size is N/A.
// Dynamic VHDs: The default block size will be used (2 MB, subject to change).
// Differencing VHDs: 0 causes the parent VHD's block size to be used.
//
#define CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_BLOCK_SIZE 0

// Default sector size is 512B
#define CREATE_VIRTUAL_DISK_PARAMETERS_DEFAULT_SECTOR_SIZE 0x200


// Version definitions
typedef enum _CREATE_VIRTUAL_DISK_VERSION
{
    CREATE_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0,
    CREATE_VIRTUAL_DISK_VERSION_1           = 1,

} CREATE_VIRTUAL_DISK_VERSION;


// Versioned CreateVirtualDisk parameter structure
typedef struct _CREATE_VIRTUAL_DISK_PARAMETERS
{
    CREATE_VIRTUAL_DISK_VERSION Version;

    union
    {
        struct
        {
            GUID                  UniqueId;
            ULONGLONG             MaximumSize;
            ULONG                 BlockSizeInBytes;
            ULONG                 SectorSizeInBytes;
            PCWSTR                ParentPath;
            PCWSTR                SourcePath;
        } Version1;
    };
} CREATE_VIRTUAL_DISK_PARAMETERS, *PCREATE_VIRTUAL_DISK_PARAMETERS;


// Flags for CreateVirtualDisk
typedef enum _CREATE_VIRTUAL_DISK_FLAG
{
    CREATE_VIRTUAL_DISK_FLAG_NONE                     = 0x00000000,

    // Pre-allocate all physical space necessary for the virtual
    // size of the disk (e.g. a fixed VHD).
    CREATE_VIRTUAL_DISK_FLAG_FULL_PHYSICAL_ALLOCATION = 0x00000001,

} CREATE_VIRTUAL_DISK_FLAG;

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(CREATE_VIRTUAL_DISK_FLAG);
#endif


// The default RW Depth parameter value
#define OPEN_VIRTUAL_DISK_RW_DEPTH_DEFAULT 1


// Version definitions
typedef enum _OPEN_VIRTUAL_DISK_VERSION
{
    OPEN_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0,
    OPEN_VIRTUAL_DISK_VERSION_1           = 1,

} OPEN_VIRTUAL_DISK_VERSION;


// Versioned OpenVirtualDisk parameter structure
typedef struct _OPEN_VIRTUAL_DISK_PARAMETERS
{
    OPEN_VIRTUAL_DISK_VERSION Version;

    union
    {
        struct
        {
            ULONG RWDepth;
        } Version1;
    };
} OPEN_VIRTUAL_DISK_PARAMETERS, *POPEN_VIRTUAL_DISK_PARAMETERS;

#endif // VIRTDISK_DEFINE_FLAGS

//
//  Access Mask for OpenVirtualDisk and CreateVirtualDisk.  The virtual
//  disk drivers expose file objects as handles therefore we map
//  it into that AccessMask space.
//

#if defined(__midl)
typedef [v1_enum] enum _VIRTUAL_DISK_ACCESS_MASK {
#else
typedef enum _VIRTUAL_DISK_ACCESS_MASK {
#endif
    VIRTUAL_DISK_ACCESS_ATTACH_RO           = 0x00010000,
    VIRTUAL_DISK_ACCESS_ATTACH_RW           = 0x00020000,
    VIRTUAL_DISK_ACCESS_DETACH              = 0x00040000,
    VIRTUAL_DISK_ACCESS_GET_INFO            = 0x00080000,
    VIRTUAL_DISK_ACCESS_CREATE              = 0x00100000,
    VIRTUAL_DISK_ACCESS_METAOPS             = 0x00200000,
    VIRTUAL_DISK_ACCESS_READ                = 0x000d0000,
    VIRTUAL_DISK_ACCESS_ALL                 = 0x003f0000,

    //
    // A special flag to be used to test if the virtual disk needs to be
    // opened for write.
    //

    VIRTUAL_DISK_ACCESS_WRITABLE            = 0x00320000

} VIRTUAL_DISK_ACCESS_MASK;

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(VIRTUAL_DISK_ACCESS_MASK);
#endif

// Flags for OpenVirtualDisk
typedef enum _OPEN_VIRTUAL_DISK_FLAG
{
    OPEN_VIRTUAL_DISK_FLAG_NONE                = 0x00000000,

    // Open the backing store without opening any differencing chain parents.
    // This allows one to fixup broken parent links.
    OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS          = 0x00000001,

    // The backing store being opened is an empty file. Do not perform virtual
    // disk verification.
    OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE          = 0x00000002,

    // This flag is only specified at boot time to load the system disk
    // during virtual disk boot.  Must be kernel mode to specify this flag.
    OPEN_VIRTUAL_DISK_FLAG_BOOT_DRIVE          = 0x00000004,

} OPEN_VIRTUAL_DISK_FLAG;

#if !defined(VIRTDISK_DEFINE_FLAGS)

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(OPEN_VIRTUAL_DISK_FLAG);
#endif

DWORD
WINAPI
OpenVirtualDisk(
    __in     PVIRTUAL_STORAGE_TYPE         VirtualStorageType,
    __in     PCWSTR                        Path,
    __in     VIRTUAL_DISK_ACCESS_MASK      VirtualDiskAccessMask,
    __in     OPEN_VIRTUAL_DISK_FLAG        Flags,
    __in_opt POPEN_VIRTUAL_DISK_PARAMETERS Parameters,
    __out    PHANDLE                       Handle
    );

DWORD
WINAPI
CreateVirtualDisk(
    __in      PVIRTUAL_STORAGE_TYPE           VirtualStorageType,
    __in      PCWSTR                          Path,
    __in      VIRTUAL_DISK_ACCESS_MASK        VirtualDiskAccessMask,
    __in_opt  PSECURITY_DESCRIPTOR            SecurityDescriptor,
    __in      CREATE_VIRTUAL_DISK_FLAG        Flags,
    __in      ULONG                           ProviderSpecificFlags,
    __in      PCREATE_VIRTUAL_DISK_PARAMETERS Parameters,
    __in_opt  LPOVERLAPPED                    Overlapped,
    __out     PHANDLE                         Handle
    );


//
// AttachVirtualDisk
//

// Version definitions
typedef enum _ATTACH_VIRTUAL_DISK_VERSION
{
    ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED = 0,
    ATTACH_VIRTUAL_DISK_VERSION_1           = 1,

} ATTACH_VIRTUAL_DISK_VERSION;

// Versioned parameter structure for AttachVirtualDisk
typedef struct _ATTACH_VIRTUAL_DISK_PARAMETERS
{
    ATTACH_VIRTUAL_DISK_VERSION Version;

    union
    {
        struct
        {
            ULONG Reserved;
        } Version1;
    };
} ATTACH_VIRTUAL_DISK_PARAMETERS, *PATTACH_VIRTUAL_DISK_PARAMETERS;

#endif // VIRTDISK_DEFINE_FLAGS

// Flags for AttachVirtualDisk
typedef enum _ATTACH_VIRTUAL_DISK_FLAG
{
    ATTACH_VIRTUAL_DISK_FLAG_NONE                = 0x00000000,

    // Attach the disk as read only
    ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY           = 0x00000001,

    // Will cause all volumes on the disk to be mounted
    // without drive letters.
    //
    ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER     = 0x00000002,

    // Will decouple the disk lifetime from that of the VirtualDiskHandle.
    // The disk will be attached until an explicit call is made to
    // DetachVirtualDisk, even if all handles are closed.
    ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME  = 0x00000004,

    // Indicates that the drive will not be attached to
    // the local system (but rather to a VM).
    ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST       = 0x00000008,

} ATTACH_VIRTUAL_DISK_FLAG;

#if !defined(VIRTDISK_DEFINE_FLAGS)

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(ATTACH_VIRTUAL_DISK_FLAG);
#endif

DWORD
WINAPI
AttachVirtualDisk(
    __in     HANDLE                             VirtualDiskHandle,
    __in_opt PSECURITY_DESCRIPTOR               SecurityDescriptor,
    __in     ATTACH_VIRTUAL_DISK_FLAG           Flags,
    __in     ULONG                              ProviderSpecificFlags,
    __in_opt PATTACH_VIRTUAL_DISK_PARAMETERS    Parameters,
    __in_opt LPOVERLAPPED                       Overlapped
    );



//
// DetachVirtualDisk
//

#endif // VIRTDISK_DEFINE_FLAGS

// Flags for DetachVirtualDisk
typedef enum _DETACH_VIRTUAL_DISK_FLAG
{
    DETACH_VIRTUAL_DISK_FLAG_NONE                = 0x00000000,

} DETACH_VIRTUAL_DISK_FLAG;

#if !defined(VIRTDISK_DEFINE_FLAGS)

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(DETACH_VIRTUAL_DISK_FLAG);
#endif

DWORD
WINAPI
DetachVirtualDisk(
    __in     HANDLE                   VirtualDiskHandle,
    __in     DETACH_VIRTUAL_DISK_FLAG Flags,
    __in     ULONG                    ProviderSpecificFlags
    );


//
// GetVirtualDiskPhysicalPath
//

DWORD
WINAPI
GetVirtualDiskPhysicalPath(
    __in                              HANDLE VirtualDiskHandle,
    __inout                           PULONG DiskPathSizeInBytes,
    __out_bcount(DiskPathSizeInBytes) PWSTR  DiskPath
    );

#endif // VIRTDISK_DEFINE_FLAGS

//
// GetStorageDependencyInformation
//

// Flags for dependent disks
typedef enum _DEPENDENT_DISK_FLAG
{
    DEPENDENT_DISK_FLAG_NONE                 = 0x00000000,

    //
    // Multiple files backing the virtual storage device
    //
    DEPENDENT_DISK_FLAG_MULT_BACKING_FILES   = 0x00000001,

    DEPENDENT_DISK_FLAG_FULLY_ALLOCATED      = 0x00000002,

    DEPENDENT_DISK_FLAG_READ_ONLY            = 0x00000004,

    //
    //Backing file of the virtual storage device is not local to the machine
    //
    DEPENDENT_DISK_FLAG_REMOTE               = 0x00000008,

    //
    // Volume is the system volume
    //
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME        = 0x00000010,

    //
    // Volume backing the virtual storage device file is the system volume
    //
    DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT = 0x00000020,

    DEPENDENT_DISK_FLAG_REMOVABLE            = 0x00000040,

    //
    // Drive letters are not assigned to the volumes
    // on the virtual disk automatically.
    //
    DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER      = 0x00000080,

    DEPENDENT_DISK_FLAG_PARENT               = 0x00000100,

    //
    // Virtual disk is not attached on the local host
    // (instead attached on a guest VM for instance)
    //
    DEPENDENT_DISK_FLAG_NO_HOST_DISK         = 0x00000200,

    //
    // Indicates the lifetime of the disk is not tied
    // to any system handles
    //
    DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME   = 0x00000400,

} DEPENDENT_DISK_FLAG;

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(DEPENDENT_DISK_FLAG);
#endif

#if !defined(VIRTDISK_DEFINE_FLAGS)

// Version definitions
typedef enum _STORAGE_DEPENDENCY_INFO_VERSION
{
    STORAGE_DEPENDENCY_INFO_VERSION_UNSPECIFIED = 0,
    STORAGE_DEPENDENCY_INFO_VERSION_1           = 1,
    STORAGE_DEPENDENCY_INFO_VERSION_2           = 2,

} STORAGE_DEPENDENCY_INFO_VERSION;


// Parameter structure for GetStorageDependencyInformation
typedef struct _STORAGE_DEPENDENCY_INFO_TYPE_1
{
    DEPENDENT_DISK_FLAG   DependencyTypeFlags;
    ULONG                 ProviderSpecificFlags;
    VIRTUAL_STORAGE_TYPE  VirtualStorageType;
} STORAGE_DEPENDENCY_INFO_TYPE_1, *PSTORAGE_DEPENDENCY_INFO_TYPE_1;


// Parameter structure for GetStorageDependencyInformation
typedef struct _STORAGE_DEPENDENCY_INFO_TYPE_2
{
    DEPENDENT_DISK_FLAG  DependencyTypeFlags;
    ULONG                ProviderSpecificFlags;
    VIRTUAL_STORAGE_TYPE VirtualStorageType;
    ULONG                AncestorLevel;
    PWSTR                DependencyDeviceName;
    PWSTR                HostVolumeName;
    PWSTR                DependentVolumeName;
    PWSTR                DependentVolumeRelativePath;
} STORAGE_DEPENDENCY_INFO_TYPE_2, *PSTORAGE_DEPENDENCY_INFO_TYPE_2;


// Parameter structure for GetStorageDependencyInformation
typedef struct _STORAGE_DEPENDENCY_INFO
{
    STORAGE_DEPENDENCY_INFO_VERSION Version;
    ULONG NumberEntries;
    union
    {
        STORAGE_DEPENDENCY_INFO_TYPE_1 Version1Entries[];
        STORAGE_DEPENDENCY_INFO_TYPE_2 Version2Entries[];
    };
} STORAGE_DEPENDENCY_INFO, *PSTORAGE_DEPENDENCY_INFO;

#endif // VIRTDISK_DEFINE_FLAGS

// Flags for GetStorageDependencyInformation
typedef enum _GET_STORAGE_DEPENDENCY_FLAG
{
    GET_STORAGE_DEPENDENCY_FLAG_NONE         = 0x00000000,

    // Return information for volumes or disks hosting the volume specified
    // If not set, returns info about volumes or disks being hosted by
    // the volume or disk specified
    GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES = 0x00000001,

    //  The handle provided is to a disk, not volume or file
    GET_STORAGE_DEPENDENCY_FLAG_DISK_HANDLE  = 0x00000002,

} GET_STORAGE_DEPENDENCY_FLAG;

#define GET_STORAGE_DEPENDENCY_FLAG_PARENTS GET_STORAGE_DEPENDENCY_FLAG_HOST_VOLUMES

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(GET_STORAGE_DEPENDENCY_FLAG);
#endif

#if !defined(VIRTDISK_DEFINE_FLAGS)

DWORD
WINAPI
GetStorageDependencyInformation(
    __in        HANDLE                      ObjectHandle,
    __in        GET_STORAGE_DEPENDENCY_FLAG Flags,
    __in        ULONG                       StorageDependencyInfoSize,
    __inout     PSTORAGE_DEPENDENCY_INFO    StorageDependencyInfo,
    __inout_opt PULONG                      SizeUsed
    );



//
// GetVirtualDiskInformation
//

// Version definitions
typedef enum _GET_VIRTUAL_DISK_INFO_VERSION
{
    GET_VIRTUAL_DISK_INFO_UNSPECIFIED       = 0,
    GET_VIRTUAL_DISK_INFO_SIZE              = 1,
    GET_VIRTUAL_DISK_INFO_IDENTIFIER        = 2,
    GET_VIRTUAL_DISK_INFO_PARENT_LOCATION   = 3,
    GET_VIRTUAL_DISK_INFO_PARENT_IDENTIFIER = 4,
    GET_VIRTUAL_DISK_INFO_PARENT_TIMESTAMP  = 5,
    GET_VIRTUAL_DISK_INFO_VIRTUAL_STORAGE_TYPE  = 6,
    GET_VIRTUAL_DISK_INFO_PROVIDER_SUBTYPE  = 7,

} GET_VIRTUAL_DISK_INFO_VERSION;


// Versioned parameter structure for GetVirtualDiskInformation
typedef struct _GET_VIRTUAL_DISK_INFO
{
    GET_VIRTUAL_DISK_INFO_VERSION Version;

    union
    {
        struct
        {
            ULONGLONG VirtualSize;
            ULONGLONG PhysicalSize;
            ULONG     BlockSize;
            ULONG     SectorSize;
        } Size;

        GUID Identifier;

        struct
        {
            BOOL  ParentResolved;
            WCHAR ParentLocationBuffer[1];  // MultiSz string
        } ParentLocation;

        GUID ParentIdentifier;

        ULONG ParentTimestamp;

        VIRTUAL_STORAGE_TYPE VirtualStorageType;

        ULONG ProviderSubtype;
    };
} GET_VIRTUAL_DISK_INFO, *PGET_VIRTUAL_DISK_INFO;


DWORD
WINAPI
GetVirtualDiskInformation(
    __in        HANDLE                  VirtualDiskHandle,
    __inout     PULONG                  VirtualDiskInfoSize,
    __inout     PGET_VIRTUAL_DISK_INFO  VirtualDiskInfo,
    __inout_opt PULONG                  SizeUsed
    );



//
// SetVirtualDiskInformation
//

// Version definitions
typedef enum _SET_VIRTUAL_DISK_INFO_VERSION
{
    SET_VIRTUAL_DISK_INFO_UNSPECIFIED       = 0,
    SET_VIRTUAL_DISK_INFO_PARENT_PATH       = 1,
    SET_VIRTUAL_DISK_INFO_IDENTIFIER        = 2,

} SET_VIRTUAL_DISK_INFO_VERSION;


// Versioned parameter structure for SetVirtualDiskInformation
typedef struct _SET_VIRTUAL_DISK_INFO
{
    SET_VIRTUAL_DISK_INFO_VERSION Version;

    union
    {
        PCWSTR ParentFilePath;

        GUID UniqueIdentifier;
    };
} SET_VIRTUAL_DISK_INFO, *PSET_VIRTUAL_DISK_INFO;


DWORD
WINAPI
SetVirtualDiskInformation(
    __in HANDLE                 VirtualDiskHandle,
    __in PSET_VIRTUAL_DISK_INFO VirtualDiskInfo
);



//
// GetVirtualDiskOperationProgress
//

typedef struct _VIRTUAL_DISK_PROGRESS
{
    DWORD      OperationStatus;
    ULONGLONG  CurrentValue;
    ULONGLONG  CompletionValue;
} VIRTUAL_DISK_PROGRESS, *PVIRTUAL_DISK_PROGRESS;


DWORD WINAPI
GetVirtualDiskOperationProgress(
    __in      HANDLE                 VirtualDiskHandle,
    __in      LPOVERLAPPED           Overlapped,
    __out     PVIRTUAL_DISK_PROGRESS Progress
    );



//
// CompactVirtualDisk
//

// Version definitions
typedef enum _COMPACT_VIRTUAL_DISK_VERSION
{
    COMPACT_VIRTUAL_DISK_VERSION_UNSPECIFIED    = 0,
    COMPACT_VIRTUAL_DISK_VERSION_1              = 1,

} COMPACT_VIRTUAL_DISK_VERSION;


// Versioned structure for CompactVirtualDisk
typedef struct _COMPACT_VIRTUAL_DISK_PARAMETERS
{
    COMPACT_VIRTUAL_DISK_VERSION Version;

    union
    {
        struct
        {
            ULONG Reserved;
        } Version1;
    };
} COMPACT_VIRTUAL_DISK_PARAMETERS, *PCOMPACT_VIRTUAL_DISK_PARAMETERS;


// Flags for CompactVirtualDisk
typedef enum _COMPACT_VIRTUAL_DISK_FLAG
{
    COMPACT_VIRTUAL_DISK_FLAG_NONE                 = 0x00000000,

} COMPACT_VIRTUAL_DISK_FLAG;

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(COMPACT_VIRTUAL_DISK_FLAG);
#endif

DWORD
WINAPI
CompactVirtualDisk(
    __in     HANDLE                           VirtualDiskHandle,
    __in     COMPACT_VIRTUAL_DISK_FLAG        Flags,
    __in_opt PCOMPACT_VIRTUAL_DISK_PARAMETERS Parameters,
    __in_opt LPOVERLAPPED                     Overlapped
    );



//
// MergeVirtualDisk
//

// Version definitions
typedef enum _MERGE_VIRTUAL_DISK_VERSION
{
    MERGE_VIRTUAL_DISK_VERSION_UNSPECIFIED    = 0,
    MERGE_VIRTUAL_DISK_VERSION_1              = 1,

} MERGE_VIRTUAL_DISK_VERSION;



// Versioned parameter structure for MergeVirtualDisk
#define MERGE_VIRTUAL_DISK_DEFAULT_MERGE_DEPTH 1

typedef struct _MERGE_VIRTUAL_DISK_PARAMETERS
{
    MERGE_VIRTUAL_DISK_VERSION Version;

    union
    {
        struct
        {
            ULONG MergeDepth;
        } Version1;
    };
} MERGE_VIRTUAL_DISK_PARAMETERS, *PMERGE_VIRTUAL_DISK_PARAMETERS;


// Flags for MergeVirtualDisk
typedef enum _MERGE_VIRTUAL_DISK_FLAG
{
    MERGE_VIRTUAL_DISK_FLAG_NONE                 = 0x00000000,

} MERGE_VIRTUAL_DISK_FLAG;

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(MERGE_VIRTUAL_DISK_FLAG);
#endif

DWORD
WINAPI
MergeVirtualDisk(
    __in     HANDLE                         VirtualDiskHandle,
    __in     MERGE_VIRTUAL_DISK_FLAG        Flags,
    __in     PMERGE_VIRTUAL_DISK_PARAMETERS Parameters,
    __in_opt LPOVERLAPPED                   Overlapped
    );



//
// ExpandVirtualDisk
//

// Version definitions
typedef enum _EXPAND_VIRTUAL_DISK_VERSION
{
    EXPAND_VIRTUAL_DISK_VERSION_UNSPECIFIED    = 0,
    EXPAND_VIRTUAL_DISK_VERSION_1              = 1,

} EXPAND_VIRTUAL_DISK_VERSION;


// Versioned parameter structure for ExpandVirtualDisk
typedef struct _EXPAND_VIRTUAL_DISK_PARAMETERS
{
    EXPAND_VIRTUAL_DISK_VERSION Version;

    union
    {
        struct
        {
            ULONGLONG NewSize;
        } Version1;
    };

} EXPAND_VIRTUAL_DISK_PARAMETERS, *PEXPAND_VIRTUAL_DISK_PARAMETERS;


// Flags for ExpandVirtualDisk
typedef enum _EXPAND_VIRTUAL_DISK_FLAG
{
    EXPAND_VIRTUAL_DISK_FLAG_NONE                 = 0x00000000,

} EXPAND_VIRTUAL_DISK_FLAG;

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(EXPAND_VIRTUAL_DISK_FLAG);
#endif

DWORD
WINAPI
ExpandVirtualDisk(
    __in     HANDLE                          VirtualDiskHandle,
    __in     EXPAND_VIRTUAL_DISK_FLAG        Flags,
    __in     PEXPAND_VIRTUAL_DISK_PARAMETERS Parameters,
    __in_opt LPOVERLAPPED                    Overlapped
    );

#endif // VIRTDISK_DEFINE_FLAGS

//
//  The Surface and Unsurface API names are deprecated.  Use Attach/Detach versions
//  instead.  If you use any of these defines below your code will break post Win7.
//

#define SurfaceVirtualDisk                           AttachVirtualDisk
#define UnsurfaceVirtualDisk                         DetachVirtualDisk
#define VIRTUAL_DISK_ACCESS_SURFACE_RO               VIRTUAL_DISK_ACCESS_ATTACH_RO
#define VIRTUAL_DISK_ACCESS_SURFACE_RW               VIRTUAL_DISK_ACCESS_ATTACH_RW
#define VIRTUAL_DISK_ACCESS_UNSURFACE                VIRTUAL_DISK_ACCESS_DETACH
#define SURFACE_VIRTUAL_DISK_VERSION_UNSPECIFIED     ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED
#define SURFACE_VIRTUAL_DISK_VERSION_1               ATTACH_VIRTUAL_DISK_VERSION_1
#define SURFACE_VIRTUAL_DISK_VERSION                 ATTACH_VIRTUAL_DISK_VERSION
#define _SURFACE_VIRTUAL_DISK_VERSION                _ATTACH_VIRTUAL_DISK_VERSION
#define SURFACE_VIRTUAL_DISK_PARAMETERS              ATTACH_VIRTUAL_DISK_PARAMETERS
#define PSURFACE_VIRTUAL_DISK_PARAMETERS             PATTACH_VIRTUAL_DISK_PARAMETERS
#define _SURFACE_VIRTUAL_DISK_PARAMETERS             _ATTACH_VIRTUAL_DISK_PARAMETERS

#if !defined(__midl)

#define _SURFACE_VIRTUAL_DISK_FLAG                   _ATTACH_VIRTUAL_DISK_FLAG 
#define SURFACE_VIRTUAL_DISK_FLAG_NONE               ATTACH_VIRTUAL_DISK_FLAG_NONE
#define SURFACE_VIRTUAL_DISK_FLAG_READ_ONLY          ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY
#define SURFACE_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER    ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER
#define SURFACE_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME
#define SURFACE_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST      ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST
#define SURFACE_VIRTUAL_DISK_FLAG                    ATTACH_VIRTUAL_DISK_FLAG
#define _UNSURFACE_VIRTUAL_DISK_FLAG                 _DETACH_VIRTUAL_DISK_FLAG
#define UNSURFACE_VIRTUAL_DISK_FLAG_NONE             DETACH_VIRTUAL_DISK_FLAG_NONE
#define UNSURFACE_VIRTUAL_DISK_FLAG                  DETACH_VIRTUAL_DISK_FLAG

#else

typedef enum _SURFACE_VIRTUAL_DISK_FLAG
{
    SURFACE_VIRTUAL_DISK_FLAG_NONE                = 0x00000000,
    SURFACE_VIRTUAL_DISK_FLAG_READ_ONLY           = 0x00000001,
    SURFACE_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER     = 0x00000002,
    SURFACE_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME  = 0x00000004,
    SURFACE_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST       = 0x00000008,
} SURFACE_VIRTUAL_DISK_FLAG;

typedef enum _UNSURFACE_VIRTUAL_DISK_FLAG
{
    UNSURFACE_VIRTUAL_DISK_FLAG_NONE                = 0x00000000,
} UNSURFACE_VIRTUAL_DISK_FLAG;

#if !defined(VIRTDISK_DEFINE_FLAGS)

#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(SURFACE_VIRTUAL_DISK_FLAG);
#endif
#ifdef DEFINE_ENUM_FLAG_OPERATORS
DEFINE_ENUM_FLAG_OPERATORS(UNSURFACE_VIRTUAL_DISK_FLAG);
#endif
#endif

#endif

//  End deprecated APIs

#ifdef __cplusplus
}
#endif

#pragma warning(pop)

#endif // WIN32_WINNT_WIN7

#endif // VIRT_DISK_API_DEF

// VirtDisk.h EOF


