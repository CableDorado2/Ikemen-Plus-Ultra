
typedef void* (SSZ_STDCALL* SSZCALLBACK)
	(void*, intptr_t, void*, intptr_t, intptr_t);
#define TUserFunc(R_TYPE, FUNC, ...) \
	extern "C" __declspec(dllexport) R_TYPE SSZ_STDCALL \
	FUNC(PluginUtil* pu, ##__VA_ARGS__)

const int g_AlignmentSize = 4;

static inline intptr_t Aligner(const intptr_t i)
{
	return ((i+g_AlignmentSize-1)/g_AlignmentSize) * g_AlignmentSize;
}

template<typename TYPE> static inline intptr_t Aliszof()
{
	return Aligner(sizeof(TYPE));
}

struct PluginSSZFuncs
{
	SSZCALLBACK callback;
	void* (SSZ_STDCALL* newfunc)(intptr_t);
	void (SSZ_STDCALL* deletefunc)(void*);
};

struct PluginUtil
{
	PluginSSZFuncs* psf;
	void* handle;
	MEMBER PluginUtil(PluginSSZFuncs* const ps, void* const hn)
	{
		handle = hn;
		psf = ps;
	}
#ifndef SSZ_CORE
	MEMBER void setSSZFunc()
	{
		sszrefnewfunc = psf->newfunc;
		sszrefdeletefunc = psf->deletefunc;
	}
#endif
	STAMEM std::WSTR refToWstr(const Reference& strref)
	{
		std::WSTR wstr;
		if(!strref.null()){
			wstr.append(
				(WCHR*)strref.atpos(), strref.len()/sizeof(WCHR));
		}
		return wstr;
	}
	STAMEM void wstrToRef(Reference& strref, const std::WSTR& wstr)
	{
		strref.releaseanddelete();
		strref.refnew(wstr.size(), sizeof(WCHR));
		if(!strref.null()) memcpy(strref.atpos(), wstr.data(), strref.len());
	}
#ifdef _WIN32
	static std::string refToAstr(UINT CodePage, const Reference& strref)
	{
		std::string astr;
		if(!strref.null()){
			astr.resize(
				WideCharToMultiByte(CodePage, 0, (wchar_t*)strref.atpos(),
					(int)strref.len()/sizeof(char16_t),
					nullptr, 0, nullptr, nullptr));
			WideCharToMultiByte(CodePage, 0,
				(wchar_t*)strref.atpos(), strref.len()/sizeof(char16_t),
				(char*)astr.data(), astr.size(), nullptr, nullptr);
		}
		return astr;
	}
	static void astrToRef(
		UINT CodePage, Reference& strref, const std::string& astr)
	{
		strref.releaseanddelete();
		strref.refnew(
			MultiByteToWideChar(
				CodePage, 0, astr.data(), astr.size(), nullptr, 0),
			sizeof(char16_t));
		if(!strref.null()){
			MultiByteToWideChar(
				CodePage, 0, astr.data(), astr.size(),
				(wchar_t*)strref.atpos(), strref.len()/sizeof(char16_t));
		}
	}
#else
	STAMEM std::WSTR gwToW(const std::wstring& gwstr)
	{
		std::WSTR wstr;
		for(auto c : gwstr){
			if(c < 0x10000){
				wstr += (WCHR)c;
			}else{
				c -= 0x10000;
				wstr += WCHR(0xd800 | ((c >> 10) & 0x3ff));
				wstr += WCHR(0xdc00 | (c & 0x3ff));
			}
		}
		return wstr;
	}
	STAMEM std::wstring wToGw(const std::WSTR& wstr)
	{
		std::wstring gwstr;
		for(size_t i = 0; i < wstr.size(); i++){
			if(
				wstr[i] >> 10 == 0x36 && i + 1 < wstr.size()
				&& wstr[i + 1] >> 10 == 0x37)
			{
				gwstr +=
					wchar_t(((wstr[i]&0x3ff) << 10 | (wstr[i + 1]&0x3ff)) + 0x10000);
			}else{
				gwstr += (wchar_t)wstr[i];
			}
		}
		return gwstr;
	}
	STAMEM std::string wToA(const std::WSTR& wstr)
	{
		std::wstring gwstr = wToGw(wstr);
		std::string str;
		for(size_t woffset = 0; woffset < gwstr.size();){
			auto len = wcstombs(nullptr, gwstr.c_str() + woffset, 0);
			if(size_t(len + 1) > 1){
				auto oldsize = str.size();
				str.resize(oldsize + len);
				wcstombs((char*)str.data() + oldsize, gwstr.c_str() + woffset, len);
			}
			woffset += wcslen(gwstr.c_str() + woffset);
			if(woffset >= gwstr.size()) break;
			if(gwstr[woffset] == L'\0'){
				str += '\0';
				woffset++;
			}else{
				break;
			}
		}
		return str;
	}
	STAMEM std::WSTR aToW(const std::string& str)
	{
		std::wstring gwstr;
		for(size_t aoffset = 0; aoffset < str.size();){
			auto len = mbstowcs(nullptr, str.c_str() + aoffset, 0);
			if(size_t(len + 1) > 1){
				auto oldsize = gwstr.size();
				gwstr.resize(oldsize + len);
				mbstowcs(
					(wchar_t*)gwstr.data() + oldsize, str.c_str() + aoffset, len);
			}
			aoffset += strlen(str.c_str() + aoffset);
			if(aoffset >= str.size()) break;
			if(str[aoffset] == '\0'){
				gwstr += L'\0';
				aoffset++;
			}else{
				break;
			}
		}
		return gwToW(gwstr);
	}
#endif
};
