struct HeapObjHead
{
	int8_t *data;
	intptr_t datasize;
	LPCRITICAL_SECTION mutex;
	uint32_t refcount;
};
struct HeapObj
{
	HeapObjHead head;
	union{
		int8_t data[1];
		intptr_t limitsize;
	} body;
	MEMBER void createmutex()
	{
		volatile LPCRITICAL_SECTION* hohm = &head.mutex;
		if(
			InterlockedCompareExchange(
				(LPLONG)hohm, (LONG)(HANDLE)~(intptr_t)0, 0) != 0)
		{
			while(*hohm == (HANDLE)~(intptr_t)0) Sleep(0);
			return;
		}
		LPCRITICAL_SECTION cs =
			(LPCRITICAL_SECTION)sszrefnewfunc(sizeof(CRITICAL_SECTION));
		InitializeCriticalSection(cs);
		*hohm = cs;
	}
	MEMBER void lock()
	{
		createmutex();
		EnterCriticalSection(head.mutex);
	}
	MEMBER void unlock()
	{
		LeaveCriticalSection(head.mutex);
	}
	MEMBER int8_t* at(intptr_t i, const intptr_t tsize) const
	{
		intptr_t le, tmp;
		le = (uintptr_t)head.datasize / (uintptr_t)tsize;
		tmp = (i>>31) | (((le-1)-i)>>31);
		i = (~tmp & i) | (tmp & (le-1));
		return head.data + i*tsize;
	}
	template<intptr_t tsize> MEMBER int8_t* at(intptr_t i) const
	{
		intptr_t le, tmp;
		le = (uintptr_t)head.datasize / (uintptr_t)tsize;
		tmp = (i>>31) | (((le-1)-i)>>31);
		i = (~tmp & i) | (tmp & (le-1));
		return head.data + i*tsize;
	}
	MEMBER void delLock()
	{
		if(head.refcount < 0x80000000){
			InterlockedExchangeAdd((LONG*)&head.refcount, 0x80000000);
		}
	}
	MEMBER uint32_t rcount()
	{
		return head.refcount & 0x7fffffff;
	}
	MEMBER void delet()
	{
		if(head.data != body.data) sszrefdeletefunc(head.data);
		if(head.mutex != nullptr){
			DeleteCriticalSection(head.mutex);
			sszrefdeletefunc((void*)head.mutex);
		}
		sszrefdeletefunc(this);
	}
};
struct Reference
{
	HeapObj *pointer;
	intptr_t position;
	intptr_t length;
	MEMBER void init()
	{
		pointer = nullptr;
		position = length = 0;
	}
	MEMBER bool null() const
	{
		return pointer == nullptr;
	}
	MEMBER HeapObj* obj() const
	{
		return pointer;
	}
	MEMBER intptr_t pos() const
	{
		return position;
	}
	MEMBER intptr_t len() const
	{
		if(length < 0){
			return obj()->head.datasize;
		}
		return length;
	}
	MEMBER intptr_t size() const
	{
		if(null()) return 0;
		return obj()->head.datasize;
	}
	MEMBER uint32_t refcnt() const
	{
		if(null()) return 0;
		return obj()->rcount();
	}
	MEMBER void countup()
	{
		if(!pointer) return;
		InterlockedIncrement((LONG*)&pointer->head.refcount);
	}
	MEMBER HeapObj* release()
	{
		HeapObj *p = nullptr;
		if(pointer && InterlockedDecrement((LONG*)&pointer->head.refcount) == 0){
			p = pointer;
		}
		init();
		return p;
	}
	MEMBER void releaseanddelete()
	{
		HeapObj *p;
		if(null()) return;
		p = release();
		if(p != nullptr) p->delet();
	}
	MEMBER HeapObj* copy(const Reference &r)
	{
		volatile HeapObj *p;
		if(r.null()) return release();
		volatile Reference* thi = this;
		p = thi->pointer;
		if(r.obj() == p){
			*(Reference*)thi = r;
			return (HeapObj*)nullptr;
		}else if(p){
			if(InterlockedDecrement((LONG*)&p->head.refcount) != 0) p = nullptr;
		}
		if(r.pointer){
			InterlockedIncrement((LONG*)&r.pointer->head.refcount);
		}
		*(Reference*)thi = r;
		return (HeapObj*)p;
	}
	MEMBER void lock()
	{
		if(null()) return;
		obj()->lock();
	}
	MEMBER void unlock()
	{
		if(null()) return;
		obj()->unlock();
	}
//////////////////////////////////////////////////////////////////////////////
	MEMBER int8_t* atpos() const
	{
		return obj()->head.data + position;
	}
	MEMBER int8_t* refat(intptr_t i, const intptr_t tsize) const
	{
		intptr_t le, tmp;
		if(length < 0) return listat(i, tsize);
		le = (uintptr_t)length / (uintptr_t)tsize;
		tmp = (i>>31) | (((le-1)-i)>>31);
		i = (~tmp & i) | (tmp & (le-1));
		return obj()->head.data+position+i*tsize;
	}
	template<intptr_t tsize> MEMBER int8_t* refat(intptr_t i) const
	{
		intptr_t le, tmp;
		if(length < 0) return listat<tsize>(i);
		le = (uintptr_t)length / (uintptr_t)tsize;
		tmp = (i>>31) | (((le-1)-i)>>31);
		i = (~tmp & i) | (tmp & (le-1));
		return obj()->head.data+position+i*tsize;
	}
	MEMBER int8_t* listat(const intptr_t i, const intptr_t tsize) const
	{
		return obj()->at(i, tsize);
	}
	template<intptr_t tsize> MEMBER int8_t* listat(const intptr_t i) const
	{
		return obj()->at<tsize>(i);
	}
	MEMBER int8_t* listnewat(
		const intptr_t i, const intptr_t tsize,
		void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t) = nullptr,
		void* p = nullptr)
	{
		intptr_t idx;
		if(i < 0){
			idx = addsize(-i, tsize, fp, p);
			return obj()->head.data + idx;
		}
		if(null()){
			listnew(i+1, tsize, fp, p);
		}else if((i+1)*tsize > obj()->head.datasize){
			addsize(((i+1)*tsize - obj()->head.datasize)/tsize, tsize, fp, p);
		}
		return obj()->head.data + i*tsize;
	}
	MEMBER void refnew(
		const intptr_t s, const intptr_t tsize,
		void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t) = nullptr,
		void* p = nullptr)
	{
		if(s*tsize <= 0) return;
		HeapObj *tmp = (HeapObj*)sszrefnewfunc(sizeof(HeapObjHead)+s*tsize);
		tmp->head.data = tmp->body.data;
		tmp->head.datasize = s*tsize;
		tmp->head.mutex = nullptr;
		tmp->head.refcount = 1;
		if(fp != nullptr) fp(p, tmp->head.data, s*tsize);
		volatile Reference* thi = this;
		thi->pointer = tmp;
		thi->position = 0;
		thi->length = s*tsize;
	}
	MEMBER void listnew(
		const intptr_t s, const intptr_t tsize,
		void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t) = nullptr,
		void* p = nullptr)
	{
		if(s*tsize <= 0) return;
		HeapObj *tmp = (HeapObj*)sszrefnewfunc(sizeof(HeapObj));
		tmp->head.data = (int8_t*)sszrefnewfunc(s*tsize);
		tmp->head.datasize = tmp->body.limitsize = s*tsize;
		tmp->head.mutex = nullptr;
		tmp->head.refcount = 1;
		if(fp != nullptr) fp(p, tmp->head.data, s*tsize);
		volatile Reference* thi = this;
		thi->pointer = tmp;
		thi->position = 0;
		thi->length = -1;
	}
	MEMBER intptr_t addsize(
		const intptr_t s, const intptr_t tsize,
		void (SSZ_STDCALL* fp)(void*, int8_t*, intptr_t) = nullptr,
		void* p = nullptr)
	{
		intptr_t tmps, ds;
		int8_t *tmpd;
		if(null()){
			listnew(s, tsize, fp, p);
			return 0;
		}
		tmps = obj()->head.datasize;
		if(s*tsize <= 0) return tmps;
		ds = obj()->head.datasize + s*tsize;
		if(ds > obj()->body.limitsize){
			obj()->body.limitsize = ds + (ds >> 2);
			tmpd = (int8_t*)sszrefnewfunc(obj()->body.limitsize);
			memcpy(tmpd, obj()->head.data, tmps);
			if(fp != nullptr) fp(p, tmpd+tmps, s*tsize);
			volatile HeapObj *p = obj();
			volatile int8_t* tmpp = p->head.data;
			p->head.data = tmpd;
			sszrefdeletefunc((void *)tmpp);
			p->head.datasize = ds;
		}else{
			if(fp != nullptr) fp(p, obj()->head.data+tmps, s*tsize);
			obj()->head.datasize = ds;
		}
		return tmps;
	}
	MEMBER void slice(intptr_t kara, intptr_t made, const intptr_t tsize)
	{
		intptr_t le, tmp;
		le = (uintptr_t)len() / (uintptr_t)tsize;
		tmp = (kara>>31) | ((le-kara)>>31);
		kara = (~tmp & kara) | (tmp & le);
		tmp = (made>>31) | ((le-made)>>31);
		made = (~tmp & made) | (tmp & le);
		le = made - kara;
		tmp = ~((le>>31) | ((le-1)>>31));
		*(intptr_t*)&pointer &= tmp;
		position = tmp & (position + kara*tsize);
		length = (tmp & le)*tsize;
	}
	template<intptr_t tsize> MEMBER void slice(intptr_t kara, intptr_t made)
	{
		intptr_t le, tmp;
		le = (uintptr_t)len() / (uintptr_t)tsize;
		tmp = (kara>>31) | ((le-kara)>>31);
		kara = (~tmp & kara) | (tmp & le);
		tmp = (made>>31) | ((le-made)>>31);
		made = (~tmp & made) | (tmp & le);
		le = made - kara;
		tmp = ~((le>>31) | ((le-1)>>31));
		*(intptr_t*)&pointer &= tmp;
		position = tmp & (position + kara*tsize);
		length = (tmp & le)*tsize;
	}
};
struct DynamicRef
{
	Reference obj;
	int32_t typ;
	MEMBER void init()
	{
		typ = VOID_TYPEID;
		obj.init();
	}
};
static void SSZ_STDCALL refzeroclearcb(void* p, int8_t* pd, intptr_t l)
{
	memset(pd, 0, l);
}
static void SSZ_STDCALL refdynnullclearcb(void* p, int8_t* pd, intptr_t l)
{
	intptr_t i;
	for(i = 0; i < l; i += sizeof(DynamicRef)){
		((DynamicRef*)(pd+i))->init();
	}
}

struct Thread
{
	HANDLE handle;
	MEMBER void init()
	{
		handle = nullptr;
	}
	MEMBER bool null() const
	{
		return handle == nullptr;
	}
	MEMBER void wait()
	{
		if(null()) return;
		WaitForSingleObject(handle, INFINITE);
		CloseHandle(handle);
		handle = nullptr;
	}
	MEMBER void create(unsigned (THREADCALL* const lsr)(void*), void* const param)
	{
		wait();
		handle = (HANDLE)_beginthreadex(nullptr, 0, lsr, param, 0, nullptr);
	}
};

struct Delegate
{
	intptr_t f, base, member;
};
