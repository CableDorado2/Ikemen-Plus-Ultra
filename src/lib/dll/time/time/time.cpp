
#include <time.h>

#ifdef _WIN32
#pragma comment(lib,"winmm.lib")
#endif

#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"


TUserFunc(uint32_t, TickCount)
{
#ifdef _WIN32
	return timeGetTime();
#else
	struct timespec now;
	clock_gettime(CLOCK_MONOTONIC, &now);
	return now.tv_sec * 1000 + now.tv_nsec / 1000000;
#endif
}

TUserFunc(int64_t, UnixTime)
{
	return time(nullptr);
}
