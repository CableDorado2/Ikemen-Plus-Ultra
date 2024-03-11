
#ifdef _WIN32
#include <regex>
#define RNS std
#else
#include <boost/regex.hpp>
#define RNS boost
#endif

#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"


TUserFunc(RNS::wregex*, NewRegex, Reference* error, bool i, Reference ptn)
{
	pu->setSSZFunc();
	error->releaseanddelete();
	RNS::wregex* re = nullptr;
	try{
		auto flag = RNS::wregex::ECMAScript | RNS::wregex::optimize;
		if(i) flag |= RNS::wregex::icase;
		re = new RNS::wregex(
#ifdef _WIN32
			pu->refToWstr(ptn),
#else
			pu->wToGw(pu->refToWstr(ptn)),
#endif
			flag);
	}catch(RNS::regex_error e){
#ifdef _WIN32
		pu->astrToRef(CP_THREAD_ACP, *error, e.what());
#else
		pu->wstrToRef(*error, pu->aToW(e.what()));
#endif
		delete re;
		re = nullptr;
	}
	return re;
}

TUserFunc(void, DeleteRegex, RNS::wregex* re)
{
	delete re;
}

TUserFunc(
	void, RegexSearch, Reference* matches, Reference str, RNS::wregex* re)
{
	pu->setSSZFunc();
	matches->releaseanddelete();
	if(!re) return;
	bool found = false;
#ifdef _WIN32
	RNS::wcmatch match;
	if(str.len() > 0){
		auto first = (const wchar_t*)str.atpos();
		auto last = first + str.len()/sizeof(wchar_t);
		found = RNS::regex_search(first, last, match, *re);
	}else{
		found = RNS::regex_search(L"", match, *re);
	}
#else
	RNS::match_results<std::wstring::const_iterator> match;
	auto gwstr = pu->wToGw(pu->refToWstr(str));
	if(str.len() > 0){
		found = RNS::regex_search(pu->wToGw(pu->refToWstr(str)), match, *re);
	}else{
		found = RNS::regex_search(std::wstring(), match, *re);
	}
#endif
	if(!found) return;
	matches->refnew(match.size(), sizeof(Reference));
	for(RNS::wcmatch::size_type i = 0; i < match.size(); i++){
		auto p = match.position(i);
#ifndef _WIN32
		if(p != (RNS::wcmatch::difference_type)-1){
			auto pos = p;
			for(size_t j = 0; j < pos; j++) if(gwstr[j] >= 0x10000) ++p;
		}
#endif
		((Reference*)matches->atpos())[i].init();
		if(match.length(i) > 0){
			((Reference*)matches->atpos())[i].copy(str);
			((Reference*)matches->atpos())[i].position += p*sizeof(WCHR);
			auto l = match.length(i);
#ifndef _WIN32
			auto end = match.position(i) + l;
			for(auto j = match.position(i); j < end; ++j){
				if(gwstr[j] >= 0x10000) ++l;
			}
#endif
			((Reference*)matches->atpos())[i].length = l*sizeof(WCHR);
		}else{
			((Reference*)matches->atpos())[i].position =
				(
					p != (RNS::wcmatch::difference_type)-1
					? str.pos() + p : -1) * sizeof(WCHR);
		}
	}
}
