class CompilerState
{
	SSZStatic<JunkanGoroshi> ss;
	STStatic<SourceTree<JunkanGoroshi>, JunkanGoroshi> ststat;
	SourceTree<JunkanGoroshi> src;
	std::basic_string<LineAddress> lineAdr;
	MAIN_FUNC mai;
	MEMBER std::WSTR compileSub1()
	{
		if(mai) return L("すでにコンパイル済みです。");
		src.Clear();//rootなので
		ss.CircularGC.Clear();
		return L("");
	}
	MEMBER std::WSTR compileSub2()
	{
		{
			JITer jr(&src);
			mai = jr.Compile(&lineAdr);
		}
		if(mai == nullptr) return ss.emes.mes;
		ss.CircularGC.SetKankyou(&src, (void*)mai);
		return L("");
	}
public:
	MEMBER CompilerState() : ststat(&ss), src(&ststat)
	{
		CommandLineString<WCHR> cmdline;
#ifdef _WIN32
		cmdline.set(GetCommandLine());
#else
		std::string buf("/proc/");
		buf += std::to_string(getpid());
		buf += "/cmdline";
		auto pFile = fopen(buf.c_str(),"rb");
		if(pFile){
			int c;
			std::vector<std::WSTR> argv;
			buf.clear();
			while((c = fgetc(pFile)) != EOF){
				if(!c){
					argv.push_back(PluginUtil::aToW(buf));
					buf.clear();
				}else{
					buf += (char)c;
				}
			}
			fclose(pFile);
			cmdline.swap(argv);
		}
#endif
		auto i = cmdline.get()[0].find_last_of(PATHSEPARATOR);
		ss.exedir.clear();
		if(i != std::string::npos) ss.exedir.append(cmdline.get()[0].data(), i+1);
		mai = nullptr;
	}
	MEMBER ~CompilerState()
	{
		if(mai) VirtualFree((void*)mai, 0, MEM_RELEASE);
	}
	MEMBER std::WSTR compile(const std::WSTR& file)
	{
		auto error = compileSub1();
		if(error.size() > 0) return error;
		if(!src.FileRead(file.size() > 0 ? file.data() : L("main.ssz"))){
			return ss.emes.mes;
		}
		return compileSub2();
	}
	MEMBER std::WSTR compileString(const std::WSTR& code, const std::WSTR& dir)
	{
		auto error = compileSub1();
		if(error.size() > 0) return error;
		if(!src.StringRead(code, dir)) return ss.emes.mes;
		return compileSub2();
	}
	MEMBER bool run()
	{
		if(!mai) return false;
		GCTStruct gcts(&ss);
		gcts.running = true;
		HANDLE gcthr =
			(HANDLE)_beginthreadex(
				nullptr, 0, GC_Thread_Proc, &gcts, 0, nullptr);
		ss.emes.appendable = false;
		runner(mai);
		gcts.running = false;
		WaitForSingleObject(gcthr, INFINITE);
		CloseHandle(gcthr);
		g_cal.remove((uint8_t*)mai);
		return true;
	}
};
