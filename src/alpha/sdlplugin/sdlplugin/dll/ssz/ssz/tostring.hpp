
template<typename T> static std::WSTR IntToString(T i)
{
#ifdef _WIN32
	return std::to_wstring(i);
#else
	return PluginUtil::gwToW(std::to_wstring(i));
#endif
}

static std::WSTR ToFloatString(std::WSTR numStr)
{
	auto loc = numStr.find(L(','));
	if(loc != numStr.npos) numStr[loc] = (L'.');
	loc = numStr.find(L('E'));
	if(loc != numStr.npos) numStr[loc] = L('e');
	if(numStr.find(L('.')) == numStr.npos){
		loc = numStr.find(L('e'));
		if(loc != numStr.npos){
			numStr.insert(loc, L(".0"));
		}else{
			numStr += L(".0");
		}
	}
	return numStr;
}

static std::WSTR InfiniteString(double d)
{
	return _isnan(d) ? L("nan") : (d < 0 ? L("-inf") : L("inf"));
}

template<typename T> static std::WSTR FloatToString(T f)
{
	if(!_finite(f)) return InfiniteString(f);
	std::wstringstream ss;
	ss.precision(sizeof(T) > 4 ? 16 : 7);
	ss << f;
#ifdef _WIN32
	return ToFloatString(ss.str());
#else
	return ToFloatString(PluginUtil::gwToW(ss.str()));
#endif
}

static std::WSTR CharToString(char16_t c)
{
	WCHR s[] = {c, L('\0')};
	return s;
}

static std::WSTR BoolToString(bool b)
{
	return b ? L("true") : L("false");
}
