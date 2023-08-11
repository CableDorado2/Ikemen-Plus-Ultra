
#include <portaudio.h>
#ifdef _WIN32
#pragma comment(lib , "portaudio_x86.lib")
#endif

#include "../../ssz/ssz/sszdef.h"

void* (__stdcall *sszrefnewfunc)(intptr_t);
void (__stdcall *sszrefdeletefunc)(void*);

#include "../../ssz/ssz/typeid.h"
#include "../../ssz/ssz/arrayandref.hpp"
#include "../../ssz/ssz/pluginutil.hpp"

static const int g_srcFreq = 48000;
static const int g_bufferSamples = 2048;
static float g_zeroBuf[g_bufferSamples * 2] = { 0 };

struct Initializer
{
	MEMBER Initializer()
	{
		Pa_Initialize();
	}
	MEMBER ~Initializer()
	{
		Pa_Terminate();
	}
};
static Initializer initializer;

class Buffer
{
	float workBuf[2][g_bufferSamples * 2];
	float *curBuf, *nextBuf;
	double curOffset;
	int nextWorkBuf;
public:
	MEMBER Buffer() : nextBuf(g_zeroBuf), nextWorkBuf(0)
	{
		curOffset = 0;
		updateCurBuf();
	}
	MEMBER void updateCurBuf()
	{
		curBuf = nextBuf;
		nextBuf = g_zeroBuf;
	}
	MEMBER void writeTo(float* buffer, int size)
	{
		for (int i = 0; i < size; i++){
			*buffer++ = curBuf[(int)curOffset * 2];
			*buffer++ = curBuf[(int)curOffset * 2 + 1];
			curOffset++;
			if (curOffset >= g_bufferSamples){
				curOffset = 0;
				updateCurBuf();
			}
		}
	}
	MEMBER bool ready()
	{
		return nextBuf == g_zeroBuf;
	}
	MEMBER bool setNextBuffer(const float* buffer)
	{
		if (!ready()) return false;
		memcpy(workBuf[nextWorkBuf], buffer, sizeof(workBuf[nextWorkBuf]));
		nextBuf = workBuf[nextWorkBuf];
		nextWorkBuf = !nextWorkBuf;
		return true;
	}
};

static int streamCallback(
	const void*, void* output, unsigned long frameCount,
	const PaStreamCallbackTimeInfo* time, PaStreamCallbackFlags flg,
	void* userData)
{
	auto buff = (Buffer*)userData;
	buff->writeTo((float*)output, frameCount);
	return 0;
}

class Client
{
	PaStream* client;
public:
	Buffer src;
	MEMBER Client() : client(nullptr)
	{
		Pa_OpenDefaultStream(
			&client, 0, 2, paFloat32, g_srcFreq, g_bufferSamples,
			streamCallback, (void*)&src);
	}
	MEMBER ~Client()
	{
		if (client) Pa_CloseStream(client);
	}
	MEMBER PaStream* cl()
	{
		return client;
	}
};

TUserFunc(Client*, NewClient)
{
	return new Client;
}

TUserFunc(void, DeleteClient, Client* client)
{
	delete client;
}

TUserFunc(bool, ClientStart, Client* client)
{
	return client->cl() && Pa_StartStream(client->cl()) == paNoError;
}

TUserFunc(bool, ClientStop, Client* client)
{
	return client->cl() && Pa_StopStream(client->cl()) == paNoError;
}

TUserFunc(bool, ClientBufferReady, Client* client)
{
	return client->src.ready();
}

TUserFunc(bool, ClientSetBuffer, Reference src, Client* client)
{
	if (src.len() != sizeof(float) * g_bufferSamples * 2) return false;
	return client->src.setNextBuffer((const float*)src.atpos());
}
