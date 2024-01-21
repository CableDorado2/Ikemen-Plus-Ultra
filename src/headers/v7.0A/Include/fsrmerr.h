/*++

Copyright (c) Microsoft Corporation

    Constant definitions for common File Server Resource Management service
    error messages.

--*/

#pragma once


//
// HRESULT Success codes
//

//
//  Values are 32 bit values laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//


//
// Define the severity codes
//


//
// MessageId: FSRM_S_PARTIAL_BATCH
//
// MessageText:
//
// At least one failure occurred in a batch operation.
//
#define FSRM_S_PARTIAL_BATCH             ((HRESULT)0x00045304L)

//
// MessageId: FSRM_S_PARTIAL_CLASSIFICATION
//
// MessageText:
//
// The file may only have partial classification because a failure occurred while loading or classifying the file properties.
//
#define FSRM_S_PARTIAL_CLASSIFICATION    ((HRESULT)0x00045305L)


//
// HRESULT Failure codes
//

//
// MessageId: FSRM_E_NOT_FOUND
//
// MessageText:
//
// The requested object was not found.
//
#define FSRM_E_NOT_FOUND                 ((HRESULT)0x80045301L)

//
// MessageId: FSRM_E_INVALID_SCHEDULER_ARGUMENT
//
// MessageText:
//
// One or more of the arguments supplied to the task scheduler are not valid.
//
#define FSRM_E_INVALID_SCHEDULER_ARGUMENT ((HRESULT)0x80045302L)

//
// MessageId: FSRM_E_ALREADY_EXISTS
//
// MessageText:
//
// The specified object already exists.
//
#define FSRM_E_ALREADY_EXISTS            ((HRESULT)0x80045303L)

//
// MessageId: FSRM_E_PATH_NOT_FOUND
//
// MessageText:
//
// The specified path was not found.
//
#define FSRM_E_PATH_NOT_FOUND            ((HRESULT)0x80045304L)

//
// MessageId: FSRM_E_INVALID_USER
//
// MessageText:
//
// The specified user is invalid.
//
#define FSRM_E_INVALID_USER              ((HRESULT)0x80045305L)

//
// MessageId: FSRM_E_INVALID_PATH
//
// MessageText:
//
// The specified path is invalid.
//
#define FSRM_E_INVALID_PATH              ((HRESULT)0x80045306L)

//
// MessageId: FSRM_E_INVALID_LIMIT
//
// MessageText:
//
// The specified limit is invalid.
//
#define FSRM_E_INVALID_LIMIT             ((HRESULT)0x80045307L)

//
// MessageId: FSRM_E_INVALID_NAME
//
// MessageText:
//
// The specified name is invalid.
//
#define FSRM_E_INVALID_NAME              ((HRESULT)0x80045308L)

//
// MessageId: FSRM_E_FAIL_BATCH
//
// MessageText:
//
// All items in a batch operation failed.
//
#define FSRM_E_FAIL_BATCH                ((HRESULT)0x80045309L)

//
// MessageId: FSRM_E_INVALID_TEXT
//
// MessageText:
//
// The specified text is invalid.
//
#define FSRM_E_INVALID_TEXT              ((HRESULT)0x8004530AL)

//
// MessageId: FSRM_E_INVALID_IMPORT_VERSION
//
// MessageText:
//
// The version of the configuration file you are trying to import is not supported. You cannot import configuration files with database versions earlier than 2.0.
//
#define FSRM_E_INVALID_IMPORT_VERSION    ((HRESULT)0x8004530BL)

//
// MessageId: FSRM_E_OUT_OF_RANGE
//
// MessageText:
//
// The specified property is out of range.
//
#define FSRM_E_OUT_OF_RANGE              ((HRESULT)0x8004530DL)

//
// MessageId: FSRM_E_REQD_PARAM_MISSING
//
// MessageText:
//
// The specified required property is missing.
//
#define FSRM_E_REQD_PARAM_MISSING        ((HRESULT)0x8004530EL)

//
// MessageId: FSRM_E_INVALID_COMBINATION
//
// MessageText:
//
// The specified property combination is invalid.
//
#define FSRM_E_INVALID_COMBINATION       ((HRESULT)0x8004530FL)

//
// MessageId: FSRM_E_DUPLICATE_NAME
//
// MessageText:
//
// Duplicate names were detected for the same object.
//
#define FSRM_E_DUPLICATE_NAME            ((HRESULT)0x80045310L)

//
// MessageId: FSRM_E_NOT_SUPPORTED
//
// MessageText:
//
// The operation or the specified combination of parameters is not supported.
//
#define FSRM_E_NOT_SUPPORTED             ((HRESULT)0x80045311L)

//
// MessageId: FSRM_E_DRIVER_NOT_READY
//
// MessageText:
//
// A required filter driver is not installed, loaded or ready for service.
//
#define FSRM_E_DRIVER_NOT_READY          ((HRESULT)0x80045313L)

//
// MessageId: FSRM_E_INSUFFICIENT_DISK
//
// MessageText:
//
// There is insufficient disk space to perform the requested operation.
//
#define FSRM_E_INSUFFICIENT_DISK         ((HRESULT)0x80045314L)

//
// MessageId: FSRM_E_VOLUME_UNSUPPORTED
//
// MessageText:
//
// The specified volume is unsupported.
//
#define FSRM_E_VOLUME_UNSUPPORTED        ((HRESULT)0x80045315L)

//
// MessageId: FSRM_E_UNEXPECTED
//
// MessageText:
//
// The File Server Resource Manager service encountered an unexpected error.
// Check the application event log for more information.
//
#define FSRM_E_UNEXPECTED                ((HRESULT)0x80045316L)

//
// MessageId: FSRM_E_INSECURE_PATH
//
// MessageText:
//
// The specified path is insecure.
//
#define FSRM_E_INSECURE_PATH             ((HRESULT)0x80045317L)

//
// MessageId: FSRM_E_INVALID_SMTP_SERVER
//
// MessageText:
//
// The SMTP server is invalid.
//
#define FSRM_E_INVALID_SMTP_SERVER       ((HRESULT)0x80045318L)

//
// MessageId: FSRM_E_AUTO_QUOTA
//
// MessageText:
//
// Auto apply quota configuration for one or more folders failed.  Check the application event log for more information.
//
#define FSRM_E_AUTO_QUOTA                ((HRESULT)0x0004531BL)

//
// MessageId: FSRM_E_EMAIL_NOT_SENT
//
// MessageText:
//
// The File Server Resource Manager service could not send email due to an error.
// Check the application event log for more information.
//
#define FSRM_E_EMAIL_NOT_SENT            ((HRESULT)0x8004531CL)

//
// MessageId: FSRM_E_INVALID_EMAIL_ADDRESS
//
// MessageText:
//
// The specified email address is invalid.
//
#define FSRM_E_INVALID_EMAIL_ADDRESS     ((HRESULT)0x8004531EL)

//
// MessageId: FSRM_E_FILE_SYSTEM_CORRUPT
//
// MessageText:
//
// The file system might be corrupted.  Please run the CHKDSK utility.
//
#define FSRM_E_FILE_SYSTEM_CORRUPT       ((HRESULT)0x8004531FL)

//
// MessageId: FSRM_E_LONG_CMDLINE
//
// MessageText:
//
// The specified command-line executable path is longer than MAX_PATH.
//
#define FSRM_E_LONG_CMDLINE              ((HRESULT)0x80045320L)

//
// MessageId: FSRM_E_INVALID_FILEGROUP_DEFINITION
//
// MessageText:
//
// The specified file group definition is invalid.
//
#define FSRM_E_INVALID_FILEGROUP_DEFINITION ((HRESULT)0x80045321L)

//
// MessageId: FSRM_E_INVALID_DATASCREEN_DEFINITION
//
// MessageText:
//
// The specified file screen is invalid.
//
#define FSRM_E_INVALID_DATASCREEN_DEFINITION ((HRESULT)0x80045324L)

//
// MessageId: FSRM_E_INVALID_REPORT_FORMAT
//
// MessageText:
//
// The specified report format is invalid.
//
#define FSRM_E_INVALID_REPORT_FORMAT     ((HRESULT)0x80045328L)

//
// MessageId: FSRM_E_INVALID_REPORT_DESC
//
// MessageText:
//
// The specified report description is invalid.
//
#define FSRM_E_INVALID_REPORT_DESC       ((HRESULT)0x80045329L)

//
// MessageId: FSRM_E_INVALID_FILENAME
//
// MessageText:
//
// The specified file name is invalid.
//
#define FSRM_E_INVALID_FILENAME          ((HRESULT)0x8004532AL)

//
// MessageId: FSRM_E_SHADOW_COPY
//
// MessageText:
//
// A volume shadow copy could not be created or was unexpectedly deleted.
//
#define FSRM_E_SHADOW_COPY               ((HRESULT)0x8004532CL)

//
// MessageId: FSRM_E_XML_CORRUPTED
//
// MessageText:
//
// A File Server Resource Manager XML configuration file or import-export file is corrupted.
//
#define FSRM_E_XML_CORRUPTED             ((HRESULT)0x8004532DL)

//
// MessageId: FSRM_E_CLUSTER_NOT_RUNNING
//
// MessageText:
//
// File Server Resource Manager global configuration cannot be accessed since the cluster service is not running.
//
#define FSRM_E_CLUSTER_NOT_RUNNING       ((HRESULT)0x8004532EL)

//
// MessageId: FSRM_E_STORE_NOT_INSTALLED
//
// MessageText:
//
// File Server Resource Manager global configuration cannot be accessed since it is not installed yet.
//
#define FSRM_E_STORE_NOT_INSTALLED       ((HRESULT)0x8004532FL)

//
// MessageId: FSRM_E_NOT_CLUSTER_VOLUME
//
// MessageText:
//
// The volume does not reside on a cluster shared disk with an associated cluster resource.
//
#define FSRM_E_NOT_CLUSTER_VOLUME        ((HRESULT)0x80045330L)

//
// MessageId: FSRM_E_DIFFERENT_CLUSTER_GROUP
//
// MessageText:
//
// There are at least two paths which reside on different cluster shared disks which are not in the same cluster resource group.
//
#define FSRM_E_DIFFERENT_CLUSTER_GROUP   ((HRESULT)0x80045331L)

//
// MessageId: FSRM_E_REPORT_TYPE_ALREADY_EXISTS
//
// MessageText:
//
// A report of the specified type already exists in the report job.
//
#define FSRM_E_REPORT_TYPE_ALREADY_EXISTS ((HRESULT)0x80045332L)

//
// MessageId: FSRM_E_REPORT_JOB_ALREADY_RUNNING
//
// MessageText:
//
// The report job is already running or queued for running.
//
#define FSRM_E_REPORT_JOB_ALREADY_RUNNING ((HRESULT)0x80045333L)

//
// MessageId: FSRM_E_REPORT_GENERATION_ERR
//
// MessageText:
//
// An error occurred during report generation.
//
#define FSRM_E_REPORT_GENERATION_ERR     ((HRESULT)0x80045334L)

//
// MessageId: FSRM_E_REPORT_TASK_TRIGGER
//
// MessageText:
//
// The task contains zero or unsupported triggers.
//
#define FSRM_E_REPORT_TASK_TRIGGER       ((HRESULT)0x80045335L)

//
// MessageId: FSRM_E_LOADING_DISABLED_MODULE
//
// MessageText:
//
// A rule or policy attempted to load/use a disabled module.
//
#define FSRM_E_LOADING_DISABLED_MODULE   ((HRESULT)0x80045336L)

//
// MessageId: FSRM_E_CANNOT_AGGREGATE
//
// MessageText:
//
// File Server Resource Manager cannot aggregate the value for the specified file property.
//
#define FSRM_E_CANNOT_AGGREGATE          ((HRESULT)0x80045337L)

//
// MessageId: FSRM_E_MESSAGE_LIMIT_EXCEEDED
//
// MessageText:
//
// The limit of the number of messages that the current pipeline context can add to the property bag has been reached.
//
#define FSRM_E_MESSAGE_LIMIT_EXCEEDED    ((HRESULT)0x80045338L)

//
// MessageId: FSRM_E_OBJECT_IN_USE
//
// MessageText:
//
// The object is in use and cannot be deleted.
//
#define FSRM_E_OBJECT_IN_USE             ((HRESULT)0x80045339L)

//
// MessageId: FSRM_E_CANNOT_RENAME_PROPERTY
//
// MessageText:
//
// Cannot change the name of a property definition once it is set.
//
#define FSRM_E_CANNOT_RENAME_PROPERTY    ((HRESULT)0x8004533AL)

//
// MessageId: FSRM_E_CANNOT_CHANGE_PROPERTY_TYPE
//
// MessageText:
//
// Cannot change the type of a property definition once it is set.
//
#define FSRM_E_CANNOT_CHANGE_PROPERTY_TYPE ((HRESULT)0x8004533BL)

//
// MessageId: FSRM_E_MAX_PROPERTY_DEFINITIONS
//
// MessageText:
//
// A new property definition cannot be created.  The maximum number of property definitions, {0}, has been reached.
//
#define FSRM_E_MAX_PROPERTY_DEFINITIONS  ((HRESULT)0x8004533CL)

//
// MessageId: FSRM_E_CLASSIFICATION_ALREADY_RUNNING
//
// MessageText:
//
// A classification job is currently running.  Only one classification job can be running at a time.
//
#define FSRM_E_CLASSIFICATION_ALREADY_RUNNING ((HRESULT)0x8004533DL)

//
// MessageId: FSRM_E_CLASSIFICATION_NOT_RUNNING
//
// MessageText:
//
// Classification is not currently running.
//
#define FSRM_E_CLASSIFICATION_NOT_RUNNING ((HRESULT)0x8004533EL)

//
// MessageId: FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_RUNNING
//
// MessageText:
//
// The file management task is already running or queued for running.
//
#define FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_RUNNING ((HRESULT)0x8004533FL)

//
// MessageId: FSRM_E_FILE_MANAGEMENT_JOB_EXPIRATION
//
// MessageText:
//
// Cannot expire a file while running a file management task.
//
#define FSRM_E_FILE_MANAGEMENT_JOB_EXPIRATION ((HRESULT)0x80045340L)

//
// MessageId: FSRM_E_FILE_MANAGEMENT_JOB_CUSTOM
//
// MessageText:
//
// Cannot execute a custom action on a file while executing a file management task.
//
#define FSRM_E_FILE_MANAGEMENT_JOB_CUSTOM ((HRESULT)0x80045341L)

//
// MessageId: FSRM_E_FILE_MANAGEMENT_JOB_NOTIFICATION
//
// MessageText:
//
// Cannot send a notification for a file management task.
//
#define FSRM_E_FILE_MANAGEMENT_JOB_NOTIFICATION ((HRESULT)0x80045342L)

//
// MessageId: FSRM_E_FILE_OPEN_ERROR
//
// MessageText:
//
// File Server Resource Manager cannot open the file.
//
#define FSRM_E_FILE_OPEN_ERROR           ((HRESULT)0x80045343L)

//
// MessageId: FSRM_E_UNSECURE_LINK_TO_HOSTED_MODULE
//
// MessageText:
//
// File Server Resource Manager failed to perform a secure link with a hosted module process.
//
#define FSRM_E_UNSECURE_LINK_TO_HOSTED_MODULE ((HRESULT)0x80045344L)

//
// MessageId: FSRM_E_CACHE_INVALID
//
// MessageText:
//
// The property cache for the file is invalid and could not be read.
//
#define FSRM_E_CACHE_INVALID             ((HRESULT)0x80045345L)

//
// MessageId: FSRM_E_CACHE_MODULE_ALREADY_EXISTS
//
// MessageText:
//
// A cache storage module already exists.
//
#define FSRM_E_CACHE_MODULE_ALREADY_EXISTS ((HRESULT)0x80045346L)

//
// MessageId: FSRM_E_FILE_MANAGEMENT_EXPIRATION_DIR_IN_SCOPE
//
// MessageText:
//
// The expiration directory cannot be within the file management scope.
//
#define FSRM_E_FILE_MANAGEMENT_EXPIRATION_DIR_IN_SCOPE ((HRESULT)0x80045347L)

//
// MessageId: FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_EXISTS
//
// MessageText:
//
// A file management task of the specified name already exists.
//
#define FSRM_E_FILE_MANAGEMENT_JOB_ALREADY_EXISTS ((HRESULT)0x80045348L)

//
// MessageId: FSRM_E_PROPERTY_DELETED
//
// MessageText:
//
// The specified file property has been deleted.
//
#define FSRM_E_PROPERTY_DELETED          ((HRESULT)0x80045349L)

//
// MessageId: FSRM_E_LAST_ACCESS_UPDATE_DISABLED
//
// MessageText:
//
// The updating of last access times is disabled on this server.  To create a report or file management task that uses the last access time the updating of last access time must be enabled.
//
#define FSRM_E_LAST_ACCESS_UPDATE_DISABLED ((HRESULT)0x80045350L)

//
// MessageId: FSRM_E_NO_PROPERTY_VALUE
//
// MessageText:
//
// The specified file property should not be assigned a value.
//
#define FSRM_E_NO_PROPERTY_VALUE         ((HRESULT)0x80045351L)

//
// MessageId: FSRM_E_INPROC_MODULE_BLOCKED
//
// MessageText:
//
// An unknown module cannot be run inside the service process.
//
#define FSRM_E_INPROC_MODULE_BLOCKED     ((HRESULT)0x80045352L)

//
// MessageId: FSRM_E_ENUM_PROPERTIES_FAILED
//
// MessageText:
//
// File Server Resource Manager failed to enumerate file properties because a failure occurred while loading or classifying the file properties.
//
#define FSRM_E_ENUM_PROPERTIES_FAILED    ((HRESULT)0x80045353L)

//
// MessageId: FSRM_E_SET_PROPERTY_FAILED
//
// MessageText:
//
// File Server Resource Manager failed to set a file property to the file because a failure occurred while saving the file properties.
//
#define FSRM_E_SET_PROPERTY_FAILED       ((HRESULT)0x80045354L)

//
// MessageId: FSRM_E_CANNOT_STORE_PROPERTIES
//
// MessageText:
//
// Classification properties will not be stored because a failure occurred while loading or classifying the file properties.
//
#define FSRM_E_CANNOT_STORE_PROPERTIES   ((HRESULT)0x80045355L)

//
// MessageId: FSRM_E_CANNOT_ALLOW_REPARSE_POINT_TAG
//
// MessageText:
//
// Classification properties will not be stored because the reparse point tag on the file cannot be classified.
//
#define FSRM_E_CANNOT_ALLOW_REPARSE_POINT_TAG ((HRESULT)0x80045356L)

//
// MessageId: FSRM_E_PARTIAL_CLASSIFICATION_PROPERTY_NOT_FOUND
//
// MessageText:
//
// The requested property was not found. The file may only have partial classification because a failure occurred while loading or classifying the file properties.
//
#define FSRM_E_PARTIAL_CLASSIFICATION_PROPERTY_NOT_FOUND ((HRESULT)0x80045357L)

//
// MessageId: FSRM_E_TEXTREADER_NOT_INITIALIZED
//
// MessageText:
//
// The File Server Resource Manager text reader was not initialized.
//
#define FSRM_E_TEXTREADER_NOT_INITIALIZED ((HRESULT)0x80045358L)

//
// MessageId: FSRM_E_TEXTREADER_IFILTER_NOT_FOUND
//
// MessageText:
//
// There is no IFilter registered for this extension.
//
#define FSRM_E_TEXTREADER_IFILTER_NOT_FOUND ((HRESULT)0x80045359L)

//
// MessageId: FSRM_E_TEXTREADER_IFILTER_CLSID_MALFORMED
//
// MessageText:
//
// The IFilter for this extension is not registered correctly.
//
#define FSRM_E_TEXTREADER_IFILTER_CLSID_MALFORMED ((HRESULT)0x80045360L)

//
// MessageId: FSRM_E_TEXTREADER_STREAM_ERROR
//
// MessageText:
//
// There was an error obtaining the file's streaming interface.
//
#define FSRM_E_TEXTREADER_STREAM_ERROR   ((HRESULT)0x80045361L)

//
// MessageId: FSRM_E_TEXTREADER_FILENAME_TOO_LONG
//
// MessageText:
//
// The file name's extension is too long.
//
#define FSRM_E_TEXTREADER_FILENAME_TOO_LONG ((HRESULT)0x80045362L)

//
// MessageId: FSRM_E_INCOMPATIBLE_FORMAT
//
// MessageText:
//
// The module will not process the specified file because it is unable to determine a compatible file format.
//
#define FSRM_E_INCOMPATIBLE_FORMAT       ((HRESULT)0x80045363L)

//
// MessageId: FSRM_E_FILE_ENCRYPTED
//
// MessageText:
//
// File Server Resource Manager could not access the file because it is encrypted.
//
#define FSRM_E_FILE_ENCRYPTED            ((HRESULT)0x80045364L)


