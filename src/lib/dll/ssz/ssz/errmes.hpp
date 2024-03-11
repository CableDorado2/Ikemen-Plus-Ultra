struct ErrMes
{
	std::WSTR mes;
	bool appendable;
	MEMBER ErrMes()
	{
		appendable = true;
		Clear();
	}
	MEMBER void Clear()
	{
		if(!appendable) return;
		mes.clear();
	}
	MEMBER void Add(
		const std::WSTR& filename,
		const intptr_t gyo, const std::WSTR& err)
	{
		if(!appendable) return;
		mes += filename;
		mes += L('(');
		mes += IntToString((int64_t)gyo);
		mes += L(") : ");
		mes += err;
		mes += L('\n');
	}
};
