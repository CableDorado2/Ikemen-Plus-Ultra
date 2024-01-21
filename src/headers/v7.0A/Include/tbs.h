#if defined(__cplusplus)
extern "C" {
#endif

#if (NTDDI_VERSION >= NTDDI_VISTA)

typedef BOOL TBS_BOOL;
typedef UINT32 TBS_RESULT;
typedef void *TBS_HCONTEXT;
typedef UINT32 TBS_COMMAND_PRIORITY;
typedef UINT32 TBS_COMMAND_LOCALITY;

#define TBS_CONTEXT_VERSION_ONE 1

#define TBS_COMMAND_PRIORITY_LOW        100
#define TBS_COMMAND_PRIORITY_NORMAL     200
#define TBS_COMMAND_PRIORITY_HIGH       300
#define TBS_COMMAND_PRIORITY_SYSTEM     400
#define TBS_COMMAND_PRIORITY_MAX        0x80000000

#define TBS_COMMAND_LOCALITY_ZERO       0
#define TBS_COMMAND_LOCALITY_ONE        1
#define TBS_COMMAND_LOCALITY_TWO        2
#define TBS_COMMAND_LOCALITY_THREE      3
#define TBS_COMMAND_LOCALITY_FOUR       4

#define TBS_SUCCESS                     S_OK

#define TBS_IN_OUT_BUF_SIZE_MAX         (256*1024)

typedef struct tdTBS_CONTEXT_PARAMS
{
    UINT32 version;
} TBS_CONTEXT_PARAMS;

TBS_RESULT WINAPI
Tbsi_Context_Create(
    __in const TBS_CONTEXT_PARAMS*  pContextParams,
    __out TBS_HCONTEXT*             phContext);

TBS_RESULT WINAPI
Tbsip_Context_Close(
    __in TBS_HCONTEXT   hContext);

TBS_RESULT WINAPI
Tbsip_Submit_Command(
    __in TBS_HCONTEXT hContext,
    __in TBS_COMMAND_LOCALITY Locality,
    __in TBS_COMMAND_PRIORITY Priority,
    __in_bcount(CommandBufLen) const BYTE* pCommandBuf,
    __in UINT32 CommandBufLen,
    __out_bcount(*pResultBufLen) BYTE* pResultBuf,
    __inout UINT32* pResultBufLen);

TBS_RESULT WINAPI
Tbsip_Cancel_Commands(
    __in TBS_HCONTEXT hContext);

TBS_RESULT WINAPI
Tbsi_Physical_Presence_Command(
    __in TBS_HCONTEXT hContext,
    __in_bcount(InputBufLen) const BYTE* pInputBuf,
    __in UINT32 InputBufLen,
    __in_bcount(*pOutputBufLen) PBYTE pOutputBuf,
    __in PUINT32 pOutputBufLen);

#if (NTDDI_VERSION >= NTDDI_VISTASP1)

TBS_RESULT WINAPI
Tbsi_Get_TCG_Log(
    __in TBS_HCONTEXT hContext,
    __out_bcount_part(*pOutputBufLen, *pOutputBufLen) PBYTE pOutputBuf,
    __inout PUINT32 pOutputBufLen);

#endif // _WIN32_WINNT_VISTASP1

#endif // _WIN32_WINNT_VISTA

#if defined(__cplusplus)
}
#endif

