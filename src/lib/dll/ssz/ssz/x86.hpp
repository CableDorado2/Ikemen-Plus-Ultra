
static void* SSZ_STDCALL SSZCallBack(
	void* pcbs, intptr_t calladr, void* phikisuu,
	intptr_t hikisize, intptr_t retsize)
{
	void* pend = (int8_t*)phikisuu + hikisize;
	int32_t i32, i32_2;
	switch(retsize){
	case 0:
#ifdef _MSC_VER
		__asm{
			mov ecx,pend
			mov edx,phikisuu
		loop_0:
			cmp edx,ecx
			jnb loop_0e
			sub ecx,4
			push dword ptr [ecx]
			jmp loop_0
		loop_0e:
			call calladr
		}
#else
		asm volatile(
			"loop_0:\n"
			"  cmpl %0,%1\n"
			"  jnb loop_0e\n"
			"  subl $4,%0\n"
			"  pushl (%0)\n"
			"  jmp loop_0\n"
			"loop_0e:\n"
			"  call *%2\n"
			:: "g"(pend), "g"(phikisuu), "r"(calladr)
		);
#endif
		break;
	case 1:
	case 2:
	case 4:
#ifdef _MSC_VER
		__asm{
			mov ecx,pend
			mov edx,phikisuu
		loop_4:
			cmp edx,ecx
			jnb loop_4e
			sub ecx,4
			push dword ptr [ecx]
			jmp loop_4
		loop_4e:
			call calladr
			mov i32,eax
		}
#else
		asm volatile(
			"  pushl %ecx\n"
			"  pushl %edx\n"
			"  pushl %eax\n"
		);
		asm volatile(
			"loop_4:\n"
			"  cmpl %1,%2\n"
			"  jnb loop_4e\n"
			"  subl $4,%1\n"
			"  pushl (%1)\n"
			"  jmp loop_4\n"
			"loop_4e:\n"
			"  call *%3\n"
			"  movl %%eax,%0\n"
			"  popl %%eax\n"
			"  popl %%edx\n"
			"  popl %%ecx\n"
			: "=g"(i32)
			: "g"(pend), "g"(phikisuu), "r"(calladr)
		);
#endif
		switch(retsize){
		case 1:
			*(int8_t*)pcbs = (int8_t)i32;
			break;
		case 2:
			*(int16_t*)pcbs = (int16_t)i32;
			break;
		case 4:
			*(int32_t*)pcbs = i32;
			break;
		}
		break;
	case 8:
#ifdef _MSC_VER
		__asm{
			mov ecx,pend
			mov edx,phikisuu
		loop_8:
			cmp edx,ecx
			jnb loop_8e
			sub ecx,4
			push dword ptr [ecx]
			jmp loop_8
		loop_8e:
			call calladr
			mov i32,eax
			mov i32_2,edx
		}
#else
		asm volatile(
			"  pushl %ecx\n"
			"  pushl %edx\n"
			"  pushl %eax\n"
		);
		asm volatile(
			"loop_8:\n"
			"  cmpl %2,%3\n"
			"  jnb loop_8e\n"
			"  subl $4,%2\n"
			"  pushl (%2)\n"
			"  jmp loop_8\n"
			"loop_8e:\n"
			"  call *%4\n"
			"  movl %%eax,%0\n"
			"  movl %%edx,%1\n"
			"  popl %%eax\n"
			"  popl %%edx\n"
			"  popl %%ecx\n"
			: "=g"(i32), "=g"(i32_2)
			: "g"(pend), "g"(phikisuu), "r"(calladr)
		);
#endif
		*(int64_t*)pcbs = (int64_t)i32 | ((int64_t)i32_2<<32);
		break;
	}
	return pcbs;
}

static void SSZ_STDCALL RefClassDel(
	void* (SSZ_STDCALL* deler)(), intptr_t csize, Reference* r)
{
	int8_t* p;
	int8_t* endp;
	for(
		p = r->pointer->head.data,
		endp = p + r->pointer->head.datasize; p < endp; p += csize)
	{
#ifdef _MSC_VER
		__asm{
			push edi
			push esi
			push ebx
			mov edi,p
			call deler
			pop ebx
			pop esi
			pop edi
		}
#else
		asm volatile(
			"  pushl %edi\n"
			"  pushl %esi\n"
			"  pushl %ebx\n"
			"  pushl %ecx\n"
			"  pushl %edx\n"
			"  pushl %eax\n"
		);
		asm volatile(
			"  call *%1\n"
			"  popl %%eax\n"
			"  popl %%edx\n"
			"  popl %%ecx\n"
			"  popl %%ebx\n"
			"  popl %%esi\n"
			"  popl %%edi\n"
			:: "D"(p), "r"(deler)
		);
#endif
	}
}

static void DRDSwitch(
	void* vst, const int32_t id, HeapObj* const pho, MAIN_FUNC pm)
{
	SourceTree<JunkanGoroshi>* pst = (SourceTree<JunkanGoroshi>*)vst;
	if(
		0 <= id && id <= ENDCLASS_TYPEID
		&& pst->stat->funclist.Get(id)->deladress > 0)
	{
		intptr_t ms = pst->stat->funclist.Get(id)->GetMemberSize();
		for(intptr_t i = 0; i < pho->head.datasize; i += ms){
			void* p = pho->head.data + i;
			intptr_t calladr =
				(intptr_t)pm + pst->stat->funclist.Get(id)->deladress;
#ifdef _MSC_VER
			__asm{
				push edi
				push esi
				push ebx
				mov edi,p
				call calladr
				pop ebx
				pop esi
				pop edi
			}
#else
			asm volatile(
				"  pushl %edi\n"
				"  pushl %esi\n"
				"  pushl %ebx\n"
				"  pushl %ecx\n"
				"  pushl %edx\n"
				"  pushl %eax\n"
			);
			asm volatile(
				"  call *%1\n"
				"  popl %%eax\n"
				"  popl %%edx\n"
				"  popl %%ecx\n"
				"  popl %%ebx\n"
				"  popl %%esi\n"
				"  popl %%edi\n"
				:: "D"(p), "r"(calladr)
			);
#endif
		}
	}else if(-1 >= id && id >= ENDCLASS_TYPEID){
		for(intptr_t i = 0; i < pho->head.datasize; i += sizeof(Thread)){
			((Thread*)(pho->head.data+i))->wait();
		}
	}else if(id == DYNREF_TYPEID || id == DYNLIST_TYPEID){
		for(intptr_t i = 0; i < pho->head.datasize; i += sizeof(DynamicRef)){
			DynRefDelete(pst->stat->ss, (DynamicRef*)(pho->head.data+i), pm);
		}
	}
	pho->delet();
}

struct ThreadStructure
{
	void* calladr;
	void* (SSZ_STDCALL* jigoshori)();
	void* argument;
	intptr_t argsize;
};
static unsigned THREADCALL ThreadFunction(void* p)
{
	void *parg = ((ThreadStructure*)p)->argument,
		*cadr = ((ThreadStructure*)p)->calladr, *pend;
	pend = (int8_t*)parg + ((ThreadStructure*)p)->argsize;
#ifdef _MSC_VER
	__asm{
		mov ecx,pend
		mov edx,parg
	loop1:
		cmp edx,ecx
		jnb loop1e
		sub ecx,4
		push dword ptr [ecx]
		jmp loop1
	loop1e:
		call cadr
	}
#else
	asm volatile(
		"  pushl %ecx\n"
		"  pushl %edx\n"
		"  pushl %eax\n"
	);
	asm volatile(
		"loop1:\n"
		"  cmpl %0,%1\n"
		"  jnb loop1e\n"
		"  subl $4,%0\n"
		"  pushl (%0)\n"
		"  jmp loop1\n"
		"loop1e:\n"
		"  call *%2\n"
		"  popl %%eax\n"
		"  popl %%edx\n"
		"  popl %%ecx\n"
		:: "g"(pend), "g"(parg), "r"(cadr)
	);
#endif
	cadr = (void*)((ThreadStructure*)p)->jigoshori;
	if(cadr != nullptr){
#ifdef _MSC_VER
		__asm{
			push edi
			push esi
			push ebx
			mov edi,parg
			call cadr
			pop ebx
			pop esi
			pop edi
		}
#else
		asm volatile(
			"  pushl %edi\n"
			"  pushl %esi\n"
			"  pushl %ebx\n"
			"  pushl %ecx\n"
			"  pushl %edx\n"
			"  pushl %eax\n"
		);
		asm volatile(
			"  call *%1\n"
			"  popl %%eax\n"
			"  popl %%edx\n"
			"  popl %%ecx\n"
			"  popl %%ebx\n"
			"  popl %%esi\n"
			"  popl %%edi\n"
			:: "D"(parg), "r"(cadr)
		);
#endif
	}
	delete [] (int8_t*)parg;
	delete (ThreadStructure*)p;
	return 0;
}

struct RefNewStructure
{
	void *newf;
	intptr_t csize;
};
static void SSZ_STDCALL RefClassNewCB(void* p, int8_t* pdata, intptr_t len)
{
	int8_t* pend = pdata + len;
	void* newer = ((RefNewStructure*)p)->newf;
	for(; pdata < pend; pdata += ((RefNewStructure*)p)->csize){
#ifdef _MSC_VER
		__asm{
			push edi
			push esi
			push ebx
			mov edi,pdata
			call newer
			pop ebx
			pop esi
			pop edi
		}
#else
		asm volatile(
			"  pushl %edi\n"
			"  pushl %esi\n"
			"  pushl %ebx\n"
			"  pushl %ecx\n"
			"  pushl %edx\n"
			"  pushl %eax\n"
		);
		asm volatile(
			"  call *%1\n"
			"  popl %%eax\n"
			"  popl %%edx\n"
			"  popl %%ecx\n"
			"  popl %%ebx\n"
			"  popl %%esi\n"
			"  popl %%edi\n"
			:: "D"(pdata), "r"(newer)
		);
#endif
	}
}

struct BinaryCode
{
	std::basic_string<uint8_t> code;
	std::basic_string<LineAddress>* lineadr;
	std::basic_string<intptr_t> gbladrbp;
	std::basic_string<intptr_t> cadrpbp;
	std::basic_string<intptr_t> cadrmbp;
	enum REGISTER
	{
		EAX = 0, ECX = 1, EDX = 2, EBX = 3, ESP = 4, EBP = 5, ESI = 6, EDI = 7
	};
	enum REGISTER8
	{
		AL = 0, CL = 1, DL = 2, BL = 3, AH = 4, CH = 5, DH = 6, BH = 7
	};
	enum AddressType
	{
		AT_LOCAL, AT_MEMBER, AT_GLOBAL, AT_SANSHOU
	};
	MEMBER inline uint8_t ModRM(uint8_t mod, uint8_t reg, uint8_t rm)
	{
		return mod<<6 | reg<<3 | rm;
	}
	MEMBER inline uint8_t SIB(uint8_t scale, REGISTER index, REGISTER base)
	{
		return scale<<6 | index<<3 | base;
	}
	MEMBER void PBackpatch(std::basic_string<intptr_t>& plist, const int32_t adr)
	{
		for(intptr_t i = 0; i < IDX(plist.size()); i++){
			*(int32_t*)(code.data()+plist[i]) += adr;
		}
		std::basic_string<intptr_t> dummy;
		plist.swap(dummy);
	}
	MEMBER void MBackpatch(std::basic_string<intptr_t>& plist, const int32_t adr)
	{
		for(intptr_t i = 0; i < IDX(plist.size()); i++){
			*(int32_t*)(code.data()+plist[i]) -= adr;
		}
		std::basic_string<intptr_t> dummy;
		plist.swap(dummy);
	}
	template<typename T> MEMBER void AtaiCode(const T x)
	{
		code.resize(code.size()+sizeof(T));
		*(T*)(code.data()+code.size()-sizeof(T)) = x;
	}
	MEMBER void GlobalAddress(const uint8_t ro, const int32_t adr)
	{
		AtaiCode(ModRM(0, ro, 5));
		gbladrbp += code.size();
		AtaiCode(adr);
	}
	MEMBER void LocalAddress(const uint8_t ro, const int32_t adr)
	{
		if(INT8_MIN <= adr+8 && adr+8 <= INT8_MAX){
			AtaiCode(ModRM(1, ro, 5));
			AtaiCode((int8_t)(adr+8));
		}else{
			AtaiCode(ModRM(2, ro, 5));
			AtaiCode((int32_t)(adr+8));
		}
	}
	MEMBER void MemberAddress(const uint8_t ro, const int32_t adr)
	{
		if(adr == 0){
			AtaiCode(ModRM(0, ro, EDI));
		}else if(INT8_MIN <= adr && adr <= INT8_MAX){
			AtaiCode(ModRM(1, ro, 4));
			AtaiCode(SIB(0, ESP, EDI));
			AtaiCode((int8_t)adr);
		}else{
			AtaiCode(ModRM(2, ro, 4));
			AtaiCode(SIB(0, ESP, EDI));
			AtaiCode((int32_t)adr);
		}
	}
	MEMBER void SanshouAddress(const uint8_t ro, const int32_t adr)
	{
		if(adr == 0){
			AtaiCode(ModRM(0, ro, ESI));
		}else if(INT8_MIN <= adr && adr <= INT8_MAX){
			AtaiCode(ModRM(1, ro, 4));
			AtaiCode(SIB(0, ESP, ESI));
			AtaiCode((int8_t)adr);
		}else{
			AtaiCode(ModRM(2, ro, 4));
			AtaiCode(SIB(0, ESP, ESI));
			AtaiCode((int32_t)adr);
		}
	}
	MEMBER bool ModAddress(
		const uint8_t ro, const AddressType at, const int32_t adr)
	{
		switch(at){
		case AT_LOCAL:
			LocalAddress(ro, adr);
			break;
		case AT_MEMBER:
			MemberAddress(ro, adr);
			break;
		case AT_GLOBAL:
			GlobalAddress(ro, adr);
			break;
		case AT_SANSHOU:
			SanshouAddress(ro, adr);
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER void StktopAddress(const uint8_t ro)
	{
		AtaiCode(ModRM(0, ro, 4));
		AtaiCode(SIB(0, ESP, ESP));
	}
	MEMBER void MovRegImm(const REGISTER r, const int32_t i32)
	{
		code += 0xB8 | r;
		AtaiCode(i32);
	}
	MEMBER void MovRegReg(const REGISTER r1, const REGISTER r2)
	{
		if(r1 == r2) return;
		code += 0x8B;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void MovRegFun(
		const REGISTER r,
		int32_t byteadress, std::basic_string<intptr_t>& backpatch)
	{
		code += 0xB8 | r;
		if(byteadress == 0) backpatch += code.size();
		cadrpbp += code.size();
		AtaiCode(byteadress);
	}
	MEMBER void MovRegSIB(const REGISTER r, const uint8_t sib, const int32_t disp)
	{
		code += 0x8B;
		if(disp == 0){
			AtaiCode(ModRM(0, r, 4));
			AtaiCode(sib);
		}else if(INT8_MIN <= disp && disp <= INT8_MAX){
			AtaiCode(ModRM(1, r, 4));
			AtaiCode(sib);
			AtaiCode((int8_t)disp);
		}else{
			AtaiCode(ModRM(2, r, 4));
			AtaiCode(sib);
			AtaiCode(disp);
		}
	}
	MEMBER bool MovRegAdr(
		const REGISTER r, const AddressType at, const int32_t adr)
	{
		if(at == AT_SANSHOU && adr == 0){
			MovRegReg(r, ESI);
			return true;
		}
		code += 0x8D;
		return ModAddress(r, at, adr);
	}
	MEMBER bool MovRegHns(
		const REGISTER r, const AddressType at,
		const int32_t adr, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0x8B;
		return ModAddress(r, at, adr);
	}
	MEMBER bool MovHnsImm(
		const AddressType at, const int32_t adr,
		const int32_t i32, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0xC7;
		if(!ModAddress(0, at, adr)) return false;
		if(oso){
			AtaiCode((int16_t)i32);
		}else{
			AtaiCode(i32);
		}
		return true;
	}
	MEMBER intptr_t MovHnsCadr(
		const AddressType at, const int32_t adr, const int32_t i32)
	{
		code += 0xC7;
		if(!ModAddress(0, at, adr)) return -1;
		cadrpbp += code.size();
		AtaiCode(i32);
		return code.size() - 4;
	}
	MEMBER bool MovHnsReg(
		const AddressType at, const int32_t adr,
		const REGISTER r, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0x89;
		return ModAddress(r, at, adr);
	}
	MEMBER bool MemCopy(
		const REGISTER src,
		const AddressType at, const int32_t adr, int32_t size)
	{
		if(size <= 0) return true;
		MovRegReg(EDX, EDI);
		if((at != AT_MEMBER || adr != 0) && !MovRegAdr(EDI, at, adr)){
			return false;
		}
		if(at == AT_SANSHOU) MovRegReg(EBX, ESI);
		MovRegReg(ESI, src);
		if(size/4 > 0){
			if(size/4 > 1){
				MovRegImm(ECX, size/4);
				code += 0xF3;
			}
			code += 0xA5;
		}
		if((size%4)/2 > 0){
			code += 0x66;
			code += 0xA5;
		}
		if((size%4)%2 > 0){
			code += 0xA4;
		}
		if(at == AT_SANSHOU) MovRegReg(ESI, EBX);
		MovRegReg(EDI, EDX);
		return true;
	}
	MEMBER void XchgRegReg(const REGISTER r1, const REGISTER r2)
	{
		if(r1 == EAX){
			code += 0x90 | r2;
		}else if(r2 == EAX){
			code += 0x90 | r1;
		}else{
			if(r1 == r2) return;
			code += 0x87;
			AtaiCode(ModRM(3, r1, r2));
		}
	}
	MEMBER void LeaSIB(const REGISTER r, const uint8_t sib, const int32_t disp)
	{
		code += 0x8D;
		if(disp == 0){
			AtaiCode(ModRM(0, r, 4));
			AtaiCode(sib);
		}else if(INT8_MIN <= disp && disp <= INT8_MAX){
			AtaiCode(ModRM(1, r, 4));
			AtaiCode(sib);
			AtaiCode((int8_t)disp);
		}else{
			AtaiCode(ModRM(2, r, 4));
			AtaiCode(sib);
			AtaiCode(disp);
		}
	}
	MEMBER void Cdq()
	{
		code += 0x99;
	}
	MEMBER void Cwde(const bool oso)
	{
		if(oso) code += 0x66;
		code += 0x98;
	}
	MEMBER void PushImm(const int32_t i32)
	{
		if(INT8_MIN <= i32 && i32 <= INT8_MAX){
			code += 0x6A;
			AtaiCode((int8_t)i32);
		}else{
			code += 0x68;
			AtaiCode(i32);
		}
	}
	MEMBER void PushImm64(const int64_t i64)
	{
		PushImm((int32_t)(i64 >> 32 & 0xffffffff));
		PushImm((int32_t)(i64 & 0xffffffff));
	}
	MEMBER intptr_t PushCadr(const int32_t adr)
	{
		code += 0x68;
		cadrpbp += code.size();
		AtaiCode(adr);
		return code.size() - 4;
	}
	MEMBER void PushFadr(
		int32_t byteadress, std::basic_string<intptr_t>& backpatch)
	{
		code += 0x68;
		cadrpbp += code.size();
		if(byteadress == 0) backpatch += code.size();
		AtaiCode((int32_t)byteadress);
	}
	MEMBER void PushSIB(const uint8_t sib, const int32_t disp)
	{
		code += 0xFF;
		if(disp == 0){
			AtaiCode(ModRM(0, 6, 4));
			AtaiCode(sib);
		}else if(INT8_MIN <= disp && disp <= INT8_MAX){
			AtaiCode(ModRM(1, 6, 4));
			AtaiCode(sib);
			AtaiCode((int8_t)disp);
		}else{
			AtaiCode(ModRM(2, 6, 4));
			AtaiCode(sib);
			AtaiCode(disp);
		}
	}
	MEMBER bool PushHns(const AddressType at, const int32_t adr)
	{
		code += 0xFF;
		return ModAddress(6, at, adr);
	}
	MEMBER bool PushHnsRef(
		const AddressType at, const int32_t adr, const bool dyn)
	{
		if(dyn && !PushHns(at, adr+12)) return false;
		return PushHns(at, adr+8) && PushHns(at, adr+4) && PushHns(at, adr);
	}
	MEMBER bool PushHnsDlg(const AddressType at, const int32_t adr)
	{
		return PushHns(at, adr+8) && PushHns(at, adr+4) && PushHns(at, adr);
	}
	MEMBER void PushReg(const REGISTER r)
	{
		code += 0x50 | r;
	}
	MEMBER void PushFlt(bool dbl)
	{
		if(dbl){
			SubRegImm(ESP, 8);
			code += 0xDD;
		}else{
			SubRegImm(ESP, 4);
			code += 0xD9;
		}
		StktopAddress(3);
	}
	MEMBER void PushFcw()
	{
		SubRegImm(ESP, 4);
		code += 0xD9;
		StktopAddress(7);
	}
	MEMBER bool PopHns(const AddressType at, const int32_t adr)
	{
		code += 0x8F;
		return ModAddress(0, at, adr);
	}
	MEMBER void PopReg(const REGISTER r)
	{
		code += 0x58 | r;
	}
	MEMBER void PopRadr(const REGISTER r)
	{
		code += 0x8F;
		AtaiCode(ModRM(0, 0, r));
	}
	MEMBER void PopFlt(bool dbl)
	{
		if(dbl){
			code += 0xDD;
			StktopAddress(0);
			AddRegImm(ESP, 8);
		}else{
			code += 0xD9;
			StktopAddress(0);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER void PopFcw()
	{
		code += 0xD9;
		StktopAddress(5);
		AddRegImm(ESP, 4);
	}
	MEMBER intptr_t Call(const int32_t adr)
	{
		code += 0xE8;
		AtaiCode((int32_t)(adr - (code.size()+4)));
		return code.size() - 4;
	}
	MEMBER void CallReg(const REGISTER r)
	{
		code += 0xFF;
		AtaiCode(ModRM(3, 2, r));
	}
	MEMBER void PluginCall(const void* adr)
	{
		code += 0xE8;
		cadrmbp += code.size();
		AtaiCode((int32_t)((int32_t)adr - (code.size()+4)));
	}
	MEMBER void FuncCall(
		int32_t byteadress, std::basic_string<intptr_t>& backpatch)
	{
		code += 0xE8;
		if(byteadress == 0) backpatch += code.size();
		AtaiCode((int32_t)(byteadress - (code.size()+4)));
	}
	MEMBER void CallStk()
	{
		PopReg(EAX);
		code += 0xFF;
		AtaiCode(ModRM(3, 2, EAX));
	}
	MEMBER void KansuStackSet(int32_t size, int32_t fsi)
	{
		if(size > 0){
			PopReg(EAX);
			SubRegImm(ESP, Aligner(size));
			PushReg(EAX);
			PushReg(EBP);
			MovRegReg(EBP, ESP);
		}else if(fsi > 0){
			PushReg(EBP);
			MovRegReg(EBP, ESP);
		}
	}
	MEMBER void KansuStackClear(int32_t size)
	{
		if(size > 0){
			PopReg(EBP);
			PopReg(EAX);
			AddRegImm(ESP, Aligner(size));
			PushReg(EAX);
		}
	}
	MEMBER void Return(const int32_t i32, const bool bp)
	{
		if(i32 == 0){
			code += 0xC3;
		}else if(1 <= i32 && i32 <= INT16_MAX){
			if(bp) PopReg(EBP);
			code += 0xC2;
			AtaiCode((int16_t)i32);
		}else{
			if(bp) PopReg(EBP);
			PushSIB(SIB(0, ESP, ESP), i32);//理由があって引数を破棄できない
			AddRegImm(ESP, i32+8);
			PushSIB(SIB(0, ESP, ESP), -i32-4);
			code += 0xC3;
			PushSIB(SIB(0, ESP, ESP), -i32-8);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER intptr_t Jump(const int32_t i32)
	{
		code += 0xE9;
		AtaiCode((int32_t)(i32 - (code.size()+4)));
		return code.size() - 4;
	}
	MEMBER void JumpReg(const REGISTER r)
	{
		code += 0xFF;
		AtaiCode(ModRM(3, 4, r));
	}
	MEMBER intptr_t JumpIdxCadr(
		const uint8_t scale, const REGISTER index, const int32_t adr)
	{
		code += 0xFF;
		AtaiCode(ModRM(0, 4, 4));
		AtaiCode(SIB(scale, index, EBP));
		cadrpbp += code.size();
		AtaiCode(adr);
		return code.size() - 4;
	}
	MEMBER intptr_t TrueJump(const int32_t i32)
	{
		code += 0x84;
		AtaiCode(ModRM(3, AL, AL));
		code += 0x0F; code += 0x85;
		AtaiCode((int32_t)(i32 - (code.size()+4)));
		return code.size() - 4;
	}
	MEMBER intptr_t FalseJump(const int32_t i32)
	{
		code += 0x84;
		AtaiCode(ModRM(3, AL, AL));
		code += 0x0F; code += 0x84;
		AtaiCode((int32_t)(i32 - (code.size()+4)));
		return code.size() - 4;
	}
	MEMBER void CmpImm(const int32_t i32, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0x3D;
		if(oso){
			AtaiCode((int16_t)i32);
		}else{
			AtaiCode(i32);
		}
		code += 0x9C;
		PopReg(EAX);
	}
	MEMBER void CmpRegReg(const REGISTER r1, const REGISTER r2, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0x3B;
		AtaiCode(ModRM(3, r1, r2));
		code += 0x9C;
		PopReg(EAX);
	}
	MEMBER void CmpStk(const bool oso)
	{
		PopReg(ECX);
		CmpRegReg(ECX, EAX, oso);
	}
	MEMBER void Less()
	{
		AndRegImm(EAX, 1);
	}
	MEMBER void ILess()
	{
		ShrRegImm(EAX, 7, false);
		MovRegReg(ECX, EAX);
		ShrRegImm(EAX, 4, false);
		XorRegReg(EAX, ECX);
		AndRegImm(EAX, 1);
	}
	MEMBER void Ika()
	{
		MovRegReg(ECX, EAX);
		ShrRegImm(EAX, 6, false);
		OrRegReg(EAX, ECX);
		AndRegImm(EAX, 1);
	}
	MEMBER void IIka()
	{
		ShrRegImm(EAX, 6, false);
		MovRegReg(ECX, EAX);
		ShrRegImm(EAX, 4, false);
		AndRegImm(EAX, -2);
		XorRegReg(EAX, ECX);
		ShrRegImm(EAX, 1, false);
		OrRegReg(EAX, ECX);
		AndRegImm(EAX, 1);
	}
	MEMBER void Over()
	{
		MovRegReg(ECX, EAX);
		ShrRegImm(EAX, 6, false);
		OrRegReg(EAX, ECX);
		NotReg(EAX);
		AndRegImm(EAX, 1);
	}
	MEMBER void IOver()
	{
		ShrRegImm(EAX, 6, false);
		MovRegReg(ECX, EAX);
		ShrRegImm(EAX, 4, false);
		AndRegImm(EAX, -2);
		XorRegReg(EAX, ECX);
		ShrRegImm(EAX, 1, false);
		OrRegReg(EAX, ECX);
		NotReg(EAX);
		AndRegImm(EAX, 1);
	}
	MEMBER void Ijou()
	{
		NotReg(EAX);
		AndRegImm(EAX, 1);
	}
	MEMBER void IIjou()
	{
		ShrRegImm(EAX, 7, false);
		MovRegReg(ECX, EAX);
		ShrRegImm(EAX, 4, false);
		XorRegReg(EAX, ECX);
		NotReg(EAX);
		AndRegImm(EAX, 1);
	}
	MEMBER void Equal()
	{
		ShrRegImm(EAX, 6, false);
		AndRegImm(EAX, 1);
	}
	MEMBER void NEqual()
	{
		ShrRegImm(EAX, 6, false);
		NotReg(EAX);
		AndRegImm(EAX, 1);
	}
	MEMBER void NotReg(const REGISTER r)
	{
		code += 0xF7;
		AtaiCode(ModRM(3, 2, r));
	}
	MEMBER void NegReg(const REGISTER r)
	{
		code += 0xF7;
		AtaiCode(ModRM(3, 3, r));
	}
	MEMBER void OrRegImm(const REGISTER r, const int32_t i32)
	{
		if(i32 == 0) return;
		if(INT8_MIN <= i32 && i32 <= INT8_MAX){
			code += 0x83;
			AtaiCode(ModRM(3, 1, r));
			AtaiCode((int8_t)i32);
		}else{
			if(r == EAX){
				code += 0x0D;
			}else{
				code += 0x81;
				AtaiCode(ModRM(3, 1, r));
			}
			AtaiCode(i32);
		}
	}
	MEMBER void OrRegReg(const REGISTER r1, const REGISTER r2)
	{
		code += 0x0B;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void OrStk()
	{
		PopReg(ECX);
		OrRegReg(EAX, ECX);
	}
	MEMBER void XorRegImm(const REGISTER r, const int32_t i32)
	{
		if(i32 == 0) return;
		if(INT8_MIN <= i32 && i32 <= INT8_MAX){
			code += 0x83;
			AtaiCode(ModRM(3, 6, r));
			AtaiCode((int8_t)i32);
		}else{
			if(r == EAX){
				code += 0x35;
			}else{
				code += 0x81;
				AtaiCode(ModRM(3, 6, r));
			}
			AtaiCode(i32);
		}
	}
	MEMBER void XorRegReg(const REGISTER r1, const REGISTER r2)
	{
		code += 0x33;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void XorStk()
	{
		PopReg(ECX);
		XorRegReg(EAX, ECX);
	}
	MEMBER void AndRegImm(const REGISTER r, const int32_t i32)
	{
		if(i32 == 0){
			MovRegImm(r, 0);
			return;
		}
		if(INT8_MIN <= i32 && i32 <= INT8_MAX){
			if((int8_t)i32 == -1) return;
			code += 0x83;
			AtaiCode(ModRM(3, 4, r));
			AtaiCode((int8_t)i32);
		}else{
			if(i32 == -1) return;
			if(r == EAX){
				code += 0x25;
			}else{
				code += 0x81;
				AtaiCode(ModRM(3, 4, r));
			}
			AtaiCode(i32);
		}
	}
	MEMBER void AndRegReg(const REGISTER r1, const REGISTER r2)
	{
		code += 0x23;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void AndStk()
	{
		PopReg(ECX);
		AndRegReg(EAX, ECX);
	}
	MEMBER void AddRegImm(const REGISTER r, const int32_t i32)
	{
		if(i32 == 0) return;
		if(INT8_MIN <= i32 && i32 <= INT8_MAX){
			code += 0x83;
			AtaiCode(ModRM(3, 0, r));
			AtaiCode((int8_t)i32);
		}else{
			if(r == EAX){
				code += 0x05;
			}else{
				code += 0x81;
				AtaiCode(ModRM(3, 0, r));
			}
			AtaiCode(i32);
		}
	}
	MEMBER void AddRegReg(const REGISTER r1, const REGISTER r2)
	{
		code += 0x03;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void AddStk()
	{
		PopReg(ECX);
		AddRegReg(EAX, ECX);
	}
	MEMBER void SubRegImm(const REGISTER r, const int32_t i32)
	{
		if(i32 == 0) return;
		if(INT8_MIN <= i32 && i32 <= INT8_MAX){
			code += 0x83;
			AtaiCode(ModRM(3, 5, r));
			AtaiCode((int8_t)i32);
		}else{
			if(r == EAX){
				code += 0x2D;
			}else{
				code += 0x81;
				AtaiCode(ModRM(3, 5, r));
			}
			AtaiCode(i32);
		}
	}
	MEMBER void SubRegReg(const REGISTER r1, const REGISTER r2)
	{
		code += 0x2B;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void SubStk()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		SubRegReg(EAX, ECX);
	}
	MEMBER void ShlRegImm(const REGISTER r, const int8_t i8)
	{
		if(i8 == 0) return;
		if(i8 == 1){
			code += 0xD1;
			AtaiCode(ModRM(3, 4, r));
		}else{
			code += 0xC1;
			AtaiCode(ModRM(3, 4, r));
			AtaiCode(i8);
		}
	}
	MEMBER void ShlRegCl(const REGISTER r)
	{
		code += 0xD3;
		AtaiCode(ModRM(3, 4, r));
	}
	MEMBER void ShlStk()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		ShlRegCl(EAX);
	}
	MEMBER void ShrRegImm(const REGISTER r, const uint8_t ui8, const bool oso)
	{
		if(ui8 == 0) return;
		if(oso) code += 0x66;
		if(ui8 == 1){
			code += 0xD1;
			AtaiCode(ModRM(3, 5, r));
		}else{
			code += 0xC1;
			AtaiCode(ModRM(3, 5, r));
			AtaiCode(ui8);
		}
	}
	MEMBER void ShrRegCl(const REGISTER r, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0xD3;
		AtaiCode(ModRM(3, 5, r));
	}
	MEMBER void ShrStk(const bool oso)
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		ShrRegCl(EAX, oso);
	}
	MEMBER void SarRegImm(const REGISTER r, const int8_t i8, const bool oso)
	{
		if(i8 == 0) return;
		if(oso) code += 0x66;
		if(i8 == 1){
			code += 0xD1;
			AtaiCode(ModRM(3, 7, r));
		}else{
			code += 0xC1;
			AtaiCode(ModRM(3, 7, r));
			AtaiCode(i8);
		}
	}
	MEMBER void SarRegCl(const REGISTER r, const bool oso)
	{
		if(oso) code += 0x66;
		code += 0xD3;
		AtaiCode(ModRM(3, 7, r));
	}
	MEMBER void SarStk(const bool oso)
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		SarRegCl(EAX, oso);
	}
	MEMBER void MulReg(const REGISTER r)
	{
		code += 0xF7;
		AtaiCode(ModRM(3, 4, r));
	}
	MEMBER void MulStk()
	{
		PopReg(ECX);
		MulReg(ECX);
	}
	MEMBER void DivReg(const REGISTER r, const bool oso)
	{
		MovRegImm(EDX, 0);
		if(oso) code += 0x66;
		code += 0xF7;
		AtaiCode(ModRM(3, 6, r));
	}
	MEMBER void DivStk(const bool oso)
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		DivReg(ECX, oso);
	}
	MEMBER void IDivReg(const REGISTER r, const bool oso)
	{
		if(oso) code += 0x66;
		Cdq();
		if(oso) code += 0x66;
		code += 0xF7;
		AtaiCode(ModRM(3, 7, r));
	}
	MEMBER void IDivStk(const bool oso)
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		IDivReg(ECX, oso);
	}
	MEMBER void RemReg(const REGISTER r, const bool oso)
	{
		MovRegImm(EDX, 0);
		if(oso) code += 0x66;
		code += 0xF7;
		AtaiCode(ModRM(3, 6, r));
		MovRegReg(EAX, EDX);
	}
	MEMBER void RemStk(const bool oso)
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		RemReg(ECX, oso);
	}
	MEMBER void IRemReg(const REGISTER r, const bool oso)
	{
		if(oso) code += 0x66;
		Cdq();
		if(oso) code += 0x66;
		code += 0xF7;
		AtaiCode(ModRM(3, 7, r));
		MovRegReg(EAX, EDX);
	}
	MEMBER void IRemStk(const bool oso)
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		IRemReg(ECX, oso);
	}
	MEMBER bool MovRegHns8(const REGISTER8 r, const AddressType at, int32_t adr)
	{
		code += 0x8A;
		return ModAddress(r, at, adr);
	}
	MEMBER bool MovHnsImm8(
		const AddressType at, const int32_t adr, const int8_t i8)
	{
		code += 0xC6;
		if(!ModAddress(0, at, adr)) return false;
		AtaiCode(i8);
		return true;
	}
	MEMBER bool MovHnsReg8(
		const AddressType at, const int32_t adr, const REGISTER8 r)
	{
		code += 0x88;
		return ModAddress(r, at, adr);
	}
	MEMBER void MovRegReg8(const REGISTER8 r1, const REGISTER8 r2)
	{
		code += 0x8A;
		AtaiCode(ModRM(3, r1, r2));
	}
	MEMBER void CmpImm8(const int8_t i8)
	{
		code += 0x3C;
		AtaiCode(i8);
		code += 0x9C;
		PopReg(EAX);
	}
	MEMBER void CmpRegReg8(const REGISTER8 r1, const REGISTER8 r2)
	{
		code += 0x3A;
		AtaiCode(ModRM(3, r1, r2));
		code += 0x9C;
		PopReg(EAX);
	}
	MEMBER void CmpStk8()
	{
		PopReg(ECX);
		CmpRegReg8(CL, AL);
	}
	MEMBER void SarRegImm8(const REGISTER8 r, const int8_t i8)
	{
		if(i8 == 0) return;
		if(i8 == 1){
			code += 0xD0;
			AtaiCode(ModRM(3, 7, r));
		}else{
			code += 0xC0;
			AtaiCode(ModRM(3, 7, r));
			AtaiCode(i8);
		}
	}
	MEMBER void SarRegCl8(const REGISTER8 r)
	{
		code += 0xD2;
		AtaiCode(ModRM(3, 7, r));
	}
	MEMBER void SarStk8()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		SarRegCl8(AL);
	}
	MEMBER void ShrRegImm8(const REGISTER8 r, const uint8_t ui8)
	{
		if(ui8 == 0) return;
		if(ui8 == 1){
			code += 0xD0;
			AtaiCode(ModRM(3, 5, r));
		}else{
			code += 0xC0;
			AtaiCode(ModRM(3, 5, r));
			AtaiCode(ui8);
		}
	}
	MEMBER void ShrRegCl8(const REGISTER8 r)
	{
		code += 0xD2;
		AtaiCode(ModRM(3, 5, r));
	}
	MEMBER void ShrStk8()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		ShrRegCl8(AL);
	}
	MEMBER void DivReg8(const REGISTER8 r)
	{
		AndRegImm(EAX, 0xff);
		code += 0xF6;
		AtaiCode(ModRM(3, 6, r));
	}
	MEMBER void DivStk8()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		DivReg8(CL);
	}
	MEMBER void IDivReg8(const REGISTER8 r)
	{
		Cwde(true);
		code += 0xF6;
		AtaiCode(ModRM(3, 7, r));
	}
	MEMBER void IDivStk8()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		IDivReg8(CL);
	}
	MEMBER void RemReg8(const REGISTER8 r)
	{
		AndRegImm(EAX, 0xff);
		code += 0xF6;
		AtaiCode(ModRM(3, 6, r));
		MovRegReg8(AL, AH);
	}
	MEMBER void RemStk8()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		RemReg8(CL);
	}
	MEMBER void IRemReg8(const REGISTER8 r)
	{
		Cwde(true);
		code += 0xF6;
		AtaiCode(ModRM(3, 7, r));
		MovRegReg8(AL, AH);
	}
	MEMBER void IRemStk8()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		IRemReg8(CL);
	}
	MEMBER bool MovRegHns64(
		const REGISTER r1, const REGISTER r2,
		const AddressType at, const int32_t adr)
	{
		return
			MovRegHns(r1, at, adr, false)
			&& MovRegHns(r2, at, adr+4, false);
	}
	MEMBER bool MovHnsImm64(const AddressType at, const int32_t adr, int64_t i64)
	{
		return
			MovHnsImm(
				at, adr, ((int32_t*)&i64)[0], false)
				&& MovHnsImm(at, adr+4, ((int32_t*)&i64)[1], false);
	}
	MEMBER bool MovHnsReg64(const AddressType at, const int32_t adr)
	{
		return
			MovHnsReg(at, adr, EAX, false)
			&& MovHnsReg(at, adr+4, EDX, false);
	}
	MEMBER void LessImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Less();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		Less();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ika();
		AndRegReg(EAX, EBX);
	}
	MEMBER void LessStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Less();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		Less();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ika();
		AndRegReg(EAX, EBX);
	}
	MEMBER void ILessImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Less();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		ILess();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIka();
		AndRegReg(EAX, EBX);
	}
	MEMBER void ILessStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Less();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		ILess();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIka();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IkaImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Ika();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		Less();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ika();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IkaStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Ika();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		Less();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ika();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IIkaImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Ika();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		ILess();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIka();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IIkaStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Ika();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		ILess();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIka();
		AndRegReg(EAX, EBX);
	}
	MEMBER void OverImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Over();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		Over();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ijou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void OverStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Over();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		Over();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ijou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IOverImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Over();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		IOver();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIjou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IOverStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Over();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		IOver();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIjou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IjouImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Ijou();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		Over();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ijou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IjouStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Ijou();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		Over();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		Ijou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IIjouImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Ijou();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		MovRegReg(EBX, EAX);
		IOver();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIjou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void IIjouStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Ijou();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		MovRegReg(EBX, EAX);
		IOver();
		OrRegReg(EAX, EDX);
		XchgRegReg(EAX, EBX);
		IIjou();
		AndRegReg(EAX, EBX);
	}
	MEMBER void EqualImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		Equal();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		Equal();
		AndRegReg(EAX, EDX);
	}
	MEMBER void EqualStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Equal();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		Equal();
		AndRegReg(EAX, EDX);
	}
	MEMBER void NEqualImm64(int64_t i64)
	{
		CmpImm(((int32_t*)&i64)[0], false);
		NEqual();
		XchgRegReg(EAX, EDX);
		CmpImm(((int32_t*)&i64)[1], false);
		NEqual();
		OrRegReg(EAX, EDX);
	}
	MEMBER void NEqualStk64()
	{
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		NEqual();
		XchgRegReg(EAX, EDX);
		PopReg(EBX);
		CmpRegReg(EBX, EAX, false);
		NEqual();
		OrRegReg(EAX, EDX);
	}
	MEMBER void OrImm64(int64_t i64)
	{
		OrRegImm(EAX, ((int32_t*)&i64)[0]);
		OrRegImm(EDX, ((int32_t*)&i64)[1]);
	}
	MEMBER void Or64()
	{
		OrRegReg(EAX, ECX);
		OrRegReg(EDX, EBX);
	}
	MEMBER void OrStk64()
	{
		PopReg(ECX);
		OrRegReg(EAX, ECX);
		PopReg(ECX);
		OrRegReg(EDX, ECX);
	}
	MEMBER void XorImm64(int64_t i64)
	{
		XorRegImm(EAX, ((int32_t*)&i64)[0]);
		XorRegImm(EDX, ((int32_t*)&i64)[1]);
	}
	MEMBER void Xor64()
	{
		XorRegReg(EAX, ECX);
		XorRegReg(EDX, EBX);
	}
	MEMBER void XorStk64()
	{
		PopReg(ECX);
		XorRegReg(EAX, ECX);
		PopReg(ECX);
		XorRegReg(EDX, ECX);
	}
	MEMBER void AndImm64(int64_t i64)
	{
		AndRegImm(EAX, ((int32_t*)&i64)[0]);
		AndRegImm(EDX, ((int32_t*)&i64)[1]);
	}
	MEMBER void And64()
	{
		AndRegReg(EAX, ECX);
		AndRegReg(EDX, EBX);
	}
	MEMBER void AndStk64()
	{
		PopReg(ECX);
		AndRegReg(EAX, ECX);
		PopReg(ECX);
		AndRegReg(EDX, ECX);
	}
	MEMBER void AddImm64(int64_t i64)
	{
		if(i64 == 0) return;
		AddRegImm(EAX, ((int32_t*)&i64)[0]);
		code += 0x81;
		AtaiCode(ModRM(3, 2, EDX));
		AtaiCode(((int32_t*)&i64)[1]);
	}
	MEMBER void Add64()
	{
		AddRegReg(EAX, ECX);
		code += 0x13;
		AtaiCode(ModRM(3, EDX, EBX));
	}
	MEMBER void AddStk64()
	{
		PopReg(ECX);
		AddRegReg(EAX, ECX);
		PopReg(ECX);
		code += 0x13;
		AtaiCode(ModRM(3, EDX, ECX));
	}
	MEMBER void SubImm64(int64_t i64)
	{
		if(i64 == 0) return;
		SubRegImm(EAX, ((int32_t*)&i64)[0]);
		code += 0x81;
		AtaiCode(ModRM(3, 3, EDX));
		AtaiCode(((int32_t*)&i64)[1]);
	}
	MEMBER void Sub64()
	{
		SubRegReg(EAX, ECX);
		code += 0x1B;
		AtaiCode(ModRM(3, EDX, EBX));
	}
	MEMBER void SubStk64()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		SubRegReg(EAX, ECX);
		PopReg(ECX);
		XchgRegReg(EDX, ECX);
		code += 0x1B;
		AtaiCode(ModRM(3, EDX, ECX));
	}
	MEMBER void ShlImm64(const int8_t i8)
	{
		if(i8 == 0) return;
		if(i8 == 1){
			ShlRegImm(EAX, 1);
			code += 0xD1;
			AtaiCode(ModRM(3, 2, EDX));
		}else if(1 <= i8 && i8 <= 31){
			code += 0x0F; code += 0xA4;
			AtaiCode(ModRM(3, EAX, EDX));
			AtaiCode(i8);
			ShlRegImm(EAX, i8);
		}else{
			MovRegReg(EDX, EAX);
			ShlRegImm(EDX, i8-32);
			MovRegImm(EAX, 0);
		}
	}
	MEMBER void ShlCl64()
	{
		code += 0x0F; code += 0xA5;
		AtaiCode(ModRM(3, EAX, EDX));
		ShlRegCl(EAX);
		ShrRegImm(ECX, 1, false);
		AndRegImm(ECX, 16);
		for(int i = 0; i < 2; i++){
			code += 0x0F; code += 0xA5;
			AtaiCode(ModRM(3, EAX, EDX));
			ShlRegCl(EAX);
		}
	}
	MEMBER void ShlStk64()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		PopReg(EDX);
		ShlCl64();
	}
	MEMBER void ShrImm64(const uint8_t ui8)
	{
		if(ui8 == 0) return;
		if(ui8 == 1){
			ShrRegImm(EDX, 1, false);
			code += 0xD1;
			AtaiCode(ModRM(3, 3, EAX));
		}else if(1 <= ui8 && ui8 <= 31){
			code += 0x0F; code += 0xAC;
			AtaiCode(ModRM(3, EDX, EAX));
			AtaiCode(ui8);
			ShrRegImm(EDX, ui8, false);
		}else{
			MovRegReg(EAX, EDX);
			ShrRegImm(EAX, ui8-32, false);
			MovRegImm(EDX, 0);
		}
	}
	MEMBER void ShrCl64()
	{
		code += 0x0F; code += 0xAD;
		AtaiCode(ModRM(3, EDX, EAX));
		ShrRegCl(EDX, false);
		ShrRegImm(ECX, 1, false);
		AndRegImm(ECX, 16);
		for(int i = 0; i < 2; i++){
			code += 0x0F; code += 0xAD;
			AtaiCode(ModRM(3, EDX, EAX));
			ShrRegCl(EDX, false);
		}
	}
	MEMBER void ShrStk64()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		PopReg(EDX);
		ShrCl64();
	}
	MEMBER void SarImm64(const int8_t i8)
	{
		if(i8 == 0) return;
		if(i8 == 1){
			SarRegImm(EDX, 1, false);
			code += 0xD1;
			AtaiCode(ModRM(3, 3, EAX));
		}else if(1 <= i8 && i8 <= 31){
			code += 0x0F; code += 0xAC;
			AtaiCode(ModRM(3, EDX, EAX));
			AtaiCode(i8);
			SarRegImm(EDX, i8, false);
		}else{
			MovRegReg(EAX, EDX);
			SarRegImm(EAX, i8-32, false);
			SarRegImm(EDX, 31, false);
		}
	}
	MEMBER void SarCl64()
	{
		code += 0x0F; code += 0xAD;
		AtaiCode(ModRM(3, EDX, EAX));
		SarRegCl(EDX, false);
		ShrRegImm(ECX, 1, false);
		AndRegImm(ECX, 16);
		for(int i = 0; i < 2; i++){
			code += 0x0F; code += 0xAD;
			AtaiCode(ModRM(3, EDX, EAX));
			SarRegCl(EDX, false);
		}
	}
	MEMBER void SarStk64()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		PopReg(EDX);
		SarCl64();
	}
	MEMBER void MulStk64()
	{
		PopReg(ECX);
		XchgRegReg(EAX, ECX);
		MovRegReg(EBX, EAX);
		MulReg(EDX);
		PopReg(ESI);
		XchgRegReg(EAX, ESI);
		MulReg(ECX);
		AddRegReg(ESI, EAX);
		MovRegReg(EAX, EBX);
		MulReg(ECX);
		AddRegReg(EDX, ESI);
	}
	STAMEM int64_t SSZ_STDCALL Wari64(int64_t i64_2, int64_t i64_1)
	{
		SSZ_TRY
			return i64_1 / i64_2;
		SSZ_EXCEPT(*((uint8_t**)&i64_2 - 1) - 1)
	}
	STAMEM int64_t SSZ_STDCALL Amari64(int64_t i64_2, int64_t i64_1)
	{
		SSZ_TRY
			return i64_1 % i64_2;
		SSZ_EXCEPT(*((uint8_t**)&i64_2 - 1) - 1)
	}
	STAMEM uint64_t SSZ_STDCALL Warui64(uint64_t ui64_2, uint64_t ui64_1)
	{
		SSZ_TRY
			return ui64_1 / ui64_2;
		SSZ_EXCEPT(*((uint8_t**)&ui64_2 - 1) - 1)
	}
	STAMEM uint64_t SSZ_STDCALL Amarui64(uint64_t ui64_2, uint64_t ui64_1)
	{
		SSZ_TRY
			return ui64_1 % ui64_2;
		SSZ_EXCEPT(*((uint8_t**)&ui64_2 - 1) - 1)
	}
	MEMBER void DivStk64()
	{
		PushReg(EDX);
		PushReg(EAX);
		PluginCall((void*)Warui64);
	}
	MEMBER void IDivStk64()
	{
		PushReg(EDX);
		PushReg(EAX);
		PluginCall((void*)Wari64);
	}
	MEMBER void RemStk64()
	{
		PushReg(EDX);
		PushReg(EAX);
		PluginCall((void*)Amarui64);
	}
	MEMBER void IRemStk64()
	{
		PushReg(EDX);
		PushReg(EAX);
		PluginCall((void*)Amari64);
	}
	MEMBER void FtoI(const bool unsig, const bool b64)
	{
		PushFcw();
		MovRegSIB(EAX, SIB(0, ESP, ESP), 0);
		if(unsig){
			AndRegImm(EAX, 0xf3ff);
			OrRegImm(EAX, 0x0400);
		}else{
			OrRegImm(EAX, 0x0c00);
		}
		PushReg(EAX);
		PopFcw();
		if(b64){
			SubRegImm(ESP, 8);
			code += 0xDF;
			StktopAddress(7);
			PopReg(EAX);
			PopReg(EDX);
		}else{
			SubRegImm(ESP, 4);
			code += 0xDB;
			StktopAddress(3);
			PopReg(EAX);
		}
		PopFcw();
	}
	MEMBER void ItoF(const bool unsig, const bool b64)
	{
		if(unsig && b64){
			MovRegReg(ECX, EDX);
			//
			AndRegImm(EDX, 0x7fffffff);
			PushReg(EDX);
			PushReg(EAX);
			code += 0xDF;
			StktopAddress(5);
			AddRegImm(ESP, 8);
			//
			AndRegImm(ECX, 0x80000000);
			ShrRegImm(ECX, 1, false);
			PushReg(ECX);
			PushImm(0);
			code += 0xDF;
			StktopAddress(5);
			AddRegImm(ESP, 8);
			//
			code += 0xDC; code += 0xC1;
			code += 0xDE; code += 0xC1;
		}else if(unsig || b64){
			if(unsig) MovRegImm(EDX, 0);
			PushReg(EDX);
			PushReg(EAX);
			code += 0xDF;
			StktopAddress(5);
			AddRegImm(ESP, 8);
		}else{
			PushReg(EAX);
			code += 0xDB;
			StktopAddress(0);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER void FltDrop()
	{
		code += 0xDD; code += 0xD8;
	}
	MEMBER void FldStk(const bool b64)
	{
		if(b64){
			code += 0xDD;
			StktopAddress(0);
			AddRegImm(ESP, 8);
		}else{
			code += 0xD9;
			StktopAddress(0);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER bool FldAdr(const AddressType at, const int32_t adr, const bool b64)
	{
		if(b64){
			code += 0xDD;
		}else{
			code += 0xD9;
		}
		return ModAddress(0, at, adr);
	}
	MEMBER bool FstAdr(const AddressType at, const int32_t adr, const bool b64)
	{
		if(b64){
			code += 0xDD;
		}else{
			code += 0xD9;
		}
		return ModAddress(2, at, adr);
	}
	STAMEM double SSZ_STDCALL Powd(double _X, double _Y)
	{
		return pow(_X, _Y);
	}
	STAMEM float SSZ_STDCALL Powf(float _X, float _Y)
	{
		return pow(_X, _Y);
	}
	STAMEM double SSZ_STDCALL PowdSw(double _Y, double _X)
	{
		return pow(_X, _Y);
	}
	STAMEM float SSZ_STDCALL PowfSw(float _Y, float _X)
	{
		return pow(_X, _Y);
	}
	MEMBER void FpowStk(const bool b64, bool swap)
	{
		if(b64){
			PushFlt(true);
			PluginCall((void*)(swap ? PowdSw : Powd));
		}else{
			PushFlt(false);
			PluginCall((void*)(swap ? PowfSw : Powf));
		}
	}
	MEMBER void FmulStk(const bool b64)
	{
		if(b64){
			code += 0xDC;
			StktopAddress(1);
			AddRegImm(ESP, 8);
		}else{
			code += 0xD8;
			StktopAddress(1);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER bool FmulAdr(const AddressType at, const int32_t adr, const bool b64)
	{
		if(b64){
			code += 0xDC;
		}else{
			code += 0xD8;
		}
		return ModAddress(1, at, adr);
	}
	MEMBER void FdivStk(const bool b64)
	{
		if(b64){
			code += 0xDC;
			StktopAddress(6);
			AddRegImm(ESP, 8);
		}else{
			code += 0xD8;
			StktopAddress(6);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER void FdivStkSwap(const bool b64)
	{
		FldStk(b64);
		code += 0xD9; code += 0xC9;
		code += 0xDE; code += 0xF9;
	}
	MEMBER bool FdivAdr(const AddressType at, const int32_t adr, const bool b64)
	{
		if(b64){
			code += 0xDC;
		}else{
			code += 0xD8;
		}
		return ModAddress(6, at, adr);
	}
	MEMBER void FaddStk(const bool b64)
	{
		if(b64){
			code += 0xDC;
			StktopAddress(0);
			AddRegImm(ESP, 8);
		}else{
			code += 0xD8;
			StktopAddress(0);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER bool FaddAdr(const AddressType at, const int32_t adr, const bool b64)
	{
		if(b64){
			code += 0xDC;
		}else{
			code += 0xD8;
		}
		return ModAddress(0, at, adr);
	}
	MEMBER void FsubStk(const bool b64)
	{
		if(b64){
			code += 0xDC;
			StktopAddress(4);
			AddRegImm(ESP, 8);
		}else{
			code += 0xD8;
			StktopAddress(4);
			AddRegImm(ESP, 4);
		}
	}
	MEMBER bool FsubAdr(const AddressType at, const int32_t adr, const bool b64)
	{
		if(b64){
			code += 0xDC;
		}else{
			code += 0xD8;
		}
		return ModAddress(4, at, adr);
	}
	MEMBER void Fchs()
	{
		code += 0xD9; code += 0xE0;
	}
	MEMBER void Fabs()
	{
		code += 0xD9; code += 0xE1;
	}
	MEMBER void Fcomi()
	{
		code += 0xDF; code += 0xF1;
		FltDrop();
		code += 0x9C;
		PopReg(EAX);
	}
	STAMEM void* SSZ_STDCALL RefPosNullable(Reference r)
	{
		return r.null() ? nullptr : r.atpos();
	}
	///////////////////////////////////////////////////////////////////////
	MEMBER bool cast(const int32_t dtype, int32_t& typ)
	{
		if(typ == dtype) return true;
		switch(dtype){
		case BYTE_TYPEID:
			if(typ == FLOAT_TYPEID || typ == DOUBLE_TYPEID){
				FtoI(false, false);
				break;
			}
		case UBYTE_TYPEID:
			switch(typ){
			case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
			case SHORT_TYPEID:case USHORT_TYPEID: case CHAR_TYPEID:
			case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
			case LONG_TYPEID: case ULONG_TYPEID:
				break;
			case FLOAT_TYPEID: case DOUBLE_TYPEID:
				FtoI(true, false);
				break;
			default:
				return false;
			}
			break;
		case SHORT_TYPEID:
			if(typ == FLOAT_TYPEID || typ == DOUBLE_TYPEID){
				FtoI(false, false);
				break;
			}
		case USHORT_TYPEID:
		case CHAR_TYPEID:
			switch(typ){
			case BYTE_TYPEID:
				Cwde(true);
				break;
			case UBYTE_TYPEID: case BOOL_TYPEID:
				AndRegImm(EAX, 0xff);
				break;
			case SHORT_TYPEID:case USHORT_TYPEID: case CHAR_TYPEID:
			case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
			case LONG_TYPEID: case ULONG_TYPEID:
				break;
			case FLOAT_TYPEID: case DOUBLE_TYPEID:
				FtoI(true, false);
				break;
			default:
				return false;
			}
			break;
		case INT_TYPEID:
		case ADDRESS_TYPEID:
			if(typ == FLOAT_TYPEID || typ == DOUBLE_TYPEID){
				FtoI(false, false);
				break;
			}
		case UINT_TYPEID:
			switch(typ){
			case BYTE_TYPEID:
				Cwde(true);
			case SHORT_TYPEID:
				Cwde(false);
				break;
			case UBYTE_TYPEID: case BOOL_TYPEID:
				AndRegImm(EAX, 0xff);
				break;
			case USHORT_TYPEID: case CHAR_TYPEID:
				AndRegImm(EAX, 0xffff);
				break;
			case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
			case LONG_TYPEID: case ULONG_TYPEID:
				break;
			case FLOAT_TYPEID: case DOUBLE_TYPEID:
				FtoI(true, false);
				break;
			default:
				return false;
			}
			break;
		case LONG_TYPEID:
			if(typ == FLOAT_TYPEID || typ == DOUBLE_TYPEID){
				FtoI(false, true);
				break;
			}
		case ULONG_TYPEID:
			switch(typ){
			case BYTE_TYPEID:
				Cwde(true);
			case SHORT_TYPEID:
				Cwde(false);
			case INT_TYPEID: case ADDRESS_TYPEID:
				Cdq();
				break;
			case UBYTE_TYPEID: case BOOL_TYPEID:
				AndRegImm(EAX, 0xff);
				MovRegImm(EDX, 0);
				break;
			case USHORT_TYPEID: case CHAR_TYPEID:
				AndRegImm(EAX, 0xffff);
			case UINT_TYPEID:
				MovRegImm(EDX, 0);
				break;
			case LONG_TYPEID: case ULONG_TYPEID:
				break;
			case FLOAT_TYPEID: case DOUBLE_TYPEID:
				FtoI(true, true);
				break;
			default:
				return false;
			}
			break;
		case FLOAT_TYPEID:
		case DOUBLE_TYPEID:
			if(typ == FLOAT_TYPEID || typ == DOUBLE_TYPEID) break;
			switch(typ){
			case BYTE_TYPEID:
				Cwde(true);
			case SHORT_TYPEID:
				Cwde(false);
				break;
			case UBYTE_TYPEID: case BOOL_TYPEID:
				AndRegImm(EAX, 0xff);
				break;
			case USHORT_TYPEID: case CHAR_TYPEID:
				AndRegImm(EAX, 0xffff);
				break;
			case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
			case LONG_TYPEID: case ULONG_TYPEID:
				break;
			default:
				return false;
			}
			if(typ == ULONG_TYPEID){
				ItoF(true, true);
			}else if(typ == LONG_TYPEID){
				ItoF(false, true);
			}else if(typ == UINT_TYPEID){
				ItoF(true, false);
			}else{
				ItoF(false, false);
			}
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER void refToDref(int32_t rid)
	{
		MovRegReg(EAX, ESP);
		SubRegImm(ESP, 4);
		MovRegReg(ESI, ESP);
		(void)MemCopy(EAX, AT_SANSHOU, 0, 12);
		(void)MovHnsImm(AT_SANSHOU, 12, rid, false);
	}
	MEMBER void fillNop(int32_t size)
	{
		for(int32_t i = 0; i < size; i++) code += 0x90;
	}
	MEMBER void dup(int32_t size)
	{
		for(int32_t i = 0; i < size; i += 4){
			PushSIB(SIB(0, ESP, ESP), Aligner(size) - 4);
		}
	}
	MEMBER void stackTopAddressCallOverwrite(intptr_t offset, void* adr)
	{
		code[offset] = 0x50 | ESP;
		code[offset+1] = 0xE8;
		cadrmbp += offset+2;
		*(int32_t*)(code.data() + (offset+2)) =
			(int32_t)((int32_t)adr - (offset+2+4));
	}
	MEMBER bool tPush(int32_t typeId)
	{
		switch(typeId){
		case REF_TYPEID:
		case LIST_TYPEID:
		case DYNREF_TYPEID:
		case DYNLIST_TYPEID:
		case DELEGATE_TYPEID:
		case TMPREF_TYPEID:
		case TMPLIST_TYPEID:
		case TMPDYNREF_TYPEID:
		case TMPDYNLIST_TYPEID:
		case VOID_TYPEID:
			break;
		case LONG_TYPEID:
		case ULONG_TYPEID:
			PushReg(EDX);
			PushReg(EAX);
			break;
		case FLOAT_TYPEID:
			PushFlt(false);
			break;
		case DOUBLE_TYPEID:
			PushFlt(true);
			break;
		default:
			if(typeId < METHOD_TYPEID) return false;
			PushReg(EAX);
			break;
		}
		return true;
	}
	MEMBER bool tPop(int32_t typeId)
	{
		switch(typeId){
		case REF_TYPEID:
		case LIST_TYPEID:
		case DYNREF_TYPEID:
		case DYNLIST_TYPEID:
		case DELEGATE_TYPEID:
		case VOID_TYPEID:
			break;
		case LONG_TYPEID:
		case ULONG_TYPEID:
			PopReg(EAX);
			PopReg(EDX);
			break;
		case FLOAT_TYPEID:
			PopFlt(false);
			break;
		case DOUBLE_TYPEID:
			PopFlt(true);
			break;
		default:
			if(typeId < METHOD_TYPEID) return false;
			PopReg(EAX);
			break;
		}
		return true;
	}
	MEMBER void pushTmpRef(bool dyn)
	{
		if(dyn) PushReg(EBX);
		PushReg(ECX);
		PushReg(EDX);
		PushReg(EAX);
	}
	MEMBER void popTmpRef(bool dyn)
	{
		PopReg(EAX);
		PopReg(EDX);
		PopReg(ECX);
		if(dyn) PopReg(EBX);
	}
	MEMBER bool storeTmpRef(AddressType at, int32_t adr, bool dyn)
	{
		return
			MovHnsReg(at, adr, EAX, false)
			&& MovHnsReg(at, adr+4, EDX, false)
			&& MovHnsReg(at, adr+8, ECX, false)
			&& (!dyn || MovHnsReg(at, adr+12, EBX, false));
	}
	MEMBER intptr_t dynMethodSub1(int32_t bp1)
	{
		code += 0xEB;
		AtaiCode((int8_t)3);
		*(intptr_t*)(code.data()+bp1) += code.size();
		AddRegImm(ESP, Aliszof<Reference>());
		PopReg(ECX);
		PushReg(EBX);
		MovRegReg(EAX, EBX);
		auto ret = FalseJump(0);
		PushReg(ECX);
		PushReg(ESI);
		return ret;
	}
	MEMBER intptr_t switchSub1(uint8_t ichi)
	{
		if(ichi < 8){
			MovRegReg(ECX, EAX);
			ShrRegImm(ECX, ichi*4, false);
		}else{
			MovRegReg(ECX, EDX);
			ShrRegImm(ECX, (ichi-8)*4, false);
		}
		AndRegImm(ECX, 0xf);
		return JumpIdxCadr(2, ECX, 0);
	}
	MEMBER void delegateSub1(int32_t size, int32_t offset)
	{
		PopReg(EDX);
		PopReg(EAX);
		if(size > 0){
			AddRegImm(EAX, 8 + offset);//リターンアドレスと前のEBPの8
			for(intptr_t j = 0; j < size; j += 4){
				PopRadr(EAX);
				AddRegImm(EAX, 4);
			}
			AddRegImm(ESP, 8);//Delegateのmemberのoffsetの8
		}
		PopReg(ECX);
		if (size > 0){
			PushReg(EAX);
			SubRegImm(EAX, 8 + offset + size);
		}
		PushReg(EDX);
		PushReg(EDI);
		PushReg(EBP);
		MovRegReg(EBP, EAX);
		MovRegReg(EDI, ECX);
	}
	MEMBER void pushStackTopAddress()
	{
		PushReg(ESP);
	}
	MEMBER void pushStack(int32_t offset)
	{
		PushSIB(SIB(0, ESP, ESP), offset);
	}
	MEMBER bool popToMem(AddressType at, int32_t adr, int32_t size)
	{
		if(!MemCopy(ESP, at, adr, size)){
			return false;
		}
		removeStackTop(size);
		return true;
	}
	MEMBER void removeStackTop(int32_t size)
	{
		AddRegImm(ESP, Aligner(size));
	}
	MEMBER void allocStackTop(int32_t size)
	{
		SubRegImm(ESP, Aligner(size));
	}
	MEMBER bool setAdrreg(AddressType at, int32_t adr)
	{
		return MovRegAdr(ESI, at, adr);
	}
	MEMBER void setAdrregStack(int32_t offset)
	{
		MovRegSIB(ESI, SIB(0, ESP, ESP), offset);
	}
	MEMBER void setAdrregStackTopAddress()
	{
		MovRegReg(ESI, ESP);
	}
	MEMBER void setAdrregTmpreg()
	{
		MovRegReg(ESI, EBX);
	}
	MEMBER void setAdrregReg0()
	{
		MovRegReg(ESI, EAX);
	}
	MEMBER bool loadAdrreg(AddressType at, int32_t adr)
	{
		return MovRegHns(ESI, at, adr, false);
	}
	MEMBER void pushAdrreg()
	{
		PushReg(ESI);
	}
	MEMBER void popToAdrreg()
	{
		PopReg(ESI);
	}
	MEMBER void constAdrregAdd(int32_t i32)
	{
		AddRegImm(ESI, i32);
	}
	MEMBER void constAdrregSub(int32_t i32)
	{
		SubRegImm(ESI, i32);
	}
	MEMBER bool setThisreg(AddressType at, int32_t adr)
	{
		return MovRegAdr(EDI, at, adr);
	}
	MEMBER void setThisregStack(int32_t offset)
	{
		MovRegSIB(EDI, SIB(0, ESP, ESP), offset);
	}
	MEMBER void pushThisreg()
	{
		PushReg(EDI);
	}
	MEMBER void popToThisreg()
	{
		PopReg(EDI);
	}
	MEMBER void constThisregAdd(int32_t i32)
	{
		AddRegImm(EDI, i32);
	}
	MEMBER void constThisregSub(int32_t i32)
	{
		SubRegImm(EDI, i32);
	}
	MEMBER void pushBasereg()
	{
		PushReg(EBP);
	}
	MEMBER void popToBasereg()
	{
		PopReg(EBP);
	}
	MEMBER bool setTmpregAdr(AddressType at, int32_t adr)
	{
		return MovRegAdr(EBX, at, adr);
	}
	MEMBER void setTmpregReg0()
	{
		MovRegReg(EBX, EAX);
	}
	MEMBER void pushTmpreg()
	{
		PushReg(EBX);
	}
	MEMBER void popToTmpreg()
	{
		PopReg(EBX);
	}
	MEMBER void setReg0(int32_t i32)
	{
		MovRegImm(EAX, i32);
	}
	MEMBER void setReg0_64(int64_t i64)
	{
		MovRegImm(EAX, (int32_t)(i64 & 0xffffffff));
		MovRegImm(EDX, (int32_t)(i64 >> 32 & 0xffffffff));
	}
	MEMBER void setReg0Stack(int32_t offset)
	{
		MovRegSIB(EAX, SIB(0, ESP, ESP), offset);
	}
	MEMBER void setReg0StackAddress(int32_t offset)
	{
		if(offset == 0){
			MovRegReg(EAX, ESP);
		}else{
			LeaSIB(EAX, SIB(0, ESP, ESP), offset);
		}
	}
	MEMBER bool setReg0Adr(AddressType at, int32_t adr)
	{
		return MovRegAdr(EAX, at, adr);
	}
	MEMBER void setReg0Fadr(
		int32_t byteadress, std::basic_string<intptr_t>& backpatch)
	{
		MovRegFun(EAX, byteadress, backpatch);
	}
	MEMBER bool loadReg0(AddressType at, int32_t adr)
	{
		return loadReg0_32(at, adr);
	}
	MEMBER bool loadReg0_8(AddressType at, int32_t adr)
	{
		return MovRegHns8(AL, at, adr);
	}
	MEMBER bool loadReg0_16(AddressType at, int32_t adr)
	{
		return MovRegHns(EAX, at, adr, true);
	}
	MEMBER bool loadReg0_32(AddressType at, int32_t adr)
	{
		return MovRegHns(EAX, at, adr, false);
	}
	MEMBER bool loadReg0_64(AddressType at, int32_t adr)
	{
		return MovRegHns64(EAX, EDX, at, adr);
	}
	MEMBER bool storeReg0_8(AddressType at, int32_t adr)
	{
		return MovHnsReg8(at, adr, AL);
	}
	MEMBER bool storeReg0_16(AddressType at, int32_t adr)
	{
		return MovHnsReg(at, adr, EAX, true);
	}
	MEMBER bool storeReg0_32(AddressType at, int32_t adr)
	{
		return MovHnsReg(at, adr, EAX, false);
	}
	MEMBER bool storeMem(AddressType at, int32_t adr, int32_t size)
	{
		return MemCopy(EAX, at, adr, size);
	}
	MEMBER bool bInc8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(AL, at, adr)) return false;
		MovRegReg(ECX, EAX);
		AddRegImm(ECX, 1);
		if(!MovHnsReg8(at, adr, CL)) return false;
		return true;
	}
	MEMBER bool bInc16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(EAX, at, adr, true)) return false;
		MovRegReg(ECX, EAX);
		AddRegImm(ECX, 1);
		if(!MovHnsReg(at, adr, ECX, true)) return false;
		return true;
	}
	MEMBER bool bInc32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(EAX, at, adr, false)) return false;
		MovRegReg(ECX, EAX);
		AddRegImm(ECX, 1);
		if(!MovHnsReg(at, adr, ECX, false)) return false;
		return true;
	}
	MEMBER bool bInc64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(EAX, EDX, at, adr)) return false;
		MovRegReg(ECX, EAX);
		MovRegReg(EBX, EDX);
		AddImm64(1);
		if(!MovHnsReg64(at, adr)) return false;
		MovRegReg(EAX, ECX);
		MovRegReg(EDX, EBX);
		return true;
	}
	MEMBER bool bDec8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(AL, at, adr)) return false;
		MovRegReg(ECX, EAX);
		SubRegImm(ECX, 1);
		if(!MovHnsReg8(at, adr, CL)) return false;
		return true;
	}
	MEMBER bool bDec16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(EAX, at, adr, true)) return false;
		MovRegReg(ECX, EAX);
		SubRegImm(ECX, 1);
		if(!MovHnsReg(at, adr, ECX, true)) return false;
		return true;
	}
	MEMBER bool bDec32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(EAX, at, adr, false)) return false;
		MovRegReg(ECX, EAX);
		SubRegImm(ECX, 1);
		if(!MovHnsReg(at, adr, ECX, false)) return false;
		return true;
	}
	MEMBER bool bDec64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(EAX, EDX, at, adr)) return false;
		MovRegReg(ECX, EAX);
		MovRegReg(EBX, EDX);
		SubImm64(1);
		if(!MovHnsReg64(at, adr)) return false;
		MovRegReg(EAX, ECX);
		MovRegReg(EDX, EBX);
		return true;
	}
	MEMBER bool bToggle(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(AL, at, adr)) return false;
		MovRegReg(ECX, EAX);
		XorRegImm(ECX, 1);
		if(!MovHnsReg8(at, adr, CL)) return false;
		return true;
	}
	MEMBER void not()
	{
		NotReg(EAX);
	}
	MEMBER void not64()
	{
		NotReg(EAX);
		NotReg(EDX);
	}
	MEMBER void neg()
	{
		NegReg(EAX);
	}
	MEMBER void neg64()
	{
		NotReg(EAX);
		NotReg(EDX);
		AddImm64(1);
	}
	MEMBER void abs8()
	{
		MovRegReg(ECX, EAX);
		ShlRegImm(ECX, 24);
		SarRegImm(ECX, 31, false);
		XorRegReg(EAX, ECX);
		SubRegReg(EAX, ECX);
	}
	MEMBER void abs16()
	{
		MovRegReg(ECX, EAX);
		SarRegImm(ECX, 15, true);
		XorRegReg(EAX, ECX);
		SubRegReg(EAX, ECX);
	}
	MEMBER void abs32()
	{
		MovRegReg(ECX, EAX);
		SarRegImm(ECX, 31, false);
		XorRegReg(EAX, ECX);
		SubRegReg(EAX, ECX);
	}
	MEMBER void abs64()
	{
		MovRegReg(ECX, EDX);
		SarRegImm(ECX, 31, false);
		MovRegReg(EBX, ECX);
		Xor64();
		Sub64();
	}
	MEMBER void push()
	{
		PushReg(EAX);
	}
	MEMBER void push64()
	{
		PushReg(EDX);
		PushReg(EAX);
	}
	MEMBER void pop()
	{
		PopReg(EAX);
	}
	MEMBER void pop64()
	{
		PopReg(EAX);
		PopReg(EDX);
	}
	MEMBER void pushStruct(int32_t size)
	{
		SubRegImm(ESP, Aligner(size));
		MovRegReg(ESI, ESP);
		(void)MemCopy(EAX, AT_SANSHOU, 0, size);
	}
	MEMBER void call()
	{
		CallReg(EAX);
	}
	MEMBER bool add8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		AddRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool add16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		AddRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool add32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		AddRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool add64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(ECX, EBX, at, adr)) return false;
		Add64();
		return true;
	}
	MEMBER void constAdd(int32_t i32)
	{
		AddRegImm(EAX, i32);
	}
	MEMBER bool sub8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		SubRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool sub16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		SubRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool sub32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		SubRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool sub64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(ECX, EBX, at, adr)) return false;
		Sub64();
		return true;
	}
	MEMBER void constSub(int32_t i32)
	{
		SubRegImm(EAX, i32);
	}
	MEMBER bool lShift(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		ShlRegCl(EAX);
		return true;
	}
	MEMBER bool lShift64(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		if(at == AT_SANSHOU) PushReg(ESI);
		ShlCl64();
		if(at == AT_SANSHOU) PopReg(ESI);
		return true;
	}
	MEMBER void constLShift(int32_t i32)
	{
		ShlRegImm(EAX, i32);
	}
	MEMBER bool rShiftI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		SarRegCl8(AL);
		return true;
	}
	MEMBER bool rShiftU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		ShrRegCl8(AL);
		return true;
	}
	MEMBER bool rShiftI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		SarRegCl(EAX, true);
		return true;
	}
	MEMBER bool rShiftU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		ShrRegCl(EAX, true);
		return true;
	}
	MEMBER bool rShiftI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		SarRegCl(EAX, false);
		return true;
	}
	MEMBER bool rShiftU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		ShrRegCl(EAX, false);
		return true;
	}
	MEMBER bool rShiftI64(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		if(at == AT_SANSHOU) PushReg(ESI);
		SarCl64();
		if(at == AT_SANSHOU) PopReg(ESI);
		return true;
	}
	MEMBER bool rShiftU64(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		if(at == AT_SANSHOU) PushReg(ESI);
		ShrCl64();
		if(at == AT_SANSHOU) PopReg(ESI);
		return true;
	}
	MEMBER void constRShiftI8(int8_t i8)
	{
		SarRegImm8(AL, i8);
	}
	MEMBER void constRShiftU8(uint8_t u8)
	{
		ShrRegImm8(AL, u8);
	}
	MEMBER void constRShiftI16(int16_t i16)
	{
		SarRegImm(EAX, (int8_t)i16, true);
	}
	MEMBER void constRShiftU16(uint16_t u16)
	{
		ShrRegImm(EAX, (int8_t)u16, true);
	}
	MEMBER void constRShiftI32(int32_t i32)
	{
		SarRegImm(EAX, (int8_t)i32, false);
	}
	MEMBER void constRShiftU32(uint32_t u32)
	{
		ShrRegImm(EAX, (int8_t)u32, false);
	}
	MEMBER bool and8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		AndRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool and16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		AndRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool and32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		AndRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool and64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(ECX, EBX, at, adr)) return false;
		And64();
		return true;
	}
	MEMBER void constAnd(int32_t i32)
	{
		AndRegImm(EAX, i32);
	}
	MEMBER bool xor8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		XorRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool xor16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		XorRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool xor32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		XorRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool xor64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(ECX, EBX, at, adr)) return false;
		Xor64();
		return true;
	}
	MEMBER void constXor(int32_t i32)
	{
		XorRegImm(EAX, i32);
	}
	MEMBER bool or8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		OrRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool or16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		OrRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool or32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		OrRegReg(EAX, ECX);
		return true;
	}
	MEMBER bool or64(AddressType at, int32_t adr)
	{
		if(!MovRegHns64(ECX, EBX, at, adr)) return false;
		Or64();
		return true;
	}
	MEMBER void constOr(int32_t i32)
	{
		OrRegImm(EAX, i32);
	}
	MEMBER bool mul8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		MulReg(ECX);
		return true;
	}
	MEMBER bool mul16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		MulReg(ECX);
		return true;
	}
	MEMBER bool mul32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		MulReg(ECX);
		return true;
	}
	MEMBER bool mul64(AddressType at, int32_t adr)
	{
		if(at == AT_SANSHOU) PushReg(ESI);
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		MulStk64();
		if(at == AT_SANSHOU) PopReg(ESI);
		return true;
	}
	MEMBER void constMul(int32_t i32)
	{
		if(i32 == 1) return;
		MovRegImm(ECX, i32);
		MulReg(ECX);
	}
	MEMBER void constMul64(int64_t i64)
	{
		if(i64 == 1) return;
		PushReg(EDX);
		PushReg(EAX);
		setReg0_64(i64);
		MulStk64();
	}
	MEMBER bool divI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		IDivReg8(CL);
		return true;
	}
	MEMBER bool divU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		DivReg8(CL);
		return true;
	}
	MEMBER bool divI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		IDivReg(ECX, true);
		return true;
	}
	MEMBER bool divU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		DivReg(ECX, true);
		return true;
	}
	MEMBER bool divI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		IDivReg(ECX, false);
		return true;
	}
	MEMBER bool divU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		DivReg(ECX, false);
		return true;
	}
	MEMBER bool divI64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IDivStk64();
		return true;
	}
	MEMBER bool divU64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		DivStk64();
		return true;
	}
	MEMBER void constDivI8(int8_t i8)
	{
		if(i8 == 1) return;
		MovRegImm(ECX, i8);
		IDivReg8(CL);
	}
	MEMBER void constDivU8(uint8_t u8)
	{
		if(u8 == 1) return;
		MovRegImm(ECX, u8);
		DivReg8(CL);
	}
	MEMBER void constDivI16(int16_t i16)
	{
		if(i16 == 1) return;
		MovRegImm(ECX, i16);
		IDivReg(ECX, true);
	}
	MEMBER void constDivU16(uint16_t u16)
	{
		if(u16 == 1) return;
		MovRegImm(ECX, u16);
		DivReg(ECX, true);
	}
	MEMBER void constDivI32(int32_t i32)
	{
		if(i32 == 1) return;
		MovRegImm(ECX, i32);
		IDivReg(ECX, false);
	}
	MEMBER void constDivU32(uint32_t u32)
	{
		if(u32 == 1) return;
		MovRegImm(ECX, u32);
		DivReg(ECX, false);
	}
	MEMBER void constDivI64(int64_t i64)
	{
		if(i64 == 1) return;
		PushReg(EDX);
		PushReg(EAX);
		setReg0_64(i64);
		IDivStk64();
	}
	MEMBER void constDivU64(uint64_t U64)
	{
		if(U64 == 1) return;
		PushReg(EDX);
		PushReg(EAX);
		setReg0_64(U64);
		DivStk64();
	}
	MEMBER bool remI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		IRemReg8(CL);
		return true;
	}
	MEMBER bool remU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		RemReg8(CL);
		return true;
	}
	MEMBER bool remI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		IRemReg(ECX, true);
		return true;
	}
	MEMBER bool remU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		RemReg(ECX, true);
		return true;
	}
	MEMBER bool remI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		IRemReg(ECX, false);
		return true;
	}
	MEMBER bool remU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		RemReg(ECX, false);
		return true;
	}
	MEMBER bool remI64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IRemStk64();
		return true;
	}
	MEMBER bool remU64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		RemStk64();
		return true;
	}
	MEMBER void constRemI8(int8_t i8)
	{
		if(abs(i8) == 1){
			MovRegImm(EAX, 0);
			return;
		}
		MovRegImm(ECX, i8);
		IRemReg8(CL);
	}
	MEMBER void constRemU8(uint8_t u8)
	{
		if(u8 == 1){
			MovRegImm(EAX, 0);
			return;
		}
		MovRegImm(ECX, u8);
		RemReg8(CL);
	}
	MEMBER void constRemI16(int16_t i16)
	{
		if(abs(i16) == 1){
			MovRegImm(EAX, 0);
			return;
		}
		MovRegImm(ECX, i16);
		IRemReg(ECX, true);
	}
	MEMBER void constRemU16(uint16_t u16)
	{
		if(u16 == 1){
			MovRegImm(EAX, 0);
			return;
		}
		MovRegImm(ECX, u16);
		RemReg(ECX, true);
	}
	MEMBER void constRemI32(int32_t i32)
	{
		if(abs(i32) == 1){
			MovRegImm(EAX, 0);
			return;
		}
		MovRegImm(ECX, i32);
		IRemReg(ECX, false);
	}
	MEMBER void constRemU32(uint32_t u32)
	{
		if(u32 == 1){
			MovRegImm(EAX, 0);
			return;
		}
		MovRegImm(ECX, u32);
		RemReg(ECX, false);
	}
	MEMBER void constRemI64(int64_t i64)
	{
		if(abs(i64) == 1){
			MovRegImm(EAX, 0);
			MovRegImm(EDX, 0);
			return;
		}
		PushReg(EDX);
		PushReg(EAX);
		setReg0_64(i64);
		IRemStk64();
	}
	MEMBER void constRemU64(uint64_t U64)
	{
		if(U64 == 1){
			MovRegImm(EAX, 0);
			MovRegImm(EDX, 0);
			return;
		}
		PushReg(EDX);
		PushReg(EAX);
		setReg0_64(U64);
		RemStk64();
	}
	MEMBER bool lessI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); ILess();
		return true;
	}
	MEMBER bool lessU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); Less();
		return true;
	}
	MEMBER bool lessI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); ILess();
		return true;
	}
	MEMBER bool lessU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); Less();
		return true;
	}
	MEMBER bool lessI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); ILess();
		return true;
	}
	MEMBER bool lessU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); Less();
		return true;
	}
	MEMBER bool lessI64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		ILessStk64();
		return true;
	}
	MEMBER bool lessU64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		LessStk64();
		return true;
	}
	MEMBER bool eLessI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); IIka();
		return true;
	}
	MEMBER bool eLessU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); Ika();
		return true;
	}
	MEMBER bool eLessI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); IIka();
		return true;
	}
	MEMBER bool eLessU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); Ika();
		return true;
	}
	MEMBER bool eLessI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); IIka();
		return true;
	}
	MEMBER bool eLessU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); Ika();
		return true;
	}
	MEMBER bool eLessI64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IIkaStk64();
		return true;
	}
	MEMBER bool eLessU64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IkaStk64();
		return true;
	}
	MEMBER bool overI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); IOver();
		return true;
	}
	MEMBER bool overU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); Over();
		return true;
	}
	MEMBER bool overI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); IOver();
		return true;
	}
	MEMBER bool overU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); Over();
		return true;
	}
	MEMBER bool overI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); IOver();
		return true;
	}
	MEMBER bool overU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); Over();
		return true;
	}
	MEMBER bool overI64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IOverStk64();
		return true;
	}
	MEMBER bool overU64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		OverStk64();
		return true;
	}
	MEMBER bool eOverI8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); IIjou();
		return true;
	}
	MEMBER bool eOverU8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); Ijou();
		return true;
	}
	MEMBER bool eOverI16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); IIjou();
		return true;
	}
	MEMBER bool eOverU16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); Ijou();
		return true;
	}
	MEMBER bool eOverI32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); IIjou();
		return true;
	}
	MEMBER bool eOverU32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); Ijou();
		return true;
	}
	MEMBER bool eOverI64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IIjouStk64();
		return true;
	}
	MEMBER bool eOverU64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		IjouStk64();
		return true;
	}
	MEMBER bool equal8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); Equal();
		return true;
	}
	MEMBER bool equal16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); Equal();
		return true;
	}
	MEMBER bool equal32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); Equal();
		return true;
	}
	MEMBER bool equal64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		EqualStk64();
		return true;
	}
	MEMBER bool equalRef(AddressType at, int32_t adr)
	{
		PluginCall((void*)RefPosNullable);
		MovRegReg(EBX, EAX);
		if(!PushHnsRef(at, adr, false)) return false;
		PluginCall((void*)RefPosNullable);
		CmpRegReg(EAX, EBX, false); Equal();
		return true;
	}
	MEMBER bool equalDref(AddressType at, int32_t adr)
	{
		PluginCall((void*)RefPosNullable);
		AddRegImm(ESP, 4);
		MovRegReg(EBX, EAX);
		if(!PushHnsRef(at, adr, false)) return false;
		PluginCall((void*)RefPosNullable);
		CmpRegReg(EAX, EBX, false); Equal();
		return true;
	}
	MEMBER void stackEqualRef()
	{
		PluginCall((void*)RefPosNullable);
		MovRegReg(EBX, EAX);
		PluginCall((void*)RefPosNullable);
		CmpRegReg(EAX, EBX, false); Equal();
	}
	MEMBER void stackEqualDref()
	{
		PluginCall((void*)RefPosNullable);
		AddRegImm(ESP, 4);
		MovRegReg(EBX, EAX);
		PluginCall((void*)RefPosNullable);
		AddRegImm(ESP, 4);
		CmpRegReg(EAX, EBX, false); Equal();
	}
	MEMBER bool nEqual8(AddressType at, int32_t adr)
	{
		if(!MovRegHns8(CL, at, adr)) return false;
		CmpRegReg8(AL, CL); NEqual();
		return true;
	}
	MEMBER bool nEqual16(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, true)) return false;
		CmpRegReg(EAX, ECX, true); NEqual();
		return true;
	}
	MEMBER bool nEqual32(AddressType at, int32_t adr)
	{
		if(!MovRegHns(ECX, at, adr, false)) return false;
		CmpRegReg(EAX, ECX, false); NEqual();
		return true;
	}
	MEMBER bool nEqual64(AddressType at, int32_t adr)
	{
		PushReg(EDX);
		PushReg(EAX);
		if(!loadReg0_64(at, adr)) return false;
		NEqualStk64();
		return true;
	}
	MEMBER bool nEqualRef(AddressType at, int32_t adr)
	{
		PluginCall((void*)RefPosNullable);
		MovRegReg(EBX, EAX);
		if(!PushHnsRef(at, adr, false)) return false;
		PluginCall((void*)RefPosNullable);
		CmpRegReg(EAX, EBX, false); NEqual();
		return true;
	}
	MEMBER bool nEqualDref(AddressType at, int32_t adr)
	{
		PluginCall((void*)RefPosNullable);
		AddRegImm(ESP, 4);
		MovRegReg(EBX, EAX);
		if(!PushHnsRef(at, adr, false)) return false;
		PluginCall((void*)RefPosNullable);
		CmpRegReg(EAX, EBX, false); NEqual();
		return true;
	}
	MEMBER void stackNEqualRef()
	{
		PluginCall((void*)RefPosNullable);
		MovRegReg(EBX, EAX);
		PluginCall((void*)RefPosNullable);
		CmpRegReg(EAX, EBX, false); NEqual();
	}
	MEMBER void stackNEqualDref()
	{
		PluginCall((void*)RefPosNullable);
		AddRegImm(ESP, 4);
		MovRegReg(EBX, EAX);
		PluginCall((void*)RefPosNullable);
		AddRegImm(ESP, 4);
		CmpRegReg(EAX, EBX, false); NEqual();
	}
};
