
template<typename Type> struct PThashnode
{
	Type data;
	PThashnode<Type>* children;
	MEMBER PThashnode()
	{
		data.p = nullptr;
		children = nullptr;
	}
	MEMBER ~PThashnode()
	{
		delete[] children;
	}
	MEMBER void Clear()
	{
		delete[] children;
		data.p = nullptr;
		children = nullptr;
	}
};
template<typename T> class PointerTable
{
	int si;
protected:
	STAMEM const int rootnodecount = 0x1000;
	PThashnode<T> node[rootnodecount];
	MEMBER intptr_t hash8(uintptr_t& ip)
	{
		ip -= 1 | 1<<3 | 1<<6 | 1<<9 | 1<<12 | 1<<15 | 1<<18;
		return (ip ^ ip>>3 ^ ip>>6 ^ ip>>9 ^ ip>>12 ^ ip>>15 ^ ip>>18) & 0x7;
	}
	MEMBER intptr_t hash64(const uintptr_t uip)
	{
		return ((uip>>6) ^ (uip>>18)) & 0x3f;
	}
	MEMBER intptr_t hash4096(const uintptr_t uip)
	{
		return ((uip<<6) ^ (uip>>12)) & 0xfff;
	}
	MEMBER void Add8(PThashnode<T>** n, T& x, uintptr_t ip)
	{
		intptr_t i;
		for(;;){
			i = hash8(ip);
			if(*n == nullptr){
				*n = new PThashnode<T>[0x8];
			}
			if((*n)[i].data.p == nullptr || (*n)[i].data.p == x.p){
				(*n)[i].data = x;
				break;
			}
			n = &(*n)[i].children;
		}
	}
	MEMBER void Add64(PThashnode<T>*& n, T& x)
	{
		intptr_t i = hash64((uintptr_t)x.p);
		if(n == nullptr){
			n = new PThashnode<T>[0x40];
		}
		if(n[i].data.p == nullptr || n[i].data.p == x.p){
			n[i].data = x;
		}else{
			Add8(&n[i].children, x, (uintptr_t)x.p);
		}
	}
	MEMBER void Add(T& x)
	{
		if(x.p == nullptr) return;
		intptr_t i = hash4096((uintptr_t)x.p);
		if(node[i].data.p == nullptr || node[i].data.p == x.p){
			node[i].data = x;
		}else{
			Add64(node[i].children, x);
		}
	}
	MEMBER void SetAtogama8(PThashnode<T>& n)
	{
		int i;
		if(n.children == nullptr){
			n.data.p = nullptr;
			return;
		}
		si++;
		for(i = 0; i < 0x8; i++){
			if(n.children[(si+i)&0x7].data.p != nullptr){
				n.data = n.children[(si+i)&0x7].data;
				SetAtogama8(n.children[(si+i)&0x7]);
				return;
			}
		}
		n.Clear();
	}
	MEMBER void SetAtogama64(PThashnode<T>& n)
	{
		int i;
		if(n.children == nullptr){
			n.data.p = nullptr;
			return;
		}
		si++;
		for(i = 0; i < 0x40; i++){
			if(n.children[(si+i)&0x3f].data.p != nullptr){
				n.data = n.children[(si+i)&0x3f].data;
				SetAtogama8(n.children[(si+i)&0x3f]);
				return;
			}
		}
		n.Clear();
	}
	MEMBER void Del8(PThashnode<T>* n, void* const p, uintptr_t ip)
	{
		intptr_t i;
		while(n != nullptr){
			i = hash8(ip);
			if(n[i].data.p == p){
				SetAtogama8(n[i]);
				break;
			}
			n = n[i].children;
		}
	}
	MEMBER void Del64(PThashnode<T>* const n, void* const p)
	{
		if(n == nullptr) return;
		intptr_t i = hash64((uintptr_t)p);
		if(n[i].data.p == p){
			SetAtogama8(n[i]);
		}else{
			Del8(n[i].children, p, (uintptr_t)p);
		}
	}
	MEMBER void Del(void* const p)
	{
		if(p == nullptr) return;
		intptr_t i = hash4096((uintptr_t)p);
		if(node[i].data.p == p){
			SetAtogama64(node[i]);
		}else{
			Del64(node[i].children, p);
		}
	}
	MEMBER T* Get8(PThashnode<T>* n, void* const p, uintptr_t ip)
	{
		intptr_t i;
		while(n != nullptr){
			i = hash8(ip);
			if(n[i].data.p == p) return &n[i].data;
			n = n[i].children;
		}
		return nullptr;
	}
	MEMBER T* Get64(PThashnode<T>* const n, void* const p)
	{
		if(n == nullptr) return nullptr;
		intptr_t i = hash64((uintptr_t)p);
		if(n[i].data.p == p) return &n[i].data;
		return Get8(n[i].children, p, (uintptr_t)p);
	}
	MEMBER T* Get(void* const p)
	{
		if(p == nullptr) return nullptr;
		intptr_t i = hash4096((uintptr_t)p);
		if(node[i].data.p == p) return &node[i].data;
		return Get64(node[i].children, p);
	}
public:
	MEMBER PointerTable() : si(0)
	{
	}
	MEMBER void clear()
	{
		for(int i = 0; i < rootnodecount; i++) node[i].Clear();
	}
};


struct FlagPTData
{
	void* p;
	int i;
	uint32_t rc;
	std::basic_string<HeapObj*> linked;
	MEMBER FlagPTData& operator = (FlagPTData& x)
	{
		p = x.p;
		i = x.i;
		rc = x.rc;
		linked = x.linked;
		return *this;
	}
};
class PointerFlagTable : public PointerTable<FlagPTData>
{
public:
	std::basic_string<HeapObj*> memo;
	MEMBER void Clear()
	{
		int i;
		for(i = 0; i < rootnodecount; i++) node[i].Clear();
		memo.clear();
	}
	MEMBER void add(HeapObj* p, int i, const uint32_t rcnt, HeapObj* const link)
	{
		FlagPTData fn;
		fn.p = p;
		fn.i = i;
		fn.rc = rcnt;
		if(link != nullptr) fn.linked = link;
		Add(fn);
		memo += p;
	}
	MEMBER int get(void* p)
	{
		FlagPTData* fp = Get(p);
		return fp != nullptr ? fp->i : 0;
	}
	MEMBER FlagPTData* getData(void* p)
	{
		return Get(p);
	}
	MEMBER void addLink(HeapObj* const p, HeapObj* const link)
	{
		if(link == nullptr) return;
		FlagPTData* fp = Get(p);
		if(fp == nullptr) return;
		fp->linked += link;
	}
	MEMBER void niSet(HeapObj* const p)
	{
		FlagPTData* fp = Get(p);
		if(fp == nullptr || fp->i == 2) return;
		fp->i = 2;
		for(intptr_t i = 0; i < IDX(fp->linked.size()); i++){
			niSet(fp->linked[i]);
		}
	}
};

struct JunkanPTData
{
	void* p;
	intptr_t rpid, nest;
	bool kanousei;
};
struct HisanshouData
{
	void* p;
	std::basic_string<HeapObj*> linked;
	MEMBER HisanshouData& operator = (HisanshouData& x)
	{
		p = x.p;
		linked = x.linked;
		return *this;
	}
};
class JunkanGoroshi : public PointerTable<JunkanPTData>
{
	std::vector<std::basic_string<intptr_t>> refposlist;
	std::queue<HeapObj*> queue;
	LockSingler mtx;
	MEMBER int JunkanCheckSub(
		HeapObj* const hobj, HeapObj* const from,
		PointerFlagTable& pft, int8_t*& d, intptr_t& ds, HeapObj* const start)
	{
		int i = pft.get(hobj);
		if(i != 0){
			pft.addLink(hobj, from);
			if(hobj == start) return 2;
			return i;
		}
		pft.add(hobj, 1, hobj->rcount(), from);
		volatile HeapObj* ho = hobj;
		do{
			d = ho->head.data;
			ds = ho->head.datasize;
		}while(d != ho->head.data || ds != ho->head.datasize);
		return 0;
	}
	MEMBER int JunkanCheckDynSub(
		volatile DynamicRef* dypd, HeapObj* const hobj, PointerFlagTable& pft,
		HeapObj* const start)
	{
		HeapObj* ph = dypd->obj.pointer;
		int32_t typ = dypd->typ;
		if(ph == dypd->obj.pointer && typ == dypd->typ && ph){
			if(typ == DYNREF_TYPEID || typ == DYNLIST_TYPEID){
				return JunkanCheckNest(ph, hobj, -1, pft, start, 1);
			}else if(
				0 <= typ && typ <= ENDCLASS_TYPEID
				&& psot->stat->funclist.Get(typ)->IsJunkanAble())
			{
				return
					JunkanCheck(
						ph, hobj,
						psot->stat->funclist.Get(typ)->sonota.junkanid,
						pft, start);
			}
		}
		return -1;
	}
	MEMBER int JunkanCheck(
		HeapObj* const hobj, HeapObj* const from, const intptr_t id,
		PointerFlagTable& pft, HeapObj* const start)
	{
		int8_t* d = nullptr;
		intptr_t ds = 0;
		int junflg = JunkanCheckSub(hobj, from, pft, d, ds, start);
		if(junflg != 0) return junflg;
		for(intptr_t j = 0; j < ds; j += AtPL(id)[0]){
			for(intptr_t i = 2; i < IDX(AtPL(id).size()); i += 3){
				intptr_t rtid = AtPL(id)[i + 1];
				intptr_t rtn = AtPL(id)[i + 2];
				HeapObj* rthp = ((Reference*)(d + j + AtPL(id)[i]))->pointer;
				if(!rthp) continue;
				if(rtn > 0){
					if(rtid >= 0){
						rtid =
							psot->stat->funclist.Get(
								(int32_t)rtid)->sonota.junkanid;
					}
					int ret =
						JunkanCheckNest(
							rthp, hobj, rtid, pft, start, rtn);
					if(ret > junflg) junflg = ret;
				}else if(rtid < 0){
					int ret =
						JunkanCheckDynSub(
							(DynamicRef*)(d + j + AtPL(id)[i]),
							hobj, pft, start);
					if(ret > junflg) junflg = ret;
				}else{
					rtid =
						psot->stat->funclist.Get(
							(int32_t)rtid)->sonota.junkanid;
					if(rtid >= 0){
						int ret =
							JunkanCheck(rthp, hobj, rtid, pft, start);
						if(ret > junflg) junflg = ret;
					}
				}
			}
		}
		if(junflg == 2) pft.niSet(hobj);
		return junflg;
	}
	MEMBER int JunkanCheckNest(
		HeapObj* const hobj, HeapObj* const from, const intptr_t id,
		PointerFlagTable& pft, HeapObj* const start, const intptr_t nest)
	{
		if(nest <= 0){
			return JunkanCheck(hobj, from, id, pft, start);
		}
		int8_t* d = nullptr;
		intptr_t ds = 0;
		int junflg = JunkanCheckSub(hobj, from, pft, d, ds, start);
		if(junflg != 0) return junflg;
		if(nest == 1 && id < 0){
			for(intptr_t i = 0; i < ds; i += sizeof(DynamicRef)){
				int ret =
					JunkanCheckDynSub(
						(DynamicRef*)(d + i), hobj, pft, start);
				if(ret > junflg) junflg = ret;
			}
		}else{
			for(intptr_t i = 0; i < ds; i += sizeof(Reference)){
				HeapObj* ph = ((Reference*)(d + i))->pointer;
				if(ph){
					int ret =
						JunkanCheckNest(
							ph, hobj, id, pft, start, nest-1);
					if(ret > junflg) junflg = ret;
				}
			}
		}
		if(junflg == 2) pft.niSet(hobj);
		return junflg;
	}
public:
	SourceTree<JunkanGoroshi>* psot;
	const void* pbcode;
	MEMBER bool junkanHantei(
		const intptr_t id, const intptr_t nest, HeapObj* const start)
	{
		PointerFlagTable pft;
		JunkanCheckNest(start, nullptr, id, pft, start, nest);
		uint32_t rcnt = 0, rc = 0, lc = 0;
		{
			AutoLocker al(&mtx);
			for(intptr_t i = 0; i < IDX(pft.memo.size()); i++){
				FlagPTData* fp = pft.getData(pft.memo[i]);
				if(fp->i == 2){
					uint32_t crc = pft.memo[i]->rcount();
					JunkanPTData* n;
					if(
						crc == 0 || crc != fp->rc || crc != fp->linked.size()
						|| (n = Get(pft.memo[i])) == nullptr || n->kanousei)
					{
						rc = 0;
						break;
					}
					rcnt += fp->rc;
					rc += crc;
					lc += fp->linked.size();
				}
			}
		}
		{
			AutoLocker alks(&g_KaihouStopMutex);
			g_KaihouStopCount--;
		}
		return rcnt > 0 && rcnt == lc && rcnt == rc;
	}
	MEMBER void Clear()
	{
		refposlist.clear();
		while(!queue.empty()) queue.pop();
		PointerTable::clear();
	}
	MEMBER void SetKankyou(
		SourceTree<JunkanGoroshi>* const st, const void* const pb)
	{
		psot = st;
		pbcode = pb;
	}
	MEMBER intptr_t AddPL(const std::basic_string<intptr_t>& rp)
	{
		refposlist.push_back(rp);
		return refposlist.size()-1;
	}
	MEMBER void SetPLDestructor(const intptr_t i, const intptr_t des)
	{
		refposlist[i][1] = des;
	}
	MEMBER const std::basic_string<intptr_t>& AtPL(const intptr_t i)
	{
		return refposlist[i];
	}
	MEMBER bool PopNode(HeapObj*& p, intptr_t& rpid, intptr_t& nest)
	{
		AutoLocker al(&mtx);
		AutoLocker alks(&g_KaihouStopMutex);
		if(g_KaihouStopCount == 0){
			for(intptr_t i = 0; i < IDX(g_KaihouStopList.size()); i++){
				delete[] (int8_t*)g_KaihouStopList[i];
			}
			g_KaihouStopList.clear();
		}
		JunkanPTData* n;
		do{
			if(queue.empty()) return false;
			n = Get(queue.front());
			queue.pop();
		}while(n == nullptr || !n->kanousei);
		p = (HeapObj*)n->p;
		rpid = n->rpid;
		nest = n->nest;
		n->kanousei = false;
		g_KaihouStopCount++;
		return true;
	}
	MEMBER void RefNew(const intptr_t rpid, const intptr_t nest, HeapObj* const p)
	{
		if(p != nullptr){
			AutoLocker al(&mtx);
			JunkanPTData jn;
			jn.p = p;
			jn.rpid = rpid;
			jn.nest = nest;
			jn.kanousei = false;
			Add(jn);
		}
	}
	MEMBER void CircStartDel(HeapObj* const p)
	{
		AutoLocker al(&mtx);
		Del(p);
	}
	MEMBER HeapObj* RefCopy(Reference* const r, const Reference* const src)
	{
		HeapObj* p = r->pointer;
		if(!p || p == src->obj()){
			return r->copy(*src);
		}else{
			AutoLocker al(&mtx);
			HeapObj* hp = r->copy(*src);
			if(hp != nullptr){
				Del(hp);
				if(hp->head.datasize > 0) return hp;
				hp->delet();//g_KaihouStopMutex
			}else{
				JunkanPTData* n = Get(p);
				if(n != nullptr){
					if(!n->kanousei){
						n->kanousei = true;
						queue.push(p);
					}
				}
			}
		}
		return nullptr;
	}
	MEMBER HeapObj* RefRelease(Reference* r)
	{
		HeapObj* p = r->pointer;
		r->init();
		if(p){
			AutoLocker al(&mtx);
			if(InterlockedDecrement((LPLONG)&p->head.refcount) == 0){
				Del(p);
				if(p->head.datasize > 0) return p;
				p->delet();//g_KaihouStopMutex
			}else{
				JunkanPTData* n = Get(p);
				if(n != nullptr){
					if(!n->kanousei){
						n->kanousei = true;
						queue.push(p);
					}
				}
			}
		}
		return nullptr;
	}
	MEMBER void DynrefCopy(
		volatile DynamicRef* const dr,
		const Reference* const src, int32_t typ, MAIN_FUNC mf)
	{
		int32_t id = dr->typ;
		if(
			!dr->obj.pointer || dr->obj.pointer == src->obj()
			|| (
				id != DYNREF_TYPEID && id != DYNLIST_TYPEID && (
					id < 0 || ENDCLASS_TYPEID < id
					||  !psot->stat->funclist.Get(id)->IsJunkanAble())))
		{
			dr->typ = typ;
			HeapObj* hp = ((DynamicRef*)dr)->obj.copy(*src);
			if(hp != nullptr){
				{
					AutoLocker al(&mtx);
					Del(hp);
				}
				DRDSwitch(psot, id, hp, mf);//g_KaihouStopMutex
			}
		}else{
			HeapObj* p = dr->obj.pointer;
			if(id != typ) dr->typ = VOID_TYPEID;
			HeapObj* hp = ((DynamicRef*)dr)->obj.copy(*src);
			if(id != typ) dr->typ = typ;
			if(hp != nullptr){
				{
					AutoLocker al(&mtx);
					Del(hp);
				}
				DRDSwitch(psot, id, hp, mf);//g_KaihouStopMutex
			}else{
				AutoLocker al(&mtx);
				JunkanPTData* n = Get(p);
				if(n != nullptr){
					if(!n->kanousei){
						n->kanousei = true;
						queue.push(p);
					}
				}
			}
		}
	}
	MEMBER void DynrefDel(volatile DynamicRef* const dr, MAIN_FUNC mf)
	{
		HeapObj* p = dr->obj.pointer;
		int32_t id = dr->typ;
		((DynamicRef*)dr)->init();
		if(
			!p || (
				id != DYNREF_TYPEID && id != DYNLIST_TYPEID && (
					id < 0 || ENDCLASS_TYPEID < id
					||  !psot->stat->funclist.Get(id)->IsJunkanAble())))
		{
			if(p && InterlockedDecrement((LPLONG)&p->head.refcount) == 0){
				{
					AutoLocker al(&mtx);
					Del(p);
				}
				DRDSwitch(psot, id, p, mf);//g_KaihouStopMutex
			}
		}else{
			if(InterlockedDecrement((LPLONG)&p->head.refcount) == 0){
				{
					AutoLocker al(&mtx);
					Del(p);
				}
				DRDSwitch(psot, id, p, mf);//g_KaihouStopMutex
			}else{
				AutoLocker al(&mtx);
				JunkanPTData* n = Get(p);
				if(n != nullptr){
					if(!n->kanousei){
						n->kanousei = true;
						queue.push(p);
					}
				}
			}
		}
	}
};
