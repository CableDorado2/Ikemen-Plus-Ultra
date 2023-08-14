enum TokenKind
{
	ERROR_TOKEN = -1, NULL_TOKEN = 0,
///////////////////////////////////////////////////////////////////////////////
	POINT_TOKEN,
	COLOCOLO_TOKEN,
	DIA_TOKEN, COLOYAJIRUSHI_TOKEN,
	SHOUKAKKOOPEN_TOKEN, SHOUKAKKOCLOSE_TOKEN,
	CHUUKAKKOOPEN_TOKEN, CHUUKAKKOCLOSE_TOKEN,
	DAIKAKKOOPEN_TOKEN, DAIKAKKOCLOSE_TOKEN,
	KAKKOCOLOOPEN_TOKEN, KAKKOCOLOCLOSE_TOKEN,
	SQUOT_TOKEN,
	DQUOT_TOKEN,
	BQUOT_TOKEN,
	BACKSLA_TOKEN,
	TILDE_TOKEN,
	ATMARK_TOKEN,
	COLON_TOKEN,
	SEMICOLON_TOKEN,
	SOTOCOMMA_TOKEN, GYAKUDAINYUU_TOKEN,
	SHARP_TOKEN, EXCLAMATION_TOKEN,
	PLSPLS_TOKEN, MNSMNS_TOKEN, TOGGLE_TOKEN, QUOTDOUBLE_TOKEN,
///////////////////////////////////////////////////////////////////////////////
	DOLLAR_TOKEN,
	STARSTAR_TOKEN,
	KAKERU_TOKEN, WARU_TOKEN, AMARI_TOKEN,
	PULUS_TOKEN, MINUS_TOKEN,
	LSHIFT_TOKEN, RSHIFT_TOKEN,
	SHOU_TOKEN, SHOUOREQUAL_TOKEN, DAI_TOKEN, DAIOREQUAL_TOKEN,
	EQUAL_TOKEN, NOTEQUAL_TOKEN,
	AND_TOKEN,
	XOR_TOKEN,
	OR_TOKEN,
	ANDAND_TOKEN,
	OROR_TOKEN,
	QUESTION_TOKEN,
	DAINYUU_TOKEN, PULUSDAINYUU_TOKEN, MINUSDAINYUU_TOKEN,
	KAKERUDAINYUU_TOKEN, WARUDAINYUU_TOKEN, AMARIDAINYUU_TOKEN,
	ANDDAINYUU_TOKEN, XORDAINYUU_TOKEN, ORDAINYUU_TOKEN,
	LSHIFTDAINYUU_TOKEN, RSHIFTDAINYUU_TOKEN, STARSTARDAINYUU_TOKEN,
	TENDAINYUU_TOKEN,
	TENTEN_TOKEN, COMMA_TOKEN,
///////////////////////////////////////////////////////////////////////////////
	GLOBAL_TOKEN, MEMBER_TOKEN,
	OTHERKIND_TOKEN,
///////////////////////////////////////////////////////////////////////////////
	BOOL_TOKEN, BRANCH_TOKEN, BREAK_TOKEN, BYTE_TOKEN,
	CASE_TOKEN, CAST_TOKEN, CHAR_TOKEN, COMM_TOKEN, COND_TOKEN,
	CONST_TOKEN, CONTINUE_TOKEN, CORE_TOKEN,
	DEFAULT_TOKEN, DELETE_TOKEN, DIFF_TOKEN, DO_TOKEN, DOUBLE_TOKEN,
	ELSE_TOKEN,
	FALSE_TOKEN, FLOAT_TOKEN, FUNC_TOKEN,
	IF_TOKEN, INDEX_TOKEN, INT_TOKEN,
	LEN_TOKEN, LIB_TOKEN, LIST_TOKEN, LOCK_TOKEN, LONG_TOKEN, LOOP_TOKEN,
	METHOD_TOKEN,
	NEW_TOKEN,
	PLUGIN_TOKEN, PUBLIC_TOKEN,
	REF_TOKEN, RET_TOKEN,
	SELF_TOKEN, SHORT_TOKEN, SIGNATURE_TOKEN, SWITCH_TOKEN,
	THREAD_TOKEN, TRUE_TOKEN,
	TYPE_TOKEN, TYPEID_TOKEN, TYPESIZE_TOKEN,
	UBYTE_TOKEN, UINT_TOKEN, ULONG_TOKEN, USHORT_TOKEN,
	VOID_TOKEN,
	WHILE_TOKEN,
///////////////////////////////////////////////////////////////////////////////
	CONSTEVAL_TOKEN, IDNAME_TOKEN, WAIT_TOKEN
};

static inline bool IsSoushokuToken(const TokenKind t)
{
	return
		t == PUBLIC_TOKEN || t == CONST_TOKEN || t == WARU_TOKEN
		|| t == CORE_TOKEN || t == KAKERU_TOKEN || t == STARSTAR_TOKEN
		|| t == ATMARK_TOKEN;
}

static inline bool IsPublicToken(const TokenKind t)
{
	return
		t == PUBLIC_TOKEN || t == CONST_TOKEN || t == WARU_TOKEN
		|| t == ATMARK_TOKEN;
}

static inline bool IsRefReadOnlyToken(const TokenKind t)
{
	return t == WARU_TOKEN || t == KAKERU_TOKEN;
}

static inline bool IsRefSoushokuToken(const TokenKind t)
{
	return IsRefReadOnlyToken(t) || t == STARSTAR_TOKEN;
}

static inline bool IsReadOnlyToken(const TokenKind t)
{
	return IsRefReadOnlyToken(t) || t == CONST_TOKEN;
}

static inline bool isPublicOrAt(const TokenKind t)
{
	return t == PUBLIC_TOKEN || t == ATMARK_TOKEN;
}

static inline bool IsKoukaiHensuuToken(const TokenKind t)
{
	return t == PUBLIC_TOKEN || t == WARU_TOKEN || t == ATMARK_TOKEN;
}

static inline void SoushokuTobasi(const intptr_t *const ptypt, intptr_t &i)
{
	if(IsSoushokuToken((TokenKind)ptypt[i])) i++;
}


static bool RefToken(
	std::basic_string<intptr_t>& type, const intptr_t* const iap, intptr_t &i)
{
	if (IsRefSoushokuToken((TokenKind)iap[i])){
		type += iap[i];
		i++;
	}
	switch(iap[i]){
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
	case NULL_TOKEN:
		type += iap[i++];
		break;
	case AND_TOKEN:
	case OR_TOKEN:
		type += iap[i++];
		type += iap[i++];
		break;
	case REF_TOKEN:
	case LIST_TOKEN:
		type += iap[i++];
		if(!RefToken(type, iap, i)) return false;
		break;
	default:
		return false;
	}
	return true;
}

static std::basic_string<intptr_t> UnRefType(
	std::basic_string<intptr_t> reftype)
{
	intptr_t i = 0;
	if(IsPublicToken((TokenKind)reftype[i])) i++;
	if(reftype[i] != REF_TOKEN && reftype[i] != LIST_TOKEN) return reftype;
	i++;
	if(reftype[i] == WARU_TOKEN || reftype[i] == KAKERU_TOKEN) i++;
	std::basic_string<intptr_t> tmp;
	tmp.append(reftype.data()+i, reftype.size()-i);
	return tmp;
}


static bool FuncToken(
	std::basic_string<intptr_t>& type, const intptr_t* const iap, intptr_t& i);


static bool FuncRetToken(
	std::basic_string<intptr_t>& type, const intptr_t* const iap, intptr_t& i)
{
	if(IsKoukaiHensuuToken((TokenKind)iap[i])){
		type += iap[i];
		i++;
	}
	switch(iap[i]){
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
		type += iap[i++];
		break;
	case REF_TOKEN:
	case LIST_TOKEN:
		type += iap[i++];
		if(!RefToken(type, iap, i)) return false;
		break;
	case OR_TOKEN:
		type += iap[i++];
		type += iap[i++];
		break;
	case METHOD_TOKEN:
		type += iap[i++];
	case FUNC_TOKEN:
		type += iap[i++];
		if(!FuncToken(type, iap, i)) return false;
		break;
	default:
		return false;
	}
	return true;
}
static bool FuncToken(
	std::basic_string<intptr_t>& type, const intptr_t* const iap, intptr_t& i)
{
	if(iap[i] != SIGNATURE_TOKEN) return false;
	type += iap[i++];
	if(!FuncRetToken(type, iap, i)) return false;
	if(iap[i] != SHOUKAKKOOPEN_TOKEN) return false;
	type += iap[i++];
	while(iap[i] != SHOUKAKKOCLOSE_TOKEN){
		type += iap[i++];
		if(iap[i-1] == FUNC_TOKEN || iap[i-1] == TILDE_TOKEN){
			if(!FuncToken(type, iap, i)) return false;
		}else if(iap[i-1] == METHOD_TOKEN){
			type += iap[i++];
			if(!FuncToken(type, iap, i)) return false;
		}else if(iap[i-1] == AND_TOKEN || iap[i-1] == OR_TOKEN){
			type += iap[i++];
		}
	}
	type += iap[i++];
	return true;
}

static bool FuncTypeCheck(
	intptr_t f1l, const intptr_t* const f1, const intptr_t* const f2)
{
	intptr_t f1i = 0, f2i = 0;
	SoushokuTobasi(f1, f1i);
	SoushokuTobasi(f2, f2i);
	for(; f1i < f1l; f1i++, f2i++){
		if(
			f1[f1i] == FUNC_TOKEN || f1[f1i] == METHOD_TOKEN
			|| f1[f1i] == TILDE_TOKEN)
		{
			if(f1[f1i] != f2[f2i]) return false;
			if(f1[f1i] == METHOD_TOKEN){
				f1i++; f2i++;
				if(f1[f1i] != f2[f2i]) return false;
			}
			f1i++; f2i++;
			if(f1[f1i] != f2[f2i]) return false;
			f1i++; f2i++;
			if(f1[f1i] == TILDE_TOKEN){
				SoushokuTobasi(f1, f1i);
				SoushokuTobasi(f2, f2i);
			}else{
				if(isPublicOrAt((TokenKind)f1[f1i])) f1i++;
				if(isPublicOrAt((TokenKind)f2[f2i])) f2i++;
			}
		}
		if(f1[f1i] == AND_TOKEN || f1[f1i] == OR_TOKEN){
			if(f1[f1i] != f2[f2i]) return false;
			f1i++; f2i++;
		}
		if(f1[f1i] != f2[f2i]) return false;
	}
	return true;
}

static void kakeruRemove(std::basic_string<intptr_t>& type)
{
	auto it = type.begin();
	if (IsSoushokuToken((TokenKind)*it)) it++;
	while (*it == REF_TOKEN || *it == LIST_TOKEN){
		it++;
		if (*it == KAKERU_TOKEN){
			std::basic_string<intptr_t> tmp;
			it = type.begin();
			if (IsSoushokuToken((TokenKind)*it)) tmp += *it++;
			while (*it == REF_TOKEN || *it == LIST_TOKEN){
				tmp += *it++;
				if (*it == KAKERU_TOKEN){
					it++;
				}
				else if (*it == WARU_TOKEN){
					tmp += *it++;
				}
			}
			while (it != type.end()) tmp += *it++;
			type.swap(tmp);
			return;
		}
		else if (*it == WARU_TOKEN){
			it++;
		}
	}
}

static int32_t TokenToTypeId(const intptr_t *const iap, intptr_t &i)
{
	if(iap == nullptr) return UNKNOWN_TYPEID;
	if(IsSoushokuToken((TokenKind)iap[i])) i++;
	switch(iap[i++]){
	case BYTE_TOKEN:
		return BYTE_TYPEID;
	case SHORT_TOKEN:
		return SHORT_TYPEID;
	case INT_TOKEN:
		return INT_TYPEID;
	case LONG_TOKEN:
		return LONG_TYPEID;
	case UBYTE_TOKEN:
		return UBYTE_TYPEID;
	case USHORT_TOKEN:
		return USHORT_TYPEID;
	case UINT_TOKEN:
		return UINT_TYPEID;
	case ULONG_TOKEN:
		return ULONG_TYPEID;
	case INDEX_TOKEN:
		return ADDRESS_TYPEID;
	case FLOAT_TOKEN:
		return FLOAT_TYPEID;
	case DOUBLE_TOKEN:
		return DOUBLE_TYPEID;
	case CHAR_TOKEN:
		return CHAR_TYPEID;
	case BOOL_TOKEN:
		return BOOL_TYPEID;
	case VOID_TOKEN:
		return VOID_TYPEID;
	case REF_TOKEN:
		if(iap[i] == NULL_TOKEN){
			i++;
			return DYNREF_TYPEID;
		}
		return REF_TYPEID;
	case LIST_TOKEN:
		if(iap[i] == NULL_TOKEN){
			i++;
			return DYNLIST_TYPEID;
		}
		return LIST_TYPEID;
	case FUNC_TOKEN:
		return FUNC_TYPEID;
	case METHOD_TOKEN:
		return METHOD_TYPEID;
	case TILDE_TOKEN:
		return DELEGATE_TYPEID;
	case THREAD_TOKEN:
		return ~(int32_t)iap[i++];
	case AND_TOKEN:
	case OR_TOKEN:
		return (int32_t)iap[i++];
	case SIGNATURE_TOKEN:
		return SIGNATURE_TYPEID;
	}
	return UNKNOWN_TYPEID;
}

static std::WSTR TokentToStr(TokenKind tkn)
{
	switch(tkn){
	case POINT_TOKEN: return L(".");
	case COLOCOLO_TOKEN: return L("::");
	case DIA_TOKEN: return L("<>");
	case COLOYAJIRUSHI_TOKEN: return L(":<-");
	case SHOUKAKKOOPEN_TOKEN: return L("(");
	case SHOUKAKKOCLOSE_TOKEN: return L(")");
	case CHUUKAKKOOPEN_TOKEN: return L("{");
	case CHUUKAKKOCLOSE_TOKEN: return L("}");
	case DAIKAKKOOPEN_TOKEN: return L("[");
	case DAIKAKKOCLOSE_TOKEN: return L("]");
	case KAKKOCOLOOPEN_TOKEN: return L("(:");
	case KAKKOCOLOCLOSE_TOKEN: return L(":)");
	case SQUOT_TOKEN: return L("'");
	case DQUOT_TOKEN: return L("\"");
	case BQUOT_TOKEN: return L("`");
	case BACKSLA_TOKEN: return L("\\");
	case TILDE_TOKEN: return L("~");
	case ATMARK_TOKEN: return L("@");
	case COLON_TOKEN: return L(":");
	case SEMICOLON_TOKEN: return L(";");
	case SOTOCOMMA_TOKEN: return L("<,");
	case GYAKUDAINYUU_TOKEN: return L("=>");
	case SHARP_TOKEN: return L("#");
	case EXCLAMATION_TOKEN: return L("!");
	case PLSPLS_TOKEN: return L("++");
	case MNSMNS_TOKEN: return L("--");
	case TOGGLE_TOKEN: return L("!!");
	case QUOTDOUBLE_TOKEN: return L("''");
	case DOLLAR_TOKEN: return L("$");
	case STARSTAR_TOKEN: return L("**");
	case KAKERU_TOKEN: return L("*");
	case WARU_TOKEN: return L("/");
	case AMARI_TOKEN: return L("%");
	case PULUS_TOKEN: return L("+");
	case MINUS_TOKEN: return L("-");
	case LSHIFT_TOKEN: return L("<<");
	case RSHIFT_TOKEN: return L(">>");
	case SHOU_TOKEN: return L("<");
	case SHOUOREQUAL_TOKEN: return L("<=");
	case DAI_TOKEN: return L(">");
	case DAIOREQUAL_TOKEN: return L(">=");
	case EQUAL_TOKEN: return L("=");
	case NOTEQUAL_TOKEN: return L("!=");
	case AND_TOKEN: return L("&");
	case XOR_TOKEN: return L("^");
	case OR_TOKEN: return L("|");
	case ANDAND_TOKEN: return L("&&");
	case OROR_TOKEN: return L("||");
	case QUESTION_TOKEN: return L("?");
	case DAINYUU_TOKEN: return L("=");
	case PULUSDAINYUU_TOKEN: return L("+=");
	case MINUSDAINYUU_TOKEN: return L("-=");
	case KAKERUDAINYUU_TOKEN: return L("*=");
	case WARUDAINYUU_TOKEN: return L("/=");
	case AMARIDAINYUU_TOKEN: return L("%=");
	case ANDDAINYUU_TOKEN: return L("&=");
	case XORDAINYUU_TOKEN: return L("^=");
	case ORDAINYUU_TOKEN: return L("|=");
	case LSHIFTDAINYUU_TOKEN: return L("<<=");
	case RSHIFTDAINYUU_TOKEN: return L(">>=");
	case STARSTARDAINYUU_TOKEN: return L("**=");
	case TENDAINYUU_TOKEN: return L(".=");
	case TENTEN_TOKEN: return L("..");
	case COMMA_TOKEN: return L(",");
	case BOOL_TOKEN: return L("bool");
	case BRANCH_TOKEN: return L("branch");
	case BREAK_TOKEN: return L("break");
	case BYTE_TOKEN: return L("byte");
	case CASE_TOKEN: return L("case");
	case CAST_TOKEN: return L("cast");
	case CHAR_TOKEN: return L("char");
	case COMM_TOKEN: return L("comm");
	case COND_TOKEN: return L("cond");
	case CONST_TOKEN: return L("const");
	case CONSTEVAL_TOKEN: return L("consteval");
	case CONTINUE_TOKEN: return L("continue");
	case CORE_TOKEN: return L("core");
	case DEFAULT_TOKEN: return L("default");
	case DELETE_TOKEN: return L("delete");
	case DIFF_TOKEN: return L("diff");
	case DO_TOKEN: return L("do");
	case DOUBLE_TOKEN: return L("double");
	case ELSE_TOKEN: return L("else");
	case FALSE_TOKEN: return L("false");
	case FLOAT_TOKEN: return L("float");
	case FUNC_TOKEN: return L("func");
	case IDNAME_TOKEN: return L("idname");
	case IF_TOKEN: return L("if");
	case INDEX_TOKEN: return L("index");
	case INT_TOKEN: return L("int");
	case LEN_TOKEN: return L("len");
	case LIB_TOKEN: return L("lib");
	case LIST_TOKEN: return L("list");
	case LOCK_TOKEN: return L("lock");
	case LONG_TOKEN: return L("long");
	case LOOP_TOKEN: return L("loop");
	case METHOD_TOKEN: return L("method");
	case NEW_TOKEN: return L("new");
	case PLUGIN_TOKEN: return L("plugin");
	case PUBLIC_TOKEN: return L("public");
	case REF_TOKEN: return L("ref");
	case RET_TOKEN: return L("ret");
	case SELF_TOKEN: return L("self");
	case SHORT_TOKEN: return L("short");
	case SIGNATURE_TOKEN: return L("signatutre");
	case SWITCH_TOKEN: return L("switch");
	case THREAD_TOKEN: return L("thred");
	case TRUE_TOKEN: return L("true");
	case TYPE_TOKEN: return L("type");
	case TYPEID_TOKEN: return L("typeid");
	case TYPESIZE_TOKEN: return L("typesize");
	case UBYTE_TOKEN: return L("ubyte");
	case UINT_TOKEN: return L("uint");
	case ULONG_TOKEN: return L("ulong");
	case USHORT_TOKEN: return L("ushort");
	case VOID_TOKEN: return L("void");
	case WAIT_TOKEN: return L("wait");
	case WHILE_TOKEN: return L("while");
	}
	return L("");
}
