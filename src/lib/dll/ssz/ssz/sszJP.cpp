
#include <cmath>
#include <sstream>
#include <vector>
#include <unordered_map>
#include <queue>



#include "sszdef.h"

#include "locksingler.hpp"
#include "commandline.hpp"

static LONG g_KaihouStopCount = 0;
static std::basic_string<void*> g_KaihouStopList;
static LockSingler g_KaihouStopMutex;
static void* SSZ_STDCALL MemoryKakuho(intptr_t size)
{
	return new int8_t[size];
}
static void SSZ_STDCALL MemoryKaihou(void* p)
{
	if(g_KaihouStopCount != 0){
		AutoLocker al(&g_KaihouStopMutex);
		g_KaihouStopList += p;
	}else{
		delete[] (int8_t*)p;
	}
}
static void* SSZ_STDCALL SSZCallBack(
	void* pcbs, intptr_t calladr, void* phikisuu,
	intptr_t hikisize, intptr_t retsize);

static void* (SSZ_STDCALL* const sszrefnewfunc)(intptr_t) = MemoryKakuho;
static void (SSZ_STDCALL* const sszrefdeletefunc)(void*) = MemoryKaihou;

#include "typeid.h"

#include "arrayandref.hpp"

#define SSZ_CORE
#include "pluginutil.hpp"
#undef SSZ_CORE

#include "tostring.hpp"

#ifndef _WIN32

#include <dlfcn.h>
#include <stdarg.h>
#include <sys/mman.h>

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
	if(!hModule) return false;
	return dlclose(hModule) == 0;
}

static WCHR* _wfullpath(WCHR*, const WCHR *relPath, size_t)
{
	auto abs = realpath(PluginUtil::wToA(relPath).c_str(), nullptr);
	if(!abs) return nullptr;
	auto len = mbstowcs(nullptr, abs, 0);
	WCHR *wbuff;
	if(len >= 0){
		std::wstring gwstr;
		gwstr.resize(len);
		mbstowcs((wchar_t*)gwstr.data(), abs, len);
		auto wstr = PluginUtil::gwToW(gwstr);
		wbuff = (WCHR*)malloc((wstr.size() + 1) * sizeof(WCHR));
		size_t i = 0;
		for(auto c : wstr) wbuff[i++] = c;
		wbuff[i] = L('\0');
	}else{
		wbuff = nullptr;
	}
	free(abs);
	return wbuff;
}
static errno_t _wfopen_s(
	FILE** pFile, const WCHR *filename, const WCHR *mode)
{
	*pFile =
		fopen(PluginUtil::wToA(filename).c_str(), PluginUtil::wToA(mode).c_str());
	return *pFile ? 0 : EINVAL;
}

static void *VirtualAlloc(
	void *lpAddress, size_t dwSize, DWORD, DWORD flProtect)
{
	auto addr =
		mmap(lpAddress, dwSize, flProtect, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	if(addr == MAP_FAILED) return nullptr;
	return addr;
}
static BOOL VirtualProtect(
	void *lpAddress, size_t dwSize, DWORD flNewProtect, DWORD*)
{
	return mprotect(lpAddress, dwSize, flNewProtect) == 0;
}
static BOOL VirtualFree(void *lpAddress, size_t dwSize, DWORD)
{
	return munmap(lpAddress, dwSize) == 0;
}

static int MessageBox(
	void*, WCHR const *lpText, WCHR const *lpCaption, unsigned int)
{
	fprintf(
		stderr, "%s\n%s",
		PluginUtil::wToA(lpCaption).c_str(), PluginUtil::wToA(lpText).c_str());
	return 1;
}

#endif

struct GlobalPluginSSZFuncs
{
	PluginSSZFuncs sf;
	MEMBER GlobalPluginSSZFuncs()
	{
		sf.callback = SSZCallBack;
		sf.newfunc = sszrefnewfunc;
		sf.deletefunc = sszrefdeletefunc;
	}
};
static GlobalPluginSSZFuncs g_gpsf;




#include "errmes.hpp"

#include "tokenkind.h"

typedef void (SSZ_STDCALL* MAIN_FUNC)();
template<typename GC> struct SSZStatic
{
	ErrMes emes;
	std::WSTR exedir;
	GC CircularGC;
	std::basic_string<void (SSZ_STDCALL*)()> gbldel;
};

#define IDX(i) static_cast<intptr_t>(i)

#include "source.hpp"

#include "sourcetree.hpp"


struct LineAddress
{
	intptr_t address;
	std::WSTR *filename;
	intptr_t line;
};
class CodeAddressLines
{
	struct Range
	{
		uint8_t* start;
		uint8_t* end;
		std::basic_string<LineAddress>* addresses;
		MEMBER const LineAddress* get(uint8_t* adr)
		{
			intptr_t i = 0;
			for(; i < IDX(addresses->size()); i++){
				if(start + (*addresses)[i].address > adr){
					if(i == 0) return nullptr;
					return addresses->data() + (i-1);
				}
			}
			if(i == 0) return nullptr;
			return addresses->data() + (i-1);
		}
	};
	template<typename TYP> struct Node
	{
		TYP item;
		Node<TYP>* next;
		MEMBER Node()
		{
			next = nullptr;
		}
		MEMBER ~Node()
		{
			delete next;
		}
	};
	Node<Range>* top;
	LockSingler mtx;
public:
	MEMBER CodeAddressLines()
	{
		top = nullptr;
	}
	MEMBER ~CodeAddressLines()
	{
		delete top;
	}
	MEMBER void add(
		uint8_t* start, uint8_t* end,
		std::basic_string<LineAddress>* addresses)
	{
		AutoLocker al(&mtx);
		Node<Range>* tmp = top;
		top = new Node<Range>;
		top->item.start = start;
		top->item.end = end;
		top->item.addresses = addresses;
		top->next = tmp;
	}
	MEMBER void remove(uint8_t* start)
	{
		AutoLocker al(&mtx);
		if(top == nullptr) return;
		Node<Range>* tmp = top;
		if(top->item.start == start){
			top = tmp->next;
			tmp->next = nullptr;
			delete tmp;
			return;
		}
		for(; tmp->next != nullptr; tmp = tmp->next){
			if(tmp->next->item.start == start){
				Node<Range>* tmp2 = tmp->next;
				tmp->next = tmp2->next;
				tmp2->next = nullptr;
				delete tmp2;
				return;
			}
		}
	}
	MEMBER const LineAddress* get(uint8_t* adr)
	{
		AutoLocker al(&mtx);
		Node<Range>* tmp = top;
		for(; tmp != nullptr; tmp = tmp->next){
			if(tmp->item.start <= adr && adr < tmp->item.end){
				return tmp->item.get(adr);
			}
		}
		return nullptr;
	}
};
static CodeAddressLines g_cal;

static void appendText(wchar_t* str, int& idx, const wchar_t* txt)
{
	while(*txt != L('\0')) str[idx++] = *txt++;
}
template<typename T> static void appendHex(wchar_t* str, int& idx, T n)
{
	for(int i = (sizeof(T)*2-1)*4; i >= 0; i -= 4){
		switch(n >> i & 0xf){
    case   0: str[idx++]=L('0');break;case   1: str[idx++]=L('1');break;
		case   2: str[idx++]=L('2');break;case   3: str[idx++]=L('3');break;
    case   4: str[idx++]=L('4');break;case   5: str[idx++]=L('5');break;
		case   6: str[idx++]=L('6');break;case   7: str[idx++]=L('7');break;
    case   8: str[idx++]=L('8');break;case   9: str[idx++]=L('9');break;
		case 0xA: str[idx++]=L('A');break;case 0xB: str[idx++]=L('B');break;
    case 0xC: str[idx++]=L('C');break;case 0xD: str[idx++]=L('D');break;
		case 0xE: str[idx++]=L('E');break;case 0xF: str[idx++]=L('F');break;
		}
	}
}

#ifdef SSZ_EXCEPTION
static EXCEPTION_RECORD g_ERecord;
static CONTEXT g_EContext;

static void SSZException(uint8_t* adr)
{
	wchar_t mes[1024];
	int idx = 0;
	const LineAddress* la = g_cal.get(adr);
	if(la != nullptr){
		wchar_t buf[65];
		appendText(mes, idx, la->filename->data());
		mes[idx++] = L('(');
		_itow_s<65>((int)la->line, buf, 10);
		appendText(mes, idx, buf);
		appendText(mes, idx, L(") : "));
	}
	appendText(mes, idx, L("例外が発生しました。\n\n"));
	switch(g_ERecord.ExceptionCode){
	case EXCEPTION_ACCESS_VIOLATION:
		appendText(mes, idx, L("EXCEPTION_ACCESS_VIOLATION"));
		break;
	case EXCEPTION_DATATYPE_MISALIGNMENT:
		appendText(mes, idx, L("EXCEPTION_DATATYPE_MISALIGNMENT"));
		break;
	case EXCEPTION_BREAKPOINT:
		appendText(mes, idx, L("EXCEPTION_BREAKPOINT"));
		break;
	case EXCEPTION_SINGLE_STEP:
		appendText(mes, idx, L("EXCEPTION_SINGLE_STEP"));
		break;
	case EXCEPTION_ARRAY_BOUNDS_EXCEEDED:
		appendText(mes, idx, L("EXCEPTION_ARRAY_BOUNDS_EXCEEDED"));
		break;
	case EXCEPTION_FLT_DENORMAL_OPERAND:
		appendText(mes, idx, L("EXCEPTION_FLT_DENORMAL_OPERAND"));
		break;
	case EXCEPTION_FLT_DIVIDE_BY_ZERO:
		appendText(mes, idx, L("EXCEPTION_FLT_DIVIDE_BY_ZERO"));
		break;
	case EXCEPTION_FLT_INEXACT_RESULT:
		appendText(mes, idx, L("EXCEPTION_FLT_INEXACT_RESULT"));
		break;
	case EXCEPTION_FLT_INVALID_OPERATION:
		appendText(mes, idx, L("EXCEPTION_FLT_INVALID_OPERATION"));
		break;
	case EXCEPTION_FLT_OVERFLOW:
		appendText(mes, idx, L("EXCEPTION_FLT_OVERFLOW"));
		break;
	case EXCEPTION_FLT_STACK_CHECK:
		appendText(mes, idx, L("EXCEPTION_FLT_STACK_CHECK"));
		break;
	case EXCEPTION_FLT_UNDERFLOW:
		appendText(mes, idx, L("EXCEPTION_FLT_UNDERFLOW"));
		break;
	case EXCEPTION_INT_DIVIDE_BY_ZERO:
		appendText(mes, idx, L("EXCEPTION_INT_DIVIDE_BY_ZERO"));
		break;
	case EXCEPTION_INT_OVERFLOW:
		appendText(mes, idx, L("EXCEPTION_INT_OVERFLOW"));
		break;
	case EXCEPTION_IN_PAGE_ERROR:
		appendText(mes, idx, L("EXCEPTION_IN_PAGE_ERROR"));
		break;
	case EXCEPTION_ILLEGAL_INSTRUCTION:
		appendText(mes, idx, L("EXCEPTION_ILLEGAL_INSTRUCTION"));
		break;
	case EXCEPTION_NONCONTINUABLE_EXCEPTION:
		appendText(mes, idx, L("EXCEPTION_NONCONTINUABLE_EXCEPTION"));
		break;
	case EXCEPTION_STACK_OVERFLOW:
		appendText(mes, idx, L("EXCEPTION_STACK_OVERFLOW"));
		break;
	case EXCEPTION_INVALID_DISPOSITION:
		appendText(mes, idx, L("EXCEPTION_INVALID_DISPOSITION"));
		break;
	case EXCEPTION_GUARD_PAGE:
		appendText(mes, idx, L("EXCEPTION_GUARD_PAGE"));
		break;
	case EXCEPTION_INVALID_HANDLE:
		appendText(mes, idx, L("EXCEPTION_INVALID_HANDLE"));
		break;
	}
	appendText(mes, idx, L(" ("));
	appendHex(mes, idx, g_ERecord.ExceptionCode);
	appendText(mes, idx, L(")\naddress: "));
	appendHex(mes, idx, (ULONG_PTR)g_ERecord.ExceptionAddress);
	appendText(mes, idx, L("\ninformation:\n"));
	DWORD i;
	for(i = 0; i < g_ERecord.NumberParameters; i++){
		appendHex(mes, idx, g_ERecord.ExceptionInformation[i]);
		appendText(mes, idx, L("\n"));
	}
	mes[idx] = L('\0');
	MessageBox(nullptr, mes, g_dtitle, MB_OK | MB_ICONERROR);
}
#endif


static void DRDSwitch(
	void* pst, const int32_t id, HeapObj* const pho, MAIN_FUNC pm);

#include "anticircular.hpp"


static void SSZ_STDCALL RefDel(Reference* r)
{
	r->pointer->delet();
	r->init();
}

static bool SSZ_STDCALL CircRefCntDwn(
	SSZStatic<JunkanGoroshi>* ss, Reference* r)
{
	Reference tmp = *r;
	if(ss->CircularGC.RefRelease(&tmp) == nullptr){
		r->init();
		return false;
	}
	return true;
}

static void SSZ_STDCALL RefClassDel(
	void* (SSZ_STDCALL* deler)(), intptr_t csize, Reference* r);

static void SSZ_STDCALL RefCircRefClassDel(
	SSZStatic<JunkanGoroshi>* ss, void* (SSZ_STDCALL* deler)(),
	intptr_t csize, intptr_t nest, Reference* r)
{
	int8_t* p = r->pointer->head.data;
	intptr_t i, l = r->pointer->head.datasize;
	if(nest > 0){
		for(i = 0; i < l; i += sizeof(Reference)){
			if(CircRefCntDwn(ss, (Reference*)(p+i))){
				RefCircRefClassDel(
					ss, deler, csize, nest-1, (Reference*)(p+i));
				RefDel((Reference*)(p+i));
			}
		}
	}else{
		for(i = 0; i < l; i += sizeof(Reference)){
			if(CircRefCntDwn(ss, (Reference*)(p+i))){
				RefClassDel(deler, csize, (Reference*)(p+i));
				RefDel((Reference*)(p+i));
			}
		}
	}
}

static void SSZ_STDCALL DynRefDelete(
	SSZStatic<JunkanGoroshi>* ss, volatile DynamicRef* pdr, MAIN_FUNC pm)
{
	ss->CircularGC.DynrefDel(pdr, pm);
}


static void SSZ_STDCALL RefDynRefDel(
	SSZStatic<JunkanGoroshi>* ss, MAIN_FUNC pm, intptr_t nest, Reference* r)
{
	int8_t* p = r->pointer->head.data;
	intptr_t i, l = r->pointer->head.datasize;
	if(nest > 0){
		for(i = 0; i < l; i += sizeof(Reference)){
			if(CircRefCntDwn(ss, (Reference*)(p+i))){
				RefDynRefDel(ss, pm, nest-1, (Reference*)(p+i));
				RefDel((Reference*)(p+i));
			}
		}
	}else{
		for(i = 0; i < l; i += sizeof(DynamicRef)){
			DynRefDelete(ss, (DynamicRef*)(p+i), pm);
		}
	}
}

#include "x86.hpp"

#include "jitcompiler.hpp"


static void delrunner(
	SSZStatic<JunkanGoroshi>* ss,
	HeapObj* const ho, const intptr_t id, const intptr_t nest,
	const intptr_t ms, const intptr_t calladr)
{
	Reference ref;
	ref.init();
	ref.pointer = ho;
	SSZ_TRY
		if(id < 0){
			RefDynRefDel(ss, (MAIN_FUNC)calladr, nest-1, &ref);
		}else{
			if(nest > 0){
				RefCircRefClassDel(
					ss, (void* (SSZ_STDCALL*)())calladr, ms, nest-1, &ref);
			}else{
				RefClassDel((void* (SSZ_STDCALL*)())calladr, ms, &ref);
			}
		}
	SSZ_EXCEPT((uint8_t*)g_ERecord.ExceptionAddress)
}

struct GCDStruct
{
	HeapObj* hp;
	intptr_t rpid, nest;
	SSZStatic<JunkanGoroshi>* ss;
	MEMBER GCDStruct(SSZStatic<JunkanGoroshi>* sstat)
	{
		ss = sstat;
	}
};
struct GCTStruct
{
	bool running;
	SSZStatic<JunkanGoroshi>* ss;
	MEMBER GCTStruct(SSZStatic<JunkanGoroshi>* sstat)
	{
		ss = sstat;
	}
};

static unsigned THREADCALL GC_Thread_Proc(void* p)
{
	struct KMList
	{
		HeapObj* p;
		KMList* next;
		KMList()
		{
			p = nullptr;
			next = nullptr;
		}
	};
	GCDStruct gcds(((GCTStruct*)p)->ss);
	KMList* kml = nullptr;
	intptr_t ba = (intptr_t)gcds.ss->CircularGC.pbcode;
	volatile bool* run = &((GCTStruct*)p)->running;
	for(bool r = true; r || kml != nullptr; ){
		Sleep(100);
		while(
			r = *run,
			gcds.ss->CircularGC.PopNode(gcds.hp, gcds.rpid, gcds.nest))
		{
			if(
				!gcds.ss->CircularGC.junkanHantei(
					gcds.rpid, gcds.nest, gcds.hp))
			{
				continue;
			}
			gcds.hp->delLock();
			gcds.ss->CircularGC.CircStartDel(gcds.hp);
			delrunner(
				gcds.ss, gcds.hp, gcds.rpid, gcds.nest,
				gcds.ss->CircularGC.AtPL(gcds.rpid)[0],
				ba + (
				  gcds.rpid < 0 ? 0
				  : gcds.ss->CircularGC.AtPL(gcds.rpid)[1]));
			if(gcds.hp->rcount() != 0){
				KMList* tmp = new KMList();
				tmp->p = gcds.hp;
				tmp->next = kml;
				kml = tmp;
			}else{
				gcds.hp->delet();
			}
		}
		KMList* prev = nullptr;
		for(KMList* pk = kml; pk != nullptr; ){
			if(pk->p->rcount() == 0){
				pk->p->delet();
				KMList* tmp = pk;
				(prev != nullptr ? prev->next : kml) = pk = tmp->next;
				delete tmp;
			}else{
				prev = pk;
				pk = pk->next;
			}
		}
	}
	return 0;
}


static void runner(MAIN_FUNC mf)
{
	SSZ_TRY
		mf();
	SSZ_EXCEPT((uint8_t*)g_ERecord.ExceptionAddress)
}


#include "compiler-state.hpp"

TUserFunc(bool, Run, Reference r)
{
	CompilerState cs;
	auto error = cs.compile(pu->refToWstr(r));
	if(error.size() > 0){
		MessageBox(nullptr, error.c_str(), g_dtitle, MB_OK | MB_ICONERROR);
		return false;
	}
	return cs.run();
}

TUserFunc(CompilerState*, NewCompiler)
{
	return new CompilerState;
}

TUserFunc(void, DeleteCompiler, CompilerState* cs)
{
	delete cs;
}

TUserFunc(
	void, CompilerCompile, Reference* err, Reference file, CompilerState* cs)
{
	auto error = cs->compile(pu->refToWstr(file));
	pu->wstrToRef(*err, error);
}

TUserFunc(
	void, CompilerCompileString, Reference* err,
	Reference dir, Reference code, CompilerState* cs)
{
	auto error = cs->compileString(pu->refToWstr(code), pu->refToWstr(dir));
	pu->wstrToRef(*err, error);
}

TUserFunc(bool, CompilerRun, CompilerState* cs)
{
	return cs->run();
}
