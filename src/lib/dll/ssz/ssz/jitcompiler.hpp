


class JITer
{
	typedef SourceTree<JunkanGoroshi> SrcTree;
	SrcTree *root;
	std::WSTR* filename;
	intptr_t gyousuu;
	BinaryCode bin;
	intptr_t glbbp;
	struct KuwashiiType
	{
		int32_t id;
		SrcTree* pstre;
		std::basic_string<intptr_t> kwsk;
		bool memberObj;
		MEMBER KuwashiiType() : pstre(nullptr), memberObj(false)
		{
		}
		MEMBER KuwashiiType& operator=(const KuwashiiType &x)
		{
			id = x.id;
			pstre = x.pstre;
			kwsk = x.kwsk;
			memberObj = x.memberObj;
			return *this;
		}
	};
	struct KanTrefStruct
	{
		intptr_t argofs;
		std::basic_string<intptr_t> kwsk;
	};
	class Compi
	{
	protected:
		JITer* pjtr;
		int64_t castvar;
	public:
		STAMEM void SSZ_CDECL ThreadRun(
			void* (SSZ_STDCALL* jgsr)(), void* calladr, intptr_t argsize, ...)
		{
			va_list ap;
			intptr_t i;
			ThreadStructure *pts = new ThreadStructure;
			pts->argsize = argsize;
			pts->calladr = calladr;
			pts->jigoshori = jgsr;
			va_start(ap, argsize);
			if(argsize > 0){
				pts->argument = new int8_t[argsize];
				for(i = 0; i < argsize; i += sizeof(intptr_t)){
					*(intptr_t*)(((int8_t*)pts->argument)+i) =
						va_arg(ap, intptr_t);
				}
			}else{
				pts->argument = nullptr;
			}
			va_arg(ap, Thread*)->create(ThreadFunction, pts);
			va_end(ap);
		}
		STAMEM bool SSZ_CDECL DynMethod(
			MAIN_FUNC pm, SrcTree* pst,	Reference* methname, ...)
		{
			va_list ap;
			va_start(ap, methname);
			intptr_t idx = 0;
			std::basic_string<intptr_t> type;
			type = METHOD_TOKEN;
			type += 0;
			FuncToken(type, (intptr_t*)ap, idx);
			for(intptr_t n = 0; n < idx; n++) va_arg(ap, intptr_t);
			auto dr = (DynamicRef*)ap;
			va_arg(ap, DynamicRef);
			va_end(ap);
			if(dr->obj.len() == 0) return false;
			int32_t id = dr->typ;
			if(id < 0 && id > ENDCLASS_TYPEID) return false;
			SrcTree* cl = pst->stat->funclist.Get(id);
			std::WSTR name;
			intptr_t offset = 0;
			name.append(
				(WCHR*)methname->atpos(), methname->len()/sizeof(WCHR));
			SrcTree* me = cl->IjouTansaku(name, offset);
			if(
				me == nullptr || offset != 0
				|| !me->isPublic((TokenKind)me->rettype[0], *pst))
			{
				return false;
			}
			type[1] = me->parent->funcid;
			std::basic_string<intptr_t> type2;
			type2.append(type.data(), 2);
			me->FuncTypeGet(*me->srce, type2, false, *me);
			if(
				!pst->YuruiKataCheck(
					type2, type, pst->srce->filename, pst->srce->sst.g))
			{
				return false;
			}
			dr->typ = (int32_t)pm + me->byteadress;
			return true;
		}
		STAMEM bool SSZ_CDECL ConstEval(MAIN_FUNC pm, SrcTree* pst, ...)
		{
			va_list ap;
			Reference r;
			std::basic_string<intptr_t> type, last;
			Source<JunkanGoroshi> src(pst->stat->ss);
			va_start(ap, pst);
			intptr_t idx = 0;
			type = CONST_TOKEN;
			auto tid = TokenToTypeId((intptr_t*)ap, idx);
			switch(tid){
			case METHOD_TYPEID:
				idx++;
			case FUNC_TYPEID:
			case DELEGATE_TYPEID:
				type.append((intptr_t*)ap, idx);
				FuncToken(type, (intptr_t*)ap, idx);
				break;
			default:
				type.append((intptr_t*)ap, idx);
			}
			for(intptr_t i = 0; i < idx; i++) va_arg(ap, intptr_t);
			r = va_arg(ap, Reference);
			if(r.len() == 0) return false;
			void* p = va_arg(ap, void*);
			va_end(ap);
			src.Clear();
			src.src.append((WCHR*)r.atpos(), r.len()/sizeof(WCHR));
			src.source = src.src.c_str();
			if(
				!pst->ConstShiki(
					src, NULL_TOKEN,
					src.GetToken(*pst), last, NULL_TOKEN, true, false)
				|| src.GetToken(*pst) != NULL_TOKEN
				|| !pst->ConstCaster(last, type))
			{
				return false;
			}
			switch(tid){
			case BYTE_TYPEID:
				*(int8_t*)p = *(int8_t*)(last.data()+idx+1);
				break;
			case UBYTE_TYPEID:
				*(uint8_t*)p = *(uint8_t*)(last.data()+idx+1);
				break;
			case SHORT_TYPEID:
				*(int16_t*)p = *(int16_t*)(last.data()+idx+1);
				break;
			case USHORT_TYPEID:
				*(uint16_t*)p = *(uint16_t*)(last.data()+idx+1);
				break;
			case INT_TYPEID:
				*(int32_t*)p = *(int32_t*)(last.data()+idx+1);
				break;
			case UINT_TYPEID:
				*(uint32_t*)p = *(uint32_t*)(last.data()+idx+1);
				break;
			case LONG_TYPEID:
				*(int64_t*)p = *(int64_t*)(last.data()+idx+1);
				break;
			case ULONG_TYPEID:
				*(uint64_t*)p = *(uint64_t*)(last.data()+idx+1);
				break;
			case CHAR_TYPEID:
				*(char16_t*)p = *(char16_t*)(last.data()+idx+1);
				break;
			case ADDRESS_TYPEID:
				*(intptr_t*)p = *(intptr_t*)(last.data()+idx+1);
				break;
			case FLOAT_TYPEID:
				*(float*)p = *(float*)(last.data()+idx+1);
				break;
			case DOUBLE_TYPEID:
				*(double*)p = *(double*)(last.data()+idx+1);
				break;
			case BOOL_TYPEID:
				*(bool*)p = *(bool*)(last.data()+idx+1);
				break;
			case FUNC_TYPEID:
			case METHOD_TYPEID:
				*(intptr_t*)p =
					(intptr_t)pm + pst->stat->funclist.Get(
						*(int32_t*)(last.data()+idx+1))->byteadress;
				break;
			default:
				if(
					tid >= 0 && tid <= ENDCLASS_TYPEID
					&& pst->stat->funclist.Get(tid)->selftype == ENUM_BLOCK)
				{
					*(int32_t*)p = *(int32_t*)(last.data()+idx+1);
					break;
				}
				return false;
			}
			return true;
		}
		STAMEM void SSZ_STDCALL PutGbld(
			SSZStatic<JunkanGoroshi>* ss, void (SSZ_STDCALL* d)())
		{
			ss->gbldel += d;
		}
		STAMEM void SSZ_STDCALL RunGbld(SSZStatic<JunkanGoroshi>* ss)
		{
			for(intptr_t i = ss->gbldel.size()-1; i >= 0; i--) ss->gbldel[i]();
			ss->gbldel.clear();
		}
		STAMEM void SSZ_STDCALL DynRefCopy(
			SSZStatic<JunkanGoroshi>* ss, int32_t styp,
			DynamicRef* pdr, MAIN_FUNC pm, Reference src)
		{
			ss->CircularGC.DynrefCopy(pdr, &src, styp, pm);
		}
		STAMEM bool SSZ_STDCALL DynRefGet(
			SSZStatic<JunkanGoroshi>* ss, int32_t typ,
			MAIN_FUNC pm, Reference* dst, DynamicRef src)
		{
			if(typ != src.typ) return false;
			DynamicRef tmp;
			tmp.typ = typ;
			tmp.obj = *dst;
			ss->CircularGC.DynrefCopy(&tmp, &src.obj, typ, pm);
			*dst = tmp.obj;
			return true;
		}
		STAMEM intptr_t SSZ_STDCALL DynRefTypeSize(SrcTree* pst, DynamicRef dr)
		{
			return pst->TypeIdToSize(dr.typ);
		}
		STAMEM intptr_t SSZ_STDCALL DynRefOffset(SrcTree* pst, DynamicRef dr)
		{
			intptr_t ts = pst->TypeIdToSize(dr.typ);
			if(ts == 0) return 0;
			return dr.obj.position / ts;
		}
		STAMEM intptr_t SSZ_STDCALL DynRefLen(SrcTree* pst, DynamicRef dr)
		{
			intptr_t ts = pst->TypeIdToSize(dr.typ);
			if(ts == 0) return 0;
			return dr.obj.len() / ts;
		}
		STAMEM void SSZ_STDCALL RefCntUp(Reference* r)
		{
			r->countup();
		}
		STAMEM bool SSZ_STDCALL RefCntDwn(Reference* r)
		{
			if(
				r->pointer && InterlockedDecrement((LPLONG)&r->pointer->head.refcount)
				== 0)
			{
				if(r->pointer->head.datasize > 0) return true;
				r->pointer->delet();
			}
			r->init();
			return false;
		}
		STAMEM bool SSZ_STDCALL RefCopy(Reference* dst, Reference* src)
		{
			Reference tmp = *dst;
			HeapObj* php = dst->copy(*src);
			if(php != nullptr){
				if(php->head.datasize > 0){
					*src = tmp;
					return true;
				}
				php->delet();
			}
			return false;
		}
		STAMEM void SSZ_STDCALL RefeNew(
			Reference* r, intptr_t l, intptr_t ts,
			void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t),
			void* (SSZ_STDCALL* newer)())
		{
			RefNewStructure rn = {(void*)newer, ts};
			SSZ_TRY
				r->refnew(l, ts, fp, &rn);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
		}
		STAMEM void SSZ_STDCALL ListNew(
			Reference* r, intptr_t l, intptr_t ts,
			void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t),
			void* (SSZ_STDCALL* newer)())
		{
			RefNewStructure rn = {(void*)newer, ts};
			SSZ_TRY
				r->listnew(l, ts, fp, &rn);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
		}
		STAMEM int8_t* SSZ_STDCALL ListIdxNew(
			Reference* r, intptr_t i, intptr_t ts)
		{
			SSZ_TRY
				return r->listnewat(i, ts);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
		}
		STAMEM int8_t* SSZ_STDCALL ListIdxNewZeroClear(
			Reference* r, intptr_t i, intptr_t ts)
		{
			SSZ_TRY
				return r->listnewat(i, ts, refzeroclearcb);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
		}
		STAMEM int8_t* SSZ_STDCALL ListIdxNewDynRefInit(
			SSZStatic<JunkanGoroshi>* ss,
			Reference* r, intptr_t i, intptr_t ts)
		{
			int8_t* ret;
			SSZ_TRY
				if(r->null()){
					ret = r->listnewat(i, ts, refdynnullclearcb);
					ss->CircularGC.RefNew(-1, 1, r->pointer);
				}else{
					ret = r->listnewat(i, ts, refdynnullclearcb);
				}
			SSZ_EXCEPT(*((uint8_t**)&ss - 1) - 1)
			return ret;
		}
		STAMEM int8_t* SSZ_STDCALL ListIdxNewClass(
			void* (SSZ_STDCALL* newer)(),
			Reference* r, intptr_t i, intptr_t ts)
		{
			RefNewStructure rn = {(void*)newer, ts};
			SSZ_TRY
				return r->listnewat(i, ts, RefClassNewCB, &rn);
			SSZ_EXCEPT(*((uint8_t**)&newer - 1) - 1)
		}
		STAMEM int8_t* SSZ_STDCALL CircListIdxNewZeroClear(
			SSZStatic<JunkanGoroshi>* ss, intptr_t nest, intptr_t rpid,
			Reference* r, intptr_t i, intptr_t ts)
		{
			int8_t* ret;
			SSZ_TRY
				if(r->null()){
					ret = r->listnewat(i, ts, refzeroclearcb);
					ss->CircularGC.RefNew(rpid, nest, r->pointer);
				}else{
					ret = r->listnewat(i, ts, refzeroclearcb);
				}
			SSZ_EXCEPT(*((uint8_t**)&ss - 1) - 1)
			return ret;
		}
		STAMEM int8_t* SSZ_STDCALL CircListIdxNewClass(
			SSZStatic<JunkanGoroshi>* ss, intptr_t rpid,
			void* (SSZ_STDCALL* newer)(),
			Reference* r, intptr_t i, intptr_t ts)
		{
			int8_t* ret;
			RefNewStructure rn = {(void*)newer, ts};
			SSZ_TRY
				if(r->null()){
					ret = r->listnewat(i, ts, RefClassNewCB, &rn);
					ss->CircularGC.RefNew(rpid, 0, r->pointer);
				}else{
					ret = r->listnewat(i, ts, RefClassNewCB, &rn);
				}
			SSZ_EXCEPT(*((uint8_t**)&ss - 1) - 1)
			return ret;
		}
		STAMEM bool SSZ_STDCALL CircRefCopy(
			SSZStatic<JunkanGoroshi>* ss, Reference* dst, Reference* src)
		{
			Reference tmp = *dst;
			if(ss->CircularGC.RefCopy(&tmp, src) != nullptr){
				*src = *(Reference*)dst;
				*(Reference*)dst = tmp;
				return true;
			}
			*(Reference*)dst = tmp;
			return false;
		}
		STAMEM void SSZ_STDCALL CircRefeNew(
			SSZStatic<JunkanGoroshi>* ss, intptr_t nest, intptr_t rpid,
			Reference* r, intptr_t l, intptr_t ts,
			void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t),
			void* (SSZ_STDCALL* newer)())
		{
			RefNewStructure rn = {(void*)newer, ts};
			SSZ_TRY
				r->refnew(l, ts, fp, &rn);
			SSZ_EXCEPT(*((uint8_t**)&ss - 1) - 1)
			ss->CircularGC.RefNew(rpid, nest, r->pointer);
		}
		STAMEM void SSZ_STDCALL CircListNew(
			SSZStatic<JunkanGoroshi>* ss, intptr_t nest, intptr_t rpid,
			Reference* r, intptr_t l, intptr_t ts,
			void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t),
			void* (SSZ_STDCALL* newer)())
		{
			RefNewStructure rn = {(void*)newer, ts};
			SSZ_TRY
				r->listnew(l, ts, fp, &rn);
			SSZ_EXCEPT(*((uint8_t**)&ss - 1) - 1)
			ss->CircularGC.RefNew(rpid, nest, r->pointer);
		}
		STAMEM void SSZ_STDCALL ListAppend(
			Reference* r, intptr_t size, void* p)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, size);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			memcpy(r->obj()->head.data+idx, p, size);
		}
		STAMEM void SSZ_STDCALL ListAppend8(Reference* r, int8_t i8)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, sizeof(int8_t));
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			*(int8_t*)(r->obj()->head.data+idx) = i8;
		}
		STAMEM void SSZ_STDCALL ListAppend16(Reference* r, int16_t i16)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, sizeof(int16_t));
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			*(int16_t*)(r->obj()->head.data+idx) = i16;
		}
		STAMEM void SSZ_STDCALL ListAppend32(Reference* r, int32_t i32)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, sizeof(int32_t));
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			*(int32_t*)(r->obj()->head.data+idx) = i32;
		}
		STAMEM void SSZ_STDCALL ListAppend64(Reference* r, int64_t i64)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, sizeof(int64_t));
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			*(int64_t*)(r->obj()->head.data+idx) = i64;
		}
		STAMEM void SSZ_STDCALL ListAppendOneRef(Reference* r, Reference src)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, sizeof(Reference), refzeroclearcb);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			Reference* r2 = (Reference*)(r->obj()->head.data+idx);
			r2->copy(src);
		}
		STAMEM void SSZ_STDCALL ListAppendOneDynref(
			Reference* r, DynamicRef src)
		{
			intptr_t idx;
			SSZ_TRY
				idx = r->addsize(1, sizeof(DynamicRef), refdynnullclearcb);
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
			DynamicRef* r2 = (DynamicRef*)(r->obj()->head.data+idx);
			r2->typ = src.typ;
			r2->obj.copy(src.obj);
		}
		STAMEM void SSZ_STDCALL ListAppendRef(Reference* r, Reference src)
		{
			intptr_t idx, l;
			l = src.len();//同じだとaddsizeで長さが変わるので保存
			if(l > 0){
				SSZ_TRY
					idx = r->addsize(l, 1);
				SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
				memcpy(
					r->obj()->head.data+idx,
					src.obj()->head.data+src.position, l);
			}
		}
		STAMEM void SSZ_STDCALL ListAppendRefRef(Reference* r, Reference src)
		{
			intptr_t idx, l;
			l = src.len();//同じだとaddsizeで長さが変わるので保存
			if(l > 0){
				SSZ_TRY
					idx = r->addsize(l, 1, refzeroclearcb);
				SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
				for(intptr_t i = 0; i < l; i += sizeof(Reference)){
					Reference* r2 = (Reference*)(r->obj()->head.data+idx+i);
					Reference* s2 =
						(Reference*)(src.obj()->head.data+src.position+i);
					r2->copy(*s2);
				}
			}
		}
		STAMEM void SSZ_STDCALL ListAppendRefDynref(
			Reference* r, Reference src)
		{
			intptr_t idx, l;
			l = src.len();//同じだとaddsizeで長さが変わるので保存
			if(l > 0){
				SSZ_TRY
					idx = r->addsize(l, 1, refdynnullclearcb);
				SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
				for(intptr_t i = 0; i < l; i += sizeof(DynamicRef)){
					DynamicRef* r2 = (DynamicRef*)(r->obj()->head.data+idx+i);
					DynamicRef* s2 =
						(DynamicRef*)(src.obj()->head.data+src.position+i);
					r2->typ = s2->typ;
					r2->obj.copy(s2->obj);
				}
			}
		}
		STAMEM void* SSZ_STDCALL RefPos(Reference r)
		{
			SSZ_TRY
				return r.atpos();
			SSZ_EXCEPT(*((uint8_t**)&r - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdx(intptr_t ts, intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat(i, ts);
			SSZ_EXCEPT(*((uint8_t**)&ts - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS1(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<1>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS2(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<2>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS3(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<3>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS4(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<4>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS5(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<5>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS6(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<6>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS7(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<7>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS8(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<8>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS9(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<9>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS10(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<10>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS11(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<11>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS12(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<12>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS13(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<13>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS14(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<14>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS15(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<15>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL RefIdxS16(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.refat<16>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdx(intptr_t ts, intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat(i, ts);
			SSZ_EXCEPT(*((uint8_t**)&ts - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS1(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<1>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS2(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<2>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS3(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<3>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS4(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<4>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS5(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<5>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS6(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<6>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS7(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<7>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS8(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<8>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS9(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<9>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS10(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<10>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS11(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<11>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS12(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<12>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS13(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<13>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS14(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<14>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS15(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<15>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM void* SSZ_STDCALL ListIdxS16(intptr_t i, Reference r)
		{
			SSZ_TRY
				return r.listat<16>(i);
			SSZ_EXCEPT(*((uint8_t**)&i - 1) - 1)
		}
		STAMEM intptr_t SSZ_STDCALL RefOffset(intptr_t ts, Reference r)
		{
			if(ts == 0) return 0;
			return r.position / ts;
		}
		STAMEM intptr_t SSZ_STDCALL RefLen(intptr_t ts, Reference r)
		{
			if(ts == 0) return 0;
			return r.len() / ts;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS1(Reference r)
		{
			return r.len() / 1;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS2(Reference r)
		{
			return r.len() / 2;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS3(Reference r)
		{
			return r.len() / 3;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS4(Reference r)
		{
			return r.len() / 4;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS5(Reference r)
		{
			return r.len() / 5;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS6(Reference r)
		{
			return r.len() / 6;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS7(Reference r)
		{
			return r.len() / 7;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS8(Reference r)
		{
			return r.len() / 8;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS9(Reference r)
		{
			return r.len() / 9;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS10(Reference r)
		{
			return r.len() / 10;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS11(Reference r)
		{
			return r.len() / 11;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS12(Reference r)
		{
			return r.len() / 12;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS13(Reference r)
		{
			return r.len() / 13;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS14(Reference r)
		{
			return r.len() / 14;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS15(Reference r)
		{
			return r.len() / 15;
		}
		STAMEM intptr_t SSZ_STDCALL RefLenS16(Reference r)
		{
			return r.len() / 16;
		}
		STAMEM void SSZ_STDCALL RefSlice(
			intptr_t ts, Reference* r, intptr_t m, intptr_t k)
		{
			if(ts == 0) return;
			r->slice(k, m, ts);
		}
		STAMEM void SSZ_STDCALL RefSliceS1(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<1>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS2(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<2>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS3(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<3>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS4(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<4>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS5(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<5>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS6(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<6>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS7(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<7>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS8(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<8>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS9(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<9>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS10(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<10>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS11(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<11>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS12(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<12>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS13(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<13>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS14(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<14>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS15(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<15>(k, m);
		}
		STAMEM void SSZ_STDCALL RefSliceS16(
			Reference* r, intptr_t m, intptr_t k)
		{
			r->slice<16>(k, m);
		}
		STAMEM void SSZ_STDCALL RefLock(Reference* r)
		{
			r->lock();
		}
		STAMEM void SSZ_STDCALL RefUnlock(Reference* r)
		{
			r->unlock();
		}
		STAMEM void SSZ_STDCALL ThreadWait(Thread* t)
		{
			t->wait();
		}
		STAMEM void SSZ_STDCALL RefThreadWait(Reference* r)
		{
			int8_t* p = r->pointer->head.data;
			intptr_t i, l = r->pointer->head.datasize;
			for(i = 0; i < l; i += sizeof(Thread)) ((Thread*)(p+i))->wait();
		}
		STAMEM void SSZ_STDCALL RefRefDel(intptr_t nest, Reference* r)
		{
			int8_t* p = r->pointer->head.data;
			intptr_t i, l = r->pointer->head.datasize;
			if(nest > 0){
				for(i = 0; i < l; i += sizeof(Reference)){
					if(RefCntDwn((Reference*)(p+i))){
						RefRefDel(nest-1, (Reference*)(p+i));
						((Reference*)(p+i))->pointer->delet();
					}
				}
			}else{
				for(i = 0; i < l; i += sizeof(Reference)){
					if(RefCntDwn((Reference*)(p+i))){
						((Reference*)(p+i))->pointer->delet();
					}
				}
			}
		}
		STAMEM void SSZ_STDCALL RefRefThreadWait(intptr_t nest, Reference* r)
		{
			int8_t* p = r->pointer->head.data;
			intptr_t i, l = r->pointer->head.datasize;
			if(nest > 0){
				for(i = 0; i < l; i += sizeof(Reference)){
					if(RefCntDwn((Reference*)(p+i))){
						RefRefThreadWait(nest-1, (Reference*)(p+i));
						((Reference*)(p+i))->pointer->delet();
					}
				}
			}else{
				for(i = 0; i < l; i += sizeof(Reference)){
					if(RefCntDwn((Reference*)(p+i))){
						RefThreadWait((Reference*)(p+i));
						((Reference*)(p+i))->pointer->delet();
					}
				}
			}
		}
		STAMEM void SSZ_STDCALL RefRefClassDel(
			void* (SSZ_STDCALL* deler)(), intptr_t csize,
			intptr_t nest, Reference* r)
		{
			int8_t* p = r->pointer->head.data;
			intptr_t i, l = r->pointer->head.datasize;
			if(nest > 0){
				for(i = 0; i < l; i += sizeof(Reference)){
					if(RefCntDwn((Reference*)(p+i))){
						RefRefClassDel(
							deler, csize, nest-1, (Reference*)(p+i));
						((Reference*)(p+i))->pointer->delet();
					}
				}
			}else{
				for(i = 0; i < l; i += sizeof(Reference)){
					if(RefCntDwn((Reference*)(p+i))){
						RefClassDel(deler, csize, (Reference*)(p+i));
						((Reference*)(p+i))->pointer->delet();
					}
				}
			}
		}
		STAMEM void SSZ_STDCALL RefRenketsu(
			Reference* r, Reference r1, Reference r2)
		{
			r->init();
			r->refnew(r1.len() + r2.len(), 1);
			if(r1.len() > 0) memcpy(r->atpos(), r1.atpos(), r1.len());
			if(r2.len() > 0){
				memcpy(r->atpos()+r1.len(), r2.atpos(), r2.len());
			}
		}
		STAMEM void SSZ_STDCALL RefRefRenketsu(
			Reference* r, Reference r1, Reference r2)
		{
			RefRenketsu(r, r1, r2);
			intptr_t l = r->len();
			if(l > 0){
				int8_t* p = r->atpos();
				for(intptr_t i = 0; i < l; i += sizeof(Reference)){
					((Reference*)(p+i))->countup();
				}
			}
		}
		STAMEM void SSZ_STDCALL RefDynRefRenketsu(
			Reference* r, Reference r1, Reference r2)
		{
			RefRenketsu(r, r1, r2);
			intptr_t l = r->len();
			if(l > 0){
				int8_t* p = r->atpos();
				for(intptr_t i = 0; i < l; i += sizeof(DynamicRef)){
					((DynamicRef*)(p+i))->obj.countup();
				}
			}
		}
		STAMEM void SSZ_STDCALL ListRenketsu(
			Reference* r, Reference r1, Reference r2)
		{
			r->init();
			r->listnew(r1.len() + r2.len(), 1);
			if(r1.len() > 0) memcpy(r->atpos(), r1.atpos(), r1.len());
			if(r2.len() > 0){
				memcpy(r->atpos()+r1.len(), r2.atpos(), r2.len());
			}
		}
		STAMEM void SSZ_STDCALL ListRefRenketsu(
			Reference* r, Reference r1, Reference r2)
		{
			ListRenketsu(r, r1, r2);
			intptr_t l = r->len();
			if(l > 0){
				int8_t* p = r->atpos();
				for(intptr_t i = 0; i < l; i += sizeof(Reference)){
					((Reference*)(p+i))->countup();
				}
			}
		}
		STAMEM void SSZ_STDCALL ListDynRefRenketsu(
			Reference* r, Reference r1, Reference r2)
		{
			ListRenketsu(r, r1, r2);
			intptr_t l = r->len();
			if(l > 0){
				int8_t* p = r->atpos();
				for(intptr_t i = 0; i < l; i += sizeof(DynamicRef)){
					((DynamicRef*)(p+i))->obj.countup();
				}
			}
		}
		STAMEM void SSZ_CDECL RefCopyNew(Reference *r, intptr_t size, ...)
		{
			r->init();
			r->refnew(size, 1);
			va_list ap;
			va_start(ap, size);
			memcpy(r->atpos(), ap, size);
			va_end(ap);
		}
		STAMEM void SSZ_CDECL RefRefCopyNew(Reference *r, intptr_t size, ...)
		{
			r->init();
			r->refnew(size, 1);
			va_list ap;
			va_start(ap, size);
			auto tmp = (Reference*)ap;
			va_arg(ap, Reference);
			tmp->countup();
			memcpy(r->atpos(), tmp, size);
			va_end(ap);
		}
		STAMEM void SSZ_STDCALL IdName(SrcTree* pst, int32_t id, Reference* r)
		{
			r->init();
			pst->TypeIdtoName(*r, id);
		}
		STAMEM void SSZ_STDCALL IntToStr(int64_t i, Reference* r)
		{
			r->init();
			PluginUtil pu(nullptr, nullptr);
			pu.wstrToRef(*r, IntToString(i));
		}
		STAMEM void SSZ_STDCALL UintToStr(uint64_t u, Reference* r)
		{
			r->init();
			PluginUtil pu(nullptr, nullptr);
			pu.wstrToRef(*r, IntToString(u));
		}
		STAMEM void SSZ_STDCALL CharToStr(char16_t c, Reference* r)
		{
			r->init();
			PluginUtil pu(nullptr, nullptr);
			pu.wstrToRef(*r, CharToString(c));
		}
		STAMEM void SSZ_STDCALL FloatToStr(float f, Reference* r)
		{
			r->init();
			PluginUtil pu(nullptr, nullptr);
			pu.wstrToRef(*r, FloatToString(f));
		}
		STAMEM void SSZ_STDCALL DoubleToStr(double d, Reference* r)
		{
			r->init();
			PluginUtil pu(nullptr, nullptr);
			pu.wstrToRef(*r, FloatToString(d));
		}
		STAMEM void SSZ_STDCALL BoolToStr(bool b, Reference* r)
		{
			r->init();
			PluginUtil pu(nullptr, nullptr);
			pu.wstrToRef(*r, BoolToString(b));
		}
		STAMEM void SSZ_STDCALL RefAll(
			void* (SSZ_CDECL* fp)(Delegate dlg, void*, void*),
			intptr_t ts, intptr_t rts, Delegate dlg, intptr_t nest,
			Reference r, Reference* ret)
		{
			if(r.len() <= 0) return;
			if(nest > 0){
				Reference* p = (Reference*)r.atpos();
				auto last = p + r.len()/sizeof(Reference) - 1;
				Reference* rp = nullptr;
				if(rts > 0){
					ret->init();
					ret->refnew(r.len(), 1, refzeroclearcb);
					rp = (Reference*)ret->atpos();
				}
				for(; p <= last; p++){
					RefAll(fp, ts, rts, dlg, nest-1, *p, rp);
					if(rp) rp++;
				}
			}else{
				auto p = r.atpos();
				auto last = p + r.len() - ts;
				int8_t* rp = nullptr;
				if(rts > 0){
					ret->init();
					ret->refnew(r.len() / ts, rts, refzeroclearcb);
					rp = ret->atpos();
				}
				for(; p <= last; p += ts){
					fp(dlg, p, rp);
					if(rp) rp += rts;
				}
			}
		}
		///////////////////////////////////////////////////////////////////////
		MEMBER void SetJtr(JITer *const po)
		{
			pjtr = po;
		}
		MEMBER bool Cast(
			const SrcTree& stree, std::basic_string<int32_t>& tystack,
			const int32_t dtype, int32_t& typ)
		{
			if(
				0 <= typ && typ <= ENDCLASS_TYPEID
				&& stree.stat->funclist.Get(typ)->selftype == ENUM_BLOCK)
			{
				tystack.back() = typ = INT_TYPEID;
			}
			if(!pjtr->bin.cast(dtype, typ)){
				pjtr->addErrMes(L("不正なキャストです。"));
				return false;
			}
			tystack.back() = typ = dtype;
			return true;
		}
		MEMBER bool JidouCast(
			const SrcTree& stree, std::basic_string<int32_t>& tystack,
			const int32_t dtype, int32_t& typ)
		{
			if(typ == dtype) return true;
			if(
				(
					(
						dtype == ADDRESS_TYPEID
						|| BYTE_TYPEID >= dtype && dtype >= LONG_TYPEID)
					&& (
						typ == ADDRESS_TYPEID
						|| BYTE_TYPEID >= typ && typ >= LONG_TYPEID))
				|| (
					UBYTE_TYPEID >= dtype && dtype >= ULONG_TYPEID
					&& UBYTE_TYPEID >= typ && typ >= ULONG_TYPEID)
				|| (
					(dtype == FLOAT_TYPEID || dtype == DOUBLE_TYPEID)
					&& (typ == FLOAT_TYPEID || typ == DOUBLE_TYPEID)))
			{
				return Cast(stree, tystack, dtype, typ);
			}
			pjtr->addErrMes(L("型エラーです。"));
			return false;
		}
		MEMBER intptr_t Kansuu(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			SrcTree& st, const bool readonly, const bool thrd,
			std::vector<KanTrefStruct>& tmprefl, bool memberObj)
		{
			intptr_t ii, idx, sizar, bp;
			int32_t typ;
			SrcTree *retcall = nullptr;
			bool refari = false;
			if(!st.isEnable()) return -1;
			sizar = 0;
			tmprefl.clear();
			ii = 0;
			while(iap[i] != SHOUKAKKOCLOSE_TOKEN){
				if(ii >= st.hikisuucount){
					pjtr->addErrMes(L("引数が多すぎます。"));
					return -1;
				}
				if(
					(
						typ = TokenToTypeId(
							st.funchensuu[st.tpcount+ii].type.data(), idx=0))
					== UNKNOWN_TYPEID) return -1;
				tystack += typ;
				pjtr->bin.tPush(ktype.id);
				ktype.id = VOID_TYPEID;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return -1;
					}
					i++;
				}while(
					iap[i] != SHOUKAKKOCLOSE_TOKEN && iap[i] != COMMA_TOKEN);
				if(st.funchensuu[st.tpcount+ii].type.back() == ~DAINYUU_TOKEN){
					sizar += Aliszof<intptr_t>();
					if(tystack.back() != UNKNOWN_TYPEID){
						pjtr->addErrMes(L("参照渡ししなければいけません。"));
						return -1;
					}
					if(thrd){
						pjtr->addErrMes(L("スレッドには参照渡しできません。"));
						return -1;
					}
					if(ktype.id != typ){
						pjtr->addErrMes(L("型エラーです。"));
						return -1;
					}
					if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
						SoushokuTobasi(ktype.kwsk.data(), idx=0);
						if(
							st.funchensuu[st.tpcount+ii].type.size()-1
							> ktype.kwsk.size()-idx)
						{
							pjtr->addErrMes(L("型エラーです。"));
							return -1;
						}
						for(
							intptr_t jj = 0;
							jj < IDX(
								st.funchensuu[st.tpcount+ii].type.size())-1;
							jj++, idx++)
						{
							if (
								st.funchensuu[st.tpcount + ii].type[jj]
								== STARSTAR_TOKEN) jj++;
							if (ktype.kwsk[idx] == STARSTAR_TOKEN) idx++;
							if (
								st.funchensuu[st.tpcount+ii].type[jj]
								!= ktype.kwsk[idx])
							{
								pjtr->addErrMes(L("型エラーです。"));
								return -1;
							}
						}
					}else if(
						ktype.id == FUNC_TYPEID || ktype.id == METHOD_TYPEID)
					{
						if(
							!FuncTypeCheck(
								st.funchensuu[st.tpcount+ii].type.size()-1,
								st.funchensuu[st.tpcount+ii].type.data(),
								ktype.kwsk.data()))
						{
							pjtr->addErrMes(L("型エラーです。"));
							return -1;
						}
					}
					ktype.id = VOID_TYPEID;
					i++;
				}else{
					sizar +=
						Aligner(
							stree.GetTypeSize(
								st.funchensuu[st.tpcount+ii].type));
					if(tystack.back() == UNKNOWN_TYPEID){
						pjtr->addErrMes(L("参照渡しする引数ではありません。"));
						return -1;
					}
					if(
						TMPREF_TYPEID >= ktype.id
						&& ktype.id >= TMPDYNLIST_TYPEID)
					{
						ktype.id += REF_TYPEID - TMPREF_TYPEID;
						tmprefl.resize(tmprefl.size()+1);
						tmprefl.back().argofs = sizar;
						tmprefl.back().kwsk =
							st.funchensuu[st.tpcount+ii].type;
					}
					if(
						ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID
						|| ktype.id == DYNREF_TYPEID
						|| ktype.id == DYNLIST_TYPEID)
					{
						if(
							(typ == DYNREF_TYPEID || typ == DYNLIST_TYPEID)
							&& (
								ktype.id == REF_TYPEID
								|| ktype.id == LIST_TYPEID))
						{
							int32_t rid;
							if (!DynDainyuuHantei(typ, ktype, rid)) return -1;
							pjtr->bin.refToDref(rid);
							ktype.id = VOID_TYPEID;
						}else if(
							!stree.YuruiKataCheck(
								ktype.kwsk, st.funchensuu[st.tpcount+ii].type,
								*pjtr->filename, pjtr->gyousuu))
						{
							return -1;
						}
						if(thrd){
							if(
								tmprefl.size() <= 0
								|| tmprefl.back().argofs != sizar)
							{
								pjtr->bin.pushStackTopAddress();
								pjtr->bin.PluginCall((void*)RefCntUp);
							}
							refari = true;
						}
					}else if(
						ktype.id == FUNC_TYPEID || ktype.id == METHOD_TYPEID)
					{
						if(
							!stree.YuruiKataCheck(
								ktype.kwsk, st.funchensuu[st.tpcount+ii].type,
								*pjtr->filename, pjtr->gyousuu))
						{
							return -1;
						}
					}else if(ktype.id == DELEGATE_TYPEID){
						if(thrd){
							pjtr->addErrMes(L("無名関数はスレッドに渡せません。"));
							return -1;
						}
						if(
							!stree.YuruiKataCheck(
								ktype.kwsk, st.funchensuu[st.tpcount+ii].type,
								*pjtr->filename, pjtr->gyousuu))
						{
							return -1;
						}
					}else if(0 <= ktype.id && ktype.id <= ENDCLASS_TYPEID){
						if(!JidouCast(stree, tystack, typ, ktype.id)){
							return -1;
						}
						if(
							stree.stat->funclist.Get(ktype.id)->selftype
							== CLASS_BLOCK)
						{
							pjtr->bin.pushStruct(
								stree.stat->funclist
									.Get(ktype.id)->GetMemberSize());
							ktype.id = VOID_TYPEID;
						}
					}else{
						if(!JidouCast(stree, tystack, typ, ktype.id)){
							return -1;
						}
						ktype.id = typ;
					}
				}
				if(iap[i] == COMMA_TOKEN){
					i++;
					if(iap[i] == SHOUKAKKOCLOSE_TOKEN) return -1;
				}
				ii++;
			}
			tystack.resize(tystack.size()-ii*2);
			if(ii != st.hikisuucount){
				pjtr->addErrMes(L("引数が少なすぎます。"));
				return -1;
			}
			if(!pjtr->bin.tPush(ktype.id)) return -1;
			if(
				(ktype.id = TokenToTypeId(st.rettype.data(), idx=0))
				== UNKNOWN_TYPEID)
			{
				return -1;
			}
			if(thrd){
				if(REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID){
					pjtr->addErrMes(L("参照型が返し値の関数はスレッドにできません。"));
					return -1;
				}
				ktype.id = VOID_TYPEID;
				tystack += ktype.id;
				pjtr->bin.PushImm(sizar);
				if(st.byteadress == 0){
					st.backpatch += pjtr->bin.PushCadr(0);
				}else{
					pjtr->bin.PushCadr(st.byteadress);
				}
				if(refari){
					if(st.sonota.thatoshori == 0){
						bp = pjtr->bin.Jump(0);
						st.sonota.thatoshori = pjtr->bin.code.size();
						for(
							intptr_t jj = st.tpcount+st.hikisuucount-1;
							jj >= st.tpcount; jj--)
						{
							if(
								st.funchensuu[jj].type[0] == REF_TOKEN
								|| st.funchensuu[jj].type[0] == LIST_TOKEN)
							{
								if(
									!RefCountDown(
										stree, BinaryCode::AT_MEMBER,
										st.GetMemberOffset(jj)
										- (st.GetMemberSize() - sizar),
										st.funchensuu[jj].type, false))
								{
									return -1;
								}
							}
						}
						pjtr->bin.Return(0, false);
						*(intptr_t *)(pjtr->bin.code.data()+bp) +=
							pjtr->bin.code.size();
					}
					pjtr->bin.PushCadr(st.sonota.thatoshori);
				}else{
					pjtr->bin.PushImm(0);
				}
				pjtr->bin.PluginCall((void*)ThreadRun);
				pjtr->bin.removeStackTop(sizar+sizeof(intptr_t)*4);
			}else{
				tystack += ktype.id;
				if(REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID){
					ktype.id += TMPREF_TYPEID - REF_TYPEID;
					ktype.kwsk = st.rettype;
					if(readonly){
						for(
							auto it = ktype.kwsk.begin();
							it != ktype.kwsk.end(); it++)
						{
							if (*it == KAKERU_TOKEN){
								*it = WARU_TOKEN;
							}else if(
								*it != REF_TOKEN && *it != LIST_TOKEN
								&& !IsSoushokuToken((TokenKind)*it))
							{
								break;
							}
						}
						ktype.memberObj = false;
					}
					else if (
						!memberObj || stree.frp->rettype[0] != WARU_TOKEN)
					{
						kakeruRemove(ktype.kwsk);
						ktype.memberObj = false;
					}
					else{
						ktype.memberObj = true;
					}
				}
			}
			return sizar;
		}
		MEMBER intptr_t KansuuPointer(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const SrcTree* const pmbrstree,
			std::vector<std::basic_string<intptr_t>>& waketa,
			std::vector<KanTrefStruct>& tmprefl)
		{
			intptr_t idx;
			int32_t typ;
			intptr_t sizee;
			SrcTree *retcall = nullptr;
			if(!stree.KansuuKata(pmbrstree, ktype.kwsk, waketa)) return -1;
			sizee = 0;
			tmprefl.clear();
			intptr_t ii = 0;
			while(iap[i] != SHOUKAKKOCLOSE_TOKEN){
				if(ii+1 >= IDX(waketa.size())){
					pjtr->addErrMes(L("引数が多すぎます。"));
					return -1;
				}
				typ = TokenToTypeId(waketa[ii+1].data(), idx=0);
				tystack += typ;
				pjtr->bin.tPush(ktype.id);
				ktype.id = VOID_TYPEID;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return -1;
					}
					i++;
				}while(
					iap[i] != SHOUKAKKOCLOSE_TOKEN && iap[i] != COMMA_TOKEN);
				if(typ == UNKNOWN_TYPEID) return -1;
				if(waketa[ii+1].back() == ~DAINYUU_TOKEN){
					sizee += Aliszof<intptr_t>();
					if(tystack.back() != UNKNOWN_TYPEID){
						pjtr->addErrMes(L("参照渡ししなければいけません。"));
						return -1;
					}
					if(ktype.id != typ){
						pjtr->addErrMes(L("型エラーです。"));
						return -1;
					}
					if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
						SoushokuTobasi(ktype.kwsk.data(), idx=0);
						if(waketa[ii+1].size()-1 > ktype.kwsk.size()-idx){
							pjtr->addErrMes(L("型エラーです。"));
							return -1;
						}
						for(
							intptr_t jj = 0;
							jj < IDX(waketa[ii+1].size())-1; jj++, idx++)
						{
							if (waketa[ii + 1][jj] == STARSTAR_TOKEN) jj++;
							if (ktype.kwsk[idx] == STARSTAR_TOKEN) idx++;
							if (waketa[ii + 1][jj] != ktype.kwsk[idx]){
								pjtr->addErrMes(L("型エラーです。"));
								return -1;
							}
						}
					}else if(
						ktype.id == FUNC_TYPEID || ktype.id == METHOD_TYPEID)
					{
						if(
							!FuncTypeCheck(
								waketa[ii+1].size()-1,
								waketa[ii+1].data(), ktype.kwsk.data()))
						{
							pjtr->addErrMes(L("型エラーです。"));
							return -1;
						}
					}
					ktype.id = VOID_TYPEID;
					i++;
				}else{
					sizee += Aligner(stree.GetTypeSize(waketa[ii+1]));
					if(tystack.back() == UNKNOWN_TYPEID){
						pjtr->addErrMes(L("参照渡しする引数ではありません。"));
						return -1;
					}
					if(
						TMPREF_TYPEID >= ktype.id
						&& ktype.id >= TMPDYNLIST_TYPEID)
					{
						ktype.id += REF_TYPEID - TMPREF_TYPEID;
						tmprefl.resize(tmprefl.size()+1);
						tmprefl.back().argofs = sizee;
						tmprefl.back().kwsk = waketa[ii+1];
					}
					if(
						ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID
						|| ktype.id == DYNREF_TYPEID
						|| ktype.id == DYNLIST_TYPEID
						|| ktype.id == FUNC_TYPEID || ktype.id == METHOD_TYPEID
						|| ktype.id == DELEGATE_TYPEID)
					{
						if(
							(typ == DYNREF_TYPEID || typ == DYNLIST_TYPEID)
							&& (
								ktype.id == REF_TYPEID
								|| ktype.id == LIST_TYPEID))
						{
							int32_t rid;
							if(!DynDainyuuHantei(typ, ktype, rid)){
								return -1;
							}
							pjtr->bin.refToDref(rid);
							ktype.id = VOID_TYPEID;
						}else if(
							!stree.YuruiKataCheck(
								ktype.kwsk,
								waketa[ii+1], *pjtr->filename, pjtr->gyousuu))
						{
							return -1;
						}
					}else if(0 <= ktype.id && ktype.id <= ENDCLASS_TYPEID){
						if(!JidouCast(stree, tystack, typ, ktype.id)){
							return -1;
						}
						if(
							stree.stat->funclist.Get(ktype.id)->selftype
							== CLASS_BLOCK)
						{
							pjtr->bin.pushStruct(
								stree.stat->funclist
									.Get(ktype.id)->GetMemberSize());
							ktype.id = VOID_TYPEID;
						}
					}else{
						if(!JidouCast(stree, tystack, typ, ktype.id)){
							return -1;
						}
						ktype.id = typ;
					}
				}
				if(iap[i] == COMMA_TOKEN){
					i++;
					if(iap[i] == SHOUKAKKOCLOSE_TOKEN) return -1;
				}
				ii++;
			}
			tystack.resize(tystack.size()-ii*2);
			if(ii+1 != waketa.size()){
				pjtr->addErrMes(L("引数が少なすぎます。"));
				return -1;
			}
			if(!pjtr->bin.tPush(ktype.id)) return -1;
			if(
				(ktype.id = TokenToTypeId(waketa[0].data(), idx=0))
				== UNKNOWN_TYPEID)
			{
				return -1;
			}
			tystack += ktype.id;
			if(REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID){
				ktype.id += TMPREF_TYPEID - REF_TYPEID;
				ktype.kwsk = waketa[0];
			}
			return sizee;
		}
		MEMBER bool KTDrop(SrcTree& stree, KuwashiiType& ktype)
		{
			switch(ktype.id){
			case REF_TYPEID:
			case LIST_TYPEID:
				pjtr->bin.removeStackTop(sizeof(Reference));
				break;
			case DYNREF_TYPEID:
			case DYNLIST_TYPEID:
				pjtr->bin.removeStackTop(sizeof(DynamicRef));
				break;
			case DELEGATE_TYPEID:
				pjtr->bin.removeStackTop(sizeof(Delegate));
				break;
			case VOID_TYPEID:
				break;
			case FLOAT_TYPEID:
			case DOUBLE_TYPEID:
				pjtr->bin.FltDrop();
				break;
			case TMPREF_TYPEID:
			case TMPLIST_TYPEID:
			case TMPDYNREF_TYPEID:
			case TMPDYNLIST_TYPEID:
				ktype.id += REF_TYPEID - TMPREF_TYPEID;
				if(!StackRefCountDown(stree, ktype)) return false;
				break;
			default:
				if(ktype.id < METHOD_TYPEID) return false;
				break;
			}
			ktype.id = VOID_TYPEID;
			return true;
		}
		MEMBER bool Teisuu(
			const SrcTree& stree, const KuwashiiType& ktype,
			const int32_t* const p)
		{
			switch(ktype.id){
			case BYTE_TYPEID:
			case UBYTE_TYPEID:
			case BOOL_TYPEID:
				pjtr->bin.setReg0(*(int8_t*)p);
				break;
			case SHORT_TYPEID:
			case USHORT_TYPEID:
			case CHAR_TYPEID:
				pjtr->bin.setReg0(*(int16_t*)p);
				break;
			default:
				if(
					ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
					|| stree.stat->funclist.Get(ktype.id)->selftype
					!= ENUM_BLOCK)
				{
					return false;
				}
			case INT_TYPEID:
			case ADDRESS_TYPEID:
			case UINT_TYPEID:
				pjtr->bin.setReg0(*p);
				break;
			case LONG_TYPEID:
			case ULONG_TYPEID:
				pjtr->bin.setReg0_64(*(int64_t*)p);
				break;
			case FLOAT_TYPEID:
				pjtr->bin.PushImm(*p);
				pjtr->bin.FldStk(false);
				break;
			case DOUBLE_TYPEID:
				pjtr->bin.PushImm64(*(int64_t*)p);
				pjtr->bin.FldStk(true);
				break;
			}
			return true;
		}
		MEMBER bool ConstEnzan(
			const SrcTree& stree, std::basic_string<int32_t>& tystack,
			KuwashiiType& ktype, int64_t cnsvar, const TokenKind tk)
		{
			switch(tk){
			case STARSTAR_TOKEN:
			case STARSTARDAINYUU_TOKEN:
				switch(ktype.id){
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FpowStk(false, false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FpowStk(true, false);
					break;
				default:
					return false;
				}
				break;
			case KAKERU_TOKEN:
			case KAKERUDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
					pjtr->bin.constMul(*(int8_t*)&cnsvar);
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constMul(*(int16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constMul(*(int32_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.constMul64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FmulStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FmulStk(true);
					break;
				default:
					return false;
				}
				break;
			case WARU_TOKEN:
			case WARUDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.constDivI8(*(int8_t*)&cnsvar);
					break;
				case UBYTE_TYPEID:
					pjtr->bin.constDivU8(*(uint8_t*)&cnsvar);
					break;
				case SHORT_TYPEID:
					pjtr->bin.constDivI16(*(int16_t*)&cnsvar);
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constDivU16(*(uint16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.constDivI32(*(int32_t*)&cnsvar);
					break;
				case UINT_TYPEID:
					pjtr->bin.constDivU32(*(uint32_t*)&cnsvar);
					break;
				case LONG_TYPEID:
					pjtr->bin.constDivI64(cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.constDivU64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FdivStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FdivStk(true);
					break;
				default:
					return false;
				}
				break;
			case AMARI_TOKEN:
			case AMARIDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.constRemI8(*(int8_t*)&cnsvar);
					break;
				case UBYTE_TYPEID:
					pjtr->bin.constRemU8(*(uint8_t*)&cnsvar);
					break;
				case SHORT_TYPEID:
					pjtr->bin.constRemI16(*(int16_t*)&cnsvar);
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constRemU16(*(uint16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.constRemI32(*(int32_t*)&cnsvar);
					break;
				case UINT_TYPEID:
					pjtr->bin.constRemU32(*(uint32_t*)&cnsvar);
					break;
				case LONG_TYPEID:
					pjtr->bin.constRemI64(cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.constRemU64(cnsvar);
					break;
				default:
					return false;
				}
				break;
			case PULUS_TOKEN:
			case PULUSDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
					pjtr->bin.constAdd(*(int8_t*)&cnsvar);
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constAdd(*(int16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constAdd(*(int32_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.AddImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FaddStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FaddStk(true);
					break;
				default:
					return false;
				}
				break;
			case MINUS_TOKEN:
			case MINUSDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
					pjtr->bin.constSub(*(int8_t*)&cnsvar);
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constSub(*(int16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constSub(*(int32_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.SubImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FsubStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FsubStk(true);
					break;
				default:
					return false;
				}
				break;
			case LSHIFT_TOKEN:
			case LSHIFTDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constLShift(*(int8_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.ShlImm64((int8_t)cnsvar);
					break;
				default:
					return false;
				}
				break;
			case RSHIFT_TOKEN:
			case RSHIFTDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.constRShiftI8(*(int8_t*)&cnsvar);
					break;
				case UBYTE_TYPEID:
					pjtr->bin.constRShiftU8(*(uint8_t*)&cnsvar);
					break;
				case SHORT_TYPEID:
					pjtr->bin.constRShiftI16(*(int16_t*)&cnsvar);
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constRShiftU16(*(uint16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.constRShiftI32(*(int32_t*)&cnsvar);
					break;
				case UINT_TYPEID:
					pjtr->bin.constRShiftU32(*(uint32_t*)&cnsvar);
					break;
				case LONG_TYPEID:
					pjtr->bin.SarImm64((int8_t)cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.ShrImm64((int8_t)cnsvar);
					break;
				default:
					return false;
				}
				break;
			case SHOU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpImm8(*(int8_t*)&cnsvar);
					pjtr->bin.ILess();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpImm8(*(uint8_t*)&cnsvar);
					pjtr->bin.Less();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpImm(*(int16_t*)&cnsvar, true);
					pjtr->bin.ILess();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpImm(*(uint16_t*)&cnsvar, true);
					pjtr->bin.Less();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpImm(*(int32_t*)&cnsvar, false);
					pjtr->bin.ILess();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpImm(*(uint32_t*)&cnsvar, false);
					pjtr->bin.Less();
					break;
				case LONG_TYPEID:
					pjtr->bin.ILessImm64(cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.LessImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi();
					pjtr->bin.Over();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi();
					pjtr->bin.Over();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case SHOUOREQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpImm8(*(int8_t*)&cnsvar);
					pjtr->bin.IIka();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpImm8(*(uint8_t*)&cnsvar);
					pjtr->bin.Ika();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpImm(*(int16_t*)&cnsvar, true);
					pjtr->bin.IIka();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpImm(*(uint16_t*)&cnsvar, true);
					pjtr->bin.Ika();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpImm(*(int32_t*)&cnsvar, false);
					pjtr->bin.IIka();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpImm(*(uint32_t*)&cnsvar, false);
					pjtr->bin.Ika();
					break;
				case LONG_TYPEID:
					pjtr->bin.IIkaImm64(cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.IkaImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi();
					pjtr->bin.Ijou();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi();
					pjtr->bin.Ijou();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case DAI_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpImm8(*(int8_t*)&cnsvar);
					pjtr->bin.IOver();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpImm8(*(uint8_t*)&cnsvar);
					pjtr->bin.Over();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpImm(*(int16_t*)&cnsvar, true);
					pjtr->bin.IOver();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpImm(*(uint16_t*)&cnsvar, true);
					pjtr->bin.Over();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpImm(*(int32_t*)&cnsvar, false);
					pjtr->bin.IOver();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpImm(*(uint32_t*)&cnsvar, false);
					pjtr->bin.Over();
					break;
				case LONG_TYPEID:
					pjtr->bin.IOverImm64(cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.OverImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi();
					pjtr->bin.Less();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi();
					pjtr->bin.Less();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case DAIOREQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpImm8(*(int8_t*)&cnsvar);
					pjtr->bin.IIjou();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpImm8(*(uint8_t*)&cnsvar);
					pjtr->bin.Ijou();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpImm(*(int16_t*)&cnsvar, true);
					pjtr->bin.IIjou();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpImm(*(uint16_t*)&cnsvar, true);
					pjtr->bin.Ijou();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpImm(*(int32_t*)&cnsvar, false);
					pjtr->bin.IIjou();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpImm(*(uint32_t*)&cnsvar, false);
					pjtr->bin.Ijou();
					break;
				case LONG_TYPEID:
					pjtr->bin.IIjouImm64(cnsvar);
					break;
				case ULONG_TYPEID:
					pjtr->bin.IjouImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi();
					pjtr->bin.Ika();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi();
					pjtr->bin.Ika();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case EQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.CmpImm8(*(int8_t*)&cnsvar);
					pjtr->bin.Equal();
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpImm(*(int16_t*)&cnsvar, true);
					pjtr->bin.Equal();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case FUNC_TYPEID: case METHOD_TYPEID:
					pjtr->bin.CmpImm(*(int32_t*)&cnsvar, false);
					pjtr->bin.Equal();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.EqualImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi();
					pjtr->bin.Equal();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi();
					pjtr->bin.Equal();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case NOTEQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.CmpImm8(*(int8_t*)&cnsvar);
					pjtr->bin.NEqual();
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpImm(*(int16_t*)&cnsvar, true);
					pjtr->bin.NEqual();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case FUNC_TYPEID: case METHOD_TYPEID:
					pjtr->bin.CmpImm(*(int32_t*)&cnsvar, false);
					pjtr->bin.NEqual();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.NEqualImm64(cnsvar);
					break;
				case FLOAT_TYPEID:
					pjtr->bin.PushImm(*(int32_t*)&cnsvar);
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi();
					pjtr->bin.NEqual();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.PushImm64(cnsvar);
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi();
					pjtr->bin.NEqual();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case AND_TOKEN:
			case ANDDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.constAnd(*(int8_t*)&cnsvar);
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constAnd(*(int16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constAnd(*(int32_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.AndImm64(cnsvar);
					break;
				default:
					return false;
				}
				break;
			case XOR_TOKEN:
			case XORDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.constXor(*(int8_t*)&cnsvar);
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constXor(*(int16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constXor(*(int32_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.XorImm64(cnsvar);
					break;
				default:
					return false;
				}
				break;
			case OR_TOKEN:
			case ORDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.constOr(*(int8_t*)&cnsvar);
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.constOr(*(int16_t*)&cnsvar);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.constOr(*(int32_t*)&cnsvar);
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.OrImm64(cnsvar);
					break;
				default:
					return false;
				}
				break;
			default:
				return false;
			}
			return true;
		}
		MEMBER bool HensuuEnzan(
			const SrcTree& stree, std::basic_string<int32_t>& tystack,
			KuwashiiType& ktype, const BinaryCode::AddressType at,
			const intptr_t ofs, const TokenKind tk)
		{
			switch(tk){
			case STARSTAR_TOKEN:
			case STARSTARDAINYUU_TOKEN:
				switch(ktype.id){
				case FLOAT_TYPEID:
					if(!pjtr->bin.loadReg0_32(at, ofs)) return false;
					pjtr->bin.push();
					pjtr->bin.FpowStk(false, false);
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.loadReg0_64(at, ofs)) return false;
					pjtr->bin.push64();
					pjtr->bin.FpowStk(true, false);
					break;
				default:
					return false;
				}
				break;
			case KAKERU_TOKEN:
			case KAKERUDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
					if(!pjtr->bin.mul8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.mul16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.mul32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.mul64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FmulAdr(at, ofs, false)) return false;
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FmulAdr(at, ofs, true)) return false;
					break;
				default:
					return false;
				}
				break;
			case WARU_TOKEN:
			case WARUDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.divI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.divU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.divI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.divU16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.divI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.divU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.divI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.divU64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FdivAdr(at, ofs, false)) return false;
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FdivAdr(at, ofs, true)) return false;
					break;
				default:
					return false;
				}
				break;
			case AMARI_TOKEN:
			case AMARIDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.remI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.remU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.remI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.remU16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.remI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.remU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.remI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.remU64(at, ofs)) return false;
					break;
				default:
					return false;
				}
				break;
			case PULUS_TOKEN:
			case PULUSDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
					if(!pjtr->bin.add8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.add16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.add32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.add64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FaddAdr(at, ofs, false)) return false;
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FaddAdr(at, ofs, true)) return false;
					break;
				default:
					return false;
				}
				break;
			case MINUS_TOKEN:
			case MINUSDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
					if(!pjtr->bin.sub8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.sub16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.sub32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.sub64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FsubAdr(at, ofs, false)) return false;
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FsubAdr(at, ofs, true)) return false;
					break;
				default:
					return false;
				}
				break;
			case LSHIFT_TOKEN:
			case LSHIFTDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.lShift(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.lShift64(at, ofs)) return false;
					break;
				default:
					return false;
				}
				break;
			case RSHIFT_TOKEN:
			case RSHIFTDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.rShiftI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.rShiftU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.rShiftI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID:case CHAR_TYPEID:
					if(!pjtr->bin.rShiftU16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.rShiftI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.rShiftU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.rShiftI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.rShiftU64(at, ofs)) return false;
					break;
				default:
					return false;
				}
				break;
			case SHOU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.lessI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.lessU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.lessI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.lessU16(at, ofs)) return false;
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.lessI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.lessU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.lessI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.lessU64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Over();
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Over();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case SHOUOREQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.eLessI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.eLessU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.eLessI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.eLessU16(at, ofs)) return false;
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.eLessI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.eLessU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.eLessI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.eLessU64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Ijou();
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Ijou();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case DAI_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.overI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.overU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.overI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.overU16(at, ofs)) return false;
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.overI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.overU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.overI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.overU64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Less();
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Less();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case DAIOREQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					if(!pjtr->bin.eOverI8(at, ofs)) return false;
					break;
				case UBYTE_TYPEID:
					if(!pjtr->bin.eOverU8(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
					if(!pjtr->bin.eOverI16(at, ofs)) return false;
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.eOverU16(at, ofs)) return false;
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					if(!pjtr->bin.eOverI32(at, ofs)) return false;
					break;
				case UINT_TYPEID:
					if(!pjtr->bin.eOverU32(at, ofs)) return false;
					break;
				case LONG_TYPEID:
					if(!pjtr->bin.eOverI64(at, ofs)) return false;
					break;
				case ULONG_TYPEID:
					if(!pjtr->bin.eOverU64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Ika();
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Ika();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case EQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					if(!pjtr->bin.equal8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.equal16(at, ofs)) return false;
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case FUNC_TYPEID: case METHOD_TYPEID:
					if(!pjtr->bin.equal32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.equal64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Equal();
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.Equal();
					break;
				case REF_TYPEID:
				case LIST_TYPEID:
					if(!pjtr->bin.equalRef(at, ofs)) return false;
					break;
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					if(!pjtr->bin.equalDref(at, ofs)) return false;
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case NOTEQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					if(!pjtr->bin.nEqual8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.nEqual16(at, ofs)) return false;
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case FUNC_TYPEID: case METHOD_TYPEID:
					if(!pjtr->bin.nEqual32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.nEqual64(at, ofs)) return false;
					break;
				case FLOAT_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.NEqual();
					break;
				case DOUBLE_TYPEID:
					if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
					pjtr->bin.Fcomi();
					pjtr->bin.NEqual();
					break;
				case REF_TYPEID:
				case LIST_TYPEID:
					if(!pjtr->bin.nEqualRef(at, ofs)) return false;
					break;
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					if(!pjtr->bin.nEqualDref(at, ofs)) return false;
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case AND_TOKEN:
			case ANDDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					if(!pjtr->bin.and8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.and16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.and32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.and64(at, ofs)) return false;
					break;
				default:
					return false;
				}
				break;
			case XOR_TOKEN:
			case XORDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					if(!pjtr->bin.xor8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.xor16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.xor32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.xor64(at, ofs)) return false;
					break;
				default:
					return false;
				}
				break;
			case OR_TOKEN:
			case ORDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					if(!pjtr->bin.or8(at, ofs)) return false;
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					if(!pjtr->bin.or16(at, ofs)) return false;
					break;
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					if(!pjtr->bin.or32(at, ofs)) return false;
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					if(!pjtr->bin.or64(at, ofs)) return false;
					break;
				default:
					return false;
				}
				break;
			default:
				return false;
			}
			return true;
		}
		MEMBER bool StackEnzan(
			const SrcTree& stree, std::basic_string<int32_t>& tystack,
			KuwashiiType& ktype, const TokenKind tk)
		{
			ktype.id = tystack[tystack.size()-2];
			if(!JidouCast(stree, tystack, ktype.id, tystack.back())){
				tystack.pop_back();
				return false;
			}
			tystack.pop_back();
			switch(tk){
			case STARSTAR_TOKEN:
			case STARSTARDAINYUU_TOKEN:
				switch(ktype.id){
				case FLOAT_TYPEID:
					pjtr->bin.FpowStk(false, true);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FpowStk(true, true);
					break;
				default:
					return false;
				}
				break;
			case KAKERU_TOKEN:
			case KAKERUDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.MulStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.MulStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FmulStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FmulStk(true);
					break;
				default:
					return false;
				}
				break;
			case WARU_TOKEN:
			case WARUDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.IDivStk8();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.DivStk8();
					break;
				case SHORT_TYPEID:
					pjtr->bin.IDivStk(true);
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.DivStk(true);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.IDivStk(false);
					break;
				case UINT_TYPEID:
					pjtr->bin.DivStk(false);
					break;
				case LONG_TYPEID:
					pjtr->bin.IDivStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.DivStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FdivStkSwap(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FdivStkSwap(true);
					break;
				default:
					return false;
				}
				break;
			case AMARI_TOKEN:
			case AMARIDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.IRemStk8();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.RemStk8();
					break;
				case SHORT_TYPEID:
					pjtr->bin.IRemStk(true);
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.RemStk(true);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.IRemStk(false);
					break;
				case UINT_TYPEID:
					pjtr->bin.RemStk(false);
					break;
				case LONG_TYPEID:
					pjtr->bin.IRemStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.RemStk64();
					break;
				default:
					return false;
				}
				break;
			case PULUS_TOKEN:
			case PULUSDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.AddStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.AddStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FaddStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FaddStk(true);
					break;
				default:
					return false;
				}
				break;
			case MINUS_TOKEN:
			case MINUSDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.SubStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.SubStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.Fchs();
					pjtr->bin.FaddStk(false);
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.Fchs();
					pjtr->bin.FaddStk(true);
					break;
				default:
					return false;
				}
				break;
			case LSHIFT_TOKEN:
			case LSHIFTDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.ShlStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.ShlStk64();
					break;
				default:
					return false;
				}
				break;
			case RSHIFT_TOKEN:
			case RSHIFTDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.SarStk8();
					break;
				case SHORT_TYPEID:
					pjtr->bin.SarStk(true);
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.SarStk(false);
					break;
				case UBYTE_TYPEID:
					pjtr->bin.ShrStk8();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.ShrStk(true);
					break;
				case UINT_TYPEID:
					pjtr->bin.ShrStk(false);
					break;
				case LONG_TYPEID:
					pjtr->bin.SarStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.ShrStk64();
					break;
				default:
					return false;
				}
				break;
			case SHOU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.ILess();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.Less();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.ILess();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.Less();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.ILess();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.Less();
					break;
				case LONG_TYPEID:
					pjtr->bin.ILessStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.LessStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi(); pjtr->bin.Less();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi(); pjtr->bin.Less();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case SHOUOREQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.IIka();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.Ika();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.IIka();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.Ika();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.IIka();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.Ika();
					break;
				case LONG_TYPEID:
					pjtr->bin.IIkaStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.IkaStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi(); pjtr->bin.Ika();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi(); pjtr->bin.Ika();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case DAI_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.IOver();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.Over();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.IOver();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.Over();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.IOver();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.Over();
					break;
				case LONG_TYPEID:
					pjtr->bin.IOverStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.OverStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi(); pjtr->bin.Over();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi(); pjtr->bin.Over();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case DAIOREQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.IIjou();
					break;
				case UBYTE_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.Ijou();
					break;
				case SHORT_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.IIjou();
					break;
				case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.Ijou();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.IIjou();
					break;
				case UINT_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.Ijou();
					break;
				case LONG_TYPEID:
					pjtr->bin.IIjouStk64();
					break;
				case ULONG_TYPEID:
					pjtr->bin.IjouStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi(); pjtr->bin.Ijou();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi(); pjtr->bin.Ijou();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case EQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.Equal();
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.Equal();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case FUNC_TYPEID: case METHOD_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.Equal();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.EqualStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi(); pjtr->bin.Equal();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi(); pjtr->bin.Equal();
					break;
				case REF_TYPEID:
				case LIST_TYPEID:
					pjtr->bin.stackEqualRef();
					break;
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					pjtr->bin.stackEqualDref();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case NOTEQUAL_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
					pjtr->bin.CmpStk8(); pjtr->bin.NEqual();
					break;
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					pjtr->bin.CmpStk(true); pjtr->bin.NEqual();
					break;
				default:
					if(
						ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
						|| stree.stat->funclist.Get(ktype.id)->selftype
						!= ENUM_BLOCK)
					{
						return false;
					}
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case FUNC_TYPEID: case METHOD_TYPEID:
					pjtr->bin.CmpStk(false); pjtr->bin.NEqual();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.NEqualStk64();
					break;
				case FLOAT_TYPEID:
					pjtr->bin.FldStk(false);
					pjtr->bin.Fcomi(); pjtr->bin.NEqual();
					break;
				case DOUBLE_TYPEID:
					pjtr->bin.FldStk(true);
					pjtr->bin.Fcomi(); pjtr->bin.NEqual();
					break;
				case REF_TYPEID:
				case LIST_TYPEID:
					pjtr->bin.stackNEqualRef();
					break;
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					pjtr->bin.stackNEqualDref();
					break;
				}
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case AND_TOKEN:
			case ANDDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case BOOL_TYPEID:
					pjtr->bin.AndStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.AndStk64();
					break;
				default:
					return false;
				}
				break;
			case XOR_TOKEN:
			case XORDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case BOOL_TYPEID:
					pjtr->bin.XorStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.XorStk64();
					break;
				default:
					return false;
				}
				break;
			case OR_TOKEN:
			case ORDAINYUU_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
				case BOOL_TYPEID:
					pjtr->bin.OrStk();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.OrStk64();
					break;
				default:
					return false;
				}
				break;
			default:
				return false;
			}
			return true;
		}
		MEMBER bool AAOO(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype)
		{
			intptr_t bp;
			SrcTree *retcall = nullptr;
			if(ktype.id != BOOL_TYPEID) return false;
			switch(iap[i]){
			case ANDAND_TOKEN:
				bp = pjtr->bin.FalseJump(0);
				break;
			case OROR_TOKEN:
				bp = pjtr->bin.TrueJump(0);
				break;
			default:
				return false;
			}
			tystack.back() = BOOL_TYPEID;
			ktype.id = VOID_TYPEID;
			for(i++; !(iap[i] == ANDAND_TOKEN || iap[i] == OROR_TOKEN); i++){
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
			}
			if(ktype.id != BOOL_TYPEID) return false;
			tystack.pop_back();
			*(intptr_t*)(pjtr->bin.code.data()+bp) += pjtr->bin.code.size();
			return true;
		}
		MEMBER bool Sankou(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype)
		{
			intptr_t bp1, bp2, bp3;
			bool tmpb, tmpref;
			KuwashiiType typ;
			SrcTree *pst, *retcall = nullptr;
			if(ktype.id != BOOL_TYPEID) return false;
			bp1 = pjtr->bin.FalseJump(0);
			tystack.pop_back();
			ktype.id = VOID_TYPEID;
			tystack += WILDCARD_TYPEID;
			for(i++; iap[i] != QUESTION_TOKEN && iap[i] != COLON_TOKEN; i++){
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
			}
			if(iap[i] == QUESTION_TOKEN) return false;
			tmpb = REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID;
			if(tmpb){
				tmpref = false;
				bp3 = pjtr->bin.code.size();
				pjtr->bin.fillNop(6);
			}else{
				tmpref =
					TMPREF_TYPEID >= ktype.id && ktype.id >= TMPDYNLIST_TYPEID;
				if(tmpref) ktype.id += REF_TYPEID - TMPREF_TYPEID;
			}
			typ = ktype;
			bp2 = pjtr->bin.Jump(0);
			tystack.resize(tystack.size()-2);
			*(intptr_t *)(pjtr->bin.code.data()+bp1) += pjtr->bin.code.size();
			ktype.id = VOID_TYPEID;
			tystack += typ.id;
			for(i++; iap[i] != QUESTION_TOKEN && iap[i] != COLON_TOKEN; i++){
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
			}
			if(iap[i] == COLON_TOKEN) return false;
			if(tmpref && REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID){
				pjtr->bin.pushStackTopAddress();
				pjtr->bin.PluginCall((void*)RefCntUp);
			}else{
				tmpref =
					TMPREF_TYPEID >= ktype.id && ktype.id >= TMPDYNLIST_TYPEID;
				if(tmpref){
					ktype.id += REF_TYPEID - TMPREF_TYPEID;
					if(tmpb){
						pjtr->bin.stackTopAddressCallOverwrite(bp3, (void*)RefCntUp);
					}
				}
			}
			if(typ.id == REF_TYPEID || typ.id == LIST_TYPEID){
				if(ktype.id != REF_TYPEID && ktype.id != LIST_TYPEID){
					return false;
				}
				if(
					!stree.YuruiKataCheck(
						typ.kwsk, ktype.kwsk, *pjtr->filename, pjtr->gyousuu))
				{
					pjtr->root->stat->ss->emes.Clear();
					if(
						!stree.YuruiKataCheck(
							ktype.kwsk,
							typ.kwsk, *pjtr->filename, pjtr->gyousuu))
					{
						return false;
					}
					ktype = typ;
				}
			}else if(typ.id == FUNC_TYPEID || typ.id == METHOD_TYPEID){
				if(ktype.id != FUNC_TYPEID && ktype.id != METHOD_TYPEID){
					return false;
				}
				if(
					!stree.YuruiKataCheck(
						typ.kwsk, ktype.kwsk, *pjtr->filename, pjtr->gyousuu))
				{
					pjtr->root->stat->ss->emes.Clear();
					if(
						!stree.YuruiKataCheck(
							ktype.kwsk,
							typ.kwsk, *pjtr->filename, pjtr->gyousuu))
					{
						return false;
					}
					ktype = typ;
				}
			}else{
				if(!JidouCast(stree, tystack, typ.id, ktype.id)) return false;
				if(typ.id == DELEGATE_TYPEID){
					pst = typ.pstre;
					while(pst != ktype.pstre){
						if(pst == nullptr){
							typ.pstre = ktype.pstre;
							break;
						}
						pst = pst->parent;
					}
				}
				ktype = typ;
			}
			*(intptr_t *)(pjtr->bin.code.data()+bp2) += pjtr->bin.code.size();
			tystack.pop_back();
			if(tmpref) ktype.id += TMPREF_TYPEID - REF_TYPEID;
			return true;
		}
		MEMBER bool DainyuuTeisuu(
			const SrcTree& stree, KuwashiiType& ktype,
			const BinaryCode::AddressType at, const intptr_t ofs,
			const void* const p)
		{
			switch(ktype.id){
			case BYTE_TYPEID:
			case UBYTE_TYPEID:
			case BOOL_TYPEID:
				if(!pjtr->bin.MovHnsImm8(at, ofs, *(int8_t*)p)) return false;
				break;
			case SHORT_TYPEID:
			case USHORT_TYPEID:
			case CHAR_TYPEID:
				if(!pjtr->bin.MovHnsImm(at, ofs, *(int16_t*)p, true)){
					return false;
				}
				break;
			default:
				if(
					ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
					|| stree.stat->funclist.Get(ktype.id)->selftype
					!= ENUM_BLOCK)
				{
					return false;
				}
			case INT_TYPEID:
			case ADDRESS_TYPEID:
			case UINT_TYPEID:
			case FUNC_TYPEID:
			case FLOAT_TYPEID:
				if(!pjtr->bin.MovHnsImm(at, ofs, *(int32_t*)p, false)){
					return false;
				}
				break;
			case LONG_TYPEID:
			case ULONG_TYPEID:
			case DOUBLE_TYPEID:
				if(!pjtr->bin.MovHnsImm64(at, ofs, *(int64_t*)p)) return false;
				break;
			}
			return true;
		}
		MEMBER bool DainyuuReg(
			const SrcTree& stree, KuwashiiType& ktype,
			const BinaryCode::AddressType at, const intptr_t ofs)
		{
			switch(ktype.id){
			case BYTE_TYPEID:
			case UBYTE_TYPEID:
			case BOOL_TYPEID:
				if(!pjtr->bin.storeReg0_8(at, ofs)) return false;
				break;
			case SHORT_TYPEID:
			case USHORT_TYPEID:
			case CHAR_TYPEID:
				if(!pjtr->bin.storeReg0_16(at, ofs)) return false;
				break;
			default:
				if(ktype.id < 0 || ENDCLASS_TYPEID < ktype.id) return false;
				if(
					stree.stat->funclist.Get(ktype.id)->selftype
					== CLASS_BLOCK)
				{
					if(!stree.stat->funclist.Get(ktype.id)->IsOpen(stree)){
						pjtr->addErrMes(L("代入でコピーできないクラスです。"));
						return false;
					}
					if(
						!pjtr->bin.storeMem(
							at, ofs,
							stree.stat->funclist
								.Get(ktype.id)->GetMemberSize()))
					{
						return false;
					}
					break;
				}
				if(stree.stat->funclist.Get(ktype.id)->selftype != ENUM_BLOCK){
					return false;
				}
			case INT_TYPEID:
			case ADDRESS_TYPEID:
			case UINT_TYPEID:
			case FUNC_TYPEID:
			case METHOD_TYPEID:
				if(!pjtr->bin.storeReg0_32(at, ofs)) return false;
				break;
			case LONG_TYPEID:
			case ULONG_TYPEID:
				if(!pjtr->bin.MovHnsReg64(at, ofs)) return false;
				break;
			case FLOAT_TYPEID:
				if(!pjtr->bin.FstAdr(at, ofs, false)) return false;
				break;
			case DOUBLE_TYPEID:
				if(!pjtr->bin.FstAdr(at, ofs, true)) return false;
				break;
			}
			return true;
		}
		MEMBER bool DynDainyuuHantei(
			int32_t id, const KuwashiiType& rtype, int32_t& rid)
		{
			intptr_t idx;
			switch(id){
			case DYNREF_TYPEID:
				if(rtype.id == REF_TYPEID || rtype.id == LIST_TYPEID){
					SoushokuTobasi(rtype.kwsk.data(), idx=0);
					if(
						(
							rtype.kwsk[idx] != REF_TOKEN
							&& rtype.kwsk[idx] != LIST_TOKEN)
						|| IsRefReadOnlyToken((TokenKind)rtype.kwsk[idx + 1]))
					{
						return false;
					}
					idx++;
					rid = TokenToTypeId(rtype.kwsk.data(), idx);
					if(rid == REF_TYPEID || rid == LIST_TYPEID){
						pjtr->addErrMes(L("型エラーです。"));
						return false;
					}
				}else if(
					rtype.id != DYNREF_TYPEID && rtype.id != DYNLIST_TYPEID)
				{
					pjtr->addErrMes(L("型エラーです。"));
					return false;
				}
				break;
			case DYNLIST_TYPEID:
				if(rtype.id == LIST_TYPEID){
					SoushokuTobasi(rtype.kwsk.data(), idx=0);
					if(rtype.kwsk[idx] != LIST_TOKEN) return false;
					idx++;
					rid = TokenToTypeId(rtype.kwsk.data(), idx);
					if(rid == REF_TYPEID || rid == LIST_TYPEID){
						pjtr->addErrMes(L("型エラーです。"));
						return false;
					}
				}else if(rtype.id != DYNLIST_TYPEID){
					pjtr->addErrMes(L("型エラーです。"));
					return false;
				}
				break;
			default:
				return false;
			}
			return true;
		}
		MEMBER bool Dainyuu(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype,
			const BinaryCode::AddressType at, const intptr_t ofs)
		{
			int32_t did;
			KuwashiiType srct;
			bool tmpb;
			SrcTree* pst;
			SrcTree* retcall = nullptr;
			if(
				iap[i] == DAINYUU_TOKEN
				? oktype.id == VOID_TYPEID
				|| (ENDTHREAD_TYPEID <= oktype.id && oktype.id < 0) : (
					oktype.id <= ENDCLASS_TYPEID || (
						ANDDAINYUU_TOKEN <= iap[i]
						&& iap[i] <= ORDAINYUU_TOKEN
						? oktype.id == FLOAT_TYPEID
						|| oktype.id == DOUBLE_TYPEID
						: oktype.id == BOOL_TYPEID || (
							iap[i] == LSHIFTDAINYUU_TOKEN
							|| iap[i] == RSHIFTDAINYUU_TOKEN
							? oktype.id == FLOAT_TYPEID
							|| oktype.id == DOUBLE_TYPEID : (
								iap[i] == STARSTARDAINYUU_TOKEN
								&& oktype.id != FLOAT_TYPEID
								&& oktype.id != DOUBLE_TYPEID)))))
			{
				return false;
			}
			if(!pjtr->bin.tPush(ktype.id)) return false;
			srct.id = VOID_TYPEID;
			if(oktype.id == DELEGATE_TYPEID && at != BinaryCode::AT_LOCAL){
				return false;
			}
			bool dynmeth =
				tystack.size() > 0 && tystack.back() == SYSTEMUSED_TYPEID;
			if(iap[i] != DAINYUU_TOKEN){
				if(dynmeth) return false;
				if(!LoadHensuu(stree, oktype, at, ofs)) return false;
				srct.id = oktype.id;
				tystack += srct.id;
			}else if(iap[i+1] == COMMA_TOKEN){
				if(!pjtr->bin.setAdrreg(at, ofs)) return false;
				pjtr->bin.pushAdrreg();
				tystack += UNKNOWN_TYPEID;
				ktype = oktype;
				return true;
			}
			if(at == BinaryCode::AT_SANSHOU || dynmeth) pjtr->bin.pushAdrreg();
			tystack += oktype.id;
			srct.pstre = nullptr;
			for(
				i++;
				!(DAINYUU_TOKEN <= iap[i] && iap[i] <= TENDAINYUU_TOKEN); i++)
			{
				if(!MainSwitch(stree, iap, i, tystack, srct, retcall)){
					return false;
				}
			}
			tmpb = TMPREF_TYPEID >= srct.id && srct.id >= TMPDYNLIST_TYPEID;
			if(tmpb) srct.id += REF_TYPEID - TMPREF_TYPEID;
			did = REF_TYPEID;//フラグOFF
			switch(oktype.id){
			case REF_TYPEID:
			case LIST_TYPEID:
				if(
					(srct.id != REF_TYPEID && srct.id != LIST_TYPEID)
					|| !stree.YuruiKataCheck(
						srct.kwsk,
						oktype.kwsk, *pjtr->filename, pjtr->gyousuu))
				{
					return false;
				}
				break;
			case DYNREF_TYPEID:
			case DYNLIST_TYPEID:
				if (!DynDainyuuHantei(oktype.id, srct, did)) return false;
				break;
			case FUNC_TYPEID:
			case METHOD_TYPEID:
				if(
					(srct.id != FUNC_TYPEID && srct.id != METHOD_TYPEID)
					|| !stree.YuruiKataCheck(
						srct.kwsk,
						oktype.kwsk, *pjtr->filename, pjtr->gyousuu))
				{
					return false;
				}
				break;
			case DELEGATE_TYPEID:
				if(
					srct.id != DELEGATE_TYPEID
					|| !stree.YuruiKataCheck(
						srct.kwsk,
						oktype.kwsk, *pjtr->filename, pjtr->gyousuu))
				{
					return false;
				}
				pst = oktype.pstre;
				while(pst != srct.pstre){
					if(pst == nullptr){
						pjtr->addErrMes(
							L("子ブロックで宣言された無名関数は親ブロックの変数に代入できません。"));
						return false;
					}
					pst = pst->parent;
				}
				break;
			default:
				if(!JidouCast(stree, tystack, oktype.id, srct.id)){
					return false;
				}
				break;
			}
			ktype = oktype;
			ktype.pstre = srct.pstre;
			switch(iap[i]){
			case PULUSDAINYUU_TOKEN:
			case MINUSDAINYUU_TOKEN:
			case KAKERUDAINYUU_TOKEN:
			case WARUDAINYUU_TOKEN:
			case AMARIDAINYUU_TOKEN:
			case ANDDAINYUU_TOKEN:
			case XORDAINYUU_TOKEN:
			case ORDAINYUU_TOKEN:
			case LSHIFTDAINYUU_TOKEN:
			case RSHIFTDAINYUU_TOKEN:
			case STARSTARDAINYUU_TOKEN:
				if(ktype.pstre != (SrcTree*)~(intptr_t)0){
					if(!StackEnzan(stree, tystack, ktype, (TokenKind)iap[i])){
						return false;
					}
				}else{
					ktype.pstre = nullptr;
				}
			case DAINYUU_TOKEN:
				if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
					if(at == BinaryCode::AT_SANSHOU){
						pjtr->bin.setAdrregStack(Aliszof<Reference>());
					}
					if(tmpb) pjtr->bin.dup(sizeof(Reference));
					if(!RefCountDown(stree, at, ofs, ktype.kwsk, true)){
						return false;
					}
					if(tmpb && !StackRefCountDown(stree, srct)) return false;
					if(at == BinaryCode::AT_SANSHOU || dynmeth){
						pjtr->bin.popToAdrreg();
					}
				}else if(
					ktype.id == DYNREF_TYPEID || ktype.id == DYNLIST_TYPEID)
				{
					if(did != REF_TYPEID){
						if(at == BinaryCode::AT_SANSHOU){
							pjtr->bin.setAdrregStack(Aliszof<Reference>());
						}
						if(tmpb) pjtr->bin.dup(sizeof(Reference));
						pjtr->bin.PushCadr(0);
						if(!pjtr->bin.setAdrreg(at, ofs)) return false;
						pjtr->bin.pushAdrreg();
						pjtr->bin.PushImm(did);
						pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
						pjtr->bin.PluginCall((void*)DynRefCopy);
						if(tmpb && !StackRefCountDown(stree, srct)){
							return false;
						}
						if(at == BinaryCode::AT_SANSHOU || dynmeth){
							pjtr->bin.popToAdrreg();
						}
					}else{
						if(at == BinaryCode::AT_SANSHOU){
							pjtr->bin.setAdrregStack(Aliszof<DynamicRef>());
						}
						if(tmpb) pjtr->bin.dup(sizeof(DynamicRef));
						if(!RefCountDown(stree, at, ofs, ktype.kwsk, true)){
							return false;
						}
						if(tmpb && !StackRefCountDown(stree, srct)){
							return false;
						}
						if(at == BinaryCode::AT_SANSHOU || dynmeth){
							pjtr->bin.popToAdrreg();
						}
					}
				}else if(ktype.id == DELEGATE_TYPEID){
					if(at == BinaryCode::AT_SANSHOU){
						pjtr->bin.setAdrregStack(sizeof(Delegate));
					}
					pjtr->bin.popToMem(at, ofs, sizeof(intptr_t)*3);
					if(at == BinaryCode::AT_SANSHOU || dynmeth){
						pjtr->bin.removeStackTop(sizeof(intptr_t));
					}
				}else{
					if(at == BinaryCode::AT_SANSHOU || dynmeth){
						pjtr->bin.popToAdrreg();
					}
					if(ktype.pstre != (SrcTree*)~(intptr_t)0){
						if(!DainyuuReg(stree, ktype, at, ofs)) return false;
					}else{
						if(!DainyuuTeisuu(stree, ktype, at, ofs, &castvar)){
							return false;
						}
					}
				}
				if(iap[i+1] == SEMICOLON_TOKEN || iap[i+1] == DOLLAR_TOKEN){
					tystack.resize(tystack.size()-2);
					if(ktype.id == FLOAT_TYPEID || ktype.id == DOUBLE_TYPEID){
						KTDrop(stree, ktype);
					}else{
						ktype.id = VOID_TYPEID;
					}
					i++;
				}else if(
					iap[i+1] == NULL_TOKEN && iap[i+2] == TENDAINYUU_TOKEN)
				{
					tystack.resize(tystack.size()-2);
					if(ktype.id == FLOAT_TYPEID || ktype.id == DOUBLE_TYPEID){
						KTDrop(stree, ktype);
					}else{
						ktype.id = VOID_TYPEID;
					}
					i += 2;
					if(
						!Append(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					iap[i+1] == NULL_TOKEN && (
						DAINYUU_TOKEN <= iap[i+2]
						&& iap[i+2] <= STARSTARDAINYUU_TOKEN))
				{
					tystack.resize(tystack.size()-2);
					if(ktype.id == FLOAT_TYPEID || ktype.id == DOUBLE_TYPEID){
						KTDrop(stree, ktype);
					}else{
						ktype.id = VOID_TYPEID;
					}
					i += 2;
					if(
						!Dainyuu(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					(iap[i+1] == NULL_TOKEN
					&& (iap[i+2] == PLSPLS_TOKEN || iap[i+2] == MNSMNS_TOKEN))
					|| iap[i+1] == PLSPLS_TOKEN || iap[i+1] == MNSMNS_TOKEN)
				{
					tystack.resize(tystack.size()-2);
					ktype.id = VOID_TYPEID;
					i++;
					if(
						!IncDec(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					(iap[i+1] == NULL_TOKEN && iap[i+2] == TOGGLE_TOKEN)
					|| iap[i+1] == TOGGLE_TOKEN)
				{
					tystack.resize(tystack.size()-2);
					ktype.id = VOID_TYPEID;
					i++;
					if(
						!Toggle(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else{
					if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
						if(!pjtr->bin.PushHnsRef(at, ofs, false)) return false;
					}else if(
						ktype.id == DYNREF_TYPEID
						|| ktype.id == DYNLIST_TYPEID)
					{
						if(!pjtr->bin.PushHnsRef(at, ofs, true)) return false;
					}else if(ktype.id == DELEGATE_TYPEID){
						if(!pjtr->bin.PushHnsDlg(at, ofs)) return false;
					}else if(ktype.pstre == (SrcTree*)~(intptr_t)0){
						if(!Teisuu(stree, ktype, (int32_t*)&castvar)){
							return false;
						}
					}
					tystack.pop_back();
				}
				break;
			default:
				return false;
			}
			return true;
		}
		MEMBER bool AppendSub(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype, const BinaryCode::AddressType at,
			const intptr_t ofs, const bool tmpref, const bool appref)
		{
			if(appref){
				if(at == BinaryCode::AT_SANSHOU){
					pjtr->bin.setAdrregStack(Aliszof<Reference>());
				}
				if(tmpref) pjtr->bin.dup(sizeof(Reference));
				if(!pjtr->bin.setAdrreg(at, ofs)) return false;
				pjtr->bin.pushAdrreg();
				intptr_t idx = 0;
				switch(TokenToTypeId(oktype.kwsk.data(), idx)){
				case REF_TYPEID:
				case LIST_TYPEID:
					switch(TokenToTypeId(oktype.kwsk.data(), idx)){
					case REF_TYPEID:
					case LIST_TYPEID:
						pjtr->bin.PluginCall((void*)ListAppendRefRef);
						break;
					case DYNREF_TYPEID:
					case DYNLIST_TYPEID:
						pjtr->bin.PluginCall((void*)ListAppendRefDynref);
						break;
					default:
						pjtr->bin.PluginCall((void*)ListAppendRef);
						break;
					}
					break;
				default:
					return false;
				}
				if(tmpref && !StackRefCountDown(stree, ktype)) return false;
				if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
			}else{
				if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
					if(at == BinaryCode::AT_SANSHOU){
						pjtr->bin.setAdrregStack(Aliszof<Reference>());
					}
					if(tmpref) pjtr->bin.dup(sizeof(Reference));
					if(!pjtr->bin.setAdrreg(at, ofs)) return false;
					pjtr->bin.pushAdrreg();
					pjtr->bin.PluginCall((void*)ListAppendOneRef);
					if(tmpref && !StackRefCountDown(stree, ktype)){
						return false;
					}
					if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
				}else if(
					ktype.id == DYNREF_TYPEID || ktype.id == DYNLIST_TYPEID)
				{
					if(at == BinaryCode::AT_SANSHOU){
						pjtr->bin.setAdrregStack(Aliszof<DynamicRef>());
					}
					if(tmpref) pjtr->bin.dup(sizeof(DynamicRef));
					if(!pjtr->bin.setAdrreg(at, ofs)) return false;
					pjtr->bin.pushAdrreg();
					pjtr->bin.PluginCall((void*)ListAppendOneDynref);
					if(tmpref && !StackRefCountDown(stree, ktype)){
						return false;
					}
					if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
				}else if(
					0 <= ktype.id && ktype.id <= ENDCLASS_TYPEID
					&& stree.stat->funclist.Get(ktype.id)->selftype
					== CLASS_BLOCK)
				{
					if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
					if(!pjtr->bin.tPush(ktype.id)) return false;
					if(
						stree.stat->funclist.Get(ktype.id)->GetMemberSize()
						> 0)
					{
						pjtr->bin.PushImm(
							stree.stat->funclist
								.Get(ktype.id)->GetMemberSize());
						if(!pjtr->bin.setAdrreg(at, ofs)) return false;
						pjtr->bin.pushAdrreg();
						pjtr->bin.PluginCall((void*)ListAppend);
					}
				}else{
					if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
					if(!pjtr->bin.tPush(ktype.id)) return false;
					if(!pjtr->bin.setAdrreg(at, ofs)) return false;
					pjtr->bin.pushAdrreg();
					switch(stree.TypeIdToSize(ktype.id)){
					case 1:
						pjtr->bin.PluginCall((void*)ListAppend8);
						break;
					case 2:
						pjtr->bin.PluginCall((void*)ListAppend16);
						break;
					case 4:
						pjtr->bin.PluginCall((void*)ListAppend32);
						break;
					case 8:
						pjtr->bin.PluginCall((void*)ListAppend64);
						break;
					default:
						return false;
					}
				}
			}
			if(iap[i+1] == SEMICOLON_TOKEN || iap[i+1] == DOLLAR_TOKEN){
				tystack.pop_back();
				ktype.id = VOID_TYPEID;
				i += 1;
			}else if(iap[i+1] == NULL_TOKEN && iap[i+2] == TENDAINYUU_TOKEN){
				tystack.pop_back();
				ktype.id = VOID_TYPEID;
				i += 2;
				if(!Append(stree, iap, i, tystack, ktype, oktype, at, ofs)){
					return false;
				}
			}else if(iap[i+1] == NULL_TOKEN && iap[i+2] == DAINYUU_TOKEN){
				tystack.pop_back();
				ktype.id = VOID_TYPEID;
				i += 2;
				if(!Dainyuu(stree, iap, i, tystack, ktype, oktype, at, ofs)){
					return false;
				}
			}else{
				if(!pjtr->bin.PushHnsRef(at, ofs, false)) return false;
				ktype = oktype;
				tystack.back() = ktype.id;
			}
			return true;
		}
		MEMBER bool Append(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype,
			const BinaryCode::AddressType at, const intptr_t ofs)
		{
			int32_t typ;
			intptr_t idx;
			bool tmpb;
			SrcTree* retcall = nullptr;
			if(oktype.id != LIST_TYPEID) return false;
			if(at == BinaryCode::AT_SANSHOU) pjtr->bin.pushAdrreg();
			for(i++; iap[i] != TENDAINYUU_TOKEN; i++){
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
			}
			SoushokuTobasi(oktype.kwsk.data(), idx=0);
			if(oktype.kwsk[idx] != LIST_TOKEN) return false;
			idx++;
			if(
				(typ = TokenToTypeId(oktype.kwsk.data(), idx))
				== UNKNOWN_TYPEID)
			{
				return false;
			}
			tmpb = TMPREF_TYPEID >= ktype.id && ktype.id >= TMPDYNLIST_TYPEID;
			if(tmpb) ktype.id += REF_TYPEID - TMPREF_TYPEID;
			bool tmpar = REF_TYPEID >= typ && typ >= DYNLIST_TYPEID;
			if(
				!tmpar && (
					typ < 0 || (
						typ <= ENDCLASS_TYPEID
						&& stree.stat->funclist.Get(typ)->selftype
						== CLASS_BLOCK
						&& !stree.stat->funclist.Get(typ)->IsOpen(stree))))
			{
				pjtr->addErrMes(L("代入でコピーできないクラスです。"));
				return false;
			}
			if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
				if(tmpar){
					SoushokuTobasi(oktype.kwsk.data(), idx=0);
					idx++;
					SoushokuTobasi(oktype.kwsk.data(), idx);
					std::basic_string<intptr_t> ktmp;
					ktmp.append(
						oktype.kwsk.data()+idx, oktype.kwsk.size()-idx);
					if(
						stree.YuruiKataCheck(
							ktype.kwsk, ktmp, *pjtr->filename, pjtr->gyousuu))
					{
						tmpar = false;
					}else{
						pjtr->root->stat->ss->emes.Clear();
						SoushokuTobasi(ktype.kwsk.data(), idx=0);
						idx++;
						SoushokuTobasi(ktype.kwsk.data(), idx);
						std::basic_string<intptr_t> ktmp2;
						ktmp2.append(
							ktype.kwsk.data()+idx, ktype.kwsk.size()-idx);
						if(
							!stree.YuruiKataCheck(
								ktmp2, ktmp, *pjtr->filename, pjtr->gyousuu))
						{
							return false;
						}
					}
				}else{
					if(
						!stree.YuruiKataCheck(
							oktype.kwsk,
							ktype.kwsk, *pjtr->filename, pjtr->gyousuu))
					{
						return false;
					}
					tmpar = true;
				}
			}else{
				if(!JidouCast(stree, tystack, typ, ktype.id)) return false;
				ktype.id = typ;
			}
			return
				AppendSub(
					stree, iap, i, tystack,
					ktype, oktype, at, ofs, tmpb, tmpar);
		}
		MEMBER bool IncDecSub(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype, const BinaryCode::AddressType at,
			const intptr_t ofs, bool dec, bool mae)
		{
			if(
				!mae || iap[i+1] == SEMICOLON_TOKEN || iap[i+1] == DOLLAR_TOKEN
				|| (
					iap[i+1] == NULL_TOKEN && (
						DAINYUU_TOKEN <= iap[i+2]
						&& iap[i+2] <= STARSTARDAINYUU_TOKEN))
				|| (
					iap[i+1] == NULL_TOKEN
					&& (iap[i+2] == PLSPLS_TOKEN || iap[i+2] == MNSMNS_TOKEN))
				|| iap[i+1] == PLSPLS_TOKEN || iap[i+1] == MNSMNS_TOKEN)
			{
				switch(oktype.id){
				case LONG_TYPEID:
				case ULONG_TYPEID:
					if(!pjtr->bin.loadReg0_64(at, ofs)) return false;
					(dec ? pjtr->bin.SubImm64(1) : pjtr->bin.AddImm64(1));
					if(!pjtr->bin.MovHnsReg64(at, ofs)) return false;
					break;
				case ADDRESS_TYPEID:
				case INT_TYPEID:
				case UINT_TYPEID:
					if(!pjtr->bin.loadReg0_32(at, ofs)) return false;
					(dec ? pjtr->bin.constSub(1) : pjtr->bin.constAdd(1));
					if(!pjtr->bin.storeReg0_32(at, ofs)) return false;
					break;
				case SHORT_TYPEID:
				case USHORT_TYPEID:
				case CHAR_TYPEID:
					if(!pjtr->bin.loadReg0_16(at, ofs)) return false;
					(dec ? pjtr->bin.constSub(1) : pjtr->bin.constAdd(1));
					if(!pjtr->bin.storeReg0_16(at, ofs)) return false;
					break;
				case BYTE_TYPEID:
				case UBYTE_TYPEID:
					if(!pjtr->bin.loadReg0_8(at, ofs)) return false;
					(dec ? pjtr->bin.constSub(1) : pjtr->bin.constAdd(1));
					if(!pjtr->bin.storeReg0_8(at, ofs)) return false;
					break;
				}
				if(
					iap[i+1] == NULL_TOKEN && (
						DAINYUU_TOKEN <= iap[i+2]
						&& iap[i+2] <= STARSTARDAINYUU_TOKEN))
				{
					i += 2;
					if(
						!Dainyuu(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					(
						iap[i+1] == NULL_TOKEN && (
							iap[i+2] == PLSPLS_TOKEN
							|| iap[i+2] == MNSMNS_TOKEN))
					|| iap[i+1] == PLSPLS_TOKEN || iap[i+1] == MNSMNS_TOKEN)
				{
					i++;
					if(
						!IncDec(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					(iap[i+1] == NULL_TOKEN && iap[i+2] == TOGGLE_TOKEN)
					|| iap[i+1] == TOGGLE_TOKEN)
				{
					i++;
					if(
						!Toggle(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					iap[i+1] != SEMICOLON_TOKEN && iap[i+1] != DOLLAR_TOKEN)
				{
					ktype = oktype;
					tystack += ktype.id;
				}else{
					ktype.id = VOID_TYPEID;
					tystack += ktype.id;
				}
			}else{
				switch(oktype.id){
				case LONG_TYPEID:
				case ULONG_TYPEID:
					if(
						!(
							dec ? pjtr->bin.bDec64(at, ofs)
							: pjtr->bin.bInc64(at, ofs))) return false;
					break;
				case ADDRESS_TYPEID:
				case INT_TYPEID:
				case UINT_TYPEID:
					if(
						!(
							dec ? pjtr->bin.bDec32(at, ofs)
							: pjtr->bin.bInc32(at, ofs))) return false;
					break;
				case SHORT_TYPEID:
				case USHORT_TYPEID:
				case CHAR_TYPEID:
					if(
						!(
							dec ? pjtr->bin.bDec16(at, ofs)
							: pjtr->bin.bInc16(at, ofs))) return false;
					break;
				case BYTE_TYPEID:
				case UBYTE_TYPEID:
					if(
						!(
							dec ? pjtr->bin.bDec8(at, ofs)
							: pjtr->bin.bInc8(at, ofs))) return false;
					break;
				}
				ktype = oktype;
				tystack += ktype.id;
			}
			return true;
		}
		MEMBER bool IncDec(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype,
			const BinaryCode::AddressType at, const intptr_t ofs)
		{
			if(oktype.id < ADDRESS_TYPEID || BYTE_TYPEID < oktype.id){
				return false;
			}
			if(!pjtr->bin.tPush(ktype.id)) return false;
			ktype.id = VOID_TYPEID;
			if(iap[i] == NULL_TOKEN){
				i++;
				switch(iap[i]){
				case PLSPLS_TOKEN:
					if(
						!IncDecSub(
							stree, iap, i, tystack,
							ktype, oktype, at, ofs, false, true))
					{
						return false;
					}
					break;
				case MNSMNS_TOKEN:
					if(
						!IncDecSub(
							stree, iap, i, tystack,
							ktype, oktype, at, ofs, true, true))
					{
						return false;
					}
					break;
				default:
					return false;
				}
			}else{
				switch(iap[i]){
				case PLSPLS_TOKEN:
					if(
						!IncDecSub(
							stree, iap, i, tystack,
							ktype, oktype, at, ofs, false, false))
					{
						return false;
					}
					break;
				case MNSMNS_TOKEN:
					if(
						!IncDecSub(
							stree, iap, i, tystack,
							ktype, oktype, at, ofs, true, false))
					{
						return false;
					}
					break;
				default:
					return false;
				}
			}
			return true;
		}
		MEMBER bool ToggleSub(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype,
			const BinaryCode::AddressType at, const intptr_t ofs, bool mae)
		{
			if(
				!mae || iap[i+1] == SEMICOLON_TOKEN || iap[i+1] == DOLLAR_TOKEN
				|| (
					iap[i+1] == NULL_TOKEN && (
						DAINYUU_TOKEN <= iap[i+2]
						&& iap[i+2] <= STARSTARDAINYUU_TOKEN))
				|| (iap[i+1] == NULL_TOKEN && iap[i+2] == TOGGLE_TOKEN)
				|| iap[i+1] == TOGGLE_TOKEN)
			{
				if(!pjtr->bin.loadReg0_8(at, ofs)) return false;
				pjtr->bin.constXor(1);
				if(!pjtr->bin.storeReg0_8(at, ofs)) return false;
				if(
					iap[i+1] == NULL_TOKEN && (
						DAINYUU_TOKEN <= iap[i+2]
						&& iap[i+2] <= STARSTARDAINYUU_TOKEN))
				{
					i += 2;
					if(
						!Dainyuu(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					(iap[i+1] == NULL_TOKEN && iap[i+2] == TOGGLE_TOKEN)
					|| iap[i+1] == TOGGLE_TOKEN)
				{
					i++;
					if(
						!Toggle(
							stree, iap, i, tystack, ktype, oktype, at, ofs))
					{
						return false;
					}
				}else if(
					iap[i+1] != SEMICOLON_TOKEN && iap[i+1] != DOLLAR_TOKEN)
				{
					ktype = oktype;
					tystack += ktype.id;
				}else{
					ktype.id = VOID_TYPEID;
					tystack += ktype.id;
				}
			}else{
				if(!pjtr->bin.bToggle(at, ofs)) return false;
				ktype = oktype;
				tystack += ktype.id;
			}
			return true;
		}
		MEMBER bool Toggle(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const KuwashiiType& oktype,
			const BinaryCode::AddressType at, const intptr_t ofs)
		{
			if(oktype.id != BOOL_TYPEID) return false;
			if(!pjtr->bin.tPush(ktype.id)) return false;
			ktype.id = VOID_TYPEID;
			if(iap[i] == NULL_TOKEN){
				i++;
				if(
					!ToggleSub(
						stree, iap, i, tystack, ktype, oktype, at, ofs, true))
				{
					return false;
				}
			}else{
				if(
					!ToggleSub(
						stree, iap, i, tystack, ktype, oktype, at, ofs, false))
				{
					return false;
				}
			}
			return true;
		}
		MEMBER bool LoadHensuu(
			const SrcTree &stree, const KuwashiiType &ktype,
			const BinaryCode::AddressType at, const intptr_t ofs)
		{
			switch(ktype.id){
			case BYTE_TYPEID:
			case UBYTE_TYPEID:
			case BOOL_TYPEID:
				if(!pjtr->bin.loadReg0_8(at, ofs)) return false;
				break;
			case SHORT_TYPEID:
			case USHORT_TYPEID:
			case CHAR_TYPEID:
				if(!pjtr->bin.loadReg0_16(at, ofs)) return false;
				break;
			case ADDRESS_TYPEID:
				if(!pjtr->bin.loadReg0(at, ofs)) return false;
				break;
			default:
				if(
					ktype.id < 0 || ENDCLASS_TYPEID < ktype.id
					|| stree.stat->funclist.Get(ktype.id)->selftype
					!= ENUM_BLOCK)
				{
					return false;
				}
			case INT_TYPEID:
			case UINT_TYPEID:
			case FUNC_TYPEID:
			case METHOD_TYPEID:
				if(!pjtr->bin.loadReg0_32(at, ofs)) return false;
				break;
			case LONG_TYPEID:
			case ULONG_TYPEID:
				if(!pjtr->bin.loadReg0_64(at, ofs)) return false;
				break;
			case REF_TYPEID:
			case LIST_TYPEID:
				if(!pjtr->bin.PushHnsRef(at, ofs, false)) return false;
				break;
			case DELEGATE_TYPEID:
				if(!pjtr->bin.PushHnsDlg(at, ofs)) return false;
				break;
			case DYNREF_TYPEID:
			case DYNLIST_TYPEID:
				if(!pjtr->bin.PushHnsRef(at, ofs, true)) return false;
				break;
			case FLOAT_TYPEID:
				if(!pjtr->bin.FldAdr(at, ofs, false)) return false;
				break;
			case DOUBLE_TYPEID:
				if(!pjtr->bin.FldAdr(at, ofs, true)) return false;
				break;
			}
			return true;
		}
		MEMBER bool RefCountDown(
			SrcTree& stree, const BinaryCode::AddressType at,
			const intptr_t ofs, const std::basic_string<intptr_t>& hes,
			const bool copy)
		{
			SrcTree* pst;
			int32_t fi;
			intptr_t idx, bkp, tmp;
			SoushokuTobasi(hes.data(), idx=0);
			if(hes[idx] != REF_TOKEN && hes[idx] != LIST_TOKEN) return false;
			if(hes[idx+1] == NULL_TOKEN){
				pjtr->bin.PushCadr(0);
				if(!pjtr->bin.setAdrreg(at, ofs)) return false;
				pjtr->bin.pushAdrreg();
				if(copy){
					pjtr->bin.pushStack(
						sizeof(intptr_t)*2+Aliszof<Reference>());
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)DynRefCopy);
					pjtr->bin.removeStackTop(sizeof(intptr_t));
				}else{
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)DynRefDelete);
				}
				return true;
			}
			idx++;
			if (IsRefSoushokuToken((TokenKind)hes[idx])) idx++;
			if(hes[idx] == AND_TOKEN){
				pst = stree.stat->funclist.Get((int32_t)hes[idx+1]);
			}else{
				pst = nullptr;
			}
			bool circ = isCircAblRef(stree, hes.data()+idx, tmp) >= -1;
			if(copy){
				pjtr->bin.pushStackTopAddress();
				if(!pjtr->bin.setTmpregAdr(at, ofs)) return false;
				pjtr->bin.pushTmpreg();
				if(circ){
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)CircRefCopy);
				}else{
					pjtr->bin.PluginCall((void*)RefCopy);
				}
				pjtr->bin.setAdrregStackTopAddress();
			}else{
				if(!pjtr->bin.setAdrreg(at, ofs)) return false;
				pjtr->bin.pushAdrreg();
				if(circ){
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)CircRefCntDwn);
				}else{
					pjtr->bin.PluginCall((void*)RefCntDwn);
				}
			}
			bkp = pjtr->bin.FalseJump(0);
			if(hes[idx] == REF_TOKEN || hes[idx] == LIST_TOKEN){
				idx++;
				tmp = 0;
				while(
					hes[idx+tmp] == REF_TOKEN || hes[idx+tmp] == LIST_TOKEN
					|| (
						IsRefSoushokuToken((TokenKind)hes[idx + tmp])
						&& (idx++, tmp--, true)))
				{
					tmp++;
				}
				idx += tmp;
				pjtr->bin.pushAdrreg();
				switch(hes[idx]){
				case NULL_TOKEN:
					pjtr->bin.PushImm(tmp);
					pjtr->bin.PushCadr(0);
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)RefDynRefDel);
					break;
				case THREAD_TOKEN:
					pjtr->bin.PushImm(tmp);
					pjtr->bin.PluginCall((void*)RefRefThreadWait);
					break;
				case AND_TOKEN:
					pst = stree.stat->funclist.Get((int32_t)hes[idx+1]);
					if(
						(fi = pst->GetFuncId(L("break"), false)) >= 0
						&& stree.stat->funclist.Get(fi)->returnshita >= 0)
					{
						pjtr->bin.PushImm(tmp);
						pjtr->bin.PushImm(pst->GetMemberSize());
						auto fn = stree.stat->funclist.Get(fi);
						pjtr->bin.PushFadr(fn->byteadress, fn->backpatch);
						if(pst->IsJunkanAble()){
							pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
							pjtr->bin.PluginCall((void*)RefCircRefClassDel);
						}else{
							pjtr->bin.PluginCall((void*)RefRefClassDel);
						}
						break;
					}
					pst = nullptr;
				default:
					pjtr->bin.PushImm(tmp);
					pjtr->bin.PluginCall((void*)RefRefDel);
					break;
				}
			}else if(hes[idx] == THREAD_TOKEN){
				pjtr->bin.pushAdrreg();
				pjtr->bin.PluginCall((void*)RefThreadWait);
			}else if(
				pst != nullptr
				&& (fi = pst->GetFuncId(L("break"), false)) >= 0
				&& stree.stat->funclist.Get(fi)->returnshita >= 0)
			{
				pjtr->bin.pushAdrreg();
				pjtr->bin.PushImm(pst->GetMemberSize());
				auto fn = stree.stat->funclist.Get(fi);
				pjtr->bin.PushFadr(fn->byteadress, fn->backpatch);
				pjtr->bin.PluginCall((void*)RefClassDel);
			}
			pjtr->bin.pushAdrreg();
			pjtr->bin.PluginCall((void*)RefDel);
			*(intptr_t*)(pjtr->bin.code.data()+bkp) += pjtr->bin.code.size();
			if(copy){
				pjtr->bin.setAdrregTmpreg();
				pjtr->bin.removeStackTop(sizeof(Reference));
			}
			return true;
		}
		MEMBER intptr_t isCircAblRef(
			SrcTree& stree, const intptr_t* const refto, intptr_t& nest)
		{
			intptr_t ii, rpid = -2;
			for(ii = 0; ; ii++){
				if(refto[ii] == REF_TOKEN || refto[ii] == LIST_TOKEN){
					nest++;
				}else if(!IsSoushokuToken((TokenKind)refto[ii])){
					if(refto[ii] == NULL_TOKEN){
						rpid = -1;
					}else if(refto[ii] == AND_TOKEN){
						SrcTree* ps =
							stree.stat->funclist.Get((int32_t)refto[ii+1]);
						if(ps->IsJunkanAble()) rpid = ps->sonota.junkanid;
					}
					break;
				}
			}
			return rpid;
		}
		MEMBER bool RefNew(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const BinaryCode::AddressType at, const intptr_t ofs,
			bool list, const std::basic_string<intptr_t>& hes)
		{
			SrcTree* pst;
			SrcTree* retcall = nullptr;
			int32_t fi;
			intptr_t idx;
			std::basic_string<intptr_t> type;
			SoushokuTobasi(hes.data(), idx=0);
			if(hes[idx] != REF_TOKEN && hes[idx] != LIST_TOKEN){
				return false;
			}
			idx++;
			if (IsRefSoushokuToken((TokenKind)hes[idx])) idx++;
			if(hes[idx] == NULL_TOKEN){
				return false;
			}else if(hes[idx] == AND_TOKEN){
				pst = stree.stat->funclist.Get((int32_t)hes[idx+1]);
			}else{
				pst = nullptr;
			}
			if(!pjtr->bin.tPush(ktype.id)) return false;
			if(at == BinaryCode::AT_SANSHOU) pjtr->bin.pushAdrreg();
			tystack += ADDRESS_TYPEID;
			ktype.id = VOID_TYPEID;
			do{
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
				i++;
			}while(iap[i] != SHOUKAKKOCLOSE_TOKEN);
			if(!JidouCast(stree, tystack, ADDRESS_TYPEID, ktype.id)){
				return false;
			}
			if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
			(void)pjtr->bin.tPush(ktype.id);
			if(!RefCountDown(stree, at, ofs, hes, false)) return false;
			(void)pjtr->bin.tPop(ktype.id);
			tystack.pop_back();
			ktype.id = ADDRESS_TYPEID;
			if(hes[idx] == REF_TOKEN || hes[idx] == LIST_TOKEN){
				pjtr->bin.PushImm(0);
				if(hes[idx+1] == NULL_TOKEN){
					pjtr->bin.PushImm((intptr_t)refdynnullclearcb);
				}else{
					pjtr->bin.PushImm((intptr_t)refzeroclearcb);
				}
			}else if(hes[idx] == THREAD_TOKEN){
				pjtr->bin.PushImm(0);
				pjtr->bin.PushImm((intptr_t)refzeroclearcb);
			}else if(
				pst != nullptr && (fi = pst->GetFuncId(L("default"), false)) >= 0
					&& stree.stat->funclist.Get(fi)->returnshita >= 0)
			{
				auto fn = stree.stat->funclist.Get(fi);
				pjtr->bin.PushFadr(fn->byteadress, fn->backpatch);
				pjtr->bin.PushImm((intptr_t)RefClassNewCB);
			}else{
				pjtr->bin.PushImm(0);
				pjtr->bin.PushImm(0);
			}
			if(pst != nullptr){
				pjtr->bin.PushImm(pst->GetMemberSize());
			}else{
				type.clear();
				type.append(hes.data()+idx, hes.size()-idx);
				pjtr->bin.PushImm(stree.GetTypeSize(type));
			}
			pjtr->bin.push();
			if(!pjtr->bin.setAdrreg(at, ofs)) return false;
			pjtr->bin.pushAdrreg();
			intptr_t rpid, nest = 0;
			rpid = isCircAblRef(stree, hes.data()+idx, nest);
			if(rpid >= -1){
				pjtr->bin.PushImm(rpid);
				pjtr->bin.PushImm(nest);
				pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
				if(list){
					pjtr->bin.PluginCall((void*)CircListNew);
				}else{
					pjtr->bin.PluginCall((void*)CircRefeNew);
				}
			}else{
				if(list){
					pjtr->bin.PluginCall((void*)ListNew);
				}else{
					pjtr->bin.PluginCall((void*)RefeNew);
				}
			}
			ktype.id = VOID_TYPEID;
			tystack.back() = ktype.id;
			return true;
		}
		MEMBER bool RefIdxNew(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const BinaryCode::AddressType at, const intptr_t ofs,
			const std::basic_string<intptr_t>& hes)
		{
			SrcTree* pst;
			SrcTree* retcall = nullptr;
			int32_t fi;
			intptr_t idx;
			std::basic_string<intptr_t> type;
			SoushokuTobasi(hes.data(), idx=0);
			if(hes[idx] != LIST_TOKEN) return false;
			idx++;
			if (IsRefSoushokuToken((TokenKind)hes[idx])) idx++;
			if(hes[idx] == AND_TOKEN){
				pst = stree.stat->funclist.Get((int32_t)hes[idx+1]);
			}else{
				pst = nullptr;
			}
			if(!pjtr->bin.tPush(ktype.id)) return false;
			if(at == BinaryCode::AT_SANSHOU) pjtr->bin.pushAdrreg();
			tystack += ADDRESS_TYPEID;
			ktype.id = VOID_TYPEID;
			do{
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
				i++;
			}while(iap[i] != DAIKAKKOCLOSE_TOKEN);
			if(!JidouCast(stree, tystack, ADDRESS_TYPEID, ktype.id)){
				return false;
			}
			tystack.pop_back();
			if(at == BinaryCode::AT_SANSHOU) pjtr->bin.popToAdrreg();
			ktype.id = ADDRESS_TYPEID;
			if(pst != nullptr){
				pjtr->bin.PushImm(pst->GetMemberSize());
			}else{
				type.clear();
				type.append(hes.data()+idx, hes.size()-idx);
				pjtr->bin.PushImm(stree.GetTypeSize(type));
			}
			pjtr->bin.push();
			if(!pjtr->bin.setAdrreg(at, ofs)) return false;
			pjtr->bin.pushAdrreg();
			switch(hes[idx]){
			case NULL_TOKEN:
				return false;
			case REF_TOKEN:
			case LIST_TOKEN:
				if(hes[idx+1] == NULL_TOKEN){
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)ListIdxNewDynRefInit);
					break;
				}else{
					intptr_t rpid, nest = 1;
					rpid = isCircAblRef(stree, hes.data()+idx+1, nest);
					if(rpid >= -1){
						pjtr->bin.PushImm(rpid);
						pjtr->bin.PushImm(nest);
						pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
						pjtr->bin.PluginCall((void*)CircListIdxNewZeroClear);
						break;
					}
				}
			case THREAD_TOKEN:
				pjtr->bin.PluginCall((void*)ListIdxNewZeroClear);
				break;
			case AND_TOKEN:
				if(
					(fi = pst->GetFuncId(L("default"), false)) >= 0
					&& stree.stat->funclist.Get(fi)->returnshita >= 0)
				{
					auto fn = stree.stat->funclist.Get(fi);
					pjtr->bin.PushFadr(fn->byteadress, fn->backpatch);
					if(pst->IsJunkanAble()){
						pjtr->bin.PushImm(pst->sonota.junkanid);
						pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
						pjtr->bin.PluginCall((void*)CircListIdxNewClass);
					}else{
						pjtr->bin.PluginCall((void*)ListIdxNewClass);
					}
					break;
				}
			default:
				pjtr->bin.PluginCall((void*)ListIdxNew);
				break;
			}
			pjtr->bin.setAdrregReg0();
			ktype.id = VOID_TYPEID;
			tystack.pop_back();
			return true;
		}
		MEMBER bool RefMap(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const BinaryCode::AddressType at, const intptr_t ofs,
			const std::basic_string<intptr_t>& hes)
		{
			SrcTree* retcall = nullptr;
			intptr_t idx;
			std::basic_string<intptr_t> type;
			int nest = 0;
			bool cnst = false;
			SoushokuTobasi(hes.data(), idx=0);
			for(;; i++){
				if(hes[idx] != REF_TOKEN && hes[idx] != LIST_TOKEN){
					return false;
				}
				idx++;
				cnst = IsRefReadOnlyToken((TokenKind)hes[idx]);
				if (IsRefSoushokuToken((TokenKind)hes[idx])) idx++;
				if(hes[idx] == NULL_TOKEN){
					return false;
				}
				if(iap[i] != COLOYAJIRUSHI_TOKEN){
					if(iap[i] != TILDE_TOKEN) return false;
					break;
				}
				nest++;
			}
			if(!pjtr->bin.tPush(ktype.id)) return false;
			pjtr->bin.PushImm(0);
			pjtr->bin.PushImm(0);
			pjtr->bin.PushImm(0);
			pjtr->bin.pushStackTopAddress();
			intptr_t tmp = 0;
			ktype.id = TokenToTypeId(hes.data(), tmp);
			ktype.kwsk = hes;
			tystack += ktype.id;
			if(!LoadHensuu(stree, ktype, at, ofs)) return false;
			if(!pjtr->bin.tPush(ktype.id)) return false;
			pjtr->bin.PushImm(nest);
			ktype.id = VOID_TYPEID;
			tystack.back() = ktype.id;
			if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
				return false;
			}
			std::vector<std::basic_string<intptr_t>> waketa;
			if(!stree.KansuuKata(&stree, ktype.kwsk, waketa)) return false;
			tystack.pop_back();
			tmp = 0;
			auto rt = TokenToTypeId(waketa[0].data(), tmp);
			auto rts = stree.TypeIdToSize(rt);
			pjtr->bin.PushImm(rts);
			pjtr->bin.PushImm(
				stree.TypeIdToSize(TokenToTypeId(hes.data(), idx)));
			std::basic_string<intptr_t> backpatch;
			pjtr->bin.PushFadr(0, backpatch);
			pjtr->bin.PluginCall((void*)RefAll);
			//
			auto bp1 = pjtr->bin.Jump(0);
			*(intptr_t *)(pjtr->bin.code.data()+backpatch[0]) += pjtr->bin.code.size();
			pjtr->bin.KansuStackSet(
				0, sizeof(Delegate)+sizeof(void*)+sizeof(void*));
			pjtr->bin.pushAdrreg();
			pjtr->bin.pushTmpreg();
			//
			pjtr->bin.PushHns(
				BinaryCode::AT_LOCAL, sizeof(intptr_t)+sizeof(intptr_t));
			pjtr->bin.PushHns(BinaryCode::AT_LOCAL, sizeof(intptr_t));
			pjtr->bin.PushHns(BinaryCode::AT_LOCAL, 0);
			if(waketa[1].back() == ~DAINYUU_TOKEN){
				if(cnst){
					pjtr->addErrMes(
						L("読み取り専用なので参照渡しできません。"));
					return false;
				}
				pjtr->bin.PushHns(BinaryCode::AT_LOCAL, sizeof(Delegate));
			}else{
				tmp = 0;
				ktype.id = TokenToTypeId(waketa[1].data(), tmp);
				ktype.kwsk.swap(waketa[1]);
				if(
					0 <= ktype.id && ktype.id <= ENDCLASS_TYPEID
					&& stree.stat->funclist.Get(ktype.id)->selftype
					== CLASS_BLOCK)
				{
					pjtr->bin.loadReg0(BinaryCode::AT_LOCAL, sizeof(Delegate));
					pjtr->bin.pushStruct(
						stree.stat->funclist.Get(ktype.id)->GetMemberSize());
				}else{
					pjtr->bin.loadAdrreg(
						BinaryCode::AT_LOCAL, sizeof(Delegate));
					if(!LoadHensuu(stree, ktype, BinaryCode::AT_SANSHOU, 0)){
						return false;
					}
					if(!pjtr->bin.tPush(ktype.id)) return false;
				}
			}
			pjtr->bin.PushHns(BinaryCode::AT_LOCAL, sizeof(intptr_t));
			pjtr->bin.loadReg0(BinaryCode::AT_LOCAL, 0);
			pjtr->bin.call();
			pjtr->bin.removeStackTop(sizeof(intptr_t));
			//
			ktype.kwsk.swap(waketa[0]);
			tystack.back() = ktype.id = rt;
			pjtr->bin.loadAdrreg(
				BinaryCode::AT_LOCAL, sizeof(Delegate)+sizeof(void*));
			if(rts > 0) switch(ktype.id){
			case REF_TYPEID:
			case LIST_TYPEID:
				pjtr->bin.storeTmpRef(BinaryCode::AT_SANSHOU, 0, false);
				break;
			case DYNREF_TYPEID:
			case DYNLIST_TYPEID:
				pjtr->bin.storeTmpRef(BinaryCode::AT_SANSHOU, 0, true);
				break;
			default:
				if(!DainyuuReg(stree, ktype, BinaryCode::AT_SANSHOU, 0)){
					return false;
				}
				break;
			}
			//
			pjtr->bin.popToTmpreg();
			pjtr->bin.popToAdrreg();
			pjtr->bin.popToBasereg();
			pjtr->bin.Return(0, false);
			*(intptr_t *)(pjtr->bin.code.data()+bp1) += pjtr->bin.code.size();
			if(rts > 0){
				std::basic_string<intptr_t> type;
				for(int i = 0; i <= nest; i++) type += REF_TOKEN;
				type += ktype.kwsk;
				ktype.kwsk.swap(type);
				ktype.id = TMPREF_TYPEID;
			}else{
				pjtr->bin.removeStackTop(sizeof(Reference));
				ktype.id = VOID_TYPEID;
			}
			tystack.back() = ktype.id;
			ktype.memberObj = false;
			return true;
		}
		MEMBER bool Hensuu(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const BinaryCode::AddressType at, intptr_t ofs, SrcTree* const pst,
			const intptr_t indt, const std::basic_string<intptr_t>& ty,
			const int protect, SrcTree*& retcall)
		{
			KuwashiiType typ;
			intptr_t idx;
			bool tmpb;
			std::basic_string<intptr_t> type;
			std::vector<std::basic_string<intptr_t>> waketa;
			std::vector<KanTrefStruct> tmprefl;
			SoushokuTobasi(ty.data(), idx=0);
			if(iap[i+1] == VOID_TOKEN){
				i++;
				if(ty[idx] == THREAD_TOKEN){
					if(!pjtr->bin.MovHnsImm(at, ofs, 0, false)) return false;
				}else if(ty[idx] == REF_TOKEN || ty[idx] == LIST_TOKEN){
					if(!pjtr->bin.MovHnsImm(at, ofs, 0, false)) return false;
					if(
						!pjtr->bin.MovHnsImm(
							at, ofs+sizeof(intptr_t), 0, false))
					{
						return false;
					}
					if(
						!pjtr->bin.MovHnsImm(
							at, ofs+sizeof(intptr_t)*2, 0, false))
					{
						return false;
					}
					if(
						ty[idx+1] == NULL_TOKEN
						&& !pjtr->bin.MovHnsImm(
							at, ofs+sizeof(intptr_t)*3, VOID_TYPEID, false))
					{
						return false;
					}
				}else{
					return false;
				}
				i++;//セミコロンを飛ばす
				if(iap[i] != SEMICOLON_TOKEN) return false;
				return true;
			}
			if(iap[i+1] == DELETE_TOKEN || iap[i+1] == NEW_TOKEN){
				if(protect > 0) return false;
				i++;
				if(ty[idx] == THREAD_TOKEN){
					if(!pjtr->bin.setAdrreg(at, ofs)) return false;
					pjtr->bin.pushAdrreg();
					pjtr->bin.PluginCall((void*)ThreadWait);
				}else if(
					iap[i] == DELETE_TOKEN
					&& (ty[idx] == REF_TOKEN || ty[idx] == LIST_TOKEN))
				{
					if(tystack.size() > 0 && !pjtr->bin.tPush(ktype.id)){
						return false;
					}
					if(!RefCountDown(stree, at, ofs, ty, false)) return false;
					if(tystack.size() > 0 && !pjtr->bin.tPop(ktype.id)){
						return false;
					}
				}else if (ty[idx] != REF_TOKEN && ty[idx] != LIST_TOKEN){
					return false;
				}
				if(iap[i] == NEW_TOKEN){
					i++;
					if(
						IsRefReadOnlyToken(
							(TokenKind)ty[idx + 1])) return false;
					if(iap[i] == SHOUKAKKOOPEN_TOKEN){
						i++;
						if(
							!RefNew(
								stree, iap, i, tystack, ktype, at, ofs,
								ty[idx] == LIST_TOKEN, ty))
						{
							return false;
						}
					}else if(iap[i] == DAIKAKKOOPEN_TOKEN){
						i++;
						if(ty[idx] != LIST_TOKEN) return false;
						auto oldMO = ktype.memberObj;
						if(
							!RefIdxNew(
								stree, iap, i, tystack, ktype, at, ofs, ty))
						{
							return false;
						}
						ktype.memberObj = oldMO;
						idx++;
						type.clear();
						type.append(ty.data()+idx, ty.size()-idx);
						if(
							!Sanshou(
								stree, iap, i, tystack,
								ktype, type, protect, retcall))
						{
							return false;
						}
					}else{
						return false;
					}
				}else{
					i++;
					if(iap[i] != SEMICOLON_TOKEN) return false;
				}
				return true;
			}
			if(iap[i+1] == SHOUKAKKOOPEN_TOKEN && iap[i+2] == TENTEN_TOKEN){
				if(protect > 0) return false;
				i += 3;
				if(ty[idx] != THREAD_TOKEN) return false;
				idx++;
				if(!pjtr->bin.setAdrreg(at, ofs)) return false;
				pjtr->bin.pushAdrreg();
				if(
					Kansuu(
						stree, iap, i, tystack, ktype,
						*stree.stat->funclist.Get((int32_t)ty[idx]),
						false, true, tmprefl, false) < 0)
				{
					return false;
				}
				return true;
			}
			tmpb = ty[idx] == AND_TOKEN;
			if ((typ.id = TokenToTypeId(ty.data(), idx)) == UNKNOWN_TYPEID){
				if(ty[0] != PLUGIN_TOKEN || iap[i+1] != KAKKOCOLOOPEN_TOKEN){
					return false;
				}
				i += 2;
				if(!pjtr->bin.tPush(ktype.id)) return false;
				ktype.id = VOID_TYPEID;
				pjtr->bin.allocStackTop(sizeof(int64_t));
				pjtr->bin.pushStackTopAddress();
				pjtr->bin.PushImm((intptr_t)&g_gpsf.sf);
				ktype.kwsk = ty;
				if(
					(
						idx = KansuuPointer(
							stree, iap, i, tystack,
							ktype, pst->frp, waketa, tmprefl)) < 0)
				{
					return false;
				}
				if(protect > 0 && !IsReadOnlyToken((TokenKind)waketa[0][0])){
					return false;
				}
				pjtr->bin.setReg0StackAddress(idx);
				pjtr->bin.push();
				pjtr->bin.PluginCall((void*)ty.back());
				if(
					!KansuunoatonoTmprf(
						stree, ktype, idx,
						sizeof(intptr_t)*2+Aliszof<int64_t>(), tmprefl))
				{
					return false;
				}
				ktype.memberObj = false;
				return true;
			}
			bool withoutWarukakeruRef = false;
			if (protect >= 2){
				intptr_t ii = 0;
				SoushokuTobasi(ty.data(), ii);
				for (; ii < IDX(ty.size()); ii++){
					if (ty[ii] == REF_TOKEN || ty[ii] == LIST_TOKEN){
						if (
							IsRefSoushokuToken((TokenKind)ty[ii + 1])
							|| ty[ii + 1] == NULL_TOKEN)
						{
							ii++;
						}
						else{
							withoutWarukakeruRef = true;
							break;
						}
					}
					else{
						break;
					}
				}
			}
			if (withoutWarukakeruRef){
				typ.kwsk.clear();
				auto it = ty.begin();
				if(IsSoushokuToken((TokenKind)*it)) typ.kwsk += *it++;
				while(*it == REF_TOKEN || *it == LIST_TOKEN){
					typ.kwsk += *it++;
					if(
						IsRefSoushokuToken((TokenKind)*it)
						|| *it == NULL_TOKEN)
					{
						typ.kwsk += *it++;
					}
					else{
						typ.kwsk += KAKERU_TOKEN;
					}
				}
				while(it != ty.end()) typ.kwsk += *it++;
			}
			else{
				typ.kwsk = ty;
			}
			if (iap[i + 1] == COLOYAJIRUSHI_TOKEN){
				i += 2;
				if (
					!RefMap(
						stree, iap, i, tystack, ktype, at, ofs, typ.kwsk))
				{
					return false;
				}
				return true;
			}
			typ.memberObj = ktype.memberObj;
			typ.pstre = pst;
			if (iap[i + 1] == NULL_TOKEN && iap[i + 2] == TENDAINYUU_TOKEN){
				if(protect > 0) return false;
				i += 2;
				return Append(stree, iap, i, tystack, ktype, typ, at, ofs);
			}
			if(
				iap[i+1] == NULL_TOKEN && (
					DAINYUU_TOKEN <= iap[i+2]
					&& iap[i+2] <= STARSTARDAINYUU_TOKEN))
			{
				if(protect > 0) return false;
				i += 2;
				return Dainyuu(stree, iap, i, tystack, ktype, typ, at, ofs);
			}
			if(
				(
					iap[i+1] == NULL_TOKEN
					&& (iap[i+2] == PLSPLS_TOKEN || iap[i+2] == MNSMNS_TOKEN))
				|| iap[i+1] == PLSPLS_TOKEN || iap[i+1] == MNSMNS_TOKEN)
			{
				if(protect > 0) return false;
				i++;
				return IncDec(stree, iap, i, tystack, ktype, typ, at, ofs);
			}
			if(
				(iap[i+1] == NULL_TOKEN && iap[i+2] == TOGGLE_TOKEN)
				|| iap[i+1] == TOGGLE_TOKEN)
			{
				if(protect > 0) return false;
				i++;
				return Toggle(stree, iap, i, tystack, ktype, typ, at, ofs);
			}
			if(protect > 0 && ENDTHREAD_TYPEID <= typ.id && typ.id < 0){
				return false;
			}
			if (typ.id != VOID_TYPEID){
				if(ty[0] == CONST_TOKEN){
					if(!pjtr->bin.tPush(ktype.id)) return false;
					ktype = typ;
					if(ktype.id == FUNC_TYPEID){
						if(
							!stree.stat->funclist.Get(
								(int32_t)ty.back())->isEnable())
						{
							return false;
						}
						auto fn = stree.stat->funclist.Get((int32_t)ty.back());
						pjtr->bin.setReg0Fadr(fn->byteadress, fn->backpatch);
					}else if(ktype.id == REF_TYPEID){
						(void)pjtr->bin.PushHnsRef(
							BinaryCode::AT_GLOBAL, ty.back(), false);
					}else{
						if(!Teisuu(stree, ktype, ty.data()+idx)){
							return false;
						}
					}
				}else{
					if(tmpb || (ENDTHREAD_TYPEID <= typ.id && typ.id < 0)){
						if(!pjtr->bin.tPush(ktype.id)) return false;
						ktype = typ;
						if(!pjtr->bin.setReg0Adr(at, ofs)) return false;
					}else{
						if(
							(typ.id != REF_TYPEID && typ.id != LIST_TYPEID)
							&& typ.id == ktype.id
							&& STARSTAR_TOKEN <= iap[i+1]
							&& iap[i+1] <= STARSTARDAINYUU_TOKEN
							&& iap[i+1] != DAINYUU_TOKEN
							&& iap[i+1] != QUESTION_TOKEN)
						{
							if(
								!HensuuEnzan(
									stree, tystack, ktype,
									at, ofs, (TokenKind)iap[i+1]))
							{
								return false;
							}
							if(
								STARSTAR_TOKEN <= iap[i+1]
								&& iap[i+1] <= OR_TOKEN)
							{
								i++;
							}else{
								ktype.pstre = (SrcTree*)~(intptr_t)0;
								return true;
							}
							tystack.pop_back();
						}else{
							if(
								(
									protect > 0 && (
										ktype.id == DYNREF_TYPEID
										|| ktype.id == DYNLIST_TYPEID))
								|| !pjtr->bin.tPush(ktype.id))
							{
								return false;
							}
							ktype = typ;
							if(!LoadHensuu(stree, ktype, at, ofs)){
								return false;
							}
						}
					}
				}
				if(
					ktype.id == METHOD_TYPEID
					&& iap[i+1] == KAKKOCOLOOPEN_TOKEN)
				{
					i += 2;
					if(at == BinaryCode::AT_SANSHOU){
						pjtr->bin.constAdrregSub(pst->GetMemberOffset(indt));
					}else{
						ofs -=
							pst == stree.frp
							? stree.crp->GetMemberOffset(indt)
							: pst->GetMemberOffset(indt);
					}
					if(!pjtr->bin.tPush(ktype.id)) return false;
					ktype.id = VOID_TYPEID;
					if(at == BinaryCode::AT_SANSHOU) pjtr->bin.pushAdrreg();
					if(!pst->frp->touka) pjtr->bin.pushThisreg();
					if(
						(
							idx = KansuuPointer(
								stree, iap, i, tystack, ktype,
								pst->frp, waketa, tmprefl)) < 0)
					{
						return false;
					}
					if(
						protect > 0
						&& !IsReadOnlyToken((TokenKind)waketa[0][0]))
					{
						return false;
					}
					if(at == BinaryCode::AT_SANSHOU){
						if(!pst->frp->touka){
							pjtr->bin.setThisregStack(idx+sizeof(intptr_t));
						}
						pjtr->bin.setReg0Stack(
							idx + sizeof(intptr_t)*((int)!pst->frp->touka+1));
					}else{
						if(!pst->frp->touka){
							if(!pjtr->bin.setThisreg(at, ofs)) return false;
						}
						pjtr->bin.setReg0Stack(
							idx + sizeof(intptr_t)*(int)!pst->frp->touka);
					}
					pjtr->bin.call();
					if(!pst->frp->touka){
						if(!KansuunoatonoTmprf(stree, ktype, idx, 0, tmprefl)){
							return false;
						}
						pjtr->bin.popToThisreg();
						pjtr->bin.removeStackTop(
							sizeof(intptr_t)
							* (at == BinaryCode::AT_SANSHOU ? 2 : 1));
					}else{
						if(
							!KansuunoatonoTmprf(
								stree, ktype, idx,
								sizeof(intptr_t)
								* (at == BinaryCode::AT_SANSHOU ? 2 : 1),
								tmprefl))
						{
							return false;
						}
					}
					PushTmpRef(ktype);
					ktype.memberObj = true;
					if (stree.frp->rettype[0] != WARU_TOKEN){
						kakeruRemove(ktype.kwsk);
						ktype.memberObj = false;
					}
				}
				else{
					tystack += ktype.id;
				}
			}else{
				tystack += ktype.id;
			}
			return true;
		}
		MEMBER bool StackRefCountDown(SrcTree &stree, const KuwashiiType& ktype)
		{
			pjtr->bin.setAdrregStackTopAddress();
			if(
				!RefCountDown(
					stree, BinaryCode::AT_SANSHOU, 0, ktype.kwsk, false))
			{
				return false;
			}
			pjtr->bin.removeStackTop(
				ktype.id == DYNREF_TYPEID
				|| ktype.id == DYNLIST_TYPEID
				? sizeof(DynamicRef) : sizeof(Reference));
			return true;
		}
		MEMBER bool PushTmpRef(const KuwashiiType& ktype)
		{
			if(TMPREF_TYPEID >= ktype.id && ktype.id >= TMPDYNLIST_TYPEID){
				pjtr->bin.pushTmpRef(
					ktype.id == TMPDYNREF_TYPEID
					|| ktype.id == TMPDYNLIST_TYPEID);
				return true;
			}
			return false;
		}
		MEMBER bool KansuunoatonoTmprf(
			SrcTree &stree, const KuwashiiType& ktype, const intptr_t argsize,
			const intptr_t offset, const std::vector<KanTrefStruct>& tmprefl)
		{
			if(tmprefl.size() > 0){
				if (argsize < 0){
					pjtr->bin.popToAdrreg();
				}
				else{
					pjtr->bin.setAdrregStackTopAddress();
					pjtr->bin.allocStackTop(argsize);
				}
				bool rtmpr = PushTmpRef(ktype);
				if(!rtmpr && !pjtr->bin.tPush(ktype.id)) return false;
				intptr_t foo = 0;
				for(intptr_t idx = 0; idx < IDX(tmprefl.size()); idx++){
					pjtr->bin.constAdrregSub(tmprefl[idx].argofs - foo);
					foo = tmprefl[idx].argofs;
					if(
						!RefCountDown(
							stree, BinaryCode::AT_SANSHOU, 0,
							tmprefl[idx].kwsk, false))
					{
						return false;
					}
				}
				if(rtmpr){
					pjtr->bin.popTmpRef(
						ktype.id == TMPDYNREF_TYPEID
						|| ktype.id == TMPDYNLIST_TYPEID);
				}else{
					(void)pjtr->bin.tPop(ktype.id);
				}
				pjtr->bin.removeStackTop(max(argsize, 0) + offset);
			}else{
				pjtr->bin.removeStackTop(
					offset + (argsize < 0 ? sizeof(intptr_t) : 0));
			}
			return true;
		}
		MEMBER bool Sanshou(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			const std::basic_string<intptr_t>& rtype,
			int protect, SrcTree*& retcall)
		{
			SrcTree *pst = nullptr;
			int32_t tyki;
			intptr_t indt = 0, idx, tmpi, asize;
			std::basic_string<intptr_t> typer;
			tmpi = 0;
			bool tendeta = false;
			if(IsReadOnlyToken((TokenKind)rtype[0])){
				typer.clear();
				typer.append(rtype.data()+1, rtype.size()-1);
				if (protect < 2) protect = 1 + (int)(rtype[1] == AND_TOKEN);
			}
			else{
				typer = rtype;
			}
			while(iap[i+1] == POINT_TOKEN){
				tendeta = true;
				SoushokuTobasi(typer.data(), idx=0);
				if(typer[idx] != AND_TOKEN && typer[idx] != OR_TOKEN){
					return false;
				}
				idx++;
				tyki = (int32_t)typer[idx];
				i += 2;
				pst = stree.stat->funclist.Get(tyki);
				if(iap[i] == MEMBER_TOKEN) i++;
				if(iap[i] == SHOUKAKKOOPEN_TOKEN){
					std::vector<KanTrefStruct> tmprefl;
					i++;
					if(iap[i] >= 0) return false;
					pst = stree.stat->funclist.Get((int32_t)~iap[i]);
					i++;
					if(
						!pst->isEnable()
						&& (pst = pst->GetIjousaki(tmpi)) == nullptr)
					{
						return false;
					}
					if(protect > 0 && pst->rettype[0] != WARU_TOKEN){
						return false;
					}
					if(!pjtr->bin.tPush(ktype.id)) return false;
					ktype.id = VOID_TYPEID;
					pjtr->bin.pushThisreg();
					pjtr->bin.constAdrregAdd(tmpi);
					pjtr->bin.pushAdrreg();
					if(
						(
							asize = Kansuu(
								stree, iap, i, tystack, ktype, *pst,
								protect > 0 && (
									!ktype.memberObj
									|| stree.frp->rettype[0] != WARU_TOKEN),
								false, tmprefl, ktype.memberObj)) < 0)
					{
						return false;
					}
					pjtr->bin.setThisregStack(asize);
					pjtr->bin.FuncCall(pst->byteadress, pst->backpatch);
					if(
						!KansuunoatonoTmprf(
							stree, ktype, asize, sizeof(intptr_t), tmprefl))
					{
						return false;
					}
					pjtr->bin.popToThisreg();
					PushTmpRef(ktype);
					return true;
				}
				if(iap[i] >= 0){
					return MainSwitch(stree, iap, i, tystack, ktype, retcall);
				}
				indt = ~iap[i];
				tmpi += pst->GetMemberOffset(indt);
				typer = pst->funchensuu[indt].type;
				if(
					protect < 2 && (
						typer[0] == CONST_TOKEN || (
							stree.frp->parent != pst
							&& typer[0] == WARU_TOKEN)))
				{
					protect = 1 + (int)(typer[1] == AND_TOKEN);
				}
			}
			if((!tendeta || typer[0] != CONST_TOKEN) && tmpi != 0){
				pjtr->bin.constAdrregAdd(tmpi);
			}
			return
				Hensuu(
					stree, iap, i, tystack, ktype, BinaryCode::AT_SANSHOU,
					0, pst, indt, typer, protect, retcall);
		}
		MEMBER bool IsVoidHikinashiRet(const intptr_t *const iap, intptr_t &i)
		{
			return
				iap[i] == SHOUKAKKOCLOSE_TOKEN
				&& iap[i+1] == NULL_TOKEN && iap[i+2] == RET_TOKEN;
		}
		MEMBER bool RefMain(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			SrcTree*& retcall)
		{
			auto typ = ktype;
			auto tssz = tystack.size();
			auto id = tystack.back();
			bool doll = false;
			if(
				!MainSwitchMain(
					stree, iap, i, tystack, ktype, retcall))
			{
				return false;
			}
			goto LOOPENTER;
			do{
				doll = iap[i] == DOLLAR_TOKEN;
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
LOOPENTER:
				typ.memberObj = typ.memberObj || ktype.memberObj;
				i++;
				if(tystack.size() == tssz+1 && iap[i] == PULUS_TOKEN){
					if(
						!(
							ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID
							|| ktype.id == TMPREF_TYPEID
							|| ktype.id == TMPLIST_TYPEID)
						|| !stree.YuruiKataCheck(
							UnRefType(ktype.kwsk), UnRefType(typ.kwsk),
							*pjtr->filename, pjtr->gyousuu))
					{
						return false;
					}
					bool tt[2] = {
						(
							ktype.id == TMPREF_TYPEID
							|| ktype.id == TMPLIST_TYPEID),
						(typ.id == TMPREF_TYPEID || typ.id == TMPLIST_TYPEID)
					};
					pjtr->bin.pushStack(
						3*sizeof(intptr_t) + (3-1)*sizeof(intptr_t) );
					pjtr->bin.pushStack(
						3*sizeof(intptr_t) + (3-1)*sizeof(intptr_t));
					pjtr->bin.pushStack(
						3*sizeof(intptr_t) + (3-1)*sizeof(intptr_t));
					if(tt[0] || tt[1]) pjtr->bin.dup(sizeof(intptr_t)*6);
					pjtr->bin.setReg0StackAddress(
						sizeof(intptr_t)*6*(1 + (tt[0] || tt[1])));
					pjtr->bin.push();
					intptr_t tmpi = 0;
					SoushokuTobasi(ktype.kwsk.data(), tmpi);
					bool lis = ktype.kwsk[tmpi] == LIST_TOKEN;
					tmpi++;
					SoushokuTobasi(ktype.kwsk.data(), tmpi);
					if(
						ktype.kwsk[tmpi] == REF_TOKEN
						|| ktype.kwsk[tmpi] == LIST_TOKEN)
					{
						tmpi++;
						if(ktype.kwsk[tmpi] == NULL_TOKEN){
							pjtr->bin.PluginCall(
								(void*)(lis ? ListDynRefRenketsu : RefDynRefRenketsu));
						}else{
							pjtr->bin.PluginCall(
								(void*)(lis ? ListRefRenketsu : RefRefRenketsu));
						}
					}else{
						pjtr->bin.PluginCall((void*)(lis ? ListRenketsu : RefRenketsu));
					}
					for(int ii = 0; ; ii = 1){
						if(tt[ii]){
							pjtr->bin.setAdrregStackTopAddress();
							if(ii == 0){
								pjtr->bin.constAdrregAdd(sizeof(intptr_t)*3);
							}
							if(
								!RefCountDown(
									stree, BinaryCode::AT_SANSHOU,
									0, ktype.kwsk, false))
							{
								return false;
							}
						}
						if(ii != 0) break;
						ktype = typ;
					}
					pjtr->bin.removeStackTop(
						sizeof(intptr_t)*6*(tt[0] || tt[1]));
					if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
						ktype.id += TMPREF_TYPEID - REF_TYPEID;
					}
					tystack.pop_back();
					i++;
				}
			}while(tystack.size() > tssz || doll);
			i--;
			return true;
		}
		MEMBER bool MainSwitch(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			SrcTree*& retcall)
		{
			if(
				tystack.size() > 0 && (
					ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID
					|| ktype.id == TMPREF_TYPEID
					|| ktype.id == TMPLIST_TYPEID))
			{
				return RefMain(stree, iap, i, tystack, ktype, retcall);
			}
			return MainSwitchMain(stree, iap, i, tystack, ktype, retcall);
		}
		MEMBER bool MainSwitchMain(
			SrcTree& stree, const intptr_t* const iap, intptr_t& i,
			std::basic_string<int32_t>& tystack, KuwashiiType& ktype,
			SrcTree*& retcall)
		{
			SrcTree* pst;
			KuwashiiType typ;
			intptr_t idx, indt, tmpi, bp1, bp2;
			TokenKind tmptk;
			std::basic_string<intptr_t> type;
			bool tmpb;
			std::vector<std::basic_string<intptr_t>> waketa;
			std::vector<KanTrefStruct> tmprefl;
			ktype.pstre = nullptr;
			switch(iap[i]){
			case CONST_TOKEN:
				i++;
				if((typ.id = TokenToTypeId(iap, i)) == UNKNOWN_TYPEID){
					return false;
				}
				if(typ.id == REF_TYPEID){
					if(!pjtr->bin.tPush(ktype.id)) return false;
					ktype = typ;
					ktype.kwsk = REF_TOKEN;
					if(!RefToken(ktype.kwsk, iap, i)) return false;
					(void)pjtr->bin.PushHnsRef(
						BinaryCode::AT_GLOBAL, iap[i], false);
				}else if(typ.id == FUNC_TYPEID || typ.id == METHOD_TYPEID){
					if(!pjtr->bin.tPush(ktype.id)) return false;
					ktype = typ;
					ktype.kwsk =
						ktype.id == FUNC_TYPEID ? FUNC_TOKEN : METHOD_TOKEN;
					if(ktype.id == METHOD_TYPEID) ktype.kwsk += iap[i++];
					if(!FuncToken(ktype.kwsk, iap, i)) return false;
					if(!stree.stat->funclist.Get((int32_t)iap[i])->isEnable()){
						return false;
					}
					auto fn = stree.stat->funclist.Get((int32_t)iap[i]);
					pjtr->bin.setReg0Fadr(fn->byteadress, fn->backpatch);
				}else{
					idx =
						i
						+ (stree.TypeIdToSize(typ.id) + sizeof(intptr_t)-1)
						/ sizeof(intptr_t);
					if(
						tystack.size() > 0
						&& tystack.back() != WILDCARD_TYPEID
						&& (
							(
								STARSTAR_TOKEN <= iap[idx]
								&& iap[idx] <= STARSTARDAINYUU_TOKEN)
							|| iap[idx] == COMMA_TOKEN
							|| iap[idx] == SHOUKAKKOCLOSE_TOKEN
							|| iap[idx] == COLON_TOKEN
							|| iap[idx] == DAIKAKKOCLOSE_TOKEN
							|| iap[idx] == TENTEN_TOKEN
							|| (
								iap[idx] == NULL_TOKEN
								&& iap[idx+1] == TENTEN_TOKEN)))
					{
						if(
							stree.CastConst(
								typ.id, iap+i,
								tystack.back(), &castvar) < 0)
						{
							pjtr->addErrMes(L("型エラーです。"));
							return false;
						}
						if(
							(
								STARSTAR_TOKEN <= iap[idx]
								&& iap[idx] <= OR_TOKEN)
							|| (
								PULUSDAINYUU_TOKEN <= iap[idx]
								&& iap[idx] <= STARSTARDAINYUU_TOKEN))
						{
							if(ktype.id != tystack.back()){
								ktype.id = tystack.back();
								(void)pjtr->bin.tPop(ktype.id);
							}
							if(
								!ConstEnzan(stree, tystack,
								ktype, castvar, (TokenKind)iap[idx]))
							{
								return false;
							}
							if(
								STARSTAR_TOKEN <= iap[idx]
								&& iap[idx] <= OR_TOKEN)
							{
								idx++;
							}else{
								ktype.pstre = (SrcTree*)~(intptr_t)0;
								i = idx - 1;
								break;
							}
							tystack.pop_back();
						}else if(
							iap[idx] == DAINYUU_TOKEN
							&& tystack.back() != DOUBLE_TYPEID)
						{
							ktype.id = tystack.back();
							tystack += ktype.id;
							ktype.pstre = (SrcTree*)~(intptr_t)0;
							i = idx - 1;
							break;
						}else{
							if(!pjtr->bin.tPush(ktype.id)) return false;
							ktype.id = tystack.back();
							if(!Teisuu(stree, ktype, (int32_t*)&castvar)){
								return false;
							}
						}
					}else{
						if(!pjtr->bin.tPush(ktype.id)) return false;
						ktype = typ;
						if(!Teisuu(stree, ktype, iap+i)) return false;
					}
					i = idx - 1;
				}
				ktype.pstre = &stree;
				tystack += ktype.id;
				ktype.memberObj = false;
				break;
			case TILDE_TOKEN:
				if(!pjtr->bin.tPush(ktype.id)) return false;
				i++;
				pjtr->bin.pushThisreg();
				pjtr->bin.pushBasereg();
				ktype.id = DELEGATE_TYPEID;
				ktype.kwsk = TILDE_TOKEN;
				if (!FuncToken(ktype.kwsk, iap, i)) return false;
				{
					auto fn = (SrcTree*)iap[i];
					pjtr->bin.PushFadr(fn->byteadress, fn->backpatch);
				}
				tystack += ktype.id;
				ktype.memberObj = false;
				break;
			case PULUS_TOKEN:
			case MINUS_TOKEN:
			case STARSTAR_TOKEN:
			case KAKERU_TOKEN:
			case WARU_TOKEN:
			case AMARI_TOKEN:
			case AND_TOKEN:
			case XOR_TOKEN:
			case OR_TOKEN:
			case LSHIFT_TOKEN:
			case RSHIFT_TOKEN:
			case EQUAL_TOKEN:
			case NOTEQUAL_TOKEN:
			case SHOU_TOKEN:
			case SHOUOREQUAL_TOKEN:
			case DAI_TOKEN:
			case DAIOREQUAL_TOKEN:
				if(!StackEnzan(stree, tystack, ktype, (TokenKind)iap[i])){
					return false;
				}
				ktype.memberObj = false;
				break;
			case EXCLAMATION_TOKEN:
				switch(ktype.id){
				case BYTE_TYPEID: case UBYTE_TYPEID:
				case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					pjtr->bin.not();
					break;
				case LONG_TYPEID: case ULONG_TYPEID:
					pjtr->bin.not64();
					break;
				case BOOL_TYPEID:
					pjtr->bin.constXor(1);
					break;
				default:
					return false;
				}
				ktype.memberObj = false;
				break;
			case DIA_TOKEN:
				if(ktype.id != REF_TYPEID && ktype.id != LIST_TYPEID){
					return false;
				}
				SoushokuTobasi(ktype.kwsk.data(), idx=0);
				if(
					ktype.kwsk[idx] != REF_TOKEN
					&& ktype.kwsk[idx] != LIST_TOKEN)
				{
					return false;
				}
				idx++;
				type.clear();
				type.append(ktype.kwsk.data()+idx, ktype.kwsk.size()-idx);
				pjtr->bin.PluginCall((void*)RefPos);
				pjtr->bin.setAdrregReg0();
				tystack.pop_back();
				ktype.id = VOID_TYPEID;
				if(!Sanshou(stree, iap, i, tystack, ktype, type, 0, retcall)){
					return false;
				}
				break;
			case DAIKAKKOOPEN_TOKEN:
				if(ktype.id != REF_TYPEID && ktype.id != LIST_TYPEID){
					return false;
				}
				SoushokuTobasi(ktype.kwsk.data(), idx=0);
				if(
					ktype.kwsk[idx] != REF_TOKEN
					&& ktype.kwsk[idx] != LIST_TOKEN)
				{
					return false;
				}
				tmpb = ktype.id == LIST_TYPEID;
				idx++;
				type.clear();
				type.append(ktype.kwsk.data()+idx, ktype.kwsk.size()-idx);
				i++;
				tystack += ADDRESS_TYPEID;
				(void)pjtr->bin.tPush(ktype.id);
				ktype.id = VOID_TYPEID;
				{
					auto oldMO = ktype.memberObj;
					do{
						if (
							!MainSwitch(
								stree, iap, i, tystack, ktype, retcall))
						{
							return false;
						}
						i++;
					} while (
						iap[i] != DAIKAKKOCLOSE_TOKEN
						&& iap[i] != TENTEN_TOKEN);
					if (!JidouCast(stree, tystack, ADDRESS_TYPEID, ktype.id)){
						return false;
					}
					tystack.pop_back();
					ktype.id = ADDRESS_TYPEID;
					if (iap[i] == TENTEN_TOKEN){
						i++;
						if (iap[i] != DAIKAKKOCLOSE_TOKEN) return false;
						(void)pjtr->bin.tPush(ktype.id);
						pjtr->bin.setReg0StackAddress(sizeof(intptr_t) * 2);
						pjtr->bin.push();
						switch (stree.GetTypeSize(type)){
						case 1: pjtr->bin.PluginCall((void*)RefSliceS1); break;
						case 2: pjtr->bin.PluginCall((void*)RefSliceS2); break;
						case 3: pjtr->bin.PluginCall((void*)RefSliceS3); break;
						case 4: pjtr->bin.PluginCall((void*)RefSliceS4); break;
						case 5: pjtr->bin.PluginCall((void*)RefSliceS5); break;
						case 6: pjtr->bin.PluginCall((void*)RefSliceS6); break;
						case 7: pjtr->bin.PluginCall((void*)RefSliceS7); break;
						case 8: pjtr->bin.PluginCall((void*)RefSliceS8); break;
						case 9: pjtr->bin.PluginCall((void*)RefSliceS9); break;
						case 10: pjtr->bin.PluginCall((void*)RefSliceS10); break;
						case 11: pjtr->bin.PluginCall((void*)RefSliceS11); break;
						case 12: pjtr->bin.PluginCall((void*)RefSliceS12); break;
						case 13: pjtr->bin.PluginCall((void*)RefSliceS13); break;
						case 14: pjtr->bin.PluginCall((void*)RefSliceS14); break;
						case 15: pjtr->bin.PluginCall((void*)RefSliceS15); break;
						case 16: pjtr->bin.PluginCall((void*)RefSliceS16); break;
						default:
							pjtr->bin.PushImm(stree.GetTypeSize(type));
							pjtr->bin.PluginCall((void*)RefSlice);
							break;
						}
						ktype.id = REF_TYPEID;
						ktype.kwsk = REF_TOKEN;
						ktype.kwsk += type;
						tystack.resize(tystack.size() - 2);
						tystack.back() = ktype.id;
						ktype.memberObj = oldMO;
					}
					else{
						(void)pjtr->bin.tPush(ktype.id);
						switch (stree.GetTypeSize(type)){
						case 1:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS1 : RefIdxS1));
							break;
						case 2:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS2 : RefIdxS2));
							break;
						case 3:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS3 : RefIdxS3));
							break;
						case 4:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS4 : RefIdxS4));
							break;
						case 5:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS5 : RefIdxS5));
							break;
						case 6:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS6 : RefIdxS6));
							break;
						case 7:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS7 : RefIdxS7));
							break;
						case 8:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS8 : RefIdxS8));
							break;
						case 9:
							pjtr->bin.PluginCall((void*)(tmpb ? ListIdxS9 : RefIdxS9));
							break;
						case 10:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS10 : RefIdxS10));
							break;
						case 11:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS11 : RefIdxS11));
							break;
						case 12:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS12 : RefIdxS12));
							break;
						case 13:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS13 : RefIdxS13));
							break;
						case 14:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS14 : RefIdxS14));
							break;
						case 15:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS15 : RefIdxS15));
							break;
						case 16:
							pjtr->bin.PluginCall(
								(void*)(tmpb ? ListIdxS16 : RefIdxS16));
							break;
						case 0:
							return false;
						default:
							pjtr->bin.PushImm(stree.GetTypeSize(type));
							pjtr->bin.PluginCall((void*)RefIdx);
							break;
						}
						tystack.pop_back();
						pjtr->bin.setAdrregReg0();
						tystack.pop_back();
						ktype.id = VOID_TYPEID;
						ktype.memberObj = oldMO;
						if (
							!Sanshou(
							stree, iap, i, tystack, ktype, type, 0, retcall))
						{
							return false;
						}
					}
				}
				break;
			case SQUOT_TOKEN:
				i++;
				switch(iap[i]){
				case QUESTION_TOKEN:
					if(
						ktype.id <= SYSTEMUSED_TYPEID
						|| ktype.id == DELEGATE_TYPEID
						|| (ENDTHREAD_TYPEID <= ktype.id && ktype.id < 0)
						|| (
							0 <= ktype.id && ktype.id <= ENDCLASS_TYPEID
							&& stree.stat->funclist.Get(ktype.id)->selftype
							== CLASS_BLOCK
							&& !stree.stat->funclist.Get(ktype.id)->IsOpen(
								stree)))
					{
						return false;
					}
					tmpi = stree.TypeIdToSize(ktype.id);
					if(
						TMPDYNLIST_TYPEID <= ktype.id
						&& ktype.id <= REF_TYPEID)
					{
						if(tmpi == sizeof(DynamicRef)) pjtr->bin.pop();
						pjtr->bin.dup(sizeof(Reference));
						if(tmpi == sizeof(DynamicRef)) pjtr->bin.push();
					}else{
						pjtr->bin.allocStackTop(sizeof(Reference));
						if(
							0 <= ktype.id && ktype.id <= ENDCLASS_TYPEID
							&& stree.stat->funclist.Get(ktype.id)->selftype
							== CLASS_BLOCK)
						{
							pjtr->bin.allocStackTop(tmpi);
							pjtr->bin.setAdrregStackTopAddress();
							(void)pjtr->bin.storeMem(
								BinaryCode::AT_SANSHOU, 0, tmpi);
						}else{
							pjtr->bin.tPush(ktype.id);
						}
					}
					pjtr->bin.PushImm(tmpi);
					pjtr->bin.setReg0StackAddress(
						Aligner(tmpi)+sizeof(intptr_t));
					pjtr->bin.push();
					if(DYNLIST_TYPEID <= ktype.id && ktype.id <= REF_TYPEID){
						pjtr->bin.PluginCall((void*)RefRefCopyNew);
					}else{
						pjtr->bin.PluginCall((void*)RefCopyNew);
					}
					pjtr->bin.removeStackTop(Aligner(tmpi)+sizeof(intptr_t)*2);
					type = REF_TOKEN;
					switch(ktype.id){
					case BYTE_TYPEID:    type += BYTE_TOKEN;   break;
					case SHORT_TYPEID:   type += SHORT_TOKEN;  break;
					case INT_TYPEID:     type += INT_TOKEN;    break;
					case LONG_TYPEID:    type += LONG_TOKEN;   break;
					case UBYTE_TYPEID:   type += UBYTE_TOKEN;  break;
					case USHORT_TYPEID:  type += USHORT_TOKEN; break;
					case UINT_TYPEID:    type += UINT_TOKEN;   break;
					case ULONG_TYPEID:   type += ULONG_TOKEN;  break;
					case CHAR_TYPEID:    type += CHAR_TOKEN;   break;
					case ADDRESS_TYPEID: type += INDEX_TOKEN;  break;
					case FLOAT_TYPEID:   type += FLOAT_TOKEN;  break;
					case DOUBLE_TYPEID:  type += DOUBLE_TOKEN; break;
					case BOOL_TYPEID:    type += BOOL_TOKEN;   break;
					default:
						SoushokuTobasi(ktype.kwsk.data(), idx=0);
						type.append(
							ktype.kwsk.data()+idx, ktype.kwsk.size()-idx);
						break;
					}
					ktype.kwsk = type;
					tystack.back() = ktype.id = TMPREF_TYPEID;
					break;
				default:
					return false;
				}
				ktype.memberObj = false;
				break;
			case NULL_TOKEN:
				i++;
				switch(iap[i]){
				case PULUS_TOKEN:
					switch(ktype.id){
					case BYTE_TYPEID: case UBYTE_TYPEID:
					case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
					case LONG_TYPEID: case ULONG_TYPEID:
					case FLOAT_TYPEID: case DOUBLE_TYPEID:
						break;
					default:
						return false;
					}
					ktype.memberObj = false;
					break;
				case MINUS_TOKEN:
					switch(ktype.id){
					case BYTE_TYPEID: case UBYTE_TYPEID:
					case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
					case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
						pjtr->bin.neg();
						break;
					case LONG_TYPEID: case ULONG_TYPEID:
						pjtr->bin.neg64();
						break;
					case FLOAT_TYPEID: case DOUBLE_TYPEID:
						pjtr->bin.Fchs();
						break;
					default:
						return false;
					}
					ktype.memberObj = false;
					break;
				case ANDAND_TOKEN:
				case OROR_TOKEN:
					if(!AAOO(stree, iap, i, tystack, ktype)) return false;
					ktype.memberObj = false;
					break;
				case QUESTION_TOKEN:
					if(!Sankou(stree, iap, i, tystack, ktype)) return false;
					ktype.memberObj = false;
					break;
				case MEMBER_TOKEN:
					ktype.memberObj = true;
					if (iap[i + 1] == NULL_TOKEN && iap[i + 2] == DAINYUU_TOKEN){
						if(stree.frp->rettype[0] == WARU_TOKEN){
							return false;
						}
						i += 2;
						typ.id = stree.frp->parent->funcid;
						return
							Dainyuu(
								stree, iap, i, tystack,
								ktype, typ, BinaryCode::AT_MEMBER, 0);
					}else{
						if(!pjtr->bin.tPush(ktype.id)) return false;
						(void)pjtr->bin.setReg0Adr(BinaryCode::AT_MEMBER, 0);
						ktype.id = stree.frp->parent->funcid;
						tystack += ktype.id;
					}
					break;
				case TENTEN_TOKEN:
					if(!JidouCast(stree, tystack, ADDRESS_TYPEID, ktype.id)){
						return false;
					}
					ktype.id = ADDRESS_TYPEID;
					break;
				case RET_TOKEN:
					if(tystack.size() > 0 && ktype.id == VOID_TYPEID){
						return false;
					}
					tmpb =
						TMPREF_TYPEID >= ktype.id
						&& ktype.id >= TMPDYNLIST_TYPEID;
					if(tmpb) ktype.id += REF_TYPEID - TMPREF_TYPEID;
					if(REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID){
						if(
							!stree.YuruiKataCheck(
								ktype.kwsk, stree.crp->rettype,
								*pjtr->filename, pjtr->gyousuu))
						{
							return false;
						}
						if(tystack.size() > 0) tystack.pop_back();
						if(!tmpb){
							pjtr->bin.pushStackTopAddress();
							pjtr->bin.PluginCall((void*)RefCntUp);
						}
					}else{
						if(
							(
								typ.id = TokenToTypeId(
									stree.crp->rettype.data(), idx=0))
							== UNKNOWN_TYPEID)
						{
							return false;
						}
						if(!JidouCast(stree, tystack, typ.id, ktype.id)){
							return false;
						}
						if(iap[i+1] != RET_TOKEN){
							if(tystack.size() > 0) tystack.pop_back();
							ktype.id = typ.id;
							if(stree.frp == stree.root){
								bp1 = pjtr->bin.PushCadr(0);
								pjtr->bin.PushImm(
									(intptr_t)pjtr->root->stat->ss);
								pjtr->bin.PluginCall((void*)PutGbld);
								pjtr->glbbp = pjtr->bin.Jump(0);
								*(intptr_t*)(pjtr->bin.code.data()+bp1) +=
									pjtr->bin.code.size();
								pjtr->bin.pushAdrreg();
								pjtr->bin.pushTmpreg();
							}else{
								if(!pjtr->bin.tPush(ktype.id)) return false;
								ktype.id = VOID_TYPEID;
							}
						}
					}
					break;
				default:
					return false;
				}
				break;
			case RET_TOKEN:
				ktype.id = TokenToTypeId(stree.crp->rettype.data(), idx=0);
				if(REF_TYPEID >= ktype.id && ktype.id >= DYNLIST_TYPEID){
					pjtr->bin.popTmpRef(
						ktype.id == DYNREF_TYPEID
						|| ktype.id == DYNLIST_TYPEID);
				}if(iap[i-1] != RET_TOKEN){
					if(stree.frp == stree.root){
						*(intptr_t*)(pjtr->bin.code.data()+pjtr->glbbp) +=
							pjtr->bin.code.size();
					}else{
						if(!pjtr->bin.tPop(ktype.id)) return false;
					}
				}
				if(
					stree.frp == stree.root || (
						stree.frp->parent == stree.root
						&& stree.crp->selftype != DELEGATE_BLOCK))
				{
					if(
						ktype.id == DYNREF_TYPEID
						|| ktype.id == DYNLIST_TYPEID)
					{
						pjtr->bin.removeStackTop(sizeof(intptr_t));
					}else{
						pjtr->bin.popToTmpreg();
					}
					pjtr->bin.popToAdrreg();
				}
				if(stree.frp == stree.root){
					pjtr->bin.Return(0, true);
				}else if(stree.crp->selftype == DELEGATE_BLOCK){
					pjtr->bin.popToBasereg();
					pjtr->bin.popToThisreg();
					pjtr->bin.Return(0, false);
				}else{
					if(retcall == nullptr){
						pjtr->bin.Return(Aligner(stree.GetMemberSize()), true);
					}else{
						pjtr->bin.KansuStackClear(stree.GetMemberSize());
						if(retcall->byteadress == 0){
							retcall->backpatch += pjtr->bin.Jump(0);
						}else{
							pjtr->bin.Jump(retcall->byteadress);
						}
					}
				}
				break;
			case DOLLAR_TOKEN:
			case SEMICOLON_TOKEN:
				if(!KTDrop(stree, ktype)) return false;
				tystack.pop_back();
				break;
			case SHARP_TOKEN:
				tmpb =
					TMPREF_TYPEID >= ktype.id && ktype.id >= TMPDYNLIST_TYPEID;
				if(tmpb) ktype.id += REF_TYPEID - TMPREF_TYPEID;
				switch(ktype.id){
				case REF_TYPEID:
				case LIST_TYPEID:
					if(tmpb) pjtr->bin.dup(sizeof(Reference));
					SoushokuTobasi(ktype.kwsk.data(), idx=0);
					if(
						ktype.kwsk[idx] != REF_TOKEN
						&& ktype.kwsk[idx] != LIST_TOKEN)
					{
						return false;
					}
					idx++;
					type.clear();
					type.append(ktype.kwsk.data()+idx, ktype.kwsk.size()-idx);
					switch(stree.GetTypeSize(type)){
					case 1: pjtr->bin.PluginCall((void*)RefLenS1); break;
					case 2: pjtr->bin.PluginCall((void*)RefLenS2); break;
					case 3: pjtr->bin.PluginCall((void*)RefLenS3); break;
					case 4: pjtr->bin.PluginCall((void*)RefLenS4); break;
					case 5: pjtr->bin.PluginCall((void*)RefLenS5); break;
					case 6: pjtr->bin.PluginCall((void*)RefLenS6); break;
					case 7: pjtr->bin.PluginCall((void*)RefLenS7); break;
					case 8: pjtr->bin.PluginCall((void*)RefLenS8); break;
					case 9: pjtr->bin.PluginCall((void*)RefLenS9); break;
					case 10: pjtr->bin.PluginCall((void*)RefLenS10); break;
					case 11: pjtr->bin.PluginCall((void*)RefLenS11); break;
					case 12: pjtr->bin.PluginCall((void*)RefLenS12); break;
					case 13: pjtr->bin.PluginCall((void*)RefLenS13); break;
					case 14: pjtr->bin.PluginCall((void*)RefLenS14); break;
					case 15: pjtr->bin.PluginCall((void*)RefLenS15); break;
					case 16: pjtr->bin.PluginCall((void*)RefLenS16); break;
					default:
						pjtr->bin.PushImm(stree.GetTypeSize(type));
						pjtr->bin.PluginCall((void*)RefLen);
						break;
					}
					if(tmpb){
						pjtr->bin.setAdrregStackTopAddress();
						pjtr->bin.push();
						if(
							!RefCountDown(
								stree, BinaryCode::AT_SANSHOU, 0,
								ktype.kwsk, false))
						{
							return false;
						}
						pjtr->bin.pop();
						pjtr->bin.removeStackTop(sizeof(Reference));
					}
					ktype.id = ADDRESS_TYPEID;
					tystack.back() = ktype.id;
					break;
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					if(tmpb) pjtr->bin.dup(sizeof(DynamicRef));
					pjtr->bin.PushImm((intptr_t)pjtr->root);
					pjtr->bin.PluginCall((void*)DynRefLen);
					if(tmpb){
						pjtr->bin.setAdrregStackTopAddress();
						pjtr->bin.push();
						if(
							!RefCountDown(
								stree, BinaryCode::AT_SANSHOU, 0,
								ktype.kwsk, false))
						{
							return false;
						}
						pjtr->bin.pop();
						pjtr->bin.removeStackTop(sizeof(DynamicRef));
					}
					ktype.id = ADDRESS_TYPEID;
					tystack.back() = ktype.id;
					break;
				case UBYTE_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
				case UINT_TYPEID: case ULONG_TYPEID:
				case BOOL_TYPEID:
					break;
				case BYTE_TYPEID:
					pjtr->bin.abs8();
					break;
				case SHORT_TYPEID:
					pjtr->bin.abs16();
					break;
				case INT_TYPEID: case ADDRESS_TYPEID:
					pjtr->bin.abs32();
					break;
				case LONG_TYPEID:
					pjtr->bin.abs64();
					break;
				case FLOAT_TYPEID: case DOUBLE_TYPEID:
					pjtr->bin.Fabs();
					break;
				default:
					return false;
				}
				ktype.memberObj = false;
				break;
			case DIFF_TOKEN:
				tmpb =
					TMPREF_TYPEID >= ktype.id && ktype.id >= TMPDYNLIST_TYPEID;
				if(tmpb) ktype.id += REF_TYPEID - TMPREF_TYPEID;
				switch(ktype.id){
				case REF_TYPEID:
				case LIST_TYPEID:
					if(tmpb) pjtr->bin.dup(sizeof(Reference));
					SoushokuTobasi(ktype.kwsk.data(), idx=0);
					if(
						ktype.kwsk[idx] != REF_TOKEN
						&& ktype.kwsk[idx] != LIST_TOKEN)
					{
						return false;
					}
					idx++;
					type.clear();
					type.append(ktype.kwsk.data()+idx, ktype.kwsk.size()-idx);
					pjtr->bin.PushImm(stree.GetTypeSize(type));
					pjtr->bin.PluginCall((void*)RefOffset);
					if(tmpb){
						pjtr->bin.setAdrregStackTopAddress();
						pjtr->bin.push();
						if(
							!RefCountDown(
								stree, BinaryCode::AT_SANSHOU, 0,
								ktype.kwsk, false))
						{
							return false;
						}
						pjtr->bin.pop();
						pjtr->bin.removeStackTop(sizeof(Reference));
					}
					ktype.id = ADDRESS_TYPEID;
					tystack.back() = ktype.id;
					break;
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					if(tmpb) pjtr->bin.dup(sizeof(DynamicRef));
					pjtr->bin.PushImm((intptr_t)pjtr->root);
					pjtr->bin.PluginCall((void*)DynRefOffset);
					if(tmpb){
						pjtr->bin.setAdrregStackTopAddress();
						pjtr->bin.push();
						if(
							!RefCountDown(
								stree, BinaryCode::AT_SANSHOU, 0,
								ktype.kwsk, false))
						{
							return false;
						}
						pjtr->bin.pop();
						pjtr->bin.removeStackTop(sizeof(DynamicRef));
					}
					ktype.id = ADDRESS_TYPEID;
					tystack.back() = ktype.id;
					break;
				default:
					return false;
				}
				ktype.memberObj = false;
				break;
			case IDNAME_TOKEN:
				if(!JidouCast(stree, tystack, INT_TYPEID, ktype.id)){
					return false;
				}
				pjtr->bin.allocStackTop(sizeof(Reference));
				pjtr->bin.pushStackTopAddress();
				(void)pjtr->bin.tPush(ktype.id);
				pjtr->bin.PushImm((intptr_t)pjtr->root);
				pjtr->bin.PluginCall((void*)IdName);
				ktype.id = TMPREF_TYPEID;
				ktype.kwsk = REF_TOKEN;
				ktype.kwsk += CHAR_TOKEN;
				tystack.back() = REF_TYPEID;
				ktype.memberObj = false;
				break;
			case QUOTDOUBLE_TOKEN:
				pjtr->bin.allocStackTop(sizeof(Reference));
				pjtr->bin.pushStackTopAddress();
				switch(ktype.id){
				case BYTE_TYPEID: case SHORT_TYPEID:
				case INT_TYPEID: case LONG_TYPEID: case ADDRESS_TYPEID:
					(void)JidouCast(stree, tystack, LONG_TYPEID, ktype.id);
					(void)pjtr->bin.tPush(ktype.id);
					pjtr->bin.PluginCall((void*)IntToStr);
					break;
				case UBYTE_TYPEID: case USHORT_TYPEID:
				case UINT_TYPEID: case ULONG_TYPEID:
					(void)JidouCast(stree, tystack, ULONG_TYPEID, ktype.id);
					(void)pjtr->bin.tPush(ktype.id);
					pjtr->bin.PluginCall((void*)UintToStr);
					break;
				case CHAR_TYPEID:
					(void)pjtr->bin.tPush(ktype.id);
					pjtr->bin.PluginCall((void*)CharToStr);
					break;
				case FLOAT_TYPEID:
					(void)pjtr->bin.tPush(ktype.id);
					pjtr->bin.PluginCall((void*)FloatToStr);
					break;
				case DOUBLE_TYPEID:
					(void)pjtr->bin.tPush(ktype.id);
					pjtr->bin.PluginCall((void*)DoubleToStr);
					break;
				case BOOL_TYPEID:
					(void)pjtr->bin.tPush(ktype.id);
					pjtr->bin.PluginCall((void*)BoolToStr);
					break;
				default:
					return false;
				}
				ktype.id = TMPREF_TYPEID;
				ktype.kwsk = REF_TOKEN;
				ktype.kwsk += CHAR_TOKEN;
				tystack.back() = REF_TYPEID;
				ktype.memberObj = false;
				break;
			case TYPESIZE_TOKEN:
				if(
					tystack.back() == UNKNOWN_TYPEID || (
						ktype.id != DYNREF_TYPEID
						&& ktype.id != DYNLIST_TYPEID))
				{
					return false;
				}
				pjtr->bin.PushImm((intptr_t)pjtr->root);
				pjtr->bin.PluginCall((void*)DynRefTypeSize);
				tystack.back() = ktype.id = ADDRESS_TYPEID;
				ktype.memberObj = false;
				break;
			case TYPEID_TOKEN:
				if(
					tystack.back() == UNKNOWN_TYPEID || (
						ktype.id != DYNREF_TYPEID
						&& ktype.id != DYNLIST_TYPEID))
				{
					return false;
				}
				pjtr->bin.removeStackTop(sizeof(Reference));
				pjtr->bin.pop();
				tystack.back() = ktype.id = INT_TYPEID;
				ktype.memberObj = false;
				break;
			case CAST_TOKEN:
				if(
					tystack.back() == UNKNOWN_TYPEID || (
						ktype.id != DYNREF_TYPEID
						&& ktype.id != DYNLIST_TYPEID))
				{
					return false;
				}
				typ.id = ktype.id;
				i++;
				if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
				i++;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					i++;
					if(iap[i] == SHOUKAKKOCLOSE_TOKEN) return false;
				}while(iap[i] != COMMA_TOKEN);
				i++;
				if(iap[i] != SHOUKAKKOCLOSE_TOKEN) return false;
				if(
					tystack.back() != UNKNOWN_TYPEID || (
						ktype.id != REF_TYPEID && (
							typ.id == DYNREF_TYPEID
							|| ktype.id != LIST_TYPEID)))
				{
					return false;
				}
				SoushokuTobasi(ktype.kwsk.data(), idx=0);
				if(
					ktype.kwsk[idx] != REF_TOKEN
					&& ktype.kwsk[idx] != LIST_TOKEN)
				{
					return false;
				}
				idx++;
				if(
					(typ.id = TokenToTypeId(ktype.kwsk.data(), idx))
					== UNKNOWN_TYPEID)
				{
					return false;
				}
				pjtr->bin.PushCadr(0);
				pjtr->bin.PushImm(typ.id);
				pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
				pjtr->bin.PluginCall((void*)DynRefGet);
				tystack.pop_back();
				tystack.back() = ktype.id = BOOL_TYPEID;
				break;
			case METHOD_TOKEN:
				if(
					tystack.back() == UNKNOWN_TYPEID || (
						ktype.id != DYNREF_TYPEID
						&& ktype.id != DYNLIST_TYPEID))
				{
					return false;
				}
				i++;
				type.clear();
				tmpi = i;
				if(!FuncToken(type, iap, i)) return false;
				for(intptr_t ii = type.size()-1; ii >= 0; ii--){
					pjtr->bin.PushImm(type[ii]);
				}
				if(!pjtr->bin.setAdrreg(BinaryCode::AT_GLOBAL, iap[i])){
					return false;
				}
				pjtr->bin.pushAdrreg();
				pjtr->bin.PushImm((intptr_t)&stree);
				pjtr->bin.PushCadr(0);
				pjtr->bin.PluginCall((void*)DynMethod);
				pjtr->bin.setTmpregReg0();
				pjtr->bin.removeStackTop(sizeof(intptr_t)*(type.size() + 3));
				bp1 = pjtr->bin.FalseJump(0);
				pjtr->bin.PluginCall((void*)RefPos);
				pjtr->bin.setAdrregReg0();
				tystack.back() = 0;
				tystack += tmpi;
				tystack += SYSTEMUSED_TYPEID;
				ktype.id = VOID_TYPEID;
				tystack[tystack.size()-3] = pjtr->bin.dynMethodSub1(bp1);
				break;
			case COLOCOLO_TOKEN:
				{
					auto oldMO = ktype.memberObj;
					tmpb = tystack.back() != SYSTEMUSED_TYPEID;
					type = FUNC_TOKEN;
					tmpi = tystack[tystack.size() - (tmpb ? 3 : 2)];
					if (!FuncToken(type, iap, tmpi)) return false;
					i++;
					ktype.kwsk = type;
					pjtr->bin.pushThisreg();
					if (
						(
							idx = KansuuPointer(
							stree, iap, i, tystack, ktype,
							nullptr, waketa, tmprefl)) < 0)
					{
						return false;
					}
					pjtr->bin.setThisregStack(
						idx + sizeof(intptr_t)*(tmpb ? 2 : 1));
					pjtr->bin.setReg0Stack(
						idx + sizeof(intptr_t)*(tmpb ? 3 : 2));
					pjtr->bin.call();
					if (!KansuunoatonoTmprf(stree, ktype, idx, 0, tmprefl)){
						return false;
					}
					pjtr->bin.popToThisreg();
					if (tmpb) pjtr->bin.popToAdrreg();
					pjtr->bin.removeStackTop(sizeof(intptr_t) * 2);
					if (tmpb) pjtr->bin.pushAdrreg();
					PushTmpRef(ktype);
					ktype.memberObj = oldMO;
					if (!oldMO || stree.frp->rettype[0] != WARU_TOKEN){
						kakeruRemove(ktype.kwsk);
						ktype.memberObj = false;
					}
				}
				break;
			case BACKSLA_TOKEN:
				if(!KTDrop(stree, ktype)) return false;
				tystack.pop_back();
				tystack.pop_back();
				tystack.pop_back();
				*(intptr_t*)(pjtr->bin.code.data()+tystack.back()) +=
					pjtr->bin.code.size();
				tystack.back() = ktype.id = BOOL_TYPEID;
				if(!pjtr->bin.tPop(ktype.id)) return false;
				break;
			case WAIT_TOKEN:
				i++;
				if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
				pjtr->bin.tPush(ktype.id);
				ktype.id = VOID_TYPEID;
				do{
					i++;
					tystack += UNKNOWN_TYPEID;
					do{
						if(
							!MainSwitch(
								stree, iap, i, tystack, ktype, retcall))
						{
							return false;
						}
						i++;
					}while(
						iap[i] != SHOUKAKKOCLOSE_TOKEN
						&& iap[i] != COMMA_TOKEN);
					if(tystack.back() == UNKNOWN_TYPEID) return false;
					tmpb =
						TMPREF_TYPEID >= ktype.id
						&& ktype.id >= TMPDYNLIST_TYPEID;
					if(tmpb) ktype.id += REF_TYPEID - TMPREF_TYPEID;
					if(
						ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID
						|| ktype.id == DYNREF_TYPEID
						|| ktype.id == DYNLIST_TYPEID)
					{
						pjtr->bin.pushStackTopAddress();
						pjtr->bin.PluginCall((void*)RefLock);
						pjtr->bin.pushStackTopAddress();
						pjtr->bin.PluginCall((void*)RefUnlock);
						if(tmpb){
							pjtr->bin.setAdrregStackTopAddress();
							if(
								!RefCountDown(
									stree, BinaryCode::AT_SANSHOU, 0,
									ktype.kwsk, false))
							{
								return false;
							}
						}
						if(ktype.id == REF_TYPEID || ktype.id == LIST_TYPEID){
							pjtr->bin.removeStackTop(sizeof(Reference));
						}else{
							pjtr->bin.removeStackTop(sizeof(DynamicRef));
						}
					}else if(ENDTHREAD_TYPEID <= ktype.id && ktype.id < 0){
						pjtr->bin.push();
						pjtr->bin.PluginCall((void*)ThreadWait);
					}else{
						return false;
					}
					tystack.resize(tystack.size()-2);
					ktype.id = VOID_TYPEID;
				}while(iap[i] != SHOUKAKKOCLOSE_TOKEN);
				tystack += VOID_TYPEID;
				break;
			case CONSTEVAL_TOKEN:
				i++;
				if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
				i++;
				tystack += UNKNOWN_TYPEID;
				pjtr->bin.tPush(ktype.id);
				ktype.id = VOID_TYPEID;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					i++;
					if(iap[i] == SHOUKAKKOCLOSE_TOKEN) return false;
				}while(iap[i] != COMMA_TOKEN);
				i++;
				if(iap[i] != COMMA_TOKEN) return false;
				i++;
				if(tystack.back() != UNKNOWN_TYPEID) return false;
				typ = ktype;
				ktype.id = VOID_TYPEID;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					i++;
				}while(iap[i] != SHOUKAKKOCLOSE_TOKEN);
				type = REF_TOKEN;
				type += WARU_TOKEN;
				type += CHAR_TOKEN;
				if(
					!stree.YuruiKataCheck(
						ktype.kwsk, type, *pjtr->filename, pjtr->gyousuu))
				{
					return false;
				}
				SoushokuTobasi(typ.kwsk.data(), idx=0);
				indt = idx;
				switch(TokenToTypeId(typ.kwsk.data(), idx)){
				case REF_TYPEID:
				case LIST_TYPEID:
				case DYNREF_TYPEID:
				case DYNLIST_TYPEID:
					pjtr->addErrMes(L("constevalに参照型は使えません。"));
					return false;
				case METHOD_TYPEID:
					idx++;
				case FUNC_TYPEID:
				case DELEGATE_TYPEID:
					type.clear();
					if(!FuncToken(type, typ.kwsk.data(), idx)) return false;
					break;
				case UNKNOWN_TYPEID:
					return false;
				}
				tmpi = idx - indt;
				for(idx--; idx >= indt; idx--){
					pjtr->bin.PushImm(typ.kwsk[idx]);
				}
				pjtr->bin.PushImm((intptr_t)&stree);
				pjtr->bin.PushCadr(0);
				pjtr->bin.PluginCall((void*)ConstEval);
				pjtr->bin.removeStackTop(sizeof(intptr_t)*(tmpi + 6));
				tystack.resize(tystack.size()-2);
				tystack.back() = ktype.id = BOOL_TYPEID;
				ktype.memberObj = false;
				break;
			case CHUUKAKKOOPEN_TOKEN:
				i++;
				pst = stree.children[iap[i]];
				switch(pst->selftype){
				case NORMAL_BLOCK:
					if(!pjtr->ncom.FuncTreeCompile(*pst)) return false;
					break;
				case BRANCH_BLOCK:
					if(!pjtr->brcom.FuncTreeCompile(*pst)) return false;
					break;
				case LOOP_BLOCK:
					if(!pjtr->lpcom.FuncTreeCompile(*pst)) return false;
					break;
				case LOCK_BLOCK:
					i++;
					if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
					indt = 0;
					pjtr->bin.tPush(ktype.id);
					ktype.id = VOID_TYPEID;
					do{
						i++;
						tystack += UNKNOWN_TYPEID;
						do{
							if(
								!MainSwitch(
									stree, iap, i, tystack, ktype, retcall))
							{
								return false;
							}
							i++;
						}while(
							iap[i] != SHOUKAKKOCLOSE_TOKEN
							&& iap[i] != COMMA_TOKEN);
						tmpb =
							TMPREF_TYPEID >= ktype.id
							&& ktype.id >= TMPDYNLIST_TYPEID;
						if(tmpb) ktype.id += REF_TYPEID - TMPREF_TYPEID;
						if(
							tystack.back() == UNKNOWN_TYPEID
							|| tystack.back() == BOOL_TYPEID || (
								ktype.id != REF_TYPEID
								&& ktype.id != LIST_TYPEID
								&& ktype.id != DYNREF_TYPEID
								&& ktype.id != DYNLIST_TYPEID))
						{
							return false;
						}
						tystack.pop_back();
						tystack.pop_back();
						pjtr->bin.pushStackTopAddress();
						pjtr->bin.PluginCall((void*)RefLock);
						if(!tmpb){
							pjtr->bin.pushStackTopAddress();
							pjtr->bin.PluginCall((void*)RefCntUp);
						}
						{
							intptr_t foo =
								stree.crp->GetMemberOffset(
									pst->sonota.ichijihensuu)
								+ indt*(sizeof(DynamicRef)+sizeof(intptr_t));
							pjtr->bin.popToMem(
								BinaryCode::AT_LOCAL, foo,
								ktype.id == DYNREF_TYPEID
								|| ktype.id == DYNLIST_TYPEID
								? sizeof(DynamicRef) : sizeof(Reference));
							bp1 =
								pjtr->bin.MovHnsCadr(
									BinaryCode::AT_LOCAL,
									foo+sizeof(DynamicRef), 0);
							bp2 = pjtr->bin.Jump(0);
							*(intptr_t*)(pjtr->bin.code.data()+bp1) +=
								pjtr->bin.code.size();
							(void)pjtr->bin.setAdrreg(
								BinaryCode::AT_LOCAL, foo);
							pjtr->bin.pushAdrreg();
							pjtr->bin.PluginCall((void*)RefUnlock);
						}
						if(
							!RefCountDown(
								stree, BinaryCode::AT_SANSHOU, 0,
								ktype.kwsk, false))
						{
							return false;
						}
						pjtr->bin.Return(0, false);
						*(intptr_t*)(pjtr->bin.code.data()+bp2) +=
							pjtr->bin.code.size();
						indt++;
						ktype.id = VOID_TYPEID;
					}while(iap[i] != SHOUKAKKOCLOSE_TOKEN);
					pst->hikisuucount = (int)indt;
					if(!pjtr->lkcom.FuncTreeCompile(*pst)) return false;
					break;
				case SWITCH_BLOCK:
					i++;
					if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
					i++;
					tystack += WILDCARD_TYPEID;
					pjtr->bin.tPush(ktype.id);
					ktype.id = VOID_TYPEID;
					do{
						if(
							!MainSwitch(
								stree, iap, i, tystack, ktype, retcall))
						{
							return false;
						}
						i++;
					}while(iap[i] != SHOUKAKKOCLOSE_TOKEN);
					if(ktype.id == VOID_TYPEID) return false;
					tystack.pop_back();
					tystack.back() = ktype.id;
					if(
						ktype.id < 0 || (
							ktype.id <= ENDCLASS_TYPEID
							&& stree.stat->funclist.Get(ktype.id)->selftype
							!= ENUM_BLOCK))
					{
						return false;
					}
					pst->extswitch->swtype = ktype.id;
					(void)pjtr->bin.tPush(ktype.id);
					ktype.id = VOID_TYPEID;
					if(!pjtr->swcom.FuncTreeCompile(*pst)) return false;
					tystack.pop_back();
					break;
				case DELEGATE_BLOCK:
					bp1 = pjtr->bin.Jump(0);
					if(!pjtr->dgcom.FuncTreeCompile(*pst)) return false;
					*(intptr_t *)(pjtr->bin.code.data()+bp1) +=
						pjtr->bin.code.size();
					ktype.pstre = &stree;
					break;
				default:
					return false;
				}
				i++;
				if(iap[i] != CHUUKAKKOCLOSE_TOKEN) return false;
				break;
			case SHOUKAKKOOPEN_TOKEN:
				i++;
				if(iap[i] < 0){
					pst = stree.stat->funclist.Get((int32_t)~iap[i]);
					i++;
					tmpb = stree.frp != stree.root && !stree.frp->touka;
					if(tmpb){
						if(!pjtr->bin.tPush(ktype.id)) return false;
						ktype.id = VOID_TYPEID;
						pjtr->bin.pushThisreg();
					}
					if(
						(
							idx = Kansuu(
								stree, iap, i, tystack,
								ktype, *pst, false, false, tmprefl, true)) < 0)
					{
						return false;
					}
					if(tmpb){
						(void)pjtr->bin.setThisreg(BinaryCode::AT_LOCAL, 0);
					}
					pjtr->bin.FuncCall(pst->byteadress, pst->backpatch);
					if(!KansuunoatonoTmprf(stree, ktype, idx, 0, tmprefl)){
						return false;
					}
					if(tmpb) pjtr->bin.popToThisreg();
					PushTmpRef(ktype);
				}else{
					typ.id = TokenToTypeId(iap, i);
					if(!Cast(stree, tystack, typ.id, ktype.id)) return false;
				}
				break;
			case KAKKOCOLOOPEN_TOKEN:
				i++;
				tmpb = ktype.id == DELEGATE_TYPEID;
				typ.id = ktype.id;
				tystack.pop_back();
				if(
					(
						tmpi = KansuuPointer(
							stree, iap, i, tystack,
							ktype, stree.frp, waketa, tmprefl)) < 0)
				{
					return false;
				}
				if(
					typ.id == METHOD_TYPEID
					&& stree.frp->rettype[0] == WARU_TOKEN
					&& !IsReadOnlyToken((TokenKind)waketa[0][0]))
				{
					return false;
				}
				if(tmpi > 0){
					if(tmpb){
						pjtr->bin.pushStack(tmpi+sizeof(intptr_t));
						pjtr->bin.setReg0Stack(tmpi+sizeof(intptr_t));
					}else{
						pjtr->bin.setReg0Stack(tmpi);
					}
					pjtr->bin.call();
					if(
						!KansuunoatonoTmprf(
							stree, ktype, tmpb ? -tmpi : tmpi,
							tmpb ? 0 : sizeof(intptr_t), tmprefl))
					{
						return false;
					}
				}else{
					pjtr->bin.CallStk();
					if(!KansuunoatonoTmprf(stree, ktype, 0, 0, tmprefl)){
						return false;
					}
				}
				PushTmpRef(ktype);
				ktype.memberObj = typ.id == METHOD_TYPEID;
				if (!ktype.memberObj || stree.frp->rettype[0] != WARU_TOKEN){
					kakeruRemove(ktype.kwsk);
					ktype.memberObj = false;
				}
				break;
			case LIB_TOKEN:
			case GLOBAL_TOKEN:
				tmptk = (TokenKind)iap[i];
				i++;
				if(tmptk == LIB_TOKEN){
					pst = (SrcTree*)iap[i];
					i++;
				}
				while(iap[i] == GLOBAL_TOKEN) i++;
				ktype.memberObj = false;
				if(iap[i] == SHOUKAKKOOPEN_TOKEN){
					i++;
					if(iap[i] >= 0) return false;
					pst = stree.stat->funclist.Get((int32_t)~iap[i]);
					i++;
					if(!pst->isEnable()) return false;
					if(
						(
							typ.id = TokenToTypeId(
								pst->rettype.data(), idx=0))
						== UNKNOWN_TYPEID)
					{
						return false;
					}
					if(
						stree.frp != stree.root && typ.id == VOID_TYPEID
						&& IsVoidHikinashiRet(iap, i))
					{
						if(tystack.size() > 0) return false;
						if(
							TokenToTypeId(stree.frp->rettype.data(), idx=0)
							!= VOID_TYPEID)
						{
							return false;
						}
						retcall = pst;
					}else{
						if(
							(
								idx = Kansuu(
									stree, iap, i, tystack, ktype, *pst,
									false, false, tmprefl, false)) < 0)
						{
							return false;
						}
						pjtr->bin.FuncCall(pst->byteadress, pst->backpatch);
						if(!KansuunoatonoTmprf(stree, ktype, idx, 0, tmprefl)){
							return false;
						}
						PushTmpRef(ktype);
					}
				}else{
					if(iap[i] >= 0){
						return
							MainSwitch(stree, iap, i, tystack, ktype, retcall);
					}
					indt = ~iap[i];
					pst = (tmptk == LIB_TOKEN ? pst : stree.root);
					int protect =
						tmptk == LIB_TOKEN
						&& IsReadOnlyToken(
							(TokenKind)pst->funchensuu[indt].type[0])
						? 1 + (int)(pst->funchensuu[indt].type[1] == AND_TOKEN)
						: 0;
					tmpi = pst->extroot->golbalgeta;
					for(;;){
						tmpi += pst->GetMemberOffset(indt);
						if(iap[i+1] != POINT_TOKEN) break;
						i += 2;
						if(iap[i] == MEMBER_TOKEN) i++;
						if(iap[i] == SHOUKAKKOOPEN_TOKEN){
							i++;
							if(iap[i] >= 0) return false;
							pst = stree.stat->funclist.Get((int32_t)~iap[i]);
							i++;
							if(
								!pst->isEnable() && (
									pst = pst->GetIjousaki(tmpi)) == nullptr)
							{
								return false;
							}
							if(protect > 0 && pst->rettype[0] != WARU_TOKEN){
								return false;
							}
							if(!pjtr->bin.tPush(ktype.id)) return false;
							ktype.id = VOID_TYPEID;
							pjtr->bin.pushThisreg();
							if(
								(
									idx = Kansuu(
										stree, iap, i, tystack, ktype, *pst,
										protect > 0, false, tmprefl, false)) < 0)
							{
								return false;
							}
							(void)pjtr->bin.setThisreg(
								BinaryCode::AT_GLOBAL, tmpi);
							pjtr->bin.FuncCall(
								pst->byteadress, pst->backpatch);
							if(
								!KansuunoatonoTmprf(
									stree, ktype, idx, 0, tmprefl))
							{
								return false;
							}
							pjtr->bin.popToThisreg();
							PushTmpRef(ktype);
							break;
						}
						if(iap[i] >= 0) return false;
						SoushokuTobasi(
							pst->funchensuu[indt].type.data(), idx=0);
						if(
							pst->funchensuu[indt].type[idx] != AND_TOKEN
							&& pst->funchensuu[indt].type[idx] != OR_TOKEN)
						{
							return false;
						}
						idx++;
						typ.id = (int32_t)pst->funchensuu[indt].type[idx];
						pst = stree.stat->funclist.Get(typ.id);
						indt = ~iap[i];
						if (
							protect < 2 && (
								pst->funchensuu[indt].type[0]
								== CONST_TOKEN
								|| (
									stree.frp->parent != pst
									&& pst->funchensuu[indt].type[0]
									== WARU_TOKEN)))
						{
							protect =
								1 + (int)(
									pst->funchensuu[indt].type[1]
									== AND_TOKEN);
						}
					}
					if(iap[i] >= 0) break;
					if(
						!Hensuu(
							stree, iap, i, tystack, ktype,
							BinaryCode::AT_GLOBAL, tmpi, pst, indt,
							pst->funchensuu[indt].type, protect, retcall))
					{
						return false;
					}
					break;
				}
				break;
			case MEMBER_TOKEN:
				i++;
				ktype.memberObj = true;
				if(iap[i] == SHOUKAKKOOPEN_TOKEN){
					i++;
					if(iap[i] >= 0) return false;
					pst = stree.stat->funclist.Get(~iap[i]);
					i++;
					if(!pst->isEnable()) return false;
					if(
						stree.frp->rettype[0] == WARU_TOKEN
						&& pst->rettype[0] != WARU_TOKEN)
					{
						return false;
					}
					if(
						(
							typ.id = TokenToTypeId(
								pst->rettype.data(), idx=0))
						== UNKNOWN_TYPEID)
					{
						return false;
					}
					if(
						stree.frp != stree.root && typ.id == VOID_TYPEID
						&& IsVoidHikinashiRet(iap, i))
					{
						if(tystack.size() > 0) return false;
						if(
							TokenToTypeId(stree.frp->rettype.data(), idx=0)
							!= VOID_TYPEID)
						{
							return false;
						}
						retcall = pst;
					}else{
						if(
							(
								idx = Kansuu(
									stree, iap, i, tystack, ktype, *pst,
									false, false, tmprefl, true)) < 0)
						{
							return false;
						}
						pjtr->bin.FuncCall(pst->byteadress, pst->backpatch);
						if(!KansuunoatonoTmprf(stree, ktype, idx, 0, tmprefl)){
							return false;
						}
						PushTmpRef(ktype);
					}
				}else{
					if(iap[i] >= 0){
						return
							MainSwitch(stree, iap, i, tystack, ktype, retcall);
					}
					indt = ~iap[i];
					pst = stree.frp->parent;
					int protect = stree.frp->rettype[0] == WARU_TOKEN ? 2 : 0;
					if(
						indt < pst->tpcount+pst->hikisuucount
						&& pst->funchensuu[indt].type.back() == ~DAINYUU_TOKEN)
					{
						(void)pjtr->bin.loadAdrreg(
							BinaryCode::AT_MEMBER, pst->GetMemberOffset(indt));
						type = pst->funchensuu[indt].type;
						type.pop_back();
						if(
							!Sanshou(
								stree, iap, i, tystack,
								ktype, type, protect, retcall))
						{
							return false;
						}
					}else{
						if(
							protect < 2
							&& indt < pst->tpcount+pst->hikisuucount)
						{
							protect =
								1 + (int)(
									pst->funchensuu[indt].type[0]
									== AND_TOKEN);
						}
						tmpi = 0;
						for(;;){
							tmpi += pst->GetMemberOffset(indt);
							if(iap[i+1] != POINT_TOKEN) break;
							i += 2;
							if(iap[i] == MEMBER_TOKEN) i++;
							if(iap[i] == SHOUKAKKOOPEN_TOKEN){
								i++;
								if(iap[i] >= 0) return false;
								pst = stree.stat->funclist.Get(~iap[i]);
								i++;
								if(
									!pst->isEnable() && (
										pst = pst->GetIjousaki(tmpi))
									== nullptr)
								{
									return false;
								}
								if(
									protect > 0
									&& pst->rettype[0] != WARU_TOKEN)
								{
									return false;
								}
								if(
									(
										idx = Kansuu(
											stree, iap, i, tystack, ktype,
											*pst,
											protect > 0
											&& stree.frp->rettype[0]
											!= WARU_TOKEN,
											false, tmprefl, true)) < 0)
								{
									return false;
								}
								if(tmpi > 0) pjtr->bin.constThisregAdd(tmpi);
								pjtr->bin.FuncCall(
									pst->byteadress, pst->backpatch);
								if(
									!KansuunoatonoTmprf(
										stree, ktype, idx, 0, tmprefl))
								{
									return false;
								}
								if(tmpi > 0) pjtr->bin.constThisregSub(tmpi);
								PushTmpRef(ktype);
								break;
							}
							if(iap[i] >= 0){
								return
									MainSwitch(
										stree, iap, i, tystack,
										ktype, retcall);
							}
							SoushokuTobasi(
								pst->funchensuu[indt].type.data(), idx=0);
							if(
								pst->funchensuu[indt].type[idx] != AND_TOKEN
								&& pst->funchensuu[indt].type[idx] != OR_TOKEN)
							{
								return false;
							}
							idx++;
							typ.id = (int32_t)pst->funchensuu[indt].type[idx];
							pst = stree.stat->funclist.Get(typ.id);
							indt = ~iap[i];
							if(
								protect < 2 && (
									pst->funchensuu[indt].type[0]
									== CONST_TOKEN
									|| (
										stree.frp->parent != pst
										&& pst->funchensuu[indt].type[0]
										== WARU_TOKEN)))
							{
								protect =
									1 + (int)(
										pst->funchensuu[indt].type[1]
										== AND_TOKEN);
							}
						}
						if(iap[i] >= 0) break;
						if(
							!Hensuu(
								stree, iap, i, tystack, ktype,
								BinaryCode::AT_MEMBER, tmpi, pst, indt,
								pst->funchensuu[indt].type, protect, retcall))
						{
							return false;
						}
					}
				}
				break;
			default:
				if(iap[i] >= 0) return false;
				indt = ~iap[i];
				tmpb = indt < stree.frp->tpcount+stree.frp->hikisuucount;
				for(
					pst = stree.crp; !tmpb && pst != pst->frp;
					pst = pst->parent->crp)
				{
					tmpb =
						pst->tpcount <= indt
						&& indt < pst->tpcount+pst->hikisuucount;
				}
				ktype.memberObj = false;
				if(
					tmpb
					&& stree.frp->funchensuu[indt].type.back()
					== ~DAINYUU_TOKEN)
				{
					(void)pjtr->bin.loadAdrreg(
						BinaryCode::AT_LOCAL,
						stree.crp->GetMemberOffset(indt));
					type = stree.frp->funchensuu[indt].type;
					type.pop_back();
					if(
						!Sanshou(
							stree, iap, i, tystack,
							ktype, type, 0, retcall))
					{
						return false;
					}
				}else{
					pst = &stree;
					int protect = 0;
					if (tmpb){
						protect =
							1 + (int)(
								pst->frp->funchensuu[indt].type[0]
								== AND_TOKEN);
					}
					tmpb =
						ktype.memberObj && stree.frp->rettype[0] == WARU_TOKEN
						&& pst->frp->funchensuu[indt].type[1] == AND_TOKEN;
					tmpi = stree.crp->GetMemberOffset(indt);
					for(;;){
						if(iap[i+1] != POINT_TOKEN) break;
						i += 2;
						if(iap[i] == MEMBER_TOKEN) i++;
						if(iap[i] == SHOUKAKKOOPEN_TOKEN){
							i++;
							if(iap[i] >= 0) return false;
							pst = stree.stat->funclist.Get(~iap[i]);
							i++;
							if(
								!pst->isEnable()
								&& (pst = pst->GetIjousaki(tmpi)) == nullptr)
							{
								return false;
							}
							if(protect > 0 && pst->rettype[0] != WARU_TOKEN){
								return false;
							}
							if(!pjtr->bin.tPush(ktype.id)) return false;
							ktype.id = VOID_TYPEID;
							pjtr->bin.pushThisreg();
							if(
								(
									idx = Kansuu(
										stree, iap, i, tystack,
										ktype, *pst,
										protect > 0 && (
											!ktype.memberObj
											|| stree.frp->rettype[0]
											!= WARU_TOKEN),
										false, tmprefl, ktype.memberObj)) < 0)
							{
								return false;
							}
							(void)pjtr->bin.setThisreg(
								BinaryCode::AT_LOCAL, tmpi);
							pjtr->bin.FuncCall(
								pst->byteadress, pst->backpatch);
							if(
								!KansuunoatonoTmprf(
									stree, ktype, idx, 0, tmprefl))
							{
								return false;
							}
							pjtr->bin.popToThisreg();
							PushTmpRef(ktype);
							break;
						}
						if(iap[i] >= 0) return false;
						SoushokuTobasi(
							pst->frp->funchensuu[indt].type.data(), idx=0);
						if(
							pst->frp->funchensuu[indt].type[idx] != AND_TOKEN
							&& pst->frp->funchensuu[indt].type[idx]
							!= OR_TOKEN)
						{
							return false;
						}
						idx++;
						typ.id = (int32_t)pst->frp->funchensuu[indt].type[idx];
						pst = stree.stat->funclist.Get(typ.id);
						indt = ~iap[i];
						if (
							protect < 2 && (
								pst->funchensuu[indt].type[0] == CONST_TOKEN
								|| (
									stree.frp->parent != pst
									&& pst->funchensuu[indt].type[0]
									== WARU_TOKEN)))
						{
							protect =
								1 + (int)(
									pst->funchensuu[indt].type[1]
									== AND_TOKEN);
						}
						tmpi += pst->GetMemberOffset(indt);
					}
					if (tmpb) protect = 2;
					if(iap[i] >= 0) break;
					if(
						!Hensuu(
							stree, iap, i, tystack, ktype,
							BinaryCode::AT_LOCAL, tmpi, pst, indt,
							pst->frp->funchensuu[indt].type,
							protect, retcall))
					{
						return false;
					}
				}
				break;
			}
			return true;
		}
		MEMBER bool If(SrcTree& stree, intptr_t& j)
		{
			intptr_t len, bp1, i;
			const intptr_t* iap;
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			SrcTree* retcall = nullptr;
			tystack.clear();
			iap = stree.token[j].data();
			pjtr->AddLine(stree.gyo[j]);
			ktype.id = VOID_TYPEID;
			i = 1;
			if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
			i++;
			tystack += BOOL_TYPEID;
			do{
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
				i++;
			}while(iap[i] != SHOUKAKKOCLOSE_TOKEN);
			if(ktype.id != BOOL_TYPEID) return false;
			bp1 = pjtr->bin.FalseJump(0);
			tystack.resize(tystack.size()-2);
			j++;
			iap = stree.token[j].data();
			len = stree.token[j].size();
			pjtr->AddLine(stree.gyo[j]);
			ktype.id = VOID_TYPEID;
			if(!KoubunSwitch(stree, iap, len, j)) return false;
			*(intptr_t*)(pjtr->bin.code.data()+bp1) +=
				pjtr->bin.code.size();
			return true;
		}
		MEMBER virtual bool MainLoop(
			SrcTree& stree, const intptr_t* const iap,
			const intptr_t len, intptr_t& i, SrcTree*& retcall)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			tystack.clear();
			ktype.id = VOID_TYPEID;
			for(; i < len; i++){
				if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
					return false;
				}
			}
			return true;
		}
		MEMBER virtual bool DefDel(SrcTree& stree)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			SrcTree* retcall = nullptr;
			ktype.id = VOID_TYPEID;
			for(intptr_t i = 0; i < IDX(stree.defdel.size()); i++){
				if(
					!MainSwitch(
						stree, stree.defdel.data(), i,
						tystack, ktype, retcall))
				{
					return false;
				}
			}
			return true;
		}
		MEMBER virtual bool KoubunSwitch(
			SrcTree& stree, const intptr_t* const iap,
			const intptr_t len, intptr_t& j)
		{
			intptr_t i;
			SrcTree* retcall = nullptr;
			if(iap[0] == IF_TOKEN){
				if(!If(stree, j)) return false;
			}else{
				i = 0;
				if(!MainLoop(stree, iap, len, i, retcall)) return false;
			}
			return true;
		}
	};
	class FuncCompi : public Compi
	{
	public:
		MEMBER bool FuncTreeCompile(SrcTree& stree)
		{
			intptr_t len, glbbp, bp;
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			std::WSTR tmps;
			const intptr_t* iap;
			if(!stree.kakutei){
				if(
					stree.myname[0] != L('\0')
					&& stree.GetIjousaki(len) != nullptr)
				{
					for(intptr_t i = 0; i < IDX(stree.subfunc.size()); i++){
						if(!FuncTreeCompile(*stree.subfunc[i])) return false;
					}
					return true;
				}
				pjtr->root->stat->ss->emes.Add(
					stree.srce->filename, stree.topsrcgyo, L("未定義です。"));
				return false;
			}
			if(stree.selftype == ENUM_BLOCK) return true;
			if(stree.selftype == CLASS_BLOCK || stree.isTemplate()){
				for(intptr_t i = 0; i < IDX(stree.subfunc.size()); i++){
					if(!FuncTreeCompile(*stree.subfunc[i])) return false;
				}
				return true;
			}
			pjtr->filename = &stree.srce->filename;
			pjtr->gyousuu = stree.topsrcgyo;
			stree.byteadress = pjtr->bin.code.size();
			if(tmps = L("break"), stree.myname == tmps){
				stree.parent->deladress = stree.byteadress;
				if(
					&stree != stree.root
					&& stree.parent->junkandata.size() > 0)
				{
					pjtr->root->stat->ss->CircularGC.SetPLDestructor(
						stree.parent->sonota.junkanid, stree.byteadress);
				}
			}
			pjtr->bin.PBackpatch(stree.backpatch, stree.byteadress);
			if(&stree != stree.root){
				intptr_t i = stree.tpcount;
				intptr_t size = 0, fsi = 0;
				for(; i < stree.tpcount+stree.hikisuucount; i++){
					fsi += stree.funchensuu[i].size;
				}
				for(; i < IDX(stree.funchensuu.size()); i++){
					size += stree.funchensuu[i].size;
				}
				pjtr->bin.KansuStackSet(size, fsi);
			}
			if(&stree == stree.root || stree.parent == stree.root){
				pjtr->bin.pushAdrreg();
				pjtr->bin.pushTmpreg();
			}
			for(intptr_t j = 0; j < IDX(stree.token.size()); j++){
				iap = stree.token[j].data();
				len = stree.token[j].size();
				if(len == 0) continue;
				pjtr->AddLine(stree.gyo[j]);
				if(!KoubunSwitch(stree, iap, len, j)){
					if(pjtr->root->stat->ss->emes.mes.size() == 0){
						pjtr->addErrMes(L("コンパイルエラーです。"));
					}
					return false;
				}
			}
			if(
				(
					stree.selftype == FUNC_BLOCK && (
						stree.rettype.size() > 2 || (
							stree.rettype.size() == 2
							&& !IsSoushokuToken(
								(TokenKind)stree.rettype[0]))
						|| stree.rettype.back() != VOID_TOKEN)
					|| (
						stree.hikisuucount > 0
						&& stree.hensuname[stree.tpcount][0] == L('0'))))
			{
				if(
					stree.token.size() <= 0
					|| stree.token.back().back() != RET_TOKEN
					|| (
						stree.token.size() >= 2
						&& stree.token[stree.token.size()-2][0] == IF_TOKEN))
				{
					pjtr->addErrMes(L("retがありません。"));
					return false;
				}
			}else{
				ktype.id = VOID_TYPEID;
				if(&stree == stree.root && stree.defdel.size() > 0){
					bp = pjtr->bin.PushCadr(0);
					pjtr->bin.PushImm((intptr_t)pjtr->root->stat->ss);
					pjtr->bin.PluginCall((void*)PutGbld);
					glbbp = pjtr->bin.Jump(0);
					*(intptr_t*)(pjtr->bin.code.data()+bp) +=
						pjtr->bin.code.size();
					pjtr->bin.pushAdrreg();
					pjtr->bin.pushTmpreg();
				}
				if(!DefDel(stree)){
					pjtr->addErrMes(L("コンパイルエラー。"));
					return false;
				}
				if(&stree == stree.root){
					if(stree.defdel.size() > 0){
						*(intptr_t*)(pjtr->bin.code.data()+glbbp) +=
							pjtr->bin.code.size();
					}
					pjtr->bin.popToTmpreg();
					pjtr->bin.popToAdrreg();
					pjtr->bin.Return(0, true);
				}else{
					if(stree.parent == stree.root){
						pjtr->bin.popToTmpreg();
						pjtr->bin.popToAdrreg();
					}
					pjtr->bin.Return(Aligner(stree.GetMemberSize()), true);
				}
			}
			for(intptr_t i = 0; i < IDX(stree.subfunc.size()); i++){
				if(!FuncTreeCompile(*stree.subfunc[i])) return false;
			}
			{
				std::vector<std::basic_string<intptr_t>> dummy;
				stree.token.swap(dummy);
			}
			{
				std::basic_string<intptr_t> dummy;
				stree.gyo.swap(dummy);
			}
			return true;
		}
	};
	class NormalCompi : public Compi
	{
	protected:
		MEMBER bool Break(
			SrcTree &stree, const intptr_t *const iap, const intptr_t len,
			intptr_t &i, std::basic_string<int32_t> &tystack,
			KuwashiiType &ktype, SrcTree *&retcall)
		{
			i++;
			if(stree.breakin) stree.breakpatch += pjtr->bin.Call(0);
			while(
				iap[i] < 0 || iap[i] == GLOBAL_TOKEN
				|| iap[i] == MEMBER_TOKEN)
			{
				for(; ; i++){
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					if(iap[i] == SEMICOLON_TOKEN) break;
				}
				i++;
			}
			if(iap[i] == COMMA_TOKEN){
				i++;
				switch(stree.parent->selftype){
				case FUNC_BLOCK:
					if(
						!pjtr->fcom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				case NORMAL_BLOCK:
					if(
						!pjtr->ncom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				case LOCK_BLOCK:
					if(
						!pjtr->lkcom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				case SWITCH_BLOCK:
					if(
						!pjtr->swcom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				case BRANCH_BLOCK:
					if(
						!pjtr->brcom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				case LOOP_BLOCK:
					if(
						!pjtr->lpcom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				case DELEGATE_BLOCK:
					if(
						!pjtr->dgcom.MainLoop(
							*stree.parent, iap, len, i, retcall))
					{
						return false;
					}
					break;
				default:
					return false;
				}
			}else{
				if(iap[i] != SEMICOLON_TOKEN) return false;
				i++;
			}
			stree.backpatch += pjtr->bin.Jump(0);
			return true;
		}
	public:
		MEMBER virtual bool MainLoop(
			SrcTree& stree, const intptr_t* const iap, const intptr_t len,
			intptr_t& i, SrcTree*& retcall)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			tystack.clear();
			ktype.id = VOID_TYPEID;
			for(; i < len; i++){
				if(iap[i] == BREAK_TOKEN){
					if(!Break(stree, iap, len, i, tystack, ktype, retcall)){
						return false;
					}
				}else{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
				}
			}
			return true;
		}
		MEMBER virtual bool KoubunSwitch(
			SrcTree& stree, const intptr_t* const iap,
			const intptr_t len, intptr_t& j)
		{
			SrcTree* retcall = nullptr;
			if(iap[0] == BREAK_TOKEN && iap[1] == COLON_TOKEN){
				stree.breakpatch += pjtr->bin.Call(0);
				if(!DefDel(stree)) return false;
				stree.backpatch += pjtr->bin.Jump(0);
				pjtr->bin.PBackpatch(stree.breakpatch, pjtr->bin.code.size());
			}else{
				if(!Compi::KoubunSwitch(stree, iap, len, j)) return false;
			}
			return true;
		}
		MEMBER bool FuncTreeCompile(SrcTree& stree)
		{
			intptr_t len;
			std::basic_string<int32_t> tystack;
			const intptr_t* iap;
			stree.byteadress = pjtr->bin.code.size();
			for(intptr_t j = 0; j < IDX(stree.token.size()); j++){
				iap = stree.token[j].data();
				len = stree.token[j].size();
				if(len == 0) continue;
				pjtr->AddLine(stree.gyo[j]);
				if(!KoubunSwitch(stree, iap, len, j)) return false;
			}
			if(stree.breakin){
				pjtr->bin.Return(0, false);
			}else{
				if(!DefDel(stree)) return false;
			}
			pjtr->bin.PBackpatch(stree.backpatch, pjtr->bin.code.size());
			{
				std::vector<std::basic_string<intptr_t>> dummy;
				stree.token.swap(dummy);
			}
			{
				std::basic_string<intptr_t> dummy;
				stree.gyo.swap(dummy);
			}
			return true;
		}
	};
	class LockCompi : public NormalCompi
	{
	public:
		MEMBER virtual bool DefDel(SrcTree &stree)
		{
			intptr_t i;
			if(!NormalCompi::DefDel(stree)) return false;
			for(i = 0; i < stree.hikisuucount; i++){
				pjtr->bin.PushHns(
					BinaryCode::AT_LOCAL, stree.crp->GetMemberOffset(
						stree.sonota.ichijihensuu)+i*(sizeof(DynamicRef)
						+ sizeof(intptr_t)) + sizeof(DynamicRef));
				pjtr->bin.CallStk();
			}
			return true;
		}
		MEMBER virtual bool MainLoop(
			SrcTree& stree, const intptr_t* const iap, const intptr_t len,
			intptr_t& i, SrcTree*& retcall)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			tystack.clear();
			ktype.id = VOID_TYPEID;
			intptr_t j;
			for(; i < len; i++){
				if(iap[i] == BREAK_TOKEN){
					i++;
					if(stree.breakin) stree.breakpatch += pjtr->bin.Call(0);
					while(
						iap[i] < 0 || iap[i] == GLOBAL_TOKEN
						|| iap[i] == MEMBER_TOKEN)
					{
						for(; ; i++){
							if(
								!MainSwitch(
									stree, iap, i, tystack, ktype, retcall))
							{
								return false;
							}
							if(iap[i] == SEMICOLON_TOKEN) break;
						}
						i++;
					}
					for(j = 0; j < stree.hikisuucount; j++){
						pjtr->bin.PushHns(
							BinaryCode::AT_LOCAL, stree.crp->GetMemberOffset(
								stree.sonota.ichijihensuu)
							+ j * (sizeof(DynamicRef) + sizeof(intptr_t))
							+ sizeof(DynamicRef));
						pjtr->bin.CallStk();
					}
					if(iap[i] == COMMA_TOKEN){
						i++;
						switch(stree.parent->selftype){
						case FUNC_BLOCK:
							if(
								!pjtr->fcom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						case NORMAL_BLOCK:
							if(
								!pjtr->ncom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						case LOCK_BLOCK:
							if(
								!pjtr->lkcom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						case SWITCH_BLOCK:
							if(
								!pjtr->swcom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						case BRANCH_BLOCK:
							if(
								!pjtr->brcom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						case LOOP_BLOCK:
							if(
								!pjtr->lpcom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						case DELEGATE_BLOCK:
							if(
								!pjtr->dgcom.MainLoop(
									*stree.parent, iap, len, i, retcall))
							{
								return false;
							}
							break;
						default:
							return false;
						}
					}else{
						if(iap[i] != SEMICOLON_TOKEN) return false;
						i++;
					}
					stree.backpatch += pjtr->bin.Jump(0);
				}else{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
				}
			}
			return true;
		}
	};
	class SwitchCompi : public NormalCompi
	{
		MEMBER bool CaseTable(
			SrcTree& stree, const std::basic_string<bool>& ueboo,
			const uint8_t ichi, const int32_t tid)
		{
			intptr_t bp;
			std::vector<std::basic_string<int>> numbn;
			std::basic_string<bool> boo;
			bp = pjtr->bin.switchSub1(ichi);
			intptr_t tbli = pjtr->bin.code.size();
			*(intptr_t*)(pjtr->bin.code.data()+bp) += tbli;
			pjtr->bin.code.resize(pjtr->bin.code.size() + sizeof(intptr_t)*16);
			numbn.resize(16);
			for(intptr_t i = 0; i < IDX(ueboo.size()); i++){
				if(ueboo[i]) continue;
				numbn[
					(
						*(
							(uint8_t *)(stree.extswitch->atai.data()+i)
							+ (ichi>>1))
						>> (ichi&0x01)*4) & 0x0f] += i;
			}
			for(int i = 0; i < 16; i++){
				*(intptr_t *)(pjtr->bin.code.data()+tbli+sizeof(intptr_t)*i) =
					0;
				pjtr->bin.cadrpbp += tbli+sizeof(intptr_t)*i;
				if(numbn[i].size() <= 0){
					stree.extswitch->defbp += tbli+sizeof(intptr_t)*i;
				}else if(numbn[i].size() == 1){
					*(intptr_t *)(
						pjtr->bin.code.data()+tbli+sizeof(intptr_t)*i
					) +=
						pjtr->bin.code.size();
					switch(tid){
					case BYTE_TYPEID: case UBYTE_TYPEID: case BOOL_TYPEID:
						pjtr->bin.CmpImm8(
							(int8_t)stree.extswitch->atai[numbn[i][0]]);
						pjtr->bin.Equal();
						break;
					case SHORT_TYPEID: case USHORT_TYPEID: case CHAR_TYPEID:
						pjtr->bin.CmpImm(
							(int16_t)stree.extswitch->atai[numbn[i][0]], true);
						pjtr->bin.Equal();
						break;
					default:
						if(
							tid < 0 || ENDCLASS_TYPEID < tid
							|| stree.stat->funclist.Get(tid)->selftype
							!= ENUM_BLOCK)
						{
							return false;
						}
					case INT_TYPEID: case ADDRESS_TYPEID: case UINT_TYPEID:
						pjtr->bin.CmpImm(
							(int32_t)stree.extswitch->atai[numbn[i][0]],
							false);
						pjtr->bin.Equal();
						break;
					case LONG_TYPEID: case ULONG_TYPEID:
						pjtr->bin.EqualImm64(
							stree.extswitch->atai[numbn[i][0]]);
						break;
					case FLOAT_TYPEID:
						pjtr->bin.push();
						pjtr->bin.FldStk(false);
						pjtr->bin.PushImm(
							*(int32_t*)&stree.extswitch->atai[numbn[i][0]]);
						pjtr->bin.FldStk(false);
						pjtr->bin.Fcomi(); pjtr->bin.Equal();
						break;
					case DOUBLE_TYPEID:
						pjtr->bin.push64();
						pjtr->bin.FldStk(true);
						pjtr->bin.PushImm(
							(
								(int32_t*)&stree.extswitch->atai[numbn[i][0]]
							)[1]);
						pjtr->bin.PushImm(
							(
								(int32_t*)&stree.extswitch->atai[numbn[i][0]]
							)[0]);
						pjtr->bin.FldStk(true);
						pjtr->bin.Fcomi(); pjtr->bin.Equal();
						break;
					}
					if(
						IDX(stree.extswitch->ataibp.size())
						<= numbn[i][0])
					{
						stree.extswitch->ataibp.resize(numbn[i][0]+1);
					}
					stree.extswitch->ataibp[numbn[i][0]] =
						pjtr->bin.TrueJump(0);
					stree.extswitch->defbp += pjtr->bin.Jump(0);
				}
			}
			boo.resize(ueboo.size());
			for(intptr_t i = 0; i < IDX(boo.size()); i++) boo[i] = true;
			for(int i = 0; i < 16; i++){
				if(numbn[i].size() < 2) continue;
				for(intptr_t j = 0; j < IDX(numbn[i].size()); j++){
					boo[numbn[i][j]] = false;
				}
				*(intptr_t *)(pjtr->bin.code.data()+tbli+sizeof(intptr_t)*i) +=
					pjtr->bin.code.size();
				CaseTable(stree, boo, ichi+1, tid);
				for(intptr_t j = 0; j < IDX(numbn[i].size()); j++){
					boo[numbn[i][j]] = true;
				}
			}
			return true;
		}
	public:
		MEMBER virtual bool MainLoop(
			SrcTree &stree, const intptr_t *const iap,
			const intptr_t len, intptr_t &i, SrcTree *&retcall)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			ktype.id = VOID_TYPEID;
			for(; i < len; i++){
				switch(iap[i]){
				case DEFAULT_TOKEN:
					i++;
					if(stree.extswitch->def <= 0){
						stree.extswitch->defbp += pjtr->bin.Jump(0);
						stree.extswitch->def = -1;
					}else{
						pjtr->bin.Jump(stree.extswitch->def);
					}
					break;
				case BREAK_TOKEN:
					if(
						stree.extswitch->haveCaseOrDefault
						&& !stree.extswitch->teeburutukutta)
					{
						(void)pjtr->bin.tPop(stree.extswitch->swtype);
					}
					if(!Break(stree, iap, len, i, tystack, ktype, retcall)){
						return false;
					}
					break;
				default:
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					break;
				}
			}
			return true;
		}
		MEMBER virtual bool KoubunSwitch(
			SrcTree &stree, const intptr_t *const iap,
			const intptr_t len, intptr_t &j)
		{
			intptr_t sz;
			KuwashiiType ktyp;
			int32_t typ;
			int64_t t64;
			if(
				iap[0] == CASE_TOKEN || (
					iap[0] == DEFAULT_TOKEN && (
						iap[1] == COLON_TOKEN
						|| iap[1] == COLOYAJIRUSHI_TOKEN)))
			{
				if(!stree.extswitch->teeburutukutta){
					std::basic_string<bool> boo;
					for(intptr_t i = 0; i < IDX(stree.token.size()); i++){
						intptr_t ii = 0;
						if(
							stree.token[i].size() == 0
							|| stree.token[i][ii] != CASE_TOKEN)
						{
							continue;
						}
						do{
							ii++;
							if(
								(
									typ =
										TokenToTypeId(
											stree.token[i].data(), ii)) < 0)
							{
								pjtr->addErrMes(L("caseにおかしい値があります。"));
								return false;
							}
							stree.extswitch->atai += (int64_t)0;
							sz =
								stree.CastConst(
									typ,
									stree.token[i].data()+ii,
									stree.extswitch->swtype,
									&stree.extswitch->atai.back());
							if(sz < 0){
								pjtr->addErrMes(L("caseにおかしい値があります。"));
								return false;
							}
							for(
								intptr_t iii = 0;
								iii < IDX(stree.extswitch->atai.size())-1;
								iii++)
							{
								if(
									stree.extswitch->atai[iii]
									== stree.extswitch->atai.back())
								{
									pjtr->addErrMes(L("caseに同じ値があります。"));
									return false;
								}
							}
							ii += (sz + sizeof(intptr_t)-1) / sizeof(intptr_t);
						}while(stree.token[i][ii] == COMMA_TOKEN);
					}
					boo.resize(stree.extswitch->atai.size());
					for(intptr_t ii = 0; ii < IDX(boo.size()); ii++){
						boo[ii] = false;
					}
					ktyp.id = stree.extswitch->swtype;
					if(ktyp.id == FLOAT_TYPEID){
						pjtr->bin.pop();
					}else if(ktyp.id == DOUBLE_TYPEID){
						pjtr->bin.pop64();
					}else{
						pjtr->bin.tPop(ktyp.id);
						KTDrop(stree, ktyp);
					}
					if(!CaseTable(stree, boo, 0, stree.extswitch->swtype)){
						return false;
					}
					stree.extswitch->teeburutukutta = true;
				}
				if(iap[len-1] == COLOYAJIRUSHI_TOKEN){
					pjtr->bin.PBackpatch(
						stree.extswitch->tgnsuruusakibp,
						pjtr->bin.code.size());
				}else{
					stree.extswitch->tgnsuruusakibp += pjtr->bin.Jump(0);
				}
				if(iap[0] == DEFAULT_TOKEN){
					if(stree.extswitch->def > 0) return false;
					stree.extswitch->def = pjtr->bin.code.size();
					pjtr->bin.PBackpatch(
						stree.extswitch->defbp, pjtr->bin.code.size());
				}else{
					intptr_t ii = 0;
					do{
						ii++;
						if((typ = TokenToTypeId(iap, ii)) < 0) return false;
						t64 = 0;
						sz =
							stree.CastConst(
								typ, iap+ii, stree.extswitch->swtype, &t64);
						if(sz < 0) return false;
						ii += (sz + sizeof(intptr_t)-1) / sizeof(intptr_t);
						for(
							intptr_t iii = 0;
							iii < IDX(stree.extswitch->atai.size());
							iii++)
						{
							if(stree.extswitch->atai[iii] == t64){
								*(intptr_t*)(
									pjtr->bin.code.data()
									+ stree.extswitch->ataibp[iii]
								) += pjtr->bin.code.size();
								break;
							}
						}
					}while(iap[ii] == COMMA_TOKEN);
				}
			}else{
				if(iap[0] == BREAK_TOKEN && iap[1] == COLON_TOKEN){
					pjtr->bin.PBackpatch(
						stree.extswitch->tgnsuruusakibp,
						pjtr->bin.code.size());
					if(
						stree.extswitch->def < 0
						&& stree.extswitch->defbp.size() > 0)
					{
						pjtr->addErrMes(L("default:がありません。"));
						return false;
					}
					pjtr->bin.PBackpatch(
						stree.extswitch->defbp, pjtr->bin.code.size());
				}
				if(!NormalCompi::KoubunSwitch(stree, iap, len, j)){
					return false;
				}
			}
			return true;
		}
		MEMBER virtual bool DefDel(SrcTree &stree)
		{
			if(!stree.breakin){
				pjtr->bin.PBackpatch(
					stree.extswitch->tgnsuruusakibp, pjtr->bin.code.size());
				if(
					stree.extswitch->def < 0
					&& stree.extswitch->defbp.size() > 0)
				{
					pjtr->addErrMes(L("default:がありません。"));
					return false;
				}
				pjtr->bin.PBackpatch(
					stree.extswitch->defbp, pjtr->bin.code.size());
			}
			if(!NormalCompi::DefDel(stree)) return false;
			return true;
		}
		MEMBER bool FuncTreeCompile(SrcTree &stree)
		{
			if(!NormalCompi::FuncTreeCompile(stree)) return false;
			if(!stree.extswitch->teeburutukutta){
				(void)pjtr->bin.tPop(stree.extswitch->swtype);
			}
			{
				std::vector<std::basic_string<intptr_t>> dummy;
				stree.token.swap(dummy);
			}
			{
				std::basic_string<intptr_t> dummy;
				stree.gyo.swap(dummy);
			}
			return true;
		}
	};
	class BranchCompi : public NormalCompi
	{
		MEMBER void CondTable(
			SrcTree& stree, const std::basic_string<bool>& ueboo,
			const uint8_t ichi)
		{
			intptr_t tbli, bp;
			std::vector<std::basic_string<int>> numbn;
			std::basic_string<bool> boo;
			bp = pjtr->bin.switchSub1(ichi);
			tbli = pjtr->bin.code.size();
			*(intptr_t*)(pjtr->bin.code.data()+bp) += tbli;
			pjtr->bin.code.resize(pjtr->bin.code.size() + sizeof(intptr_t)*16);
			numbn.resize(16);
			for(intptr_t i = 0; i < IDX(ueboo.size()); i++){
				if(ueboo[i]) continue;
				numbn[
					(*((uint8_t *)(&i)+(ichi>>1)) >> (ichi&0x01)*4) & 0x0f
				] += i;
			}
			for(int i = 0; i < 16; i++){
				*(intptr_t *)(pjtr->bin.code.data()+tbli+sizeof(intptr_t)*i) =
					0;
				pjtr->bin.cadrpbp += tbli+sizeof(intptr_t)*i;
				if(numbn[i].size() <= 0){
					stree.extbranch->tgnelsesakibp += tbli+sizeof(intptr_t)*i;
				}else if(numbn[i].size() == 1){
					*(intptr_t *)(
						pjtr->bin.code.data()+tbli+sizeof(intptr_t)*i
					) +=
						pjtr->bin.code.size();
					pjtr->bin.CmpImm(numbn[i][0], false);
					pjtr->bin.Equal();
					stree.extbranch->labelbp[numbn[i][0]] =
						pjtr->bin.TrueJump(0);
					stree.extbranch->tgnelsesakibp += pjtr->bin.Jump(0);
				}
			}
			boo.resize(ueboo.size());
			for(intptr_t i = 0; i < IDX(boo.size()); i++) boo[i] = true;
			for(int i = 0; i < 16; i++){
				if(numbn[i].size() < 2) continue;
				for(intptr_t j = 0; j < IDX(numbn[i].size()); j++){
					boo[numbn[i][j]] = false;
				}
				*(intptr_t *)(pjtr->bin.code.data()+tbli+sizeof(intptr_t)*i) +=
					pjtr->bin.code.size();
				CondTable(stree, boo, ichi+1);
				for(intptr_t j = 0; j < IDX(numbn[i].size()); j++){
					boo[numbn[i][j]] = true;
				}
			}
		}
		MEMBER void MakeTable(SrcTree& stree)
		{
			std::basic_string<bool> boo;
			stree.extbranch->labelbp.resize(stree.extbranch->label.size());
			boo.resize(stree.extbranch->label.size());
			for(intptr_t ii = 0; ii < IDX(boo.size()); ii++) boo[ii] = false;
			(void)pjtr->bin.loadReg0_32(
				BinaryCode::AT_LOCAL,
				stree.crp->GetMemberOffset(stree.sonota.ichijihensuu));
			CondTable(stree, boo, 0);
		}
		MEMBER void LabelBP(BranchExtStruct& bes)
		{
			for(intptr_t i = 0; i < IDX(bes.labelbp.size()); i++){
				if(bes.labelbp[i] != 0){
					*(intptr_t*)(
						pjtr->bin.code.data() + bes.labelbp[i]
					) += pjtr->bin.code.size();
					bes.labelbp[i] = 0;
				}
			}
		}
	public:
		MEMBER virtual bool MainLoop(
			SrcTree& stree, const intptr_t* const iap, const intptr_t len,
			intptr_t& i, SrcTree*& retcall)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			tystack.clear();
			ktype.id = VOID_TYPEID;
			for(; i < len; i++){
				switch(iap[i]){
				case ELSE_TOKEN:
					i++;
					if(stree.extbranch->mode < 0){
						(void)pjtr->bin.MovHnsImm(
							BinaryCode::AT_LOCAL, stree.crp->GetMemberOffset(
								stree.sonota.ichijihensuu), -1, false);
						stree.extbranch->dino = -1;
					}
					stree.extbranch->tgnelsesakibp += pjtr->bin.Jump(0);
					break;
				case BREAK_TOKEN:
					if(!Break(stree, iap, len, i, tystack, ktype, retcall)){
						return false;
					}
					break;
				default:
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					break;
				}
			}
			return true;
		}
		MEMBER virtual bool KoubunSwitch(
			SrcTree& stree, const intptr_t* const iap,
			const intptr_t len, intptr_t& j)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			SrcTree* retcall = nullptr;
			intptr_t i;
			if(iap[0] == COND_TOKEN){
				stree.extbranch->bunkisita = 1;
				if(stree.extbranch->nextcond != 0){
					stree.extbranch->tgncommsakibp += pjtr->bin.Jump(0);
					*(intptr_t*)(
						pjtr->bin.code.data() + stree.extbranch->nextcond
					) += pjtr->bin.code.size();
					stree.extbranch->nextcond = 0;
				}
				if(stree.extbranch->mode < 0){
					i = 2;
				}else{
					i = 1;
				}
				ktype.id = VOID_TYPEID;
				tystack += BOOL_TYPEID;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					i++;
				}while(iap[i] != COLON_TOKEN);
				if(tystack.size() <= 0 || tystack.back() != BOOL_TYPEID){
					return false;
				}
				stree.extbranch->nextcond = pjtr->bin.FalseJump(0);
				tystack.resize(tystack.size()-2);
				ktype.id = VOID_TYPEID;
				if(stree.extbranch->mode < 0){
					(void)pjtr->bin.MovHnsImm(
						BinaryCode::AT_LOCAL,
						stree.crp->GetMemberOffset(stree.sonota.ichijihensuu),
						iap[1], false);
				}
			}else if(iap[0] == ELSE_TOKEN && iap[1] == COLON_TOKEN){
				if(stree.extbranch->commnai){
					MakeTable(stree);
					stree.extbranch->commnai = false;
				}
				stree.extbranch->tgncommsakibp += pjtr->bin.Jump(0);
				if(stree.extbranch->nextcond != 0){
					*(intptr_t *)(
						pjtr->bin.code.data() + stree.extbranch->nextcond
					) += pjtr->bin.code.size();
					stree.extbranch->nextcond = 0;
					if(
						stree.extbranch->mode < 0
						&& stree.extbranch->bunkisita > 0)
					{
						(void)pjtr->bin.MovHnsImm(
							BinaryCode::AT_LOCAL,
							stree.crp->GetMemberOffset(
								stree.sonota.ichijihensuu),
							-1, false);
					}
				}
				pjtr->bin.PBackpatch(
					stree.extbranch->tgnelsesakibp, pjtr->bin.code.size());
			}else if(iap[0] == COMM_TOKEN && iap[1] == COLON_TOKEN){
				if(stree.extbranch->nextcond != 0){
					if(
						stree.extbranch->mode < 0
						&& stree.extbranch->bunkisita > 0)
					{
						stree.extbranch->tgncommsakibp += pjtr->bin.Jump(0);
					}
					*(intptr_t *)(
						pjtr->bin.code.data()+stree.extbranch->nextcond
					) += pjtr->bin.code.size();
					stree.extbranch->nextcond = 0;
					if(
						stree.extbranch->mode < 0
						&& stree.extbranch->bunkisita > 0)
					{
						(void)pjtr->bin.MovHnsImm(
							BinaryCode::AT_LOCAL,
							stree.crp->GetMemberOffset(
								stree.sonota.ichijihensuu),
							-1, false);
					}
				}
				stree.extbranch->bunkisita = -1;
				LabelBP(*stree.extbranch);
				if(
					stree.extbranch->dino < 0
					&& stree.extbranch->tgnelsesakibp.size() > 0)
				{
					pjtr->addErrMes(L("else:がありません。"));
					return false;
				}
				pjtr->bin.PBackpatch(
					stree.extbranch->tgnelsesakibp, pjtr->bin.code.size());
				pjtr->bin.PBackpatch(
					stree.extbranch->tgncommsakibp, pjtr->bin.code.size());
				stree.extbranch->commnai = true;
				stree.extbranch->dino = 0;
			}else if(iap[0] == DIFF_TOKEN && iap[2] == COLON_TOKEN){
				if(stree.extbranch->commnai){
					MakeTable(stree);
					stree.extbranch->commnai = false;
				}
				stree.extbranch->tgncommsakibp += pjtr->bin.Jump(0);
				*(intptr_t *)(
					pjtr->bin.code.data() + stree.extbranch->labelbp[iap[1]]
				) += pjtr->bin.code.size();
				stree.extbranch->labelbp[iap[1]] = 0;
			}else{
				if(iap[0] == BREAK_TOKEN && iap[1] == COLON_TOKEN){
					LabelBP(*stree.extbranch);
					if(stree.extbranch->nextcond != 0){
						*(intptr_t*)(
							pjtr->bin.code.data() + stree.extbranch->nextcond
						) += pjtr->bin.code.size();
						stree.extbranch->nextcond = 0;
					}
					if(
						stree.extbranch->dino < 0
						&& stree.extbranch->tgnelsesakibp.size() > 0)
					{
						pjtr->addErrMes(L("else:がありません。"));
						return false;
					}
					pjtr->bin.PBackpatch(
						stree.extbranch->tgnelsesakibp, pjtr->bin.code.size());
					pjtr->bin.PBackpatch(
						stree.extbranch->tgncommsakibp, pjtr->bin.code.size());
				}
				if(!NormalCompi::KoubunSwitch(stree, iap, len, j)){
					return false;
				}
			}
			return true;
		}
		MEMBER virtual bool DefDel(SrcTree& stree)
		{
			if(!stree.breakin){
				LabelBP(*stree.extbranch);
				if(stree.extbranch->nextcond != 0){
					*(intptr_t*)(
						pjtr->bin.code.data() + stree.extbranch->nextcond
					) += pjtr->bin.code.size();
					stree.extbranch->nextcond = 0;
				}
				if(
					stree.extbranch->dino < 0
					&& stree.extbranch->tgnelsesakibp.size() > 0)
				{
					pjtr->addErrMes(L("else:がありません。"));
					return false;
				}
				pjtr->bin.PBackpatch(
					stree.extbranch->tgnelsesakibp, pjtr->bin.code.size());
				pjtr->bin.PBackpatch(
					stree.extbranch->tgncommsakibp, pjtr->bin.code.size());
			}
			if(!NormalCompi::DefDel(stree)) return false;
			return true;
		}
	};
	class LoopCompi : public NormalCompi
	{
	public:
		MEMBER virtual bool MainLoop(
			SrcTree& stree, const intptr_t* const iap,
			const intptr_t len, intptr_t& i, SrcTree*& retcall)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			tystack.clear();
			ktype.id = VOID_TYPEID;
			for(; i < len; i++){
				switch(iap[i]){
				case DO_TOKEN:
					i++;
					if(stree.extloop->doad == 0){
						stree.extloop->doadbp += pjtr->bin.Jump(0);
					}else{
						pjtr->bin.Jump(stree.extloop->doad);
					}
					break;
				case CONTINUE_TOKEN:
					i++;
					if(stree.extloop->contad == 0){
						stree.extloop->contadbp += pjtr->bin.Jump(0);
					}else{
						pjtr->bin.Jump(stree.extloop->contad);
					}
					break;
				case WHILE_TOKEN:
					i++;
					if(stree.extloop->nextad == 0){
						stree.extloop->nextadbp += pjtr->bin.Jump(0);
					}else{
						pjtr->bin.Jump(stree.extloop->nextad);
					}
					break;
				case BREAK_TOKEN:
					if(!Break(stree, iap, len, i, tystack, ktype, retcall)){
						return false;
					}
					break;
				default:
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					break;
				}
			}
			return true;
		}
		MEMBER virtual bool KoubunSwitch(
			SrcTree& stree, const intptr_t* const iap,
			const intptr_t len, intptr_t& j)
		{
			KuwashiiType ktype;
			std::basic_string<int32_t> tystack;
			SrcTree* retcall = nullptr;
			intptr_t i;
			if(iap[0] == DO_TOKEN && iap[1] == COLON_TOKEN){
				stree.extloop->doad = pjtr->bin.code.size();
				pjtr->bin.PBackpatch(
					stree.extloop->doadbp, pjtr->bin.code.size());
			}else if(iap[0] == CONTINUE_TOKEN && iap[1] == COLON_TOKEN){
				stree.extloop->contad = pjtr->bin.code.size();
				pjtr->bin.PBackpatch(
					stree.extloop->contadbp, pjtr->bin.code.size());
			}else if(iap[0] == WHILE_TOKEN && iap[1] != SEMICOLON_TOKEN){
				stree.extloop->nextad = pjtr->bin.code.size();
				pjtr->bin.PBackpatch(
					stree.extloop->nextadbp, pjtr->bin.code.size());
				i = 1;
				ktype.id = VOID_TYPEID;
				tystack += BOOL_TYPEID;
				do{
					if(!MainSwitch(stree, iap, i, tystack, ktype, retcall)){
						return false;
					}
					i++;
				}while(iap[i] != COLON_TOKEN);
				if(ktype.id != BOOL_TYPEID) return false;
				pjtr->bin.TrueJump(stree.extloop->doad);
				tystack.resize(tystack.size()-2);
				ktype.id = VOID_TYPEID;
			}else{
				if(iap[0] == BREAK_TOKEN && iap[1] == COLON_TOKEN){
					if(stree.extloop->doadbp.size() > 0){
						pjtr->addErrMes(L("do:がありません。"));
						return false;
					}
					if(stree.extloop->contadbp.size() > 0){
						pjtr->addErrMes(L("continue:がありません。"));
						return false;
					}
					if(stree.extloop->nextadbp.size() > 0){
						pjtr->addErrMes(L("while:がありません。"));
						return false;
					}
				}
				if(!NormalCompi::KoubunSwitch(stree, iap, len, j)){
					return false;
				}
			}
			return true;
		}
		MEMBER virtual bool DefDel(SrcTree& stree)
		{
			if(!stree.breakin){
				if(stree.extloop->doadbp.size() > 0){
					pjtr->addErrMes(L("do:がありません。"));
					return false;
				}
				if(stree.extloop->contadbp.size() > 0){
					pjtr->addErrMes(L("continue:がありません。"));
					return false;
				}
				if(stree.extloop->nextadbp.size() > 0){
					pjtr->addErrMes(L("while:がありません。"));
					return false;
				}
			}
			if(!NormalCompi::DefDel(stree)) return false;
			return true;
		}
	};
	class DelegateCompi : public FuncCompi
	{
	public:
		MEMBER bool FuncTreeCompile(SrcTree& stree)
		{
			KuwashiiType ktype;
			const intptr_t *iap;
			intptr_t siz;
			intptr_t len;
			pjtr->filename = &stree.srce->filename;
			pjtr->gyousuu = stree.topsrcgyo;
			stree.byteadress = pjtr->bin.code.size();
			pjtr->bin.PBackpatch(stree.backpatch, pjtr->bin.code.size());
			siz = 0;
			for(
				int j = stree.tpcount;
				j < stree.tpcount+stree.hikisuucount; j++)
			{
				siz += stree.frp->funchensuu[j].size;
			}
			pjtr->bin.delegateSub1(
				siz, stree.crp->GetMemberOffset(
					stree.tpcount+stree.hikisuucount-1));
			for(intptr_t j = 0; j < IDX(stree.token.size()); j++){
				iap = stree.token[j].data();
				len = stree.token[j].size();
				if(len == 0) continue;
				pjtr->AddLine(stree.gyo[j]);
				if(!KoubunSwitch(stree, iap, len, j)) return false;
			}
			if(
				stree.rettype.size() > 2 || (
					stree.rettype.size() == 2
					&& !IsSoushokuToken((TokenKind)stree.rettype[0]))
				|| stree.rettype.back() != VOID_TOKEN)
			{
				if(
					stree.token.size() <= 0
					|| stree.token.back().back() != RET_TOKEN
					|| (
						stree.token.size() >= 2
						&& stree.token[stree.token.size()-2][0] == IF_TOKEN))
				{
					pjtr->addErrMes(L("retがありません。"));
					return false;
				}
			}else{
				ktype.id = VOID_TYPEID;
				if(!DefDel(stree)) return false;
				pjtr->bin.popToBasereg();
				pjtr->bin.popToThisreg();
				pjtr->bin.Return(0, false);
			}
			{
				std::vector<std::basic_string<intptr_t>> dummy;
				stree.token.swap(dummy);
			}
			{
				std::basic_string<intptr_t> dummy;
				stree.gyo.swap(dummy);
			}
			return true;
		}
	};
	FuncCompi fcom;
	NormalCompi ncom;
	LockCompi lkcom;
	SwitchCompi swcom;
	BranchCompi brcom;
	LoopCompi lpcom;
	DelegateCompi dgcom;
	MEMBER void AddLine(intptr_t linenum)
	{
		gyousuu = linenum;
		if(bin.lineadr->size() <= 0 || bin.lineadr->back().line != gyousuu){
			bin.lineadr->resize(bin.lineadr->size()+1);
			bin.lineadr->back().address = bin.code.size();
			bin.lineadr->back().filename = filename;
			bin.lineadr->back().line = gyousuu;
		}
	}
public:
	MEMBER JITer(SrcTree* stroot)
	{
		root = stroot;
		fcom.SetJtr(this);
		ncom.SetJtr(this);
		lkcom.SetJtr(this);
		swcom.SetJtr(this);
		brcom.SetJtr(this);
		lpcom.SetJtr(this);
		dgcom.SetJtr(this);
	}
	MEMBER MAIN_FUNC Compile(std::basic_string<LineAddress>* la)
	{
		SrcTree *pst;
		intptr_t ttl, bp;
		if(root->parent != nullptr){
			root->stat->ss->emes.Add(
				root->srce->filename, root->topsrcgyo,
				L("真の根でないですが。"));
			return nullptr;
		}
		la->clear();
		bin.lineadr = la;
		ttl = root->stat->literaltotal;
		bin.code.clear();
		bin.gbladrbp.clear();
		pst = root;
		{
			std::WSTR dummy;
			pst->srce->source = nullptr;
			pst->srce->src.swap(dummy);
		}
		while(pst->extroot->subsrc != nullptr){
			pst->extroot->golbalgeta = ttl;
			ttl += pst->GetMemberSize();
			pst = pst->extroot->subsrc;
			{
				std::WSTR dummy;
				pst->srce->source = nullptr;
				pst->srce->src.swap(dummy);
			}
		}
		while(pst->parent != nullptr){
			if(pst->token.size() > 0 || pst->defdel.size() > 0){
				bin.FuncCall(pst->byteadress, pst->backpatch);
			}
			bp = bin.Jump(0);
			if(!fcom.FuncTreeCompile(*pst)) return nullptr;
			*(intptr_t*)(bin.code.data()+bp) += bin.code.size();
			pst = pst->parent;
		}
		bin.FuncCall(root->byteadress, root->backpatch);
		bin.PushImm((intptr_t)root->stat->ss);
		bin.PluginCall((void*)fcom.RunGbld);
		bin.Return(0, true);
		if(!fcom.FuncTreeCompile(*root)) return nullptr;
		root->stat->gre.resize(ttl);
		root->stat->literalsize.resize(root->stat->literallist.size());
		ttl = 0;
		int8_t* p = (int8_t*)root->stat->gre.data();
		for(
			intptr_t i = 0;
			i < IDX(root->stat->literallist.size()); i++)
		{
			intptr_t l = root->stat->literallist[i].size();
			memcpy(p+ttl, root->stat->literallist[i].data(), l);
			if(l > sizeof(Reference)+sizeof(HeapObjHead)){
				((Reference*)(p+ttl))->pointer = (HeapObj*)(p+ttl+sizeof(Reference));
			}else{
				((Reference*)(p+ttl))->pointer = nullptr;
			}
			((HeapObjHead*)(p+ttl+sizeof(Reference)))->data =
				(int8_t*)(p+ttl+sizeof(Reference)+sizeof(HeapObjHead));
			ttl += l;
			root->stat->literalsize[i] = l;
		}
		{
			std::vector<std::basic_string<int8_t>> dummy;
			root->stat->literallist.swap(dummy);
		}
		bin.PBackpatch(bin.gbladrbp, (intptr_t)root->stat->gre.data());
		auto vmemory =
			VirtualAlloc(
				nullptr, bin.code.size(), MEM_RESERVE | MEM_COMMIT,
				PAGE_READWRITE);
		if(vmemory != nullptr){
			bin.PBackpatch(bin.cadrpbp, (intptr_t)vmemory);
			bin.MBackpatch(bin.cadrmbp, (intptr_t)vmemory);
			memcpy(vmemory, bin.code.data(), bin.code.size());
			g_cal.add(
				(uint8_t*)vmemory,
				(uint8_t*)vmemory + bin.code.size(), bin.lineadr);
			DWORD oldprotect;
			VirtualProtect(
				vmemory, bin.code.size(), PAGE_EXECUTE, &oldprotect);

		}else{
			root->stat->ss->emes.Add(
				root->srce->filename, root->topsrcgyo,
				L("VirtualAllocに失敗しました。"));
		}
		return (MAIN_FUNC)vmemory;
	}
	MEMBER void addErrMes(const std::WSTR& mes)
	{
		root->stat->ss->emes.Add(*filename, gyousuu, mes);
	}
};
