
void socclose(SOCKET &soc)
{
	if(soc != INVALID_SOCKET){
		shutdown(soc, SD_BOTH);
		closesocket(soc);
		soc = INVALID_SOCKET;
	}
}
bool socconnect(
	SOCKET &soc, const char *host, const char *port,
	unsigned int timeout = 30, bool nodelay = false)
{
	socclose(soc);
	ADDRINFO Hints, *AddrInfo, *AI;
	memset(&Hints, 0, sizeof(Hints));
	Hints.ai_family = PF_UNSPEC;
	Hints.ai_socktype = SOCK_STREAM;
	if(getaddrinfo(host, port, &Hints, &AddrInfo)) return false;
	SOCKET s = INVALID_SOCKET;
	for(AI = AddrInfo; AI != NULL; AI = AI->ai_next){
		s = socket(AI->ai_family, AI->ai_socktype, AI->ai_protocol);
		if(s == INVALID_SOCKET) continue;
		if(connect(s, AI->ai_addr, (int)AI->ai_addrlen) != SOCKET_ERROR) break;
		closesocket(s);
		s = INVALID_SOCKET;
	}
	freeaddrinfo(AddrInfo);
	if(AI == NULL) return false;
	if(timeout > 0){
		timeout *= 1000;
		setsockopt(
			s, SOL_SOCKET, SO_SNDTIMEO, (char*)&timeout, sizeof(timeout));
		setsockopt(
			s, SOL_SOCKET, SO_RCVTIMEO, (char*)&timeout, sizeof(timeout));
	}
	if(nodelay){
		BOOL b = TRUE;
		setsockopt(s, IPPROTO_TCP, TCP_NODELAY, (char*)&b, sizeof(b));
	}
	soc = s;
	return true;
}
bool soclisten(SOCKET &soc, const char *port, int backlog, bool ipv4)
{
	socclose(soc);
	ADDRINFO Hints, *AddrInfo, *AI;
	memset(&Hints, 0, sizeof(Hints));
	Hints.ai_family = ipv4 ? AF_INET : AF_UNSPEC;
	Hints.ai_socktype = SOCK_STREAM;
	Hints.ai_flags = AI_PASSIVE;
	if(getaddrinfo(NULL, port, &Hints, &AddrInfo)) return false;
	SOCKET s = INVALID_SOCKET;
	for(AI = AddrInfo; AI != NULL; AI = AI->ai_next){
		s = socket(AI->ai_family, AI->ai_socktype, AI->ai_protocol);
		if(s == INVALID_SOCKET) continue;
		if(
			bind(s, AI->ai_addr, (int)AI->ai_addrlen) != SOCKET_ERROR
			&& listen(s , backlog) != SOCKET_ERROR)
		{
			break;
		}
		closesocket(s);
		s = INVALID_SOCKET;
	}
	freeaddrinfo(AddrInfo);
	soc = s;
	return AI != NULL;
}
intptr_t socsend(SOCKET &soc, const char *buf, int len)
{
	intptr_t l = 0;
	if(len <= 0 || soc == INVALID_SOCKET) return l;
	l = send(soc, buf, len, 0);
	if(l < 0){
		socclose(soc);
		l = 0;
	}
	return l;
}
intptr_t socrecv(SOCKET &soc, char *buf, intptr_t len)
{
	intptr_t l = 0, tmp = 1;
	if(soc == INVALID_SOCKET) return l;
	while(len - l > 0 && (tmp = recv(soc, buf+l, (int)(len - l), 0)) > 0){
		l += tmp;
	}
	if(tmp <= 0) socclose(soc);
	return l;
}
