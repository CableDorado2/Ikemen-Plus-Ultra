
#ifdef _WIN32
#pragma comment(lib,"ws2_32.lib")
#include <winsock2.h>
#include <ws2tcpip.h>
#define WTOA(s) pu->refToAstr(CP_UTF8, s)
typedef int socklen_t;
#else
#include <netdb.h>
#include <netinet/tcp.h>
#define INVALID_SOCKET -1
#define SOCKET_ERROR -1
#define TRUE 1
#define SD_BOTH SHUT_RDWR
#define closesocket close
#define WTOA(s) pu->wToA(pu->refToWstr(s))
typedef int SOCKET;
typedef struct sockaddr SOCKADDR;
typedef struct addrinfo ADDRINFO;
#endif

#include "../../ssz/ssz/sszdef.h"

static void* (__stdcall *sszrefnewfunc)(intptr_t);
static void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"
#include "tcpsocket.hpp"

#ifdef _WIN32
WSAData g_wdata;

BOOL WINAPI DllMain(HINSTANCE hinstDLL,DWORD fdwReason,LPVOID lpvReserved)
{
	switch(fdwReason)
	{
	case DLL_PROCESS_ATTACH:
		WSAStartup(MAKEWORD(2,2), &g_wdata);
		break;
	case DLL_PROCESS_DETACH:
		WSACleanup();
		break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	}
	return TRUE;
}
#endif

TUserFunc(void, SocketClose, SOCKET *psoc)
{
	socclose(*psoc);
}

TUserFunc(
	bool, SocketConnect, bool nodelay, int32_t timeout,
	Reference port, Reference host, SOCKET *psoc)
{
	return
		socconnect(
			*psoc, WTOA(host).c_str(),
			WTOA(port).c_str(), timeout, nodelay);
}

TUserFunc(
	bool, SocketListen, bool ipv4, int32_t backlog,
	Reference port, SOCKET *psoc)
{
	return
		soclisten(
			*psoc, WTOA(port).c_str(), backlog, ipv4);
}

TUserFunc(SOCKET, SocketAccept, bool nodelay, int32_t timeout, SOCKET soc)
{
	if(soc == INVALID_SOCKET) return INVALID_SOCKET;
	fd_set readset;
	timeval to;
	SOCKADDR sa;
	socklen_t sasz = sizeof(sa);
	FD_ZERO(&readset);
	FD_SET(soc, &readset);
	to.tv_sec = timeout;
	to.tv_usec = 0;
	if(
		select((int)soc+1, &readset, NULL, NULL, &to) <= 0
		|| !FD_ISSET(soc, &readset))
	{
		return INVALID_SOCKET;
	}
	SOCKET s = accept(soc, &sa, &sasz);
	if(nodelay && s != INVALID_SOCKET){
		BOOL b = TRUE;
		setsockopt(s, IPPROTO_TCP, TCP_NODELAY, (char*)&b, sizeof(b));
	}
	return s;
}

TUserFunc(bool, SocketSend, intptr_t size, char *p, SOCKET *psoc)
{
	return socsend(*psoc, p, size) == size;
}

TUserFunc(intptr_t, SocketSendAry, intptr_t size, Reference ary, SOCKET *psoc)
{
	if(ary.len() == 0) return 0;
	return socsend(*psoc, (char*)ary.atpos(), ary.len()) / size;
}

TUserFunc(bool, SocketRecv, intptr_t size, char *p, SOCKET *psoc)
{
	return socrecv(*psoc, p, size) == size;
}

TUserFunc(intptr_t, SocketRecvAry, intptr_t size, Reference ary, SOCKET *psoc)
{
	if(ary.len() == 0) return 0;
	return socrecv(*psoc, (char*)ary.atpos(), ary.len()) / size;
}
