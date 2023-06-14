
#include <windows.h>
#include <process.h>
#include <stdint.h>


void* (__stdcall *sszrefnewfunc)(intptr_t);
void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/sszdef.h"
#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"

TUserFunc(bool, ShellOpen, bool act, bool wait, Reference direct, Reference param, Reference file)
{
	SHELLEXECUTEINFO sei;
	std::wstring f = pu->refToWstr(file);
	std::wstring p = pu->refToWstr(param);
	std::wstring d = pu->refToWstr(direct);
	sei.cbSize		 = sizeof(sei);
	sei.fMask		 = wait ? SEE_MASK_NOCLOSEPROCESS : 0;
	sei.hwnd		 = 0;
	sei.lpVerb		 = L"open";
	sei.lpFile		 = f.c_str();
	sei.lpParameters = p.c_str();
	sei.lpDirectory  = d.c_str();
	sei.nShow		 = (act ? SW_NORMAL : SW_SHOWMINNOACTIVE);
	if(ShellExecuteEx(&sei)){
		if(wait) WaitForSingleObject(sei.hProcess, INFINITE);
	}else{
		return false;
	}
	return true;
}

TUserFunc(bool, MoveTrash, Reference file)
{
	std::wstring f = pu->refToWstr(file);
	wchar_t* pwc = _wfullpath(NULL, f.c_str(), 0);
	if(pwc == NULL) return false;
	f = pwc;
	free(pwc);
	SHFILEOPSTRUCT sfos;
	ZeroMemory(&sfos, sizeof(SHFILEOPSTRUCT));
	f += L'\0';
	f += L'\0';
	sfos.hwnd = NULL;
	sfos.wFunc = FO_DELETE;
	sfos.pFrom = f.data();
	sfos.fFlags = FOF_ALLOWUNDO | FOF_NOCONFIRMATION | FOF_WANTNUKEWARNING;
	return SHFileOperation(&sfos) == 0;
}

