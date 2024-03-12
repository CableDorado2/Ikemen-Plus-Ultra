enum BlockType
{
	UNKNOWN_BLOCK=0, FUNC_BLOCK, CLASS_BLOCK, ENUM_BLOCK, NORMAL_BLOCK,
	LOOP_BLOCK, SWITCH_BLOCK, BRANCH_BLOCK, LOCK_BLOCK, DELEGATE_BLOCK
};

static const intptr_t TNT_OFFSET =
	1 + (sizeof(intptr_t) + (sizeof(WCHR)-1)) / sizeof(WCHR);


class SDLLItem
{
	HINSTANCE hin;
public:
	MEMBER SDLLItem()
	{
		hin = nullptr;
	}
	MEMBER ~SDLLItem()
	{
		FreeLibrary(hin);
	}
	MEMBER bool loadDll(const std::WSTR& la)
	{
		hin = LoadLibrary(la.c_str());
		return hin != nullptr;
	}
	MEMBER FARPROC getfunc(const std::WSTR& fn)
	{
		std::string s;
		for(intptr_t i = 0; i < IDX(fn.size()); i++){
			if(fn[i] > 255) return nullptr;
			s += (char)fn[i];
		}
		return GetProcAddress(hin, s.c_str());
	}
};

struct SwitchExtStruct
{
	int32_t swtype;
	bool haveCaseOrDefault, teeburutukutta;
	intptr_t def;
	std::basic_string<intptr_t> defbp;
	std::basic_string<int64_t> atai;
	std::basic_string<intptr_t> ataibp;
	std::basic_string<intptr_t> tgnsuruusakibp;
	MEMBER SwitchExtStruct()
	{
		teeburutukutta = false;
		def = 0;
		swtype = 0;
		haveCaseOrDefault = false;
	}
};

struct BranchExtStruct
{
	int mode;
	bool commnai;
	int8_t bunkisita;
	intptr_t nextcond;
	int32_t dino;
	std::vector<std::WSTR> label;
	std::basic_string<intptr_t> labelbp;
	std::basic_string<intptr_t> tgnelsesakibp;
	std::basic_string<intptr_t> tgncommsakibp;
	MEMBER BranchExtStruct()
	{
		mode = 0;
		nextcond = 0;
		dino = 0;
		commnai = false;
		bunkisita = 0;
	}
	MEMBER bool addlabel(const WCHR* const str, const intptr_t len)
	{
		label.push_back(std::WSTR());
		label.back().append(str, len);
		for(intptr_t i = 0; i < IDX(label.size())-1; i++){
			if(label.back() == label[i]){
				label.pop_back();
				return false;
			}
		}
		return true;
	}
	MEMBER int32_t findlabel(const std::WSTR& str)
	{
		for(intptr_t i = 0; i < IDX(label.size()); i++){
			if(str == label[i]) return (int32_t)i;
		}
		return -1;
	}
};

struct LoopExtStruct
{
	int mode;
	intptr_t doad;
	std::basic_string<intptr_t> doadbp;
	intptr_t contad;
	std::basic_string<intptr_t> contadbp;
	intptr_t nextad;
	std::basic_string<intptr_t> nextadbp;
	MEMBER LoopExtStruct()
	{
		mode = 0;
		doad = contad = nextad = 0;
	}
};

template<typename FTree> struct RootExtStruct
{
	std::basic_string<FTree*> usinglibs;
	FTree* subsrc;
	intptr_t golbalgeta;
	MEMBER RootExtStruct()
	{
		subsrc = nullptr;
	}
	MEMBER ~RootExtStruct()
	{
		delete subsrc;
	}
	MEMBER void addLib(FTree* lib)
	{
		if(!isUsing(lib)) usinglibs += lib;
	}
	MEMBER bool isUsing(FTree* lib)
	{
		for(intptr_t i = 0; i < IDX(usinglibs.size());i++){
			if(usinglibs[i] == lib) return true;
		}
		return false;
	}
};

template<typename FTree> class Functions
{
	int32_t totalid;
	std::basic_string<FTree*> functree;
public:
	MEMBER Functions()
	{
		totalid = 0;
	}
	MEMBER void Clear()
	{
		totalid = 0;
	}
	MEMBER int32_t Add(FTree *const tree)
	{
		int32_t id;
		functree.resize(totalid);
		functree += tree;
		id = totalid++;
		return id;
	}
	MEMBER FTree* Get(const int32_t id)
	{
		return functree[id];
	}
	MEMBER int32_t GetTotal()
	{
		return totalid;
	}
};

template<typename FTree> struct Hensuu
{
	std::basic_string<intptr_t> type;
	intptr_t size;
	FTree* tree;
	MEMBER Hensuu & operator = (const Hensuu &x)
	{
		type = x.type;
		size = x.size;
		tree = x.tree;
		return *this;
	}
};

struct NameTable
{
	char16_t chara;
	intptr_t idx;
	NameTable* next;
	intptr_t size;
	MEMBER NameTable()
	{
		next = nullptr;
		size = 0;
	}
	MEMBER void clear()
	{
		for(intptr_t i = 0; i < size; i++) next[i].clear();
		delete[] next;
		next = nullptr;
		size = 0;
	}
	MEMBER void add(const WCHR c, const intptr_t i)
	{
		if(size == 0){
			next = new NameTable[1];
		}else{
			int n = 0;
			for(; 1<<n < size; n++){}
			if(1<<n == size){
				NameTable *tmp = new NameTable[size*2];
				memcpy(tmp, next, sizeof(NameTable)*size);
				delete[] next;
				next = tmp;
			}
		}
		next[size].chara = c;
		next[size].idx = i;
		size++;
	}
	MEMBER NameTable & operator = (const NameTable &x)
	{
		clear();
		chara = x.chara;
		idx = x.idx;
		size = x.size;
		if(size > 0){
			intptr_t i;
			for(i = 0; 1<<i < size; i++){}
			next = new NameTable[1<<i];
			for(i = 0; i < size; i++) next[i] = x.next[i];
		}
		return *this;
	}
};

template<typename STree, typename GC> struct STStatic
{
	SSZStatic<GC>* ss;
	Functions<STree> funclist;
	std::unordered_map<std::WSTR, STree*> srclist;
	std::unordered_map<std::WSTR, SDLLItem> dlllist;
	std::basic_string<int8_t> gre;
	std::basic_string<intptr_t> literalsize;
	std::vector<std::basic_string<int8_t>> literallist;
	intptr_t literaltotal;
	bool tokubetuerr;
	MEMBER STStatic(SSZStatic<GC>* sstat)
	{
		ss = sstat;
		literaltotal = 0;
	}
	MEMBER ~STStatic()
	{
		if(gre.size() > 0){
			intptr_t ttl = 0;
			for(intptr_t i = 0; i < IDX(literalsize.size()); i++){
				if(literalsize[i] > sizeof(Reference)+sizeof(HeapObjHead)){
					LPCRITICAL_SECTION pcs =
						(
							(HeapObj*)(intptr_t)(
								gre.data()+ttl+sizeof(Reference)))->head.mutex;
					if(pcs != nullptr){
						DeleteCriticalSection(pcs);
						sszrefdeletefunc((void*)pcs);
					}
				}
				ttl += literalsize[i];
			}
		}
	}
};

template<typename GC> static bool koubuneraadesu(Source<GC>& s)
{
	s.addErrMes(L("Syntax error."));
	return false;
}
template<typename GC> static bool gaarimasen(
	Source<GC>& s, const std::WSTR& token)
{
	std::WSTR tmp;
	tmp = L('\'');
	tmp += token;
	tmp += L("There is not '");
	s.addErrMes(tmp);
	return false;
}

template<typename GC> struct SourceTree
{
	typedef Source<GC> Src;
	STStatic<SourceTree, GC>* stat;
	std::WSTR myname;
	Src* srce;
	SourceTree* root;
	SourceTree* fileroot;
	int32_t funcid;
	bool kakutei;
	BlockType selftype;
	bool touka;
	SourceTree* parent;
	SourceTree* frp;
	SourceTree* crp;
	std::basic_string<intptr_t> rettype;
	int hikisuucount;
	int tpcount;
	intptr_t topsrcidx;
	intptr_t topsrcgyo;
	intptr_t gblhani;
	intptr_t gblsaikouhani;
	intptr_t mbrhani;
	intptr_t mbrsaikouhani;
	std::vector<Hensuu<SourceTree>> funchensuu;
	std::vector<std::WSTR> hensuname;
	std::basic_string<intptr_t> hensuidx;
	NameTable nametable;
	intptr_t breaknaihani;
	std::basic_string<SourceTree*> children;
	std::basic_string<SourceTree*> subfunc;
	std::vector<std::basic_string<intptr_t>> token;
	std::basic_string<intptr_t> gyo;
	std::basic_string<intptr_t> defdel;
	std::basic_string<intptr_t> junkandata;
	bool havedynref;
	union{
		intptr_t thatoshori;
		intptr_t junkanid;
		intptr_t ichijihensuu;//Use with branch and lock
	} sonota;
	intptr_t mbsize;
	intptr_t byteadress;
	intptr_t deladress;
	std::basic_string<intptr_t> backpatch;
	std::basic_string<intptr_t> breakpatch;
	intptr_t returnshita;
	intptr_t teigikinshi;
	intptr_t teigibreaktmp;
	bool breakin;
	bool breakinnest;
	RootExtStruct<SourceTree>* extroot;
	SwitchExtStruct* extswitch;
	BranchExtStruct* extbranch;
	LoopExtStruct* extloop;
	std::basic_string<intptr_t>* ptk;//Use only on the spot
	MEMBER SourceTree(
		STStatic<SourceTree, GC>* st, const std::WSTR* const name = nullptr,
		SourceTree* const p = nullptr, const bool fukakutei = false)
	{
		FlgReset();
		stat = st;
		parent = p;
		extroot = nullptr;
		extswitch = nullptr;
		extbranch = nullptr;
		extloop = nullptr;
		if(parent != nullptr){
			selftype = UNKNOWN_BLOCK;
			root = parent->root;
			fileroot = parent->fileroot;
			srce = parent->srce;
			if(name != nullptr){
				breakinnest = false;
				kakutei = !fukakutei;
				funcid = stat->funclist.Add(this);
				frp = crp = this;
				myname = *name;
				parent->subfunc += this;
			}else{
				breakinnest = parent->breakinnest;
				kakutei = false;
				frp = parent->frp;
				crp = parent->crp;
			}
		}else{
			selftype = FUNC_BLOCK;
			root = fileroot = this;
			extroot = new RootExtStruct<SourceTree>();
			srce = new Src(stat->ss);
			breakinnest = false;
			kakutei = false;
			funcid = stat->funclist.Add(this);
			frp = crp = this;
			rettype = VOID_TOKEN;
		}
	}
	MEMBER ~SourceTree()
	{
		if(root == this) delete srce;
		Del();
		delete extroot;
	}
	MEMBER void Del()
	{
		for(intptr_t i = 0; i < IDX(children.size()); i++) delete children[i];
		children.clear();
		nametable.clear();
		if(extroot != nullptr){
			delete extroot->subsrc;
			extroot->subsrc = nullptr;
		}
		delete extswitch;
		extswitch = nullptr;
		delete extbranch;
		extbranch = nullptr;
		delete extloop;
		extloop = nullptr;
	}
	MEMBER bool necessaryToken(Source<GC>& s, SourceTree& st, TokenKind tkn)
	{
		if(s.GetToken(st) != tkn) return gaarimasen(s, TokentToStr(tkn));
		return true;
	}
	MEMBER void AddNameTable(
		NameTable& nt, const std::WSTR& name,
		const intptr_t nidx, const intptr_t idx)
	{
		intptr_t i;
		for(i = 0; i < nt.size; i++){
			if(nt.next[i].chara == name[nidx]){
				if(nidx == IDX(name.size())-1){
					nt.next[i].idx = idx;
				}else{
					AddNameTable(nt.next[i], name, nidx+1, idx);
				}
				return;
			}
		}
		nt.add(name[nidx], INTPTR_MIN);
		if(nidx == IDX(name.size())-1){
			nt.next[nt.size-1].idx = idx;
		}else{
			AddNameTable(nt.next[nt.size-1], name, nidx+1, idx);
		}
	}
	MEMBER intptr_t NameToIdx(const std::WSTR& name)
	{
		intptr_t i, j;
		NameTable* nt = &nametable;
		if(name.size() <= 0) return INTPTR_MIN;
		for(i = 0; ; ){
			for(j = 0; j < nt->size; j++){
				if(nt->next[j].chara == name[i]) break;
			}
			if(j >= nt->size) return INTPTR_MIN;
			if(++i >= IDX(name.size())) break;
			nt = &nt->next[j];
		}
		return nt->next[j].idx;
	}
	MEMBER intptr_t AddHiddenHensuu(
		const std::basic_string<intptr_t>& type, const intptr_t size)
	{
		frp->funchensuu.resize(frp->funchensuu.size()+1);
		frp->funchensuu.back().tree = this;
		frp->funchensuu.back().type = type;
		frp->funchensuu.back().size = size;
		hensuname.push_back(std::WSTR(L("0")));
		hensuidx += frp->funchensuu.size()-1;
		return frp->funchensuu.size()-1;
	}
	MEMBER bool AddHensuu(
		std::basic_string<intptr_t>& type,
		const std::WSTR& name, const intptr_t size, Src& src)
	{
		bool b =
			name.size() >= 2
			&& name[name.size()-2] == L('_') && name[name.size()-1] == L('t');
		if(b != (type[0] == TYPE_TOKEN) || L('0') <= name[0] && name[0] <= L('9')){
			std::WSTR tmp;
			tmp = L('\'');
			tmp += name;
			tmp += L("' is an invalid name.");
			src.addErrMes(tmp);
			return false;
		}
		if(NameToIdx(name) != INTPTR_MIN){
			std::WSTR tmp;
			tmp = L('\'');
			tmp += name;
			tmp += L("' has a duplicate name.");
			src.addErrMes(tmp);
			return false;
		}
		if(frp->selftype != FUNC_BLOCK || frp == root){
			for(auto it = type.begin(); it != type.end(); it++){
				if(*it == KAKERU_TOKEN){
					if (frp->selftype != CLASS_BLOCK){
						src.addErrMes(
							L("The reference type '*' can only be used for local variables."));
						return false;
					}
					*it = STARSTAR_TOKEN;
				}
				else if (
					*it != REF_TOKEN && *it != LIST_TOKEN
					&& !IsSoushokuToken((TokenKind)*it))
				{
					break;
				}
			}
		}
		frp->funchensuu.resize(frp->funchensuu.size()+1);
		frp->funchensuu.back().tree = this;
		frp->funchensuu.back().type = type;
		frp->funchensuu.back().size = size;
		hensuname.push_back(name);
		hensuidx += frp->funchensuu.size()-1;
		AddNameTable(nametable, name, 0, hensuidx.size()-1);
		return true;
	}
	MEMBER SourceTree* GetChild(
		const std::WSTR* const name,
		const bool fukakutei, const bool any, const bool create)
	{
		if(name != nullptr){
			if(
				!any && (
					(L('0') <= (*name)[0] && (*name)[0] <= L('9')) || (
						name->size() >= 2 && (*name)[name->size()-2] == L('_')
						&& name->back() == L('t'))))
			{
				return nullptr;
			}
			if(fukakutei){
				intptr_t i = NameToIdx(*name);
				if(i >= 0) return nullptr;
				if(i != INTPTR_MIN) return subfunc[~i];
			}else{
				if(NameToIdx(*name) != INTPTR_MIN) return nullptr;
			}
		}
		if(!create) return nullptr;
		children += new SourceTree(stat, name, this, fukakutei);
		if(name != nullptr){
			AddNameTable(nametable, *name, 0, ~(IDX(subfunc.size())-1));
		}
		return children.back();
	}
	MEMBER bool ZeroHajimari(
		uint64_t& ui64, const WCHR* const tstr, const intptr_t tlen)
	{
		intptr_t i;
		if(tlen <= 1) return false;
		ui64 = 0;
		switch(tstr[0]){
		case L('b'):
			for(i = 1; i < tlen; i++){
				if(tstr[i] == L('0') || tstr[i] == L('1')){
					ui64 *= 2;
					ui64 += tstr[i] - L('0');
				}else{
					return false;
				}
			}
			break;
		case L('d'):
			for(i = 1; i < tlen; i++){
				if(L('0') <= tstr[i] && tstr[i] <= L('9')){
					ui64 *= 10;
					ui64 += tstr[i] - L('0');
				}else{
					return false;
				}
			}
			break;
		case L('o'):
			for(i = 1; i < tlen; i++){
				if(L('0') <= tstr[i] && tstr[i] <= L('7')){
					ui64 *= 8;
					ui64 += tstr[i] - L('0');
				}else{
					return false;
				}
			}
			break;
		case L('x'):
			for(i = 1; i < tlen; i++){
				if(L('0') <= tstr[i] && tstr[i] <= L('9')){
					ui64 *= 16;
					ui64 += tstr[i] - L('0');
				}else if(L('A') <= tstr[i] && tstr[i] <= L('F')){
					ui64 *= 16;
					ui64 += tstr[i] - L('A') + 10;
				}else if(L('a') <= tstr[i] && tstr[i] <= L('f')){
					ui64 *= 16;
					ui64 += tstr[i] - L('a') + 10;
				}else{
					return false;
				}
			}
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool Suuji(std::basic_string<intptr_t>& tk, Src& src)
	{
		const intptr_t ipsz64 =
			(sizeof(uint64_t) + sizeof(intptr_t) - 1) / sizeof(intptr_t);
		if (src.sst.i >= IDX(src.src.size())
			|| src.source[src.sst.i] != L('.')
			|| src.source[src.sst.i + 1] == L('.'))
		{
			uint64_t ui64 = 0;
			if (src.source[src.sst.t] == L('0')) {
				if (src.sst.i - src.sst.t == 1) {
				}
				else if (
					ZeroHajimari(
						ui64, src.source + src.sst.t + 1,
						src.sst.i - src.sst.t - 1))
				{
					tk += CONST_TOKEN;
					tk += ULONG_TOKEN;
					tk.resize(tk.size() + ipsz64);
					*(uint64_t*)(tk.data() + tk.size() - ipsz64) = ui64;
					return true;
				}
				else {
					src.addErrMes(L("Identifiers starting with numbers cannot be used."));
					return false;
				}
			}
			else {
				for (intptr_t i = src.sst.t; i < src.sst.i; i++) {
					if (L('0') <= src.source[i] && src.source[i] <= L('9')) {
						ui64 *= 10;
						ui64 += src.source[i] - L('0');
					}
					else {
						src.addErrMes(L("Identifiers starting with numbers cannot be used."));
						return false;
					}
				}
			}
			tk += CONST_TOKEN;
			tk += LONG_TOKEN;
			tk.resize(tk.size() + ipsz64);
			*(int64_t*)(tk.data() + tk.size() - ipsz64) = (int64_t)ui64;
			return true;
		}
		double f64 = 0.0;
		for (intptr_t i = src.sst.t; i < src.sst.i; i++) {
			if (L('0') <= src.source[i] && src.source[i] <= L('9')) {
				f64 *= 10;
				f64 += src.source[i] - L('0');
			}
			else {
				src.addErrMes(L("Identifiers starting with numbers cannot be used."));
				return false;
			}
		}
		src.sst.i++;
		if (!src.GetNumString()) {
			src.addErrMes(L("'0' required after decimal point."));
			return false;
		}
		double baisei = 0.0;
		for (intptr_t i = src.sst.i - 1; i >= src.sst.t; i--) {
			baisei += (double)(src.source[i] - L('0'));
			baisei /= 10.0;
		}
		baisei += f64;
		if (src.source[src.sst.i] != L('E')
			&& src.source[src.sst.i] != L('e')) {
			if (src.IsTSChar(src.source[src.sst.i])) {
				return koubuneraadesu(src);
			}

		}
		else {
			src.sst.i++;
			if (src.source[src.sst.i] == L('-')) {
				src.sst.i++;
				if (!src.GetNumString()) return koubuneraadesu(src);
				f64 = 0.0;
				for (auto i = src.sst.t; i < src.sst.i; i++) {
					f64 *= 10;
					f64 += src.source[i] - L('0');
				}
				if (f64 > 256) {
					baisei *= pow(10.0, -256);
					f64 -= 256;
				}
				baisei *= pow(10.0, -f64);
			}
			else {
				if (src.source[src.sst.i] == L('+')) src.sst.i++;
				if (!src.GetNumString()) return koubuneraadesu(src);
				f64 = 0.0;
				for (auto i = src.sst.t; i < src.sst.i; i++) {
					f64 *= 10;
					f64 += src.source[i] - L('0');
				}
				if (f64 > 256) {
					baisei *= pow(10.0, 256);
					f64 -= 256;
				}
				baisei *= pow(10.0, f64);
			}
		}
		tk += CONST_TOKEN;
		tk += DOUBLE_TOKEN;
		tk.resize(tk.size() + ipsz64);
		*(double*)(tk.data() + tk.size() - ipsz64) = baisei;
		return true;
	}
	MEMBER SourceTree* BlockOpen(
		const std::WSTR* const name, const BlockType type,
		const bool any, const bool create)
	{
		SourceTree* pst;
		if(type != FUNC_BLOCK && type != CLASS_BLOCK){
			if((pst = GetChild(name, false, any, create)) == nullptr){
				return nullptr;
			}
			pst->selftype = type;
			if(type == DELEGATE_BLOCK){
				pst->crp = pst;
				pst->breakinnest = false;
			}
			return pst;
		}
		if((pst = GetChild(name, true, any, create)) == nullptr) return nullptr;
		pst->selftype = type;
		return pst;
	}
	MEMBER bool IsOpen(const SourceTree& st)
	{
		for(intptr_t ii = 0; ii < IDX(funchensuu.size()); ii++){
			if(funchensuu[ii].size > 0){
				if(
					!isPublic((TokenKind)funchensuu[ii].type[0], st)
					|| funchensuu[ii].type[1] == REF_TOKEN
					|| funchensuu[ii].type[1] == LIST_TOKEN
					|| funchensuu[ii].type[1] == THREAD_TOKEN)
				{
					return false;
				}
				if(
					funchensuu[ii].type[1] == AND_TOKEN && (
						!stat->funclist.Get(
							funchensuu[ii].type[2])->IsOpen(st)))
				{
					return false;
				}
			}
		}
		return true;
	}
	MEMBER int32_t GetFuncId(const std::WSTR& name, const bool create)
	{
		SourceTree* pst;
		if((pst = frp->GetChild(&name, true, false, create)) != nullptr){
			return pst->funcid;
		}
		return -1;
	}
	MEMBER intptr_t GetMemberSize()
	{
		if(mbsize >= 0) return mbsize;
		intptr_t size = 0;
		for(intptr_t ii = 0; ii < IDX(funchensuu.size()); ii++){
			size += funchensuu[ii].size;
		}
		if(this->selftype == FUNC_BLOCK) size = Aligner(size);
		return mbsize = size;
	}
	MEMBER intptr_t GetMemberOffset(const intptr_t mbi)
	{
		intptr_t o = 0;
		for(SourceTree* pst = this; pst != frp; pst = pst->parent){
			if(
				pst == pst->crp
				&& pst->tpcount <= mbi
				&& mbi < pst->tpcount+pst->hikisuucount)
			{
				for(
					int i = frp->tpcount+frp->hikisuucount;
					i < pst->tpcount; i++)
				{
					o += frp->funchensuu[i].size;
				}
				for(int i = pst->tpcount+pst->hikisuucount-1; i > mbi; i--){
					o += frp->funchensuu[i].size;
				}
				return o;
			}
		}
		if(mbi < frp->tpcount+frp->hikisuucount){
			for(
				intptr_t i = frp->tpcount+frp->hikisuucount;
				i < IDX(frp->funchensuu.size()); i++)
			{
				o += frp->funchensuu[i].size;
			}
			o = Aligner(o);
			for(int i = frp->tpcount+frp->hikisuucount-1; i > mbi; i--){
				o += frp->funchensuu[i].size;
			}
		}else{
			for(int i = frp->tpcount+frp->hikisuucount; i < mbi; i++){
				o += frp->funchensuu[i].size;
			}
		}
		return o;
	}
	MEMBER void setHavedynrefTrue()
	{
		if(havedynref) return;
		havedynref = true;
		for(intptr_t i = 3; i < IDX(junkandata.size()); i += 3){
			if(junkandata[i] >= 0){
				stat->funclist.Get(junkandata[i])->setHavedynrefTrue();
			}
		}
	}
	MEMBER void CheckJunkanBetaClsSub(
		std::basic_string<int32_t>& idary, intptr_t tsize,
		std::basic_string<intptr_t>& jkd, intptr_t& ll)
	{
		intptr_t jj, kk;
		SourceTree* pst;
		for(intptr_t ii = 0; ii < IDX(funchensuu.size()); ii++){
			if(funchensuu[ii].size <= 0) continue;
			jj = 0;
			if(IsSoushokuToken((TokenKind)funchensuu[ii].type[0])) jj++;
			kk = jj;
			while(
				funchensuu[ii].type[jj] == REF_TOKEN
				|| funchensuu[ii].type[jj] == LIST_TOKEN || (
					funchensuu[ii].type[jj] == WARU_TOKEN
					&& (
						funchensuu[ii].type[jj+1] == REF_TOKEN
						|| funchensuu[ii].type[jj+1] == LIST_TOKEN)
					&& (jj++, kk++, true))) jj++;
			if(
				funchensuu[ii].type[jj] == AND_TOKEN || (
					funchensuu[ii].type[jj] == WARU_TOKEN
					&& funchensuu[ii].type[jj+1] == AND_TOKEN
					&& (jj++, kk++, true)))
			{
				kk = jj - kk;
				if(kk > 0){
					pst = stat->funclist.Get(funchensuu[ii].type[jj+1]);
					intptr_t mm = pst->CheckJunkan(idary);
					if(pst->havedynref) setHavedynrefTrue();
					if(mm >= 0){
						if(mm < ll) ll = mm;
						if(mm < IDX(idary.size())){
							jkd += tsize;
							jkd += pst->funcid;
							jkd += (intptr_t)(kk-1);
							if(havedynref) pst->setHavedynrefTrue();
						}
					}
				}else{
					pst = stat->funclist.Get(funchensuu[ii].type[jj+1]);
					pst->CheckJunkanBetaClsSub(idary, tsize, jkd, ll);
					if(pst->havedynref) setHavedynrefTrue();
				}
			}else if(jj > kk && funchensuu[ii].type[jj] == NULL_TOKEN){
				jkd += tsize;
				jkd += -1;
				jkd += (intptr_t)(jj - kk - 1);
				setHavedynrefTrue();
			}
			tsize += funchensuu[ii].size;
		}
	}
	MEMBER intptr_t CheckJunkan(std::basic_string<int32_t>& idary)
	{
		if(junkandata.size() > 0){
			if(havedynref) return 0;
			for(intptr_t ll = 0; ll < IDX(idary.size()); ll++){
				if(idary[ll] == funcid) return ll;
			}
			return -1;
		}
		int32_t fi;
		if(
			(fi = GetFuncId(L("break"), false)) < 0
			|| stat->funclist.Get(fi)->returnshita < 0)
		{
			return -1;
		}
		junkandata = GetMemberSize();
		junkandata += stat->funclist.Get(fi)->byteadress;
		idary += funcid;
		intptr_t ll = idary.size();
		CheckJunkanBetaClsSub(idary, 0, junkandata, ll);
		idary.pop_back();
		if(havedynref) ll = 0;
		if(ll <= IDX(idary.size())){
			sonota.junkanid = stat->ss->CircularGC.AddPL(junkandata);
			return ll;
		}
		junkandata.clear();
		return -1;
	}
	MEMBER bool IsJunkanAble()
	{
		if(sonota.junkanid < 0) return false;
		if(junkandata.size() > 0) return true;
		std::basic_string<int32_t> idary;
		return CheckJunkan(idary) >= 0 ? true : (sonota.junkanid = -1, false);
	}
	MEMBER SourceTree* IjouTansaku(
		const std::WSTR& name, intptr_t& memberichi)
	{
		SourceTree* pst;
		intptr_t sa;
		int32_t fi;
		pst = nullptr;
		sa = 0;
		fi = GetFuncId(name, false);
		if(fi >= 0){
			pst = stat->funclist.Get(fi);
			if(pst->selftype != FUNC_BLOCK || pst->isTemplate()){
				return nullptr;
			}
			if(!pst->kakutei) pst = nullptr;
		}
		if(pst == nullptr){
			for(auto i = funchensuu.begin(); i != funchensuu.end(); ++i){
				if(i->type[0] == CORE_TOKEN){
					SourceTree* opst = pst;
					pst =
						stat->funclist.Get((int32_t)i->type[2])
							->IjouTansaku(name, memberichi);
					if(pst != nullptr){
						if(opst != nullptr) return nullptr;
						memberichi += sa;
					}else{
						pst = opst;
					}
				}
				sa += i->size;
			}
		}
		return pst;
	}
	MEMBER SourceTree* GetIjousaki(intptr_t& memberichi)
	{
		if(
			parent == nullptr
			|| parent->selftype != CLASS_BLOCK || frp != this)
		{
			return nullptr;
		}
		return parent->IjouTansaku(myname, memberichi);
	}
	MEMBER bool isTemplate()
	{
		return
			tpcount > 0 && (
				funchensuu.size() < (size_t)tpcount || (
					funchensuu[tpcount-1].type.size() == 1
					&& funchensuu[tpcount-1].type[0] == TYPE_TOKEN));
	}
	MEMBER bool isEnable()
	{
		return kakutei && !isTemplate();
	}
	MEMBER bool isPublic(TokenKind token, const SourceTree& hkishiki)
	{
		return
			IsKoukaiHensuuToken(token) && (
				token != ATMARK_TOKEN || fileroot == hkishiki.fileroot);
	}
	MEMBER intptr_t TypeIdToSize(const int32_t typ) const
	{
		switch(typ){
		case BYTE_TYPEID:
			return sizeof(int8_t);
		case UBYTE_TYPEID:
			return sizeof(uint8_t);
		case SHORT_TYPEID:
			return sizeof(int16_t);
		case USHORT_TYPEID:
			return sizeof(uint16_t);
		case INT_TYPEID:
			return sizeof(int32_t);
		case UINT_TYPEID:
			return sizeof(uint32_t);
		case LONG_TYPEID:
			return sizeof(int64_t);
		case ULONG_TYPEID:
			return sizeof(uint64_t);
		case FLOAT_TYPEID:
			return sizeof(float);
		case DOUBLE_TYPEID:
			return sizeof(double);
		case CHAR_TYPEID:
			return sizeof(char16_t);
		case BOOL_TYPEID:
			return sizeof(bool);
		case ADDRESS_TYPEID:
			return sizeof(intptr_t);
		case FUNC_TYPEID:
		case METHOD_TYPEID:
			return sizeof(intptr_t);
		case DELEGATE_TYPEID:
			return Aliszof<intptr_t>()*3;
		case REF_TYPEID:
		case LIST_TYPEID:
		case TMPREF_TYPEID:
		case TMPLIST_TYPEID:
			return sizeof(Reference);
		case DYNREF_TYPEID:
		case DYNLIST_TYPEID:
		case TMPDYNREF_TYPEID:
		case TMPDYNLIST_TYPEID:
			return sizeof(DynamicRef);
		case VOID_TYPEID:
			return 0;
		default:
			if(typ < 0){
				if(ENDTHREAD_TYPEID <= typ && typ < 0) return sizeof(Thread);
				return -1;
			}
			switch((stat->funclist.Get(typ))->selftype){
			case CLASS_BLOCK:
				return stat->funclist.Get(typ)->GetMemberSize();
			case ENUM_BLOCK:
				return sizeof(int32_t);
			}
			break;
		}
		return -1;
	}
	MEMBER void GetTemplateNameSub(std::WSTR& name) const
	{
		if(myname[0] == L('\0')){
			std::basic_string<intptr_t> type;
			Reference r;
			(*(SourceTree**)(myname.data()+1))->GetTemplateNameSub(name);
			if(name.back() != L('!')) name += L(',');
			type.append(
				(intptr_t*)(myname.data()+TNT_OFFSET),
				(myname.size()-TNT_OFFSET)*sizeof(WCHR)
				/ sizeof(intptr_t));
			r.init();
			TypeIdtoName(r, GetTypeId(type));
			name.append((WCHR*)r.atpos(), r.len()/sizeof(WCHR));
		}else{
			name += myname;
			name += L('!');
		}
	}
	MEMBER void TypeIdtoName(Reference& r, const int32_t typ) const
	{
		switch(typ){
		case BYTE_TYPEID:
			PluginUtil::wstrToRef(r, L("byte"));
			break;
		case UBYTE_TYPEID:
			PluginUtil::wstrToRef(r, L("ubyte"));
			break;
		case SHORT_TYPEID:
			PluginUtil::wstrToRef(r, L("short"));
			break;
		case USHORT_TYPEID:
			PluginUtil::wstrToRef(r, L("ushort"));
			break;
		case INT_TYPEID:
			PluginUtil::wstrToRef(r, L("int"));
			break;
		case UINT_TYPEID:
			PluginUtil::wstrToRef(r, L("uint"));
			break;
		case LONG_TYPEID:
			PluginUtil::wstrToRef(r, L("long"));
			break;
		case ULONG_TYPEID:
			PluginUtil::wstrToRef(r, L("ulong"));
			break;
		case FLOAT_TYPEID:
			PluginUtil::wstrToRef(r, L("float"));
			break;
		case DOUBLE_TYPEID:
			PluginUtil::wstrToRef(r, L("double"));
			break;
		case CHAR_TYPEID:
			PluginUtil::wstrToRef(r, L("char"));
			break;
		case BOOL_TYPEID:
			PluginUtil::wstrToRef(r, L("bool"));
			break;
		case ADDRESS_TYPEID:
			PluginUtil::wstrToRef(r, L("index"));
			break;
		case FUNC_TYPEID:
			PluginUtil::wstrToRef(r, L("func"));
			break;
		case METHOD_TYPEID:
			PluginUtil::wstrToRef(r, L("method"));
			break;
		case DELEGATE_TYPEID:
			PluginUtil::wstrToRef(r, L("~"));
			break;
		case REF_TYPEID:
			PluginUtil::wstrToRef(r, L("^"));
			break;
		case LIST_TYPEID:
			PluginUtil::wstrToRef(r, L("%"));
			break;
		case DYNREF_TYPEID:
			PluginUtil::wstrToRef(r, L("ref"));
			break;
		case DYNLIST_TYPEID:
			PluginUtil::wstrToRef(r, L("list"));
			break;
		case VOID_TYPEID:
			PluginUtil::wstrToRef(r, L("void"));
			break;
		case SIGNATURE_TYPEID:
			PluginUtil::wstrToRef(r, L("$"));
			break;
		default:
			{
				std::WSTR tmp;
				if(typ < 0){
					if(~typ < stat->funclist.GetTotal()){
						tmp = L("thread!");
						if(stat->funclist.Get(~typ)->tpcount > 0){
							stat->funclist.Get(~typ)->GetTemplateNameSub(tmp);
							tmp += L('?');
						}else{
							tmp += stat->funclist.Get(~typ)->myname;
						}
						tmp += L('?');
					}else{
						tmp = L("<UNKNOWN>");
					}
				}else if(typ < stat->funclist.GetTotal()){
					switch(stat->funclist.Get(typ)->selftype){
					case CLASS_BLOCK:
						tmp = L('&');
						if(stat->funclist.Get(typ)->tpcount > 0){
							stat->funclist.Get(typ)->GetTemplateNameSub(tmp);
							tmp += L('?');
						}else{
							tmp += stat->funclist.Get(typ)->myname;
						}
						break;
					case ENUM_BLOCK:
						tmp = L('|');
						tmp += stat->funclist.Get(typ)->myname;
						break;
					default:
						if(
							stat->funclist.Get(typ)
							!= stat->funclist.Get(typ)->root)
						{
							if(stat->funclist.Get(typ)->tpcount > 0){
								stat->funclist
									.Get(typ)->GetTemplateNameSub(tmp);
								tmp += L('?');
							}else{
								tmp = stat->funclist.Get(typ)->myname;
							}
						}else{
							tmp = stat->funclist.Get(typ)->srce->filename;
						}
						break;
					}
				}else{
					tmp = L("<UNKNOWN>");
				}
				PluginUtil::wstrToRef(r, tmp);
			}
			break;
		}
	}
	MEMBER intptr_t GetTypeSize(const std::basic_string<intptr_t>& type) const
	{
		return TypeIdToSize(GetTypeId(type));
	}
	MEMBER int32_t GetTypeId(const std::basic_string<intptr_t>& type) const
	{
		intptr_t i;
		if(type[0] == NULL_TOKEN) return (int32_t)type[1];
		return TokenToTypeId(type.data(), i=0);
	}
	MEMBER bool YuruiKataCheckSub(
		intptr_t const* watasu, intptr_t wsize, intptr_t& widx,
		intptr_t const* toru, intptr_t tsize, intptr_t& tidx,
		const std::WSTR& filename, const intptr_t gyousuu) const
	{
		while(widx < wsize && tidx < tsize){
			if (toru[tidx] == STARSTAR_TOKEN) tidx++;
			if (watasu[widx] == STARSTAR_TOKEN) widx++;
			switch (toru[tidx]){
			case REF_TOKEN:
				if(watasu[widx] == LIST_TOKEN){
					tidx++;
					widx++;
					continue;
				}
				break;
			case FUNC_TOKEN:
			case METHOD_TOKEN:
			case TILDE_TOKEN:
				if(toru[tidx] == METHOD_TOKEN){
					tidx++;
					if(watasu[widx] == METHOD_TOKEN){
						widx++;
						if(
							watasu[widx] != toru[tidx] || (
								toru[tidx+2] == WARU_TOKEN
								&& watasu[widx+2] != WARU_TOKEN))
						{
							stat->ss->emes.Add(
								filename, gyousuu, L("Type error."));
							return false;
						}
					}else if(watasu[widx] != FUNC_TOKEN){
						stat->ss->emes.Add(
							filename, gyousuu, L("Type error."));
						return false;
					}
				}else{
					if(toru[tidx] != watasu[widx]){
						stat->ss->emes.Add(
							filename, gyousuu, L("Type error."));
						return false;
					}
				}
				widx++;
				tidx++;
				if(
					toru[tidx] != SIGNATURE_TOKEN
					|| watasu[widx] != SIGNATURE_TOKEN)
				{
					stat->ss->emes.Add(filename, gyousuu, L("Type error."));
					return false;
				}
				tidx++;
				widx++;
				SoushokuTobasi(toru, tidx);
				SoushokuTobasi(watasu, widx);
				break;
			}
			if(toru[tidx] == WARU_TOKEN){
				tidx++;
				if (IsRefReadOnlyToken((TokenKind)watasu[widx])) widx++;
				continue;
			}
			if(toru[tidx] == KAKERU_TOKEN){
				tidx++;
				if (watasu[widx] == KAKERU_TOKEN) widx++;
				continue;
			}
			if (toru[tidx] == AND_TOKEN || toru[tidx] == OR_TOKEN){
				if(
					watasu[widx++] != toru[tidx++]
					|| watasu[widx++] != toru[tidx++])
				{
					stat->ss->emes.Add(filename, gyousuu, L("Type error."));
					return false;
				}
				continue;
			}
			if(watasu[widx] != toru[tidx]){
				stat->ss->emes.Add(filename, gyousuu, L("Type error."));
				return false;
			}
			tidx++;
			widx++;
			switch(watasu[widx-1]){
			case SHOUKAKKOOPEN_TOKEN:
				if(
					!YuruiKataCheckSub(
						toru, tsize, tidx,
						watasu, wsize, widx, filename, gyousuu)) return false;
				break;
			case SHOUKAKKOCLOSE_TOKEN:
				return true;
			}
		}
		return true;
	}
	MEMBER bool YuruiKataCheck(
		const std::basic_string<intptr_t>& watasu,
		const std::basic_string<intptr_t>& toru,
		const std::WSTR& filename, const intptr_t gyousuu) const
	{
		intptr_t widx = 0, tidx = 0;
		SoushokuTobasi(watasu.data(), widx);
		SoushokuTobasi(toru.data(), tidx);
		if(
			!YuruiKataCheckSub(
				watasu.data(), watasu.size(), widx,
				toru.data(), toru.size(), tidx, filename, gyousuu))
		{
			return false;
		}
		if(tidx != toru.size()){
			stat->ss->emes.Add(filename, gyousuu, L("Type error."));
			return false;
		}
		return true;
	}
	STAMEM bool KansuuKataSub(
		intptr_t const* katmari, intptr_t& i,
		std::vector<std::basic_string<intptr_t>>& waketa)
	{
		if(
			katmari[i] != FUNC_TOKEN && katmari[i] != TILDE_TOKEN
			&& katmari[i] != PLUGIN_TOKEN)
		{
			if(katmari[i] != METHOD_TOKEN) return false;
			i++;
		}
		i++;
		waketa.resize(1);
		waketa[0].clear();
		if(katmari[i++] != SIGNATURE_TOKEN) return false;
		if(!FuncRetToken(waketa[0], katmari, i)) return false;
		if(katmari[i] != SHOUKAKKOOPEN_TOKEN) return false;
		if(katmari[i+1] == SHOUKAKKOCLOSE_TOKEN) return true;
		intptr_t j = 0;
		for(;;){
			i++;
			j++;
			waketa.resize(j+1);
			do{
				waketa[j] += katmari[i++];
				if(katmari[i-1] == FUNC_TOKEN || katmari[i-1] == TILDE_TOKEN){
					if(!FuncToken(waketa[j], katmari, i)) return false;
				}else if(katmari[i-1] == METHOD_TOKEN){
					waketa[j] += katmari[i++];
					if(!FuncToken(waketa[j], katmari, i)) return false;
				}else if(
					katmari[i-1] == AND_TOKEN || katmari[i-1] == OR_TOKEN
					|| katmari[i-1] == TILDE_TOKEN)
				{
					waketa[j] += katmari[i++];
				}
				if(katmari[i] == SHOUKAKKOCLOSE_TOKEN){
					i++;
					return true;
				}
			}while(katmari[i] != COMMA_TOKEN);
		}
		return true;
	}
	STAMEM bool KansuuKata(
		const SourceTree* const pstree,
		const std::basic_string<intptr_t>& katmari,
		std::vector<std::basic_string<intptr_t>>& waketa)
	{
		intptr_t i = 0;
		SoushokuTobasi(katmari.data(), i);
		auto kktop = i;
		if(katmari[i] == METHOD_TOKEN){
			i++;
			if(
				pstree == nullptr || (int32_t)katmari[i] != (
					pstree->touka ? pstree->parent->funcid : pstree->funcid))
			{
				return false;
			}
		}
		return KansuuKataSub(katmari.data(), i=kktop, waketa);
	}
	MEMBER bool GblhaniSet(Src& src, const SourceTree& hkishiki)
	{
		auto hani =
			root == hkishiki.root ? hkishiki.frp->gblhani : root->returnshita;
		if(hani < 0 || hani == INTPTR_MAX) hani = root->funchensuu.size();
		if(gblhani > hani){
			gblhani = hani;
			if(gblhani <= gblsaikouhani){
				src.addErrMes(
					L("A function that uses global variables that may not have been initialized."));
				stat->tokubetuerr = true;
				return false;
			}
		}
		return true;
	}
	MEMBER bool MbrhaniSet(Src& src, const SourceTree& hkishiki)
	{
		if(
			parent->selftype != CLASS_BLOCK
			&& (mbrhani == INTPTR_MAX || mbrhani > hkishiki.frp->mbrhani))
		{
			if(
				parent == hkishiki.frp->parent
				&& hkishiki.frp->mbrhani != INTPTR_MAX)
			{
				mbrhani = hkishiki.frp->mbrhani;
				if(mbrhani <= mbrsaikouhani){
					src.addErrMes(
						L("A function that uses member variables may not be initialized."));
					stat->tokubetuerr = true;
					return false;
				}
			}else{
				mbrhani = parent->funchensuu.size();
			}
		}
		return true;
	}
	MEMBER bool FuncTypeGet(
		Src& src, std::basic_string<intptr_t>& type,
		bool cont, const SourceTree& hkishiki)
	{
		if(this == root){
			src.addErrMes(L("root cannot be made into a function pointer."));
			return false;
		}
		if(returnshita < 0 && token.size() == 0){
			src.addErrMes(
				L("Cannot be converted into a function pointer because the signature has not been determined."));
			return false;
		}
		if(!GblhaniSet(src, hkishiki)) return false;
		if(!MbrhaniSet(src, hkishiki)) return false;
		type += SIGNATURE_TOKEN;
		type.append(rettype.data(), rettype.size());
		type += SHOUKAKKOOPEN_TOKEN;
		if(hikisuucount > 0){
			for(intptr_t i = tpcount; i < tpcount+hikisuucount; i++){
				type += funchensuu[i].type;
				type += COMMA_TOKEN;
			}
			type.back() = SHOUKAKKOCLOSE_TOKEN;
		}else{
			type += SHOUKAKKOCLOSE_TOKEN;
		}
		if(cont) type += funcid;
		return true;
	}
	template<typename TYPE> MEMBER void TankouConst(const TokenKind to, TYPE& x)
	{
		switch(to){
		case PULUS_TOKEN:
			break;
		case MINUS_TOKEN:
			x *= -1;
			break;
		case EXCLAMATION_TOKEN:
			x = ~x;
			break;
		case SHARP_TOKEN:
			if(x < 0) x *= -1;
			break;
		}
	}
	template<typename TYPE> MEMBER void TankouConstReal(
		const TokenKind to, TYPE& x)
	{
		switch(to){
		case PULUS_TOKEN:
			break;
		case MINUS_TOKEN:
			x *= -1;
			break;
		case SHARP_TOKEN:
			if(x < 0) x *= -1;
			break;
		}
	}
	template<typename TYPE> STAMEM bool ConstCast(
		std::basic_string<intptr_t>& last, TYPE& x)
	{
		intptr_t tmpi;
		tmpi = 0;
		if(last[tmpi] != CONST_TOKEN) return false;
		tmpi++;
		switch(last[tmpi++]){
		case BYTE_TOKEN:
			x = (TYPE)*(int8_t*)(last.data()+tmpi);
			break;
		case SHORT_TOKEN:
			x = (TYPE)*(int16_t*)(last.data()+tmpi);
			break;
		case INT_TOKEN:
			x = (TYPE)*(int32_t*)(last.data()+tmpi);
			break;
		case LONG_TOKEN:
			x = (TYPE)*(int64_t*)(last.data()+tmpi);
			break;
		case UBYTE_TOKEN:
			x = (TYPE)*(uint8_t*)(last.data()+tmpi);
			break;
		case USHORT_TOKEN:
			x = (TYPE)*(uint16_t*)(last.data()+tmpi);
			break;
		case UINT_TOKEN:
			x = (TYPE)*(uint32_t*)(last.data()+tmpi);
			break;
		case ULONG_TOKEN:
			x = (TYPE)*(uint64_t*)(last.data()+tmpi);
			break;
		case INDEX_TOKEN:
			x = (TYPE)*(intptr_t*)(last.data()+tmpi);
			break;
		case FLOAT_TOKEN:
			x = (TYPE)*(float*)(last.data()+tmpi);
			break;
		case DOUBLE_TOKEN:
			x = (TYPE)*(double*)(last.data()+tmpi);
			break;
		case CHAR_TOKEN:
			x = (TYPE)*(char16_t*)(last.data()+tmpi);
			break;
		case BOOL_TOKEN:
			x = (TYPE)*(bool*)(last.data()+tmpi);
			break;
		case OR_TOKEN:
			x = (TYPE)*(int32_t*)(last.data()+tmpi+1);
			break;
		default:
			return false;
		}
		return true;
	}
	template<typename TYPE> MEMBER intptr_t ConstCastint(
		const int32_t fromt, const void* const fromd, TYPE* const dstd)
	{
		switch(fromt){
		case BYTE_TYPEID:
			*dstd = (TYPE)*(int8_t*)fromd;
			return sizeof(int8_t);
		case SHORT_TYPEID:
			*dstd = (TYPE)*(int16_t*)fromd;
			return sizeof(int16_t);
		case INT_TYPEID:
			*dstd = (TYPE)*(int32_t*)fromd;
			return sizeof(int32_t);
		case LONG_TYPEID:
			*dstd = (TYPE)*(int64_t*)fromd;
			return sizeof(int64_t);
		case ADDRESS_TYPEID:
			*dstd = (TYPE)*(intptr_t*)fromd;
			return sizeof(intptr_t);
		}
		return -1;
	}
	template<typename TYPE> MEMBER intptr_t ConstCastuint(
		const int32_t fromt, const void* const fromd, TYPE* const dstd)
	{
		switch(fromt){
		case UBYTE_TYPEID:
			*dstd = (TYPE)*(uint8_t*)fromd;
			return sizeof(uint8_t);
		case USHORT_TYPEID:
			*dstd = (TYPE)*(uint16_t*)fromd;
			return sizeof(uint16_t);
		case UINT_TYPEID:
			*dstd = (TYPE)*(uint32_t*)fromd;
			return sizeof(uint32_t);
		case ULONG_TYPEID:
			*dstd = (TYPE)*(uint64_t*)fromd;
			return sizeof(uint64_t);
		}
		return -1;
	}
	template<typename TYPE> MEMBER intptr_t ConstCastReal(
		const int32_t fromt, const void* const fromd, TYPE* const dstd)
	{
		switch(fromt){
		case FLOAT_TYPEID:
			*dstd = (TYPE)*(float*)fromd;
			return sizeof(float);
		case DOUBLE_TYPEID:
			*dstd = (TYPE)*(double*)fromd;
			return sizeof(double);
		}
		return -1;
	}
	MEMBER intptr_t CastConst(
		const int32_t srct, const void* const srcd, const int32_t dstt,
		void* const dstd)
	{
		switch(dstt){
		case BYTE_TYPEID:
			return ConstCastint(srct, srcd, (int8_t*)dstd);
		case SHORT_TYPEID:
			return ConstCastint(srct, srcd, (int16_t*)dstd);
		case INT_TYPEID:
			return ConstCastint(srct, srcd, (int32_t*)dstd);
		case LONG_TYPEID:
			return ConstCastint(srct, srcd, (int64_t*)dstd);
		case ADDRESS_TYPEID:
			return ConstCastint(srct, srcd, (intptr_t*)dstd);
		case UBYTE_TYPEID:
			return ConstCastuint(srct, srcd, (uint8_t*)dstd);
		case USHORT_TYPEID:
			return ConstCastuint(srct, srcd, (uint16_t*)dstd);
		case UINT_TYPEID:
			return ConstCastuint(srct, srcd, (uint32_t*)dstd);
		case ULONG_TYPEID:
			return ConstCastuint(srct, srcd, (uint64_t*)dstd);
		case FLOAT_TYPEID:
			return ConstCastReal(srct, srcd, (float*)dstd);
		case DOUBLE_TYPEID:
			return ConstCastReal(srct, srcd, (double*)dstd);
		case BOOL_TYPEID:
			if(srct != BOOL_TYPEID) return -1;
			*(bool*)dstd = *(bool*)srcd;
			return sizeof(bool);
		case CHAR_TYPEID:
			if(srct != CHAR_TYPEID) return -1;
			*(char16_t*)dstd = *(char16_t*)srcd;
			return sizeof(char16_t);
		default:
			if(
				srct < 0 || srct > ENDCLASS_TYPEID || srct != dstt
				|| stat->funclist.Get(srct)->selftype != ENUM_BLOCK)
			{
				return -1;
			}
			*(int32_t*)dstd = *(int32_t*)srcd;
			return sizeof(int32_t);
		}
		return -1;
	}
	STAMEM bool ConstCaster(
		std::basic_string<intptr_t>& last,
		const std::basic_string<intptr_t>& type)
	{
		union{
			int8_t _byte; int16_t _short; int32_t _int; int64_t _long;
			uint8_t _ubyte; uint16_t _ushort; uint32_t _uint; uint64_t _ulong;
			float _float; double _double;
			intptr_t _index;
			char16_t _char;
			bool _bool;
		} x;
		intptr_t tmpi = 0;
		if(type[tmpi] != CONST_TOKEN) return false;
		tmpi++;
		switch(type[tmpi++]){
		case BYTE_TOKEN:
			if(!ConstCast(last, x._byte)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(int8_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(int8_t*)(
				last.data() + last.size()
				- (sizeof(int8_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._byte;
			break;
		case SHORT_TOKEN:
			if(!ConstCast(last, x._short)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(int16_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(int16_t*)(
				last.data() + last.size()
				- (sizeof(int16_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._short;
			break;
		case INT_TOKEN:
			if(!ConstCast(last, x._int)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(int32_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(int32_t*)(
				last.data() + last.size()
				- (sizeof(int32_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._int;
			break;
		case LONG_TOKEN:
			if(!ConstCast(last, x._long)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(int64_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(int64_t*)(
				last.data() + last.size()
				- (sizeof(int64_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._long;
			break;
		case UBYTE_TOKEN:
			if(!ConstCast(last, x._ubyte)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(uint8_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(uint8_t*)(
				last.data() + last.size()
				- (sizeof(uint8_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._ubyte;
			break;
		case USHORT_TOKEN:
			if(!ConstCast(last, x._ushort)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(uint16_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(uint16_t*)(
				last.data() + last.size()
				- (sizeof(uint16_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._ushort;
			break;
		case UINT_TOKEN:
			if(!ConstCast(last, x._uint)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(uint32_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(uint32_t*)(
				last.data() + last.size()
				- (sizeof(uint32_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._uint;
			break;
		case ULONG_TOKEN:
			if(!ConstCast(last, x._ulong)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(uint64_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(uint64_t*)(
				last.data() + last.size()
				- (sizeof(uint64_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._ulong;
			break;
		case INDEX_TOKEN:
			if(!ConstCast(last, x._index)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(intptr_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(intptr_t*)(
				last.data() + last.size()
				- (sizeof(intptr_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._index;
			break;
		case FLOAT_TOKEN:
			if(!ConstCast(last, x._float)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(float)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(float*)(
				last.data() + last.size()
				- (sizeof(float)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._float;
			break;
		case DOUBLE_TOKEN:
			if(!ConstCast(last, x._double)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(double)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(double*)(
				last.data() + last.size()
				- (sizeof(double)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._double;
			break;
		case CHAR_TOKEN:
			if(!ConstCast(last, x._char)) return false;
			last = type;
			last.resize(
				tmpi + (sizeof(char16_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
			*(char16_t*)(
				last.data() + last.size()
				- (sizeof(char16_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
			) = x._char;
			break;
		case BOOL_TOKEN:
		case OR_TOKEN:
		case REF_TOKEN:
			if(last.size()-1 > type.size()) return false;
			for(intptr_t ii = 0; ii < IDX(last.size())-1; ii++){
				if(last[ii] != type[ii]) return false;
			}
			break;
		case METHOD_TOKEN:
			if(last[tmpi-1] == FUNC_TOKEN){
				tmpi++;
				if(last[tmpi-1] != type[tmpi]) return false;
				tmpi++;
				intptr_t tmpii = -1;
				if(isPublicOrAt((TokenKind)type[tmpi])){
					tmpi++;
					tmpii--;
				}
				tmpii +=
					IsKoukaiHensuuToken((TokenKind)last[tmpi-tmpii]) ? 1 : 0;
				if(last.size()-tmpii-1 > type.size()) return false;
				for(tmpi += tmpii; tmpi < IDX(last.size())-1; tmpi++){
					if(last[tmpi] != type[tmpi-tmpii]) return false;
				}
				intptr_t pmpip = last.back();
				last.clear();
				last.append(type.data(), tmpi-tmpii);
				last += pmpip;
				break;
			}else if(last[tmpi-1] != METHOD_TOKEN){
				return false;
			}
			if(last[tmpi] != type[tmpi]) return false;
			tmpi++;
			if(false){
		case FUNC_TOKEN:
				if(last[tmpi-1] != FUNC_TOKEN) return false;
			}
			if(last[tmpi] != type[tmpi]) return false;
			tmpi++;
			{
				intptr_t tmpii = 0;
				if(isPublicOrAt((TokenKind)type[tmpi])){
					tmpi++;
					tmpii--;
				}else if(type[tmpi] == WARU_TOKEN){
					if(last[tmpi] != WARU_TOKEN) return false;
					tmpi++;
					tmpii--;
				}
				tmpii +=
					IsKoukaiHensuuToken((TokenKind)last[tmpi+tmpii]) ? 1 : 0;
				if(last.size()-tmpii-1 > type.size()) return false;
				for(tmpi += tmpii; tmpi < IDX(last.size())-1; tmpi++){
					if(last[tmpi] != type[tmpi-tmpii]) return false;
				}
				intptr_t pmpip = last.back();
				last.clear();
				last.append(type.data(), tmpi-tmpii);
				last += pmpip;
			}
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool ConstNanikaPath(
		Src& src, std::basic_string<intptr_t>& last,
		SourceTree& hkishiki, bool create, bool pub)
	{
		auto ci =
			PathtoClassID(
				src, FUNC_BLOCK, true, pub, true, hkishiki, create);
		if(ci < 0) return false;
		auto pst = stat->funclist.Get(ci);
		switch(pst->selftype){
		case FUNC_BLOCK:
			if(pst != pst->root){
				if(pst->parent == pst->root){
					last = CONST_TOKEN;
					last += FUNC_TOKEN;
					if(!pst->FuncTypeGet(src, last, true, hkishiki)){
						return false;
					}
				}else{
					last = CONST_TOKEN;
					last += METHOD_TOKEN;
					last += pst->parent->funcid;
					if(!pst->FuncTypeGet(src, last, true, hkishiki)){
						return false;
					}
				}
				break;
			}
		case CLASS_BLOCK:
			src.GetToken(hkishiki);
			src.GetToken(hkishiki);
			{
				std::WSTR name;
				src.appendTStr(name);
				auto phs = pst->GetHensuu(name, true);
				if(phs == nullptr){
					std::WSTR tmp;
					tmp = L('\'');
					tmp += name;
					tmp += L("' not found in member constant.");
					src.addErrMes(tmp);
					return false;
				}
				last = phs->type;
			}
			break;
		case ENUM_BLOCK:
			src.GetToken(hkishiki);
			if(src.GetToken(hkishiki) != OTHERKIND_TOKEN){
				return koubuneraadesu(src);
			}
			{
				std::WSTR name;
				src.appendTStr(name);
				auto phs = pst->GetHensuu(name, true);
				if(phs == nullptr){
					std::WSTR tmp;
					tmp = L('\'');
					tmp += name;
					tmp += L("' not found.");
					src.addErrMes(tmp);
					return false;
				}
				last = phs->type;
			}
			break;
		default:
			src.addErrMes(L("Error."));
			return false;
		}
		return true;
	}
	MEMBER bool ArgSub(
		Src& src, std::basic_string<intptr_t>* tk, SourceTree* const pst,
		std::basic_string<intptr_t>& type, TokenKind& kin, bool sig,
		bool refstar = false)
	{
		switch(type[0]){
		case REF_TOKEN:
			if(!pst->RefTouroku(type, nullptr)) return false;
			break;
		case LIST_TOKEN:
			if(!pst->ListTouroku(type, nullptr)) return false;
			break;
		case THREAD_TOKEN:
			if(!pst->ThreadTouroku(type, nullptr)) return false;
			break;
		case AND_TOKEN:
			if(!pst->ClassObjToroku(type, (int32_t)type[1], nullptr)){
				return false;
			}
			break;
		default:
			if(src.GetToken(*this) != OTHERKIND_TOKEN){
				return koubuneraadesu(src);
			}
			{
				std::WSTR name;
				src.appendTStr(name);
				auto size = GetTypeSize(type);
				if(size < 0){
					src.addErrMes(L("Error."));
					return false;
				}
				if(!pst->AddHensuu(type, name, size, src)) return false;
			}
			break;
		}
		if (!refstar) for each(auto it in type){
			if (it == KAKERU_TOKEN){
				src.addErrMes(L("'*' cannot be used as an argument."));
				return false;
			}
			else if (
				it != REF_TOKEN && it != LIST_TOKEN
				&& !IsSoushokuToken((TokenKind)it))
			{
				break;
			}
		}
		if (tk != nullptr) *tk += type;
		kin = src.GetToken(*this);
		if(sig){
			if(kin == DAINYUU_TOKEN){
				if(type.back() != ~DAINYUU_TOKEN){
					src.addErrMes(L("'=' is invalid."));
					return false;
				}
			}else{
				if(type.back() == ~DAINYUU_TOKEN) return gaarimasen(src, L("="));
			}
		}else{
			if(kin == DAINYUU_TOKEN){
				frp->funchensuu.back().type += ~DAINYUU_TOKEN;
				(tk != nullptr ? *tk : type) += ~DAINYUU_TOKEN;
			}
		}
		if(kin == DAINYUU_TOKEN){
			if(type[0] == TILDE_TOKEN){
				src.addErrMes(L("Anonymous functions cannot be passed by reference."));
				return false;
			}
			frp->funchensuu.back().size = sizeof(intptr_t);
			kin = src.GetToken(*this);
		}else{
			if(type[0] == THREAD_TOKEN){
				src.addErrMes(L("Thread type cannot be passed by value."));
				return false;
			}
			if(
				type[0] == AND_TOKEN
				&& !stat->funclist.Get((int32_t)type[1])->kakutei)
			{
				stat->funclist.Get((int32_t)type[1])->backpatch +=
					(intptr_t)frp;
				stat->funclist.Get((int32_t)type[1])->breakpatch +=
					frp->funchensuu.size()-1;
			}
		}
		frp->funchensuu.back().size = Aligner(frp->funchensuu.back().size);
		return true;
	}
	MEMBER intptr_t delegate(
		Src& src, std::basic_string<intptr_t>& tk,
		std::basic_string<intptr_t>* with = nullptr)
	{
		if(frp == root){
			src.addErrMes(L("Globally anonymous functions cannot be defined."));
			return -1;
		}
		tk += TILDE_TOKEN;
		auto pst = BlockOpen(nullptr, DELEGATE_BLOCK, false, true);
		if(pst == nullptr){
			src.addErrMes(L("This is a strange error."));
			return -1;
		}
		pst->srce = &src;
		pst->tpcount = (int)frp->funchensuu.size();
		pst->rettype.clear();
		tk += SIGNATURE_TOKEN;
		auto kin = src.GetToken(*this);
		bool tenten = kin == TENTEN_TOKEN;
		bool sig;
		intptr_t otksize = tk.size();
		if(tenten){
			sig = false;
		}else{
			src.setNextLast();
			if(!ReturnValType(pst->rettype, src, sig, true)) return -1;
		}
		std::vector<std::basic_string<intptr_t>> waketa;
		if(sig){
			std::basic_string<intptr_t> type;
			type = TILDE_TOKEN;
			type += pst->rettype;
			if(with || !KansuuKata(nullptr, type, waketa)){
				src.addErrMes(L("Error."));
				return -1;
			}
			pst->rettype = waketa[0];
		}
		tk += pst->rettype;
		if(!necessaryToken(src, *this, SHOUKAKKOOPEN_TOKEN)) return -1;
		tk += SHOUKAKKOOPEN_TOKEN;
		if(sig || with){
			pst->hikisuucount = with ? 1 : waketa.size()-1;
			kin = NULL_TOKEN;
			for(int i = 0; i < pst->hikisuucount; i++){
				if(kin == SHOUKAKKOCLOSE_TOKEN){
					src.addErrMes(L("Too few arguments."));
					return -1;
				}
				if(
					!ArgSub(
						src, &tk, pst, with ? *with : waketa[i + 1],
						kin, sig, with != nullptr))
				{
					return -1;
				}
				if(kin == COMMA_TOKEN){
					tk += COMMA_TOKEN;
				}else if(kin != SHOUKAKKOCLOSE_TOKEN){
					koubuneraadesu(src);
					return -1;
				}
			}
			if(kin == COMMA_TOKEN){
				src.addErrMes(L("Too many arguments."));
				return -1;
			}
			if(kin == NULL_TOKEN) kin = src.GetToken(*this);
			if(kin != SHOUKAKKOCLOSE_TOKEN){
					koubuneraadesu(src);
					return -1;
			}
		}else{
			pst->hikisuucount = 0;
			kin = src.GetToken(*this);
			while(kin != SHOUKAKKOCLOSE_TOKEN){
				src.setNextLast();
				std::basic_string<intptr_t> type;
				if(!TypeNanika(type, src, false, false, *this, true, false)){
					return -1;
				}
				pst->hikisuucount++;
				if(!ArgSub(src, &tk, pst, type, kin, sig)) return -1;
				switch(kin){
				case COMMA_TOKEN:
					tk += COMMA_TOKEN;
					src.GetToken(*this);
					continue;
				case SHOUKAKKOCLOSE_TOKEN:
					break;
				default:
					koubuneraadesu(src);
					return -1;
				}
				break;
			}
		}
		tk += SHOUKAKKOCLOSE_TOKEN;
		if(tenten){
			if(
				!pst->ReturnValType(pst->rettype, src, sig, true)
				|| (sig && !koubuneraadesu(src)))
			{
				return -1;
			}

			intptr_t tmp = tk.size();
			tk.resize(tmp + pst->rettype.size());
			for(tmp--; tmp >= otksize; tmp--){
				tk[tmp + pst->rettype.size()] = tk[tmp];
			}
			memcpy(
				(void*)(tk.data() + otksize),
				pst->rettype.data(), sizeof(intptr_t)*pst->rettype.size());
		}
		for each(auto it in pst->rettype){
			if (it == KAKERU_TOKEN){
				src.addErrMes(L("'*' cannot be used as the return value of an anonymous function."));
				return -1;
			}
			else if (
				it != REF_TOKEN && it != LIST_TOKEN
				&& !IsSoushokuToken((TokenKind)it))
			{
				break;
			}
		}
		tk += (intptr_t)pst;
		if(!necessaryToken(src, *this, CHUUKAKKOOPEN_TOKEN)) return -1;
		tk += CHUUKAKKOOPEN_TOKEN;
		auto ret = children.size()-1;
		tk += ret;
		if(!pst->MakeTree()) return -1;
		tk += CHUUKAKKOCLOSE_TOKEN;
		if(!necessaryToken(src, *this, DAIKAKKOCLOSE_TOKEN)) return -1;
		return ret;
	}
	MEMBER bool Literal(
		Src& src, const std::basic_string<intptr_t>& type,
		std::basic_string<intptr_t>& tk)
	{
		if(kakutei){
			src.addErrMes(L("It is no longer possible to allocate additional literal space for arrays."));
			return false;
		}
		std::basic_string<int8_t> lit;
		lit.resize(sizeof(Reference)+sizeof(HeapObjHead));
		auto kin = src.GetToken(*this);
		if(kin != DAIKAKKOCLOSE_TOKEN) for(;;){
			std::basic_string<intptr_t> last;
			if(
				!ConstShiki(
					src, NULL_TOKEN, kin, last,
					DAIKAKKOCLOSE_TOKEN, false, true)) return false;
			if(!ConstCaster(last, type)){
				src.addErrMes(L("Type error."));
				return false;
			}
			lit.append((int8_t*)(last.data()+type.size()), GetTypeSize(last));
			if(src.sst.last != COMMA_TOKEN) break;
			kin = src.GetToken(*this);
		}
		((Reference*)lit.data())->position = 0;
		((Reference*)lit.data())->length =
			lit.size() - (sizeof(Reference)+sizeof(HeapObjHead));
		((HeapObjHead*)(lit.data()+sizeof(Reference)))->refcount = 1;
		((HeapObjHead*)(lit.data()+sizeof(Reference)))->mutex = nullptr;
		((HeapObjHead*)(lit.data()+sizeof(Reference)))->datasize =
			lit.size() - (sizeof(Reference)+sizeof(HeapObjHead));
		tk += CONST_TOKEN;
		tk += REF_TOKEN;
		tk += WARU_TOKEN;
		tk.append(type.data()+1, type.size()-1);
		tk += stat->literaltotal;
		stat->literaltotal += lit.size();
		stat->literallist.push_back(lit);
		return true;
	}
	MEMBER void addStaticRef(const std::basic_string<int8_t>& data)
	{
		stat->literallist.push_back(std::basic_string<int8_t>());
		std::basic_string<int8_t>* plit = &stat->literallist.back();
		plit->resize(sizeof(Reference)+sizeof(HeapObjHead));
		*plit += data;
		((Reference*)plit->data())->position = 0;
		((Reference*)plit->data())->length =
			plit->size() - (sizeof(Reference)+sizeof(HeapObjHead));
		((HeapObjHead*)(plit->data()+sizeof(Reference)))->refcount = 1;
		((HeapObjHead*)(plit->data()+sizeof(Reference)))->mutex = nullptr;
		((HeapObjHead*)(plit->data()+sizeof(Reference)))->datasize =
			plit->size() - (sizeof(Reference)+sizeof(HeapObjHead));
		stat->literaltotal += plit->size();
	}
	MEMBER void addStaticString(const std::WSTR& str)
	{
		stat->literallist.push_back(std::basic_string<int8_t>());
		std::basic_string<int8_t>* plit = &stat->literallist.back();
		plit->resize(sizeof(Reference)+sizeof(HeapObjHead));
		plit->append((int8_t*)str.data(), str.size()*sizeof(WCHR));
		((Reference*)plit->data())->position = 0;
		((Reference*)plit->data())->length =
			plit->size() - (sizeof(Reference)+sizeof(HeapObjHead));
		((HeapObjHead*)(plit->data()+sizeof(Reference)))->refcount = 1;
		((HeapObjHead*)(plit->data()+sizeof(Reference)))->mutex = nullptr;
		((HeapObjHead*)(plit->data()+sizeof(Reference)))->datasize =
			plit->size() - (sizeof(Reference)+sizeof(HeapObjHead));
		stat->literaltotal += plit->size();
	}
	MEMBER bool ConstMojiretsu(
		Src& src, const std::WSTR& str, std::basic_string<intptr_t>& tk)
	{
		if(kakutei){
			src.addErrMes(L("It is no longer possible to allocate additional string literal space."));
			return false;
		}
		tk += CONST_TOKEN;
		tk += REF_TOKEN;
		tk += WARU_TOKEN;
		tk += CHAR_TOKEN;
		tk += stat->literaltotal;
		addStaticString(str);
		return true;
	}
	MEMBER bool ConstCast(
		Src& src, TokenKind kin, std::basic_string<intptr_t>& type,
		SourceTree& hkishiki, const TokenKind end, bool bubun, bool create)
	{
		if(!necessaryToken(src, hkishiki, SHOUKAKKOCLOSE_TOKEN)) return false;
		std::basic_string<intptr_t> typ;
		typ = CONST_TOKEN;
		typ += kin;
		kin = src.GetToken(hkishiki);
		if(kin == DAIKAKKOOPEN_TOKEN){
			type.clear();
			if(!hkishiki.Literal(src, typ, type)) return false;
		}else{
			if(
				!ConstNanika(
					src, kin, type, hkishiki, end, bubun, create, false))
			{
				return false;
			}
			if(!ConstCaster(type, typ)){
				src.addErrMes(L("Invalid casting."));
				return false;
			}
		}
		return true;
	}
	MEMBER std::basic_string<int8_t>* getLiteral(intptr_t offset)
	{
		intptr_t total = 0;
		for(
			auto i = root->stat->literallist.begin();
			i != root->stat->literallist.end(); ++i)
		{
			if(offset == total) return &*i;
			total += i->size();
		}
		return nullptr;
	}
	MEMBER bool ConstNanika(
		Src& src, const TokenKind kin,
		std::basic_string<intptr_t>& last, SourceTree& hkishiki,
		const TokenKind end, bool bubun, bool create, bool pub)
	{
		TokenKind ki;
		switch(kin){
		case BQUOT_TOKEN:
			if(
				hkishiki.frp == hkishiki.root
				|| hkishiki.frp->parent == hkishiki.root
				|| hkishiki.frp->selftype == CLASS_BLOCK)
			{
				src.addErrMes(L("` cannot be used here."));
				return false;
			}
			switch(src.GetToken(hkishiki)){
			case OTHERKIND_TOKEN:
				if(
					L('0') <= src.source[src.sst.t]
					&& src.source[src.sst.t] <= L('9'))
				{
					return koubuneraadesu(src);
				}
				if(
					!hkishiki.frp->parent->ConstNanika(
						src, OTHERKIND_TOKEN,
						last, hkishiki, end, bubun, create, false))
				{
						return false;
				}
				break;
			default:
				return koubuneraadesu(src);
			}
			break;
		case POINT_TOKEN:
		case ATMARK_TOKEN:
			if(
				src.GetToken(hkishiki) != OTHERKIND_TOKEN || (
					L('0') <= src.source[src.sst.t]
					&& src.source[src.sst.t] <= L('9')))
			{
				return koubuneraadesu(src);
			}
			{
				SourceTree* lib =
					kin == POINT_TOKEN ? hkishiki.root : hkishiki.fileroot;
				if(
					!lib->ConstNanika(
						src, OTHERKIND_TOKEN, last, hkishiki,
						end, bubun, create, kin != POINT_TOKEN))
				{
					return false;
				}
			}
			break;
		case OTHERKIND_TOKEN:
			if(L('0') <= src.source[src.sst.t] && src.source[src.sst.t] <= L('9')){
				last.clear();
				if(!Suuji(last, src)) return false;
			}else{
				std::WSTR name;
				src.appendTStr(name);
				auto oldsst = src.sst;
				switch(src.GetToken(hkishiki)){
				case EXCLAMATION_TOKEN:
				case COLOYAJIRUSHI_TOKEN:
				case COLOCOLO_TOKEN:
					src.sst = oldsst;
					src.setNextLast();
					if(!ConstNanikaPath(src, last, hkishiki, create, pub)){
						return false;
					}
					break;
				case SHOUKAKKOOPEN_TOKEN:
					return koubuneraadesu(src);
				default:
					src.sst = oldsst;
					auto phs = GetHensuu(name, false);
					if(phs == nullptr){
						src.setNextLast();
						if(!ConstNanikaPath(src, last, hkishiki, false, pub)){
							return false;
						}
						break;
					}
					switch(phs->type[0]){
					case LIB_TOKEN:
						if(src.GetToken(hkishiki) != POINT_TOKEN){
							src.addErrMes(L("lib types have no values."));
							return false;
						}
						if(
							src.GetToken(hkishiki) != OTHERKIND_TOKEN || (
								L('0') <= src.source[src.sst.t]
								&& src.source[src.sst.t] <= L('9')))
						{
							return koubuneraadesu(src);
						}
						if(
							!((SourceTree*)phs->type[1])->ConstNanika(
								src, OTHERKIND_TOKEN, last,
								hkishiki, end, bubun, create, true))
						{
							return false;
						}
						break;
					case TYPE_TOKEN:
						src.sst = oldsst;
						src.setNextLast();
						if(!ConstNanikaPath(src, last, hkishiki, create, pub)){
							return false;
						}
						break;
					case CONST_TOKEN:
						last = phs->type;
						break;
					default:
						src.addErrMes(
							L("You are trying to use something other than a constant in a constant expression."));
						return false;
					}
					break;
				}
			}
			break;
		case DQUOT_TOKEN:
		case BACKSLA_TOKEN:
			{
				std::WSTR name;
				src.setNextLast();
				if(!hkishiki.MjiretuLiteral(name, src)) return false;
				last.clear();
				if(!hkishiki.ConstMojiretsu(src, name, last)) return false;
			}
			break;
		case SQUOT_TOKEN:
			last = CONST_TOKEN;
			last += CHAR_TOKEN;
			{
				WCHR wc;
				if(!hkishiki.Moji(wc, src)) return false;
				last += wc;
			}
			break;
		case FALSE_TOKEN:
			last = CONST_TOKEN;
			last += BOOL_TOKEN;
			last += (intptr_t)false;
			break;
		case TRUE_TOKEN:
			last = CONST_TOKEN;
			last += BOOL_TOKEN;
			last += (intptr_t)true;
			break;
		case TYPESIZE_TOKEN:
			if(!necessaryToken(src, hkishiki, SHOUKAKKOOPEN_TOKEN)){
				return false;
			}
			{
				std::basic_string<intptr_t> type;
				if(
					!TypeNanika(
						type, src, false, false, hkishiki, false, false))
				{
					return false;
				}
				if(!necessaryToken(src, hkishiki, SHOUKAKKOCLOSE_TOKEN)){
					return false;
				}
				auto size = GetTypeSize(type);
				if(size < 0){
					src.addErrMes(L("Can't ask for size."));
					return false;
				}
				last = CONST_TOKEN;
				last += INDEX_TOKEN;
				last.resize(
					last.size()
					+ (sizeof(intptr_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
				*(intptr_t*)(
					last.data() +last.size()
					- (sizeof(intptr_t)+sizeof(intptr_t)-1)/sizeof(intptr_t)
				) = size;
			}
			break;
		case TYPEID_TOKEN:
			if(!necessaryToken(src, hkishiki, SHOUKAKKOOPEN_TOKEN)){
				return false;
			}
			{
				std::basic_string<intptr_t> type;
				if(
					!TypeNanika(
						type, src, false, false, hkishiki, false, false))
				{
					return false;
				}
				if(!necessaryToken(src, hkishiki, SHOUKAKKOCLOSE_TOKEN)){
					return false;
				}
				auto ti = GetTypeId(type);
				if(ti == UNKNOWN_TYPEID){
					src.addErrMes(L("Not asked for type ID"));
					return false;
				}
				last = CONST_TOKEN;
				last += INT_TOKEN;
				last.resize(
					last.size()
					+ (sizeof(int32_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
				*(int32_t*)(
					last.data() + last.size() - (
						sizeof(int32_t) + sizeof(intptr_t)-1)
					/ sizeof(intptr_t)) = ti;
			}
			break;
		case SHOUKAKKOOPEN_TOKEN:
			ki = src.GetToken(hkishiki);
			switch(ki){
			case BOOL_TOKEN:
			case BYTE_TOKEN:
			case CHAR_TOKEN:
			case DOUBLE_TOKEN:
			case FLOAT_TOKEN:
			case INT_TOKEN:
			case LONG_TOKEN:
			case SHORT_TOKEN:
			case UBYTE_TOKEN:
			case UINT_TOKEN:
			case ULONG_TOKEN:
			case USHORT_TOKEN:
			case INDEX_TOKEN:
				if(!ConstCast(src, ki, last, hkishiki, end, bubun, create)){
					return false;
				}
				break;
			case SHOUKAKKOCLOSE_TOKEN:
				src.addErrMes(L("Empty parentheses."));
				return false;
			case KAKERU_TOKEN:
			case OR_TOKEN:
				if(ki == OR_TOKEN) src.setNextLast();
				{
					std::basic_string<intptr_t> type;
					if(
						!TypeNanika(
							type, src, false, false, *this, false, false))
					{
						return false;
					}
					switch(type[0]){
					case BOOL_TOKEN:
					case BYTE_TOKEN:
					case CHAR_TOKEN:
					case DOUBLE_TOKEN:
					case FLOAT_TOKEN:
					case INT_TOKEN:
					case LONG_TOKEN:
					case SHORT_TOKEN:
					case UBYTE_TOKEN:
					case UINT_TOKEN:
					case ULONG_TOKEN:
					case USHORT_TOKEN:
					case INDEX_TOKEN:
						if(
							!ConstCast(
								src, (TokenKind)type[0], last,
								hkishiki, end, bubun, create))
						{
							return false;
						}
						break;
					default:
						{
							intptr_t idx = 0;
							auto ti = TokenToTypeId(type.data(), idx);
							if(
								ti >= 0 && ti <= ENDCLASS_TYPEID
								&& stat->funclist.Get(ti)->selftype
								== ENUM_BLOCK)
							{
								if(
									!necessaryToken(
										src, hkishiki, SHOUKAKKOCLOSE_TOKEN)
									|| !necessaryToken(
										src, hkishiki, DAIKAKKOOPEN_TOKEN))
								{
									return false;
								}
								type.resize(type.size()+1);
								for(idx = type.size()-1; idx >= 1; idx--){
									type[idx] = type[idx-1];
								}
								type[0] = CONST_TOKEN;
								last.clear();
								if(!hkishiki.Literal(src, type, last)){
									return false;
								}
							}else{
								src.addErrMes(
									L("Cannot be cast to this type."));
								return false;
							}
						}
					}
				}
				break;
			default:
				if(
					!hkishiki.ConstShiki(
						src, NULL_TOKEN, ki, last,
						SHOUKAKKOCLOSE_TOKEN, false, create)) return false;
				if(src.sst.last == COMMA_TOKEN){
					src.addErrMes(L("',' is not allowed."));
					return false;
				}
				break;
			}
			break;
		case PULUS_TOKEN:
		case MINUS_TOKEN:
		case EXCLAMATION_TOKEN:
		case SHARP_TOKEN:
			if(
				!ConstNanika(
					src, src.GetToken(hkishiki),
					last, hkishiki, end, bubun, create, false))
			{
				return false;
			}
			if(last[0] != CONST_TOKEN) return false;
			switch(last[1]){
			case BYTE_TOKEN:
				TankouConst(kin, *(int8_t*)(last.data()+2));
				break;
			case SHORT_TOKEN:
				TankouConst(kin, *(int16_t*)(last.data()+2));
				break;
			case INT_TOKEN:
				TankouConst(kin, *(int32_t*)(last.data()+2));
				break;
			case LONG_TOKEN:
				TankouConst(kin, *(int64_t*)(last.data()+2));
				break;
			case UBYTE_TOKEN:
				TankouConst(kin, *(uint8_t*)(last.data()+2));
				break;
			case USHORT_TOKEN:
				TankouConst(kin, *(uint16_t*)(last.data()+2));
				break;
			case UINT_TOKEN:
				TankouConst(kin, *(uint32_t*)(last.data()+2));
				break;
			case ULONG_TOKEN:
				TankouConst(kin, *(uint64_t*)(last.data()+2));
				break;
			case INDEX_TOKEN:
				TankouConst(kin, *(intptr_t*)(last.data()+2));
				break;
			case FLOAT_TOKEN:
				if(kin == EXCLAMATION_TOKEN){
					src.addErrMes(L("'!' cannot be used with floating point types."));
					return false;
				}
				TankouConstReal(kin, *(float*)(last.data()+2));
				break;
			case DOUBLE_TOKEN:
				if(kin == EXCLAMATION_TOKEN){
					src.addErrMes(L("'!' cannot be used with floating point types."));
					return false;
				}
				TankouConstReal(kin, *(double*)(last.data()+2));
				break;
			case CHAR_TOKEN:
				TankouConst(kin, *(char16_t*)(last.data()+2));
				break;
			case BOOL_TOKEN:
				if(kin == EXCLAMATION_TOKEN){
					*(bool*)(last.data()+2) = !*(bool*)(last.data()+2);
				}else if(kin == SHARP_TOKEN){
				}else{
					src.addErrMes(L("A sign cannot be attached to bool type."));
					return false;
				}
				break;
			case REF_TOKEN:
				if(kin != SHARP_TOKEN) return koubuneraadesu(src);
				{
					std::basic_string<int8_t>* lite = getLiteral(last.back());
					if(!lite){
						src.addErrMes(L("Strange error"));
						return false;
					}
					intptr_t idx = 2;
					auto size = TypeIdToSize(TokenToTypeId(last.data(), idx));
					last = CONST_TOKEN;
					last += INDEX_TOKEN;
					last +=
						(
							lite->size()
							- (sizeof(Reference) + sizeof(HeapObjHead)))
						/ size;
				}
				break;
			default:
				return koubuneraadesu(src);
			}
			break;
		case QUOTDOUBLE_TOKEN:
			if(
				!ConstNanika(
					src, src.GetToken(hkishiki),
					last, hkishiki, end, bubun, create, false))
			{
				return false;
			}
			{
				std::basic_string<intptr_t> temp;
				switch(last[1]){
				case BYTE_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(int8_t*)(last.data()+2)),
							temp)) return false;
					break;
				case SHORT_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(int16_t*)(last.data()+2)),
							temp)) return false;
					break;
				case INT_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(int32_t*)(last.data()+2)),
							temp)) return false;
					break;
				case LONG_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString(*(int64_t*)(last.data()+2)),
							temp)) return false;
					break;
				case UBYTE_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(uint8_t*)(last.data()+2)),
							temp)) return false;
					break;
				case USHORT_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(uint16_t*)(last.data()+2)),
							last)) return false;
					break;
				case UINT_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(uint32_t*)(last.data()+2)),
							temp)) return false;
					break;
				case ULONG_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString(*(uint64_t*)(last.data()+2)),
							temp)) return false;
					break;
				case INDEX_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, IntToString((int64_t)*(intptr_t*)(last.data()+2)),
							temp)) return false;
					break;
				case FLOAT_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, FloatToString(*(float*)(last.data()+2)),
							temp)) return false;
					break;
				case DOUBLE_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, FloatToString(*(double*)(last.data()+2)),
							temp)) return false;
					break;
				case CHAR_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, CharToString(*(char16_t*)(last.data()+2)),
							temp)) return false;
					break;
				case BOOL_TOKEN:
					if(
						!hkishiki.ConstMojiretsu(
							src, BoolToString(*(bool*)(last.data()+2)),
							temp)) return false;
					break;
				default:
					return koubuneraadesu(src);
				}
				last.swap(temp);
			}
			break;
		default:
			return koubuneraadesu(src);
		}
		if(last[1] == REF_TOKEN){
			std::basic_string<intptr_t> type, oldlast;
			std::basic_string<int8_t>* lite;
			intptr_t idx, size, tmpidx;
			auto oldsst = src.sst;
			ki = src.GetToken(hkishiki);
			if(ki == DAIKAKKOOPEN_TOKEN || ki == DIA_TOKEN){
				lite = getLiteral(last.back());
				if(!lite){
					src.addErrMes(L("Strange error"));
					return false;
				}
				if(
					(lite->size() - (sizeof(Reference) + sizeof(HeapObjHead)))
					== 0)
				{
					if(bubun && ki == DAIKAKKOOPEN_TOKEN) goto ELSE;
					src.addErrMes(L("Size is 0."));
					return false;
				}
				type = CONST_TOKEN;
				type.append(last.data()+3, last.size()-4);
				idx = 0;
				if(ki == DAIKAKKOOPEN_TOKEN){
					oldlast = last;
					if(
						!hkishiki.ConstShiki(
							src, NULL_TOKEN, src.GetToken(hkishiki),
							last, DAIKAKKOCLOSE_TOKEN, false, create))
					{
						if(!bubun || stat->tokubetuerr) return false;
						stat->ss->emes.Clear();
						last = oldlast;
						goto ELSE;
					}
					if(src.sst.last == COMMA_TOKEN){
						if(!bubun || stat->tokubetuerr){
							src.addErrMes(L(",' is not allowed."));
							return false;
						}
						last = oldlast;
						goto ELSE;
					}
					if(!ConstCaster(last, type)){
						if(!bubun || stat->tokubetuerr){
							src.addErrMes(L("Type error."));
							return false;
						}
						last = oldlast;
						goto ELSE;
					}
					idx = last.back();
				}
				last = type;
				size = TypeIdToSize(TokenToTypeId(last.data(), tmpidx=0));
				tmpidx =
					(
						lite->size()
						- (sizeof(Reference) + sizeof(HeapObjHead)))
					/ size;
				if(idx < 0 || idx >= tmpidx) idx = tmpidx-1;
				idx *= size;
				tmpidx = last.size();
				last.resize(
					tmpidx + (size + sizeof(intptr_t) - 1) / sizeof(intptr_t));
				memcpy(
					(void*)(last.data()+tmpidx),
					lite->data()+sizeof(Reference)+sizeof(HeapObjHead)+idx,
					size);
			}else{
ELSE:
				src.sst = oldsst;
			}
		}else if(last[1] == FLOAT_TOKEN || last[1] == DOUBLE_TOKEN){
			auto oldsst = src.sst;
			if(src.GetToken(hkishiki) == STARSTAR_TOKEN){
				std::basic_string<intptr_t> val;
				if(
					!hkishiki.ConstShiki(
						src, STARSTAR_TOKEN, src.GetToken(*this), val, end,
						false, create))
				{
					return false;
				}
				if(!EnzanConst(STARSTAR_TOKEN, last, val)){
					src.addErrMes(L("Constant error."));
					return false;
				}
			}else{
				src.setNextLast();
			}
		}
		return true;
	}
	template<typename TYPE> MEMBER bool NikouConst(
		const TokenKind to, TYPE& x,
		std::basic_string<intptr_t>& test, const TYPE y)
	{
		intptr_t b;
		switch(to){
		case KAKERU_TOKEN:
			x *= y;
			break;
		case WARU_TOKEN:
			if(y == 0) return false;
			x /= y;
			break;
		case AMARI_TOKEN:
			if(y == 0) return false;
			x %= y;
			break;
		case PULUS_TOKEN:
			x += y;
			break;
		case MINUS_TOKEN:
			x -= y;
			break;
		case LSHIFT_TOKEN:
			x <<= y;
			break;
		case RSHIFT_TOKEN:
			x >>= y;
			break;
		case SHOU_TOKEN:
			b = (intptr_t)(x < y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case SHOUOREQUAL_TOKEN:
			b = (intptr_t)(x <= y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case DAI_TOKEN:
			b = (intptr_t)(x > y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case DAIOREQUAL_TOKEN:
			b = (intptr_t)(x >= y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case EQUAL_TOKEN:
			b = (intptr_t)(x == y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case NOTEQUAL_TOKEN:
			b = (intptr_t)(x != y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case AND_TOKEN:
			x &= y;
			break;
		case XOR_TOKEN:
			x ^= y;
			break;
		case OR_TOKEN:
			x |= y;
			break;
		default:
			return false;
		}
		return true;
	}
	template<typename TYPE> MEMBER bool NikouConstReal(
		const TokenKind to, TYPE& x,
		std::basic_string<intptr_t>& test, const TYPE y)
	{
		intptr_t b;
		switch(to){
		case STARSTAR_TOKEN:
			x = pow(x, y);
			break;
		case KAKERU_TOKEN:
			x *= y;
			break;
		case WARU_TOKEN:
			x /= y;
			break;
		case PULUS_TOKEN:
			x += y;
			break;
		case MINUS_TOKEN:
			x -= y;
			break;
		case SHOU_TOKEN:
			b = (intptr_t)(x < y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case SHOUOREQUAL_TOKEN:
			b = (intptr_t)(x <= y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case DAI_TOKEN:
			b = (intptr_t)(x > y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case DAIOREQUAL_TOKEN:
			b = (intptr_t)(x >= y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case EQUAL_TOKEN:
			b = (intptr_t)(x == y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case NOTEQUAL_TOKEN:
			b = (intptr_t)(x != y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool NikouConstBool(const TokenKind to, bool& x, const bool y)
	{
		switch(to){
		case EQUAL_TOKEN:
			x = x == y;
			break;
		case NOTEQUAL_TOKEN:
			x = x != y;
			break;
		case AND_TOKEN:
			x = x && y;
			break;
		case XOR_TOKEN:
			x = x != y;
			break;
		case OR_TOKEN:
			x = x || y;
			break;
		case ANDAND_TOKEN:
			x = x && y;
			break;
		case OROR_TOKEN:
			x = x || y;
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool NikouConstEnum(
		const TokenKind to, const int32_t x,
		std::basic_string<intptr_t>& test, const int32_t y)
	{
		intptr_t b;
		switch(to){
		case SHOU_TOKEN:
			b = (intptr_t)(x < y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case SHOUOREQUAL_TOKEN:
			b = (intptr_t)(x <= y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case DAI_TOKEN:
			b = (intptr_t)(x > y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case DAIOREQUAL_TOKEN:
			b = (intptr_t)(x >= y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case EQUAL_TOKEN:
			b = (intptr_t)(x == y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case NOTEQUAL_TOKEN:
			b = (intptr_t)(x != y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool NikouConstFunc(
		const TokenKind to, const intptr_t x,
		std::basic_string<intptr_t>& test, const intptr_t y)
	{
		intptr_t b;
		switch(to){
		case EQUAL_TOKEN:
			b = (intptr_t)(x == y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case NOTEQUAL_TOKEN:
			b = (intptr_t)(x != y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool NikouConstRef(
		const TokenKind to, const intptr_t x,
		std::basic_string<intptr_t>& test, const intptr_t y)
	{
		intptr_t b;
		switch(to){
		case EQUAL_TOKEN:
			b = (intptr_t)(x == y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case NOTEQUAL_TOKEN:
			b = (intptr_t)(x != y);
			test = CONST_TOKEN;
			test += BOOL_TOKEN;
			test += b;
			break;
		case PULUS_TOKEN:
			{
				std::basic_string<int8_t> data;
				auto litx = getLiteral(x), lity = getLiteral(y);
				data.append(
					litx->data()+sizeof(Reference)+sizeof(HeapObjHead),
					litx->size() - (sizeof(Reference)+sizeof(HeapObjHead)));
				data.append(
					lity->data()+sizeof(Reference)+sizeof(HeapObjHead),
					lity->size() - (sizeof(Reference)+sizeof(HeapObjHead)));
				test.back() = stat->literaltotal;
				addStaticRef(data);
			}
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool EnzanConst(
		const TokenKind kin, std::basic_string<intptr_t>& test,
		std::basic_string<intptr_t>& last)
	{
		intptr_t tmpi;
		if(!ConstCaster(last, test)) return false;
		tmpi = 0;
		if(test[tmpi] != CONST_TOKEN) return false;
		tmpi++;
		switch(test[tmpi++]){
		case BYTE_TOKEN:
			if(
				!NikouConst(
					kin, *(int8_t*)(test.data()+tmpi), test,
					*(int8_t*)(last.data()+tmpi))) return false;
			break;
		case SHORT_TOKEN:
			if(
				!NikouConst(
					kin, *(int16_t*)(test.data()+tmpi), test,
					*(int16_t*)(last.data()+tmpi))) return false;
			break;
		case INT_TOKEN:
			if(
				!NikouConst(
					kin, *(int32_t*)(test.data()+tmpi), test,
					*(int32_t*)(last.data()+tmpi))) return false;
			break;
		case LONG_TOKEN:
			if(
				!NikouConst(
					kin, *(int64_t*)(test.data()+tmpi), test,
					*(int64_t*)(last.data()+tmpi))) return false;
			break;
		case UBYTE_TOKEN:
			if(
				!NikouConst(
					kin, *(uint8_t*)(test.data()+tmpi), test,
					*(uint8_t*)(last.data()+tmpi))) return false;
			break;
		case USHORT_TOKEN:
			if(
				!NikouConst(
					kin, *(uint16_t*)(test.data()+tmpi), test,
					*(uint16_t*)(last.data()+tmpi))) return false;
			break;
		case UINT_TOKEN:
			if(
				!NikouConst(
					kin, *(uint32_t*)(test.data()+tmpi), test,
					*(uint32_t*)(last.data()+tmpi))) return false;
			break;
		case ULONG_TOKEN:
			if(
				!NikouConst(
					kin, *(uint64_t*)(test.data()+tmpi), test,
					*(uint64_t*)(last.data()+tmpi))) return false;
			break;
		case INDEX_TOKEN:
			if(
				!NikouConst(
					kin, *(intptr_t*)(test.data()+tmpi), test,
					*(intptr_t*)(last.data()+tmpi))) return false;
			break;
		case FLOAT_TOKEN:
			if(
				!NikouConstReal(
					kin, *(float*)(test.data()+tmpi), test,
					*(float*)(last.data()+tmpi))) return false;
			break;
		case DOUBLE_TOKEN:
			if(
				!NikouConstReal(
					kin, *(double*)(test.data()+tmpi), test,
					*(double*)(last.data()+tmpi))) return false;
			break;
		case CHAR_TOKEN:
			if(
				!NikouConst(
					kin, *(char16_t*)(test.data()+tmpi), test,
					*(char16_t*)(last.data()+tmpi))) return false;
			break;
		case BOOL_TOKEN:
			if(
				!NikouConstBool(
					kin, *(bool*)(test.data()+tmpi),
					*(bool*)(last.data()+tmpi))) return false;
			break;
		case OR_TOKEN:
			if(
				!NikouConstEnum(
					kin, *(int32_t*)&test.back(), test,
					*(int32_t*)&last.back())) return false;
			break;
		case FUNC_TOKEN:
			if(
				!NikouConstFunc(
					kin, test.back(), test, last.back())) return false;
			break;
		case METHOD_TOKEN:
			if(
				!NikouConstFunc(
					kin, test.back(), test, last.back())) return false;
			break;
		case REF_TOKEN:
			if(
				!NikouConstRef(
					kin, test.back(), test, last.back())) return false;
			break;
		default:
			return false;
		}
		return true;
	}
	MEMBER bool ConstShiki(
		Src& src, const TokenKind enzansi, const TokenKind oskin,
		std::basic_string<intptr_t>& last, const TokenKind end,
		const bool bubun, bool create)
	{
		auto kin = oskin;
		if(kin != end){
			if(!ConstNanika(src, kin, last, *this, end, bubun, create, false)){
				return false;
			}
			auto oldsst = src.sst;
			while(
				DOLLAR_TOKEN <= (kin = src.GetToken(*this))
				&& kin <= QUESTION_TOKEN)
			{
				switch(enzansi){
				case NULL_TOKEN:
					break;
				case DOLLAR_TOKEN:
					src.setNextLast();
					return true;
				case STARSTAR_TOKEN://From the right
				case KAKERU_TOKEN:case WARU_TOKEN:case AMARI_TOKEN:
					if(kin >= KAKERU_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case PULUS_TOKEN:case MINUS_TOKEN:
					if(kin >= PULUS_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case LSHIFT_TOKEN:case RSHIFT_TOKEN:
					if(kin >= LSHIFT_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case SHOU_TOKEN:case SHOUOREQUAL_TOKEN:case DAI_TOKEN:
				case DAIOREQUAL_TOKEN:
					if(kin >= SHOU_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case EQUAL_TOKEN:case NOTEQUAL_TOKEN:
					if(kin >= EQUAL_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case AND_TOKEN:
					if(kin >= AND_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case XOR_TOKEN:
					if(kin >= XOR_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case OR_TOKEN:
					if(kin >= OR_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case ANDAND_TOKEN://From the right
					if(kin >= OROR_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case OROR_TOKEN://From the right
					if(kin >= QUESTION_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case QUESTION_TOKEN://From the right
					break;
				default:
					if(bubun) break;
					return koubuneraadesu(src);
				}
				auto tmp = src.sst;
				if(src.GetToken(*this) == end) return koubuneraadesu(src);
				src.setNextLast();
				if(kin == QUESTION_TOKEN){
					std::basic_string<intptr_t> type;
					type = CONST_TOKEN;
					type += BOOL_TOKEN;
					if(!ConstCaster(last, type)){
						src.addErrMes(L("Type error."));
						return false;
					}
					if(*(bool*)(last.data()+type.size())){
						std::basic_string<intptr_t> oldlast = last;
						if(
							!ConstShiki(
								src, QUESTION_TOKEN, src.GetToken(*this),
								last, COLON_TOKEN, false, create))
						{
							if(bubun){
								last = oldlast;
								src.sst = tmp;
								src.setNextLast();
								return true;
							}
							return false;
						}
						if(src.sst.last != COLON_TOKEN){
							return gaarimasen(src, L(":"));
						}
						std::basic_string<intptr_t> dummy;
						if(
							!ConstShiki(
								src, QUESTION_TOKEN, src.GetToken(*this),
								dummy, end, false, create))
						{
							if(bubun){
								last = oldlast;
								src.sst = tmp;
								src.setNextLast();
								return true;
							}
							return false;
						}
					}else{
						std::basic_string<intptr_t> dummy;
						if(
							!ConstShiki(
								src, QUESTION_TOKEN, src.GetToken(*this),
								dummy, COLON_TOKEN, false, create))
						{
							if(bubun){
								src.sst = tmp;
								src.setNextLast();
								return true;
							}
							return false;
						}
						if(src.sst.last != COLON_TOKEN){
							return gaarimasen(src, L(":"));
						}
						std::basic_string<intptr_t> oldlast = last;
						if(
							!ConstShiki(
								src, QUESTION_TOKEN, src.GetToken(*this),
								last, end, false, create))
						{
							if(bubun){
								last = oldlast;
								src.sst = tmp;
								src.setNextLast();
								return true;
							}
							return false;
						}
					}
				}else{
					std::basic_string<intptr_t> val;
					if(
						!ConstShiki(
							src, kin, src.GetToken(*this), val, end,
							false, create))
					{
						if(!bubun || stat->tokubetuerr) return false;
						stat->ss->emes.Clear();
						src.sst = oldsst;
						return true;
					}
					if(!EnzanConst(kin, last, val)){
						src.addErrMes(L("Constant error."));
						return false;
					}
				}
				oldsst = src.sst;
			}
		}else{
			if(bubun) return false;
		}
		if(bubun){
			src.setNextLast();
			return true;
		}
		if(
			enzansi != NULL_TOKEN
			&& !(enzansi == QUESTION_TOKEN && end == COLON_TOKEN))
		{
			src.setNextLast();
		}
		if(
			kin != end && (end != COLON_TOKEN || kin != COLOYAJIRUSHI_TOKEN)
			&& (end == NULL_TOKEN || kin != COMMA_TOKEN))
		{
			return koubuneraadesu(src);
		}
		return true;
	}
	MEMBER bool kansuuyobi(
		std::basic_string<intptr_t>& tk, intptr_t nidx,
		Src& src, SourceTree& hkishiki, const TokenKind end)
	{
		intptr_t tksize = tk.size();
		if(
			!hkishiki.Shiki(
				tk, src, NULL_TOKEN, src.GetToken(hkishiki),
				SHOUKAKKOCLOSE_TOKEN)) return false;
		bool dinyu = false;
		TokenKind kin = src.GetToken(hkishiki);
		if(kin == GYAKUDAINYUU_TOKEN){
			dinyu = true;
			std::basic_string<intptr_t> tmptk;
			if(
				!hkishiki.CSorNanika(
					tmptk, src, DOLLAR_TOKEN, src.GetToken(hkishiki), end))
			{
				return false;
			}
			tmptk += NULL_TOKEN;
			tmptk += DAINYUU_TOKEN;
			intptr_t ll = (tk.size()-nidx)-1;
			tk.resize(tk.size() + tmptk.size());
			for(; ll >= 0; ll--) tk[nidx+tmptk.size()+ll] = tk[nidx+ll];
			for(ll = 0; ll < IDX(tmptk.size()); ll++) tk[nidx+ll] = tmptk[ll];
			tksize += tmptk.size();
			tmptk.clear();
			kin = src.GetToken(hkishiki);
		}
		if(kin == SOTOCOMMA_TOKEN){
			if(IDX(tk.size()) > tksize) tk += COMMA_TOKEN;
			if(
				!hkishiki.CSorNanika(
					tk, src, DOLLAR_TOKEN, src.GetToken(hkishiki), end))
			{
				return false;
			}
		}else{
			src.setNextLast();
		}
		tk += SHOUKAKKOCLOSE_TOKEN;
		if(dinyu) tk += DAINYUU_TOKEN;
		return true;
	}
	MEMBER bool NanikaPath(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		const bool pub, SourceTree& hkishiki, const TokenKind end, bool create)
	{
		auto fi =
			PathtoClassID(src, FUNC_BLOCK, true, pub, true, hkishiki, create);
		if(fi < 0) return false;
		auto pst = stat->funclist.Get(fi);
		switch(pst->selftype){
		case FUNC_BLOCK:
			if(pst != pst->root){
				if(src.GetToken(hkishiki) != SHOUKAKKOOPEN_TOKEN){
					src.setNextLast();
					if(pst->parent == pst->root){
						tk += CONST_TOKEN;
						tk += FUNC_TOKEN;
						if(!pst->FuncTypeGet(src, tk, true, hkishiki)){
							return false;
						}
					}else{
						tk += CONST_TOKEN;
						tk += METHOD_TOKEN;
						tk += pst->parent->funcid;
						if(!pst->FuncTypeGet(src, tk, true, hkishiki)){
							return false;
						}
					}
				}else{
					if(pst == pst->root){
						src.addErrMes(L("Root cannot be called."));
						return false;
					}
					if(pst->parent == pst->root){
						tk += GLOBAL_TOKEN;
					}else if(pst->parent == hkishiki.frp->parent){
						tk += MEMBER_TOKEN;
					}else if(pst->parent != frp){
						src.addErrMes(L("This function cannot be called."));
						return false;
					}
					if(!pst->GblhaniSet(src, hkishiki)) return false;
					if(!pst->MbrhaniSet(src, hkishiki)) return false;
					tk += SHOUKAKKOOPEN_TOKEN;
					tk += ~fi;
					if(!kansuuyobi(tk, nidx, src, hkishiki, end)) return false;
				}
				break;
			}
		case CLASS_BLOCK:
			src.GetToken(hkishiki);
			src.GetToken(hkishiki);
			{
				std::WSTR name;
				src.appendTStr(name);
				auto phs = pst->GetHensuu(name, true);
				if(phs == nullptr){
					std::WSTR tmp;
					tmp = L('\'');
					tmp += name;
					tmp += L("' not found in member constant.");
					src.addErrMes(tmp);
					return false;
				}
				tk += phs->type;
			}
			break;
		case ENUM_BLOCK:
			src.GetToken(hkishiki);
			if(src.GetToken(hkishiki) != OTHERKIND_TOKEN){
				return koubuneraadesu(src);
			}
			{
				std::WSTR name;
				src.appendTStr(name);
				auto phs = pst->GetHensuu(name, true);
				if(phs == nullptr){
					std::WSTR tmp;
					tmp = L('\'');
					tmp += name;
					tmp += L("' not found.");
					src.addErrMes(tmp);
					return false;
				}
				tk += phs->type;
			}
			break;
		default:
			src.addErrMes(L("Error."));
			return false;
		}
		return true;
	}
	MEMBER bool RefDotNanika(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		const intptr_t* const iap, const TokenKind end, bool& kakunew)
	{
		kakunew = false;
		switch(src.GetToken(*this)){
		case NEW_TOKEN:
			if(iap[0] == NULL_TOKEN){
				src.addErrMes(L("Error."));
				return false;
			}
			if(
				iap[0] == AND_TOKEN
				&& !stat->funclist.Get((int32_t)iap[1])->kakutei)
			{
				auto ci =
					stat->funclist.Get((int32_t)iap[1])
						->GetFuncId(L("default"), true);
				if(ci < 0){
					src.addErrMes(L("Error."));
					return false;
				}
				if(!stat->funclist.Get(ci)->GblhaniSet(src, *this)){
					return false;
				}
				if(
					(ci = stat->funclist.Get((int32_t)iap[1])
						->GetFuncId(L("new"), true)) < 0)
				{
					src.addErrMes(L("Error."));
					return false;
				}
				if(!stat->funclist.Get(ci)->GblhaniSet(src, *this)){
					return false;
				}
				if(
					(ci = stat->funclist.Get((int32_t)iap[1])
						->GetFuncId(L("break"), true)) < 0)
				{
					src.addErrMes(L("Error."));
					return false;
				}
				if(!stat->funclist.Get(ci)->GblhaniSet(src, *this)){
					return false;
				}
				if(
					(ci = stat->funclist.Get((int32_t)iap[1])
						->GetFuncId(L("delete"), true)) < 0)
				{
					src.addErrMes(L("Error."));
					return false;
				}
				if(!stat->funclist.Get(ci)->GblhaniSet(src, *this)){
					return false;
				}
			}
			tk += NEW_TOKEN;
			switch(src.GetToken(*this)){
			case SHOUKAKKOOPEN_TOKEN:
				tk += SHOUKAKKOOPEN_TOKEN;
				if(
					!Shiki(tk, src, NULL_TOKEN, src.GetToken(*this),
					SHOUKAKKOCLOSE_TOKEN)) return false;
				tk += SHOUKAKKOCLOSE_TOKEN;
				break;
			case DAIKAKKOOPEN_TOKEN:
				kakunew = true;
				tk += DAIKAKKOOPEN_TOKEN;
				if(
					!Shiki(
						tk, src, NULL_TOKEN, src.GetToken(*this),
						DAIKAKKOCLOSE_TOKEN)) return false;
				tk += DAIKAKKOCLOSE_TOKEN;
				break;
			default:
				return koubuneraadesu(src);
			}
			break;
		case DIFF_TOKEN:
			tk += DIFF_TOKEN;
			break;
		case TYPESIZE_TOKEN:
			if(iap[0] != NULL_TOKEN){
				src.addErrMes(L("'typesize' error."));
				return false;
			}
			tk += TYPESIZE_TOKEN;
			break;
		case TYPEID_TOKEN:
			if(iap[0] != NULL_TOKEN){
				src.addErrMes(L("'typeid' error."));
				return false;
			}
			tk += TYPEID_TOKEN;
			break;
		case CAST_TOKEN:
			if(iap[0] != NULL_TOKEN){
				src.addErrMes(L("'cast' error."));
				return false;
			}
			if(!necessaryToken(src, *this, SHOUKAKKOOPEN_TOKEN)){
				return false;
			}
			tk += CAST_TOKEN;
			tk += SHOUKAKKOOPEN_TOKEN;
			if(
				!Shiki(
					tk, src, NULL_TOKEN, src.GetToken(*this),
					SHOUKAKKOCLOSE_TOKEN)) return false;
			tk += SHOUKAKKOCLOSE_TOKEN;
			break;
		case METHOD_TOKEN:
			if(iap[0] != NULL_TOKEN){
				src.addErrMes(L("'method' error"));
				return false;
			}
			tk += METHOD_TOKEN;
			if(!necessaryToken(src, *this, EXCLAMATION_TOKEN)) return false;
			{
				intptr_t foo = tk.size();
				if(!TypeNanika(tk, src, false, false, *this, true, false)){
					return false;
				}
				if(tk[foo] != SIGNATURE_TOKEN){
					src.addErrMes(L("No signature."));
					return false;
				}
			}
			if(!necessaryToken(src, *this, QUESTION_TOKEN)) return false;
			if(!necessaryToken(src, *this, TILDE_TOKEN)) return false;
			if(
				src.GetToken(*this) != OTHERKIND_TOKEN || (
					L('0') <= src.source[src.sst.t]
					&& src.source[src.sst.t] <= L('9')))
			{
				src.addErrMes(L("The method name is invalid."));
				return false;
			}
			tk += stat->literaltotal;
			{
				std::WSTR str;
				src.appendTStr(str);
				addStaticString(str);
			}
			if(!necessaryToken(src, *this, SHOUKAKKOOPEN_TOKEN)){
				return false;
			}
			tk += COLOCOLO_TOKEN;
			if(!kansuuyobi(tk, tk.size()-1, src, *this, end)) return false;
			tk += BACKSLA_TOKEN;
			break;
		case DAIKAKKOOPEN_TOKEN:
			{
				std::basic_string<intptr_t> type;
				type = *(iap-1);
				intptr_t i = 0;
				RefToken(type, iap, i);
				if(!withDelegate(tk, nidx, src, type)) return false;
			}
			break;
		default:
			return koubuneraadesu(src);
		}
		return true;
	}
	MEMBER bool ClassNanika(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		SourceTree& hkishiki, const std::basic_string<intptr_t>& type,
		intptr_t& jj, const bool coref, const TokenKind end)
	{
		TokenKind tkin = src.GetToken(hkishiki);
		if(
			tkin == OTHERKIND_TOKEN
			&& (src.source[src.sst.t] < L('0') || src.source[src.sst.t] > L('9')))
		{
			tk += POINT_TOKEN;
			jj++;
			int32_t tyki = (int32_t)type[jj];
			if(
				!stat->funclist.Get(tyki)->Nanika(
					tk, nidx, src, OTHERKIND_TOKEN,
					!coref
					&& (frp == frp->root || tyki!=frp->parent->funcid),
					hkishiki, end)) return false;
		}else if(tkin == DAIKAKKOOPEN_TOKEN){
			std::basic_string<intptr_t> typ;
			typ.append(type.data()+jj, type.size()-jj);
			if(typ.back() == ~DAINYUU_TOKEN) typ.pop_back();
			if(!hkishiki.withDelegate(tk, nidx, src, typ)) return false;
		}else{
			return koubuneraadesu(src);
		}
		return true;
	}
	MEMBER bool Moji(WCHR& wc, Src& src)
	{
		wc = src.GetChar();
		switch(wc){
		case L('\''):
			return koubuneraadesu(src);
		case L('\\'):
			if(!TokushuMoji(wc, src)) return false;
			break;
		}
		if(src.GetChar() != L('\'')) return koubuneraadesu(src);
		return true;
	}
	MEMBER bool withDelegate(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		std::basic_string<intptr_t>& type)
	{
		std::basic_string<intptr_t> tmptk;
		tmptk.append(tk.data(), nidx);
		auto del = delegate(src, tmptk, &type);
		if(del < 0) return false;
		if(
			frp->funchensuu[children[del]->hensuidx[0]].type.back()
			== ~DAINYUU_TOKEN)
		{
			tk += NULL_TOKEN;
			tk += DAINYUU_TOKEN;
			tk += COMMA_TOKEN;
		}
		tk += SHOUKAKKOCLOSE_TOKEN;
		tmptk += KAKKOCOLOOPEN_TOKEN;
		tmptk.append(tk.data()+nidx, tk.size()-nidx);
		tk.swap(tmptk);
		return true;
	}
	MEMBER bool Object(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		TokenKind kin, SourceTree& hkishiki,
		const std::basic_string<intptr_t>& type,
		intptr_t& jj, const TokenKind end)
	{
		bool kakunew = false;
		if(type[jj] == REF_TOKEN || type[jj] == LIST_TOKEN){
			if(type[jj+1] == NULL_TOKEN){
				if(kin == POINT_TOKEN){
					jj++;
					if(
						!hkishiki.RefDotNanika(
							tk, nidx, src, type.data()+jj, end, kakunew))
					{
						return false;
					}
				}else{
					src.setNextLast();
				}
			}else switch(kin){
			case DAIKAKKOOPEN_TOKEN:
			case DIA_TOKEN:
			case TILDE_TOKEN:
			case COLOYAJIRUSHI_TOKEN:
				for(;;){
					tk += kin == TILDE_TOKEN ? DIA_TOKEN : kin;
					if(kin == DAIKAKKOOPEN_TOKEN){
						if(
							!hkishiki.Shiki(
								tk, src, NULL_TOKEN,
								src.GetToken(hkishiki),
								DAIKAKKOCLOSE_TOKEN)) return false;
						tk += DAIKAKKOCLOSE_TOKEN;
						if(tk[tk.size()-2] == TENTEN_TOKEN) jj--;
					}
					auto oldkin = kin;
					kin =
						kin == TILDE_TOKEN
						? POINT_TOKEN : src.GetToken(hkishiki);
					if(
						oldkin == COLOYAJIRUSHI_TOKEN
						&& kin != DAIKAKKOOPEN_TOKEN
						&& kin != COLOYAJIRUSHI_TOKEN)
					{
						return koubuneraadesu(src);
					}
					switch(kin){
					case POINT_TOKEN:
						jj++;
						if (IsRefSoushokuToken((TokenKind)type[jj])) jj++;
						if(type[jj] == AND_TOKEN || type[jj] == OR_TOKEN){
							if(
								!ClassNanika(
									tk, nidx, src, hkishiki, type,
									jj, false, end))
							{
								return false;
							}
						}else if(
							type[jj] == REF_TOKEN || type[jj] == LIST_TOKEN)
						{
							jj++;
							if(
								!hkishiki.RefDotNanika(
									tk, nidx, src, type.data()+jj, end,
									kakunew))
							{
								return false;
							}
							if(
								kakunew	&& !Object(
									tk, nidx, src, src.GetToken(hkishiki),
									hkishiki, type, jj, end)) return false;
						}else{
							src.addErrMes(L("This is some kind of error."));
							return false;
						}
						break;
					case TENTEN_TOKEN:
						jj++;
						if(type[jj] == THREAD_TOKEN){
							if(
								!necessaryToken(
									src, hkishiki, SHOUKAKKOOPEN_TOKEN))
							{
								return false;
							}
							if(
								!stat->funclist.Get(type[jj+1])->GblhaniSet(
									src, hkishiki)) return false;
							tk += SHOUKAKKOOPEN_TOKEN;
							tk += TENTEN_TOKEN;
							if(
								!hkishiki.Shiki(
									tk, src, NULL_TOKEN,
									src.GetToken(hkishiki),
									SHOUKAKKOCLOSE_TOKEN))
							{
								return false;
							}
							tk += SHOUKAKKOCLOSE_TOKEN;
						}else{
							src.setNextLast();
							break;
						}
						break;
					case DAIKAKKOOPEN_TOKEN:
					case DIA_TOKEN:
					case TILDE_TOKEN:
					case COLOYAJIRUSHI_TOKEN:
						jj++;
						if (IsRefSoushokuToken((TokenKind)type[jj])) jj++;
						if(
							oldkin == COLOYAJIRUSHI_TOKEN
							&& kin == DAIKAKKOOPEN_TOKEN)
						{
							std::basic_string<intptr_t> type2;
							type2.append(type.data()+jj, type.size()-jj);
							if(hkishiki.delegate(src, tk, &type2) < 0) return false;
							break;
						}
						if(type[jj] != REF_TOKEN && type[jj] != LIST_TOKEN){
							src.addErrMes(L("It's not a reference type."));
							return false;
						}
						continue;
					default:
						src.setNextLast();
						break;
					}
					break;
				}
				break;
			case POINT_TOKEN:
				jj++;
				if(
					!hkishiki.RefDotNanika(
						tk, nidx, src, type.data()+jj, end, kakunew))
				{
					return false;
				}
				if(
					src.sst.last == DAIKAKKOCLOSE_TOKEN
					&& !Object(
						tk, nidx, src, src.GetToken(hkishiki), hkishiki,
						type, jj, end)) return false;
				break;
			default:
				src.setNextLast();
				break;
			}
		}else switch(kin){
		case POINT_TOKEN:
			if(type[0] == LIB_TOKEN){
				if(
					src.GetToken(hkishiki) != OTHERKIND_TOKEN || (
						L('0') <= src.source[src.sst.t]
						&& src.source[src.sst.t] <= L('9')))
				{
					return koubuneraadesu(src);
				}
				tk.pop_back();
				if(((SourceTree*)type[1]) != hkishiki.root){
					tk += type;
				}
				if(
					!((SourceTree*)type[1])->Nanika(
						tk, nidx, src, OTHERKIND_TOKEN,
						true, hkishiki, end))
				{
					return false;
				}
			}else{
				if(type[jj] == AND_TOKEN || type[jj] == OR_TOKEN){
					if(
						!ClassNanika(
							tk, nidx, src, hkishiki, type, jj,
							jj == 1 && type[0] == CORE_TOKEN, end))
					{
						return false;
					}
				}else if(src.GetToken(hkishiki) == DAIKAKKOOPEN_TOKEN){
					std::basic_string<intptr_t> typ;
					typ.append(type.data()+jj, type.size()-jj);
					if(typ.back() == ~DAINYUU_TOKEN) typ.pop_back();
					if(!hkishiki.withDelegate(tk, nidx, src, typ)){
						return false;
					}
				}else{
					src.addErrMes(L("'.' is not allowed."));
					return false;
				}
			}
			break;
		case TENTEN_TOKEN:
			if(type[jj] == THREAD_TOKEN){
				if(!necessaryToken(src, hkishiki, SHOUKAKKOOPEN_TOKEN)){
					return false;
				}
				if(!stat->funclist.Get(type[jj+1])->GblhaniSet(src, hkishiki)){
					return false;
				}
				tk += SHOUKAKKOOPEN_TOKEN;
				tk += TENTEN_TOKEN;
				if(
					!hkishiki.Shiki(
						tk, src, NULL_TOKEN, src.GetToken(hkishiki),
						SHOUKAKKOCLOSE_TOKEN)) return false;
				tk += SHOUKAKKOCLOSE_TOKEN;
				break;
			}
		default:
			src.setNextLast();
			break;
		}
		return true;
	}
	MEMBER bool Cast(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		const TokenKind kin, const bool pub, SourceTree& hkishiki,
		const TokenKind end)
	{
		if(!necessaryToken(src, hkishiki,  SHOUKAKKOCLOSE_TOKEN)) return false;
		if(
			!Nanika(
				tk, nidx, src, src.GetToken(hkishiki), pub, hkishiki, end))
		{
			return false;
		}
		tk += SHOUKAKKOOPEN_TOKEN;
		tk += kin;
		tk += SHOUKAKKOCLOSE_TOKEN;
		return true;
	}
	MEMBER bool KouchiEnzan(
		std::basic_string<intptr_t>& tk, Src& src, SourceTree& hkishiki,
		const TokenKind end)
	{
		for(;;){
			TokenKind ki = src.GetToken(hkishiki);
			switch(ki){
			case KAKKOCOLOOPEN_TOKEN:
				tk += KAKKOCOLOOPEN_TOKEN;
				if(
					!hkishiki.Shiki(
						tk, src, NULL_TOKEN, src.GetToken(hkishiki),
						KAKKOCOLOCLOSE_TOKEN)) return false;
				tk += SHOUKAKKOCLOSE_TOKEN;
				continue;
			case PLSPLS_TOKEN:
			case MNSMNS_TOKEN:
			case TOGGLE_TOKEN:
				tk += NULL_TOKEN;
				tk += ki;
				continue;
			case STARSTAR_TOKEN:
				if(
					!hkishiki.Shiki(
						tk, src, STARSTAR_TOKEN, src.GetToken(hkishiki),
						end)) return false;
				tk += STARSTAR_TOKEN;
				continue;
			}
			src.setNextLast();
			break;
		}
		return true;
	}
	MEMBER bool Nanika(
		std::basic_string<intptr_t>& tk, intptr_t nidx, Src& src,
		const TokenKind kin, const bool pub, SourceTree& hkishiki,
		const TokenKind end)
	{
		SourceState oldsst;
		std::WSTR name;
		Hensuu<SourceTree>* phs;
		TokenKind ki;
		intptr_t hidx, tidx;
		switch (kin) {
		case BQUOT_TOKEN:
			if (
				hkishiki.frp == hkishiki.root
				|| hkishiki.frp->parent == hkishiki.root
				|| hkishiki.frp->selftype == CLASS_BLOCK)
			{
				src.addErrMes(L("` cannot be used here."));
				return false;
			}
			switch (ki = src.GetToken(hkishiki)) {
			case OTHERKIND_TOKEN:
				if (
					L('0') <= src.source[src.sst.t]
					&& src.source[src.sst.t] <= L('9'))
				{
					return koubuneraadesu(src);
				}
			case SELF_TOKEN:
				if (
					!hkishiki.frp->parent->Nanika(
						tk, nidx, src, ki, pub, hkishiki, end))
				{
					return false;
				}
				break;
			default:
				if (hkishiki.frp->parent->selftype != CLASS_BLOCK) {
					src.addErrMes(L("You cannot refer to anything other than the class."));
					return false;
				}
				tk += NULL_TOKEN;
				tk += MEMBER_TOKEN;
				src.setNextLast();
				break;
			}
			break;
		case ATMARK_TOKEN:
			tk += LIB_TOKEN;
			tk += (intptr_t)hkishiki.fileroot;
		case POINT_TOKEN:
			if (
				src.GetToken(hkishiki) != OTHERKIND_TOKEN || (
					L('0') <= src.source[src.sst.t]
					&& src.source[src.sst.t] <= L('9')))
			{
				return koubuneraadesu(src);
			}
			{
				SourceTree* lib =
					kin == POINT_TOKEN ? hkishiki.root : hkishiki.fileroot;
				if (
					!lib->Nanika(
						tk, nidx, src, OTHERKIND_TOKEN,
						kin != POINT_TOKEN, hkishiki, end))
				{
					return false;
				}
			}
			break;
		case SHOU_TOKEN:
			if (src.GetToken(hkishiki) != OTHERKIND_TOKEN) {
				return koubuneraadesu(src);
			}
			{
				auto ot = src.sst.t;
				auto oi = src.sst.i;
				if (!necessaryToken(src, hkishiki, DAI_TOKEN)) return false;
				switch (ki = src.specialTagToken(src.source + ot, oi - ot)) {
				case WAIT_TOKEN:
				case CONSTEVAL_TOKEN:
					if (!necessaryToken(src, hkishiki, SHOUKAKKOOPEN_TOKEN)) {
						return false;
					}
					tk += ki;
					tk += SHOUKAKKOOPEN_TOKEN;
					if (
						!hkishiki.Shiki(
							tk, src, NULL_TOKEN, src.GetToken(hkishiki),
							SHOUKAKKOCLOSE_TOKEN)) return false;
					tk += SHOUKAKKOCLOSE_TOKEN;
					break;
				case IDNAME_TOKEN:
					if (!necessaryToken(src, hkishiki, SHOUKAKKOOPEN_TOKEN)) {
						return false;
					}
					if (
						!hkishiki.Shiki(
							tk, src, NULL_TOKEN, src.GetToken(hkishiki),
							SHOUKAKKOCLOSE_TOKEN)) return false;
					tk += IDNAME_TOKEN;
					break;
				default:
					return koubuneraadesu(src);
				}
			}
			break;
		case SHOUKAKKOOPEN_TOKEN:
			ki = src.GetToken(hkishiki);
			switch (ki) {
			case BOOL_TOKEN:
			case BYTE_TOKEN:
			case CHAR_TOKEN:
			case DOUBLE_TOKEN:
			case FLOAT_TOKEN:
			case INT_TOKEN:
			case LONG_TOKEN:
			case SHORT_TOKEN:
			case UBYTE_TOKEN:
			case UINT_TOKEN:
			case ULONG_TOKEN:
			case USHORT_TOKEN:
			case INDEX_TOKEN:
			case VOID_TOKEN:
				if (!Cast(tk, nidx, src, ki, pub, hkishiki, end)) {
					return false;
				}
				break;
			case SHOUKAKKOCLOSE_TOKEN:
				src.addErrMes(L("Empty parentheses."));
				return false;
			case KAKERU_TOKEN:
			{
				std::basic_string<intptr_t> type;
				if (
					!TypeNanika(
						type, src, false, false, *this, false, false))
				{
					return false;
				}
				switch (type[0]) {
				case BOOL_TOKEN:
				case BYTE_TOKEN:
				case CHAR_TOKEN:
				case DOUBLE_TOKEN:
				case FLOAT_TOKEN:
				case INT_TOKEN:
				case LONG_TOKEN:
				case SHORT_TOKEN:
				case UBYTE_TOKEN:
				case UINT_TOKEN:
				case ULONG_TOKEN:
				case USHORT_TOKEN:
				case INDEX_TOKEN:
				case VOID_TOKEN:
					if (
						!Cast(
							tk, nidx, src, (TokenKind)type[0],
							pub, hkishiki, end)) return false;
					break;
				default:
					src.addErrMes(L("Cannot be cast to this type."));
					return false;
				}
			}
			break;
			default:
				if (
					!hkishiki.Shiki(
						tk, src, NULL_TOKEN, ki, SHOUKAKKOCLOSE_TOKEN))
				{
					return false;
				}
				break;
			}
			break;
		case DAIKAKKOOPEN_TOKEN:
			if (hkishiki.delegate(src, tk) < 0) return false;
			break;
		case QUESTION_TOKEN:
			if (
				!hkishiki.CSorNanika(
					tk, src, DOLLAR_TOKEN,
					src.GetToken(hkishiki), end)) return false;
			tk += SQUOT_TOKEN;
			tk += QUESTION_TOKEN;
			break;
		case PULUS_TOKEN:
		case MINUS_TOKEN:
			if (
				!Nanika(
					tk, nidx, src, src.GetToken(hkishiki), pub, hkishiki,
					end)) return false;
			tk += NULL_TOKEN;
			tk += kin;
			break;
		case EXCLAMATION_TOKEN:
		case PLSPLS_TOKEN:
		case MNSMNS_TOKEN:
		case TOGGLE_TOKEN:
		case SHARP_TOKEN:
		case QUOTDOUBLE_TOKEN:
			if (
				!Nanika(
					tk, nidx, src, src.GetToken(hkishiki), pub, hkishiki,
					end)) return false;
			tk += kin;
			break;
		case SELF_TOKEN:
			src.setNextLast();
			if (!NanikaPath(tk, nidx, src, pub, hkishiki, end, false)) {
				return false;
			}
			break;
		case OTHERKIND_TOKEN:
			if (L('0') <= src.source[src.sst.t]
				&& src.source[src.sst.t] <= L('9')) {
				std::basic_string<intptr_t> cons;
				if (!Suuji(cons, src)) return false;
				tk += cons;
			}
			else {
				oldsst = src.sst;
				switch (ki = src.GetToken(hkishiki)) {
				case SHOUKAKKOOPEN_TOKEN:
				case EXCLAMATION_TOKEN:
				case COLOCOLO_TOKEN:
					COLOYAJIRUSHI:
						src.sst = oldsst;
						src.setNextLast();
						if (!NanikaPath(tk, nidx, src, pub,
							hkishiki, end, true)) {
							return false;
						}
						break;
				default:
					name.clear();
					name.append(src.source + oldsst.t, oldsst.i - oldsst.t);
					if (
						!(phs = GetHensuuIndex(name, hidx, false))
						|| phs->type[0] == TYPE_TOKEN)
					{
						if (!phs && ki == COLOYAJIRUSHI_TOKEN) {
							goto COLOYAJIRUSHI;
						}
						src.sst = oldsst;
						src.setNextLast();
						if (
							!NanikaPath(
								tk, nidx, src, pub, hkishiki, end, false))
						{
							return false;
						}
						break;
					}
					if (frp == root) {
						tk += GLOBAL_TOKEN;
					}
					else if (frp == hkishiki.frp->parent) {
						tk += MEMBER_TOKEN;
					}
					tk += ~hidx;
					if (phs->type[0] == PLUGIN_TOKEN) {
						if (ki != KAKKOCOLOOPEN_TOKEN) {
							return gaarimasen(src, L("(:"));
						}
						tk += KAKKOCOLOOPEN_TOKEN;
						if (
							!hkishiki.Shiki(
								tk, src, NULL_TOKEN, src.GetToken(hkishiki),
								KAKKOCOLOCLOSE_TOKEN)) return false;
						tk += SHOUKAKKOCLOSE_TOKEN;
						break;
					}
					tidx = 0;
					if (phs->type[tidx] == CONST_TOKEN) {
						tidx++;
					}
					else {
						if (hkishiki.root == frp) {
							if (hidx >= hkishiki.frp->gblhani) {
								src.addErrMes(
									L("It is possible to use uninitialized global variables."));
								return false;
							}
							if (hkishiki.frp->gblsaikouhani < hidx) {
								hkishiki.frp->gblsaikouhani = hidx;
							}
						}
						if (
							frp->selftype == FUNC_BLOCK
							&& hkishiki.frp->parent == frp)
						{
							if (hidx >= hkishiki.frp->mbrhani) {
								src.addErrMes(
									L("It is possible to use member variables before initialization."));
								return false;
							}
							if (hkishiki.frp->mbrsaikouhani < hidx) {
								hkishiki.frp->mbrsaikouhani = hidx;
							}
						}
						if (isPublic((TokenKind)phs->type[tidx], hkishiki)) {
							tidx++;
						}
						else if (pub && phs->type[tidx] != LIB_TOKEN) {
							std::WSTR tmp;
							tmp = L('\'');
							tmp += name;
							tmp += L("' is private.");
							src.addErrMes(tmp);
							return false;
						}
						else if (IsSoushokuToken((TokenKind)phs->type[tidx])) {
							tidx++;
						}
					}
					if (
						!Object(
							tk, nidx, src, ki, hkishiki, phs->type, tidx, end))
					{
						return false;
					}
				}
			}
			break;
		default:
			return koubuneraadesu(src);
		}
		return KouchiEnzan(tk, src, hkishiki, end);
	}
	MEMBER bool CSorNanika(
		std::basic_string<intptr_t>& tk, Src& src,
		const TokenKind enzansi, const TokenKind kin, const TokenKind end)
	{
		std::basic_string<intptr_t> cons;
		auto oldsst = src.sst;
		intptr_t nidx = tk.size();
		if(
			ConstShiki(src, enzansi, kin, cons, end, true, true)
			&& cons[1] != FUNC_TOKEN && cons[1] != METHOD_TOKEN)
		{
			tk += cons;
			if(cons[1] == REF_TOKEN){
				intptr_t jj = 1;
				if(
					!Object(
						tk, nidx, src, src.GetToken(*this), *this,
						cons, jj, end)
					|| !KouchiEnzan(tk, src, *this, end)) return false;
			}
		}else{
			if(stat->tokubetuerr) return false;
			stat->ss->emes.Clear();
			src.sst = oldsst;
			if(!Nanika(tk, nidx, src, kin, false, *this, end)) return false;
		}
		return true;
	}
	MEMBER bool Shiki(
		std::basic_string<intptr_t>& tk, Src& src,
		const TokenKind enzansi, const TokenKind oskin, const TokenKind end)
	{
		int comcnt = 0;
		return ShikiEx(tk, src, enzansi, oskin, end, comcnt);
	}
	MEMBER bool ShikiEx(
		std::basic_string<intptr_t>& tk, Src& src,
		const TokenKind enzansi, const TokenKind oskin, const TokenKind end,
		int& comcnt)
	{
		TokenKind kin, ki;
		kin = oskin;
		if(kin != end){
			if(!CSorNanika(tk, src, enzansi, kin, end)){
				return false;
			}
			while(
				DOLLAR_TOKEN <= (kin = src.GetToken(*this))
				&& kin <= (
					end == SEMICOLON_TOKEN
					? TENDAINYUU_TOKEN :  COMMA_TOKEN))
			{
				switch(enzansi){
				case NULL_TOKEN:
					break;
				case DOLLAR_TOKEN:
					src.setNextLast();
					return true;
				case STARSTAR_TOKEN://From the right
				case KAKERU_TOKEN:case WARU_TOKEN:case AMARI_TOKEN:
					if(kin >= KAKERU_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case PULUS_TOKEN:case MINUS_TOKEN:
					if(kin >= PULUS_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case LSHIFT_TOKEN:case RSHIFT_TOKEN:
					if(kin >= LSHIFT_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case SHOU_TOKEN:case SHOUOREQUAL_TOKEN:case DAI_TOKEN:
				case DAIOREQUAL_TOKEN:
					if(kin >= SHOU_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case EQUAL_TOKEN:case NOTEQUAL_TOKEN:
					if(kin >= EQUAL_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case AND_TOKEN:
					if(kin >= AND_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case XOR_TOKEN:
					if(kin >= XOR_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case OR_TOKEN:
					if(kin >= OR_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case ANDAND_TOKEN://From the right (to quickly jump to the end)
					if(kin >= OROR_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case OROR_TOKEN://From the right (to quickly jump to the end)
					if(kin >= QUESTION_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case QUESTION_TOKEN://From the right
					if(kin >= DAINYUU_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case DAINYUU_TOKEN:case PULUSDAINYUU_TOKEN:
				case MINUSDAINYUU_TOKEN:case KAKERUDAINYUU_TOKEN:
				case WARUDAINYUU_TOKEN:case AMARIDAINYUU_TOKEN:
				case ANDDAINYUU_TOKEN:case XORDAINYUU_TOKEN:
				case ORDAINYUU_TOKEN:case LSHIFTDAINYUU_TOKEN:
				case RSHIFTDAINYUU_TOKEN:case STARSTARDAINYUU_TOKEN://From the right
				case TENDAINYUU_TOKEN:
					if(kin >= TENDAINYUU_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				case TENTEN_TOKEN:
					if(end != DAIKAKKOCLOSE_TOKEN){
						src.addErrMes(L("The '..' operator only appears within '[ ]'."));
						return false;
					}
				case COMMA_TOKEN:
					if(kin >= TENTEN_TOKEN){
						src.setNextLast();
						return true;
					}
					break;
				default:
					return koubuneraadesu(src);
				}
				ki = src.GetToken(*this);
				if(
					(enzansi == NULL_TOKEN || enzansi == COMMA_TOKEN) && (
						end == SHOUKAKKOCLOSE_TOKEN
						|| end == KAKKOCOLOCLOSE_TOKEN)
					&& kin == DAINYUU_TOKEN
					&& (ki == end || ki == COMMA_TOKEN))
				{
					tk += NULL_TOKEN;
					tk += DAINYUU_TOKEN;
					tk += COMMA_TOKEN;
					if(ki == end){
						if(enzansi != NULL_TOKEN) src.setNextLast();
						return true;
					}
					kin = ki;
					ki = src.GetToken(*this);
				}
				if(ki == end) return koubuneraadesu(src);
				if(kin == DOLLAR_TOKEN){
					tk += kin;
				}else if(kin == COMMA_TOKEN){
					tk += kin;
					comcnt++;
				}else if(
					(ANDAND_TOKEN <= kin && kin <= QUESTION_TOKEN)
					|| (DAINYUU_TOKEN <= kin && kin <= TENDAINYUU_TOKEN)
					|| kin == TENTEN_TOKEN)
				{
					tk += NULL_TOKEN;
					tk += kin;
					if(kin == QUESTION_TOKEN){
						if(!Shiki(tk, src, QUESTION_TOKEN, ki, COLON_TOKEN)){
							return false;
						}
						if(src.sst.last != COLON_TOKEN){
							return gaarimasen(src, L(":"));
						}
						tk += COLON_TOKEN;
						src.GetToken(*this);
						ki = src.GetToken(*this);
					}
				}
				if(!Shiki(tk, src, kin, ki, end)) return false;
				if(kin != DOLLAR_TOKEN && kin != COMMA_TOKEN) tk += kin;
			}
		}
		if(enzansi != NULL_TOKEN) src.setNextLast();
		if(kin != end){
			if(end != SEMICOLON_TOKEN) return koubuneraadesu(src);
			if(kin != COMMA_TOKEN) return gaarimasen(src, L(";"));
		}
		return true;
	}
	MEMBER bool ganbattenatokasurusub(SourceTree* tmp, SourceTree* tmp2)
	{
		for(;;){
			while(tmp->extroot->isUsing(tmp2)){
				if(
					tmp2 == root || tmp2->extroot->subsrc == nullptr
					|| !ganbattenatokasurusub(tmp2, tmp2->extroot->subsrc))
				{
					return false;
				}
				tmp2 = tmp->extroot->subsrc;
			}
			tmp2->parent = tmp->parent;
			if(tmp->parent != nullptr) tmp->parent->extroot->subsrc = tmp2;
			tmp->parent = tmp2;
			tmp->extroot->subsrc = tmp2->extroot->subsrc;
			if(tmp2->extroot->subsrc != nullptr) tmp2->extroot->subsrc->parent = tmp;
			tmp2->extroot->subsrc = tmp;
			if(tmp2 == root) return true;
			tmp2 = tmp->extroot->subsrc;
			if(tmp2 == nullptr) break;
		}
		return false;
	}
	MEMBER bool ganbattenatokasuru(SourceTree* lib)
	{
		return ganbattenatokasurusub(lib, lib->extroot->subsrc);
	}
	MEMBER bool TypeNanikaPath(
		std::basic_string<intptr_t>& type, Src& src, const bool conf,
		const bool corf, SourceTree& hkishiki, const bool create, bool pub)
	{
		auto ci =
			PathtoClassID(src, FUNC_BLOCK, true, pub, true, hkishiki, create);
		if(ci < 0) return false;
		auto pst = stat->funclist.Get(ci);
		switch(pst->selftype){
		case FUNC_BLOCK:
			{
				auto tkin = src.GetToken(hkishiki);
				if(tkin == POINT_TOKEN){
					if(src.GetToken(hkishiki) != SIGNATURE_TOKEN){
						return koubuneraadesu(src);
					}
					std::basic_string<intptr_t> temp;
					if(!pst->FuncTypeGet(src, temp, false, hkishiki)){
						return false;
					}
					if(
						!TypeSignature(
							type, src, conf, corf, hkishiki, temp.data()))
					{
						return false;
					}
					break;
				}
				src.setNextLast();
			}
			if(pst != pst->root){
				type += NULL_TOKEN;
				type += ci;
				break;
			}
		case CLASS_BLOCK:
			src.GetToken(hkishiki);
			src.GetToken(hkishiki);
			{
				std::WSTR name;
				src.appendTStr(name);
				auto phs = pst->GetHensuu(name, false);
				if(phs->type[0] != TYPE_TOKEN){
					src.addErrMes(L("type is not a type"));
					return false;
				}
				type.append(phs->type.data()+1, phs->type.size()-1);
			}
			break;
		default:
			src.addErrMes(L("Error."));
			return false;
		}
		return true;
	}
	MEMBER bool TypeType(
		std::basic_string<intptr_t>& type, Src &src, const bool conf,
		const bool corf, SourceTree& hkishiki,
		const std::basic_string<intptr_t>& typ, intptr_t& idx)
	{
		if(conf){
			switch(typ[idx]){
			case LIST_TOKEN:
			case THREAD_TOKEN:
			case TILDE_TOKEN:
				src.addErrMes(L("It cannot be defined as a constant."));
				return false;
			}
		}
		if(corf && typ[idx] != AND_TOKEN){
			src.addErrMes(L("Not in class."));
			return false;
		}
		switch(typ[idx]){
		case SIGNATURE_TOKEN:
			if(
				!TypeSignature(
					type, src, conf, corf, hkishiki, typ.data()+idx))
			{
				return false;
			}
			break;
		case NULL_TOKEN:
		case FUNC_TOKEN:
		case METHOD_TOKEN:
		case TILDE_TOKEN:
			if(src.GetToken(hkishiki) == POINT_TOKEN){
				if(src.GetToken(hkishiki) != SIGNATURE_TOKEN){
					src.setNextLast();
				}else{
					std::basic_string<intptr_t> temp;
					if(typ[idx] == NULL_TOKEN){
						if(
							!stat->funclist.Get(typ[idx+1])->FuncTypeGet(
								src, temp, false, hkishiki)) return false;
					}else{
						if(typ[idx] == METHOD_TOKEN) idx++;
						idx++;
						temp.append(typ.data()+idx, typ.size()-idx);
					}
					if(
						!TypeSignature(
							type, src, conf, corf, hkishiki, temp.data()))
					{
						return false;
					}
					break;
				}
			}else{
				src.setNextLast();
			}
		default:
			type.append(typ.data()+idx, typ.size()-idx);
			break;
		}
		return true;
	}
	MEMBER bool TypeSignature(
		std::basic_string<intptr_t>& type, Src& src, const bool conf,
		const bool corf, SourceTree& hkishiki, const intptr_t* sig)
	{
		intptr_t idx = 0;
		if(src.GetToken(hkishiki) == POINT_TOKEN){
			auto oldsst = src.sst;
			if(src.GetToken(hkishiki) == RET_TOKEN){
				if(sig[idx++] != SIGNATURE_TOKEN) return koubuneraadesu(src);
				if(IsKoukaiHensuuToken((TokenKind)sig[idx])) idx++;
				std::basic_string<intptr_t> temp;
				if(!FuncRetToken(temp, sig, idx)) return koubuneraadesu(src);
				return TypeType(type, src, conf, corf, hkishiki, temp, idx=0);
			}else{
				src.sst = oldsst;
				src.setNextLast();
			}
		}else{
			src.setNextLast();
		}
		if(!FuncToken(type, sig, idx)) return koubuneraadesu(src);
		return true;
	}
	MEMBER bool TypeNanika(
		std::basic_string<intptr_t>& type, Src& src, const bool conf,
		const bool corf, SourceTree& hkishiki, const bool create, bool pub)
	{
		SourceState oldsst;
		Hensuu<SourceTree>* phs;
		intptr_t tidx;
		auto kin = src.GetToken(hkishiki);
		switch (kin){
		case BQUOT_TOKEN:
			if(
				hkishiki.frp == hkishiki.root
				|| hkishiki.frp->parent == hkishiki.root
				|| hkishiki.frp->selftype == CLASS_BLOCK)
			{
				src.addErrMes(L("'`' cannot be used here."));
				return false;
			}
			switch(src.GetToken(hkishiki)){
			case OTHERKIND_TOKEN:
			case SELF_TOKEN:
			case SIGNATURE_TOKEN:
				src.setNextLast();
				if(
					!hkishiki.frp->parent->TypeNanika(
						type, src, conf, corf, hkishiki, create, false))
				{
					return false;
				}
				break;
			default:
				return koubuneraadesu(src);
			}
			return true;
		case POINT_TOKEN:
		case ATMARK_TOKEN:
			{
				bool poi = kin == POINT_TOKEN;
				if(
					(kin = src.GetToken(hkishiki)) != OTHERKIND_TOKEN
					&& kin != SELF_TOKEN && kin != SIGNATURE_TOKEN)
				{
					return koubuneraadesu(src);
				}
				src.setNextLast();
				SourceTree* lib = poi ? hkishiki.root : hkishiki.fileroot;
				return
					lib->TypeNanika(
						type, src, conf, corf, hkishiki, create, !poi);
			}
		case SELF_TOKEN:
			if(frp->selftype == CLASS_BLOCK){
				type += AND_TOKEN;
			}else{
				if(corf){
					src.addErrMes(L("Not in class."));
					return false;
				}
				if(frp->selftype == ENUM_BLOCK){
					type += OR_TOKEN;
				}else{
					type += NULL_TOKEN;
				}
			}
			type += frp->funcid;
			return true;
		case SIGNATURE_TOKEN:
			if(frp->selftype != FUNC_BLOCK) return koubuneraadesu(src);
			{
				std::basic_string<intptr_t> temp;
				if(!frp->FuncTypeGet(src, temp, false, hkishiki)) return false;
				return
					TypeSignature(
						type, src, conf, corf, hkishiki, temp.data());
			}
		case BOOL_TOKEN:
		case BYTE_TOKEN:
		case CHAR_TOKEN:
		case DOUBLE_TOKEN:
		case FLOAT_TOKEN:
		case INT_TOKEN:
		case LONG_TOKEN:
		case SHORT_TOKEN:
		case UBYTE_TOKEN:
		case UINT_TOKEN:
		case ULONG_TOKEN:
		case USHORT_TOKEN:
		case INDEX_TOKEN:
		case VOID_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			type += kin;
			return true;
		case REF_TOKEN:
		case LIST_TOKEN:
			if(conf){
				src.addErrMes(L("Cannot be constant."));
				return false;
			}
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			type += kin;
			type += NULL_TOKEN;
			return true;
		case AMARI_TOKEN:
			if(conf){
				src.addErrMes(L("There is no constant list type."));
				return false;
			}
		case XOR_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			type += kin == XOR_TOKEN ? REF_TOKEN : LIST_TOKEN;
			kin = src.GetToken(hkishiki);
			if(
				kin == FUNC_TOKEN || kin == METHOD_TOKEN
				|| kin == TILDE_TOKEN)
			{
				src.addErrMes(L("Function pointers cannot be newed directly."));
				return false;
			}else{
				if(IsRefReadOnlyToken(kin)){
					if (kin != KAKERU_TOKEN && type.back() == LIST_TOKEN){
						src.addErrMes(L("list type cannot be made read-only."));
						return false;
					}
					type += kin;
				}else{
					src.setNextLast();
				}
				if(
					!TypeNanika(
						type, src, false, false, hkishiki, create, false))
				{
					return false;
				}
			}
			return true;
		case OR_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
		case AND_TOKEN:
			type += kin;
			{
				auto ci =
					PathtoClassID(
						src, kin == AND_TOKEN ? CLASS_BLOCK : ENUM_BLOCK,
						false, false, true, hkishiki, create);
				if(ci < 0) return false;
				type += (intptr_t)ci;
			}
			return true;
		case DOLLAR_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			type += SIGNATURE_TOKEN;
			return hkishiki.FuncType(type, src, create);
		case FUNC_TOKEN:
		case TILDE_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			type += kin;
			{
				auto tmp = type.size();
				if(
					!TypeNanika(
						type, src, conf, corf, hkishiki, create, false))
				{
					return false;
				}
				if(type[tmp] != SIGNATURE_TOKEN){
					src.addErrMes(L("No signature."));
					return false;
				}
			}
			return true;
		case METHOD_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			type += METHOD_TOKEN;
			type +=
				hkishiki.frp->touka
				? hkishiki.frp->parent->funcid : hkishiki.frp->funcid;
			{
				auto tmp = type.size();
				if(
					!TypeNanika(
						type, src, conf, corf, hkishiki, create, false))
				{
					return false;
				}
				if(type[tmp] != SIGNATURE_TOKEN){
					src.addErrMes(L("No signature."));
					return false;
				}
			}
			return true;
		case THREAD_TOKEN:
			if(corf){
				src.addErrMes(L("Not in class."));
				return false;
			}
			if(conf){
				src.addErrMes(L("There is no constant thread type."));
				return false;
			}
			type += THREAD_TOKEN;
			if(!necessaryToken(src, hkishiki, EXCLAMATION_TOKEN)) return false;
			{
				auto ci =
					PathtoClassID(
						src, FUNC_BLOCK, false, false, true, hkishiki, create);
				if(ci < 0) return false;
				if(
					stat->funclist.Get(ci)->parent
					!= stat->funclist.Get(ci)->root)
				{
					src.addErrMes(L("Not a global function."));
					return false;
				}
				type += (intptr_t)ci;
			}
			if(!necessaryToken(src, hkishiki, QUESTION_TOKEN)) return false;
			return true;
		case OTHERKIND_TOKEN:
			oldsst = src.sst;
			switch(src.GetToken(hkishiki)){
			case EXCLAMATION_TOKEN:
			case COLOYAJIRUSHI_TOKEN:
			case COLOCOLO_TOKEN:
				src.sst = oldsst;
				src.setNextLast();
				if(
					!TypeNanikaPath(
						type, src, conf, corf, hkishiki, create, pub))
				{
					return false;
				}
				break;
			default:
			{
				std::WSTR name;
				name.append(src.source + oldsst.t, oldsst.i - oldsst.t);
				if ((phs = GetHensuu(name, false)) == nullptr) {
					src.sst = oldsst;
					src.setNextLast();
					if (
						!TypeNanikaPath(
							type, src, conf, corf, hkishiki, create, pub))
					{
						return false;
					}
					break;
				}
				src.setNextLast();
				tidx = 0;
				for (;;) {
					if (phs->type[tidx] == TYPE_TOKEN) {
						tidx++;
						if (
							!TypeType(
								type, src, conf, corf, hkishiki, phs->type,
								tidx)) return false;
					}
					else if (
						(phs->type[tidx] == AND_TOKEN && (tidx++, true))
						|| (
							(
								IsSoushokuToken((TokenKind)phs->type[tidx])
								&& phs->type[tidx + 1] == AND_TOKEN)
							&& (tidx += 2, true)))
					{
						if (src.GetToken(hkishiki) != POINT_TOKEN) {
							return koubuneraadesu(src);
						}
						kin = src.GetToken(hkishiki);
						if (kin != SELF_TOKEN && kin != OTHERKIND_TOKEN) {
							return koubuneraadesu(src);
						}
						src.setNextLast();
						if (
							!stat->funclist.Get(phs->type[tidx])->TypeNanika(
								type, src, conf, corf, hkishiki,
								create, true)) return false;
					}
					else if (
						(
							phs->type[tidx] == REF_TOKEN
							|| phs->type[tidx] == LIST_TOKEN)
						|| (
							(
								IsSoushokuToken((TokenKind)phs->type[tidx])
								&& (
									phs->type[tidx + 1] == REF_TOKEN
									|| phs->type[tidx + 1] == LIST_TOKEN))
							&& (tidx++, true)))
					{
						if (corf) {
							src.addErrMes(L("Not in class."));
							return false;
						}
						switch (src.GetToken(hkishiki)) {
						case POINT_TOKEN:
							if (src.GetToken(hkishiki) != SELF_TOKEN) {
								return koubuneraadesu(src);
							}
							if (conf) {
								if (phs->type[tidx] == LIST_TOKEN) {
									src.addErrMes(
										L("There is no constant list type."));
									return false;
								}
								if (phs->type[tidx + 1] == NULL_TOKEN) {
									src.addErrMes(L("Error."));
									return false;
								}
							}
							if (phs->type[0] == CONST_TOKEN) {
								type.append(
									phs->type.data() + tidx,
									phs->type.size() - tidx - 1);
							}
							else {
								type.append(
									phs->type.data() + tidx,
									phs->type.size() - tidx);
							}
							break;
						case DIA_TOKEN:
							if (phs->type[tidx + 1] == NULL_TOKEN) {
								src.addErrMes(L("Error."));
								return false;
							}
							tidx++;
							continue;
						default:
							return koubuneraadesu(src);
						}
					}
					else if (phs->type[tidx] == LIB_TOKEN) {
						if (src.GetToken(hkishiki) != POINT_TOKEN) {
							return koubuneraadesu(src);
						}
						if (
							!((SourceTree*)phs->type[1])->TypeNanika(
								type, src, conf, corf, hkishiki,
								create, true)) return false;
					}
					else if (
						(
							phs->type[tidx] == FUNC_TOKEN
							|| phs->type[tidx] == METHOD_TOKEN
							|| phs->type[tidx] == TILDE_TOKEN)
						|| (
							(
								IsSoushokuToken((TokenKind)phs->type[tidx])
								&& (
									phs->type[tidx + 1] == FUNC_TOKEN
									|| phs->type[tidx + 1] == METHOD_TOKEN))
							&& (tidx++, true)))
					{
						if (corf) {
							src.addErrMes(L("Not in class."));
							return false;
						}
						if (conf && phs->type[tidx] == TILDE_TOKEN) {
							src.addErrMes(L("It cannot be a constant."));
							return false;
						}
						if (src.GetToken(hkishiki) != POINT_TOKEN) {
							return koubuneraadesu(src);
						}
						switch (src.GetToken(hkishiki)) {
						case SELF_TOKEN:
							if (phs->type[0] == CONST_TOKEN) {
								type.append(
									phs->type.data() + tidx,
									phs->type.size() - tidx - 1);
							}
							else {
								type.append(
									phs->type.data() + tidx,
									phs->type.size() - tidx);
							}
							break;
						case SIGNATURE_TOKEN:
							tidx++;
							if (phs->type[tidx] == METHOD_TOKEN) tidx++;
							{
								std::basic_string<intptr_t> temp;
								if (phs->type[0] == CONST_TOKEN) {
									temp.append(
										phs->type.data() + tidx,
										phs->type.size() - tidx - 1);
								}
								else {
									temp.append(
										phs->type.data() + tidx,
										phs->type.size() - tidx);
								}
								if (
									!TypeSignature(
										type, src, conf, corf, hkishiki,
										temp.data())) return false;
							}
							break;
						default:
							return koubuneraadesu(src);
						}
					}
					else {
						if (IsSoushokuToken((TokenKind)phs->type[tidx])) tidx++;
						if (corf) {
							src.addErrMes(L("Not in class."));
							return false;
						}
						if (conf && phs->type[tidx] == THREAD_TOKEN) {
							src.addErrMes(L("There is no constant thread type."));
							return false;
						}
						if (
							src.GetToken(hkishiki) != POINT_TOKEN
							|| src.GetToken(hkishiki) != SELF_TOKEN)
						{
							return koubuneraadesu(src);
						}
						if (
							phs->type[tidx] == OR_TOKEN
							|| phs->type[tidx] == THREAD_TOKEN)
						{
							type.append(phs->type.data() + tidx, 2);
						}
						else {
							type += phs->type[tidx];
						}
					}
					break;
				}
				break;
			}
			}
			if(type.back() == ~DAINYUU_TOKEN) type.pop_back();
			return true;
		}
		return koubuneraadesu(src);
	}
	MEMBER SourceTree* LibNanikaPath(Src &src, SourceTree &hkishiki, bool pub)
	{
		SourceTree* ret = nullptr;
		auto fi =
			PathtoClassID(
				src, FUNC_BLOCK, true, pub, true, hkishiki, false);
		if(fi < 0) return nullptr;
		switch(stat->funclist.Get(fi)->selftype){
		case FUNC_BLOCK:
			if(stat->funclist.Get(fi) != stat->funclist.Get(fi)->root){
				src.addErrMes(L("Error."));
				return nullptr;
			}
		case CLASS_BLOCK:
			src.GetToken(hkishiki);
			src.GetToken(hkishiki);
			{
				std::WSTR name;
				src.appendTStr(name);
				auto phs = stat->funclist.Get(fi)->GetHensuu(name, false);
				if(phs->type[0] != LIB_TOKEN){
					src.addErrMes(L("Not a lib type."));
					return nullptr;
				}
				ret = (SourceTree*)phs->type[1];
			}
			break;
		default:
			src.addErrMes(L("Error."));
			return nullptr;
		}
		return ret;
	}
	MEMBER bool LibPath(Src& src, std::WSTR& name)
	{
		TokenKind kin;
		kin = src.GetToken(*this);
		name.clear();
		switch(kin){
		case DQUOT_TOKEN:
		case BACKSLA_TOKEN:
		case SHOU_TOKEN:
			if(kin == SHOU_TOKEN){
				src.Find(L('>'));
				src.appendTStr(name);
				src.sst.i++;
			}else{
				src.setNextLast();
				if(!MjiretuLiteral(name, src)) return false;
			}
			if(name.size() <= 0){
				src.addErrMes(L("File name is empty."));
				return false;
			}
			{
				std::WSTR path;
				if(
					!KanzenPath(
						name,
						kin==SHOU_TOKEN
						? (path=stat->ss->exedir, path+=L("lib/"))
						: src.filename))
				{
					src.addErrMes(L("Failed to convert to absolute path."));
					return false;
				}
			}
			break;
		default:
			return koubuneraadesu(src);
		}
		return true;
	}
	MEMBER SourceTree* LibNanika(Src &src, SourceTree &hkishiki, bool pub)
	{
		SourceTree *ret = nullptr;
		SourceState oldsst;
		TokenKind kin = src.GetToken(hkishiki);
		switch (kin) {
		case DQUOT_TOKEN:
		case BACKSLA_TOKEN:
		case SHOU_TOKEN:
			src.setNextLast();
			{
				std::WSTR name;
				if (!hkishiki.LibPath(src, name)) return nullptr;
				if (stat->srclist.find(name) != stat->srclist.end()) {
					if (!root->kakutei) {
						auto pst = stat->srclist[name];
						do {
							if (pst == root) {
								src.addErrMes(
									L("Circular references to libraries are not possible."));
								return nullptr;
							}
							pst = pst->extroot->subsrc;
						} while (pst != nullptr);
					}
					ret = stat->srclist[name];
				}
				else {
					auto pst = root->extroot->subsrc;
					root->extroot->subsrc = new SourceTree(stat);
					root->extroot->subsrc->parent = root;
					if (pst != nullptr) {
						pst->parent = root->extroot->subsrc;
						root->extroot->subsrc->extroot->subsrc = pst;
					}
					if (!root->extroot->subsrc->FileRead(name)) {
						src.addErrMes(L(""));
						delete root->extroot->subsrc;
						root->extroot->subsrc = nullptr;
						return nullptr;
					}
					ret = root->extroot->subsrc;
				}
			}
			return ret;
		case BQUOT_TOKEN:
			if (
				hkishiki.frp == hkishiki.root
				|| hkishiki.frp->parent == hkishiki.root
				|| hkishiki.frp->selftype == CLASS_BLOCK)
			{
				src.addErrMes(L("` cannot be used here."));
				return nullptr;
			}
			switch (src.GetToken(hkishiki)) {
			case OTHERKIND_TOKEN:
				src.setNextLast();
				ret = hkishiki.frp->parent->LibNanika(src, hkishiki, false);
				if (ret == nullptr) return nullptr;
				break;
			default:
				koubuneraadesu(src);
				return nullptr;
			}
			return ret;
		case POINT_TOKEN:
		case ATMARK_TOKEN:
		{
			SourceTree* lib =
				kin == POINT_TOKEN ? hkishiki.root : hkishiki.fileroot;
			switch (src.GetToken(hkishiki)) {
			case OTHERKIND_TOKEN:
				src.setNextLast();
				ret =
					hkishiki.root->LibNanika(
						src, hkishiki, kin != POINT_TOKEN);
				break;
			default:
				src.setNextLast();
				ret = lib;
				break;
			}
		}
		return ret;
		case OTHERKIND_TOKEN:
			oldsst = src.sst;
			switch (src.GetToken(hkishiki)) {
			case EXCLAMATION_TOKEN:
			case COLOYAJIRUSHI_TOKEN:
			case COLOCOLO_TOKEN:
				src.sst = oldsst;
				src.setNextLast();
				ret = LibNanikaPath(src, hkishiki, pub);
				if (ret == nullptr) return nullptr;
				break;
			default:
				src.setNextLast();
				{
					std::WSTR name;
					name.append(src.source + oldsst.t, oldsst.i - oldsst.t);
					auto phs = GetHensuu(name, false);
					if (phs == nullptr) {
						std::WSTR tmp;
						tmp = L('\'');
						tmp += name;
						tmp += L("' not found.");
						src.addErrMes(tmp);
						return nullptr;
					}
					if (phs->type[0] != LIB_TOKEN) {
						std::WSTR tmp;
						tmp = L('\'');
						tmp += name;
						tmp += L("' is not a library.");
						src.addErrMes(tmp);
						return nullptr;
					}
					if (src.GetToken(hkishiki) == POINT_TOKEN) {
						if (src.GetToken(hkishiki) != OTHERKIND_TOKEN) {
							koubuneraadesu(src);
							return nullptr;
						}
						src.setNextLast();
						ret =
							((SourceTree*)phs->type[1])->LibNanika(
								src, hkishiki, true);
						if (ret == nullptr) return nullptr;
					}
					else {
						src.setNextLast();
						ret = (SourceTree*)phs->type[1];
					}
				}
				break;
			}
			return ret;
		}
		koubuneraadesu(src);
		return nullptr;
	}
	MEMBER bool KanzenPath(std::WSTR& name, const std::WSTR& karento)
	{
		WCHR* pwc;
		std::WSTR tmp;
		if(
			name.size() > 0 && name[0] != L('/')
#ifdef _WIN32
			&& (name.size() < 2 || name[1] != L(':'))
#endif
			)
		{
			tmp = name;
			name = karento;
			name.resize(name.find_last_of(PATHSEPARATOR)+1);
			name += tmp;
		}
		tmp = name;
		pwc = _wfullpath(nullptr, tmp.c_str(), 0);
		if(pwc == nullptr) return false;
		name = pwc;
		free(pwc);
#ifdef _WIN32
		for(intptr_t i = 0; i < IDX(name.size()); i++){
			name[i] = tolower(name[i]);
		}
#endif
		return true;
	}
	MEMBER bool MjiretuLiteral(std::WSTR& str, Src& src)
	{
		for(;;){
			WCHR wc;
			switch(src.GetToken(*this)){
			case DQUOT_TOKEN:
				src.Find(L('"'));
				src.appendTStr(str);
				src.sst.i++;
				continue;
			case BACKSLA_TOKEN:
				if(!TokushuMoji(wc, src)) return false;
				str += wc;
				continue;
			default:
				src.setNextLast();
				break;
			}
			break;
		}
		return true;
	}
	MEMBER bool TokushuMoji(WCHR& wc, Src& src)
	{
		switch (src.GetChar()) {
		case L('0'):
			wc = L('\0');
			return true;
		case L('t'):
			wc = L('\t');
			return true;
		case L('r'):
			wc = L('\r');
			return true;
		case L('n'):
			wc = L('\n');
			return true;
		case L('\\'):
			wc = L('\\');
			return true;
		case L('\''):
			wc = L('\'');
			return true;
		case L('"'):
			wc = L('"');
			return true;
		case L('b'):
		case L('d'):
		case L('o'):
		case L('x'):
		{
			uint64_t ui64;
			src.sst.i--;
			src.GetToken(*this);
			if (
				!ZeroHajimari(
					ui64, src.source + src.sst.t,
					src.sst.i - src.sst.t))
			{
				return koubuneraadesu(src);
			}
			wc = (char16_t)ui64;
			return true;
		}
		}
		return koubuneraadesu(src);
	}
	MEMBER SourceTree* getTemplateRoot()
	{
		if(myname[0] != L('\0')) return this;
		return (*(SourceTree**)(myname.data()+1))->getTemplateRoot();
	}
	MEMBER int32_t PathtoClassID(
		Src& src, const BlockType blty, const bool toka, bool publ,
		const bool typeonly, SourceTree& hkishiki, const bool create)
	{
		TokenKind kin;
		SourceTree* pst = this;
		SourceTree* opst;
		Hensuu<SourceTree>* phs;
		bool moou = false, henpubl = publ;
		BlockType bt;
		auto oldsst = src.sst;
		intptr_t size, idx;
		int32_t fi = -1;
		std::WSTR name, tmp;
		std::basic_string<intptr_t> type;
		for(;;){
			kin = src.GetToken(hkishiki);
			switch(kin){
			case ATMARK_TOKEN:
				publ = true;
			case POINT_TOKEN:
				if(toka || moou){
					koubuneraadesu(src);
					return -1;
				}
				pst = kin == POINT_TOKEN ? hkishiki.root : hkishiki.fileroot;
				moou = true;
				break;
			case BQUOT_TOKEN:
				if(toka || moou || frp == root || frp->parent == root){
					src.addErrMes(L("'`' is a syntax error."));
					return -1;
				}
				pst = hkishiki.frp->parent;
				moou = true;
				break;
			case SELF_TOKEN:
				if(moou){
					src.addErrMes(L("'self' is a syntax error."));
					return -1;
				}
				fi = frp->funcid;
				goto FOOGOTOLABEL;
			case OTHERKIND_TOKEN:
SUPERPASTA:
				name.clear();
				src.appendTStr(name);
				if((phs = pst->GetHensuu(name, false)) != nullptr){
					switch(phs->type[0]){
					case TYPE_TOKEN:
						if(
							phs->type[1] != AND_TOKEN
							&& phs->type[1] != OR_TOKEN
							&& phs->type[1] != NULL_TOKEN)
						{
							src.addErrMes(L("Error."));
							return -1;
						}
						fi = (int32_t)phs->type[2];
						break;
					case LIB_TOKEN:
SUGOIPASTA:
						if(src.GetToken(hkishiki) != POINT_TOKEN){
							if(toka){
								src.sst = oldsst;
								return pst->funcid;
							}
							koubuneraadesu(src);
							return -1;
						}
						if(toka){
							fi = ((SourceTree*)phs->type[1])->funcid;
							pst = stat->funclist.Get(fi);
							goto TOTEMOPASTA;
						}
						pst = (SourceTree*)phs->type[1];
						publ = true;
						continue;
					default:
						SoushokuTobasi(phs->type.data(), idx=0);
						if(
							phs->type[idx] != AND_TOKEN
							|| src.GetToken(hkishiki) != POINT_TOKEN
							|| src.GetToken(hkishiki) != OTHERKIND_TOKEN)
						{
							koubuneraadesu(src);
							return -1;
						}
						if(
							henpubl
							&& !isPublic((TokenKind)phs->type[0], hkishiki))
						{
							src.addErrMes(L("Not public."));
							return -1;
						}
						if(phs->type[0] != CORE_TOKEN) henpubl = true;
						idx++;
						pst = stat->funclist.Get(phs->type[idx]);
						goto SUPERPASTA;
					}
				}else if((fi = pst->GetFuncId(name, create)) < 0){
					tmp = L('\'');
					tmp += name;
					tmp += L("' is not defined.");
					src.addErrMes(tmp);
					return -1;
				}else if(pst->touka){
					stat->funclist.Get(fi)->parent = pst->parent;
				}
FOOGOTOLABEL:
				moou = true;
				for(;;){
					kin = src.GetToken(hkishiki);
					switch(kin){
					case EXCLAMATION_TOKEN:
						oldsst = src.sst;
						for(int nest = 1; nest != 0 && kin > NULL_TOKEN; ){
							kin = src.GetTokenYomitobashi();
							switch(kin){
							case EXCLAMATION_TOKEN:
								nest++;
								break;
							case QUESTION_TOKEN:
								nest--;
								break;
							case CHUUKAKKOOPEN_TOKEN:
							case CHUUKAKKOCLOSE_TOKEN:
							case SEMICOLON_TOKEN:
							case DQUOT_TOKEN:
							case SQUOT_TOKEN:
							case BACKSLA_TOKEN:
								kin = NULL_TOKEN;
								break;
							}
						}
						if(kin <= NULL_TOKEN){
							gaarimasen(src, L("?"));
							return -1;
						}
						switch(src.GetToken(hkishiki)){
						case COLOYAJIRUSHI_TOKEN:
							bt = FUNC_BLOCK;
							break;
						case COLOCOLO_TOKEN:
							bt = CLASS_BLOCK;
							break;
						default:
							if(blty == ENUM_BLOCK){
								src.addErrMes(L("It is an enumerated type."));
								return -1;
							}
							bt = blty;
							break;
						}
						src.sst = oldsst;
						opst = stat->funclist.Get(fi);
						if(!opst->kakutei && opst->selftype == UNKNOWN_BLOCK){
							opst->selftype = bt;
							opst->srce = &src;
							opst->topsrcgyo = src.sst.g;
						}
						if(opst->selftype != bt){
							src.addErrMes(L("Type error."));
							return -1;
						}
						if(opst->rettype.size() > 0 && opst->tpcount == 0){
							src.addErrMes(L("It's not a template function."));
							return -1;
						}
						idx = 0;
						for(;;){
							if(opst->tpcount > 0 && idx >= opst->tpcount){
								src.addErrMes(
									L("Too many template arguments."));
								stat->tokubetuerr = true;
								return -1;
							}
							type.clear();
							if(
								!hkishiki.TypeNanika(
									type, src, false, false, hkishiki,
									create, false))
							{
								if(create) stat->tokubetuerr = true;
								return -1;
							}
							name.resize(
								(
									sizeof(SourceTree*)
									+ sizeof(intptr_t)*type.size())
								/ sizeof(WCHR) + 1);
							name[0] = L('\0');
							memcpy(
								(void*)(name.data()+1),
								&opst, sizeof(SourceTree*));
							memcpy(
								(void*)(name.data() + TNT_OFFSET),
								type.data(), sizeof(intptr_t)*type.size());
							if(
								(
									pst = opst->BlockOpen(
										&name, bt, true, create))
								== nullptr)
							{
								src.addErrMes(L("Error."));
								if(create) stat->tokubetuerr = true;
								return -1;
							}
							if(pst->selftype != opst->selftype){
								src.addErrMes(L("Type error."));
								stat->tokubetuerr = true;
								return -1;
							}
							if(pst->tpcount == 0){
								pst->parent = opst->parent;
								if(stat->funclist.Get(fi)->kakutei){
									pst->rettype = opst->rettype;
									pst->tpcount = opst->tpcount;
									pst->funchensuu = opst->funchensuu;
									pst->hensuname = opst->hensuname;
									pst->hensuidx = opst->hensuidx;
									pst->nametable = opst->nametable;
									pst->srce = opst->srce;
									pst->topsrcidx = opst->topsrcidx;
									pst->topsrcgyo = opst->topsrcgyo;
									pst->funchensuu[idx].type += type;
								}
							}
							opst = pst;
							kin = src.GetToken(hkishiki);
							switch(kin){
							case QUESTION_TOKEN:
								idx++;
								break;
							case COMMA_TOKEN:
								idx++;
								pst->kakutei = stat->funclist.Get(fi)->kakutei;
								continue;
							default:
								koubuneraadesu(src);
								stat->tokubetuerr = true;
								return -1;
							}
							break;
						}
						if(pst->tpcount > 0 && idx != pst->tpcount){
							src.addErrMes(L("Missing template arguments."));
							stat->tokubetuerr = true;
							return -1;
						}
						if(
							!pst->kakutei && pst->token.size() == 0
							&& stat->funclist.Get(fi)->kakutei)
						{
							oldsst = pst->srce->sst;
							pst->srce->sst.i = pst->topsrcidx;
							pst->srce->sst.next = NULL_TOKEN;
							pst->srce->sst.g = pst->topsrcgyo;
							if(
								(
									pst->selftype == FUNC_BLOCK && (
										!pst->GblhaniSet(src, hkishiki)
										|| !pst->MbrhaniSet(src, hkishiki)
										|| !pst->KariHikisuu()))
								|| !pst->MakeTree())
							{
								stat->tokubetuerr = true;
								return -1;
							}
							pst->srce->sst = oldsst;
							if(pst->selftype == CLASS_BLOCK){
								if(!pst->ClassShokika(src)){
									stat->tokubetuerr = true;
									return -1;
								}
								size = pst->GetMemberSize();
								for(
									intptr_t i = 0;
									i < IDX(pst->backpatch.size()); i++)
								{
									((SourceTree*)pst->backpatch[i])
										->funchensuu[pst->breakpatch[i]]
											.size = size;
								}
							}
							{
								std::basic_string<intptr_t> dummy;
								pst->backpatch.swap(dummy);
							}
							{
								std::basic_string<intptr_t> dummy;
								pst->breakpatch.swap(dummy);
							}
						}else if(stat->funclist.Get(fi)->tpcount == 0){
							stat->funclist.Get(fi)->tpcount = idx;
						}
						fi = pst->funcid;
						kin = src.GetToken(hkishiki);
						goto NEO_PASTA;
					case SHOU_TOKEN:
						if(blty == ENUM_BLOCK){
							src.addErrMes(L("It is an enumerated type."));
							return -1;
						}
						if(typeonly || toka){
							koubuneraadesu(src);
							return -1;
						}
						pst = stat->funclist.Get(fi);
						idx = -1;
						if(pst->selftype == UNKNOWN_BLOCK){
							pst->selftype = blty;
							pst->srce = &src;
							pst->topsrcgyo = src.sst.g;
						}else{
							idx = pst->tpcount;
							pst->tpcount = 0;
						}
						if(pst->selftype != blty){
							src.addErrMes(L("Type error."));
							return -1;
						}
						if(publ){
							if(pst->rettype.size() > 0){
								if(
									!pst->isPublic(
										(TokenKind)pst->rettype[0], hkishiki))
								{
									src.addErrMes(L("It's private."));
									return -1;
								}
							}else if(toka || blty == CLASS_BLOCK){
								pst->rettype = PUBLIC_TOKEN;
							}
						}
						for(;;){
							if(src.GetToken(hkishiki) != OTHERKIND_TOKEN){
								koubuneraadesu(src);
								return -1;
							}
							name.clear();
							src.appendTStr(name);
							type = TYPE_TOKEN;
							pst->tpcount++;
							if(!pst->AddHensuu(type, name, 0, src)){
								return -1;
							}
							kin = src.GetToken(hkishiki);
							switch(kin){
							case DAI_TOKEN:
								break;
							case COMMA_TOKEN:
								continue;
							default:
								koubuneraadesu(src);
								return -1;
							}
							break;
						}
						if(idx >= 0 && pst->tpcount != idx){
							src.addErrMes(
								L("The number of template arguments does not match."));
							return -1;
						}
						return fi;
					}
NEO_PASTA:
					switch(kin){
					case COLOYAJIRUSHI_TOKEN:
						pst = stat->funclist.Get(fi);
						if(
							pst->tpcount > 0
							&& pst->funchensuu[pst->tpcount-1].type.size()
							<= 1)
						{
							src.addErrMes(L("Missing template argument."));
							return -1;
						}
						if(!pst->kakutei){
							if(pst->selftype == UNKNOWN_BLOCK){
								pst->selftype = FUNC_BLOCK;
								pst->touka = true;
								pst->srce = &src;
								pst->topsrcgyo = src.sst.g;
							}
						}
						if(pst->selftype != FUNC_BLOCK || !pst->touka){
							src.addErrMes(L("It is not a transparent function."));
							return -1;
						}
						if(publ){
							if(pst->rettype.size() > 0){
								if(
									!pst->isPublic(
										(TokenKind)pst->rettype[0], hkishiki))
								{
									src.addErrMes(L("It's private."));
									return -1;
								}
							}else if(toka || blty == CLASS_BLOCK){
								pst->rettype = PUBLIC_TOKEN;
							}
						}
						publ = true;
						break;
					case COLOCOLO_TOKEN:
						pst = stat->funclist.Get(fi);
						if(
							pst->tpcount > 0
							&& pst->funchensuu[pst->tpcount-1].type.size()
							<= 1)
						{
							src.addErrMes(L("Missing template argument."));
							return -1;
						}
						for(;;){
							if(pst->selftype == ENUM_BLOCK){
								if(!toka){
									src.addErrMes(L("It is an enumerated type."));
									return -1;
								}
								src.setNextLast();
								return fi;
							}
							if(!pst->kakutei){
								if(pst->selftype == UNKNOWN_BLOCK){
									pst->selftype = CLASS_BLOCK;
									pst->srce = &src;
									pst->topsrcgyo = src.sst.g;
								}
							}
							if(pst->selftype != CLASS_BLOCK){
								src.addErrMes(L("It's not a class."));
								return -1;
							}
							if(publ){
								if(pst->rettype.size() > 0){
									if(
										!pst->isPublic(
											(TokenKind)pst->rettype[0],
											hkishiki))
									{
										src.addErrMes(L("It's private."));
										return -1;
									}
								}else if(toka || blty == CLASS_BLOCK){
									pst->rettype = PUBLIC_TOKEN;
								}
							}
							if(toka){
TOTEMOPASTA:
								oldsst = src.sst;
								oldsst.next = oldsst.last;
								if(src.GetToken(hkishiki) != OTHERKIND_TOKEN){
									koubuneraadesu(src);
									return -1;
								}
								name.clear();
								src.appendTStr(name);
								if(
									(phs = pst->GetHensuu(name, false))
									!= nullptr)
								{
									switch(phs->type[0]){
									case TYPE_TOKEN:
										if(
											(
												phs->type[1] == AND_TOKEN
												|| phs->type[1] == OR_TOKEN)
											&& src.GetToken(hkishiki)
											== COLOCOLO_TOKEN)
										{
											fi = (int32_t)phs->type[2];
											pst = stat->funclist.Get(fi);
											publ = true;
											continue;
										}
										break;
									case LIB_TOKEN:
										goto SUGOIPASTA;
									}
									src.sst = oldsst;
									src.setNextLast();
									return fi;
								}
								src.setNextLast();
							}
							publ = true;
							break;
						}
						break;
					default:
						pst = stat->funclist.Get(fi);
						if(
							pst->tpcount > 0 && (
								pst->funchensuu.size() < (size_t)pst->tpcount
								|| pst->funchensuu[pst->tpcount-1].type.size()
								<= 1))
						{
							src.addErrMes(L("Missing template argument."));
							return -1;
						}
						if(!pst->kakutei && pst->selftype == UNKNOWN_BLOCK){
							pst->selftype = blty;
							pst->srce = &src;
							pst->topsrcgyo = src.sst.g;
						}
						if(pst->selftype != blty){
							src.addErrMes(L("Type error."));
							return -1;
						}
						if(pst->selftype != ENUM_BLOCK && publ){
							if(pst->rettype.size() > 0){
								if(
									(
										hkishiki.frp == hkishiki.frp->root
										|| pst->parent != hkishiki.frp->parent)
									&& !pst->isPublic(
										(TokenKind)pst->rettype[0], hkishiki))
								{
									src.addErrMes(L("Not public."));
									return -1;
								}
							}else if(toka || blty == CLASS_BLOCK){
								pst = pst->getTemplateRoot();
								pst->rettype = PUBLIC_TOKEN;
							}
						}
						src.setNextLast();
						return fi;
					}
					break;
				}
				break;
			default:
				koubuneraadesu(src);
				return -1;
			}
		}
		return fi;
	}
	MEMBER bool ClassShokika(Src& src)
	{
		std::WSTR name;
		std::basic_string<intptr_t> meniya;
		int32_t fi;
		if(!MemberNew(src, meniya)) return false;
		name = L("default");
		if(meniya.size() > 0){
			fi = GetFuncId(name, true);
			if(!stat->funclist.Get(fi)->GblhaniSet(src, *this)) return false;
			stat->funclist.Get(fi)->selftype = FUNC_BLOCK;
			stat->funclist.Get(fi)->rettype = VOID_TOKEN;
			stat->funclist.Get(fi)->token.resize(1);
			stat->funclist.Get(fi)->token[0] = meniya;
			stat->funclist.Get(fi)->gyo = -1;
			stat->funclist.Get(fi)->kakutei = true;
			stat->funclist.Get(fi)->returnshita = 0;
		}else if((fi=GetFuncId(name, false)) >= 0){
			stat->funclist.Get(fi)->kakutei = true;
			stat->funclist.Get(fi)->gblhani = INTPTR_MAX;
		}
		if(!MemberDel(src, meniya)) return false;
		name = L("break");
		if(meniya.size() > 0){
			fi = GetFuncId(name, true);
			if(!stat->funclist.Get(fi)->GblhaniSet(src, *this)) return false;
			stat->funclist.Get(fi)->selftype = FUNC_BLOCK;
			stat->funclist.Get(fi)->rettype = VOID_TOKEN;
			stat->funclist.Get(fi)->token.resize(1);
			stat->funclist.Get(fi)->token[0] = meniya;
			stat->funclist.Get(fi)->gyo = -1;
			stat->funclist.Get(fi)->kakutei = true;
			stat->funclist.Get(fi)->returnshita = 0;
		}else if((fi=GetFuncId(name, false)) >= 0){
			stat->funclist.Get(fi)->kakutei = true;
			stat->funclist.Get(fi)->gblhani = INTPTR_MAX;
		}
		return true;
	}
	MEMBER bool BackTemplate(const int ato)
	{
		if(ato <= 0){
			auto oldsst = srce->sst;
			srce->sst.i = topsrcidx;
			srce->sst.next = NULL_TOKEN;
			srce->sst.g = topsrcgyo;
			for(intptr_t i = 0; i < IDX(subfunc.size()); i++){
				AddNameTable(nametable, subfunc[i]->myname, 0, ~i);
			}
			if(selftype == FUNC_BLOCK && !KariHikisuu()) return false;
			if(!MakeTree()) return false;
			srce->sst = oldsst;
			if(selftype == CLASS_BLOCK){
				if(!ClassShokika(*srce)) return false;
				auto size = GetMemberSize();
				for(intptr_t i = 0; i < IDX(backpatch.size()); i++){
					((SourceTree*)backpatch[i])
						->funchensuu[breakpatch[i]].size = size;
				}
			}
			kakutei = true;
			{
				std::basic_string<intptr_t> dummy;
				backpatch.swap(dummy);
			}
			{
				std::basic_string<intptr_t> dummy;
				breakpatch.swap(dummy);
			}
			return true;
		}
		if(children.size() <= 0){
			srce->addErrMes(L("Error."));
			return false;
		}
		for(intptr_t i = 0; i < IDX(children.size()); i++){
			children[i]->parent = parent;
			children[i]->rettype = rettype;
			children[i]->tpcount = tpcount;
			children[i]->funchensuu = funchensuu;
			children[i]->hensuname = hensuname;
			children[i]->hensuidx = hensuidx;
			children[i]->nametable = nametable;
			children[i]->srce = srce;
			children[i]->topsrcidx = topsrcidx;
			children[i]->topsrcgyo = topsrcgyo;
			children[i]->funchensuu[tpcount-ato].type.append(
				(intptr_t*)(subfunc[i]->myname.data() + TNT_OFFSET),
				(
					(subfunc[i]->myname.size() - TNT_OFFSET)
					*sizeof(WCHR) + sizeof(intptr_t) - 1)
				/ sizeof(intptr_t));
			if(!children[i]->BackTemplate(ato-1)) return false;
		}
		kakutei = true;
		return true;
	}
	MEMBER bool RefTouroku(
		std::basic_string<intptr_t>& type,
		std::basic_string<intptr_t>* const ptok)
	{
		if(srce->GetToken(*this) != OTHERKIND_TOKEN){
			return koubuneraadesu(*srce);
		}
		std::WSTR name;
		srce->appendTStr(name);
		if(type[0] == CONST_TOKEN){
			if(!AddHensuu(type, name, 0, *srce)) return false;
		}else{
			if(!AddHensuu(type, name, GetTypeSize(type), *srce)) return false;
			if(ptok != nullptr){
				if(frp == root) *ptok += GLOBAL_TOKEN;
				*ptok += ~(frp->funchensuu.size()-1);
				*ptok += VOID_TOKEN;
				*ptok += SEMICOLON_TOKEN;
			}
		}
		return true;
	}
	MEMBER bool ListTouroku(
		std::basic_string<intptr_t>& type,
		std::basic_string<intptr_t>* const ptok)
	{
		if(srce->GetToken(*this) != OTHERKIND_TOKEN){
			return koubuneraadesu(*srce);
		}
		std::WSTR name;
		srce->appendTStr(name);
		if(!AddHensuu(type, name, GetTypeSize(type), *srce)) return false;
		if(ptok != nullptr){
			if(frp == root) *ptok += GLOBAL_TOKEN;
			*ptok += ~(frp->funchensuu.size()-1);
			*ptok += VOID_TOKEN;
			*ptok += SEMICOLON_TOKEN;
		}
		return true;
	}
	MEMBER bool ThreadTouroku(
		std::basic_string<intptr_t>& type,
		std::basic_string<intptr_t>* const ptok)
	{
		if(srce->GetToken(*this) != OTHERKIND_TOKEN){
			return koubuneraadesu(*srce);
		}
		std::WSTR name;
		srce->appendTStr(name);
		if(!AddHensuu(type, name, sizeof(Thread), *srce)) return false;
		if(ptok != nullptr){
			if(frp == root) *ptok += GLOBAL_TOKEN;
			*ptok += ~(frp->funchensuu.size()-1);
			*ptok += VOID_TOKEN;
			*ptok += SEMICOLON_TOKEN;
		}
		return true;
	}
	MEMBER void CallNew(
		std::basic_string<intptr_t>& tk, std::basic_string<intptr_t>& meniya)
	{
		int32_t fi;
		if((fi = GetFuncId(L("default"), false)) >= 0){
			tk += meniya;
			tk += SHOUKAKKOOPEN_TOKEN;
			tk += ~fi;
			tk += SHOUKAKKOCLOSE_TOKEN;
			tk += SEMICOLON_TOKEN;
		}
	}
	MEMBER bool MemberNew(Src& src, std::basic_string<intptr_t>& meniya)
	{
		int32_t fi;
		intptr_t il;
		meniya.clear();
		for(
			intptr_t ii = tpcount+hikisuucount; ii < IDX(funchensuu.size());
			ii++)
		{
			if(funchensuu[ii].type[0] == CONST_TOKEN) continue;
			fi = TokenToTypeId(funchensuu[ii].type.data(), il=0);
			if(fi > ENDCLASS_TYPEID) continue;
			if(fi < 0){
				if(
					!(DYNLIST_TYPEID <= fi && fi <= REF_TYPEID)
					&& fi < ENDTHREAD_TYPEID) continue;
				meniya += MEMBER_TOKEN;
				meniya += ~ii;
				meniya += VOID_TOKEN;
				meniya += SEMICOLON_TOKEN;
			}else if(stat->funclist.Get(fi)->selftype == CLASS_BLOCK){
				if(
					(fi = stat->funclist.Get(fi)->GetFuncId(L("default"), false))
					>= 0)
				{
					meniya += MEMBER_TOKEN;
					meniya += ~ii;
					meniya += POINT_TOKEN;
					meniya += SHOUKAKKOOPEN_TOKEN;
					meniya += ~fi;
					meniya += SHOUKAKKOCLOSE_TOKEN;
					meniya += SEMICOLON_TOKEN;
				}
			}
		}
		if((fi = GetFuncId(L("new"), false)) >= 0){
			if(
				stat->funclist.Get(fi)->token.size() > 0
				&& stat->funclist.Get(fi)->kakutei)
			{
				if(!stat->funclist.Get(fi)->GblhaniSet(src, *this)){
					return false;
				}
				meniya += MEMBER_TOKEN;
				meniya += SHOUKAKKOOPEN_TOKEN;
				meniya += ~fi;
				meniya += SHOUKAKKOCLOSE_TOKEN;
				meniya += SEMICOLON_TOKEN;
			}else{
				stat->funclist.Get(fi)->selftype = FUNC_BLOCK;
				stat->funclist.Get(fi)->rettype = VOID_TOKEN;
				stat->funclist.Get(fi)->kakutei = true;
				stat->funclist.Get(fi)->gblhani = INTPTR_MAX;
			}
		}
		return true;
	}
	MEMBER void CallDel(
		std::basic_string<intptr_t>& tk, std::basic_string<intptr_t>& meniya)
	{
		int32_t fi;
		if((fi = GetFuncId(L("break"), false)) >= 0){
			tk += meniya;
			tk += SHOUKAKKOOPEN_TOKEN;
			tk += ~fi;
			tk += SHOUKAKKOCLOSE_TOKEN;
			tk += SEMICOLON_TOKEN;
		}
	}
	MEMBER bool MemberDel(Src& src, std::basic_string<intptr_t>& meniya)
	{
		int32_t fi;
		intptr_t il;
		meniya.clear();
		if((fi = GetFuncId(L("delete"), false)) >= 0){
			if(
				stat->funclist.Get(fi)->token.size() > 0
				&& stat->funclist.Get(fi)->kakutei)
			{
				if(!stat->funclist.Get(fi)->GblhaniSet(src, *this)){
					return false;
				}
				meniya += MEMBER_TOKEN;
				meniya += SHOUKAKKOOPEN_TOKEN;
				meniya += ~fi;
				meniya += SHOUKAKKOCLOSE_TOKEN;
				meniya += SEMICOLON_TOKEN;
			}else{
				stat->funclist.Get(fi)->selftype = FUNC_BLOCK;
				stat->funclist.Get(fi)->rettype = VOID_TOKEN;
				stat->funclist.Get(fi)->kakutei = true;
				stat->funclist.Get(fi)->gblhani = INTPTR_MAX;
			}
		}
		for(int ii = funchensuu.size()-1; ii >= tpcount+hikisuucount; ii--){
			if(funchensuu[ii].type[0] == CONST_TOKEN) continue;
			fi = TokenToTypeId(funchensuu[ii].type.data(), il=0);
			if(fi > ENDCLASS_TYPEID) continue;
			if(fi < 0){
				if(
					!(DYNLIST_TYPEID <= fi && fi <= REF_TYPEID)
					&& fi < ENDTHREAD_TYPEID) continue;
				meniya += MEMBER_TOKEN;
				meniya += ~ii;
				meniya += DELETE_TOKEN;
				meniya += SEMICOLON_TOKEN;
			}else if(stat->funclist.Get(fi)->selftype == CLASS_BLOCK){
				if(
					(fi = stat->funclist.Get(fi)->GetFuncId(L("break"), false))
					>= 0)
				{
					meniya += MEMBER_TOKEN;
					meniya += ~ii;
					meniya += POINT_TOKEN;
					meniya += SHOUKAKKOOPEN_TOKEN;
					meniya += ~fi;
					meniya += SHOUKAKKOCLOSE_TOKEN;
					meniya += SEMICOLON_TOKEN;
				}
			}
		}
		return true;
	}
	MEMBER bool ClassObjToroku(
		std::basic_string<intptr_t>& type, const int32_t ci,
		std::basic_string<intptr_t>* const ptok)
	{
		if(srce->GetToken(*this) != OTHERKIND_TOKEN){
			return koubuneraadesu(*srce);
		}
		std::WSTR name;
		srce->appendTStr(name);
		if(
			!AddHensuu(
				type, name, stat->funclist.Get(ci)->GetMemberSize(), *srce))
		{
			return false;
		}
		stat->funclist.Get(ci)->mbsize = -1;//Be careful
		if(ptok != nullptr){
			std::basic_string<intptr_t> tmp;
			if(frp == root) tmp = GLOBAL_TOKEN;
			tmp += ~(frp->funchensuu.size()-1);
			tmp += POINT_TOKEN;
			stat->funclist.Get(ci)->CallNew(*ptok, tmp);
		}
		return true;
	}
	MEMBER bool KariHikisuu()
	{
		if(!necessaryToken(*srce, *this, SHOUKAKKOOPEN_TOKEN)) return false;
		intptr_t tidx = 0;
		if(IsSoushokuToken((TokenKind)rettype[tidx])) tidx++;
		if(rettype[tidx] == SIGNATURE_TOKEN){
			if(tidx > 0){
				srce->addErrMes(
					L("Decorators cannot be added to function definitions with signatures."));
				return false;
			}
			std::basic_string<intptr_t> type;
			type += FUNC_TOKEN;
			type += rettype;
			std::vector<std::basic_string<intptr_t>> waketa;
			if(!KansuuKata(nullptr, type, waketa)){
				srce->addErrMes(L("Error."));
				return false;
			}
			rettype = waketa[0];
			hikisuucount = waketa.size()-1;
			auto kin = NULL_TOKEN;
			for(int i = 0; i < hikisuucount; i++){
				if(kin == SHOUKAKKOCLOSE_TOKEN){
					srce->addErrMes(L("Too few arguments."));
					return false;
				}
				if(!ArgSub(*srce, nullptr, this, waketa[i+1], kin, true)){
					return false;
				}
				if(kin != COMMA_TOKEN && kin != SHOUKAKKOCLOSE_TOKEN){
					return koubuneraadesu(*srce);
				}
			}
			if(kin == COMMA_TOKEN){
				srce->addErrMes(L("Too many arguments."));
				return false;
			}
			if(kin == NULL_TOKEN) kin = srce->GetToken(*this);
			if(kin != SHOUKAKKOCLOSE_TOKEN) return koubuneraadesu(*srce);
		}else{
			bool sig, tenten = rettype[tidx] == TENTEN_TOKEN;
			hikisuucount = 0;
			auto kin = srce->GetToken(*this);
			while(kin != SHOUKAKKOCLOSE_TOKEN){
				srce->setNextLast();
				std::basic_string<intptr_t> type;
				if(!TypeNanika(type, *srce, false, false, *this, true, false)){
					return false;
				}
				hikisuucount++;
				if(!ArgSub(*srce, nullptr, this, type, kin, false)){
					return false;
				}
				switch(kin){
				case COMMA_TOKEN:
					srce->GetToken(*this);
					continue;
				case SHOUKAKKOCLOSE_TOKEN:
					break;
				default:
					return koubuneraadesu(*srce);
				}
				break;
			}
			if(tenten){
				rettype.resize(tidx);
				if(
					!ReturnValType(rettype, *srce, sig, true)
					|| (sig && !koubuneraadesu(*srce))) return false;
			}
		}
		if(!necessaryToken(*srce, *this, CHUUKAKKOOPEN_TOKEN)) return false;
		if(srce->GetToken(*this) == COLOYAJIRUSHI_TOKEN){
			touka = true;
		}else{
			if(touka){
				srce->addErrMes(L("It is already used as a transparency function."));
				return false;
			}
			srce->setNextLast();
		}
		return true;
	}
	MEMBER bool ReturnValType(
		std::basic_string<intptr_t>& type, Src& src, bool& sig,
		const bool create)
	{
		intptr_t tmp = type.size();
		if(!TypeNanika(type, src, false, false, *this, create, false)){
			return false;
		}
		switch(type[tmp]){
		case BOOL_TOKEN:
		case CHAR_TOKEN:
		case DOUBLE_TOKEN:
		case FLOAT_TOKEN:
		case BYTE_TOKEN:
		case INT_TOKEN:
		case LONG_TOKEN:
		case SHORT_TOKEN:
		case UBYTE_TOKEN:
		case UINT_TOKEN:
		case ULONG_TOKEN:
		case USHORT_TOKEN:
		case INDEX_TOKEN:
		case VOID_TOKEN:
		case OR_TOKEN:
		case FUNC_TOKEN:
		case METHOD_TOKEN:
		case REF_TOKEN:
		case LIST_TOKEN:
			sig = false;
			break;
		case SIGNATURE_TOKEN:
			sig = true;
			break;
		default:
			src.addErrMes(L("Invalid return type."));
			return false;
		}
		return true;
	}
	MEMBER bool ReturnType(
		std::basic_string<intptr_t>& type, Src& src, bool& sig,
		const bool create)
	{
		auto kin = src.GetToken(*this);
		if(kin != ATMARK_TOKEN && IsKoukaiHensuuToken(kin)){
			type += kin;
		}else if(kin == KAKERU_TOKEN){
			auto oldsst = src.sst;
			if(src.GetToken(*this) == PUBLIC_TOKEN){
				type += ATMARK_TOKEN;
			}else{
				src.sst = oldsst;
				src.setNextLast();
			}
		}else{
			src.setNextLast();
		}
		if(!ReturnValType(type, src, sig, create)) return false;
		return true;
	}
	MEMBER bool FuncType(
		std::basic_string<intptr_t>& type, Src& src, const bool create)
	{
		TokenKind kin;
		bool sig;
		if(
			!ReturnType(type, src, sig, create)
			|| (sig && !koubuneraadesu(src)))
		{
			return false;
		}
		if(!necessaryToken(src, *this, SHOUKAKKOOPEN_TOKEN)) return false;
		type += SHOUKAKKOOPEN_TOKEN;
		if(src.GetToken(*this) != SHOUKAKKOCLOSE_TOKEN){
			src.setNextLast();
			for(;;){
				if(
					!TypeNanika(
						type, src, false, false, *this, create, false))
				{
					return false;
				}
				kin = src.GetToken(*this);
				if(kin == DAINYUU_TOKEN){
					type += ~DAINYUU_TOKEN;
					kin = src.GetToken(*this);
				}
				switch(kin){
				case COMMA_TOKEN:
					type += COMMA_TOKEN;
					continue;
				case SHOUKAKKOCLOSE_TOKEN:
					break;
				default:
					return koubuneraadesu(src);
				}
				break;
			}
		}
		type += SHOUKAKKOCLOSE_TOKEN;
		return true;
	}
	MEMBER bool PluginType(std::basic_string<intptr_t>& type, std::WSTR& name)
	{
		type += SIGNATURE_TOKEN;
		auto tidx = type.size();
		bool sig;
		if(!ReturnType(type, *srce, sig, true)) return false;
		if(
			sig || type[tidx] == REF_TOKEN || type[tidx] == LIST_TOKEN
			|| srce->GetToken(*this) != OTHERKIND_TOKEN)
		{
			return koubuneraadesu(*srce);
		}
		name.clear();
		srce->appendTStr(name);
		if(!necessaryToken(*srce, *this, KAKKOCOLOOPEN_TOKEN)) return false;
		type += SHOUKAKKOOPEN_TOKEN;
		if(srce->GetToken(*this) != KAKKOCOLOCLOSE_TOKEN){
			srce->setNextLast();
			for(;;){
				if(!TypeNanika(type, *srce, false, false, *this, true, false)){
					return false;
				}
				auto kin = srce->GetToken(*this);
				if(kin == DAINYUU_TOKEN){
					type += ~DAINYUU_TOKEN;
					kin = srce->GetToken(*this);
				}
				switch(kin){
				case COMMA_TOKEN:
					type += COMMA_TOKEN;
					continue;
				case KAKKOCOLOCLOSE_TOKEN:
					break;
				default:
					return koubuneraadesu(*srce);
				}
				break;
			}
		}
		type += SHOUKAKKOCLOSE_TOKEN;
		return true;
	}
	MEMBER bool ClassnoTeisuuDainyuu(const std::basic_string<intptr_t>& type)
	{
		std::basic_string<intptr_t> cnst;
		if(
			!ConstShiki(
				*srce, NULL_TOKEN, srce->GetToken(*this), cnst,
				SEMICOLON_TOKEN, false, true)) return false;
		std::basic_string<intptr_t> tkty;
		tkty = CONST_TOKEN;
		if(IsSoushokuToken((TokenKind)type[0])){
			tkty.append(type.data()+1, type.size()-1);
		}else{
			tkty += type;
		}
		if(!ConstCaster(cnst, tkty)){
			srce->addErrMes(L("Type error."));
			return false;
		}
		auto ci = GetFuncId(L("new"), true);
		if(ci < 0){
			srce->addErrMes(L("This is a strange error."));
			return false;
		}
		auto pst = stat->funclist.Get(ci);
		pst->selftype = FUNC_BLOCK;
		pst->rettype = VOID_TOKEN;
		auto tmptk = pst->token;
		auto tmpgy = pst->gyo;
		pst->token.resize(1);
		pst->token[0] = MEMBER_TOKEN;
		pst->token[0] += ~(funchensuu.size()-1);
		pst->token[0] += NULL_TOKEN;
		pst->token[0] += DAINYUU_TOKEN;
		pst->token[0] += cnst;
		pst->token[0] += DAINYUU_TOKEN;
		pst->token[0] += SEMICOLON_TOKEN;
		pst->gyo = -1;
		pst->token.insert(pst->token.end(), tmptk.begin(), tmptk.end());
		pst->gyo += tmpgy;
		pst->kakutei = true;
		return true;
	}
	MEMBER bool KansuuTeigika()
	{
		bool ret = false;
		auto oldsst = srce->sst;
		auto kin = srce->GetToken(*this);
		switch (kin) {
		case OTHERKIND_TOKEN:
		{
			intptr_t nt = srce->sst.t, ni = srce->sst.i;
			kin = srce->GetToken(*this);
			switch (kin) {
			case SHOUKAKKOOPEN_TOKEN:
			case EXCLAMATION_TOKEN:
			case SHOU_TOKEN:
			case COLOCOLO_TOKEN:
			case COLOYAJIRUSHI_TOKEN:
				ret = true;
				break;
			case POINT_TOKEN:
			{
				std::WSTR name;
				name.append(srce->source + nt, ni - nt);
				ret = NameToIdx(name) != INTPTR_MIN;
				break;
			}
			}
		}
		break;
		case POINT_TOKEN:
		case ATMARK_TOKEN:
		case BQUOT_TOKEN:
			ret = true;
			break;
		}
		srce->sst = oldsst;
		return ret;
	}
	MEMBER bool HenFuTouroku(
		std::basic_string<intptr_t>& tk, std::basic_string<intptr_t>& type)
	{
		if(type[0] == CORE_TOKEN && selftype != CLASS_BLOCK){
			srce->addErrMes(L("Core can only be defined within a class."));
			return false;
		}
		if(teigikinshi >= 0){
			srce->addErrMes(L("It cannot be defined here."));
			return false;
		}
		bool cst = type[0] == CONST_TOKEN;
		bool funcfg = false, flu = false;
		intptr_t tidx = 0;
		TokenKind kin;
		int32_t ci;
		intptr_t size;
		if(IsSoushokuToken((TokenKind)type[tidx])) tidx++;
		switch(type[tidx]){
		case REF_TOKEN:
		case XOR_TOKEN:
			if(root == this){
				if(
					returnshita >= 0
					&& IsKoukaiHensuuToken((TokenKind)type[0]))
				{
					srce->addErrMes(
						L("After ret is issued in global, define public global variable.")
						L("You cannot."));
					return false;
				}
			}
			if(tidx == IDX(type.size())-1){
				type.pop_back();
				srce->setNextLast();
				if(
					!TypeNanika(
						type, *srce, false, false, *this, true, false))
				{
					return false;
				}
			}
			if(flu = KansuuTeigika()) goto FOOLABEL;
			for(;;){
				if(!RefTouroku(type, &tk)) return false;
				auto oldsst = srce->sst;
				switch(kin = srce->GetToken(*this)){
				case DAINYUU_TOKEN:
				case POINT_TOKEN:
					if(cst){
						if(kin != DAINYUU_TOKEN) return koubuneraadesu(*srce);
						std::basic_string<intptr_t> cnst;
						if(
							!ConstShiki(
								*srce, NULL_TOKEN, srce->GetToken(*this),
								cnst, SEMICOLON_TOKEN, false, true))
						{
							return false;
						}
						if(!ConstCaster(cnst, type)){
							srce->addErrMes(L("Type error."));
							return false;
						}
						frp->funchensuu.back().type = cnst;
						frp->funchensuu.back().size = 0;
						if(srce->sst.last == COMMA_TOKEN) continue;
					}else if(selftype == CLASS_BLOCK){
						if(kin != DAINYUU_TOKEN) return koubuneraadesu(*srce);
						if(!ClassnoTeisuuDainyuu(type)) return false;
						if(srce->sst.last == COMMA_TOKEN) continue;
					}else{
						srce->sst = oldsst;
						if(
							!Shiki(
								tk, *srce, NULL_TOKEN, OTHERKIND_TOKEN,
								SEMICOLON_TOKEN)) return false;
						tk += SEMICOLON_TOKEN;
						if(srce->sst.last == COMMA_TOKEN) continue;
					}
					break;
				case COMMA_TOKEN:
					if(cst){
						srce->addErrMes(L("Constant value not specified."));
						return false;
					}
					continue;
				case SEMICOLON_TOKEN:
					if(cst){
						srce->addErrMes(L("Constant value not specified."));
						return false;
					}
					break;
				default:
					return gaarimasen(*srce, L(";"));
				}
				break;
			}
			return true;
		case LIST_TOKEN:
		case AMARI_TOKEN:
			if(root == this){
				if(
					returnshita >= 0
					&& IsKoukaiHensuuToken((TokenKind)type[0]))
				{
					srce->addErrMes(
						L("After ret is issued in global, define public global variable.")
						L("You cannot."));
					return false;
				}
			}
			if (tidx == IDX(type.size()) - 1){
				type.pop_back();
				srce->setNextLast();
				if (
					!TypeNanika(
					type, *srce, false, false, *this, true, false))
				{
					return false;
				}
			}
			if (flu = KansuuTeigika()) goto FOOLABEL;
			for(;;){
				if(!ListTouroku(type, &tk)) return false;
				auto oldsst = srce->sst;
				switch(srce->GetToken(*this)){
				case DAINYUU_TOKEN:
				case POINT_TOKEN:
				case TENDAINYUU_TOKEN:
					if(!ClassnaiKinsoku()) return false;
					srce->sst = oldsst;
					if(
						!Shiki(
							tk, *srce, NULL_TOKEN, OTHERKIND_TOKEN,
							SEMICOLON_TOKEN)) return false;
					tk += SEMICOLON_TOKEN;
					if(srce->sst.last != COMMA_TOKEN) break;
				case COMMA_TOKEN:
					continue;
				case SEMICOLON_TOKEN:
					break;
				default:
					return gaarimasen(*srce, L(";"));
				}
				break;
			}
			return true;
		case THREAD_TOKEN:
			if(root == this){
				if(
					returnshita >= 0 && IsKoukaiHensuuToken(
						(TokenKind)type[0]))
				{
					srce->addErrMes(
						L("After ret is issued in global, define public global variable.")
						L("You cannot."));
					return false;
				}
			}
			if(tidx == type.size()-1){
				if(!necessaryToken(*srce, *this, EXCLAMATION_TOKEN)){
					return false;
				}
				ci =
					PathtoClassID(
						*srce, FUNC_BLOCK, false, false, true, *this, true);
				if(ci < 0) return false;
				if(
					stat->funclist.Get(ci)->parent
					!= stat->funclist.Get(ci)->root)
				{
					srce->addErrMes(L("Error."));
					return false;
				}
				type += ci;
				if(!necessaryToken(*srce, *this, QUESTION_TOKEN)) return false;
			}
			for(;;){
				if(!ThreadTouroku(type, &tk)) return false;
				auto oldsst = srce->sst;
				switch(srce->GetToken(*this)){
				case TENTEN_TOKEN:
					if(!ClassnaiKinsoku()) return false;
					srce->sst = oldsst;
					if(
						!Shiki(
							tk, *srce, NULL_TOKEN, OTHERKIND_TOKEN,
							SEMICOLON_TOKEN)) return false;
					tk += SEMICOLON_TOKEN;
					if(srce->sst.last != COMMA_TOKEN) break;
				case COMMA_TOKEN:
					continue;
				case SEMICOLON_TOKEN:
					break;
				default:
					return gaarimasen(*srce, L(";"));
				}
				break;
			}
			return true;
		case FUNC_TOKEN:
		case METHOD_TOKEN:
			if (tidx == IDX(type.size()) - 1){
				type.pop_back();
				srce->setNextLast();
				if (
					!TypeNanika(
					type, *srce, false, false, *this, true, false))
				{
					return false;
				}
			}
			funcfg = true;
			break;
		case TILDE_TOKEN:
			if(selftype == CLASS_BLOCK){
				srce->addErrMes(L("Anonymous functions cannot be defined as class members."));
				return false;
			}
			if(frp == root){
				srce->addErrMes(L("Globally anonymous functions cannot be defined."));
				return false;
			}
			if (tidx == IDX(type.size()) - 1){
				type.pop_back();
				srce->setNextLast();
				if (
					!TypeNanika(
					type, *srce, false, false, *this, true, false))
				{
					return false;
				}
			}
			funcfg = true;
			break;
		case PLUGIN_TOKEN:
			type = PLUGIN_TOKEN;
			{
				std::WSTR name;
				if(!PluginType(type, name)) return false;
				if(srce->GetToken(*this) != DAINYUU_TOKEN){
					srce->addErrMes(
						L("No plugin file was specified."));
					return false;
				}
				std::WSTR path;
				if(!LibPath(*srce, path)) return false;
				if(!necessaryToken(*srce, *this, SEMICOLON_TOKEN)) return false;
				if(stat->dlllist.find(path) == stat->dlllist.end()){
					stat->dlllist.insert(
						std::pair<std::WSTR, SDLLItem>(path, SDLLItem()));
					stat->dlllist[path].loadDll(path);
				}
				type += (intptr_t)stat->dlllist[path].getfunc(name);
				if(type.back() == (intptr_t)nullptr){
					srce->addErrMes(L("Failed to load plugin."));
					return false;
				}
				if(!AddHensuu(type, name, 0, *srce)) return false;
			}
			return true;
		case OR_TOKEN:
			if(tidx < IDX(type.size())-1){
				ci = (int32_t)type[++tidx];
			}else{
				if(
					(
						ci = PathtoClassID(
							*srce, ENUM_BLOCK,
							false, false, false, *this, true))
					< 0) return false;
				type += ci;
			}
			if(!stat->funclist.Get(ci)->kakutei){
				if(frp != this){
					srce->addErrMes(L("Enums cannot be defined in subblocks."));
					return false;
				}
				if(IsSoushokuToken((TokenKind)type[0])){
					srce->addErrMes(L("Decorators cannot be attached to enumerated types."));
					return false;
				}
				auto pst = stat->funclist.Get(ci);
				pst->srce = srce;
				pst->rettype = type;
				pst->fileroot = fileroot;
				if(!necessaryToken(*srce, *this, CHUUKAKKOOPEN_TOKEN)){
					return false;
				}
				int32_t t32 = 0;
				type = CONST_TOKEN;
				type += OR_TOKEN;
				type += ci;
				type.resize(
					type.size()
					+ (sizeof(int32_t)+sizeof(intptr_t)-1)/sizeof(intptr_t));
				std::basic_string<intptr_t> inty;
				inty = CONST_TOKEN;
				inty += INT_TOKEN;
				kin = srce->GetToken(*this);
				while(kin != CHUUKAKKOCLOSE_TOKEN){
					if(kin != OTHERKIND_TOKEN) return koubuneraadesu(*srce);
					std::WSTR name;
					srce->appendTStr(name);
					kin = srce->GetToken(*this);
					if(kin == DAINYUU_TOKEN){
						std::basic_string<intptr_t> cnst;
						if(
							!pst->ConstShiki(
								*srce, NULL_TOKEN, srce->GetToken(*this),
								cnst, CHUUKAKKOCLOSE_TOKEN, false, true))
						{
							return false;
						}
						if(!ConstCaster(cnst, inty)){
							srce->addErrMes(L("Type error."));
							return false;
						}
						t32 = *(int32_t*)(cnst.data()+2);
						kin = srce->sst.last;
					}
					switch(kin){
					case COMMA_TOKEN:
						kin = srce->GetToken(*this);
						break;
					case OTHERKIND_TOKEN:
						return koubuneraadesu(*srce);
					}
					*(int32_t*)(type.data()+3) = t32++;
					if(!pst->AddHensuu(type, name, 0, *srce)) return false;
				}
				pst->selftype = ENUM_BLOCK;
				pst->kakutei = true;
				return true;
			}
			break;
		case AND_TOKEN:
			if(tidx < IDX(type.size())-1){
				ci = (int32_t)type[++tidx];
				type.resize(tidx);
			}else{
				if(
					(
						ci = PathtoClassID(*srce, CLASS_BLOCK, false, false,
						false, *this, true)) < 0) return false;
			}
			if(!stat->funclist.Get(ci)->kakutei){
				if(frp != this){
					srce->addErrMes(L("Classes cannot be defined inside subblocks."));
					return false;
				}
				if(cst){
					srce->addErrMes(L("You cannot define a class with const."));
					return false;
				}
				if(type[0] == WARU_TOKEN){
					srce->addErrMes(L("Cannot define class with '/'."));
					return false;
				}
				if (type[0] == CORE_TOKEN){
					srce->addErrMes(L("Cannot define class in core."));
					return false;
				}
				auto pst = stat->funclist.Get(ci);
				if(
					pst->tpcount > 0 && (
						srce->sst.next != NULL_TOKEN
						|| srce->sst.last != DAI_TOKEN))
				{
					srce->addErrMes(L("Error."));
					return false;
				}
				if(pst->rettype.size() > 0){
					if(
						pst->rettype.size() >= 2
						|| !IsKoukaiHensuuToken((TokenKind)pst->rettype[0]))
					{
						srce->addErrMes(
							L("An attempt was made to redefine self within a class definition."));
						return false;
					}else{
						if(
							type[0] == ATMARK_TOKEN
							|| !IsKoukaiHensuuToken((TokenKind)type[0]))
						{
							srce->addErrMes(
								L("It is already in public use."));
							return false;
						}
					}
				}
				if(pst->parent == pst->root && pst->root->returnshita >= 0
					&& IsKoukaiHensuuToken((TokenKind)type[0]))
				{
					for(
						tidx = 0; tidx < IDX(pst->root->children.size());
						tidx++)
					{
						if(pst->root->children[tidx] == pst) break;
					}
					if(tidx < IDX(pst->root->children.size())){
						srce->addErrMes(
							L("After ret is issued in global, make public global class")
							L("cannot be defined."));
						return false;
					}
				}
				pst->srce = srce;
				pst->rettype = type;
				pst->fileroot = fileroot;
				if(pst->tpcount > 0){
					if(!necessaryToken(*srce, *this, CHUUKAKKOOPEN_TOKEN)){
						return false;
					}
					kin = CHUUKAKKOOPEN_TOKEN;
					pst->topsrcidx = srce->curIdx();
					pst->topsrcgyo = srce->sst.g;
					for(int nest = 1; nest != 0 && kin > NULL_TOKEN; ){
						kin = srce->GetTokenYomitobashi();
						switch(kin){
						case CHUUKAKKOOPEN_TOKEN:
							nest++;
							break;
						case CHUUKAKKOCLOSE_TOKEN:
							nest--;
							break;
						case DQUOT_TOKEN:
							srce->Find(L('"'));
							srce->sst.i++;
							break;
						case SQUOT_TOKEN:
							if(srce->source[srce->sst.i] == L('\\')){
								srce->sst.i += 2;
							}
							srce->Find(L('\''));
							srce->sst.i++;
							break;
						case BACKSLA_TOKEN:
							srce->sst.i++;
						}
					}
					if(kin <= NULL_TOKEN){
						srce->addErrMes(L("'}' is missing."));
						return false;
					}
					if(pst->children.size() > 0){
						if(!pst->BackTemplate(pst->tpcount)) return false;
					}else{
						pst->kakutei = true;
					}
				}else{
					if(srce->GetToken(*this) != CHUUKAKKOOPEN_TOKEN){
						srce->addErrMes(
							L("You tried to use a class that is not defined or '{' is missing."));
						return false;
					}
					if(!pst->MakeTree()) return false;
					if(!pst->ClassShokika(*srce)) return false;
				}
				size = pst->GetMemberSize();
				for(intptr_t i = 0; i < IDX(pst->backpatch.size()); i++){
					((SourceTree*)pst->backpatch[i])
						->funchensuu[pst->breakpatch[i]].size = size;
				}
				{
					std::basic_string<intptr_t> dummy;
					pst->backpatch.swap(dummy);
				}
				{
					std::basic_string<intptr_t> dummy;
					pst->breakpatch.swap(dummy);
				}
			}else{
				if(root == this){
					if(
						returnshita >= 0 && IsKoukaiHensuuToken(
							(TokenKind)type[0]))
					{
						srce->addErrMes(
							L("After ret is issued globally, define the public global variable.")
							L("cannot be justified."));
						return false;
					}
				}
				if(cst){
					srce->addErrMes(L("Cannot create constant class object."));
					return false;
				}
				if(
					srce->sst.next == NULL_TOKEN
					&& srce->sst.last == DAI_TOKEN)
				{
					srce->addErrMes(L("Error."));
					return false;
				}
				type += ci;
				for(;;){
					if(!ClassObjToroku(type, ci, &tk)) return false;
					auto oldsst = srce->sst;
					switch(srce->GetToken(*this)){
					case DAINYUU_TOKEN:
					case POINT_TOKEN:
						if(!ClassnaiKinsoku()) return false;
						srce->sst = oldsst;
						if(
							!Shiki(
								tk, *srce, NULL_TOKEN,
								OTHERKIND_TOKEN, SEMICOLON_TOKEN))
						{
							return false;
						}
						tk += SEMICOLON_TOKEN;
						if(srce->sst.last != COMMA_TOKEN) break;
					case COMMA_TOKEN:
						continue;
					case SEMICOLON_TOKEN:
						break;
					default:
						return gaarimasen(*srce, L(";"));
					}
					break;
				}
			}
			return true;
		case TYPE_TOKEN:
			for(;;){
				if(srce->GetToken(*this) != OTHERKIND_TOKEN){
					return koubuneraadesu(*srce);
				}
				std::WSTR name;
				srce->appendTStr(name);
				if(srce->GetToken(*this) != DAINYUU_TOKEN){
					srce->addErrMes(L("No type specified."));
					return false;
				}
				if(!TypeNanika(type, *srce, false, false, *this, true, false)){
					return false;
				}
				switch(srce->GetToken(*this)){
				case COMMA_TOKEN:
					if(!AddHensuu(type, name, 0, *srce)) return false;
					type.resize(1);
					continue;
				case SEMICOLON_TOKEN:
					if(!AddHensuu(type, name, 0, *srce)) return false;
					break;
				default:
					return gaarimasen(*srce, L(";"));
				}
				break;
			}
			return true;
		case LIB_TOKEN:
			for(;;){
				if(srce->GetToken(*this) != OTHERKIND_TOKEN){
					return koubuneraadesu(*srce);
				}
				std::WSTR name;
				srce->appendTStr(name);
				if(srce->GetToken(*this) != DAINYUU_TOKEN){
					srce->addErrMes(L("No library specified."));
					return false;
				}
				type += (intptr_t)LibNanika(*srce, *this, false);
				if(type.back() == 0) return false;
				root->extroot->addLib((SourceTree*)type.back());
				switch(srce->GetToken(*this)){
				case COMMA_TOKEN:
					if(!AddHensuu(type, name, 0, *srce)) return false;
					type.resize(1);
					continue;
				case SEMICOLON_TOKEN:
					if(!AddHensuu(type, name, 0, *srce)) return false;
					break;
				default:
					return gaarimasen(*srce, L(";"));
				}
				break;
			}
			return true;
		case TENTEN_TOKEN:
		case SIGNATURE_TOKEN:
			flu = true;
			goto FOOLABEL;
		}
		size = GetTypeSize(type);
		if(size < 0){
			srce->addErrMes(L("Error."));
			return false;
		}
		flu = KansuuTeigika();
FOOLABEL:
		if(flu){
			if(frp != this){
				srce->addErrMes(L("Functions cannot be defined inside subblocks."));
				return false;
			}
			if(cst){
				srce->addErrMes(L("You cannot define a function with const."));
				return false;
			}
			if (
				(
					ci = PathtoClassID(
						*srce, FUNC_BLOCK, false, false, false, *this, true))
				< 0) return false;
			auto pst = stat->funclist.Get(ci);
			if(pst->kakutei){
				srce->addErrMes(L("Already defined."));
				return false;
			}
			if(
				pst->tpcount > 0 && (
					srce->sst.next != NULL_TOKEN
					|| srce->sst.last != DAI_TOKEN))
			{
				srce->addErrMes(L("Error."));
				return false;
			}
			if(pst->rettype.size() > 0){
				if(
					pst->rettype.size() >= 2
					|| !IsKoukaiHensuuToken((TokenKind)pst->rettype[0]))
				{
					srce->addErrMes(
						L("An attempt was made to redefine self within the definition of a function."));
					return false;
				}else{
					if(
						type[0] == ATMARK_TOKEN
						|| !IsKoukaiHensuuToken((TokenKind)type[0]))
					{
						srce->addErrMes(
							L("It is already in public use."));
						return false;
					}
				}
			}
			if(pst->parent == pst->root){
				if(type[0] == WARU_TOKEN){
					srce->addErrMes(L("Global/functions cannot be defined."));
					return false;
				}else if(
					pst->root->returnshita >= 0
					&& IsPublicToken((TokenKind)type[0]))
				{
					for(
						tidx = 0; tidx < IDX(pst->root->children.size());
						tidx++)
					{
						if(pst->root->children[tidx] == pst) break;
					}
					if(tidx < IDX(pst->root->children.size())){
						srce->addErrMes(
							L("After ret is issued globally, open the public global function")
							L("cannot be defined."));
						return false;
					}
				}
			}
			pst->srce = srce;
			pst->rettype = type;
			pst->fileroot = fileroot;
			if(pst->tpcount > 0){
				pst->topsrcidx = srce->curIdx();
				pst->topsrcgyo = srce->sst.g;
				if(!necessaryToken(*srce, *this, SHOUKAKKOOPEN_TOKEN)){
					return false;
				}
				for(int nest = 1; ; ){
					kin = srce->GetTokenYomitobashi();
					switch(kin){
					case SHOUKAKKOOPEN_TOKEN:
						nest++;
						break;
					case SHOUKAKKOCLOSE_TOKEN:
						nest--;
						break;
					case CHUUKAKKOOPEN_TOKEN:
					case CHUUKAKKOCLOSE_TOKEN:
					case SEMICOLON_TOKEN:
					case DQUOT_TOKEN:
					case SQUOT_TOKEN:
					case BACKSLA_TOKEN:
						kin = NULL_TOKEN;
						break;
					}
					if(nest == 0 || kin <= NULL_TOKEN) break;
				}
				if(kin <= NULL_TOKEN) return gaarimasen(*srce, L(")"));
				do{
					kin = srce->GetTokenYomitobashi();
					switch(kin){
					case CHUUKAKKOCLOSE_TOKEN:
					case SEMICOLON_TOKEN:
					case DQUOT_TOKEN:
					case SQUOT_TOKEN:
					case BACKSLA_TOKEN:
						kin = NULL_TOKEN;
						break;
					}
				}while(kin != CHUUKAKKOOPEN_TOKEN && kin > NULL_TOKEN);
				if(kin != CHUUKAKKOOPEN_TOKEN) return gaarimasen(*srce, L("{"));
				for(int nest = 1; nest != 0 && kin > NULL_TOKEN; ){
					kin = srce->GetTokenYomitobashi();
					switch(kin){
					case CHUUKAKKOOPEN_TOKEN:
						nest++;
						break;
					case CHUUKAKKOCLOSE_TOKEN:
						nest--;
						break;
					case DQUOT_TOKEN:
						srce->Find(L('"'));
						srce->sst.i++;
						break;
					case SQUOT_TOKEN:
						if(srce->source[srce->sst.i] == L('\\')){
							srce->sst.i += 2;
						}
						srce->Find(L('\''));
						srce->sst.i++;
						break;
					case BACKSLA_TOKEN:
						srce->sst.i++;
					}
				}
				if(kin <= NULL_TOKEN){
					srce->addErrMes(L("'}' is missing."));
					return false;
				}
				if(pst->children.size() > 0){
					if(!pst->BackTemplate(pst->tpcount)) return false;
				}else{
					pst->kakutei = true;
				}
			}else{
				pst->GblhaniSet(*srce, *this);
				pst->MbrhaniSet(*srce, *this);
				if(!pst->KariHikisuu()) return false;
				if(!pst->MakeTree()) return false;
			}
			return true;
		}
		kin = srce->GetToken(*this);
		auto oldsst = srce->sst;
		if(kin != OTHERKIND_TOKEN) return koubuneraadesu(*srce);
		if(root == this){
			if(
				returnshita >= 0 && (
					IsKoukaiHensuuToken((TokenKind)type[0])
					|| (funcfg && IsPublicToken((TokenKind)type[0]))))
			{
				srce->addErrMes(
					L("After ret is issued in global, it is necessary to define public global variables.")
					L("It is not possible."));
				return false;
			}
		}
		std::WSTR name;
		srce->appendTStr(name);
		kin = srce->GetToken(*this);
		switch(kin){
		case DAINYUU_TOKEN:
			if(cst){
				std::basic_string<intptr_t> cnst;
				if(
					!ConstShiki(
						*srce, NULL_TOKEN, srce->GetToken(*this), cnst,
						SEMICOLON_TOKEN, false, true)) return false;
				if(!ConstCaster(cnst, type)){
					srce->addErrMes(L("Type error."));
					return false;
				}
				if(!AddHensuu(cnst, name, 0, *srce)) return false;
				if(srce->sst.last == COMMA_TOKEN){
					if(!HenFuTouroku(tk, type)) return false;
				}
				break;
			}else if(selftype == CLASS_BLOCK){
				if(!AddHensuu(type, name, size, *srce)) return false;
				if(!ClassnoTeisuuDainyuu(type)) return false;
				if(srce->sst.last == COMMA_TOKEN){
					if(!HenFuTouroku(tk, type)) return false;
				}
				break;
			}
		case POINT_TOKEN:
			if(!cst && selftype != CLASS_BLOCK){
				if(!AddHensuu(type, name, size, *srce)) return false;
				srce->sst = oldsst;
				if(
					!Shiki(
						tk, *srce, NULL_TOKEN, OTHERKIND_TOKEN,
						SEMICOLON_TOKEN)) return false;
				tk += SEMICOLON_TOKEN;
				if(srce->sst.last == COMMA_TOKEN){
					if(!HenFuTouroku(tk, type)) return false;
				}
				break;
			}
		default:
			if(!cst) return gaarimasen(*srce, L(";"));
		case SEMICOLON_TOKEN:
		case COMMA_TOKEN:
			if(cst || funcfg){
				srce->addErrMes(L("No value specified."));
				return false;
			}
			if(!AddHensuu(type, name, size, *srce)) return false;
			if(kin == COMMA_TOKEN && !HenFuTouroku(tk, type)) return false;
			break;
		}
		return true;
	}
	MEMBER bool SetType(std::basic_string<intptr_t>& type, const TokenKind oskin)
	{
		TokenKind kin;
		bool pubf, constf, coref, dolf, misc;
		kin = oskin;
		pubf = constf = coref = dolf = misc = false;
		type.clear();
		while(kin > NULL_TOKEN){
			if(kin != KAKERU_TOKEN) type += kin;
			switch(kin){
			case PUBLIC_TOKEN:
			case CONST_TOKEN:
			case WARU_TOKEN:
			case CORE_TOKEN:
			case KAKERU_TOKEN:
				if (pubf || misc || constf || dolf || coref){
					if(dolf && !pubf && kin == PUBLIC_TOKEN){
						type.back() = ATMARK_TOKEN;
					}else{
						srce->addErrMes(
							L("You cannot stack more than one decorator."));
						return false;
					}
				}
				pubf = kin == PUBLIC_TOKEN;
				constf = kin == CONST_TOKEN;
				coref = kin == CORE_TOKEN;
				dolf = kin == KAKERU_TOKEN;
				misc = kin == WARU_TOKEN;
				kin = srce->GetToken(*this);
				continue;
			case AND_TOKEN:
				break;
			case REF_TOKEN:
			case LIST_TOKEN:
			case AMARI_TOKEN:
			case THREAD_TOKEN:
				if(constf){
					srce->addErrMes(L("It cannot be a constant."));
					return false;
				}
			case XOR_TOKEN:
			case BOOL_TOKEN:
			case CHAR_TOKEN:
			case DOUBLE_TOKEN:
			case FLOAT_TOKEN:
			case BYTE_TOKEN:
			case INT_TOKEN:
			case LONG_TOKEN:
			case SHORT_TOKEN:
			case UBYTE_TOKEN:
			case UINT_TOKEN:
			case ULONG_TOKEN:
			case USHORT_TOKEN:
			case INDEX_TOKEN:
			case VOID_TOKEN:
			case OR_TOKEN:
			case FUNC_TOKEN:
			case METHOD_TOKEN:
			case TENTEN_TOKEN:
				if(coref){
					srce->addErrMes(L("Core is just a class."));
					return false;
				}
				break;
			case DOLLAR_TOKEN:
				if(coref){
					srce->addErrMes(L("Core is just a class."));
					return false;
				}
				type.back() = SIGNATURE_TOKEN;
				if(!FuncType(type, *srce, true)) return false;
				break;
			case TYPE_TOKEN:
			case LIB_TOKEN:
			case PLUGIN_TOKEN:
			case TILDE_TOKEN:
				if (pubf || misc || constf || coref){
					srce->addErrMes(L("Decorators cannot be attached."));
					return false;
				}
				break;
			default:
				return koubuneraadesu(*srce);
			}
			break;
		}
		if(kin <= NULL_TOKEN){
			srce->addErrMes(L("Error."));
			return false;
		}
		return true;
	}
	MEMBER bool Teigi(std::basic_string<intptr_t>& tk, const TokenKind oskin)
	{
		std::basic_string<intptr_t> type;
		if(!SetType(type, oskin)) return false;
		if(!HenFuTouroku(tk, type)) return false;
		return true;
	}
	MEMBER Hensuu<SourceTree>* GetHensuu(const std::WSTR& name, bool cst)
	{
		intptr_t idx;
		return GetHensuuIndex(name, idx, cst);
	}
	MEMBER Hensuu<SourceTree>* GetHensuuIndex(
		const std::WSTR& name, intptr_t& iii, bool cst)
	{
		SourceTree *pst;
		pst = this;
		for(;;){
			intptr_t ii = pst->NameToIdx(name);
			if(ii >= 0 && ii < IDX(pst->hensuname.size())){
				iii = pst->hensuidx[ii];
				if(
					cst && frp->funchensuu[iii].type[0] != CONST_TOKEN || (
						pst->breakin && pst->breaknaihani >= 0
						&& ii >=  pst->breaknaihani)) return nullptr;
				return frp->funchensuu.data() + iii;
			}
			if(pst == frp) break;
			pst = pst->parent;
		}
		return nullptr;
	}
	MEMBER bool TeigitoIfKinshi()
	{
		TokenKind ki;
		switch(srce->GetToken(*this)){
		case CONST_TOKEN:
		case PUBLIC_TOKEN:
		case WARU_TOKEN:
		case KAKERU_TOKEN:
		case CORE_TOKEN:
		case AND_TOKEN:
		case OR_TOKEN:
		case BOOL_TOKEN:
		case BYTE_TOKEN:
		case CHAR_TOKEN:
		case DOUBLE_TOKEN:
		case FLOAT_TOKEN:
		case INT_TOKEN:
		case LONG_TOKEN:
		case LIST_TOKEN:
		case REF_TOKEN:
		case AMARI_TOKEN:
		case XOR_TOKEN:
		case SHORT_TOKEN:
		case UBYTE_TOKEN:
		case UINT_TOKEN:
		case ULONG_TOKEN:
		case USHORT_TOKEN:
		case INDEX_TOKEN:
		case VOID_TOKEN:
		case FUNC_TOKEN:
		case METHOD_TOKEN:
		case THREAD_TOKEN:
		case TILDE_TOKEN:
		case DOLLAR_TOKEN:
		case TENTEN_TOKEN:
		case TYPE_TOKEN:
		case LIB_TOKEN:
		case PLUGIN_TOKEN:
		case NEW_TOKEN:
		case DELETE_TOKEN:
			srce->addErrMes(L("It cannot be defined here."));
			return false;
		case CHUUKAKKOCLOSE_TOKEN:
		case NULL_TOKEN:
			srce->addErrMes(L("Error."));
			return false;
		case IF_TOKEN:
			srce->addErrMes(L("You cannot write if here."));
			return false;
		case CASE_TOKEN:
		case COND_TOKEN:
		case DIFF_TOKEN:
		case COMM_TOKEN:
			srce->addErrMes(L("You cannot write a label here."));
			return false;
		case BREAK_TOKEN:
		case WHILE_TOKEN:
		case DEFAULT_TOKEN:
		case DO_TOKEN:
		case ELSE_TOKEN:
		case CONTINUE_TOKEN:
			{
				auto oldsst = srce->sst;
				ki = srce->GetToken(*this);
				if(ki != SEMICOLON_TOKEN && ki != COMMA_TOKEN){
					srce->addErrMes(L("You cannot write a label here."));
					return false;
				}
				srce->sst = oldsst;
			}
			break;
		}
		srce->setNextLast();
		return true;
	}
	MEMBER bool BlockOpenKinshi()
	{
		switch(srce->GetToken(*this)){
		case CHUUKAKKOOPEN_TOKEN:
		case SWITCH_TOKEN:
		case BRANCH_TOKEN:
		case LOOP_TOKEN:
		case LOCK_TOKEN:
			srce->addErrMes(L("Blocks cannot be written here."));
			return false;
		}
		srce->setNextLast();
		return true;
	}
	MEMBER bool ClassnaiKinsoku()
	{
		if(selftype == CLASS_BLOCK){
			srce->addErrMes(L("Only the definition is written in the class."));
			return false;
		}
		return true;
	}
	MEMBER bool KoubunKanouJoutai(const BlockType bt)
	{
		if((selftype != bt && bt != NORMAL_BLOCK) || crp == this || breakin){
			srce->addErrMes(L("You can't do that here."));
			return false;
		}
		return true;
	}
	MEMBER bool Bun(std::basic_string<intptr_t>& tk, const TokenKind kin)
	{
		if(!Shiki(tk, *srce, NULL_TOKEN, kin, SEMICOLON_TOKEN)){
			return false;
		}
		if(srce->sst.last == COMMA_TOKEN){
			srce->addErrMes(L(",' is not allowed."));
			return false;
		}
		return true;
	}
	MEMBER void IndoSub(intptr_t& i)
	{
		token.resize(token.size()+1);
		ptk = &token.back();
		*ptk = token[token.size()-2];
		gyo.resize(token.size());
		gyo.back() = gyo[gyo.size()-2];
		if(token.size() >= 3 && token[token.size()-3][0] == IF_TOKEN){
			token[token.size()-2] = token[token.size()-3];
			gyo[gyo.size()-2] = gyo[gyo.size()-3];
			token[token.size()-3].clear();
			i = token.size()-3;
		}else{
			token[token.size()-2].clear();
			i = token.size()-2;
		}
	}
	MEMBER std::basic_string<intptr_t>* Indo()
	{
		if(teigikinshi < 0) IndoSub(teigikinshi);
		return ptk;
	}
	MEMBER std::basic_string<intptr_t>* AfterBreak()
	{
		if(teigibreaktmp < 0){
			if(teigikinshi >= 0){
				teigibreaktmp = teigikinshi;
			}else{
				IndoSub(teigibreaktmp);
			}
		}
		return ptk;
	}
	MEMBER bool MakeTreeSwitch(
		std::basic_string<intptr_t>* ptok, const TokenKind kin)
	{
		SourceTree* pst;
		switch(kin){
		case CONST_TOKEN:
		case PUBLIC_TOKEN:
		case WARU_TOKEN:
		case KAKERU_TOKEN:
		case CORE_TOKEN:
			{
				auto oldsst = srce->sst;
				std::basic_string<intptr_t> type;
				if(kin != KAKERU_TOKEN) type = kin;
				if(
					TypeNanika(
						type, *srce, kin == CONST_TOKEN, kin == CORE_TOKEN,
						*this, true, false)
					&& type[(int)(kin != KAKERU_TOKEN)] != NULL_TOKEN)
				{
					if(!HenFuTouroku(*ptok, type)) return false;
					break;
				}
				if(stat->tokubetuerr) return false;
				stat->ss->emes.Clear();
				srce->sst = oldsst;
			}
		case AND_TOKEN:
		case OR_TOKEN:
		case BOOL_TOKEN:
		case BYTE_TOKEN:
		case CHAR_TOKEN:
		case DOUBLE_TOKEN:
		case FLOAT_TOKEN:
		case INT_TOKEN:
		case LONG_TOKEN:
		case LIST_TOKEN:
		case REF_TOKEN:
		case AMARI_TOKEN:
		case XOR_TOKEN:
		case SHORT_TOKEN:
		case UBYTE_TOKEN:
		case UINT_TOKEN:
		case ULONG_TOKEN:
		case USHORT_TOKEN:
		case INDEX_TOKEN:
		case VOID_TOKEN:
		case FUNC_TOKEN:
		case METHOD_TOKEN:
		case THREAD_TOKEN:
		case TILDE_TOKEN:
		case DOLLAR_TOKEN:
		case TENTEN_TOKEN:
		case TYPE_TOKEN:
		case LIB_TOKEN:
		case PLUGIN_TOKEN:
			if(!Teigi(*ptok, kin)) return false;
			break;
		case NEW_TOKEN:
		case DELETE_TOKEN:
			if(selftype != CLASS_BLOCK){
				srce->addErrMes(L("Must be in class."));
				return false;
			}
			{
				std::WSTR name;
				srce->appendTStr(name);
				auto fi = GetFuncId(name, true);
				if(fi < 0){
					srce->addErrMes(L("This is a strange error."));
					return false;
				}
				pst = stat->funclist.Get(fi);
				if(pst->mbrhani != INTPTR_MAX){
					srce->addErrMes(L("Already defined."));
					return false;
				}
				pst->mbrhani = pst->parent->funchensuu.size();
				pst->selftype = FUNC_BLOCK;
				pst->rettype = VOID_TOKEN;
				if(srce->GetToken(*this) != SHOUKAKKOOPEN_TOKEN
					|| srce->GetToken(*this) != SHOUKAKKOCLOSE_TOKEN
					|| srce->GetToken(*this) != CHUUKAKKOOPEN_TOKEN)
				{
					return koubuneraadesu(*srce);
				}
				if(srce->GetToken(*this) == COLOYAJIRUSHI_TOKEN){
					pst->touka = true;
				}else{
					srce->setNextLast();
				}
				pst->kakutei = false;
				if(!pst->MakeTree()) return false;
			}
			break;
		case OTHERKIND_TOKEN:
		case BQUOT_TOKEN:
		case POINT_TOKEN:
		case ATMARK_TOKEN:
		case QUESTION_TOKEN:
		case PULUS_TOKEN:
		case MINUS_TOKEN:
		case EXCLAMATION_TOKEN:
		case PLSPLS_TOKEN:
		case MNSMNS_TOKEN:
		case TOGGLE_TOKEN:
		case SHARP_TOKEN:
		case QUOTDOUBLE_TOKEN:
		case SHOUKAKKOOPEN_TOKEN:
		case DAIKAKKOOPEN_TOKEN:
		case SQUOT_TOKEN:
		case DQUOT_TOKEN:
		case BACKSLA_TOKEN:
		case FALSE_TOKEN:
		case TRUE_TOKEN:
		case SELF_TOKEN:
		case TYPESIZE_TOKEN:
		case TYPEID_TOKEN:
		case SHOU_TOKEN:
			if(!ClassnaiKinsoku()) return false;
			if(!Bun(*ptok, kin)) return false;
			*ptok += SEMICOLON_TOKEN;
			break;
		case RET_TOKEN:
			if(!ClassnaiKinsoku()) return false;
			if(breakinnest){
				srce->addErrMes(L("Return is not possible within break."));
				return false;
			}
			if(!Bun(*ptok, srce->GetToken(*this))) return false;
			*ptok += NULL_TOKEN;
			*ptok += RET_TOKEN;
			pst = this;
			while(pst != pst->crp){
				if(
					pst->selftype == SWITCH_BLOCK
					&& !pst->extswitch->haveCaseOrDefault)
				{
					srce->addErrMes(
						L("You cannot return before a case or default appears."));
					return false;
				}
				*ptok += BREAK_TOKEN;
				if(pst->breaknaihani < 0){
					pst->breaknaihani = pst->hensuname.size();
				}
				if(ptok == pst->ptk){
					ptok = pst->AfterBreak();
				}else{
					pst->AfterBreak();
				}
				for(intptr_t ii = pst->hensuidx.size()-1; ii >= 0; ii--){
					if(
						frp->funchensuu[pst->hensuidx[ii]].type[0]
						== CONST_TOKEN) continue;
					intptr_t idx = 0;
					auto fi =
						TokenToTypeId(
							frp->funchensuu[pst->hensuidx[ii]].type.data(),
							idx);
					if(fi > ENDCLASS_TYPEID) continue;
					if(fi < 0){
						if(
							!(DYNLIST_TYPEID <= fi && fi <= REF_TYPEID)
							&& fi < ENDTHREAD_TYPEID) continue;
						if(frp == root) *ptok += GLOBAL_TOKEN;
						*ptok += ~pst->hensuidx[ii];
						*ptok += DELETE_TOKEN;
						*ptok += SEMICOLON_TOKEN;
					}else if(stat->funclist.Get(fi)->selftype == CLASS_BLOCK){
						std::basic_string<intptr_t> tmp;
						if(frp == root) tmp = GLOBAL_TOKEN;
						tmp += ~pst->hensuidx[ii];
						tmp += POINT_TOKEN;
						stat->funclist.Get(fi)->CallDel(*ptok, tmp);
					}
				}
				*ptok += COMMA_TOKEN;
				if(pst->returnshita < 0){
					pst->returnshita = pst->frp->funchensuu.size();
				}
				pst = pst->parent;
			}
			for(intptr_t ii = pst->hensuidx.size()-1; ii >= 0; ii--){
				if(pst->hensuidx[ii] < pst->tpcount+pst->hikisuucount) break;
				if(frp->funchensuu[pst->hensuidx[ii]].type[0] == CONST_TOKEN){
					continue;
				}
				intptr_t idx = 0;
				auto fi =
					TokenToTypeId(
						frp->funchensuu[pst->hensuidx[ii]].type.data(), idx);
				if(fi > ENDCLASS_TYPEID) continue;
				if(fi < 0){
					if(
						!(DYNLIST_TYPEID <= fi && fi <= REF_TYPEID)
						&& fi < ENDTHREAD_TYPEID) continue;
					if(frp == root) *ptok += GLOBAL_TOKEN;
					*ptok += ~pst->hensuidx[ii];
					*ptok += DELETE_TOKEN;
					*ptok += SEMICOLON_TOKEN;
				}else if(stat->funclist.Get(fi)->selftype == CLASS_BLOCK){
					std::basic_string<intptr_t> tmp;
					if(frp == root) tmp = GLOBAL_TOKEN;
					tmp += ~pst->hensuidx[ii];
					tmp += POINT_TOKEN;
					stat->funclist.Get(fi)->CallDel(*ptok, tmp);
				}
			}
			*ptok += RET_TOKEN;
			if(pst->returnshita < 0){
				pst->returnshita = pst->frp->funchensuu.size();
			}
			break;
		case BRANCH_TOKEN:
		case LOOP_TOKEN:
			if(!ClassnaiKinsoku()) return false;
			if(!necessaryToken(*srce, *this, CHUUKAKKOOPEN_TOKEN)){
				return false;
			}
			*ptok += CHUUKAKKOOPEN_TOKEN;
			*ptok += children.size();
			if(
				(
					pst = BlockOpen(
						nullptr,
						(kin==BRANCH_TOKEN ? BRANCH_BLOCK : LOOP_BLOCK),
						false, true)) == nullptr)
			{
				srce->addErrMes(L("This is a strange error."));
				return false;
			}
			if(!pst->MakeTree()) return false;
			ptok = ptk;
			*ptok += CHUUKAKKOCLOSE_TOKEN;
			break;
		case SWITCH_TOKEN:
		case LOCK_TOKEN:
			if(!ClassnaiKinsoku()) return false;
			*ptok += CHUUKAKKOOPEN_TOKEN;
			*ptok += children.size();
			if(
				(
					pst = BlockOpen(
					nullptr, (kin==SWITCH_TOKEN ? SWITCH_BLOCK : LOCK_BLOCK),
					false, true)) == nullptr)
			{
				srce->addErrMes(L("This is a strange error."));
				return false;
			}
			if(!necessaryToken(*srce, *this, SHOUKAKKOOPEN_TOKEN)){
				return false;
			}
			*ptok += SHOUKAKKOOPEN_TOKEN;
			{
				int comcnt = 0;
				if(
					!ShikiEx(
						*ptok, *srce, NULL_TOKEN, srce->GetToken(*this),
						SHOUKAKKOCLOSE_TOKEN, comcnt)) return false;
				pst->sonota.ichijihensuu = comcnt+1;
			}
			*ptok += SHOUKAKKOCLOSE_TOKEN;
			if(!necessaryToken(*srce, *this, CHUUKAKKOOPEN_TOKEN)){
				return false;
			}
			if(!pst->MakeTree()) return false;
			ptok = ptk;
			*ptok += CHUUKAKKOCLOSE_TOKEN;
			break;
		case DO_TOKEN:
			if(!KoubunKanouJoutai(LOOP_BLOCK)) return false;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			*ptok += DO_TOKEN;
			{
				auto ki = srce->GetToken(*this);
				switch(ki){
				case COLON_TOKEN:
					if(extloop->mode != 0) return koubuneraadesu(*srce);
					extloop->mode = 1;
					break;
				case SEMICOLON_TOKEN:
					break;
				default:
					return koubuneraadesu(*srce);
				}
				*ptok += ki;
			}
			break;
		case CONTINUE_TOKEN:
			if(!KoubunKanouJoutai(LOOP_BLOCK)) return false;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			*ptok += CONTINUE_TOKEN;
			{
				auto ki = srce->GetToken(*this);
				switch(ki){
				case COLON_TOKEN:
					if(extloop->mode != 1) return koubuneraadesu(*srce);
					extloop->mode = 2;
					break;
				case SEMICOLON_TOKEN:
					break;
				default:
					return koubuneraadesu(*srce);
				}
				*ptok += ki;
			}
			break;
		case WHILE_TOKEN:
			if(!KoubunKanouJoutai(LOOP_BLOCK)) return false;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			*ptok += WHILE_TOKEN;
			{
				auto ki = srce->GetToken(*this);
				switch(ki){
				case SEMICOLON_TOKEN:
					*ptok += SEMICOLON_TOKEN;
					break;
				default:
					if(extloop->mode < 1 || 2 < extloop->mode){
						return koubuneraadesu(*srce);
					}
					extloop->mode = 3;
					if(!Shiki(*ptok, *srce, NULL_TOKEN, ki, COLON_TOKEN)){
						return false;
					}
					*ptok += COLON_TOKEN;
					break;
				}
			}
			break;
		case COND_TOKEN:
			if(!KoubunKanouJoutai(BRANCH_BLOCK)) return false;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			if(
				(extbranch->mode < 0 ? -extbranch->mode : extbranch->mode)
				>= 2)
			{
				return koubuneraadesu(*srce);
			}
			*ptok += COND_TOKEN;
			if (srce->source[srce->sst.i] == L('<')) {
				srce->sst.i++;
				if (extbranch->mode > 0
					|| srce->GetToken(*this) != OTHERKIND_TOKEN
					|| !extbranch->addlabel(
						srce->source + srce->sst.t, srce->sst.i - srce->sst.t))
				{
					return koubuneraadesu(*srce);
				}
				if (!necessaryToken(*srce, *this, DAI_TOKEN)) return false;
				if (extbranch->mode == 0) {
					std::basic_string<intptr_t> type;
					type = INT_TOKEN;
					sonota.ichijihensuu =
						AddHiddenHensuu(type, sizeof(int32_t));
				}
				*ptok += extbranch->label.size() - 1;
				extbranch->mode = -1;
			}
			else {
				if (extbranch->mode < 0) return koubuneraadesu(*srce);
				extbranch->mode = 1;
			}
			if(
				!Shiki(
					*ptok, *srce, NULL_TOKEN, srce->GetToken(*this),
					COLON_TOKEN)) return false;
			*ptok += COLON_TOKEN;
			break;
		case COMM_TOKEN:
			if(!KoubunKanouJoutai(BRANCH_BLOCK)) return false;
			if(
				extbranch->mode >= 3 || extbranch->mode == 0
				|| extbranch->mode == -4)
			{
				return koubuneraadesu(*srce);
			}
			*ptok += COMM_TOKEN;
			extbranch->dino = 0;
			extbranch->mode = (extbranch->mode < 0 ? -4 : 4);
			if(!necessaryToken(*srce, *this, COLON_TOKEN)) return false;
			*ptok += COLON_TOKEN;
			break;
		case DIFF_TOKEN:
			if(!KoubunKanouJoutai(BRANCH_BLOCK)) return false;
			if(extbranch->mode >= 0 || extbranch->mode == -2){
				return koubuneraadesu(*srce);
			}
			*ptok += DIFF_TOKEN;
			if(!necessaryToken(*srce, *this, SHOU_TOKEN)) return false;
			{
				if(srce->GetToken(*this) != OTHERKIND_TOKEN){
					return koubuneraadesu(*srce);
				}
				std::WSTR name;
				srce->appendTStr(name);
				auto ipr = extbranch->findlabel(name);
				if(ipr < 0) return koubuneraadesu(*srce);
				if(!necessaryToken(*srce, *this, DAI_TOKEN)) return false;
				if(ipr < extbranch->dino) return koubuneraadesu(*srce);
				*ptok += ipr;
				extbranch->dino = ipr+1;
			}
			extbranch->mode = -3;
			if(!necessaryToken(*srce, *this, COLON_TOKEN))return false;
			*ptok += COLON_TOKEN;
			break;
		case ELSE_TOKEN:
			if(!KoubunKanouJoutai(BRANCH_BLOCK)) return false;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			*ptok += ELSE_TOKEN;
			{
				auto ki = srce->GetToken(*this);
				switch(ki){
				case COLON_TOKEN:
					if(extbranch->mode % 2 == 0 && extbranch->mode != -4){
						return koubuneraadesu(*srce);
					}
					if(extbranch->mode < 0){
						extbranch->mode = -2;
					}else{
						extbranch->mode = 2;
					}
					break;
				case SEMICOLON_TOKEN:
					break;
				default:
					return koubuneraadesu(*srce);
				}
				*ptok += ki;
			}
			break;
		case CASE_TOKEN:
			if(!KoubunKanouJoutai(SWITCH_BLOCK)) return false;
			extswitch->haveCaseOrDefault = true;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			*ptok += CASE_TOKEN;
			do{
				std::basic_string<intptr_t> tmp;
				if(
					!ConstShiki(
						*srce, NULL_TOKEN, srce->GetToken(*this), tmp,
						COLON_TOKEN, false, true)) return false;
				*ptok += tmp;
				*ptok += COMMA_TOKEN;
			}while(srce->sst.last == COMMA_TOKEN);
			ptok->back() = srce->sst.last;
			break;
		case DEFAULT_TOKEN:
			if(!KoubunKanouJoutai(SWITCH_BLOCK)) return false;
			if(ptok == ptk){
				ptok = Indo();
			}else{
				Indo();
			}
			*ptok += DEFAULT_TOKEN;
			{
				auto ki = srce->GetToken(*this);
				if(
					ki != COLON_TOKEN && ki != COLOYAJIRUSHI_TOKEN
					&& ki != SEMICOLON_TOKEN)
				{
					return koubuneraadesu(*srce);
				}
				if(ki != SEMICOLON_TOKEN) extswitch->haveCaseOrDefault = true;
				*ptok += ki;
			}
			break;
		case IF_TOKEN:
			if(!ClassnaiKinsoku()) return false;
			*ptok += IF_TOKEN;
			if(!necessaryToken(*srce, *this, SHOUKAKKOOPEN_TOKEN)){
				return false;
			}
			*ptok += SHOUKAKKOOPEN_TOKEN;
			if(
				!Shiki(
					*ptok, *srce, NULL_TOKEN, srce->GetToken(*this),
					SHOUKAKKOCLOSE_TOKEN))
			{
				return false;
			}
			*ptok += SHOUKAKKOCLOSE_TOKEN;
			if(!TeigitoIfKinshi()) return false;
			break;
		case BREAK_TOKEN:
			if(!KoubunKanouJoutai(NORMAL_BLOCK)) return false;
			*ptok += BREAK_TOKEN;
			{
				auto ki = srce->GetToken(*this);
				if(ki == COLON_TOKEN){
					*ptok += COLON_TOKEN;
					breakin = breakinnest = true;
					if(ptok == ptk){
						ptok = Indo();
					}else{
						Indo();
					}
					break;
				}
				if(breaknaihani < 0) breaknaihani = hensuname.size();
				if(ptok == ptk){
					ptok = AfterBreak();
				}else{
					AfterBreak();
				}
				for(intptr_t ii = hensuidx.size()-1; ii >= 0; ii--){
					if(frp->funchensuu[hensuidx[ii]].type[0] == CONST_TOKEN){
						continue;
					}
					intptr_t idx = 0;
					auto fi =
						TokenToTypeId(
							frp->funchensuu[hensuidx[ii]].type.data(), idx);
					if(fi > ENDCLASS_TYPEID) continue;
					if(fi < 0){
						if(
							!(DYNLIST_TYPEID <= fi && fi <= REF_TYPEID)
							&& fi < ENDTHREAD_TYPEID) continue;
						if(frp == root) *ptok += GLOBAL_TOKEN;
						*ptok += ~hensuidx[ii];
						*ptok += DELETE_TOKEN;
						*ptok += SEMICOLON_TOKEN;
					}else if(stat->funclist.Get(fi)->selftype == CLASS_BLOCK){
						std::basic_string<intptr_t> tmp;
						if(frp == root) tmp = GLOBAL_TOKEN;
						tmp += ~hensuidx[ii];
						tmp += POINT_TOKEN;
						stat->funclist.Get(fi)->CallDel(*ptok, tmp);
					}
				}
				if(ki == COMMA_TOKEN){
					*ptok += COMMA_TOKEN;
					if(!BlockOpenKinshi()) return false;
					if(!TeigitoIfKinshi()) return false;
					ki = srce->GetToken(*this);
					if(!parent->MakeTreeSwitch(ptok, ki)) return false;
					ptok = ptk;
				}else{
					if(ki != SEMICOLON_TOKEN) return gaarimasen(*srce, L(";"));
					*ptok += SEMICOLON_TOKEN;
				}
			}
			break;
		case CHUUKAKKOOPEN_TOKEN:
			if(!ClassnaiKinsoku()) return false;
			*ptok += CHUUKAKKOOPEN_TOKEN;
			*ptok += children.size();
			if(
				(pst = BlockOpen(nullptr, NORMAL_BLOCK, false, true))
				== nullptr)
			{
				srce->addErrMes(L("This is a strange error."));
				return false;
			}
			if(!pst->MakeTree()) return false;
			ptok = ptk;
			*ptok += CHUUKAKKOCLOSE_TOKEN;
			break;
		default:
			{
				std::WSTR str;
				str = L('\'');
				srce->appendTStr(str);
				str += L("' is not allowed");
				srce->addErrMes(str);
			}
			return false;
		}
		return true;
	}
	bool MakeTree()
	{
		topsrcidx = srce->curIdx();
		topsrcgyo = srce->sst.g;
		switch(selftype){
		case SWITCH_BLOCK:
			extswitch = new SwitchExtStruct;
			break;
		case BRANCH_BLOCK:
			extbranch = new BranchExtStruct;
			break;
		case LOOP_BLOCK:
			extloop = new LoopExtStruct;
			break;
		case LOCK_BLOCK:
			{
				std::basic_string<intptr_t> tmp;
				tmp = INDEX_TOKEN;
				sonota.ichijihensuu =
					AddHiddenHensuu(
						tmp,
						sonota.ichijihensuu*(sizeof(DynamicRef)
						+ sizeof(intptr_t)));
			}
			break;
		}
		TokenKind kin;
		while(
			(kin = srce->GetToken(*this)) > NULL_TOKEN
			&& kin != CHUUKAKKOCLOSE_TOKEN)
		{
			token.resize(token.size()+1);
			ptk = &token.back();
			ptk->clear();
			gyo += srce->sst.g;
			if(!MakeTreeSwitch(ptk, kin)) return false;
			if(ptk->size() == 0){
				token.pop_back();
				gyo.pop_back();
			}
		}
		if(root == this){
			if(kin != NULL_TOKEN || srce->sst.i != srce->src.size()){
				return koubuneraadesu(*srce);
			}
		}else{
			if(kin != CHUUKAKKOCLOSE_TOKEN) return gaarimasen(*srce, L("}"));
		}
		if(
			crp != this	|| (
				(selftype == FUNC_BLOCK || selftype == DELEGATE_BLOCK)
				&& rettype.back() == VOID_TOKEN))
		{
			for(intptr_t ii = hensuidx.size()-1; ii >= 0; ii--){
				if(hensuidx[ii] < tpcount+hikisuucount) break;
				if(frp->funchensuu[hensuidx[ii]].type[0] == CONST_TOKEN){
					continue;
				}
				intptr_t idx = 0;
				auto ti =
					TokenToTypeId(
						frp->funchensuu[hensuidx[ii]].type.data(), idx=0);
				if(ti > ENDCLASS_TYPEID) continue;
				if(ti < 0){
					if(
						!(DYNLIST_TYPEID <= ti && ti <= REF_TYPEID)
						&& ti < ENDTHREAD_TYPEID) continue;
					if(frp == root) defdel += GLOBAL_TOKEN;
					defdel += ~hensuidx[ii];
					defdel += DELETE_TOKEN;
					defdel += SEMICOLON_TOKEN;
				}else if(stat->funclist.Get(ti)->selftype == CLASS_BLOCK){
					std::basic_string<intptr_t> tmp;
					if(frp == root){
						tmp = GLOBAL_TOKEN;
					}else{
						tmp.clear();
					}
					tmp += ~hensuidx[ii];
					tmp += POINT_TOKEN;
					stat->funclist.Get(ti)->CallDel(defdel, tmp);
				}
			}
		}
		kakutei = true;
		if(returnshita < 0) returnshita = frp->funchensuu.size();
		return true;
	}
	MEMBER bool FileRead(const std::WSTR& fn)
	{
		if(!srce->Load(fn)) return false;
		stat->srclist.insert(
			std::pair<std::WSTR, SourceTree*>(srce->filename, this));
		if(!MakeTree()) return false;
		return true;
	}
	MEMBER bool StringRead(const std::WSTR& code, const std::WSTR& dir)
	{
		if(!srce->setString(code, dir)) return false;
		stat->srclist.insert(
			std::pair<std::WSTR, SourceTree*>(srce->filename, this));
		if(!MakeTree()) return false;
		return true;
	}
	MEMBER void FlgReset()
	{
		breakin = false;
		teigikinshi = -1;
		teigibreaktmp = -1;
		returnshita = -1;
		breaknaihani = -1;
		tpcount = 0;
		hikisuucount = 0;
		sonota.junkanid = 0;
		havedynref = false;
		mbsize = -1;
		byteadress = 0;
		deladress = 0;
		topsrcidx = 0;
		topsrcgyo = 0;
		touka = false;
		gblhani = INTPTR_MAX;
		gblsaikouhani = -1;
		mbrhani = INTPTR_MAX;
		mbrsaikouhani = -1;
	}
	MEMBER void ArrayReset()
	{
		myname.clear();
		token.clear();
		defdel.clear();
		gyo.clear();
		funchensuu.clear();
		hensuname.clear();
		hensuidx.clear();
		subfunc.clear();
		backpatch.clear();
		breakpatch.clear();
	}
	MEMBER void Clear()
	{
		stat->tokubetuerr = false;
		stat->ss->emes.Clear();
		stat->ss->gbldel.clear();
		Del();
		stat->funclist.Clear();
		stat->funclist.Add(this);
		stat->srclist.clear();
		stat->dlllist.clear();
		stat->literallist.clear();
		stat->literaltotal = 0;
		ArrayReset();
		FlgReset();
	}
};
