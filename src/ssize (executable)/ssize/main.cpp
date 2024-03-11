
#include "../../lib/dll/ssz/ssz/sszdef.h"
#include "../../lib/dll/ssz/ssz/commandline.hpp"

void* __stdcall MemoryKakuho(intptr_t size)
{
	return new int8_t[size];
}
void __stdcall MemoryKaihou(void *p)
{
	delete [] (int8_t*)p;
}

void* (__stdcall *const sszrefnewfunc)(intptr_t) = MemoryKakuho;
void (__stdcall *const sszrefdeletefunc)(void*) = MemoryKaihou;


#include "../../lib/dll/ssz/ssz/typeid.h"

#include "../../lib/dll/ssz/ssz/arrayandref.hpp"

#define SSZ_CORE
#include "../../lib/dll/ssz/ssz/pluginutil.hpp"
#undef SSZ_CORE

#ifndef _WIN32

#include <dlfcn.h>

static HMODULE LoadLibrary(const WCHR *lpFileName)
{
	auto ret = dlopen(PluginUtil::wToA(lpFileName).c_str(), RTLD_NOW);
	if(!ret) fprintf(stderr, "%s\n", dlerror());
	return ret;
}
static FARPROC GetProcAddress(HMODULE hModule, const char *lpProcName)
{
	auto ret = dlsym(hModule, lpProcName);
	if(!ret) fprintf(stderr, "%s\n", dlerror());
	return ret;
}
static BOOL FreeLibrary(HMODULE hModule)
{
	return dlclose(hModule) == 0;
}

#endif

int
#ifdef _WIN32
WINAPI WinMain(
	HINSTANCE hInstance,HINSTANCE hPrevInstance, PSTR szCmdLine,int iCmdShow)
{
#else
main(int argc, char *argv[])
{
	setlocale(LC_CTYPE, "en_US.UTF-8");
#endif
	PluginUtil pu(nullptr, nullptr);//ダミー
	CommandLineString<WCHR> cmdline;
#ifdef _WIN32
	cmdline.set(GetCommandLine());
#else
	std::vector<std::WSTR> arg;
	while(argc--) arg.push_back(pu.aToW(*argv++));
	cmdline.swap(arg);
#endif
	auto i = cmdline.get()[0].find_last_of(PATHSEPARATOR);
	std::WSTR tmp;
	if(i != std::string::npos) tmp.append(cmdline.get()[0].data(), i+1);
	tmp += L("lib/dll/ssz.dll");
	auto hin = LoadLibrary(tmp.c_str());
	if(!hin) return 1;
	auto fp =
		(bool (__stdcall *)(PluginUtil*, Reference))GetProcAddress(hin, "Run");
	if(!fp) return 1;
	Reference ref;
	ref.init();
	pu.wstrToRef(
		ref, cmdline.get().size() >= 2	? cmdline.get()[1] : L("main.ssz"));
	fp(&pu, ref);
	ref.releaseanddelete();
	FreeLibrary(hin);
	return 0;
}
