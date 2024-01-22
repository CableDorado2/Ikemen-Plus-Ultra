

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for vpccominterfaces.idl:
    Oicf, W1, Zp8, env=Win32 (32b run), target_arch=X86 7.00.0555 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 500
#endif

/* verify that the <rpcsal.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCSAL_H_VERSION__
#define __REQUIRED_RPCSAL_H_VERSION__ 100
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__


#ifndef __vpccominterfaces_h__
#define __vpccominterfaces_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IVMAccountant_FWD_DEFINED__
#define __IVMAccountant_FWD_DEFINED__
typedef interface IVMAccountant IVMAccountant;
#endif 	/* __IVMAccountant_FWD_DEFINED__ */


#ifndef __IVMHardDiskConnection_FWD_DEFINED__
#define __IVMHardDiskConnection_FWD_DEFINED__
typedef interface IVMHardDiskConnection IVMHardDiskConnection;
#endif 	/* __IVMHardDiskConnection_FWD_DEFINED__ */


#ifndef __IVMHardDiskConnectionCollection_FWD_DEFINED__
#define __IVMHardDiskConnectionCollection_FWD_DEFINED__
typedef interface IVMHardDiskConnectionCollection IVMHardDiskConnectionCollection;
#endif 	/* __IVMHardDiskConnectionCollection_FWD_DEFINED__ */


#ifndef __IVMFloppyDrive_FWD_DEFINED__
#define __IVMFloppyDrive_FWD_DEFINED__
typedef interface IVMFloppyDrive IVMFloppyDrive;
#endif 	/* __IVMFloppyDrive_FWD_DEFINED__ */


#ifndef __IVMFloppyDriveCollection_FWD_DEFINED__
#define __IVMFloppyDriveCollection_FWD_DEFINED__
typedef interface IVMFloppyDriveCollection IVMFloppyDriveCollection;
#endif 	/* __IVMFloppyDriveCollection_FWD_DEFINED__ */


#ifndef __IVMDVDDrive_FWD_DEFINED__
#define __IVMDVDDrive_FWD_DEFINED__
typedef interface IVMDVDDrive IVMDVDDrive;
#endif 	/* __IVMDVDDrive_FWD_DEFINED__ */


#ifndef __IVMDVDDriveCollection_FWD_DEFINED__
#define __IVMDVDDriveCollection_FWD_DEFINED__
typedef interface IVMDVDDriveCollection IVMDVDDriveCollection;
#endif 	/* __IVMDVDDriveCollection_FWD_DEFINED__ */


#ifndef __IVMGuestOS_FWD_DEFINED__
#define __IVMGuestOS_FWD_DEFINED__
typedef interface IVMGuestOS IVMGuestOS;
#endif 	/* __IVMGuestOS_FWD_DEFINED__ */


#ifndef __IVMNetworkAdapter_FWD_DEFINED__
#define __IVMNetworkAdapter_FWD_DEFINED__
typedef interface IVMNetworkAdapter IVMNetworkAdapter;
#endif 	/* __IVMNetworkAdapter_FWD_DEFINED__ */


#ifndef __IVMNetworkAdapterCollection_FWD_DEFINED__
#define __IVMNetworkAdapterCollection_FWD_DEFINED__
typedef interface IVMNetworkAdapterCollection IVMNetworkAdapterCollection;
#endif 	/* __IVMNetworkAdapterCollection_FWD_DEFINED__ */


#ifndef __IVMDisplay_FWD_DEFINED__
#define __IVMDisplay_FWD_DEFINED__
typedef interface IVMDisplay IVMDisplay;
#endif 	/* __IVMDisplay_FWD_DEFINED__ */


#ifndef __IVMMouse_FWD_DEFINED__
#define __IVMMouse_FWD_DEFINED__
typedef interface IVMMouse IVMMouse;
#endif 	/* __IVMMouse_FWD_DEFINED__ */


#ifndef __IVMKeyboard_FWD_DEFINED__
#define __IVMKeyboard_FWD_DEFINED__
typedef interface IVMKeyboard IVMKeyboard;
#endif 	/* __IVMKeyboard_FWD_DEFINED__ */


#ifndef __IVMParallelPort_FWD_DEFINED__
#define __IVMParallelPort_FWD_DEFINED__
typedef interface IVMParallelPort IVMParallelPort;
#endif 	/* __IVMParallelPort_FWD_DEFINED__ */


#ifndef __IVMParallelPortCollection_FWD_DEFINED__
#define __IVMParallelPortCollection_FWD_DEFINED__
typedef interface IVMParallelPortCollection IVMParallelPortCollection;
#endif 	/* __IVMParallelPortCollection_FWD_DEFINED__ */


#ifndef __IVMSerialPort_FWD_DEFINED__
#define __IVMSerialPort_FWD_DEFINED__
typedef interface IVMSerialPort IVMSerialPort;
#endif 	/* __IVMSerialPort_FWD_DEFINED__ */


#ifndef __IVMSerialPortCollection_FWD_DEFINED__
#define __IVMSerialPortCollection_FWD_DEFINED__
typedef interface IVMSerialPortCollection IVMSerialPortCollection;
#endif 	/* __IVMSerialPortCollection_FWD_DEFINED__ */


#ifndef __IVMTask_FWD_DEFINED__
#define __IVMTask_FWD_DEFINED__
typedef interface IVMTask IVMTask;
#endif 	/* __IVMTask_FWD_DEFINED__ */


#ifndef __IVMUSBDevice_FWD_DEFINED__
#define __IVMUSBDevice_FWD_DEFINED__
typedef interface IVMUSBDevice IVMUSBDevice;
#endif 	/* __IVMUSBDevice_FWD_DEFINED__ */


#ifndef __IVMUSBDeviceCollection_FWD_DEFINED__
#define __IVMUSBDeviceCollection_FWD_DEFINED__
typedef interface IVMUSBDeviceCollection IVMUSBDeviceCollection;
#endif 	/* __IVMUSBDeviceCollection_FWD_DEFINED__ */


#ifndef __IVMVirtualMachine_FWD_DEFINED__
#define __IVMVirtualMachine_FWD_DEFINED__
typedef interface IVMVirtualMachine IVMVirtualMachine;
#endif 	/* __IVMVirtualMachine_FWD_DEFINED__ */


#ifndef __IVMVirtualMachineEvents_FWD_DEFINED__
#define __IVMVirtualMachineEvents_FWD_DEFINED__
typedef interface IVMVirtualMachineEvents IVMVirtualMachineEvents;
#endif 	/* __IVMVirtualMachineEvents_FWD_DEFINED__ */


#ifndef __IVMVirtualMachineCollection_FWD_DEFINED__
#define __IVMVirtualMachineCollection_FWD_DEFINED__
typedef interface IVMVirtualMachineCollection IVMVirtualMachineCollection;
#endif 	/* __IVMVirtualMachineCollection_FWD_DEFINED__ */


#ifndef __VMVirtualMachine_FWD_DEFINED__
#define __VMVirtualMachine_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMVirtualMachine VMVirtualMachine;
#else
typedef struct VMVirtualMachine VMVirtualMachine;
#endif /* __cplusplus */

#endif 	/* __VMVirtualMachine_FWD_DEFINED__ */


#ifndef __IVMSupportDriver_FWD_DEFINED__
#define __IVMSupportDriver_FWD_DEFINED__
typedef interface IVMSupportDriver IVMSupportDriver;
#endif 	/* __IVMSupportDriver_FWD_DEFINED__ */


#ifndef __IVMSupportDriverCollection_FWD_DEFINED__
#define __IVMSupportDriverCollection_FWD_DEFINED__
typedef interface IVMSupportDriverCollection IVMSupportDriverCollection;
#endif 	/* __IVMSupportDriverCollection_FWD_DEFINED__ */


#ifndef __VMSupportDriver_FWD_DEFINED__
#define __VMSupportDriver_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMSupportDriver VMSupportDriver;
#else
typedef struct VMSupportDriver VMSupportDriver;
#endif /* __cplusplus */

#endif 	/* __VMSupportDriver_FWD_DEFINED__ */


#ifndef __IVMHostInfo_FWD_DEFINED__
#define __IVMHostInfo_FWD_DEFINED__
typedef interface IVMHostInfo IVMHostInfo;
#endif 	/* __IVMHostInfo_FWD_DEFINED__ */


#ifndef __IVMVirtualNetworkCollection_FWD_DEFINED__
#define __IVMVirtualNetworkCollection_FWD_DEFINED__
typedef interface IVMVirtualNetworkCollection IVMVirtualNetworkCollection;
#endif 	/* __IVMVirtualNetworkCollection_FWD_DEFINED__ */


#ifndef __IVMVirtualNetwork_FWD_DEFINED__
#define __IVMVirtualNetwork_FWD_DEFINED__
typedef interface IVMVirtualNetwork IVMVirtualNetwork;
#endif 	/* __IVMVirtualNetwork_FWD_DEFINED__ */


#ifndef __IVMHardDisk_FWD_DEFINED__
#define __IVMHardDisk_FWD_DEFINED__
typedef interface IVMHardDisk IVMHardDisk;
#endif 	/* __IVMHardDisk_FWD_DEFINED__ */


#ifndef __IVMTaskCollection_FWD_DEFINED__
#define __IVMTaskCollection_FWD_DEFINED__
typedef interface IVMTaskCollection IVMTaskCollection;
#endif 	/* __IVMTaskCollection_FWD_DEFINED__ */


#ifndef __IVMVirtualPC_FWD_DEFINED__
#define __IVMVirtualPC_FWD_DEFINED__
typedef interface IVMVirtualPC IVMVirtualPC;
#endif 	/* __IVMVirtualPC_FWD_DEFINED__ */


#ifndef __IVMVirtualPCEvents_FWD_DEFINED__
#define __IVMVirtualPCEvents_FWD_DEFINED__
typedef interface IVMVirtualPCEvents IVMVirtualPCEvents;
#endif 	/* __IVMVirtualPCEvents_FWD_DEFINED__ */


#ifndef __VMVirtualPC_FWD_DEFINED__
#define __VMVirtualPC_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMVirtualPC VMVirtualPC;
#else
typedef struct VMVirtualPC VMVirtualPC;
#endif /* __cplusplus */

#endif 	/* __VMVirtualPC_FWD_DEFINED__ */


#ifndef __VMAccountant_FWD_DEFINED__
#define __VMAccountant_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMAccountant VMAccountant;
#else
typedef struct VMAccountant VMAccountant;
#endif /* __cplusplus */

#endif 	/* __VMAccountant_FWD_DEFINED__ */


#ifndef __VMDisplay_FWD_DEFINED__
#define __VMDisplay_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMDisplay VMDisplay;
#else
typedef struct VMDisplay VMDisplay;
#endif /* __cplusplus */

#endif 	/* __VMDisplay_FWD_DEFINED__ */


#ifndef __IVMDVDDriveEvents_FWD_DEFINED__
#define __IVMDVDDriveEvents_FWD_DEFINED__
typedef interface IVMDVDDriveEvents IVMDVDDriveEvents;
#endif 	/* __IVMDVDDriveEvents_FWD_DEFINED__ */


#ifndef __VMDVDDrive_FWD_DEFINED__
#define __VMDVDDrive_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMDVDDrive VMDVDDrive;
#else
typedef struct VMDVDDrive VMDVDDrive;
#endif /* __cplusplus */

#endif 	/* __VMDVDDrive_FWD_DEFINED__ */


#ifndef __IVMFloppyDriveEvents_FWD_DEFINED__
#define __IVMFloppyDriveEvents_FWD_DEFINED__
typedef interface IVMFloppyDriveEvents IVMFloppyDriveEvents;
#endif 	/* __IVMFloppyDriveEvents_FWD_DEFINED__ */


#ifndef __VMFloppyDrive_FWD_DEFINED__
#define __VMFloppyDrive_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMFloppyDrive VMFloppyDrive;
#else
typedef struct VMFloppyDrive VMFloppyDrive;
#endif /* __cplusplus */

#endif 	/* __VMFloppyDrive_FWD_DEFINED__ */


#ifndef __VMGuestOS_FWD_DEFINED__
#define __VMGuestOS_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMGuestOS VMGuestOS;
#else
typedef struct VMGuestOS VMGuestOS;
#endif /* __cplusplus */

#endif 	/* __VMGuestOS_FWD_DEFINED__ */


#ifndef __VMHardDiskConnection_FWD_DEFINED__
#define __VMHardDiskConnection_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMHardDiskConnection VMHardDiskConnection;
#else
typedef struct VMHardDiskConnection VMHardDiskConnection;
#endif /* __cplusplus */

#endif 	/* __VMHardDiskConnection_FWD_DEFINED__ */


#ifndef __VMHardDisk_FWD_DEFINED__
#define __VMHardDisk_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMHardDisk VMHardDisk;
#else
typedef struct VMHardDisk VMHardDisk;
#endif /* __cplusplus */

#endif 	/* __VMHardDisk_FWD_DEFINED__ */


#ifndef __VMHostInfo_FWD_DEFINED__
#define __VMHostInfo_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMHostInfo VMHostInfo;
#else
typedef struct VMHostInfo VMHostInfo;
#endif /* __cplusplus */

#endif 	/* __VMHostInfo_FWD_DEFINED__ */


#ifndef __VMKeyboard_FWD_DEFINED__
#define __VMKeyboard_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMKeyboard VMKeyboard;
#else
typedef struct VMKeyboard VMKeyboard;
#endif /* __cplusplus */

#endif 	/* __VMKeyboard_FWD_DEFINED__ */


#ifndef __VMMouseDevice_FWD_DEFINED__
#define __VMMouseDevice_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMMouseDevice VMMouseDevice;
#else
typedef struct VMMouseDevice VMMouseDevice;
#endif /* __cplusplus */

#endif 	/* __VMMouseDevice_FWD_DEFINED__ */


#ifndef __VMNetworkAdapter_FWD_DEFINED__
#define __VMNetworkAdapter_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMNetworkAdapter VMNetworkAdapter;
#else
typedef struct VMNetworkAdapter VMNetworkAdapter;
#endif /* __cplusplus */

#endif 	/* __VMNetworkAdapter_FWD_DEFINED__ */


#ifndef __VMParallelPort_FWD_DEFINED__
#define __VMParallelPort_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMParallelPort VMParallelPort;
#else
typedef struct VMParallelPort VMParallelPort;
#endif /* __cplusplus */

#endif 	/* __VMParallelPort_FWD_DEFINED__ */


#ifndef __VMSerialPort_FWD_DEFINED__
#define __VMSerialPort_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMSerialPort VMSerialPort;
#else
typedef struct VMSerialPort VMSerialPort;
#endif /* __cplusplus */

#endif 	/* __VMSerialPort_FWD_DEFINED__ */


#ifndef __VMVirtualNetwork_FWD_DEFINED__
#define __VMVirtualNetwork_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMVirtualNetwork VMVirtualNetwork;
#else
typedef struct VMVirtualNetwork VMVirtualNetwork;
#endif /* __cplusplus */

#endif 	/* __VMVirtualNetwork_FWD_DEFINED__ */


#ifndef __VMTask_FWD_DEFINED__
#define __VMTask_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMTask VMTask;
#else
typedef struct VMTask VMTask;
#endif /* __cplusplus */

#endif 	/* __VMTask_FWD_DEFINED__ */


#ifndef __VMUSBDevice_FWD_DEFINED__
#define __VMUSBDevice_FWD_DEFINED__

#ifdef __cplusplus
typedef class VMUSBDevice VMUSBDevice;
#else
typedef struct VMUSBDevice VMUSBDevice;
#endif /* __cplusplus */

#endif 	/* __VMUSBDevice_FWD_DEFINED__ */


/* header files for imported files */
#include "unknwn.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_vpccominterfaces_0000_0000 */
/* [local] */ 

#pragma once
#pragma once
#pragma once
#pragma once
/*------------------------------------------------------------------
	Virtual PC-specific HRESULT codes
------------------------------------------------------------------*/

#define	VM_E_TIMED_OUT	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x202 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_OUT_OF_RESOURCE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x203 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_TOO_MANY_VMS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x204 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VM_NOT_RUNNING	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x206 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VM_UNKNOWN	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x207 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_OUT_OF_RESERVE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x208 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_APP_SHUTTING_DOWN	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x209 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_SCRIPT_ALREADY_EXISTS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x20a ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VM_RUNNING_OR_SAVED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x20b ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_NOT_FOUND	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x300 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_ILLEGAL_VALUE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x301 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_VM_ACTIVE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x302 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_CONFIG_UPDATED_VM_ACTIVE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x303 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_UNLOADABLE_ACTIVATION	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x306 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_SAVED_STATE_BAD_VERSION	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x307 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PREF_SAVED_STATE_ACCESS_DENIED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x308 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_CONFIG_NO_NAME	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x400 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_CONFIG_NAME_TOO_LONG	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x401 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_CONFIG_NAME_INVALID_CHAR	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x402 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_CONFIG_DUPLICATE_NAME	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x403 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VM_RUNNING	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x500 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VM_NO_SAVED_STATE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x501 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_DRIVE_INVALID	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x502 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_DRIVE_BUS_LOC_IN_USE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x503 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_ADDITIONS_NOT_AVAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x504 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_ADDITIONS_FEATURE_NOT_AVAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x505 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_FOLDER_NOT_SHARED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x506 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VM_PAUSED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x507 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_MEDIA_UNMOUNT_FAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x508 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_IMAGE_CAPTURE_FAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x650 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_HOST_FLOPPY_CAPTURE_FAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x651 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_NO_MEDIA_CAPTURED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x652 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PARENT_PATH_NOT_FOUND	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x677 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_FILE_TOO_LARGE_FOR_VOLUME	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x679 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_FILE_READ_ONLY	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x67a ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_WRONG_HD_IMAGE_TYPE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x67b ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_HD_IMAGE_OPEN_FAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x67c ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_HOST_DRIVE_NOT_FOUND	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x67e ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_HD_IMAGE_ACCESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x681 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_HD_FILE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x682 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_IMAGE_SIZE_TOO_LARGE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x683 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_IMAGE_SIZE_TOO_SMALL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x684 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PARENT_CHILD_ID_MISMATCH	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x685 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_UNSUPPORTED_HD_DISK_TYPE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x686 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_PARENT_MODIFIED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x687 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_ADAPTER_NOT_FOUND	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x700 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VIRTUAL_NETWORK_NAME_ALREADY_EXISTS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x701 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_VIRTUAL_NETWORK_ID	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x702 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_CANT_SET_ETHERNET_ADDRESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x703 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_IP_ADDRESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x704 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_NETWORK_ADDRESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x705 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_NETWORK_MASK	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x706 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_STARTING_ADDRESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x707 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_ENDING_ADDRESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x708 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_ADDRESS_RANGE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x709 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_CANT_SET_DYNAMIC_MAC_ADDRESS	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x70a ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_DRIVE_IN_USE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x727 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_MEDIA_WRONG_TYPE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x728 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_NO_LICENSE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x750 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_LICENSE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x751 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_LICENSE_KEY	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x752 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_INVALID_LICENSE_VALUE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x753 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_LICENSE_ACTIVE_VM_LIMIT	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x754 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_LICENSE_HOST_MEMORY_LIMIT	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x755 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_LICENSE_VM_MEMORY_LIMIT	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x756 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_NOT_A_TRIAL_VERSION	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x757 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_NON_ACTIVE_TRIAL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x758 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_MOUSE_NOT_ACTIVE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x800 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USING_ABSOLUTE_COORDINATES	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x801 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USING_RELATIVE_COORDINATES	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x802 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_SET_EXCLUSIVE_MODE_FAIL	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x825 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_NO_DISPLAY	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x850 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_SECURITY_DUPLICATE_USER	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x900 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_CONNECTOR_DRIVER_ERROR	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x925 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_ATTACH_FAILED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x926 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_DETACH_FAILED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x927 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_ENUMERATION_FAILED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x928 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_EXTERNAL_VM	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x929 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_ENUMERATION_FAILED_MORE_DEVICES	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x930 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_ATTACH_FAILED_MORE_DEVICES	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x931 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_ATTACH_FAILED_GP_ERROR	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x932 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_USB_ATTACH_FAILED_ALREADY_ASSIGNED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x933 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_UNSUPPORTED_HARDWARE	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x950 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_HARDWARE_VIRTUALIZATION_DISABLED	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x951 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

#define	VM_E_VMVIRTUALPC_OLDER_VERSION	( ( ( HRESULT  )(( ( ( ( unsigned long  )1 << 31 )  | ( ( unsigned long  )4 << 16 )  )  | ( unsigned long  )0x952 ) ) | ( HRESULT  )(( 1 << 29 ) ) )  )

const ULONG kVSTypeLibrary_MajorVersion = 1;
const ULONG kVSTypeLibrary_MinorVersion = 0;



extern RPC_IF_HANDLE __MIDL_itf_vpccominterfaces_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_vpccominterfaces_0000_0000_v0_0_s_ifspec;


#ifndef __VirtualPC_LIBRARY_DEFINED__
#define __VirtualPC_LIBRARY_DEFINED__

/* library VirtualPC */
/* [custom][version][uuid] */ 

typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("24e65079-6dc8-4655-802b-0baff6352998") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0001
    {	vmEvent_VirtualPCStarted	= 0,
	vmEvent_VirtualPCStopped	= ( vmEvent_VirtualPCStarted + 1 ) ,
	vmEvent_VirtualMachineLaunched	= ( vmEvent_VirtualPCStopped + 1 ) ,
	vmEvent_VirtualMachineStateRestored	= ( vmEvent_VirtualMachineLaunched + 1 ) ,
	vmEvent_VirtualMachineStateSaved	= ( vmEvent_VirtualMachineStateRestored + 1 ) ,
	vmEvent_VirtualMachineTurnedOff	= ( vmEvent_VirtualMachineStateSaved + 1 ) ,
	vmEvent_VirtualMachineTurnedOffByGuest	= ( vmEvent_VirtualMachineTurnedOff + 1 ) ,
	vmEvent_VirtualMachineReset	= ( vmEvent_VirtualMachineTurnedOffByGuest + 1 ) ,
	vmEvent_VirtualMachineNoHeartbeat	= ( vmEvent_VirtualMachineReset + 1 ) ,
	vmEvent_VirtualMachineProcessorError	= ( vmEvent_VirtualMachineNoHeartbeat + 1 ) ,
	vmEvent_VirtualMachineHostDiskSpaceWarning	= ( vmEvent_VirtualMachineProcessorError + 1 ) ,
	vmEvent_VirtualMachineHostDiskSpaceError	= ( vmEvent_VirtualMachineHostDiskSpaceWarning + 1 ) 
    } 	VMEventType;





















typedef /* [public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("ba5a8f81-8bf3-497e-ada5-1d91ec015469") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0002
    {	vmUndoAction_Discard	= 0,
	vmUndoAction_Keep	= ( vmUndoAction_Discard + 1 ) ,
	vmUndoAction_Commit	= ( vmUndoAction_Keep + 1 ) 
    } 	VMUndoAction;

typedef /* [public][public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("942984fb-1d9c-4b65-8cb2-43928a452b7a") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0003
    {	vmVMState_Invalid	= 0,
	vmVMState_TurnedOff	= ( vmVMState_Invalid + 1 ) ,
	vmVMState_Saved	= ( vmVMState_TurnedOff + 1 ) ,
	vmVMState_TurningOn	= ( vmVMState_Saved + 1 ) ,
	vmVMState_Restoring	= ( vmVMState_TurningOn + 1 ) ,
	vmVMState_Running	= ( vmVMState_Restoring + 1 ) ,
	vmVMState_Paused	= ( vmVMState_Running + 1 ) ,
	vmVMState_Saving	= ( vmVMState_Paused + 1 ) ,
	vmVMState_TurningOff	= ( vmVMState_Saving + 1 ) ,
	vmVMState_MergingDrives	= ( vmVMState_TurningOff + 1 ) ,
	vmVMState_DeleteMachine	= ( vmVMState_MergingDrives + 1 ) 
    } 	VMVMState;

typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("a21f0a07-10bf-494f-a9b5-f5c6b3a646fe") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0004
    {	vmDriveType_Null	= 0,
	vmDriveType_HardDisk	= ( vmDriveType_Null + 1 ) ,
	vmDriveType_DVD	= ( vmDriveType_HardDisk + 1 ) 
    } 	VMDriveType;

typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("6657ecee-2a47-421b-9488-7f75d6588bca") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0005
    {	vmDriveBusType_Invalid	= -1,
	vmDriveBusType_IDE	= 0,
	vmDriveBusType_SCSI	= 1
    } 	VMDriveBusType;

typedef /* [public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("37e07d0a-6aea-41a1-994f-fe134590263c") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0006
    {	vmSerialPort_HostPort	= 0,
	vmSerialPort_TextFile	= ( vmSerialPort_HostPort + 1 ) ,
	vmSerialPort_NamedPipe	= ( vmSerialPort_TextFile + 1 ) ,
	vmSerialPort_Null	= ( vmSerialPort_NamedPipe + 1 ) 
    } 	VMSerialPortType;

typedef /* [public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("263c1019-8285-4a3e-9f37-b2a361be28ac") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0007
    {	vmShutdownAction_Save	= 0,
	vmShutdownAction_TurnOff	= ( vmShutdownAction_Save + 1 ) ,
	vmShutdownAction_Shutdown	= ( vmShutdownAction_TurnOff + 1 ) 
    } 	VMShutdownAction;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("F581CDF8-B92B-475e-8167-6C448B642216") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0008
    {	vmStartupOption_Normal	= 0,
	vmStartupOption_FixParentTimestampMismatch	= ( vmStartupOption_Normal + 1 ) 
    } 	VMStartupOption;

typedef /* [public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("2af36ec0-cfe5-11dd-ad8b-0800200c9a66") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0009
    {	vmEndpoint_NamedPipe	= 0,
	vmEndpoint_TCPIP	= ( vmEndpoint_NamedPipe + 1 ) 
    } 	VMEndpointType;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("7aa05db2-2aec-4b9e-b011-875303424da6") 
enum __MIDL___MIDL_itf_vpccominterfaces_0000_0000_0010
    {	vmLogoff_Normal	= 0,
	vmLogoff_Forced	= ( vmLogoff_Normal + 1 ) ,
	vmLogoff_External	= ( vmLogoff_Forced + 1 ) 
    } 	VMLogoffType;

EXTERN_C const IID DIID_IVMVirtualMachineEvents;
typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("e6ad021d-4c84-420d-a0fc-a7bd19250949") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0004_0001
    {	vmVirtualMachineEvent_StateChanged	= 1,
	vmVirtualMachineEvent_RequestShutdown	= ( vmVirtualMachineEvent_StateChanged + 1 ) ,
	vmVirtualMachineEvent_Reset	= ( vmVirtualMachineEvent_RequestShutdown + 1 ) ,
	vmVirtualMachineEvent_TripleFault	= ( vmVirtualMachineEvent_Reset + 1 ) ,
	vmVirtualMachineEvent_HeartbeatStopped	= ( vmVirtualMachineEvent_TripleFault + 1 ) ,
	vmVirtualMachineEvent_ConfigurationChanged	= ( vmVirtualMachineEvent_HeartbeatStopped + 1 ) ,
	vmVirtualMachineEvent_EnhancedVideoModeChanged	= ( vmVirtualMachineEvent_ConfigurationChanged + 1 ) ,
	vmVirtualMachineEvent_AdditionsUninstalled	= ( vmVirtualMachineEvent_EnhancedVideoModeChanged + 1 ) ,
	vmVirtualMachineEvent_AdditionsAvailable	= ( vmVirtualMachineEvent_AdditionsUninstalled + 1 ) ,
	vmVirtualMachineEvent_GuestShutdown	= ( vmVirtualMachineEvent_AdditionsAvailable + 1 ) ,
	vmVirtualMachineEvent_GuestLogoff	= ( vmVirtualMachineEvent_GuestShutdown + 1 ) ,
	vmVirtualMachineEvent_DiskOutOfSpace	= ( vmVirtualMachineEvent_GuestLogoff + 1 ) 
    } 	VMVirtualMachineEvents;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("c3a4a6cc-d87b-4109-b352-e2e689d8b5af") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0006_0001
    {	vmSupportDriver_InvalidType	= -1,
	vmSupportDriver_VirtualMachineMonitor	= 0,
	vmSupportDriver_NetworkServices	= ( vmSupportDriver_VirtualMachineMonitor + 1 ) 
    } 	VMSupportDriverType;














typedef /* [public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("537df63f-75f4-4871-a1b1-3af93279f9cc") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0008_0001
    {	vmFloppyDiskImage_Unknown	= 0,
	vmFloppyDiskImage_LowDensity	= ( vmFloppyDiskImage_Unknown + 1 ) ,
	vmFloppyDiskImage_HighDensity	= ( vmFloppyDiskImage_LowDensity + 1 ) ,
	vmFloppyDiskImage_DMF	= ( vmFloppyDiskImage_HighDensity + 1 ) ,
	vmFloppyDiskImage_LowDensitySingleSided	= ( vmFloppyDiskImage_DMF + 1 ) ,
	vmFloppyDiskImage_MediumDensity	= ( vmFloppyDiskImage_LowDensitySingleSided + 1 ) ,
	vmFloppyDiskImage_HighDensityMSS	= ( vmFloppyDiskImage_MediumDensity + 1 ) 
    } 	VMFloppyDiskImageType;

EXTERN_C const IID DIID_IVMVirtualPCEvents;
typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("5b030e37-c851-4cd8-b44e-0dadf07d866e") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0009_0001
    {	vmVirtualPCEvent_ServiceEvent	= 1,
	vmVirtualPCEvent_VMStateChange	= ( vmVirtualPCEvent_ServiceEvent + 1 ) ,
	vmVirtualPCEvent_EventLogged	= ( vmVirtualPCEvent_VMStateChange + 1 ) ,
	vmVirtualPCEvent_VMHeartbeatStopped	= ( vmVirtualPCEvent_EventLogged + 1 ) 
    } 	VMVirtualPCEvent;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("4c1fe6af-54dc-4c06-9efc-cf59819cbd47") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0011_0001
    {	vmVideoMode_TextMode	= 0,
	vmVideoMode_CGAMode	= ( vmVideoMode_TextMode + 1 ) ,
	vmVideoMode_VGAMode	= ( vmVideoMode_CGAMode + 1 ) ,
	vmVideoMode_SVGAMode	= ( vmVideoMode_VGAMode + 1 ) 
    } 	VMDisplayVideoMode;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("739bd96f-00e0-45b3-938d-c9a3026e0145") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0012_0001
    {	vmDVDDrive_None	= 0,
	vmDVDDrive_Image	= ( vmDVDDrive_None + 1 ) ,
	vmDVDDrive_HostDrive	= ( vmDVDDrive_Image + 1 ) 
    } 	VMDVDDriveAttachmentType;

EXTERN_C const IID DIID_IVMDVDDriveEvents;
typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("27834185-e110-4dbf-9a99-ca56e6bff436") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0013_0001
    {	vmDVDDriveEvent_OnInsert	= 1,
	vmDVDDriveEvent_OnEject	= ( vmDVDDriveEvent_OnInsert + 1 ) 
    } 	VMDVDDriveEvent;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("6af87b8a-9078-4993-99fc-86c0895f6b9c") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0015_0001
    {	vmFloppyDrive_None	= 0,
	vmFloppyDrive_Image	= ( vmFloppyDrive_None + 1 ) ,
	vmFloppyDrive_HostDrive	= ( vmFloppyDrive_Image + 1 ) 
    } 	VMFloppyDriveAttachmentType;

EXTERN_C const IID DIID_IVMFloppyDriveEvents;
typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("dfd0275a-ffd0-4c66-be25-fc73a4cff255") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0016_0001
    {	vmFloppyDriveEvent_OnInsert	= 1,
	vmFloppyDriveEvent_OnEject	= ( vmFloppyDriveEvent_OnInsert + 1 ) 
    } 	vmFloppyDriveEvent;


typedef /* [public][v1_enum][uuid] */  DECLSPEC_UUID("6A21E5E1-8A1F-4d79-A6CD-65332D187F75") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0018_0001
    {	vmGuestOS_Shutdown	= 0,
	vmGuestOS_LogOff	= ( vmGuestOS_Shutdown + 1 ) ,
	vmGuestOS_Reboot	= ( vmGuestOS_LogOff + 1 ) 
    } 	VMGuestOSOperationType;


typedef /* [public][public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("1a075387-a2d1-47ea-aaad-b64288cc7d42") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0021_0001
    {	vmDiskType_Dynamic	= 0,
	vmDiskType_FixedSize	= ( vmDiskType_Dynamic + 1 ) ,
	vmDiskType_Differencing	= ( vmDiskType_FixedSize + 1 ) 
    } 	VMHardDiskType;


typedef /* [public][public][public][public][v1_enum][uuid] */  DECLSPEC_UUID("1e2d0ecf-d9f1-40d2-86f1-d4ff7d05ae33") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0024_0001
    {	vmMouseButton_Left	= 1,
	vmMouseButton_Right	= ( vmMouseButton_Left + 1 ) ,
	vmMouseButton_Center	= ( vmMouseButton_Right + 1 ) 
    } 	VMMouseButton;



typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("ae3756b8-21e3-476a-a249-e032cf5be685") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0033_0001
    {	vmTaskResult_Success	= 0,
	vmTaskResult_Cancelled	= ( vmTaskResult_Success + 1 ) ,
	vmTaskResult_UnexpectedError	= ( vmTaskResult_Cancelled + 1 ) ,
	vmTaskResult_OutOfMemoryError	= ( vmTaskResult_UnexpectedError + 1 ) ,
	vmTaskResult_DiskRelatedError	= ( vmTaskResult_OutOfMemoryError + 1 ) ,
	vmTaskResult_IncompatibleSavedStateError	= ( vmTaskResult_DiskRelatedError + 1 ) ,
	vmTaskResult_TimeOutError	= ( vmTaskResult_IncompatibleSavedStateError + 1 ) ,
	vmTaskResult_IllegalValueError	= ( vmTaskResult_TimeOutError + 1 ) ,
	vmTaskResult_ThreadCrashError	= ( vmTaskResult_IllegalValueError + 1 ) ,
	vmTaskResult_ShutdownAbort	= ( vmTaskResult_ThreadCrashError + 1 ) 
    } 	VMTaskResult;

typedef /* [public][public][v1_enum][uuid] */  DECLSPEC_UUID("F3BD102C-E664-43fd-9E8E-4D4EF3E45021") 
enum __MIDL___MIDL_itf_vpccominterfaces_0001_0035_0001
    {	vmUSBDeviceClass_InterfaceDescriptor	= 0,
	vmUSBDeviceClass_Audio	= 0x1,
	vmUSBDeviceClass_Communication	= 0x2,
	vmUSBDeviceClass_HID	= 0x3,
	vmUSBDeviceClass_Physical	= 0x5,
	vmUSBDeviceClass_Image	= 0x6,
	vmUSBDeviceClass_Printer	= 0x7,
	vmUSBDeviceClass_MassStorage	= 0x8,
	vmUSBDeviceClass_Hub	= 0x9,
	vmUSBDeviceClass_CDCData	= 0xa,
	vmUSBDeviceClass_SmartCard	= 0xb,
	vmUSBDeviceClass_ContentSecurity	= 0xd,
	vmUSBDeviceClass_Video	= 0xe,
	vmUSBDeviceClass_PersonalHealthcare	= 0xf,
	vmUSBDeviceClass_DiagnosticDevice	= 0xdc,
	vmUSBDeviceClass_WirelessController	= 0xe0,
	vmUSBDeviceClass_Miscellaneous	= 0xef,
	vmUSBDeviceClass_ApplicationSpecific	= 0xfe,
	vmUSBDeviceClass_VendorSpecific	= 0xff
    } 	VMUSBDeviceClassEnum;


EXTERN_C const IID LIBID_VirtualPC;

#ifndef __IVMAccountant_INTERFACE_DEFINED__
#define __IVMAccountant_INTERFACE_DEFINED__

/* interface IVMAccountant */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMAccountant;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6376c067-7f57-4d63-b754-06e2e4f51d73")
    IVMAccountant : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_CPUUtilization( 
            /* [retval][out] */ __RPC__out long *percentageUtilization) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_CPUUtilizationHistory( 
            /* [retval][out] */ __RPC__out VARIANT *percentageUtilization) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DiskBytesRead( 
            /* [retval][out] */ __RPC__out VARIANT *bytesRead) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DiskBytesWritten( 
            /* [retval][out] */ __RPC__out VARIANT *bytesWritten) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_NetworkBytesReceived( 
            /* [retval][out] */ __RPC__out VARIANT *bytesReceived) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_NetworkBytesSent( 
            /* [retval][out] */ __RPC__out VARIANT *bytesSent) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UpTime( 
            /* [retval][out] */ __RPC__out long *secondsAlive) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMAccountantVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMAccountant * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMAccountant * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMAccountant * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMAccountant * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMAccountant * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMAccountant * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMAccountant * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CPUUtilization )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out long *percentageUtilization);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CPUUtilizationHistory )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out VARIANT *percentageUtilization);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DiskBytesRead )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out VARIANT *bytesRead);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DiskBytesWritten )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out VARIANT *bytesWritten);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NetworkBytesReceived )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out VARIANT *bytesReceived);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NetworkBytesSent )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out VARIANT *bytesSent);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UpTime )( 
            __RPC__in IVMAccountant * This,
            /* [retval][out] */ __RPC__out long *secondsAlive);
        
        END_INTERFACE
    } IVMAccountantVtbl;

    interface IVMAccountant
    {
        CONST_VTBL struct IVMAccountantVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMAccountant_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMAccountant_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMAccountant_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMAccountant_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMAccountant_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMAccountant_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMAccountant_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMAccountant_get_CPUUtilization(This,percentageUtilization)	\
    ( (This)->lpVtbl -> get_CPUUtilization(This,percentageUtilization) ) 

#define IVMAccountant_get_CPUUtilizationHistory(This,percentageUtilization)	\
    ( (This)->lpVtbl -> get_CPUUtilizationHistory(This,percentageUtilization) ) 

#define IVMAccountant_get_DiskBytesRead(This,bytesRead)	\
    ( (This)->lpVtbl -> get_DiskBytesRead(This,bytesRead) ) 

#define IVMAccountant_get_DiskBytesWritten(This,bytesWritten)	\
    ( (This)->lpVtbl -> get_DiskBytesWritten(This,bytesWritten) ) 

#define IVMAccountant_get_NetworkBytesReceived(This,bytesReceived)	\
    ( (This)->lpVtbl -> get_NetworkBytesReceived(This,bytesReceived) ) 

#define IVMAccountant_get_NetworkBytesSent(This,bytesSent)	\
    ( (This)->lpVtbl -> get_NetworkBytesSent(This,bytesSent) ) 

#define IVMAccountant_get_UpTime(This,secondsAlive)	\
    ( (This)->lpVtbl -> get_UpTime(This,secondsAlive) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMAccountant_INTERFACE_DEFINED__ */


#ifndef __IVMHardDiskConnection_INTERFACE_DEFINED__
#define __IVMHardDiskConnection_INTERFACE_DEFINED__

/* interface IVMHardDiskConnection */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMHardDiskConnection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("aefa36a5-463a-46ae-9e6c-a1fb4e12e671")
    IVMHardDiskConnection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HardDisk( 
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **hardDisk) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UndoHardDisk( 
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **undoHardDisk) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetBusLocation( 
            /* [in] */ long vmBusNumber,
            /* [in] */ long vmDeviceNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_BusNumber( 
            /* [retval][out] */ __RPC__out long *vmBusNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DeviceNumber( 
            /* [retval][out] */ __RPC__out long *vmDeviceNumber) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMHardDiskConnectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMHardDiskConnection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMHardDiskConnection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMHardDiskConnection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HardDisk )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **hardDisk);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UndoHardDisk )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **undoHardDisk);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetBusLocation )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [in] */ long vmBusNumber,
            /* [in] */ long vmDeviceNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BusNumber )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [retval][out] */ __RPC__out long *vmBusNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DeviceNumber )( 
            __RPC__in IVMHardDiskConnection * This,
            /* [retval][out] */ __RPC__out long *vmDeviceNumber);
        
        END_INTERFACE
    } IVMHardDiskConnectionVtbl;

    interface IVMHardDiskConnection
    {
        CONST_VTBL struct IVMHardDiskConnectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMHardDiskConnection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMHardDiskConnection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMHardDiskConnection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMHardDiskConnection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMHardDiskConnection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMHardDiskConnection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMHardDiskConnection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMHardDiskConnection_get_HardDisk(This,hardDisk)	\
    ( (This)->lpVtbl -> get_HardDisk(This,hardDisk) ) 

#define IVMHardDiskConnection_get_UndoHardDisk(This,undoHardDisk)	\
    ( (This)->lpVtbl -> get_UndoHardDisk(This,undoHardDisk) ) 

#define IVMHardDiskConnection_SetBusLocation(This,vmBusNumber,vmDeviceNumber)	\
    ( (This)->lpVtbl -> SetBusLocation(This,vmBusNumber,vmDeviceNumber) ) 

#define IVMHardDiskConnection_get_BusNumber(This,vmBusNumber)	\
    ( (This)->lpVtbl -> get_BusNumber(This,vmBusNumber) ) 

#define IVMHardDiskConnection_get_DeviceNumber(This,vmDeviceNumber)	\
    ( (This)->lpVtbl -> get_DeviceNumber(This,vmDeviceNumber) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMHardDiskConnection_INTERFACE_DEFINED__ */


#ifndef __IVMHardDiskConnectionCollection_INTERFACE_DEFINED__
#define __IVMHardDiskConnectionCollection_INTERFACE_DEFINED__

/* interface IVMHardDiskConnectionCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMHardDiskConnectionCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("b9f2caf4-0aeb-4085-b105-ceddb90dbf62")
    IVMHardDiskConnectionCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDiskConnection **hardDiskConnection) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMHardDiskConnectionCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMHardDiskConnectionCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMHardDiskConnectionCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMHardDiskConnectionCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDiskConnection **hardDiskConnection);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMHardDiskConnectionCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMHardDiskConnectionCollectionVtbl;

    interface IVMHardDiskConnectionCollection
    {
        CONST_VTBL struct IVMHardDiskConnectionCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMHardDiskConnectionCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMHardDiskConnectionCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMHardDiskConnectionCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMHardDiskConnectionCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMHardDiskConnectionCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMHardDiskConnectionCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMHardDiskConnectionCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMHardDiskConnectionCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMHardDiskConnectionCollection_get_Item(This,index,hardDiskConnection)	\
    ( (This)->lpVtbl -> get_Item(This,index,hardDiskConnection) ) 

#define IVMHardDiskConnectionCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMHardDiskConnectionCollection_INTERFACE_DEFINED__ */


#ifndef __IVMFloppyDrive_INTERFACE_DEFINED__
#define __IVMFloppyDrive_INTERFACE_DEFINED__

/* interface IVMFloppyDrive */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMFloppyDrive;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("661abee6-112a-4ed9-babf-3c874969f10e")
    IVMFloppyDrive : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AttachImage( 
            /* [in] */ __RPC__in BSTR mediaImagePath) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ReleaseImage( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ImageFile( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *imageFile) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AttachHostDrive( 
            /* [in] */ __RPC__in BSTR driveLetter) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ReleaseHostDrive( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HostDriveLetter( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *driveLetter) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DriveNumber( 
            /* [retval][out] */ __RPC__out long *driveNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Attachment( 
            /* [retval][out] */ __RPC__out VMFloppyDriveAttachmentType *driveAttachment) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMFloppyDriveVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMFloppyDrive * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMFloppyDrive * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMFloppyDrive * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMFloppyDrive * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMFloppyDrive * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMFloppyDrive * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMFloppyDrive * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AttachImage )( 
            __RPC__in IVMFloppyDrive * This,
            /* [in] */ __RPC__in BSTR mediaImagePath);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReleaseImage )( 
            __RPC__in IVMFloppyDrive * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ImageFile )( 
            __RPC__in IVMFloppyDrive * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *imageFile);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AttachHostDrive )( 
            __RPC__in IVMFloppyDrive * This,
            /* [in] */ __RPC__in BSTR driveLetter);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReleaseHostDrive )( 
            __RPC__in IVMFloppyDrive * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostDriveLetter )( 
            __RPC__in IVMFloppyDrive * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *driveLetter);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DriveNumber )( 
            __RPC__in IVMFloppyDrive * This,
            /* [retval][out] */ __RPC__out long *driveNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Attachment )( 
            __RPC__in IVMFloppyDrive * This,
            /* [retval][out] */ __RPC__out VMFloppyDriveAttachmentType *driveAttachment);
        
        END_INTERFACE
    } IVMFloppyDriveVtbl;

    interface IVMFloppyDrive
    {
        CONST_VTBL struct IVMFloppyDriveVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMFloppyDrive_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMFloppyDrive_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMFloppyDrive_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMFloppyDrive_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMFloppyDrive_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMFloppyDrive_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMFloppyDrive_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMFloppyDrive_AttachImage(This,mediaImagePath)	\
    ( (This)->lpVtbl -> AttachImage(This,mediaImagePath) ) 

#define IVMFloppyDrive_ReleaseImage(This)	\
    ( (This)->lpVtbl -> ReleaseImage(This) ) 

#define IVMFloppyDrive_get_ImageFile(This,imageFile)	\
    ( (This)->lpVtbl -> get_ImageFile(This,imageFile) ) 

#define IVMFloppyDrive_AttachHostDrive(This,driveLetter)	\
    ( (This)->lpVtbl -> AttachHostDrive(This,driveLetter) ) 

#define IVMFloppyDrive_ReleaseHostDrive(This)	\
    ( (This)->lpVtbl -> ReleaseHostDrive(This) ) 

#define IVMFloppyDrive_get_HostDriveLetter(This,driveLetter)	\
    ( (This)->lpVtbl -> get_HostDriveLetter(This,driveLetter) ) 

#define IVMFloppyDrive_get_DriveNumber(This,driveNumber)	\
    ( (This)->lpVtbl -> get_DriveNumber(This,driveNumber) ) 

#define IVMFloppyDrive_get_Attachment(This,driveAttachment)	\
    ( (This)->lpVtbl -> get_Attachment(This,driveAttachment) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMFloppyDrive_INTERFACE_DEFINED__ */


#ifndef __IVMFloppyDriveCollection_INTERFACE_DEFINED__
#define __IVMFloppyDriveCollection_INTERFACE_DEFINED__

/* interface IVMFloppyDriveCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMFloppyDriveCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8ba70a25-f698-4ee5-85ce-3cc93a925516")
    IVMFloppyDriveCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMFloppyDrive **floppyDrive) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMFloppyDriveCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMFloppyDriveCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMFloppyDriveCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMFloppyDriveCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMFloppyDrive **floppyDrive);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMFloppyDriveCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMFloppyDriveCollectionVtbl;

    interface IVMFloppyDriveCollection
    {
        CONST_VTBL struct IVMFloppyDriveCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMFloppyDriveCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMFloppyDriveCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMFloppyDriveCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMFloppyDriveCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMFloppyDriveCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMFloppyDriveCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMFloppyDriveCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMFloppyDriveCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMFloppyDriveCollection_get_Item(This,index,floppyDrive)	\
    ( (This)->lpVtbl -> get_Item(This,index,floppyDrive) ) 

#define IVMFloppyDriveCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMFloppyDriveCollection_INTERFACE_DEFINED__ */


#ifndef __IVMDVDDrive_INTERFACE_DEFINED__
#define __IVMDVDDrive_INTERFACE_DEFINED__

/* interface IVMDVDDrive */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMDVDDrive;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("b96328f6-6732-437d-a00d-ffa47e43971c")
    IVMDVDDrive : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetBusLocation( 
            /* [in] */ long busNumber,
            /* [in] */ long deviceNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_BusNumber( 
            /* [retval][out] */ __RPC__out long *vmBusNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DeviceNumber( 
            /* [retval][out] */ __RPC__out long *vmDeviceNumber) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AttachImage( 
            /* [in] */ __RPC__in BSTR imagePath) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ReleaseImage( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ImageFile( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *imagePath) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AttachHostDrive( 
            /* [in] */ __RPC__in BSTR driveLetter) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ReleaseHostDrive( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HostDriveLetter( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *driveLetter) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Attachment( 
            /* [retval][out] */ __RPC__out VMDVDDriveAttachmentType *driveAttachment) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMDVDDriveVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMDVDDrive * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMDVDDrive * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMDVDDrive * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMDVDDrive * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMDVDDrive * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMDVDDrive * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMDVDDrive * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetBusLocation )( 
            __RPC__in IVMDVDDrive * This,
            /* [in] */ long busNumber,
            /* [in] */ long deviceNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BusNumber )( 
            __RPC__in IVMDVDDrive * This,
            /* [retval][out] */ __RPC__out long *vmBusNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DeviceNumber )( 
            __RPC__in IVMDVDDrive * This,
            /* [retval][out] */ __RPC__out long *vmDeviceNumber);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AttachImage )( 
            __RPC__in IVMDVDDrive * This,
            /* [in] */ __RPC__in BSTR imagePath);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReleaseImage )( 
            __RPC__in IVMDVDDrive * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ImageFile )( 
            __RPC__in IVMDVDDrive * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *imagePath);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AttachHostDrive )( 
            __RPC__in IVMDVDDrive * This,
            /* [in] */ __RPC__in BSTR driveLetter);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReleaseHostDrive )( 
            __RPC__in IVMDVDDrive * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostDriveLetter )( 
            __RPC__in IVMDVDDrive * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *driveLetter);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Attachment )( 
            __RPC__in IVMDVDDrive * This,
            /* [retval][out] */ __RPC__out VMDVDDriveAttachmentType *driveAttachment);
        
        END_INTERFACE
    } IVMDVDDriveVtbl;

    interface IVMDVDDrive
    {
        CONST_VTBL struct IVMDVDDriveVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMDVDDrive_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMDVDDrive_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMDVDDrive_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMDVDDrive_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMDVDDrive_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMDVDDrive_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMDVDDrive_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMDVDDrive_SetBusLocation(This,busNumber,deviceNumber)	\
    ( (This)->lpVtbl -> SetBusLocation(This,busNumber,deviceNumber) ) 

#define IVMDVDDrive_get_BusNumber(This,vmBusNumber)	\
    ( (This)->lpVtbl -> get_BusNumber(This,vmBusNumber) ) 

#define IVMDVDDrive_get_DeviceNumber(This,vmDeviceNumber)	\
    ( (This)->lpVtbl -> get_DeviceNumber(This,vmDeviceNumber) ) 

#define IVMDVDDrive_AttachImage(This,imagePath)	\
    ( (This)->lpVtbl -> AttachImage(This,imagePath) ) 

#define IVMDVDDrive_ReleaseImage(This)	\
    ( (This)->lpVtbl -> ReleaseImage(This) ) 

#define IVMDVDDrive_get_ImageFile(This,imagePath)	\
    ( (This)->lpVtbl -> get_ImageFile(This,imagePath) ) 

#define IVMDVDDrive_AttachHostDrive(This,driveLetter)	\
    ( (This)->lpVtbl -> AttachHostDrive(This,driveLetter) ) 

#define IVMDVDDrive_ReleaseHostDrive(This)	\
    ( (This)->lpVtbl -> ReleaseHostDrive(This) ) 

#define IVMDVDDrive_get_HostDriveLetter(This,driveLetter)	\
    ( (This)->lpVtbl -> get_HostDriveLetter(This,driveLetter) ) 

#define IVMDVDDrive_get_Attachment(This,driveAttachment)	\
    ( (This)->lpVtbl -> get_Attachment(This,driveAttachment) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMDVDDrive_INTERFACE_DEFINED__ */


#ifndef __IVMDVDDriveCollection_INTERFACE_DEFINED__
#define __IVMDVDDriveCollection_INTERFACE_DEFINED__

/* interface IVMDVDDriveCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMDVDDriveCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("bc86e297-e55f-4742-9614-ad11d3131f68")
    IVMDVDDriveCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMDVDDrive **dvdDrive) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMDVDDriveCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMDVDDriveCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMDVDDriveCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMDVDDriveCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMDVDDrive **dvdDrive);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMDVDDriveCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMDVDDriveCollectionVtbl;

    interface IVMDVDDriveCollection
    {
        CONST_VTBL struct IVMDVDDriveCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMDVDDriveCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMDVDDriveCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMDVDDriveCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMDVDDriveCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMDVDDriveCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMDVDDriveCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMDVDDriveCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMDVDDriveCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMDVDDriveCollection_get_Item(This,index,dvdDrive)	\
    ( (This)->lpVtbl -> get_Item(This,index,dvdDrive) ) 

#define IVMDVDDriveCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMDVDDriveCollection_INTERFACE_DEFINED__ */


#ifndef __IVMGuestOS_INTERFACE_DEFINED__
#define __IVMGuestOS_INTERFACE_DEFINED__

/* interface IVMGuestOS */
/* [hidden][unique][helpstring][dual][uuid][object] */ 

typedef struct _GUESTOSVERSIONINFOEX
    {
    long dwOSVersionInfoSize;
    long dwMajorVersion;
    long dwMinorVersion;
    long dwBuildNumber;
    long dwPlatformId;
    wchar_t szCSDVersion[ 128 ];
    short wServicePackMajor;
    short wServicePackMinor;
    short wSuiteMask;
    byte wProductType;
    byte wReserved;
    } 	GUESTOSVERSIONINFOEX;


EXTERN_C const IID IID_IVMGuestOS;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("99fea0db-4880-499a-b6d8-73dff9bc91be")
    IVMGuestOS : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE InstallIntegrationComponents( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetParameter( 
            /* [in] */ __RPC__in BSTR inParameterName,
            /* [in] */ __RPC__in BSTR inParameterValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Shutdown( 
            /* [in] */ VARIANT_BOOL inForced,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **outShutdownTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Restart( 
            /* [in] */ VARIANT_BOOL inForced,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **outRestartTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Logoff( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **outLogoffTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetOsVersionInfo( 
            /* [retval][ref][out] */ __RPC__deref_out_opt GUESTOSVERSIONINFOEX **guestOsVersionInfo) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsHostTimeSyncEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isEnabled) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_IsHostTimeSyncEnabled( 
            /* [in] */ VARIANT_BOOL shouldEnable) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HeartbeatPercentage( 
            /* [retval][out] */ __RPC__out long *heartbeatPercentage) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsHeartbeating( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *heartBeating) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *guestOSName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IntegrationComponentsVersion( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ICVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_CanShutdown( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *canShutdown) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_TerminalServicesInitialized( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *termServStatus) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MultipleUserSessionsAllowed( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sessionStatus) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_TerminalServerPort( 
            /* [retval][out] */ __RPC__out long *tsPort) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSMajorVersion( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *majorVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSMinorVersion( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *minorVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSBuildNumber( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *buildNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSVersion( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *OSVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSPlatformId( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *platformId) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_CSDVersion( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *csdVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ServicePackMajor( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *servicePackMajor) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ServicePackMinor( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *servicePackMinor) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SuiteMask( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *suiteMask) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProductType( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *productType) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetParameter( 
            /* [in] */ __RPC__in BSTR inParameterName,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *outParameterValue) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ComputerName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *guestComputerName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ScreenLocked( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *guestScreenLocked) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsUserLoggedOn( 
            /* [in] */ long inRailSession,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *outSessionPresent) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMGuestOSVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMGuestOS * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMGuestOS * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMGuestOS * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMGuestOS * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *InstallIntegrationComponents )( 
            __RPC__in IVMGuestOS * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetParameter )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ __RPC__in BSTR inParameterName,
            /* [in] */ __RPC__in BSTR inParameterValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ VARIANT_BOOL inForced,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **outShutdownTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Restart )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ VARIANT_BOOL inForced,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **outRestartTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Logoff )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **outLogoffTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetOsVersionInfo )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][ref][out] */ __RPC__deref_out_opt GUESTOSVERSIONINFOEX **guestOsVersionInfo);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsHostTimeSyncEnabled )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isEnabled);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsHostTimeSyncEnabled )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ VARIANT_BOOL shouldEnable);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HeartbeatPercentage )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out long *heartbeatPercentage);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsHeartbeating )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *heartBeating);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSName )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *guestOSName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IntegrationComponentsVersion )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ICVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CanShutdown )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *canShutdown);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TerminalServicesInitialized )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *termServStatus);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MultipleUserSessionsAllowed )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sessionStatus);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_TerminalServerPort )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out long *tsPort);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSMajorVersion )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *majorVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSMinorVersion )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *minorVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSBuildNumber )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *buildNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSVersion )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *OSVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSPlatformId )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *platformId);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CSDVersion )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *csdVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServicePackMajor )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *servicePackMajor);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ServicePackMinor )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *servicePackMinor);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SuiteMask )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *suiteMask);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProductType )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *productType);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetParameter )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ __RPC__in BSTR inParameterName,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *outParameterValue);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ComputerName )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *guestComputerName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ScreenLocked )( 
            __RPC__in IVMGuestOS * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *guestScreenLocked);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsUserLoggedOn )( 
            __RPC__in IVMGuestOS * This,
            /* [in] */ long inRailSession,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *outSessionPresent);
        
        END_INTERFACE
    } IVMGuestOSVtbl;

    interface IVMGuestOS
    {
        CONST_VTBL struct IVMGuestOSVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMGuestOS_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMGuestOS_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMGuestOS_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMGuestOS_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMGuestOS_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMGuestOS_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMGuestOS_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMGuestOS_InstallIntegrationComponents(This)	\
    ( (This)->lpVtbl -> InstallIntegrationComponents(This) ) 

#define IVMGuestOS_SetParameter(This,inParameterName,inParameterValue)	\
    ( (This)->lpVtbl -> SetParameter(This,inParameterName,inParameterValue) ) 

#define IVMGuestOS_Shutdown(This,inForced,outShutdownTask)	\
    ( (This)->lpVtbl -> Shutdown(This,inForced,outShutdownTask) ) 

#define IVMGuestOS_Restart(This,inForced,outRestartTask)	\
    ( (This)->lpVtbl -> Restart(This,inForced,outRestartTask) ) 

#define IVMGuestOS_Logoff(This,outLogoffTask)	\
    ( (This)->lpVtbl -> Logoff(This,outLogoffTask) ) 

#define IVMGuestOS_GetOsVersionInfo(This,guestOsVersionInfo)	\
    ( (This)->lpVtbl -> GetOsVersionInfo(This,guestOsVersionInfo) ) 

#define IVMGuestOS_get_IsHostTimeSyncEnabled(This,isEnabled)	\
    ( (This)->lpVtbl -> get_IsHostTimeSyncEnabled(This,isEnabled) ) 

#define IVMGuestOS_put_IsHostTimeSyncEnabled(This,shouldEnable)	\
    ( (This)->lpVtbl -> put_IsHostTimeSyncEnabled(This,shouldEnable) ) 

#define IVMGuestOS_get_HeartbeatPercentage(This,heartbeatPercentage)	\
    ( (This)->lpVtbl -> get_HeartbeatPercentage(This,heartbeatPercentage) ) 

#define IVMGuestOS_get_IsHeartbeating(This,heartBeating)	\
    ( (This)->lpVtbl -> get_IsHeartbeating(This,heartBeating) ) 

#define IVMGuestOS_get_OSName(This,guestOSName)	\
    ( (This)->lpVtbl -> get_OSName(This,guestOSName) ) 

#define IVMGuestOS_get_IntegrationComponentsVersion(This,ICVersion)	\
    ( (This)->lpVtbl -> get_IntegrationComponentsVersion(This,ICVersion) ) 

#define IVMGuestOS_get_CanShutdown(This,canShutdown)	\
    ( (This)->lpVtbl -> get_CanShutdown(This,canShutdown) ) 

#define IVMGuestOS_get_TerminalServicesInitialized(This,termServStatus)	\
    ( (This)->lpVtbl -> get_TerminalServicesInitialized(This,termServStatus) ) 

#define IVMGuestOS_get_MultipleUserSessionsAllowed(This,sessionStatus)	\
    ( (This)->lpVtbl -> get_MultipleUserSessionsAllowed(This,sessionStatus) ) 

#define IVMGuestOS_get_TerminalServerPort(This,tsPort)	\
    ( (This)->lpVtbl -> get_TerminalServerPort(This,tsPort) ) 

#define IVMGuestOS_get_OSMajorVersion(This,majorVersion)	\
    ( (This)->lpVtbl -> get_OSMajorVersion(This,majorVersion) ) 

#define IVMGuestOS_get_OSMinorVersion(This,minorVersion)	\
    ( (This)->lpVtbl -> get_OSMinorVersion(This,minorVersion) ) 

#define IVMGuestOS_get_OSBuildNumber(This,buildNumber)	\
    ( (This)->lpVtbl -> get_OSBuildNumber(This,buildNumber) ) 

#define IVMGuestOS_get_OSVersion(This,OSVersion)	\
    ( (This)->lpVtbl -> get_OSVersion(This,OSVersion) ) 

#define IVMGuestOS_get_OSPlatformId(This,platformId)	\
    ( (This)->lpVtbl -> get_OSPlatformId(This,platformId) ) 

#define IVMGuestOS_get_CSDVersion(This,csdVersion)	\
    ( (This)->lpVtbl -> get_CSDVersion(This,csdVersion) ) 

#define IVMGuestOS_get_ServicePackMajor(This,servicePackMajor)	\
    ( (This)->lpVtbl -> get_ServicePackMajor(This,servicePackMajor) ) 

#define IVMGuestOS_get_ServicePackMinor(This,servicePackMinor)	\
    ( (This)->lpVtbl -> get_ServicePackMinor(This,servicePackMinor) ) 

#define IVMGuestOS_get_SuiteMask(This,suiteMask)	\
    ( (This)->lpVtbl -> get_SuiteMask(This,suiteMask) ) 

#define IVMGuestOS_get_ProductType(This,productType)	\
    ( (This)->lpVtbl -> get_ProductType(This,productType) ) 

#define IVMGuestOS_GetParameter(This,inParameterName,outParameterValue)	\
    ( (This)->lpVtbl -> GetParameter(This,inParameterName,outParameterValue) ) 

#define IVMGuestOS_get_ComputerName(This,guestComputerName)	\
    ( (This)->lpVtbl -> get_ComputerName(This,guestComputerName) ) 

#define IVMGuestOS_get_ScreenLocked(This,guestScreenLocked)	\
    ( (This)->lpVtbl -> get_ScreenLocked(This,guestScreenLocked) ) 

#define IVMGuestOS_IsUserLoggedOn(This,inRailSession,outSessionPresent)	\
    ( (This)->lpVtbl -> IsUserLoggedOn(This,inRailSession,outSessionPresent) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMGuestOS_INTERFACE_DEFINED__ */


#ifndef __IVMNetworkAdapter_INTERFACE_DEFINED__
#define __IVMNetworkAdapter_INTERFACE_DEFINED__

/* interface IVMNetworkAdapter */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMNetworkAdapter;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("e32e4165-22b8-4dc0-8d57-850171ae207a")
    IVMNetworkAdapter : public IDispatch
    {
    public:
        virtual /* [helpstring][restricted][hidden] */ HRESULT STDMETHODCALLTYPE _ID( 
            /* [out] */ __RPC__out long *identifier) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_VirtualMachine( 
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AttachToVirtualNetwork( 
            /* [in] */ __RPC__in_opt IVMVirtualNetwork *virtualNetwork) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DetachFromVirtualNetwork( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_VirtualNetwork( 
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetwork **virtualNetwork) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_EthernetAddress( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ethernetAddress) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_EthernetAddress( 
            /* [in] */ __RPC__in BSTR ethernetAddress) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsEthernetAddressDynamic( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isDynamic) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_IsEthernetAddressDynamic( 
            /* [in] */ VARIANT_BOOL isDynamic) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMNetworkAdapterVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMNetworkAdapter * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMNetworkAdapter * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMNetworkAdapter * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][restricted][hidden] */ HRESULT ( STDMETHODCALLTYPE *_ID )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [out] */ __RPC__out long *identifier);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VirtualMachine )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AttachToVirtualNetwork )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [in] */ __RPC__in_opt IVMVirtualNetwork *virtualNetwork);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DetachFromVirtualNetwork )( 
            __RPC__in IVMNetworkAdapter * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VirtualNetwork )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetwork **virtualNetwork);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_EthernetAddress )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ethernetAddress);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_EthernetAddress )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [in] */ __RPC__in BSTR ethernetAddress);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsEthernetAddressDynamic )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isDynamic);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_IsEthernetAddressDynamic )( 
            __RPC__in IVMNetworkAdapter * This,
            /* [in] */ VARIANT_BOOL isDynamic);
        
        END_INTERFACE
    } IVMNetworkAdapterVtbl;

    interface IVMNetworkAdapter
    {
        CONST_VTBL struct IVMNetworkAdapterVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMNetworkAdapter_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMNetworkAdapter_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMNetworkAdapter_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMNetworkAdapter_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMNetworkAdapter_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMNetworkAdapter_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMNetworkAdapter_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMNetworkAdapter__ID(This,identifier)	\
    ( (This)->lpVtbl -> _ID(This,identifier) ) 

#define IVMNetworkAdapter_get_VirtualMachine(This,virtualMachine)	\
    ( (This)->lpVtbl -> get_VirtualMachine(This,virtualMachine) ) 

#define IVMNetworkAdapter_AttachToVirtualNetwork(This,virtualNetwork)	\
    ( (This)->lpVtbl -> AttachToVirtualNetwork(This,virtualNetwork) ) 

#define IVMNetworkAdapter_DetachFromVirtualNetwork(This)	\
    ( (This)->lpVtbl -> DetachFromVirtualNetwork(This) ) 

#define IVMNetworkAdapter_get_VirtualNetwork(This,virtualNetwork)	\
    ( (This)->lpVtbl -> get_VirtualNetwork(This,virtualNetwork) ) 

#define IVMNetworkAdapter_get_EthernetAddress(This,ethernetAddress)	\
    ( (This)->lpVtbl -> get_EthernetAddress(This,ethernetAddress) ) 

#define IVMNetworkAdapter_put_EthernetAddress(This,ethernetAddress)	\
    ( (This)->lpVtbl -> put_EthernetAddress(This,ethernetAddress) ) 

#define IVMNetworkAdapter_get_IsEthernetAddressDynamic(This,isDynamic)	\
    ( (This)->lpVtbl -> get_IsEthernetAddressDynamic(This,isDynamic) ) 

#define IVMNetworkAdapter_put_IsEthernetAddressDynamic(This,isDynamic)	\
    ( (This)->lpVtbl -> put_IsEthernetAddressDynamic(This,isDynamic) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMNetworkAdapter_INTERFACE_DEFINED__ */


#ifndef __IVMNetworkAdapterCollection_INTERFACE_DEFINED__
#define __IVMNetworkAdapterCollection_INTERFACE_DEFINED__

/* interface IVMNetworkAdapterCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMNetworkAdapterCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ebaeafe9-ebcd-47cf-866e-ad87d735e479")
    IVMNetworkAdapterCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapter **networkInterface) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMNetworkAdapterCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMNetworkAdapterCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMNetworkAdapterCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMNetworkAdapterCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapter **networkInterface);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMNetworkAdapterCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMNetworkAdapterCollectionVtbl;

    interface IVMNetworkAdapterCollection
    {
        CONST_VTBL struct IVMNetworkAdapterCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMNetworkAdapterCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMNetworkAdapterCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMNetworkAdapterCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMNetworkAdapterCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMNetworkAdapterCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMNetworkAdapterCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMNetworkAdapterCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMNetworkAdapterCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMNetworkAdapterCollection_get_Item(This,index,networkInterface)	\
    ( (This)->lpVtbl -> get_Item(This,index,networkInterface) ) 

#define IVMNetworkAdapterCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMNetworkAdapterCollection_INTERFACE_DEFINED__ */


#ifndef __IVMDisplay_INTERFACE_DEFINED__
#define __IVMDisplay_INTERFACE_DEFINED__

/* interface IVMDisplay */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMDisplay;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("960895e9-f743-4498-96aa-261f867e7fc5")
    IVMDisplay : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetDimensions( 
            /* [in] */ long displayPixelWidth,
            /* [in] */ long displayPixelHeight) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Width( 
            /* [retval][out] */ __RPC__out long *displayPixelWidth) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Height( 
            /* [retval][out] */ __RPC__out long *displayPixelHeight) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_CanResize( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *canResize) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_VideoMode( 
            /* [retval][out] */ __RPC__out VMDisplayVideoMode *videoMode) = 0;
        
        virtual /* [helpstring][restricted][hidden] */ HRESULT STDMETHODCALLTYPE _GenerateThumbnail( 
            /* [out] */ __RPC__out_ecount_full(( 64 * 48 ) ) unsigned long thumbnailImage[ 3072 ]) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Thumbnail( 
            /* [retval][out] */ __RPC__out VARIANT *thumbnailImage) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMDisplayVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMDisplay * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMDisplay * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMDisplay * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMDisplay * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMDisplay * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMDisplay * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMDisplay * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetDimensions )( 
            __RPC__in IVMDisplay * This,
            /* [in] */ long displayPixelWidth,
            /* [in] */ long displayPixelHeight);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Width )( 
            __RPC__in IVMDisplay * This,
            /* [retval][out] */ __RPC__out long *displayPixelWidth);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Height )( 
            __RPC__in IVMDisplay * This,
            /* [retval][out] */ __RPC__out long *displayPixelHeight);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CanResize )( 
            __RPC__in IVMDisplay * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *canResize);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VideoMode )( 
            __RPC__in IVMDisplay * This,
            /* [retval][out] */ __RPC__out VMDisplayVideoMode *videoMode);
        
        /* [helpstring][restricted][hidden] */ HRESULT ( STDMETHODCALLTYPE *_GenerateThumbnail )( 
            __RPC__in IVMDisplay * This,
            /* [out] */ __RPC__out_ecount_full(( 64 * 48 ) ) unsigned long thumbnailImage[ 3072 ]);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Thumbnail )( 
            __RPC__in IVMDisplay * This,
            /* [retval][out] */ __RPC__out VARIANT *thumbnailImage);
        
        END_INTERFACE
    } IVMDisplayVtbl;

    interface IVMDisplay
    {
        CONST_VTBL struct IVMDisplayVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMDisplay_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMDisplay_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMDisplay_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMDisplay_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMDisplay_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMDisplay_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMDisplay_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMDisplay_SetDimensions(This,displayPixelWidth,displayPixelHeight)	\
    ( (This)->lpVtbl -> SetDimensions(This,displayPixelWidth,displayPixelHeight) ) 

#define IVMDisplay_get_Width(This,displayPixelWidth)	\
    ( (This)->lpVtbl -> get_Width(This,displayPixelWidth) ) 

#define IVMDisplay_get_Height(This,displayPixelHeight)	\
    ( (This)->lpVtbl -> get_Height(This,displayPixelHeight) ) 

#define IVMDisplay_get_CanResize(This,canResize)	\
    ( (This)->lpVtbl -> get_CanResize(This,canResize) ) 

#define IVMDisplay_get_VideoMode(This,videoMode)	\
    ( (This)->lpVtbl -> get_VideoMode(This,videoMode) ) 

#define IVMDisplay__GenerateThumbnail(This,thumbnailImage)	\
    ( (This)->lpVtbl -> _GenerateThumbnail(This,thumbnailImage) ) 

#define IVMDisplay_get_Thumbnail(This,thumbnailImage)	\
    ( (This)->lpVtbl -> get_Thumbnail(This,thumbnailImage) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMDisplay_INTERFACE_DEFINED__ */


#ifndef __IVMMouse_INTERFACE_DEFINED__
#define __IVMMouse_INTERFACE_DEFINED__

/* interface IVMMouse */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMMouse;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ac903f6d-6346-4f29-8875-5d511a13895e")
    IVMMouse : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetButton( 
            /* [in] */ VMMouseButton buttonIndex,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isDown) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetButton( 
            /* [in] */ VMMouseButton buttonIndex,
            /* [in] */ VARIANT_BOOL down) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Click( 
            /* [in] */ VMMouseButton buttonIndex) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HorizontalPosition( 
            /* [retval][out] */ __RPC__out long *position) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_HorizontalPosition( 
            /* [in] */ long position) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_VerticalPosition( 
            /* [retval][out] */ __RPC__out long *position) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_VerticalPosition( 
            /* [in] */ long position) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_ScrollWheelPosition( 
            /* [in] */ long position) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UsingAbsoluteCoordinates( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *usingAbsoluteCoordinates) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_UsingAbsoluteCoordinates( 
            /* [in] */ VARIANT_BOOL usingAbsoluteCoordinates) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMMouseVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMMouse * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMMouse * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMMouse * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMMouse * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMMouse * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMMouse * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMMouse * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetButton )( 
            __RPC__in IVMMouse * This,
            /* [in] */ VMMouseButton buttonIndex,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isDown);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetButton )( 
            __RPC__in IVMMouse * This,
            /* [in] */ VMMouseButton buttonIndex,
            /* [in] */ VARIANT_BOOL down);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Click )( 
            __RPC__in IVMMouse * This,
            /* [in] */ VMMouseButton buttonIndex);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HorizontalPosition )( 
            __RPC__in IVMMouse * This,
            /* [retval][out] */ __RPC__out long *position);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_HorizontalPosition )( 
            __RPC__in IVMMouse * This,
            /* [in] */ long position);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VerticalPosition )( 
            __RPC__in IVMMouse * This,
            /* [retval][out] */ __RPC__out long *position);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_VerticalPosition )( 
            __RPC__in IVMMouse * This,
            /* [in] */ long position);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ScrollWheelPosition )( 
            __RPC__in IVMMouse * This,
            /* [in] */ long position);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UsingAbsoluteCoordinates )( 
            __RPC__in IVMMouse * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *usingAbsoluteCoordinates);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UsingAbsoluteCoordinates )( 
            __RPC__in IVMMouse * This,
            /* [in] */ VARIANT_BOOL usingAbsoluteCoordinates);
        
        END_INTERFACE
    } IVMMouseVtbl;

    interface IVMMouse
    {
        CONST_VTBL struct IVMMouseVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMMouse_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMMouse_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMMouse_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMMouse_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMMouse_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMMouse_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMMouse_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMMouse_GetButton(This,buttonIndex,isDown)	\
    ( (This)->lpVtbl -> GetButton(This,buttonIndex,isDown) ) 

#define IVMMouse_SetButton(This,buttonIndex,down)	\
    ( (This)->lpVtbl -> SetButton(This,buttonIndex,down) ) 

#define IVMMouse_Click(This,buttonIndex)	\
    ( (This)->lpVtbl -> Click(This,buttonIndex) ) 

#define IVMMouse_get_HorizontalPosition(This,position)	\
    ( (This)->lpVtbl -> get_HorizontalPosition(This,position) ) 

#define IVMMouse_put_HorizontalPosition(This,position)	\
    ( (This)->lpVtbl -> put_HorizontalPosition(This,position) ) 

#define IVMMouse_get_VerticalPosition(This,position)	\
    ( (This)->lpVtbl -> get_VerticalPosition(This,position) ) 

#define IVMMouse_put_VerticalPosition(This,position)	\
    ( (This)->lpVtbl -> put_VerticalPosition(This,position) ) 

#define IVMMouse_put_ScrollWheelPosition(This,position)	\
    ( (This)->lpVtbl -> put_ScrollWheelPosition(This,position) ) 

#define IVMMouse_get_UsingAbsoluteCoordinates(This,usingAbsoluteCoordinates)	\
    ( (This)->lpVtbl -> get_UsingAbsoluteCoordinates(This,usingAbsoluteCoordinates) ) 

#define IVMMouse_put_UsingAbsoluteCoordinates(This,usingAbsoluteCoordinates)	\
    ( (This)->lpVtbl -> put_UsingAbsoluteCoordinates(This,usingAbsoluteCoordinates) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMMouse_INTERFACE_DEFINED__ */


#ifndef __IVMKeyboard_INTERFACE_DEFINED__
#define __IVMKeyboard_INTERFACE_DEFINED__

/* interface IVMKeyboard */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMKeyboard;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("00695f2e-c5ad-4d6e-b1ab-336ed121f8c4")
    IVMKeyboard : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE PressKey( 
            /* [in] */ __RPC__in BSTR key) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ReleaseKey( 
            /* [in] */ __RPC__in BSTR key) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE PressAndReleaseKey( 
            /* [in] */ __RPC__in BSTR key) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsPressed( 
            /* [in] */ __RPC__in BSTR key,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pressed) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE TypeAsciiText( 
            /* [in] */ __RPC__in BSTR text) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE TypeKeySequence( 
            /* [in] */ __RPC__in BSTR keySequence) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HasExclusiveAccess( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isExclusive) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_HasExclusiveAccess( 
            /* [in] */ VARIANT_BOOL makeExclusive) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMKeyboardVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMKeyboard * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMKeyboard * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMKeyboard * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMKeyboard * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *PressKey )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in BSTR key);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ReleaseKey )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in BSTR key);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *PressAndReleaseKey )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in BSTR key);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsPressed )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in BSTR key,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pressed);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *TypeAsciiText )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in BSTR text);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *TypeKeySequence )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ __RPC__in BSTR keySequence);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HasExclusiveAccess )( 
            __RPC__in IVMKeyboard * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isExclusive);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_HasExclusiveAccess )( 
            __RPC__in IVMKeyboard * This,
            /* [in] */ VARIANT_BOOL makeExclusive);
        
        END_INTERFACE
    } IVMKeyboardVtbl;

    interface IVMKeyboard
    {
        CONST_VTBL struct IVMKeyboardVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMKeyboard_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMKeyboard_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMKeyboard_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMKeyboard_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMKeyboard_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMKeyboard_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMKeyboard_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMKeyboard_PressKey(This,key)	\
    ( (This)->lpVtbl -> PressKey(This,key) ) 

#define IVMKeyboard_ReleaseKey(This,key)	\
    ( (This)->lpVtbl -> ReleaseKey(This,key) ) 

#define IVMKeyboard_PressAndReleaseKey(This,key)	\
    ( (This)->lpVtbl -> PressAndReleaseKey(This,key) ) 

#define IVMKeyboard_IsPressed(This,key,pressed)	\
    ( (This)->lpVtbl -> IsPressed(This,key,pressed) ) 

#define IVMKeyboard_TypeAsciiText(This,text)	\
    ( (This)->lpVtbl -> TypeAsciiText(This,text) ) 

#define IVMKeyboard_TypeKeySequence(This,keySequence)	\
    ( (This)->lpVtbl -> TypeKeySequence(This,keySequence) ) 

#define IVMKeyboard_get_HasExclusiveAccess(This,isExclusive)	\
    ( (This)->lpVtbl -> get_HasExclusiveAccess(This,isExclusive) ) 

#define IVMKeyboard_put_HasExclusiveAccess(This,makeExclusive)	\
    ( (This)->lpVtbl -> put_HasExclusiveAccess(This,makeExclusive) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMKeyboard_INTERFACE_DEFINED__ */


#ifndef __IVMParallelPort_INTERFACE_DEFINED__
#define __IVMParallelPort_INTERFACE_DEFINED__

/* interface IVMParallelPort */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMParallelPort;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("097beecb-0a02-474f-abd6-298b22293fc6")
    IVMParallelPort : public IDispatch
    {
    public:
        virtual /* [helpstring][restricted][hidden] */ HRESULT STDMETHODCALLTYPE _ID( 
            /* [out] */ __RPC__out long *portID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *portName) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Name( 
            /* [in] */ __RPC__in BSTR portName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMParallelPortVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMParallelPort * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMParallelPort * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMParallelPort * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMParallelPort * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMParallelPort * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMParallelPort * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMParallelPort * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][restricted][hidden] */ HRESULT ( STDMETHODCALLTYPE *_ID )( 
            __RPC__in IVMParallelPort * This,
            /* [out] */ __RPC__out long *portID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            __RPC__in IVMParallelPort * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *portName);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Name )( 
            __RPC__in IVMParallelPort * This,
            /* [in] */ __RPC__in BSTR portName);
        
        END_INTERFACE
    } IVMParallelPortVtbl;

    interface IVMParallelPort
    {
        CONST_VTBL struct IVMParallelPortVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMParallelPort_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMParallelPort_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMParallelPort_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMParallelPort_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMParallelPort_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMParallelPort_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMParallelPort_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMParallelPort__ID(This,portID)	\
    ( (This)->lpVtbl -> _ID(This,portID) ) 

#define IVMParallelPort_get_Name(This,portName)	\
    ( (This)->lpVtbl -> get_Name(This,portName) ) 

#define IVMParallelPort_put_Name(This,portName)	\
    ( (This)->lpVtbl -> put_Name(This,portName) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMParallelPort_INTERFACE_DEFINED__ */


#ifndef __IVMParallelPortCollection_INTERFACE_DEFINED__
#define __IVMParallelPortCollection_INTERFACE_DEFINED__

/* interface IVMParallelPortCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMParallelPortCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("27c3e036-198f-430c-8735-6e652f7203fd")
    IVMParallelPortCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMParallelPort **vmParallelPort) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMParallelPortCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMParallelPortCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMParallelPortCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMParallelPortCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMParallelPort **vmParallelPort);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMParallelPortCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMParallelPortCollectionVtbl;

    interface IVMParallelPortCollection
    {
        CONST_VTBL struct IVMParallelPortCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMParallelPortCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMParallelPortCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMParallelPortCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMParallelPortCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMParallelPortCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMParallelPortCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMParallelPortCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMParallelPortCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMParallelPortCollection_get_Item(This,index,vmParallelPort)	\
    ( (This)->lpVtbl -> get_Item(This,index,vmParallelPort) ) 

#define IVMParallelPortCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMParallelPortCollection_INTERFACE_DEFINED__ */


#ifndef __IVMSerialPort_INTERFACE_DEFINED__
#define __IVMSerialPort_INTERFACE_DEFINED__

/* interface IVMSerialPort */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMSerialPort;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("2ce4460d-1d3f-4458-bf8b-44084b816815")
    IVMSerialPort : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Configure( 
            /* [in] */ VMSerialPortType portType,
            /* [in] */ __RPC__in BSTR portName,
            /* [in] */ VARIANT_BOOL vmConnectImmediately) = 0;
        
        virtual /* [helpstring][restricted][hidden] */ HRESULT STDMETHODCALLTYPE _ID( 
            /* [out] */ __RPC__out long *portID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Type( 
            /* [retval][out] */ __RPC__out VMSerialPortType *portType) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *portName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ConnectImmediately( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *vmConnectImmediately) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMSerialPortVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMSerialPort * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMSerialPort * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMSerialPort * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMSerialPort * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMSerialPort * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMSerialPort * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMSerialPort * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Configure )( 
            __RPC__in IVMSerialPort * This,
            /* [in] */ VMSerialPortType portType,
            /* [in] */ __RPC__in BSTR portName,
            /* [in] */ VARIANT_BOOL vmConnectImmediately);
        
        /* [helpstring][restricted][hidden] */ HRESULT ( STDMETHODCALLTYPE *_ID )( 
            __RPC__in IVMSerialPort * This,
            /* [out] */ __RPC__out long *portID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            __RPC__in IVMSerialPort * This,
            /* [retval][out] */ __RPC__out VMSerialPortType *portType);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            __RPC__in IVMSerialPort * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *portName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ConnectImmediately )( 
            __RPC__in IVMSerialPort * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *vmConnectImmediately);
        
        END_INTERFACE
    } IVMSerialPortVtbl;

    interface IVMSerialPort
    {
        CONST_VTBL struct IVMSerialPortVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMSerialPort_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMSerialPort_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMSerialPort_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMSerialPort_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMSerialPort_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMSerialPort_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMSerialPort_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMSerialPort_Configure(This,portType,portName,vmConnectImmediately)	\
    ( (This)->lpVtbl -> Configure(This,portType,portName,vmConnectImmediately) ) 

#define IVMSerialPort__ID(This,portID)	\
    ( (This)->lpVtbl -> _ID(This,portID) ) 

#define IVMSerialPort_get_Type(This,portType)	\
    ( (This)->lpVtbl -> get_Type(This,portType) ) 

#define IVMSerialPort_get_Name(This,portName)	\
    ( (This)->lpVtbl -> get_Name(This,portName) ) 

#define IVMSerialPort_get_ConnectImmediately(This,vmConnectImmediately)	\
    ( (This)->lpVtbl -> get_ConnectImmediately(This,vmConnectImmediately) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMSerialPort_INTERFACE_DEFINED__ */


#ifndef __IVMSerialPortCollection_INTERFACE_DEFINED__
#define __IVMSerialPortCollection_INTERFACE_DEFINED__

/* interface IVMSerialPortCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMSerialPortCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("dd3c6175-1f04-4341-9f85-104074880289")
    IVMSerialPortCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMSerialPort **serialPort) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMSerialPortCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMSerialPortCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMSerialPortCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMSerialPortCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMSerialPort **serialPort);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMSerialPortCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMSerialPortCollectionVtbl;

    interface IVMSerialPortCollection
    {
        CONST_VTBL struct IVMSerialPortCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMSerialPortCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMSerialPortCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMSerialPortCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMSerialPortCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMSerialPortCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMSerialPortCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMSerialPortCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMSerialPortCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMSerialPortCollection_get_Item(This,index,serialPort)	\
    ( (This)->lpVtbl -> get_Item(This,index,serialPort) ) 

#define IVMSerialPortCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMSerialPortCollection_INTERFACE_DEFINED__ */


#ifndef __IVMTask_INTERFACE_DEFINED__
#define __IVMTask_INTERFACE_DEFINED__

/* interface IVMTask */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMTask;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ab72b222-6e9c-48ae-aa54-85e3e635767c")
    IVMTask : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE WaitForCompletion( 
            /* [in] */ long timeout) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Cancel( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_PercentCompleted( 
            /* [retval][out] */ __RPC__out long *percentCompleted) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Description( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *description) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Result( 
            /* [retval][out] */ __RPC__out VMTaskResult *result) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsCancelable( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isCancelable) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ID( 
            /* [retval][out] */ __RPC__out long *ID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsComplete( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isComplete) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Error( 
            /* [retval][out] */ __RPC__out long *outError) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ErrorDescription( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *outErrorDesc) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMTaskVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMTask * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMTask * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMTask * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMTask * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMTask * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMTask * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMTask * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *WaitForCompletion )( 
            __RPC__in IVMTask * This,
            /* [in] */ long timeout);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Cancel )( 
            __RPC__in IVMTask * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PercentCompleted )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__out long *percentCompleted);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Description )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *description);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Result )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__out VMTaskResult *result);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsCancelable )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isCancelable);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ID )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__out long *ID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsComplete )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isComplete);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Error )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__out long *outError);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ErrorDescription )( 
            __RPC__in IVMTask * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *outErrorDesc);
        
        END_INTERFACE
    } IVMTaskVtbl;

    interface IVMTask
    {
        CONST_VTBL struct IVMTaskVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMTask_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMTask_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMTask_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMTask_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMTask_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMTask_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMTask_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMTask_WaitForCompletion(This,timeout)	\
    ( (This)->lpVtbl -> WaitForCompletion(This,timeout) ) 

#define IVMTask_Cancel(This)	\
    ( (This)->lpVtbl -> Cancel(This) ) 

#define IVMTask_get_PercentCompleted(This,percentCompleted)	\
    ( (This)->lpVtbl -> get_PercentCompleted(This,percentCompleted) ) 

#define IVMTask_get_Description(This,description)	\
    ( (This)->lpVtbl -> get_Description(This,description) ) 

#define IVMTask_get_Result(This,result)	\
    ( (This)->lpVtbl -> get_Result(This,result) ) 

#define IVMTask_get_IsCancelable(This,isCancelable)	\
    ( (This)->lpVtbl -> get_IsCancelable(This,isCancelable) ) 

#define IVMTask_get_ID(This,ID)	\
    ( (This)->lpVtbl -> get_ID(This,ID) ) 

#define IVMTask_get_IsComplete(This,isComplete)	\
    ( (This)->lpVtbl -> get_IsComplete(This,isComplete) ) 

#define IVMTask_get_Error(This,outError)	\
    ( (This)->lpVtbl -> get_Error(This,outError) ) 

#define IVMTask_get_ErrorDescription(This,outErrorDesc)	\
    ( (This)->lpVtbl -> get_ErrorDescription(This,outErrorDesc) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMTask_INTERFACE_DEFINED__ */


#ifndef __IVMUSBDevice_INTERFACE_DEFINED__
#define __IVMUSBDevice_INTERFACE_DEFINED__

/* interface IVMUSBDevice */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMUSBDevice;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("63C1258C-5721-4070-B86B-A6CE2AFEC0B3")
    IVMUSBDevice : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DeviceString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *deviceName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ManufacturerString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *manufacturerName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_AttachedToVM( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ConfigName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HubID( 
            /* [retval][out] */ __RPC__out long *hubID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Port( 
            /* [retval][out] */ __RPC__out long *port) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DeviceClass( 
            /* [retval][out] */ __RPC__out VMUSBDeviceClassEnum *deviceClass) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMUSBDeviceVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMUSBDevice * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMUSBDevice * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMUSBDevice * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMUSBDevice * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMUSBDevice * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMUSBDevice * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMUSBDevice * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DeviceString )( 
            __RPC__in IVMUSBDevice * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *deviceName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ManufacturerString )( 
            __RPC__in IVMUSBDevice * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *manufacturerName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AttachedToVM )( 
            __RPC__in IVMUSBDevice * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ConfigName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HubID )( 
            __RPC__in IVMUSBDevice * This,
            /* [retval][out] */ __RPC__out long *hubID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Port )( 
            __RPC__in IVMUSBDevice * This,
            /* [retval][out] */ __RPC__out long *port);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DeviceClass )( 
            __RPC__in IVMUSBDevice * This,
            /* [retval][out] */ __RPC__out VMUSBDeviceClassEnum *deviceClass);
        
        END_INTERFACE
    } IVMUSBDeviceVtbl;

    interface IVMUSBDevice
    {
        CONST_VTBL struct IVMUSBDeviceVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMUSBDevice_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMUSBDevice_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMUSBDevice_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMUSBDevice_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMUSBDevice_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMUSBDevice_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMUSBDevice_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMUSBDevice_get_DeviceString(This,deviceName)	\
    ( (This)->lpVtbl -> get_DeviceString(This,deviceName) ) 

#define IVMUSBDevice_get_ManufacturerString(This,manufacturerName)	\
    ( (This)->lpVtbl -> get_ManufacturerString(This,manufacturerName) ) 

#define IVMUSBDevice_get_AttachedToVM(This,ConfigName)	\
    ( (This)->lpVtbl -> get_AttachedToVM(This,ConfigName) ) 

#define IVMUSBDevice_get_HubID(This,hubID)	\
    ( (This)->lpVtbl -> get_HubID(This,hubID) ) 

#define IVMUSBDevice_get_Port(This,port)	\
    ( (This)->lpVtbl -> get_Port(This,port) ) 

#define IVMUSBDevice_get_DeviceClass(This,deviceClass)	\
    ( (This)->lpVtbl -> get_DeviceClass(This,deviceClass) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMUSBDevice_INTERFACE_DEFINED__ */


#ifndef __IVMUSBDeviceCollection_INTERFACE_DEFINED__
#define __IVMUSBDeviceCollection_INTERFACE_DEFINED__

/* interface IVMUSBDeviceCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMUSBDeviceCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4FBCD6A5-F53C-4d1c-9F4D-E90ABB8B3749")
    IVMUSBDeviceCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMUSBDevice **usbDevice) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMUSBDeviceCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMUSBDeviceCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMUSBDeviceCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMUSBDeviceCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMUSBDevice **usbDevice);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMUSBDeviceCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMUSBDeviceCollectionVtbl;

    interface IVMUSBDeviceCollection
    {
        CONST_VTBL struct IVMUSBDeviceCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMUSBDeviceCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMUSBDeviceCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMUSBDeviceCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMUSBDeviceCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMUSBDeviceCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMUSBDeviceCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMUSBDeviceCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMUSBDeviceCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMUSBDeviceCollection_get_Item(This,index,usbDevice)	\
    ( (This)->lpVtbl -> get_Item(This,index,usbDevice) ) 

#define IVMUSBDeviceCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMUSBDeviceCollection_INTERFACE_DEFINED__ */


#ifndef __IVMVirtualMachine_INTERFACE_DEFINED__
#define __IVMVirtualMachine_INTERFACE_DEFINED__

/* interface IVMVirtualMachine */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMVirtualMachine;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("f7092aa1-33ed-4f78-a59f-c00adfc2edd7")
    IVMVirtualMachine : public IDispatch
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineName) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Name( 
            /* [in] */ __RPC__in BSTR virtualMachineName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ConfigID( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineConfigID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_File( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineXMLFile) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Accountant( 
            /* [retval][out] */ __RPC__deref_out_opt IVMAccountant **accountant) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_GuestOS( 
            /* [retval][out] */ __RPC__deref_out_opt IVMGuestOS **guestOS) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Display( 
            /* [retval][out] */ __RPC__deref_out_opt IVMDisplay **display) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Keyboard( 
            /* [retval][out] */ __RPC__deref_out_opt IVMKeyboard **keyboard) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Mouse( 
            /* [retval][out] */ __RPC__deref_out_opt IVMMouse **mouse) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Startup( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **startupTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Startup2( 
            /* [in] */ VMStartupOption startupOption,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **startupTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE TurnOff( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **turnOffTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Save( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **saveTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reset( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **resetTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DiscardSavedState( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Pause( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Resume( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_State( 
            /* [retval][out] */ __RPC__out VMVMState *virtualMachineState) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ShutdownActionOnQuit( 
            /* [retval][out] */ __RPC__out VMShutdownAction *shutdownAction) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_ShutdownActionOnQuit( 
            /* [in] */ VMShutdownAction shutdownAction) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SavedStateFilePath( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *savedStateFilePath) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_BIOSGUID( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *biosGUID) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_BIOSGUID( 
            /* [in] */ __RPC__in BSTR biosGUID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_BIOSSerialNumber( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *biosSerialNumber) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_BIOSSerialNumber( 
            /* [in] */ __RPC__in BSTR biosSerialNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_BaseBoardSerialNumber( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *baseBoardSerialNumber) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_BaseBoardSerialNumber( 
            /* [in] */ __RPC__in BSTR baseBoardSerialNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ChassisSerialNumber( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *chassisSerialNumber) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_ChassisSerialNumber( 
            /* [in] */ __RPC__in BSTR chasisSerialNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ChassisAssetTag( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *chassisAssetTag) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_ChassisAssetTag( 
            /* [in] */ __RPC__in BSTR chassisAssetTag) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AddHardDiskConnection( 
            /* [in] */ __RPC__in BSTR hardDiskPath,
            /* [in] */ long busNumber,
            /* [in] */ long deviceNumber,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDiskConnection **hardDiskConnection) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveHardDiskConnection( 
            /* [in] */ __RPC__in_opt IVMHardDiskConnection *hardDiskConnection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HardDiskConnections( 
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDiskConnectionCollection **hardDiskConnectionCollection) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE MergeUndoDisks( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **undoMergeTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DiscardUndoDisks( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Undoable( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isUndoable) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Undoable( 
            /* [in] */ VARIANT_BOOL enableUndo) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UndoAction( 
            /* [retval][out] */ __RPC__out VMUndoAction *undoAction) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_UndoAction( 
            /* [in] */ VMUndoAction undoAction) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AddDVDROMDrive( 
            /* [in] */ long busNumber,
            /* [in] */ long deviceNumber,
            /* [retval][out] */ __RPC__deref_out_opt IVMDVDDrive **dvdDrive) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveDVDROMDrive( 
            /* [in] */ __RPC__in_opt IVMDVDDrive *dvdDrive) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DVDROMDrives( 
            /* [retval][out] */ __RPC__deref_out_opt IVMDVDDriveCollection **dvdROMCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_FloppyDrives( 
            /* [retval][out] */ __RPC__deref_out_opt IVMFloppyDriveCollection **floppyCollection) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AddNetworkAdapter( 
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapter **networkAdapter) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveNetworkAdapter( 
            /* [in] */ __RPC__in_opt IVMNetworkAdapter *networkAdapter) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_NetworkAdapters( 
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapterCollection **networkAdapterCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SerialPorts( 
            /* [retval][out] */ __RPC__deref_out_opt IVMSerialPortCollection **serialPortCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ParallelPorts( 
            /* [retval][out] */ __RPC__deref_out_opt IVMParallelPortCollection **parallelPortCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorSpeed( 
            /* [retval][out] */ __RPC__out long *processorSpeed) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HasMMX( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *mmxEnabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HasSSE( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sseEnabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HasSSE2( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sse2Enabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Has3DNow( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *threeDNowEnabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_RdpPipeName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *RdpPipeName) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AttachUSBDevice( 
            /* [in] */ __RPC__in_opt IVMUSBDevice *inUSBDevice) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DetachUSBDevice( 
            /* [in] */ __RPC__in_opt IVMUSBDevice *inUSBDevice) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Notes( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineNotes) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Notes( 
            /* [in] */ __RPC__in BSTR virtualMachineNotes) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Memory( 
            /* [retval][out] */ __RPC__out long *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Memory( 
            /* [in] */ long megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_AttachedDriveTypes( 
            /* [retval][out] */ __RPC__out VARIANT *driveTypes) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetConfigurationValue( 
            /* [in] */ __RPC__in BSTR configurationKey,
            /* [retval][out] */ __RPC__out VARIANT *configurationValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetConfigurationValue( 
            /* [in] */ __RPC__in BSTR configurationKey,
            /* [in] */ VARIANT configurationValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveConfigurationValue( 
            /* [in] */ __RPC__in BSTR configurationKey) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetActivationValue( 
            /* [in] */ __RPC__in BSTR activationKey,
            /* [retval][out] */ __RPC__out VARIANT *activationValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetActivationValue( 
            /* [in] */ __RPC__in BSTR activationKey,
            /* [in] */ VARIANT activationValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveActivationValue( 
            /* [in] */ __RPC__in BSTR activationKey) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE StartCommunicationChannel( 
            /* [in] */ VMEndpointType inHostEndpointType,
            /* [in] */ __RPC__in BSTR inHostEndPointName,
            /* [in] */ VMEndpointType inGuestEndpointType,
            /* [in] */ __RPC__in BSTR inGuestEndpointName) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualMachineVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualMachine * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualMachine * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualMachine * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualMachine * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineName);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Name )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR virtualMachineName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ConfigID )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineConfigID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_File )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineXMLFile);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Accountant )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMAccountant **accountant);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_GuestOS )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMGuestOS **guestOS);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Display )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMDisplay **display);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Keyboard )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMKeyboard **keyboard);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Mouse )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMMouse **mouse);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Startup )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **startupTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Startup2 )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ VMStartupOption startupOption,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **startupTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *TurnOff )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **turnOffTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Save )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **saveTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reset )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **resetTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DiscardSavedState )( 
            __RPC__in IVMVirtualMachine * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Pause )( 
            __RPC__in IVMVirtualMachine * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Resume )( 
            __RPC__in IVMVirtualMachine * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_State )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VMVMState *virtualMachineState);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ShutdownActionOnQuit )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VMShutdownAction *shutdownAction);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ShutdownActionOnQuit )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ VMShutdownAction shutdownAction);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SavedStateFilePath )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *savedStateFilePath);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BIOSGUID )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *biosGUID);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BIOSGUID )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR biosGUID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BIOSSerialNumber )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *biosSerialNumber);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BIOSSerialNumber )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR biosSerialNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_BaseBoardSerialNumber )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *baseBoardSerialNumber);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_BaseBoardSerialNumber )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR baseBoardSerialNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ChassisSerialNumber )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *chassisSerialNumber);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ChassisSerialNumber )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR chasisSerialNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ChassisAssetTag )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *chassisAssetTag);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ChassisAssetTag )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR chassisAssetTag);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddHardDiskConnection )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR hardDiskPath,
            /* [in] */ long busNumber,
            /* [in] */ long deviceNumber,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDiskConnection **hardDiskConnection);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveHardDiskConnection )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in_opt IVMHardDiskConnection *hardDiskConnection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HardDiskConnections )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDiskConnectionCollection **hardDiskConnectionCollection);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *MergeUndoDisks )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **undoMergeTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DiscardUndoDisks )( 
            __RPC__in IVMVirtualMachine * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Undoable )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isUndoable);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Undoable )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ VARIANT_BOOL enableUndo);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UndoAction )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VMUndoAction *undoAction);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_UndoAction )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ VMUndoAction undoAction);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddDVDROMDrive )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ long busNumber,
            /* [in] */ long deviceNumber,
            /* [retval][out] */ __RPC__deref_out_opt IVMDVDDrive **dvdDrive);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveDVDROMDrive )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in_opt IVMDVDDrive *dvdDrive);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DVDROMDrives )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMDVDDriveCollection **dvdROMCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FloppyDrives )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMFloppyDriveCollection **floppyCollection);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AddNetworkAdapter )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapter **networkAdapter);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveNetworkAdapter )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in_opt IVMNetworkAdapter *networkAdapter);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NetworkAdapters )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapterCollection **networkAdapterCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SerialPorts )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMSerialPortCollection **serialPortCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ParallelPorts )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMParallelPortCollection **parallelPortCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessorSpeed )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out long *processorSpeed);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HasMMX )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *mmxEnabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HasSSE )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sseEnabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HasSSE2 )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sse2Enabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Has3DNow )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *threeDNowEnabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RdpPipeName )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *RdpPipeName);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AttachUSBDevice )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in_opt IVMUSBDevice *inUSBDevice);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DetachUSBDevice )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in_opt IVMUSBDevice *inUSBDevice);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Notes )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualMachineNotes);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Notes )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR virtualMachineNotes);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Memory )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out long *megabytesOfMemory);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Memory )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ long megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_AttachedDriveTypes )( 
            __RPC__in IVMVirtualMachine * This,
            /* [retval][out] */ __RPC__out VARIANT *driveTypes);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetConfigurationValue )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR configurationKey,
            /* [retval][out] */ __RPC__out VARIANT *configurationValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetConfigurationValue )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR configurationKey,
            /* [in] */ VARIANT configurationValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveConfigurationValue )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR configurationKey);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetActivationValue )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR activationKey,
            /* [retval][out] */ __RPC__out VARIANT *activationValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetActivationValue )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR activationKey,
            /* [in] */ VARIANT activationValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveActivationValue )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ __RPC__in BSTR activationKey);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *StartCommunicationChannel )( 
            __RPC__in IVMVirtualMachine * This,
            /* [in] */ VMEndpointType inHostEndpointType,
            /* [in] */ __RPC__in BSTR inHostEndPointName,
            /* [in] */ VMEndpointType inGuestEndpointType,
            /* [in] */ __RPC__in BSTR inGuestEndpointName);
        
        END_INTERFACE
    } IVMVirtualMachineVtbl;

    interface IVMVirtualMachine
    {
        CONST_VTBL struct IVMVirtualMachineVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualMachine_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualMachine_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualMachine_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualMachine_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualMachine_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualMachine_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualMachine_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMVirtualMachine_get_Name(This,virtualMachineName)	\
    ( (This)->lpVtbl -> get_Name(This,virtualMachineName) ) 

#define IVMVirtualMachine_put_Name(This,virtualMachineName)	\
    ( (This)->lpVtbl -> put_Name(This,virtualMachineName) ) 

#define IVMVirtualMachine_get_ConfigID(This,virtualMachineConfigID)	\
    ( (This)->lpVtbl -> get_ConfigID(This,virtualMachineConfigID) ) 

#define IVMVirtualMachine_get_File(This,virtualMachineXMLFile)	\
    ( (This)->lpVtbl -> get_File(This,virtualMachineXMLFile) ) 

#define IVMVirtualMachine_get_Accountant(This,accountant)	\
    ( (This)->lpVtbl -> get_Accountant(This,accountant) ) 

#define IVMVirtualMachine_get_GuestOS(This,guestOS)	\
    ( (This)->lpVtbl -> get_GuestOS(This,guestOS) ) 

#define IVMVirtualMachine_get_Display(This,display)	\
    ( (This)->lpVtbl -> get_Display(This,display) ) 

#define IVMVirtualMachine_get_Keyboard(This,keyboard)	\
    ( (This)->lpVtbl -> get_Keyboard(This,keyboard) ) 

#define IVMVirtualMachine_get_Mouse(This,mouse)	\
    ( (This)->lpVtbl -> get_Mouse(This,mouse) ) 

#define IVMVirtualMachine_Startup(This,startupTask)	\
    ( (This)->lpVtbl -> Startup(This,startupTask) ) 

#define IVMVirtualMachine_Startup2(This,startupOption,startupTask)	\
    ( (This)->lpVtbl -> Startup2(This,startupOption,startupTask) ) 

#define IVMVirtualMachine_TurnOff(This,turnOffTask)	\
    ( (This)->lpVtbl -> TurnOff(This,turnOffTask) ) 

#define IVMVirtualMachine_Save(This,saveTask)	\
    ( (This)->lpVtbl -> Save(This,saveTask) ) 

#define IVMVirtualMachine_Reset(This,resetTask)	\
    ( (This)->lpVtbl -> Reset(This,resetTask) ) 

#define IVMVirtualMachine_DiscardSavedState(This)	\
    ( (This)->lpVtbl -> DiscardSavedState(This) ) 

#define IVMVirtualMachine_Pause(This)	\
    ( (This)->lpVtbl -> Pause(This) ) 

#define IVMVirtualMachine_Resume(This)	\
    ( (This)->lpVtbl -> Resume(This) ) 

#define IVMVirtualMachine_get_State(This,virtualMachineState)	\
    ( (This)->lpVtbl -> get_State(This,virtualMachineState) ) 

#define IVMVirtualMachine_get_ShutdownActionOnQuit(This,shutdownAction)	\
    ( (This)->lpVtbl -> get_ShutdownActionOnQuit(This,shutdownAction) ) 

#define IVMVirtualMachine_put_ShutdownActionOnQuit(This,shutdownAction)	\
    ( (This)->lpVtbl -> put_ShutdownActionOnQuit(This,shutdownAction) ) 

#define IVMVirtualMachine_get_SavedStateFilePath(This,savedStateFilePath)	\
    ( (This)->lpVtbl -> get_SavedStateFilePath(This,savedStateFilePath) ) 

#define IVMVirtualMachine_get_BIOSGUID(This,biosGUID)	\
    ( (This)->lpVtbl -> get_BIOSGUID(This,biosGUID) ) 

#define IVMVirtualMachine_put_BIOSGUID(This,biosGUID)	\
    ( (This)->lpVtbl -> put_BIOSGUID(This,biosGUID) ) 

#define IVMVirtualMachine_get_BIOSSerialNumber(This,biosSerialNumber)	\
    ( (This)->lpVtbl -> get_BIOSSerialNumber(This,biosSerialNumber) ) 

#define IVMVirtualMachine_put_BIOSSerialNumber(This,biosSerialNumber)	\
    ( (This)->lpVtbl -> put_BIOSSerialNumber(This,biosSerialNumber) ) 

#define IVMVirtualMachine_get_BaseBoardSerialNumber(This,baseBoardSerialNumber)	\
    ( (This)->lpVtbl -> get_BaseBoardSerialNumber(This,baseBoardSerialNumber) ) 

#define IVMVirtualMachine_put_BaseBoardSerialNumber(This,baseBoardSerialNumber)	\
    ( (This)->lpVtbl -> put_BaseBoardSerialNumber(This,baseBoardSerialNumber) ) 

#define IVMVirtualMachine_get_ChassisSerialNumber(This,chassisSerialNumber)	\
    ( (This)->lpVtbl -> get_ChassisSerialNumber(This,chassisSerialNumber) ) 

#define IVMVirtualMachine_put_ChassisSerialNumber(This,chasisSerialNumber)	\
    ( (This)->lpVtbl -> put_ChassisSerialNumber(This,chasisSerialNumber) ) 

#define IVMVirtualMachine_get_ChassisAssetTag(This,chassisAssetTag)	\
    ( (This)->lpVtbl -> get_ChassisAssetTag(This,chassisAssetTag) ) 

#define IVMVirtualMachine_put_ChassisAssetTag(This,chassisAssetTag)	\
    ( (This)->lpVtbl -> put_ChassisAssetTag(This,chassisAssetTag) ) 

#define IVMVirtualMachine_AddHardDiskConnection(This,hardDiskPath,busNumber,deviceNumber,hardDiskConnection)	\
    ( (This)->lpVtbl -> AddHardDiskConnection(This,hardDiskPath,busNumber,deviceNumber,hardDiskConnection) ) 

#define IVMVirtualMachine_RemoveHardDiskConnection(This,hardDiskConnection)	\
    ( (This)->lpVtbl -> RemoveHardDiskConnection(This,hardDiskConnection) ) 

#define IVMVirtualMachine_get_HardDiskConnections(This,hardDiskConnectionCollection)	\
    ( (This)->lpVtbl -> get_HardDiskConnections(This,hardDiskConnectionCollection) ) 

#define IVMVirtualMachine_MergeUndoDisks(This,undoMergeTask)	\
    ( (This)->lpVtbl -> MergeUndoDisks(This,undoMergeTask) ) 

#define IVMVirtualMachine_DiscardUndoDisks(This)	\
    ( (This)->lpVtbl -> DiscardUndoDisks(This) ) 

#define IVMVirtualMachine_get_Undoable(This,isUndoable)	\
    ( (This)->lpVtbl -> get_Undoable(This,isUndoable) ) 

#define IVMVirtualMachine_put_Undoable(This,enableUndo)	\
    ( (This)->lpVtbl -> put_Undoable(This,enableUndo) ) 

#define IVMVirtualMachine_get_UndoAction(This,undoAction)	\
    ( (This)->lpVtbl -> get_UndoAction(This,undoAction) ) 

#define IVMVirtualMachine_put_UndoAction(This,undoAction)	\
    ( (This)->lpVtbl -> put_UndoAction(This,undoAction) ) 

#define IVMVirtualMachine_AddDVDROMDrive(This,busNumber,deviceNumber,dvdDrive)	\
    ( (This)->lpVtbl -> AddDVDROMDrive(This,busNumber,deviceNumber,dvdDrive) ) 

#define IVMVirtualMachine_RemoveDVDROMDrive(This,dvdDrive)	\
    ( (This)->lpVtbl -> RemoveDVDROMDrive(This,dvdDrive) ) 

#define IVMVirtualMachine_get_DVDROMDrives(This,dvdROMCollection)	\
    ( (This)->lpVtbl -> get_DVDROMDrives(This,dvdROMCollection) ) 

#define IVMVirtualMachine_get_FloppyDrives(This,floppyCollection)	\
    ( (This)->lpVtbl -> get_FloppyDrives(This,floppyCollection) ) 

#define IVMVirtualMachine_AddNetworkAdapter(This,networkAdapter)	\
    ( (This)->lpVtbl -> AddNetworkAdapter(This,networkAdapter) ) 

#define IVMVirtualMachine_RemoveNetworkAdapter(This,networkAdapter)	\
    ( (This)->lpVtbl -> RemoveNetworkAdapter(This,networkAdapter) ) 

#define IVMVirtualMachine_get_NetworkAdapters(This,networkAdapterCollection)	\
    ( (This)->lpVtbl -> get_NetworkAdapters(This,networkAdapterCollection) ) 

#define IVMVirtualMachine_get_SerialPorts(This,serialPortCollection)	\
    ( (This)->lpVtbl -> get_SerialPorts(This,serialPortCollection) ) 

#define IVMVirtualMachine_get_ParallelPorts(This,parallelPortCollection)	\
    ( (This)->lpVtbl -> get_ParallelPorts(This,parallelPortCollection) ) 

#define IVMVirtualMachine_get_ProcessorSpeed(This,processorSpeed)	\
    ( (This)->lpVtbl -> get_ProcessorSpeed(This,processorSpeed) ) 

#define IVMVirtualMachine_get_HasMMX(This,mmxEnabled)	\
    ( (This)->lpVtbl -> get_HasMMX(This,mmxEnabled) ) 

#define IVMVirtualMachine_get_HasSSE(This,sseEnabled)	\
    ( (This)->lpVtbl -> get_HasSSE(This,sseEnabled) ) 

#define IVMVirtualMachine_get_HasSSE2(This,sse2Enabled)	\
    ( (This)->lpVtbl -> get_HasSSE2(This,sse2Enabled) ) 

#define IVMVirtualMachine_get_Has3DNow(This,threeDNowEnabled)	\
    ( (This)->lpVtbl -> get_Has3DNow(This,threeDNowEnabled) ) 

#define IVMVirtualMachine_get_RdpPipeName(This,RdpPipeName)	\
    ( (This)->lpVtbl -> get_RdpPipeName(This,RdpPipeName) ) 

#define IVMVirtualMachine_AttachUSBDevice(This,inUSBDevice)	\
    ( (This)->lpVtbl -> AttachUSBDevice(This,inUSBDevice) ) 

#define IVMVirtualMachine_DetachUSBDevice(This,inUSBDevice)	\
    ( (This)->lpVtbl -> DetachUSBDevice(This,inUSBDevice) ) 

#define IVMVirtualMachine_get_Notes(This,virtualMachineNotes)	\
    ( (This)->lpVtbl -> get_Notes(This,virtualMachineNotes) ) 

#define IVMVirtualMachine_put_Notes(This,virtualMachineNotes)	\
    ( (This)->lpVtbl -> put_Notes(This,virtualMachineNotes) ) 

#define IVMVirtualMachine_get_Memory(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_Memory(This,megabytesOfMemory) ) 

#define IVMVirtualMachine_put_Memory(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> put_Memory(This,megabytesOfMemory) ) 

#define IVMVirtualMachine_get_AttachedDriveTypes(This,driveTypes)	\
    ( (This)->lpVtbl -> get_AttachedDriveTypes(This,driveTypes) ) 

#define IVMVirtualMachine_GetConfigurationValue(This,configurationKey,configurationValue)	\
    ( (This)->lpVtbl -> GetConfigurationValue(This,configurationKey,configurationValue) ) 

#define IVMVirtualMachine_SetConfigurationValue(This,configurationKey,configurationValue)	\
    ( (This)->lpVtbl -> SetConfigurationValue(This,configurationKey,configurationValue) ) 

#define IVMVirtualMachine_RemoveConfigurationValue(This,configurationKey)	\
    ( (This)->lpVtbl -> RemoveConfigurationValue(This,configurationKey) ) 

#define IVMVirtualMachine_GetActivationValue(This,activationKey,activationValue)	\
    ( (This)->lpVtbl -> GetActivationValue(This,activationKey,activationValue) ) 

#define IVMVirtualMachine_SetActivationValue(This,activationKey,activationValue)	\
    ( (This)->lpVtbl -> SetActivationValue(This,activationKey,activationValue) ) 

#define IVMVirtualMachine_RemoveActivationValue(This,activationKey)	\
    ( (This)->lpVtbl -> RemoveActivationValue(This,activationKey) ) 

#define IVMVirtualMachine_StartCommunicationChannel(This,inHostEndpointType,inHostEndPointName,inGuestEndpointType,inGuestEndpointName)	\
    ( (This)->lpVtbl -> StartCommunicationChannel(This,inHostEndpointType,inHostEndPointName,inGuestEndpointType,inGuestEndpointName) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMVirtualMachine_INTERFACE_DEFINED__ */


#ifndef __IVMVirtualMachineEvents_DISPINTERFACE_DEFINED__
#define __IVMVirtualMachineEvents_DISPINTERFACE_DEFINED__

/* dispinterface IVMVirtualMachineEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID_IVMVirtualMachineEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("9d84f560-bb67-4961-bd12-a4da780c67e4")
    IVMVirtualMachineEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualMachineEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualMachineEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualMachineEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualMachineEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualMachineEvents * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualMachineEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualMachineEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualMachineEvents * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IVMVirtualMachineEventsVtbl;

    interface IVMVirtualMachineEvents
    {
        CONST_VTBL struct IVMVirtualMachineEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualMachineEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualMachineEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualMachineEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualMachineEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualMachineEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualMachineEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualMachineEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* __IVMVirtualMachineEvents_DISPINTERFACE_DEFINED__ */


#ifndef __IVMVirtualMachineCollection_INTERFACE_DEFINED__
#define __IVMVirtualMachineCollection_INTERFACE_DEFINED__

/* interface IVMVirtualMachineCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMVirtualMachineCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("59f31786-2a3d-4fbf-9896-d85338ca0da1")
    IVMVirtualMachineCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualMachineCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualMachineCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualMachineCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualMachineCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMVirtualMachineCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMVirtualMachineCollectionVtbl;

    interface IVMVirtualMachineCollection
    {
        CONST_VTBL struct IVMVirtualMachineCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualMachineCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualMachineCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualMachineCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualMachineCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualMachineCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualMachineCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualMachineCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMVirtualMachineCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMVirtualMachineCollection_get_Item(This,index,virtualMachine)	\
    ( (This)->lpVtbl -> get_Item(This,index,virtualMachine) ) 

#define IVMVirtualMachineCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMVirtualMachineCollection_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_VMVirtualMachine;

#ifdef __cplusplus

class DECLSPEC_UUID("83c47dfc-aaeb-4718-9b52-ec74161ebc3d")
VMVirtualMachine;
#endif

#ifndef __IVMSupportDriver_INTERFACE_DEFINED__
#define __IVMSupportDriver_INTERFACE_DEFINED__

/* interface IVMSupportDriver */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMSupportDriver;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("48be8c61-631e-404b-9984-2b051023511a")
    IVMSupportDriver : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Type( 
            /* [retval][out] */ __RPC__out VMSupportDriverType *driverType) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Description( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *description) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Manufacturer( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *manufacturer) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Provider( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *provider) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *version) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Date( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *date) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMSupportDriverVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMSupportDriver * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMSupportDriver * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMSupportDriver * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMSupportDriver * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMSupportDriver * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMSupportDriver * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMSupportDriver * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            __RPC__in IVMSupportDriver * This,
            /* [retval][out] */ __RPC__out VMSupportDriverType *driverType);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Description )( 
            __RPC__in IVMSupportDriver * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *description);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Manufacturer )( 
            __RPC__in IVMSupportDriver * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *manufacturer);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Provider )( 
            __RPC__in IVMSupportDriver * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *provider);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            __RPC__in IVMSupportDriver * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *version);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Date )( 
            __RPC__in IVMSupportDriver * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *date);
        
        END_INTERFACE
    } IVMSupportDriverVtbl;

    interface IVMSupportDriver
    {
        CONST_VTBL struct IVMSupportDriverVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMSupportDriver_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMSupportDriver_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMSupportDriver_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMSupportDriver_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMSupportDriver_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMSupportDriver_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMSupportDriver_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMSupportDriver_get_Type(This,driverType)	\
    ( (This)->lpVtbl -> get_Type(This,driverType) ) 

#define IVMSupportDriver_get_Description(This,description)	\
    ( (This)->lpVtbl -> get_Description(This,description) ) 

#define IVMSupportDriver_get_Manufacturer(This,manufacturer)	\
    ( (This)->lpVtbl -> get_Manufacturer(This,manufacturer) ) 

#define IVMSupportDriver_get_Provider(This,provider)	\
    ( (This)->lpVtbl -> get_Provider(This,provider) ) 

#define IVMSupportDriver_get_Version(This,version)	\
    ( (This)->lpVtbl -> get_Version(This,version) ) 

#define IVMSupportDriver_get_Date(This,date)	\
    ( (This)->lpVtbl -> get_Date(This,date) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMSupportDriver_INTERFACE_DEFINED__ */


#ifndef __IVMSupportDriverCollection_INTERFACE_DEFINED__
#define __IVMSupportDriverCollection_INTERFACE_DEFINED__

/* interface IVMSupportDriverCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMSupportDriverCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("67f454f1-a69b-4271-953d-ab99e2458650")
    IVMSupportDriverCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMSupportDriver **supportDriver) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMSupportDriverCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMSupportDriverCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMSupportDriverCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMSupportDriverCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMSupportDriver **supportDriver);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMSupportDriverCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMSupportDriverCollectionVtbl;

    interface IVMSupportDriverCollection
    {
        CONST_VTBL struct IVMSupportDriverCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMSupportDriverCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMSupportDriverCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMSupportDriverCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMSupportDriverCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMSupportDriverCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMSupportDriverCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMSupportDriverCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMSupportDriverCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMSupportDriverCollection_get_Item(This,index,supportDriver)	\
    ( (This)->lpVtbl -> get_Item(This,index,supportDriver) ) 

#define IVMSupportDriverCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMSupportDriverCollection_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_VMSupportDriver;

#ifdef __cplusplus

class DECLSPEC_UUID("430985a9-5fec-45f3-8fd3-d9e111d36fc2")
VMSupportDriver;
#endif

#ifndef __IVMHostInfo_INTERFACE_DEFINED__
#define __IVMHostInfo_INTERFACE_DEFINED__

/* interface IVMHostInfo */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMHostInfo;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5b5cf343-05ad-453b-be99-adf4e27b2ebc")
    IVMHostInfo : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_LogicalProcessorCount( 
            /* [retval][out] */ __RPC__out long *processorCount) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_PhysicalProcessorCount( 
            /* [retval][out] */ __RPC__out long *processorCount) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorSpeed( 
            /* [retval][out] */ __RPC__out long *processorSpeed) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorSpeedString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *processorSpeedString) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorManufacturerString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *processorManufacturerString) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorVersionString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *processorVersionString) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ProcessorFeaturesString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *featuresString) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MMX( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *mmxEnabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SSE( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sseEnabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SSE2( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sse2Enabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ThreeDNow( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *threeDNowEnabled) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Memory( 
            /* [retval][out] */ __RPC__out VARIANT *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MemoryTotalString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MemoryAvail( 
            /* [retval][out] */ __RPC__out VARIANT *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MemoryAvailString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OperatingSystem( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *operatingSystem) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSVersionString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *OSVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSMajorVersion( 
            /* [retval][out] */ __RPC__out long *osMajorVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSMinorVersion( 
            /* [retval][out] */ __RPC__out long *osMinorVersion) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_OSServicePackString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *OSServicePack) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_NetworkAdapters( 
            /* [retval][out] */ __RPC__out VARIANT *hostNICs) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_NetworkAddresses( 
            /* [retval][out] */ __RPC__out VARIANT *hostAddresses) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DVDDrives( 
            /* [retval][out] */ __RPC__out VARIANT *DVDDrives) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_FloppyDrives( 
            /* [retval][out] */ __RPC__out VARIANT *floppyDrives) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SerialPorts( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *serialPorts) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_ParallelPort( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *vmParallelPort) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UTCTime( 
            /* [retval][out] */ __RPC__out DATE *UTCTime) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMHostInfoVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMHostInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMHostInfo * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMHostInfo * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMHostInfo * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMHostInfo * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMHostInfo * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMHostInfo * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_LogicalProcessorCount )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out long *processorCount);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PhysicalProcessorCount )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out long *processorCount);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessorSpeed )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out long *processorSpeed);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessorSpeedString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *processorSpeedString);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessorManufacturerString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *processorManufacturerString);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessorVersionString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *processorVersionString);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ProcessorFeaturesString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *featuresString);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MMX )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *mmxEnabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SSE )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sseEnabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SSE2 )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *sse2Enabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ThreeDNow )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *threeDNowEnabled);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Memory )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MemoryTotalString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MemoryAvail )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MemoryAvailString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OperatingSystem )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *operatingSystem);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSVersionString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *OSVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSMajorVersion )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out long *osMajorVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSMinorVersion )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out long *osMinorVersion);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_OSServicePackString )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *OSServicePack);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NetworkAdapters )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *hostNICs);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NetworkAddresses )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *hostAddresses);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DVDDrives )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *DVDDrives);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FloppyDrives )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out VARIANT *floppyDrives);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SerialPorts )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *serialPorts);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ParallelPort )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *vmParallelPort);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UTCTime )( 
            __RPC__in IVMHostInfo * This,
            /* [retval][out] */ __RPC__out DATE *UTCTime);
        
        END_INTERFACE
    } IVMHostInfoVtbl;

    interface IVMHostInfo
    {
        CONST_VTBL struct IVMHostInfoVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMHostInfo_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMHostInfo_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMHostInfo_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMHostInfo_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMHostInfo_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMHostInfo_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMHostInfo_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMHostInfo_get_LogicalProcessorCount(This,processorCount)	\
    ( (This)->lpVtbl -> get_LogicalProcessorCount(This,processorCount) ) 

#define IVMHostInfo_get_PhysicalProcessorCount(This,processorCount)	\
    ( (This)->lpVtbl -> get_PhysicalProcessorCount(This,processorCount) ) 

#define IVMHostInfo_get_ProcessorSpeed(This,processorSpeed)	\
    ( (This)->lpVtbl -> get_ProcessorSpeed(This,processorSpeed) ) 

#define IVMHostInfo_get_ProcessorSpeedString(This,processorSpeedString)	\
    ( (This)->lpVtbl -> get_ProcessorSpeedString(This,processorSpeedString) ) 

#define IVMHostInfo_get_ProcessorManufacturerString(This,processorManufacturerString)	\
    ( (This)->lpVtbl -> get_ProcessorManufacturerString(This,processorManufacturerString) ) 

#define IVMHostInfo_get_ProcessorVersionString(This,processorVersionString)	\
    ( (This)->lpVtbl -> get_ProcessorVersionString(This,processorVersionString) ) 

#define IVMHostInfo_get_ProcessorFeaturesString(This,featuresString)	\
    ( (This)->lpVtbl -> get_ProcessorFeaturesString(This,featuresString) ) 

#define IVMHostInfo_get_MMX(This,mmxEnabled)	\
    ( (This)->lpVtbl -> get_MMX(This,mmxEnabled) ) 

#define IVMHostInfo_get_SSE(This,sseEnabled)	\
    ( (This)->lpVtbl -> get_SSE(This,sseEnabled) ) 

#define IVMHostInfo_get_SSE2(This,sse2Enabled)	\
    ( (This)->lpVtbl -> get_SSE2(This,sse2Enabled) ) 

#define IVMHostInfo_get_ThreeDNow(This,threeDNowEnabled)	\
    ( (This)->lpVtbl -> get_ThreeDNow(This,threeDNowEnabled) ) 

#define IVMHostInfo_get_Memory(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_Memory(This,megabytesOfMemory) ) 

#define IVMHostInfo_get_MemoryTotalString(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_MemoryTotalString(This,megabytesOfMemory) ) 

#define IVMHostInfo_get_MemoryAvail(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_MemoryAvail(This,megabytesOfMemory) ) 

#define IVMHostInfo_get_MemoryAvailString(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_MemoryAvailString(This,megabytesOfMemory) ) 

#define IVMHostInfo_get_OperatingSystem(This,operatingSystem)	\
    ( (This)->lpVtbl -> get_OperatingSystem(This,operatingSystem) ) 

#define IVMHostInfo_get_OSVersionString(This,OSVersion)	\
    ( (This)->lpVtbl -> get_OSVersionString(This,OSVersion) ) 

#define IVMHostInfo_get_OSMajorVersion(This,osMajorVersion)	\
    ( (This)->lpVtbl -> get_OSMajorVersion(This,osMajorVersion) ) 

#define IVMHostInfo_get_OSMinorVersion(This,osMinorVersion)	\
    ( (This)->lpVtbl -> get_OSMinorVersion(This,osMinorVersion) ) 

#define IVMHostInfo_get_OSServicePackString(This,OSServicePack)	\
    ( (This)->lpVtbl -> get_OSServicePackString(This,OSServicePack) ) 

#define IVMHostInfo_get_NetworkAdapters(This,hostNICs)	\
    ( (This)->lpVtbl -> get_NetworkAdapters(This,hostNICs) ) 

#define IVMHostInfo_get_NetworkAddresses(This,hostAddresses)	\
    ( (This)->lpVtbl -> get_NetworkAddresses(This,hostAddresses) ) 

#define IVMHostInfo_get_DVDDrives(This,DVDDrives)	\
    ( (This)->lpVtbl -> get_DVDDrives(This,DVDDrives) ) 

#define IVMHostInfo_get_FloppyDrives(This,floppyDrives)	\
    ( (This)->lpVtbl -> get_FloppyDrives(This,floppyDrives) ) 

#define IVMHostInfo_get_SerialPorts(This,serialPorts)	\
    ( (This)->lpVtbl -> get_SerialPorts(This,serialPorts) ) 

#define IVMHostInfo_get_ParallelPort(This,vmParallelPort)	\
    ( (This)->lpVtbl -> get_ParallelPort(This,vmParallelPort) ) 

#define IVMHostInfo_get_UTCTime(This,UTCTime)	\
    ( (This)->lpVtbl -> get_UTCTime(This,UTCTime) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMHostInfo_INTERFACE_DEFINED__ */


#ifndef __IVMVirtualNetworkCollection_INTERFACE_DEFINED__
#define __IVMVirtualNetworkCollection_INTERFACE_DEFINED__

/* interface IVMVirtualNetworkCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMVirtualNetworkCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("8ed680be-4242-4b2a-a21c-1982d8b0f675")
    IVMVirtualNetworkCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetwork **virtualNetwork) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualNetworkCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualNetworkCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualNetworkCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualNetworkCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetwork **virtualNetwork);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMVirtualNetworkCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMVirtualNetworkCollectionVtbl;

    interface IVMVirtualNetworkCollection
    {
        CONST_VTBL struct IVMVirtualNetworkCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualNetworkCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualNetworkCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualNetworkCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualNetworkCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualNetworkCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualNetworkCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualNetworkCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMVirtualNetworkCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMVirtualNetworkCollection_get_Item(This,index,virtualNetwork)	\
    ( (This)->lpVtbl -> get_Item(This,index,virtualNetwork) ) 

#define IVMVirtualNetworkCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMVirtualNetworkCollection_INTERFACE_DEFINED__ */


#ifndef __IVMVirtualNetwork_INTERFACE_DEFINED__
#define __IVMVirtualNetwork_INTERFACE_DEFINED__

/* interface IVMVirtualNetwork */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMVirtualNetwork;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("431cb7a1-2469-4563-b94e-38b987adca63")
    IVMVirtualNetwork : public IDispatch
    {
    public:
        virtual /* [helpstring][restricted][hidden] */ HRESULT STDMETHODCALLTYPE _ID( 
            /* [out] */ __RPC__out VARIANT *virtualNetworkID) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualNetworkName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MediaType( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isWireless) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HostAdapter( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *hostAdapter) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_NetworkAdapters( 
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapterCollection **networkInterfaceCollection) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualNetworkVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualNetwork * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualNetwork * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualNetwork * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][restricted][hidden] */ HRESULT ( STDMETHODCALLTYPE *_ID )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [out] */ __RPC__out VARIANT *virtualNetworkID);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualNetworkName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MediaType )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *isWireless);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostAdapter )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *hostAdapter);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_NetworkAdapters )( 
            __RPC__in IVMVirtualNetwork * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapterCollection **networkInterfaceCollection);
        
        END_INTERFACE
    } IVMVirtualNetworkVtbl;

    interface IVMVirtualNetwork
    {
        CONST_VTBL struct IVMVirtualNetworkVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualNetwork_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualNetwork_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualNetwork_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualNetwork_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualNetwork_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualNetwork_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualNetwork_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMVirtualNetwork__ID(This,virtualNetworkID)	\
    ( (This)->lpVtbl -> _ID(This,virtualNetworkID) ) 

#define IVMVirtualNetwork_get_Name(This,virtualNetworkName)	\
    ( (This)->lpVtbl -> get_Name(This,virtualNetworkName) ) 

#define IVMVirtualNetwork_get_MediaType(This,isWireless)	\
    ( (This)->lpVtbl -> get_MediaType(This,isWireless) ) 

#define IVMVirtualNetwork_get_HostAdapter(This,hostAdapter)	\
    ( (This)->lpVtbl -> get_HostAdapter(This,hostAdapter) ) 

#define IVMVirtualNetwork_get_NetworkAdapters(This,networkInterfaceCollection)	\
    ( (This)->lpVtbl -> get_NetworkAdapters(This,networkInterfaceCollection) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMVirtualNetwork_INTERFACE_DEFINED__ */


#ifndef __IVMHardDisk_INTERFACE_DEFINED__
#define __IVMHardDisk_INTERFACE_DEFINED__

/* interface IVMHardDisk */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMHardDisk;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ffa14ae6-48f5-42a4-8a22-186f2e5c7db0")
    IVMHardDisk : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Merge( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **mergeTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE MergeTo( 
            /* [in] */ __RPC__in BSTR newDiskImagePath,
            /* [in] */ VMHardDiskType newDiskImageType,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **mergeTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Compact( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **compactTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Convert( 
            /* [in] */ __RPC__in BSTR convertedDiskImagePath,
            /* [in] */ VMHardDiskType convertedDiskImageType,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **convertTask) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_File( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *hardDiskfile) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Type( 
            /* [retval][out] */ __RPC__out VMHardDiskType *type) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SizeInGuest( 
            /* [retval][out] */ __RPC__out VARIANT *fileSize) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SizeOnHost( 
            /* [retval][out] */ __RPC__out VARIANT *fileSize) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HostFreeDiskSpace( 
            /* [retval][out] */ __RPC__out VARIANT *freeBytes) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Parent( 
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **parent) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Parent( 
            /* [in] */ __RPC__in_opt IVMHardDisk *parent) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMHardDiskVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMHardDisk * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMHardDisk * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMHardDisk * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMHardDisk * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMHardDisk * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMHardDisk * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMHardDisk * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Merge )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **mergeTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *MergeTo )( 
            __RPC__in IVMHardDisk * This,
            /* [in] */ __RPC__in BSTR newDiskImagePath,
            /* [in] */ VMHardDiskType newDiskImageType,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **mergeTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Compact )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **compactTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Convert )( 
            __RPC__in IVMHardDisk * This,
            /* [in] */ __RPC__in BSTR convertedDiskImagePath,
            /* [in] */ VMHardDiskType convertedDiskImageType,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **convertTask);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_File )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *hardDiskfile);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__out VMHardDiskType *type);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SizeInGuest )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__out VARIANT *fileSize);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SizeOnHost )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__out VARIANT *fileSize);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostFreeDiskSpace )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__out VARIANT *freeBytes);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Parent )( 
            __RPC__in IVMHardDisk * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **parent);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Parent )( 
            __RPC__in IVMHardDisk * This,
            /* [in] */ __RPC__in_opt IVMHardDisk *parent);
        
        END_INTERFACE
    } IVMHardDiskVtbl;

    interface IVMHardDisk
    {
        CONST_VTBL struct IVMHardDiskVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMHardDisk_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMHardDisk_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMHardDisk_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMHardDisk_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMHardDisk_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMHardDisk_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMHardDisk_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMHardDisk_Merge(This,mergeTask)	\
    ( (This)->lpVtbl -> Merge(This,mergeTask) ) 

#define IVMHardDisk_MergeTo(This,newDiskImagePath,newDiskImageType,mergeTask)	\
    ( (This)->lpVtbl -> MergeTo(This,newDiskImagePath,newDiskImageType,mergeTask) ) 

#define IVMHardDisk_Compact(This,compactTask)	\
    ( (This)->lpVtbl -> Compact(This,compactTask) ) 

#define IVMHardDisk_Convert(This,convertedDiskImagePath,convertedDiskImageType,convertTask)	\
    ( (This)->lpVtbl -> Convert(This,convertedDiskImagePath,convertedDiskImageType,convertTask) ) 

#define IVMHardDisk_get_File(This,hardDiskfile)	\
    ( (This)->lpVtbl -> get_File(This,hardDiskfile) ) 

#define IVMHardDisk_get_Type(This,type)	\
    ( (This)->lpVtbl -> get_Type(This,type) ) 

#define IVMHardDisk_get_SizeInGuest(This,fileSize)	\
    ( (This)->lpVtbl -> get_SizeInGuest(This,fileSize) ) 

#define IVMHardDisk_get_SizeOnHost(This,fileSize)	\
    ( (This)->lpVtbl -> get_SizeOnHost(This,fileSize) ) 

#define IVMHardDisk_get_HostFreeDiskSpace(This,freeBytes)	\
    ( (This)->lpVtbl -> get_HostFreeDiskSpace(This,freeBytes) ) 

#define IVMHardDisk_get_Parent(This,parent)	\
    ( (This)->lpVtbl -> get_Parent(This,parent) ) 

#define IVMHardDisk_put_Parent(This,parent)	\
    ( (This)->lpVtbl -> put_Parent(This,parent) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMHardDisk_INTERFACE_DEFINED__ */


#ifndef __IVMTaskCollection_INTERFACE_DEFINED__
#define __IVMTaskCollection_INTERFACE_DEFINED__

/* interface IVMTaskCollection */
/* [unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMTaskCollection;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5c4387c8-0e8b-4b97-8058-84679adf4c40")
    IVMTaskCollection : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out long *count) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **task) = 0;
        
        virtual /* [helpstring][restricted][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMTaskCollectionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMTaskCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMTaskCollection * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMTaskCollection * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMTaskCollection * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMTaskCollection * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMTaskCollection * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMTaskCollection * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IVMTaskCollection * This,
            /* [retval][out] */ __RPC__out long *count);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IVMTaskCollection * This,
            /* [in] */ long index,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **task);
        
        /* [helpstring][restricted][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IVMTaskCollection * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **enumerator);
        
        END_INTERFACE
    } IVMTaskCollectionVtbl;

    interface IVMTaskCollection
    {
        CONST_VTBL struct IVMTaskCollectionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMTaskCollection_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMTaskCollection_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMTaskCollection_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMTaskCollection_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMTaskCollection_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMTaskCollection_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMTaskCollection_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMTaskCollection_get_Count(This,count)	\
    ( (This)->lpVtbl -> get_Count(This,count) ) 

#define IVMTaskCollection_get_Item(This,index,task)	\
    ( (This)->lpVtbl -> get_Item(This,index,task) ) 

#define IVMTaskCollection_get__NewEnum(This,enumerator)	\
    ( (This)->lpVtbl -> get__NewEnum(This,enumerator) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMTaskCollection_INTERFACE_DEFINED__ */


#ifndef __IVMVirtualPC_INTERFACE_DEFINED__
#define __IVMVirtualPC_INTERFACE_DEFINED__

/* interface IVMVirtualPC */
/* [hidden][unique][helpstring][dual][uuid][object] */ 


EXTERN_C const IID IID_IVMVirtualPC;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("236ba0d9-a24a-4292-a132-27c1421dfd01")
    IVMVirtualPC : public IDispatch
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_HostInfo( 
            /* [retval][out] */ __RPC__deref_out_opt IVMHostInfo **hostInfo) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE FindVirtualMachine( 
            /* [in] */ __RPC__in BSTR configurationName,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CreateVirtualMachine( 
            /* [in] */ __RPC__in BSTR configurationName,
            /* [in] */ __RPC__in BSTR configurationPath,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DeleteVirtualMachine( 
            /* [in] */ __RPC__in_opt IVMVirtualMachine *virtualMachine) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RegisterVirtualMachine( 
            /* [in] */ __RPC__in BSTR configurationName,
            /* [in] */ __RPC__in BSTR configurationPath,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE UnregisterVirtualMachine( 
            /* [in] */ __RPC__in_opt IVMVirtualMachine *virtualMachine) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_VirtualMachines( 
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachineCollection **virtualMachineCollection) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE FindVirtualNetwork( 
            /* [in] */ __RPC__in BSTR virtualNetworkName,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetwork **virtualNetwork) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_VirtualNetworks( 
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetworkCollection **virtualNetworkCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UnconnectedNetworkAdapters( 
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapterCollection **unconnectedNetworkAdapterCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SupportDrivers( 
            /* [retval][out] */ __RPC__deref_out_opt IVMSupportDriverCollection **supportDriverCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Tasks( 
            /* [retval][out] */ __RPC__deref_out_opt IVMTaskCollection **taskCollection) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CreateDynamicVirtualHardDisk( 
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ long size,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **diskTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CreateFixedVirtualHardDisk( 
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ long size,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **diskTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CreateDifferencingVirtualHardDisk( 
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ __RPC__in BSTR parentPath,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **diskTask) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetHardDisk( 
            /* [in] */ __RPC__in BSTR imagePath,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **hardDisk) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CreateFloppyDiskImage( 
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ VMFloppyDiskImageType imageType) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetFloppyDiskImageType( 
            /* [in] */ __RPC__in BSTR imagePath,
            /* [retval][out] */ __RPC__out VMFloppyDiskImageType *imageType) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetConfigurationValue( 
            /* [in] */ __RPC__in BSTR preferenceKey,
            /* [retval][out] */ __RPC__out VARIANT *preferenceValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetConfigurationValue( 
            /* [in] */ __RPC__in BSTR preferenceKey,
            /* [in] */ VARIANT preferenceValue) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveConfigurationValue( 
            /* [in] */ __RPC__in BSTR preferenceKey) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MinimumMemoryPerVM( 
            /* [retval][out] */ __RPC__out long *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MaximumMemoryPerVM( 
            /* [retval][out] */ __RPC__out long *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SuggestedMaximumMemoryPerVM( 
            /* [retval][out] */ __RPC__out long *megabytesOfMemory) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MaximumFloppyDrivesPerVM( 
            /* [retval][out] */ __RPC__out long *maxDrives) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MaximumSerialPortsPerVM( 
            /* [retval][out] */ __RPC__out long *maxPorts) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MaximumParallelPortsPerVM( 
            /* [retval][out] */ __RPC__out long *maxPorts) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MaximumNetworkAdaptersPerVM( 
            /* [retval][out] */ __RPC__out long *maxNetworkAdapters) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_MaximumNumberOfIDEBuses( 
            /* [retval][out] */ __RPC__out long *maxNumBuses) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DefaultVMConfigurationPath( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *configurationPath) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_DefaultVMConfigurationPath( 
            /* [in] */ __RPC__in BSTR configurationPath) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SearchPaths( 
            /* [retval][out] */ __RPC__out VARIANT *searchPaths) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_SearchPaths( 
            /* [in] */ VARIANT searchPaths) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetHardDiskFiles( 
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [retval][out] */ __RPC__out VARIANT *outHardDiskFileList) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetVirtualMachineFiles( 
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [in] */ VARIANT_BOOL inExcludedRegisteredVMs,
            /* [retval][out] */ __RPC__out VARIANT *outVirtualMachineFileList) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetFloppyDiskFiles( 
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [retval][out] */ __RPC__out VARIANT *outFloppyDiskFileList) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetDVDFiles( 
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [retval][out] */ __RPC__out VARIANT *outDVDFileList) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_USBDeviceCollection( 
            /* [retval][out] */ __RPC__deref_out_opt IVMUSBDeviceCollection **usbDeviceCollection) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Name( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualPCName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *version) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_UpTime( 
            /* [retval][out] */ __RPC__out long *secondsAlive) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualPCVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualPC * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualPC * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualPC * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualPC * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HostInfo )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMHostInfo **hostInfo);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindVirtualMachine )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR configurationName,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateVirtualMachine )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR configurationName,
            /* [in] */ __RPC__in BSTR configurationPath,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DeleteVirtualMachine )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in_opt IVMVirtualMachine *virtualMachine);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RegisterVirtualMachine )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR configurationName,
            /* [in] */ __RPC__in BSTR configurationPath,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachine **virtualMachine);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *UnregisterVirtualMachine )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in_opt IVMVirtualMachine *virtualMachine);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VirtualMachines )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualMachineCollection **virtualMachineCollection);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *FindVirtualNetwork )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR virtualNetworkName,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetwork **virtualNetwork);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_VirtualNetworks )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMVirtualNetworkCollection **virtualNetworkCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UnconnectedNetworkAdapters )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMNetworkAdapterCollection **unconnectedNetworkAdapterCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SupportDrivers )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMSupportDriverCollection **supportDriverCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Tasks )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMTaskCollection **taskCollection);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateDynamicVirtualHardDisk )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ long size,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **diskTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateFixedVirtualHardDisk )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ long size,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **diskTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateDifferencingVirtualHardDisk )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ __RPC__in BSTR parentPath,
            /* [retval][out] */ __RPC__deref_out_opt IVMTask **diskTask);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetHardDisk )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR imagePath,
            /* [retval][out] */ __RPC__deref_out_opt IVMHardDisk **hardDisk);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CreateFloppyDiskImage )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR imagePath,
            /* [in] */ VMFloppyDiskImageType imageType);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetFloppyDiskImageType )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR imagePath,
            /* [retval][out] */ __RPC__out VMFloppyDiskImageType *imageType);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetConfigurationValue )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR preferenceKey,
            /* [retval][out] */ __RPC__out VARIANT *preferenceValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetConfigurationValue )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR preferenceKey,
            /* [in] */ VARIANT preferenceValue);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveConfigurationValue )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR preferenceKey);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MinimumMemoryPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaximumMemoryPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SuggestedMaximumMemoryPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *megabytesOfMemory);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaximumFloppyDrivesPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *maxDrives);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaximumSerialPortsPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *maxPorts);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaximumParallelPortsPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *maxPorts);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaximumNetworkAdaptersPerVM )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *maxNetworkAdapters);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_MaximumNumberOfIDEBuses )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *maxNumBuses);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DefaultVMConfigurationPath )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *configurationPath);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DefaultVMConfigurationPath )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ __RPC__in BSTR configurationPath);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SearchPaths )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out VARIANT *searchPaths);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_SearchPaths )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ VARIANT searchPaths);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetHardDiskFiles )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [retval][out] */ __RPC__out VARIANT *outHardDiskFileList);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetVirtualMachineFiles )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [in] */ VARIANT_BOOL inExcludedRegisteredVMs,
            /* [retval][out] */ __RPC__out VARIANT *outVirtualMachineFileList);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetFloppyDiskFiles )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [retval][out] */ __RPC__out VARIANT *outFloppyDiskFileList);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetDVDFiles )( 
            __RPC__in IVMVirtualPC * This,
            /* [in] */ VARIANT inAdditionalSearchPaths,
            /* [retval][out] */ __RPC__out VARIANT *outDVDFileList);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_USBDeviceCollection )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt IVMUSBDeviceCollection **usbDeviceCollection);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Name )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *virtualPCName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *version);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_UpTime )( 
            __RPC__in IVMVirtualPC * This,
            /* [retval][out] */ __RPC__out long *secondsAlive);
        
        END_INTERFACE
    } IVMVirtualPCVtbl;

    interface IVMVirtualPC
    {
        CONST_VTBL struct IVMVirtualPCVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualPC_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualPC_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualPC_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualPC_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualPC_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualPC_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualPC_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IVMVirtualPC_get_HostInfo(This,hostInfo)	\
    ( (This)->lpVtbl -> get_HostInfo(This,hostInfo) ) 

#define IVMVirtualPC_FindVirtualMachine(This,configurationName,virtualMachine)	\
    ( (This)->lpVtbl -> FindVirtualMachine(This,configurationName,virtualMachine) ) 

#define IVMVirtualPC_CreateVirtualMachine(This,configurationName,configurationPath,virtualMachine)	\
    ( (This)->lpVtbl -> CreateVirtualMachine(This,configurationName,configurationPath,virtualMachine) ) 

#define IVMVirtualPC_DeleteVirtualMachine(This,virtualMachine)	\
    ( (This)->lpVtbl -> DeleteVirtualMachine(This,virtualMachine) ) 

#define IVMVirtualPC_RegisterVirtualMachine(This,configurationName,configurationPath,virtualMachine)	\
    ( (This)->lpVtbl -> RegisterVirtualMachine(This,configurationName,configurationPath,virtualMachine) ) 

#define IVMVirtualPC_UnregisterVirtualMachine(This,virtualMachine)	\
    ( (This)->lpVtbl -> UnregisterVirtualMachine(This,virtualMachine) ) 

#define IVMVirtualPC_get_VirtualMachines(This,virtualMachineCollection)	\
    ( (This)->lpVtbl -> get_VirtualMachines(This,virtualMachineCollection) ) 

#define IVMVirtualPC_FindVirtualNetwork(This,virtualNetworkName,virtualNetwork)	\
    ( (This)->lpVtbl -> FindVirtualNetwork(This,virtualNetworkName,virtualNetwork) ) 

#define IVMVirtualPC_get_VirtualNetworks(This,virtualNetworkCollection)	\
    ( (This)->lpVtbl -> get_VirtualNetworks(This,virtualNetworkCollection) ) 

#define IVMVirtualPC_get_UnconnectedNetworkAdapters(This,unconnectedNetworkAdapterCollection)	\
    ( (This)->lpVtbl -> get_UnconnectedNetworkAdapters(This,unconnectedNetworkAdapterCollection) ) 

#define IVMVirtualPC_get_SupportDrivers(This,supportDriverCollection)	\
    ( (This)->lpVtbl -> get_SupportDrivers(This,supportDriverCollection) ) 

#define IVMVirtualPC_get_Tasks(This,taskCollection)	\
    ( (This)->lpVtbl -> get_Tasks(This,taskCollection) ) 

#define IVMVirtualPC_CreateDynamicVirtualHardDisk(This,imagePath,size,diskTask)	\
    ( (This)->lpVtbl -> CreateDynamicVirtualHardDisk(This,imagePath,size,diskTask) ) 

#define IVMVirtualPC_CreateFixedVirtualHardDisk(This,imagePath,size,diskTask)	\
    ( (This)->lpVtbl -> CreateFixedVirtualHardDisk(This,imagePath,size,diskTask) ) 

#define IVMVirtualPC_CreateDifferencingVirtualHardDisk(This,imagePath,parentPath,diskTask)	\
    ( (This)->lpVtbl -> CreateDifferencingVirtualHardDisk(This,imagePath,parentPath,diskTask) ) 

#define IVMVirtualPC_GetHardDisk(This,imagePath,hardDisk)	\
    ( (This)->lpVtbl -> GetHardDisk(This,imagePath,hardDisk) ) 

#define IVMVirtualPC_CreateFloppyDiskImage(This,imagePath,imageType)	\
    ( (This)->lpVtbl -> CreateFloppyDiskImage(This,imagePath,imageType) ) 

#define IVMVirtualPC_GetFloppyDiskImageType(This,imagePath,imageType)	\
    ( (This)->lpVtbl -> GetFloppyDiskImageType(This,imagePath,imageType) ) 

#define IVMVirtualPC_GetConfigurationValue(This,preferenceKey,preferenceValue)	\
    ( (This)->lpVtbl -> GetConfigurationValue(This,preferenceKey,preferenceValue) ) 

#define IVMVirtualPC_SetConfigurationValue(This,preferenceKey,preferenceValue)	\
    ( (This)->lpVtbl -> SetConfigurationValue(This,preferenceKey,preferenceValue) ) 

#define IVMVirtualPC_RemoveConfigurationValue(This,preferenceKey)	\
    ( (This)->lpVtbl -> RemoveConfigurationValue(This,preferenceKey) ) 

#define IVMVirtualPC_get_MinimumMemoryPerVM(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_MinimumMemoryPerVM(This,megabytesOfMemory) ) 

#define IVMVirtualPC_get_MaximumMemoryPerVM(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_MaximumMemoryPerVM(This,megabytesOfMemory) ) 

#define IVMVirtualPC_get_SuggestedMaximumMemoryPerVM(This,megabytesOfMemory)	\
    ( (This)->lpVtbl -> get_SuggestedMaximumMemoryPerVM(This,megabytesOfMemory) ) 

#define IVMVirtualPC_get_MaximumFloppyDrivesPerVM(This,maxDrives)	\
    ( (This)->lpVtbl -> get_MaximumFloppyDrivesPerVM(This,maxDrives) ) 

#define IVMVirtualPC_get_MaximumSerialPortsPerVM(This,maxPorts)	\
    ( (This)->lpVtbl -> get_MaximumSerialPortsPerVM(This,maxPorts) ) 

#define IVMVirtualPC_get_MaximumParallelPortsPerVM(This,maxPorts)	\
    ( (This)->lpVtbl -> get_MaximumParallelPortsPerVM(This,maxPorts) ) 

#define IVMVirtualPC_get_MaximumNetworkAdaptersPerVM(This,maxNetworkAdapters)	\
    ( (This)->lpVtbl -> get_MaximumNetworkAdaptersPerVM(This,maxNetworkAdapters) ) 

#define IVMVirtualPC_get_MaximumNumberOfIDEBuses(This,maxNumBuses)	\
    ( (This)->lpVtbl -> get_MaximumNumberOfIDEBuses(This,maxNumBuses) ) 

#define IVMVirtualPC_get_DefaultVMConfigurationPath(This,configurationPath)	\
    ( (This)->lpVtbl -> get_DefaultVMConfigurationPath(This,configurationPath) ) 

#define IVMVirtualPC_put_DefaultVMConfigurationPath(This,configurationPath)	\
    ( (This)->lpVtbl -> put_DefaultVMConfigurationPath(This,configurationPath) ) 

#define IVMVirtualPC_get_SearchPaths(This,searchPaths)	\
    ( (This)->lpVtbl -> get_SearchPaths(This,searchPaths) ) 

#define IVMVirtualPC_put_SearchPaths(This,searchPaths)	\
    ( (This)->lpVtbl -> put_SearchPaths(This,searchPaths) ) 

#define IVMVirtualPC_GetHardDiskFiles(This,inAdditionalSearchPaths,outHardDiskFileList)	\
    ( (This)->lpVtbl -> GetHardDiskFiles(This,inAdditionalSearchPaths,outHardDiskFileList) ) 

#define IVMVirtualPC_GetVirtualMachineFiles(This,inAdditionalSearchPaths,inExcludedRegisteredVMs,outVirtualMachineFileList)	\
    ( (This)->lpVtbl -> GetVirtualMachineFiles(This,inAdditionalSearchPaths,inExcludedRegisteredVMs,outVirtualMachineFileList) ) 

#define IVMVirtualPC_GetFloppyDiskFiles(This,inAdditionalSearchPaths,outFloppyDiskFileList)	\
    ( (This)->lpVtbl -> GetFloppyDiskFiles(This,inAdditionalSearchPaths,outFloppyDiskFileList) ) 

#define IVMVirtualPC_GetDVDFiles(This,inAdditionalSearchPaths,outDVDFileList)	\
    ( (This)->lpVtbl -> GetDVDFiles(This,inAdditionalSearchPaths,outDVDFileList) ) 

#define IVMVirtualPC_get_USBDeviceCollection(This,usbDeviceCollection)	\
    ( (This)->lpVtbl -> get_USBDeviceCollection(This,usbDeviceCollection) ) 

#define IVMVirtualPC_get_Name(This,virtualPCName)	\
    ( (This)->lpVtbl -> get_Name(This,virtualPCName) ) 

#define IVMVirtualPC_get_Version(This,version)	\
    ( (This)->lpVtbl -> get_Version(This,version) ) 

#define IVMVirtualPC_get_UpTime(This,secondsAlive)	\
    ( (This)->lpVtbl -> get_UpTime(This,secondsAlive) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IVMVirtualPC_INTERFACE_DEFINED__ */


#ifndef __IVMVirtualPCEvents_DISPINTERFACE_DEFINED__
#define __IVMVirtualPCEvents_DISPINTERFACE_DEFINED__

/* dispinterface IVMVirtualPCEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID_IVMVirtualPCEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("efed1ef1-3c09-41f7-a9c2-7e29fa286c9d")
    IVMVirtualPCEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct IVMVirtualPCEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMVirtualPCEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMVirtualPCEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMVirtualPCEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMVirtualPCEvents * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMVirtualPCEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMVirtualPCEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMVirtualPCEvents * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IVMVirtualPCEventsVtbl;

    interface IVMVirtualPCEvents
    {
        CONST_VTBL struct IVMVirtualPCEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMVirtualPCEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMVirtualPCEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMVirtualPCEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMVirtualPCEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMVirtualPCEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMVirtualPCEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMVirtualPCEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* __IVMVirtualPCEvents_DISPINTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_VMVirtualPC;

#ifdef __cplusplus

class DECLSPEC_UUID("9a1774b7-8251-4468-a214-61dcaed9ac2f")
VMVirtualPC;
#endif

EXTERN_C const CLSID CLSID_VMAccountant;

#ifdef __cplusplus

class DECLSPEC_UUID("f3a5aaa1-63c5-4c66-b0d4-625892f79d19")
VMAccountant;
#endif

EXTERN_C const CLSID CLSID_VMDisplay;

#ifdef __cplusplus

class DECLSPEC_UUID("f11ce62b-39c0-4692-a805-c88dad27e038")
VMDisplay;
#endif

#ifndef __IVMDVDDriveEvents_DISPINTERFACE_DEFINED__
#define __IVMDVDDriveEvents_DISPINTERFACE_DEFINED__

/* dispinterface IVMDVDDriveEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID_IVMDVDDriveEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("c2a7d8e9-e76c-4eb8-94f7-71a5122d249b")
    IVMDVDDriveEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct IVMDVDDriveEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMDVDDriveEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMDVDDriveEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMDVDDriveEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMDVDDriveEvents * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMDVDDriveEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMDVDDriveEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMDVDDriveEvents * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IVMDVDDriveEventsVtbl;

    interface IVMDVDDriveEvents
    {
        CONST_VTBL struct IVMDVDDriveEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMDVDDriveEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMDVDDriveEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMDVDDriveEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMDVDDriveEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMDVDDriveEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMDVDDriveEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMDVDDriveEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* __IVMDVDDriveEvents_DISPINTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_VMDVDDrive;

#ifdef __cplusplus

class DECLSPEC_UUID("30ac1778-42d6-4ff8-8f4b-7475282e1b49")
VMDVDDrive;
#endif

#ifndef __IVMFloppyDriveEvents_DISPINTERFACE_DEFINED__
#define __IVMFloppyDriveEvents_DISPINTERFACE_DEFINED__

/* dispinterface IVMFloppyDriveEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID_IVMFloppyDriveEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("a9ed3401-4e09-4177-86ec-a13bf9fa7d4e")
    IVMFloppyDriveEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct IVMFloppyDriveEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IVMFloppyDriveEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IVMFloppyDriveEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IVMFloppyDriveEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IVMFloppyDriveEvents * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IVMFloppyDriveEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IVMFloppyDriveEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IVMFloppyDriveEvents * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IVMFloppyDriveEventsVtbl;

    interface IVMFloppyDriveEvents
    {
        CONST_VTBL struct IVMFloppyDriveEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IVMFloppyDriveEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IVMFloppyDriveEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IVMFloppyDriveEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IVMFloppyDriveEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IVMFloppyDriveEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IVMFloppyDriveEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IVMFloppyDriveEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* __IVMFloppyDriveEvents_DISPINTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_VMFloppyDrive;

#ifdef __cplusplus

class DECLSPEC_UUID("3a2e7c18-33e8-4102-be39-8d5c96c8ced5")
VMFloppyDrive;
#endif

EXTERN_C const CLSID CLSID_VMGuestOS;

#ifdef __cplusplus

class DECLSPEC_UUID("b8f18ab3-250a-4b83-bb01-4278d4176cfa")
VMGuestOS;
#endif

EXTERN_C const CLSID CLSID_VMHardDiskConnection;

#ifdef __cplusplus

class DECLSPEC_UUID("67d6604f-30fd-48e3-b57b-395bdb06e6bb")
VMHardDiskConnection;
#endif

EXTERN_C const CLSID CLSID_VMHardDisk;

#ifdef __cplusplus

class DECLSPEC_UUID("788ec54b-4555-4aa0-9e70-0d5380172ac5")
VMHardDisk;
#endif

EXTERN_C const CLSID CLSID_VMHostInfo;

#ifdef __cplusplus

class DECLSPEC_UUID("5faa96f0-30f0-4822-b164-447730ca1879")
VMHostInfo;
#endif

EXTERN_C const CLSID CLSID_VMKeyboard;

#ifdef __cplusplus

class DECLSPEC_UUID("7dce7fba-45c9-4de0-8d2d-12d0f94759c4")
VMKeyboard;
#endif

EXTERN_C const CLSID CLSID_VMMouseDevice;

#ifdef __cplusplus

class DECLSPEC_UUID("b78d8052-b722-4f7a-850e-2aeb1e747aa6")
VMMouseDevice;
#endif

EXTERN_C const CLSID CLSID_VMNetworkAdapter;

#ifdef __cplusplus

class DECLSPEC_UUID("620e38fd-249e-4e03-9367-acde5d17d267")
VMNetworkAdapter;
#endif

EXTERN_C const CLSID CLSID_VMParallelPort;

#ifdef __cplusplus

class DECLSPEC_UUID("d45c9931-d2a9-4ef9-8b18-a0fc6044ec9f")
VMParallelPort;
#endif

EXTERN_C const CLSID CLSID_VMSerialPort;

#ifdef __cplusplus

class DECLSPEC_UUID("a92a74da-d35c-4b45-86dc-321c6e28ab49")
VMSerialPort;
#endif

EXTERN_C const CLSID CLSID_VMVirtualNetwork;

#ifdef __cplusplus

class DECLSPEC_UUID("9b8e2ef9-28b2-4e8e-907f-f7050db0ffb8")
VMVirtualNetwork;
#endif

EXTERN_C const CLSID CLSID_VMTask;

#ifdef __cplusplus

class DECLSPEC_UUID("0747074d-4bfc-49f8-9aab-c926e11b756d")
VMTask;
#endif

EXTERN_C const CLSID CLSID_VMUSBDevice;

#ifdef __cplusplus

class DECLSPEC_UUID("44253B42-5B8B-4b57-BB1B-C5285CF372EB")
VMUSBDevice;
#endif
#endif /* __VirtualPC_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


