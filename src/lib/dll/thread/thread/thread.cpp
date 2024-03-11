
#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"


TUserFunc(void, Delay, uint32_t ui)
{
	Sleep(ui);
}
