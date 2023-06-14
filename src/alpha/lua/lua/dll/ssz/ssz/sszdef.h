
#include <stdint.h>
#include <string>


#ifdef _WIN32

#include <windows.h>
#include <process.h>

#define THREADCALL __stdcall
#define SSZ_EXCEPTION
#define WSTR wstring
#define WCHR wchar_t
#define L(x) L ## x
#define PATHSEPARATOR L("\\/")
#define MEMBER
#define STAMEM static

#else

#include <unistd.h>
#include <string.h>
#include <pthread.h>

#define THREADCALL
#define WSTR u16string
#define WCHR char16_t
#define L(x) u ## x
#define PATHSEPARATOR L("/")
#define MEMBER __attribute__ ((visibility ("hidden")))
#define STAMEM __attribute__ ((visibility ("hidden"))) static
#define __cdecl __attribute__((cdecl))
#define __stdcall __attribute__((stdcall))
#define __declspec(x)
#define INFINITE 0xFFFFFFFF
#define MEM_COMMIT 0x00001000
#define MEM_RESERVE 0x00002000
#define PAGE_READWRITE (PROT_READ | PROT_WRITE)
#define PAGE_EXECUTE PROT_EXEC
#define MEM_RELEASE 0x8000
#define MB_OK 0x00000000
#define MB_ICONERROR 0x00000010

typedef wchar_t *LPTSTR;
typedef int32_t LONG;
typedef LONG *LPLONG;
typedef int BOOL;
typedef int errno_t;
typedef uint32_t DWORD;
typedef void *HANDLE;
typedef void *HMODULE;
typedef void *HINSTANCE;
typedef void *FARPROC;
typedef pthread_mutex_t CRITICAL_SECTION;
typedef CRITICAL_SECTION *LPCRITICAL_SECTION;

static void InitializeCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
{
	pthread_mutexattr_t attr;
	pthread_mutexattr_init(&attr);
	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
	pthread_mutex_init(lpCriticalSection, &attr);
	pthread_mutexattr_destroy(&attr);
}
static void EnterCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
{
	pthread_mutex_lock(lpCriticalSection);
}
static void LeaveCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
{
	pthread_mutex_unlock(lpCriticalSection);
}
static void DeleteCriticalSection(LPCRITICAL_SECTION lpCriticalSection)
{
	pthread_mutex_destroy(lpCriticalSection);
}

static void Sleep(uint32_t dwMilliseconds)
{
	usleep((useconds_t)dwMilliseconds * 1000);
}

static LONG InterlockedCompareExchange(
	LPLONG Destination, LONG Exchange, LONG Comperand)
{
	return __sync_val_compare_and_swap(Destination, Comperand, Exchange);
}
static LONG InterlockedExchangeAdd(LPLONG Addend, LONG Increment)
{
	return __sync_fetch_and_add(Addend, Increment);
}
static LONG InterlockedIncrement(LPLONG lpAddend)
{
	return __sync_add_and_fetch(lpAddend, 1);
}
static LONG InterlockedDecrement(LPLONG lpAddend)
{
	return __sync_sub_and_fetch(lpAddend, 1);
}

static uint32_t WaitForSingleObject(HANDLE hHandle, uint32_t)
{
	if(!hHandle) return 0x00000080;
	pthread_join(*(pthread_t*)hHandle, nullptr);
	return 0;
}
static BOOL CloseHandle(HANDLE hObject)
{
	if(hObject) delete (pthread_t*)hObject;
	return 0;
}

static uintptr_t _beginthreadex(
	void*, unsigned,
	unsigned (THREADCALL *start_address)(void*), void *arglist,
	unsigned, unsigned*)
{
	pthread_attr_t attr;
	if(pthread_attr_init(&attr)) return 0;
	auto pth = new pthread_t;
	if(pthread_create(pth, &attr, (void *(*)(void*))start_address, arglist)){
		delete pth;
		return 0;
	}
	return (uintptr_t)pth;
}

#endif

#define SSZ_VERSTR L("v1.39")

const WCHR* const g_dtitle = L("S-SIZE ") SSZ_VERSTR;

#ifdef SSZ_EXCEPTION

#define SSZ_TRY __try{

#define SSZ_EXCEPT(addr) }__except(\
	g_ERecord = *(GetExceptionInformation())->ExceptionRecord,\
	g_EContext = *(GetExceptionInformation())->ContextRecord,\
	EXCEPTION_EXECUTE_HANDLER)\
{SSZException(addr);exit(1);}

#else

#define SSZ_TRY {

#define SSZ_EXCEPT(addr) }

#endif

#define SSZ_CDECL __cdecl
#define SSZ_STDCALL __stdcall
