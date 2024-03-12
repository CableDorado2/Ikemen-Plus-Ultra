struct SourceState
{
	intptr_t t, i, g;
	TokenKind last, next;
};

template<typename GC> struct Source
{
	SSZStatic<GC>* ss;
	WCHR const* source;
	std::WSTR filename, src;
	SourceState sst;
	bool incondcomment;
	MEMBER Source(SSZStatic<GC>* sstat)
	{
		ss = sstat;
	}
	MEMBER void Clear()
	{
		source = nullptr;
		filename.clear();
		src.clear();
		sst.t = sst.i = 0;
		sst.g = 1;
		sst.last = sst.next = NULL_TOKEN;
		incondcomment = false;
	}
	MEMBER bool Load(const std::WSTR& fn)
	{
		FILE* pFile = nullptr;
		WCHR* pwc;
		char ch = '\0';
		WCHR wch = L('\0');
		std::string tmp;
		Clear();
		pwc = _wfullpath(nullptr, fn.c_str(), 0);
		if(pwc == nullptr){
			filename = fn;
		}else{
			filename = pwc;
			free(pwc);
		}
#ifdef _WIN32
		for(intptr_t i = 0; i < IDX(filename.size()); i++){
			filename[i] = tolower(filename[i]);
		}
#endif
		if(_wfopen_s(&pFile, fn.c_str(), L("rb")) != 0){
			ss->emes.Add(filename, -1, L("Failed to read file."));
			return false;
		}
		if(fread(&ch, sizeof(char), 1, pFile) == 1) tmp += ch;
		if(ch == '\xEF'){
			if(fread(&ch, sizeof(char), 1, pFile) == 1) tmp += ch;
			if(ch == '\xBB'){
				if(fread(&ch, sizeof(char), 1, pFile) == 1) tmp += ch;
				if(ch == '\xBF'){
					tmp.clear();
				}
			}
		}
		while(fread(&ch, sizeof(char), 1, pFile) == 1) tmp += ch;
#ifdef _WIN32
		src.resize(
			MultiByteToWideChar(CP_UTF8, 0, tmp.data(),
			tmp.size(), nullptr, 0));
		MultiByteToWideChar(
			CP_UTF8, 0, tmp.data(), tmp.size(), (WCHR*)src.data(), src.size());
#else
		src = PluginUtil::aToW(tmp);
#endif
		source = src.c_str();
		fclose(pFile);
		return true;
	}
	MEMBER bool setString(const std::WSTR& code, const std::WSTR& dir)
	{
		Clear();
		WCHR* pwc =
			_wfullpath(nullptr, dir.size() > 0 ? dir.c_str() : L("."), 0);
		if(pwc == nullptr){
			filename = dir;
			filename += L("/<string>");
			ss->emes.Add(filename, -1, L("Failed to convert to absolute path."));
			return false;
		}
		filename = pwc;
		free(pwc);
		filename += L("/<string>");
		src = code;
		source = src.c_str();
		return true;
	}
	MEMBER bool IsTSChar(const WCHR wc)
	{
		return
			(L('0') <= wc && wc <= L('9')) || (L('A') <= wc && wc <= L('Z'))
			|| (L('a') <= wc && wc <= L('z')) || wc == L('_') || wc >= 0xC0;
	}
	MEMBER bool GetTString()
	{
		sst.t = sst.i;
		bool ret = false;
		if (sst.i < IDX(src.size())) {
			for (; IsTSChar(source[sst.i]); sst.i++) ret = true;
		}
		return ret;
	}
	MEMBER bool GetNumString()
	{
		sst.t = sst.i;
		bool ret = false;
		if (sst.i < IDX(src.size())) {
			for (; L('0') <= source[sst.i] &&
				source[sst.i] <= L('9'); sst.i++) {
				ret = true;
			}
		}
		return ret;
	}
	template<typename T> MEMBER bool SkipSpace(T& st)
	{
		for (;;) {
			if (!Space()) break;
			if (
				!incondcomment && sst.i + 3 < IDX(src.size())
				&& source[sst.i + 1] == L('?')
				&& source[sst.i + 2] == L('/') && source[sst.i + 3] == L('*'))
			{
				std::basic_string<intptr_t> cond;
				std::basic_string<intptr_t> type;
				sst.i += 4;
				incondcomment = true;
				type = CONST_TOKEN;
				type += BOOL_TOKEN;
				while (incondcomment && sst.i < IDX(src.size())) {
					if (source[sst.i] != L('?')) {
						st.ConstShiki(
							*this, NULL_TOKEN, GetToken(st), cond,
							COLON_TOKEN, false, false);
						if (sst.i - sst.t != 1 || source[sst.t] != L(':')) {
							addErrMes(L("There is not ':'"));
							return false;
						}
						if (!st.ConstCaster(cond, type)) {
							addErrMes(L("Type error."));
							return false;
						}
						if (*(bool*)(cond.data() + type.size())) {
							incondcomment = false;
							break;
						}
					}
					for (sst.i++; sst.i < IDX(src.size()); sst.i++) {
						if (source[sst.i - 1] == L('*')
							&& source[sst.i] == L('/')) {
							sst.i++;
							incondcomment = false;
							break;
						}
						else if (source[sst.i - 1] == L('/')
							&& source[sst.i] == L('*')) {
							sst.i++;
							break;
						}
						else if (source[sst.i - 1] == L('\n')) sst.g++;
					}
				}
			}
			else {
				break;
			}
		}
		return true;
	}
	MEMBER bool Space()
	{
		for (;;) {
			for (; ; sst.i++) {
				if (source[sst.i] == L('\n')) {
					sst.g++;
				}
				else if (
					source[sst.i] != L(' ')
					&& source[sst.i] != L('\t') && source[sst.i] != L('\r'))
				{
					break;
				}
			}
			if (source[sst.i] != L('/')) {
				return false;
			}
			if (source[sst.i + 1] == L('/')) {
				for (sst.i += 2; sst.i < IDX(src.size()); sst.i++) {
					if (source[sst.i] == L('\n')) {
						sst.g++;
						sst.i++;
						break;
					}
				}
			}
			else if (source[sst.i + 1] == L('*')) {
				if ((sst.i += 2) >= IDX(src.size())) return false;
				for (sst.i++; sst.i < IDX(src.size()); sst.i++) {
					if (source[sst.i - 1] == L('*')
						&& source[sst.i] == L('/')) {
						sst.i++;
						break;
					}
					else if (source[sst.i - 1] == L('\n')) sst.g++;
				}
			}
			else {
				break;
			}
		}
		return true;
	}
	MEMBER void Find(const char16_t md)
	{
		sst.t = sst.i;
		for (; sst.i < IDX(src.size()); sst.i++) {
			if (source[sst.i] == L('\n')) {
				sst.g++;
			}
			else if (source[sst.i] == md) {
				break;
			}
		}
	}
	MEMBER char16_t GetChar()
	{
		if (sst.i >= IDX(src.size())) return L('\0');
		if (source[sst.i] == L('\n')) {
			sst.g++;
		}
		return source[sst.i++];
	}
	template<typename T> MEMBER TokenKind GetToken(T& st)
	{
		if(sst.next != NULL_TOKEN){
			sst.last = sst.next;
			sst.next = NULL_TOKEN;
			return sst.last;
		}
		if(st.stat->tokubetuerr || !SkipSpace(st)){
			st.stat->tokubetuerr = true;
			return sst.last = ERROR_TOKEN;
		}
		return sst.last = Token();
	}
	MEMBER TokenKind GetTokenYomitobashi()
	{
		if(sst.next != NULL_TOKEN){
			sst.last = sst.next;
			sst.next = NULL_TOKEN;
			return sst.last;
		}
		Space();
		return sst.last = Token();
	}
	MEMBER TokenKind Token()
	{
		sst.t = sst.i;
		if (sst.i >= IDX(src.size())) return NULL_TOKEN;
		switch (source[sst.i]) {
		case L('+'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return PULUSDAINYUU_TOKEN;
			}
			else if (source[sst.i] == L('+')) {
				sst.i++;
				return PLSPLS_TOKEN;
			}
			return PULUS_TOKEN;
		case L('-'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return MINUSDAINYUU_TOKEN;
			}
			else if (source[sst.i] == L('-')) {
				sst.i++;
				return MNSMNS_TOKEN;
			}
			return MINUS_TOKEN;
		case L('*'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return KAKERUDAINYUU_TOKEN;
			}
			else if (source[sst.i] == L('*')) {
				if (source[++sst.i] == L('=')) {
					sst.i++;
					return STARSTARDAINYUU_TOKEN;
				}
				return STARSTAR_TOKEN;
			}
			return KAKERU_TOKEN;
		case L('/'):
			if (source[++sst.i] == L('=')) {
				sst.i++;
				return WARUDAINYUU_TOKEN;
			}
			return WARU_TOKEN;
		case L('%'):
			if (source[++sst.i] == L('=')) {
				sst.i++;
				return AMARIDAINYUU_TOKEN;
			}
			return AMARI_TOKEN;
		case L('&'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return ANDDAINYUU_TOKEN;
			}
			else if (source[sst.i] == L('&')) {
				sst.i++;
				return ANDAND_TOKEN;
			}
			return AND_TOKEN;
		case L('^'):
			if (source[++sst.i] == L('=')) {
				sst.i++;
				return XORDAINYUU_TOKEN;
			}
			return XOR_TOKEN;
		case L('|'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return ORDAINYUU_TOKEN;
			}
			else if (source[sst.i] == L('|')) {
				sst.i++;
				return OROR_TOKEN;
			}
			return OR_TOKEN;
		case L('<'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return SHOUOREQUAL_TOKEN;
			}
			else if (source[sst.i] == L('<')) {
				if (source[++sst.i] == L('=')) {
					sst.i++;
					return LSHIFTDAINYUU_TOKEN;
				}
				return LSHIFT_TOKEN;
			}
			else if (source[sst.i] == L('>')) {
				sst.i++;
				return DIA_TOKEN;
			}
			else if (source[sst.i] == L(',')) {
				sst.i++;
				return SOTOCOMMA_TOKEN;
			}
			return SHOU_TOKEN;
		case L('>'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return DAIOREQUAL_TOKEN;
			}
			else if (source[sst.i] == L('>')) {
				if (source[++sst.i] == L('=')) {
					sst.i++;
					return RSHIFTDAINYUU_TOKEN;
				}
				return RSHIFT_TOKEN;
			}
			return DAI_TOKEN;
		case L('!'):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return NOTEQUAL_TOKEN;
			}
			else if (source[sst.i] == L('!')) {
				sst.i++;
				return TOGGLE_TOKEN;
			}
			return EXCLAMATION_TOKEN;
		case L('='):
			sst.i++;
			if (source[sst.i] == L('=')) {
				sst.i++;
				return EQUAL_TOKEN;
			}
			else if (source[sst.i] == L('>')) {
				sst.i++;
				return GYAKUDAINYUU_TOKEN;
			}
			return DAINYUU_TOKEN;
		case L('?'):
			sst.i++;
			return QUESTION_TOKEN;
		case L('('):
			if (source[++sst.i] == L(':')) {
				sst.i++;
				return KAKKOCOLOOPEN_TOKEN;
			}
			return SHOUKAKKOOPEN_TOKEN;
		case L(')'):
			sst.i++;
			return SHOUKAKKOCLOSE_TOKEN;
		case L('{'):
			sst.i++;
			return CHUUKAKKOOPEN_TOKEN;
		case L('}'):
			sst.i++;
			return CHUUKAKKOCLOSE_TOKEN;
		case L('['):
			sst.i++;
			return DAIKAKKOOPEN_TOKEN;
		case L(']'):
			sst.i++;
			return DAIKAKKOCLOSE_TOKEN;
		case L('#'):
			sst.i++;
			return SHARP_TOKEN;
		case L('\\'):
			sst.i++;
			return BACKSLA_TOKEN;
		case L('\''):
			if (source[++sst.i] == L'\'') {
				sst.i++;
				return QUOTDOUBLE_TOKEN;
			}
			return SQUOT_TOKEN;
		case L('"'):
			sst.i++;
			return DQUOT_TOKEN;
		case L(','):
			sst.i++;
			return COMMA_TOKEN;
		case L(';'):
			sst.i++;
			return SEMICOLON_TOKEN;
		case L('.'):
			sst.i++;
			if (source[sst.i] == L('.')) {
				sst.i++;
				return TENTEN_TOKEN;
			}
			else if (source[sst.i] == L('=')) {
				sst.i++;
				return TENDAINYUU_TOKEN;
			}
			return POINT_TOKEN;
		case L(':'):
			sst.i++;
			if (source[sst.i] == L(':')) {
				sst.i++;
				return COLOCOLO_TOKEN;
			}
			else if (source[sst.i] == L(')')) {
				sst.i++;
				return KAKKOCOLOCLOSE_TOKEN;
			}
			else if (
				source[sst.i] == L('<') && source[sst.i + 1] == L('-'))
			{
				sst.i += 2;
				return COLOYAJIRUSHI_TOKEN;
			}
			return COLON_TOKEN;
		case L('~'):
			sst.i++;
			return TILDE_TOKEN;
		case L('`'):
			sst.i++;
			return BQUOT_TOKEN;
		case L('$'):
			sst.i++;
			return DOLLAR_TOKEN;
		case L('@'):
			sst.i++;
			return ATMARK_TOKEN;
		default:
			if (GetTString()) {
				return MojiretsuToken(source + sst.t, sst.i - sst.t);
			}
			break;
		}
		return NULL_TOKEN;
	}
	MEMBER TokenKind MojiretsuToken(const WCHR* const tstr, const intptr_t tlen)
	{
		switch(tstr[0]){
///////////////////////////////////////////////////////////////////////////////
		case L('b'): switch(tstr[1]){
			case L('o'): switch(tstr[2]){
				case L('o'): switch(tstr[3]){
					case L('l'): if(tlen > 4){
						}else{
							return BOOL_TOKEN;
						}break;
					}break;
				}break;
			case L('r'): switch(tstr[2]){
				case L('a'): switch(tstr[3]){
					case L('n'): switch(tstr[4]){
						case L('c'): switch(tstr[5]){
							case L('h'): if(tlen > 6){
								}else{
									return BRANCH_TOKEN;
								}break;
							}break;
						}break;
					}break;
				case L('e'): switch(tstr[3]){
					case L('a'): switch(tstr[4]){
						case L('k'): if(tlen > 5){
							}else{
								return BREAK_TOKEN;
							}break;
						}break;
					}break;
				}break;
			case L('y'): switch(tstr[2]){
				case L('t'): switch(tstr[3]){
					case L('e'): if(tlen > 4){
						}else{
							return BYTE_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('c'): switch(tstr[1]){
			case L('a'): switch(tstr[2]){
				case L('s'): switch(tstr[3]){
					case L('e'): if(tlen > 4){
						}else{
							return CASE_TOKEN;
						}break;
					case L('t'): if(tlen > 4){
						}else{
							return CAST_TOKEN;
						}break;
					}break;
				}break;
			case L('h'): switch(tstr[2]){
				case L('a'): switch(tstr[3]){
					case L('r'): if(tlen > 4){
						}else{
							return CHAR_TOKEN;
						}break;
					}break;
				}break;
			case L('o'): switch(tstr[2]){
				case L('m'): switch(tstr[3]){
					case L('m'): if(tlen > 4){
						}else{
							return COMM_TOKEN;
						}break;
					}break;
				case L('n'): switch(tstr[3]){
					case L('d'): if(tlen > 4){
						}else{
							return COND_TOKEN;
						}break;
					case L('s'): switch(tstr[4]){
						case L('t'): if(tlen > 5){
							}else{
								return CONST_TOKEN;
							}break;
						}break;
					case L('t'): switch(tstr[4]){
						case L('i'): switch(tstr[5]){
							case L('n'): switch(tstr[6]){
								case L('u'): switch(tstr[7]){
									case L('e'): if(tlen > 8){
										}else{
											return CONTINUE_TOKEN;
										}break;
									}break;
								}break;
							}break;
						}break;
					}break;
				case L('r'): switch(tstr[3]){
					case L('e'): if(tlen > 4){
						}else{
							return CORE_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('d'): switch(tstr[1]){
			case L('e'): switch(tstr[2]){
				case L('f'): switch(tstr[3]){
					case L('a'): switch(tstr[4]){
						case L('u'): switch(tstr[5]){
							case L('l'):  switch(tstr[6]){
								case L('t'): if(tlen > 7){
									}else{
										return DEFAULT_TOKEN;
									}break;
								}break;
							}break;
						}break;
					}break;
				case L('l'): switch(tstr[3]){
					case L('e'): switch(tstr[4]){
						case L('t'): switch(tstr[5]){
							case L('e'): if(tlen > 6){
								}else{
									return DELETE_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			case L('i'): switch(tstr[2]){
				case L('f'): switch(tstr[3]){
					case L('f'): if(tlen > 4){
						}else{
							return DIFF_TOKEN;
						}break;
					}break;
				}break;
			case L('o'): if(tlen > 2) switch(tstr[2]){
				case L('u'): switch(tstr[3]){
					case L('b'): switch(tstr[4]){
						case L('l'): switch(tstr[5]){
							case L('e'): if(tlen > 6){
								}else{
									return DOUBLE_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}else{
					return DO_TOKEN;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('e'): switch(tstr[1]){
			case L('l'): switch(tstr[2]){
				case L('s'): switch(tstr[3]){
					case L('e'): if(tlen > 4){
						}else{
							return ELSE_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('f'): switch(tstr[1]){
			case L('a'): switch(tstr[2]){
				case L('l'): switch(tstr[3]){
					case L('s'): switch(tstr[4]){
						case L('e'): if(tlen > 5){
							}else{
								return FALSE_TOKEN;
							}break;
						}break;
					}break;
				}break;
			case L('l'): switch(tstr[2]){
				case L('o'): switch(tstr[3]){
					case L('a'): switch(tstr[4]){
						case L('t'): if(tlen > 5){
							}else{
								return FLOAT_TOKEN;
							}break;
						}break;
					}break;
				}break;
			case L('u'): switch(tstr[2]){
				case L('n'): switch(tstr[3]){
					case L('c'): if(tlen > 4){
						}else{
							return FUNC_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('i'): switch(tstr[1]){
			case L('f'): if(tlen > 2){
				}else{
					return IF_TOKEN;
				}break;
			case L('n'): switch(tstr[2]){
				case L('d'): switch(tstr[3]){
					case L('e'): switch(tstr[4]){
						case L('x'): if(tlen > 5){
							}else{
								return INDEX_TOKEN;
							}break;
						}break;
					}break;
				case L('t'): if(tlen > 3){
					}else{
						return INT_TOKEN;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('l'): switch(tstr[1]){
			case L('i'): switch(tstr[2]){
				case L('b'): if(tlen > 3){
					}else{
						return LIB_TOKEN;
					}break;
				case L('s'): switch(tstr[3]){
					case L('t'): if(tlen > 4){
						}else{
							return LIST_TOKEN;
						}break;
					}break;
				}break;
			case L('o'): switch(tstr[2]){
				case L('c'): switch(tstr[3]){
					case L('k'): if(tlen > 4){
						}else{
							return LOCK_TOKEN;
						}break;
					}break;
				case L('n'): switch(tstr[3]){
					case L('g'): if(tlen > 4){
						}else{
							return LONG_TOKEN;
						}break;
					}break;
				case L('o'): switch(tstr[3]){
					case L('p'): if(tlen > 4){
						}else{
							return LOOP_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('m'): switch(tstr[1]){
			case L('e'): switch(tstr[2]){
				case L('t'): switch(tstr[3]){
					case L('h'): switch(tstr[4]){
						case L('o'): switch(tstr[5]){
							case L('d'): if(tlen > 6){
								}else{
									return METHOD_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('n'): switch(tstr[1]){
			case L('e'): switch(tstr[2]){
				case L('w'): if(tlen > 3){
					}else{
						return NEW_TOKEN;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('p'): switch(tstr[1]){
			case L('l'): switch(tstr[2]){
				case L('u'): switch(tstr[3]){
					case L('g'): switch(tstr[4]){
						case L('i'): switch(tstr[5]){
							case L('n'): if(tlen > 6){
								}else{
									return PLUGIN_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			case L('u'): switch(tstr[2]){
				case L('b'): switch(tstr[3]){
					case L('l'): switch(tstr[4]){
						case L('i'): switch(tstr[5]){
							case L('c'): if(tlen > 6){
								}else{
									return PUBLIC_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('r'): switch(tstr[1]){
			case L('e'): switch(tstr[2]){
				case L('f'): if(tlen > 3){
					}else{
						return REF_TOKEN;
					}break;
				case L('t'): if(tlen > 3){
					}else{
						return RET_TOKEN;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('s'): switch(tstr[1]){
			case L('e'): switch(tstr[2]){
				case L('l'): switch(tstr[3]){
					case L('f'): if(tlen > 4){
						}else{
							return SELF_TOKEN;
						}break;
					}break;
				}break;
			case L('h'): switch(tstr[2]){
				case L('o'): switch(tstr[3]){
					case L('r'): switch(tstr[4]){
						case L('t'): if(tlen > 5){
							}else{
								return SHORT_TOKEN;
							}break;
						}break;
					}break;
				}break;
			case L('i'): switch(tstr[2]){
				case L('g'): switch(tstr[3]){
					case L('n'): switch(tstr[4]){
						case L('a'): switch(tstr[5]){
							case L('t'): switch(tstr[6]){
								case L('u'): switch(tstr[7]){
									case L('r'): switch(tstr[8]){
										case L('e'): if(tlen > 9){
											}else{
												return SIGNATURE_TOKEN;
											}break;
										}break;
									}break;
								}break;
							}break;
						}break;
					}break;
				}break;
			case L('w'): switch(tstr[2]){
				case L('i'): switch(tstr[3]){
					case L('t'): switch(tstr[4]){
						case L('c'): switch(tstr[5]){
							case L('h'): if(tlen > 6){
								}else{
									return SWITCH_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('t'): switch(tstr[1]){
			case L('h'): switch(tstr[2]){
				case L('r'): switch(tstr[3]){
					case L('e'): switch(tstr[4]){
						case L('a'): switch(tstr[5]){
							case L('d'): if(tlen > 6){
								}else{
									return THREAD_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			case L('r'): switch(tstr[2]){
				case L('u'): switch(tstr[3]){
					case L('e'): if(tlen > 4){
						}else{
							return TRUE_TOKEN;
						}break;
					}break;
				}break;
			case L('y'): switch(tstr[2]){
				case L('p'): switch(tstr[3]){
					case L('e'): if(tlen > 4) switch(tstr[4]){
						case L('i'): switch(tstr[5]){
							case L('d'): if(tlen > 6){
								}else{
									return TYPEID_TOKEN;
								}break;
							}break;
						case L('s'): switch(tstr[5]){
							case L('i'): switch(tstr[6]){
								case L('z'): switch(tstr[7]){
									case L('e'): if(tlen > 8){
										}else{
											return TYPESIZE_TOKEN;
										}break;
									}break;
								}break;
							}break;
						}else{
							return TYPE_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('u'): switch(tstr[1]){
			case L('b'): switch(tstr[2]){
				case L('y'): switch(tstr[3]){
					case L('t'): switch(tstr[4]){
						case L('e'): if(tlen > 5){
							}else{
								return UBYTE_TOKEN;
							}break;
						}break;
					}break;
				}break;
			case L('i'): switch(tstr[2]){
				case L('n'): switch(tstr[3]){
					case L('t'): if(tlen > 4){
						}else{
							return UINT_TOKEN;
						}break;
					}break;
				}break;
			case L('l'): switch(tstr[2]){
				case L('o'): switch(tstr[3]){
					case L('n'): switch(tstr[4]){
						case L('g'): if(tlen > 5){
							}else{
								return ULONG_TOKEN;
							}break;
						}break;
					}break;
				}break;
			case L('s'): switch(tstr[2]){
				case L('h'): switch(tstr[3]){
					case L('o'): switch(tstr[4]){
						case L('r'): switch(tstr[5]){
							case L('t'): if(tlen > 6){
								}else{
									return USHORT_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('v'): switch(tstr[1]){
			case L('o'): switch(tstr[2]){
				case L('i'): switch(tstr[3]){
					case L('d'): if(tlen > 4){
						}else{
							return VOID_TOKEN;
						}break;
					}break;
				}break;
			}break;
///////////////////////////////////////////////////////////////////////////////
		case L('w'): switch(tstr[1]){
			case L('h'): switch(tstr[2]){
				case L('i'): switch(tstr[3]){
					case L('l'): switch(tstr[4]){
						case L('e'): if(tlen > 5){
							}else{
								return WHILE_TOKEN;
							}break;
						}break;
					}break;
				}break;
			}break;
		}
		return OTHERKIND_TOKEN;
	}
	MEMBER TokenKind specialTagToken(const WCHR* const tstr, const intptr_t tlen)
	{
		switch(tstr[0]){
		case L('c'): switch(tstr[1]){
			case L('o'): switch(tstr[2]){
				case L('n'): switch(tstr[3]){
					case L('s'): switch(tstr[4]){
						case L('t'): switch(tstr[5]){
							case L('e'): switch(tstr[6]){
								case L('v'): switch(tstr[7]){
									case L('a'): switch(tstr[8]){
										case L('l'): if(tlen > 9){
											}else{
												return CONSTEVAL_TOKEN;
											}break;
										}break;
									}break;
								}break;
							}break;
						}break;
					}break;
				}break;
			}break;
		case L('i'): switch(tstr[1]){
			case L('d'): switch(tstr[2]){
				case L('n'): switch(tstr[3]){
					case L('a'): switch(tstr[4]){
						case L('m'): switch(tstr[5]){
							case L('e'): if(tlen > 6){
								}else{
									return IDNAME_TOKEN;
								}break;
							}break;
						}break;
					}break;
				}break;
			}break;
		case L('w'): switch(tstr[1]){
			case L('a'): switch(tstr[2]){
				case L('i'): switch(tstr[3]){
					case L('t'): if(tlen > 4){
						}else{
							return WAIT_TOKEN;
						}break;
					}break;
				}break;
			}break;
		}
		return OTHERKIND_TOKEN;
	}
	MEMBER void addErrMes(const std::WSTR& mes)
	{
		ss->emes.Add(filename, sst.g, mes);
	}
	MEMBER void setNextLast()
	{
		sst.next = sst.last;
	}
	MEMBER void appendTStr(std::WSTR& str)
	{
		str.append(source + sst.t, sst.i - sst.t);
	}
	MEMBER intptr_t curIdx()
	{
		return sst.next != NULL_TOKEN ? sst.t : sst.i;
	}
};
