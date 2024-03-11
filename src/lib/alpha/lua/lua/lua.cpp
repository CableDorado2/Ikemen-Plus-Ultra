
#include <windows.h>
#include <locale.h>
#include <process.h>
#include <stdint.h>

#include "lua.hpp"
#pragma comment(lib, "Lua5.2/lua52.lib")


void* (__stdcall *sszrefnewfunc)(intptr_t);
void (__stdcall *sszrefdeletefunc)(void*);

#include "../../../dll/ssz/ssz/sszdef.h"
#include "../../../dll/ssz/ssz/typeid.h"
#include "../../../dll/ssz/ssz/arrayandref.hpp"
#include "../../../dll/ssz/ssz/pluginutil.hpp"


const char SszRefMetaName[] = "SszRef";

SSZCALLBACK g_callback;
intptr_t g_refDestroy, g_refCopy;
void* g_handle = nullptr;

int refGc(lua_State *L)
{
	auto arg = (DynamicRef*)lua_touserdata(L, 1);
	g_callback(g_handle, g_refDestroy, &arg, sizeof(arg), 0);
	return 0;
}

int funcCall(lua_State* L)
{
	intptr_t func = lua_tointeger(L, lua_upvalueindex(1));
	int ret = 0;
	#pragma pack(push, 1)
	struct{
		int32_t* ret;
		lua_State** pL;
	} arg = {&ret, &L};
	#pragma pack(pop)
	g_callback(g_handle, func, &arg, sizeof(arg), 0);
	if(ret < 0) return luaL_error(L, "%s", lua_tostring(L, -1));
	return ret;
}

TUserFunc(void, Init, intptr_t refcopy, intptr_t refdest)
{
	g_callback = pu->psf->callback;
	g_handle = pu->handle;
	g_refDestroy = refdest;
	g_refCopy = refcopy;
}

TUserFunc(lua_State*, NewState)
{
	lua_State* L = luaL_newstate();
	luaL_openlibs(L);
	luaL_newmetatable(L, SszRefMetaName);
	lua_pushstring(L, "__gc");
	lua_pushcfunction(L, refGc);
	lua_settable(L, -3);
	return L;
}

TUserFunc(void, Close, lua_State* L)
{
	lua_settop(L, 0);
	lua_gc(L, LUA_GCCOLLECT, 0);
	lua_close(L);
}

TUserFunc(bool, RunFile, Reference filename, lua_State* L)
{
	return
		!luaL_loadfile(L, pu->refToAstr(CP_UTF8, filename).c_str())
		&& !lua_pcall(L, 0, 0, 0);
}

TUserFunc(bool, RunString, Reference s, lua_State* L)
{
	return
		!luaL_loadstring(L, pu->refToAstr(CP_UTF8, s).c_str())
		&& !lua_pcall(L, 0, 0, 0);
}

TUserFunc(int32_t, GetTop, lua_State* L)
{
	return lua_gettop(L);
}

TUserFunc(void, GetGlobal, Reference var, lua_State* L)
{
	lua_getglobal(L, pu->refToAstr(CP_UTF8, var).c_str());
}

TUserFunc(void, Register, intptr_t func, Reference var, lua_State* L)
{
	lua_pushinteger(L, func);
	lua_pushcclosure(L, funcCall, 1);
	lua_setglobal(L, pu->refToAstr(CP_UTF8, var).c_str());
}

TUserFunc(bool, Pcall, int32_t nresults, int32_t nargs, lua_State* L)
{
	return !lua_pcall(L, nargs, nresults, 0);
}

TUserFunc(void, Pop, int32_t n, lua_State* L)
{
	lua_pop(L, n);
}

TUserFunc(void, PushNumber, double n, lua_State* L)
{
	lua_pushnumber(L, n);
}

TUserFunc(bool, IsNumber, int32_t idx, lua_State* L)
{
	return lua_isnumber(L, idx) != 0;
}

TUserFunc(double, ToNumber, int32_t idx, lua_State* L)
{
	return lua_tonumber(L, idx);
}

TUserFunc(void, PushBoolean, bool b, lua_State* L)
{
	lua_pushboolean(L, b);
}

TUserFunc(bool, IsBoolean, int32_t idx, lua_State* L)
{
	return lua_isboolean(L, idx) != 0;
}

TUserFunc(bool, ToBoolean, int32_t idx, lua_State* L)
{
	return lua_toboolean(L, idx) != 0;
}

TUserFunc(void, PushString, Reference s, lua_State* L)
{
	lua_pushstring(L, pu->refToAstr(CP_UTF8, s).c_str());
}

TUserFunc(bool, IsString, int32_t idx, lua_State* L)
{
	return lua_isstring(L, idx) != 0;
}

TUserFunc(void, ToString, int32_t idx, Reference* s, lua_State* L)
{
	pu->setSSZFunc();
	pu->astrToRef(CP_UTF8, *s, lua_tostring(L, idx));
}

TUserFunc(void, PushRef, DynamicRef* userdata, lua_State* L)
{
	auto ud = (DynamicRef*)lua_newuserdata(L, sizeof(DynamicRef));
	*ud = *userdata;
	userdata->init();
	luaL_getmetatable(L, SszRefMetaName);
	lua_setmetatable(L, -2);
}

TUserFunc(void, ToRef, int32_t idx, DynamicRef* userdata, lua_State* L)
{
	auto ud = (DynamicRef*)lua_touserdata(L, idx);
	if(!ud) return;
	#pragma pack(push, 1)
	struct{
		DynamicRef d;
		DynamicRef* ud;
	} arg = {*ud, userdata};
	#pragma pack(pop)
	g_callback(g_handle, g_refCopy, &arg, sizeof(arg), 0);
}

