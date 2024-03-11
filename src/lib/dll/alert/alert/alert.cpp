
#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"

TUserFunc(void, Alert, Reference title, Reference mes)
{
#ifdef _WIN32
	MessageBox(
		NULL, pu->refToWstr(mes).c_str(), pu->refToWstr(title).c_str(),
		MB_OK | MB_ICONWARNING);
#else
	fprintf(
		stderr, "%s\n%s\n",
		pu->wToA(pu->refToWstr(title)).c_str(),
		pu->wToA(pu->refToWstr(mes)).c_str());
#endif
}
