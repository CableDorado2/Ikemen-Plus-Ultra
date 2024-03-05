
#include <windows.h>
#include <locale.h>
#include <process.h>
#include <stdint.h>
#include <shlobj.h>
#include <math.h>
#include <float.h>

#include <GL/glew.h>
#pragma comment(lib, "glew32.lib")
#pragma comment(lib, "OpenGL32.Lib")
#pragma comment(lib, "GlU32.Lib")

#include <png.h>
#pragma comment(lib, "libpng.lib")
#pragma comment(lib, "zlib1.lib")

#include <SDL.h>
#pragma comment(lib, "SDL2.lib")
#pragma comment(lib, "SDL2main.lib")

#include <SDL_syswm.h>

#include <SDL_image.h>
#pragma comment(lib, "SDL2_image.lib")

#include <SDL_ttf.h>
#pragma comment(lib, "SDL2_ttf.lib")


#include "../../../locksingler.hpp"

#include "IN2.H"
#define IN_VER_UNICODE 0x0F000100


void* (__stdcall *sszrefnewfunc)(intptr_t);
void (__stdcall *sszrefdeletefunc)(void*);

#include "../../../dll/ssz/ssz/sszdef.h"
#include "../../../dll/ssz/ssz/typeid.h"
#include "../../../dll/ssz/ssz/arrayandref.hpp"
#include "../../../dll/ssz/ssz/pluginutil.hpp"

int32_t ransuutane;
SDL_Window* g_window;
SDL_Renderer* g_renderer;
SDL_Texture* g_target = nullptr;
uint32_t* g_pix;
SDL_GLContext g_gl = nullptr;
int g_pitch;
int g_w = 640, g_h = 480;
uint32_t g_scrflag = 0;
SDL_AudioSpec g_desired;
HGLRC g_hglrc, g_hglrc2;
HDC g_hdc;
DWORD g_mainTreadId;

WNDPROC g_orgProc;
char16_t g_lastChar = '\0', g_newChar = '\0';

void lockTarget()
{
	if(g_target) SDL_LockTexture(g_target, nullptr, (void**)&g_pix, &g_pitch);
}

void unlockTarget()
{
	if(g_target) SDL_UnlockTexture(g_target);
}

LRESULT CALLBACK wrapProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
	MSG m;
	switch(msg){
	case WM_KEYDOWN:
		m.hwnd = hWnd;
		m.message = msg;
		m.wParam = wParam;
		m.lParam = lParam;
		m.time = 0;
		TranslateMessage(&m);
		if(
			TranslateMessage(&m)
			&& PeekMessage(&m, hWnd, WM_CHAR, WM_CHAR, PM_REMOVE))
		{
			g_newChar = m.wParam;
		}
		break;
	}
	return CallWindowProc(g_orgProc, hWnd, msg, wParam, lParam);
}

void winProcInit()
{
	SDL_SysWMinfo info;
	SDL_VERSION(&info.version);
	SDL_GetWindowWMInfo(g_window, &info);
	g_orgProc = (WNDPROC)GetWindowLong(info.info.win.window, GWL_WNDPROC);
	if(g_orgProc == wrapProc) return;
	SetWindowLong(info.info.win.window, GWL_WNDPROC, (LONG)wrapProc);
}


const int g_samples = 2048;
const int g_sndfreq = 44100;
int16_t g_sndzero[g_samples*2] = {0};
int16_t g_sndbuf[g_samples*2] = {0};
int16_t *g_snddata = g_sndzero;

int g_volume = 256;

LockSingler g_sndmtx;


const double PI = 3.14159265358979323846264338327950288;


struct OutBufList
{
	struct Node
	{
		char *buf;
		int i, len;
		Node *next;
		Node()
		{
			buf = nullptr;
			i = len = 0;
			next = nullptr;
		}
		~Node()
		{
			delete [] buf;
			delete next;
		}
	};
	Node *head, *tail;
	OutBufList()
	{
		head = tail = nullptr;
	}
	~OutBufList()
	{
		delete head;
	}
	void add(char* buf, int len)
	{
		if(head == nullptr){
			head = tail = new Node;
		}else{
			tail->next = new Node;
			tail = tail->next;
		}
		tail->buf = new char[len];
		memcpy(tail->buf, buf, len);
		tail->len = len;
	}
	void pop()
	{
		if(head == nullptr) return;
		Node* tmp = head;
		head = head->next;
		tmp->next = nullptr;
		delete tmp;
		if(head == nullptr) tail = nullptr;
	}
	void clear()
	{
		delete head;
		head = tail = nullptr;
	}
};

Out_Module out_mod;
In_Module* in_mod;
OutBufList g_obl;
int16_t g_omzero[g_samples*2] = {0};
int16_t g_ombuf[g_samples*2] = {0};
int16_t* g_omdata = g_omzero;
HMODULE	g_omdll = nullptr;
bool om_paused = true, om_closed = false;
int om_bufidx, om_samplerate, om_numchannels, om_bitspersamp, om_bufferlenms;
int om_outputtime, om_writtentime;
void dummyconfig(HWND hwndParent){}
void dummyabout(HWND hwndParent){}
void dummyinit(){}
void dummyquit(){}
void bgmFlush(int t)
{
	g_omdata = g_omzero;
	om_bufidx = 0;
	om_outputtime = om_writtentime =
		(int)(
			(double)t * (double)(
				om_numchannels*(om_bitspersamp>>3)*om_samplerate) / 1000.0);
	g_obl.clear();
	om_closed = false;
}
void om_flush(int t)
{
	AutoLocker al(&g_sndmtx);
	bgmFlush(t);
}
int om_open(
	int samplerate, int numchannels, int bitspersamp,
	int bufferlenms, int prebufferms)
{
	AutoLocker al(&g_sndmtx);
	om_samplerate = samplerate;
	om_numchannels = numchannels;
	om_bitspersamp = bitspersamp;
	om_bufferlenms = min(60000, max(bufferlenms, 576));
	om_paused = false;
	bgmFlush(0);
	return
		om_samplerate > 0 && (om_numchannels == 1 || om_numchannels == 2) && (
			om_bitspersamp == 8
			|| om_bitspersamp == 16 || om_bitspersamp == 32)
		? 0 : -1;
}
void om_close()
{
	om_closed = true;
}
int om_write(char* buf, int len)
{
	if(buf == nullptr || len <= 0) return 0;
	AutoLocker al(&g_sndmtx);
	g_obl.add(buf, len);
	om_writtentime += len;
	return 0;
}
int om_canwrite()
{
	return
		(double)om_bufferlenms
		> (double)(om_writtentime - om_outputtime) * 1000.0
		/ (double)(om_numchannels*(om_bitspersamp>>3)*om_samplerate)
		? 8192 : 0;
}
int om_isplaying()
{
	return 1;
}
int om_pause(int pause)
{
	AutoLocker al(&g_sndmtx);
	int pre = (int)om_paused;
	om_paused = pause != 0;
	return pre;
}
void dummysetvolume(int volume){}
void dummysetpan(int pan){}
int om_getoutputtime()
{
	return
		(int)((double)om_outputtime * 1000.0
		/ (double)(om_numchannels*(om_bitspersamp>>3)*om_samplerate));
}
int om_getwrittentime()
{
	return
		(int)((double)om_writtentime * 1000.0
		/ (double)(om_numchannels*(om_bitspersamp>>3)*om_samplerate));
}


void dummySAVAInit(int maxlatancy_in_ms, int srate){}
void dummySAVADeInit(){}
void dummySAAddPCMData(void* PCMData, int nch, int bps, int timestamp){}
int dummySAGetMode(){return 0;}
void dummySAAdd(void* data, int timestamp, int csa){}
void dummyVSAAddPCMData(void* PCMData, int nch, int bps, int timestamp){}
int dummyVSAGetMode(int* specNch, int* waveNch){return 0;}
void dummyVSAAdd(void* data, int timestamp){}
void dummyVSASetInfo(int nch, int srate){}
int dummydsp_isactive(){return 0;}
int dummydsp_dosamples(
	short int* samples, int numsamples, int bps, int nch, int srate)
{return numsamples;}
void dummySetInfo(int bitrate, int srate, int stereo, int synched){}



void sndcallback(void* unused, Uint8* stream, int len)
{
	int i;
	for(i = 0; i < g_samples*2; i++){
		((int16_t*)stream)[i] = g_snddata[i];
	}
	g_snddata = g_sndzero;
}

void bgmclear(bool stop)
{
	if(in_mod != nullptr){
		if(stop) in_mod->Stop();
		in_mod->Quit();
		in_mod = nullptr;
	}
	if(g_omdll != nullptr){
		FreeLibrary(g_omdll);
		g_omdll = nullptr;
	}
	bgmFlush(0);
}


class Joystick
{
	std::basic_string<SDL_Joystick*> joys;
public:
	void init()
	{
		intptr_t i;
		joys.clear();
		for(i = 0; i < SDL_NumJoysticks(); i++){
			joys += SDL_JoystickOpen(i);
		}
	}
	void close()
	{
		intptr_t i;
		for(i = 0; i < (intptr_t)joys.size(); i++){
			if(joys[i] != nullptr){
				SDL_JoystickClose(joys[i]);
			}
		}
		joys.clear();
	}
	bool getState(int32_t joy, int32_t btn)
	{
		if(joy < 0) return SDL_GetKeyboardState(nullptr)[btn] == SDL_PRESSED;
		if(joy >= (int32_t)joys.size() || joys[joy] == nullptr){
			return false;
		}
		if(btn < 0) switch((-btn-1) & 7){
		case 0:
			return
				SDL_JoystickGetAxis(joys[joy],
				((-btn-1) >> 3)*2) < -3200;
		case 1:
			return
				SDL_JoystickGetAxis(joys[joy],
				((-btn-1) >> 3)*2) > 3200;
		case 2:
			return
				SDL_JoystickGetAxis(joys[joy],
				((-btn-1) >> 3)*2 + 1) < -3200;
		case 3:
			return
				SDL_JoystickGetAxis(joys[joy],
				((-btn-1) >> 3)*2 + 1) > 3200;
		case 4:
			return
				(
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_LEFT)
				&& !(
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_RIGHT);
		case 5:
			return
				!(
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_LEFT)
				&& (
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_RIGHT);
		case 6:
			return
				(
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_UP)
				&& !(
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_DOWN);
		case 7:
			return
				!(
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_UP)
				&& (
					SDL_JoystickGetHat(joys[joy],
					(-btn-1) >> 3) & SDL_HAT_DOWN);
		}
		return SDL_JoystickGetButton(joys[joy], btn) == SDL_PRESSED;
	}
};
Joystick g_js;

GLhandleARB g_mugenshader = 0;
GLhandleARB g_mugenshaderFc = 0;
GLhandleARB g_mugenshaderFcS = 0;
static GLint g_uniformPal = 0;
static GLint g_uniformMsk = 0;
static GLint g_uniformNeg = 0;
static GLint g_uniformGray = 0;
static GLint g_uniformAdd = 0;
static GLint g_uniformMul = 0;
static GLint g_uniformColor = 0;
static GLuint g_paltex = 0;


void sndjoyinit()
{
	g_desired.freq = g_sndfreq;
	g_desired.format = AUDIO_S16;
	g_desired.channels = 2;
	g_desired.samples = g_samples;
	g_desired.callback = sndcallback;
	g_desired.userdata= nullptr;
	out_mod.version = OUT_VER;
	out_mod.description = "sdlplugin dummy v0.00";
	out_mod.id = 0x70000000;
	out_mod.hMainWindow = nullptr;
	out_mod.hDllInstance = nullptr;
	out_mod.Config = dummyconfig;
	out_mod.About = dummyabout;
	out_mod.Init = dummyinit;
	out_mod.Quit = dummyquit;
	out_mod.Open = om_open;
	out_mod.Close = om_close;
	out_mod.Write = om_write;
	out_mod.CanWrite = om_canwrite;
	out_mod.IsPlaying = om_isplaying;
	out_mod.Pause = om_pause;
	out_mod.SetVolume = dummysetvolume;
	out_mod.SetPan = dummysetpan;
	out_mod.Flush = om_flush;
	out_mod.GetOutputTime = om_getoutputtime;
	out_mod.GetWrittenTime = om_getwrittentime;
	SDL_OpenAudio(&g_desired, nullptr);
	SDL_PauseAudio(0);
	g_js.init();
}

TUserFunc(bool, Init, bool mugen, int32_t h, int32_t w, Reference cap)
{
	if(SDL_Init(SDL_INIT_EVERYTHING) < 0){
		return false;
	}else{
		TTF_Init();
		g_scrflag = SDL_SWSURFACE;
		g_window = SDL_CreateWindow(
			pu->refToAstr(CP_UTF8, cap).c_str(),
			SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED,
			w, h, g_scrflag);
		if(!g_window) return false;
		g_renderer = SDL_CreateRenderer(g_window, -1, SDL_RENDERER_ACCELERATED);
		if(mugen){
			g_target =
				SDL_CreateTexture(
					g_renderer, SDL_PIXELFORMAT_ARGB8888,
					SDL_TEXTUREACCESS_STREAMING, w, h);
			SDL_SetTextureBlendMode(g_target, SDL_BLENDMODE_NONE);
			lockTarget();
		}
		winProcInit();
		g_mainTreadId = GetCurrentThreadId();
		sndjoyinit();
	}
	g_w = w;
	g_h = h;
	return true;
}

TUserFunc(bool, GlInit, int32_t h, int32_t w, Reference cap)
{
	if(SDL_Init(SDL_INIT_EVERYTHING) < 0){
		return false;;
	}else{
		TTF_Init();
		SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
		SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 1);
		g_scrflag = SDL_WINDOW_OPENGL;
		g_window = SDL_CreateWindow(
			pu->refToAstr(CP_UTF8, cap).c_str(),
			SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, w, h, g_scrflag);
		if(!g_window) return false;
		g_renderer = SDL_CreateRenderer(g_window, -1, SDL_RENDERER_ACCELERATED);
		g_gl = SDL_GL_CreateContext(g_window);
		if(glewInit() != GLEW_OK) return false;
		winProcInit();
		if(h == 0) h = 1; 
		glShadeModel(GL_SMOOTH);
		glClearColor(0.0, 0.0, 0.0, 1.0);
		glEnable(GL_DEPTH_TEST);
		glClearDepth(1.0);
		glDepthFunc(GL_LEQUAL);
		glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
		glEnable(GL_BLEND);
		glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
		glViewport(0, 0, w, h);
		glMatrixMode(GL_PROJECTION);
		glLoadIdentity();
		gluPerspective(45.0, (double)w/(double)h, 0.1, 1000.0);
		glMatrixMode(GL_MODELVIEW);
		glLoadIdentity();
		g_hglrc = wglGetCurrentContext();
		g_hdc = wglGetCurrentDC();
		g_hglrc2 = wglCreateContext(g_hdc);
		wglShareLists(g_hglrc, g_hglrc2);
		g_mainTreadId = GetCurrentThreadId();
		sndjoyinit();
	}
	g_w = w;
	g_h = h;
	return true;
}

TUserFunc(bool, FullScreen, bool fs)
{
	return 
		SDL_SetWindowFullscreen(g_window, fs ? SDL_WINDOW_FULLSCREEN : 0)
		== 0;
}

TUserFunc(void, End)
{
	wglDeleteContext(g_hglrc2);
	g_js.close();
	bgmclear(true);
	SDL_PauseAudio(1);
	SDL_CloseAudio();
	if(g_target){
		unlockTarget();
		SDL_DestroyTexture(g_target);
		g_target = nullptr;
	}
	if(g_gl){
		SDL_GL_DeleteContext(g_gl);
		g_gl = nullptr;
	}
	SDL_DestroyRenderer(g_renderer);
	g_renderer = nullptr;
	SDL_DestroyWindow(g_window);
	g_window = nullptr;
	TTF_Quit();
	SDL_Quit();
}

TUserFunc(bool, PollEvent, int8_t* pb)
{
	SDL_Event ev;

	const int comsz = sizeof(ev.common);

	const int keyofs     =           0;

	const int motionofs  =    keyofs+sizeof(ev.key)-comsz;

	const int buttonofs  =  motionofs+sizeof(ev.motion)-comsz;

	bool ret;
	SDL_JoystickUpdate();
	ret = SDL_PollEvent(&ev) != 0;
	g_lastChar = g_newChar;
	if(!ret) g_newChar = '\0';

	*(int32_t*)pb = ev.type;              pb += sizeof(int32_t);
	*(uint32_t*)pb = ev.common.timestamp; pb += sizeof(uint32_t);
	switch(ev.type){
	case SDL_KEYDOWN:
	case SDL_KEYUP:
		pb += keyofs;
		memcpy(pb, (int8_t*)&ev.key+comsz, sizeof(ev.key)-comsz);
		break;
	case SDL_MOUSEMOTION:
		pb += motionofs;
		memcpy(pb, (int8_t*)&ev.motion+comsz, sizeof(ev.motion)-comsz);
		break;
	case SDL_MOUSEBUTTONDOWN:
	case SDL_MOUSEBUTTONUP:
		pb += buttonofs;
		memcpy(pb, (int8_t*)&ev.button+comsz, sizeof(ev.button)-comsz);
		break;
	}
	return ret;
}

TUserFunc(char16_t, GetLastChar)
{
	return g_lastChar;
}

TUserFunc(bool, KeyState, int32_t key)
{
	return SDL_GetKeyboardState(nullptr)[key] == SDL_PRESSED;
}

TUserFunc(bool, JoystickButtonState, int32_t btn, int32_t joy)
{
	return g_js.getState(joy, btn);
}

TUserFunc(void, Fill, uint32_t color, SDL_Rect* prect)
{
	SDL_SetRenderDrawColor(
		g_renderer, color>>16&0xff, color>>8&0xff, color&0xff, 0xff);
	SDL_RenderFillRect(g_renderer, prect);
}

TUserFunc(intptr_t, IMGLoad, Reference fn)
{
	return (intptr_t)IMG_Load(pu->refToAstr(CP_THREAD_ACP, fn).c_str());
}

TUserFunc(void, DecodePNG8, FILE* fp, int32_t* h, int32_t* w, Reference* out)
{
	pu->setSSZFunc();
	out->releaseanddelete();
	*w = *h = 0;
	if(!fp) return;
	uint8_t header[8] = {0};
	fread(header, 1, 8, fp);
	if(png_sig_cmp(header, 0, 8)) return;
	auto png_ptr =
		png_create_read_struct(
			PNG_LIBPNG_VER_STRING, nullptr, nullptr, nullptr);
	if(!png_ptr) return;
	auto info_ptr = png_create_info_struct(png_ptr);
	if(!info_ptr){
		png_destroy_read_struct(&png_ptr, nullptr, nullptr);
		return;
	}
	png_init_io(png_ptr, fp);
	png_set_sig_bytes(png_ptr, 8);
	png_read_info(png_ptr, info_ptr);
	png_uint_32 width, height;
	int bit_depth, color_type;
	if(
		png_get_IHDR(
			png_ptr, info_ptr, &width, &height, &bit_depth, &color_type,
			nullptr, nullptr, nullptr)
		&& color_type == PNG_COLOR_TYPE_PALETTE && bit_depth <= 8)
	{
		*w = width;
		*h = height;
		out->refnew(height, width);
		auto p = (png_bytep)out->atpos();
		auto pp = new png_bytep[height];
		for(int i = height-1; i >= 0; i--) pp[i] = p + width*i;
		png_read_image(png_ptr, pp);
		switch(bit_depth){
		case 1:
			for(uint32_t y = 0; y < height; y++){
				for(int i = width-1; i >= 0; i--){
					pp[y][i] = (pp[y][i>>3] & 1 << (i&7)) >> (i&7);
				}
			}
		case 2:
			for(uint32_t y = 0; y < height; y++){
				for(int i = width-1; i >= 0; i--){
					pp[y][i] = (pp[y][i>>2] & 3 << (i&3)*2) >> (i&3)*2;
				}
			}
		case 4:
			for(uint32_t y = 0; y < height; y++){
				for(int i = width-1; i >= 0; i--){
					pp[y][i] = (pp[y][i>>1] & 15 << (i&1)*4) >> (i&1)*4;
				}
			}
		}
		delete [] pp;
	}
	png_destroy_read_struct(&png_ptr, &info_ptr, nullptr);
}

TUserFunc(void, BlitSurface, SDL_Rect* prect, SDL_Surface* psrcs)
{
	auto tex = SDL_CreateTextureFromSurface(g_renderer, psrcs);
	SDL_RenderCopy(g_renderer, tex, nullptr, prect);
	SDL_DestroyTexture(tex);
}

TUserFunc(
	intptr_t, CreatePaletteSurface,
	int32_t h, int32_t w, SDL_Color* ppl, uint8_t* ppx)
{
	SDL_Surface* psrc = SDL_CreateRGBSurfaceFrom(ppx, w, h, 8, w, 0, 0, 0, 0);
	SDL_SetPaletteColors(psrc->format->palette, ppl, 0, 256);
	SDL_Surface* pdst = SDL_ConvertSurface(psrc, psrc->format, SDL_SWSURFACE);
	SDL_FreeSurface(psrc);
	return (intptr_t)pdst;
}

TUserFunc(void, SetColorKey, uint32_t key, SDL_Surface* psur)
{
	SDL_SetColorKey(psur, key < 256, key);
}

TUserFunc(void, Flip)
{
	if(g_target){
		unlockTarget();
		SDL_RenderCopy(g_renderer, g_target, nullptr, nullptr);
		lockTarget();
	}
	SDL_RenderPresent(g_renderer);
}

TUserFunc(intptr_t, AllocSurface, int32_t h, int32_t w)
{
	return
		(intptr_t)SDL_CreateRGBSurface(
			SDL_SWSURFACE, w, h, 32, 0x00FF0000,
			0x0000FF00, 0x000000FF, 0xFF000000);
}

TUserFunc(void, FreeSurface, SDL_Surface* ps)
{
	SDL_FreeSurface(ps);
}

TUserFunc(void, Delay, uint32_t ms)
{
	SDL_Delay(ms);
}

TUserFunc(uint32_t, GetTicks)
{
	return SDL_GetTicks();
}

TUserFunc(void, CursorShow, bool show)
{
	SDL_ShowCursor(show ? SDL_ENABLE : SDL_DISABLE);
}

TUserFunc(intptr_t, OpenFont, int32_t size, Reference font)
{
	TTF_Font* pf;
	pf = TTF_OpenFont(pu->refToAstr(CP_THREAD_ACP, font).c_str(), size);
	return (intptr_t)pf;
}

TUserFunc(void, CloseFont, TTF_Font* pf)
{
	TTF_CloseFont(pf);
}

TUserFunc(
	void, RenderFont, Reference str, int32_t y, int32_t x,
	SDL_Color c, TTF_Font* pf)
{
	SDL_Surface* psrc;
	SDL_Rect dest;
	psrc =
		TTF_RenderUNICODE_Blended(
			pf, (Uint16*)pu->refToWstr(str).c_str(), c);
	dest.x = x;
	dest.y = y;
	dest.w = psrc->w;
	dest.h = psrc->h;
	auto tex = SDL_CreateTextureFromSurface(g_renderer, psrc);
	SDL_FreeSurface(psrc);
	SDL_RenderCopy(g_renderer, tex, nullptr, &dest);
	SDL_DestroyTexture(tex);
}

struct NormalizeVar
{
	static const double shitsu;
	double bai, heri, herihenka, fue, heikin;
	NormalizeVar() :
		bai(1.0), heri(1.0), herihenka(0.0), fue(1.0), heikin(1.0/shitsu)
	{
	}
};
const double NormalizeVar::shitsu = 32.0;
NormalizeVar g__nvAll, g__nvMusic;
double normalize(double sam, const int chs, const int sps, NormalizeVar& v)
{
	if(v.bai > 8.0) v.bai = 8.0;
	sam *= v.bai;
	if(sam < 0.0){
		if(sam < -1.0){
			v.bai *= pow(1.0/-sam, v.heri);
			v.herihenka += v.shitsu*(1.0 - v.heri) / ((double)sps+v.shitsu);
			sam = -1.0;
		}else{
			double tmp2 = (1.0 - pow(1.0 - -sam, 64.0)) * pow(0.5 - -sam, 3.0);
			v.bai += v.bai*(
				v.heri*(1.0/v.shitsu - v.heikin) / v.fue
				+ tmp2*v.fue*(1.0 - v.heri) / v.shitsu
			) / (double)(chs*sps/8+1);
			v.herihenka -= (0.5 - v.heikin)*v.heri / (double)(chs*sps);
		}
		v.fue +=
			(v.shitsu*v.fue*(1.0/v.fue - -sam) - v.fue)
			/ (v.shitsu*(double)(chs*sps));
		v.heikin += (-sam - v.heikin) / (double)(chs*sps);
	}else{
		if(sam > 1.0){
			v.bai *= pow(1.0/sam, v.heri);
			v.herihenka += v.shitsu*(1.0 - v.heri) / ((double)sps+v.shitsu);
			sam = 1.0;
		}else{
			double tmp2 = (1.0 - pow(1.0 - sam, 64.0)) * pow(0.5 - sam, 3.0);
			v.bai += v.bai*(
				v.heri*(1.0/v.shitsu - v.heikin) / v.fue
				+ tmp2*v.fue*(1.0 - v.heri) / v.shitsu
			) / (double)(chs*sps/8+1);
			v.herihenka -= (0.5 - v.heikin)*v.heri / (double)(chs*sps);
		}
		v.fue +=
			(v.shitsu*v.fue*(1.0/v.fue - sam) - v.fue)
			/ (v.shitsu*(double)(chs*sps));
		v.heikin += (sam - v.heikin) / (double)(chs*sps);
	}
	v.heri += v.herihenka;
	if(v.heri < 0.0) v.heri = 0.0;
	else if(v.heri > 1.0) v.heri = 1.0;
	return sam;
}
TUserFunc(bool, SetSndBuf, int32_t* buf)
{
	if(g_snddata == g_sndbuf) return false;
	int i, j;
	for(i = 0; i < g_samples*2; i++){
		g_sndbuf[i] =
			(int32_t)(
				normalize(
					(double)(buf[i]*2+(int)g_omdata[i]*3)/32768.0, 2, 44100,
					g__nvAll)
				* 32767.0)
			* g_volume >> 8;
	}
	g_snddata = g_sndbuf;
	g_omdata = g_omzero;
	if(in_mod != nullptr && g_obl.head == nullptr){
		om_closed = false;
		in_mod->SetOutputTime(0);
	}else{
		AutoLocker al(&g_sndmtx);
		if(!om_paused && g_obl.head != nullptr){
			double didx =
				(double)(g_obl.head->i/((om_bitspersamp>>3)*om_numchannels));
			double addidx = (double)om_samplerate / (double)g_sndfreq;
			for(i = om_bufidx; i < g_samples*2; i += 2){
				while(
					g_obl.head != nullptr
					&& g_obl.head->i + (om_bitspersamp>>3)*om_numchannels
					> g_obl.head->len)
				{
					om_outputtime += g_obl.head->len;
					g_obl.pop();
					didx = 0.0;
				}
				if(g_obl.head == nullptr) break;
				switch(om_bitspersamp){
				case 8:
					if(om_numchannels == 2){
						g_ombuf[i] =
							(
								(int)((uint8_t*)g_obl.head->buf)[
									g_obl.head->i] - 128) << 8;
						g_ombuf[i+1] =
							(
								(int)((uint8_t*)g_obl.head->buf)[
									g_obl.head->i+1] - 128) << 8;
					}else{
						g_ombuf[i] =
							g_ombuf[i+1] = (
								(int)((uint8_t*)g_obl.head->buf)[
									g_obl.head->i] - 128) << 8;
					}
					break;
				case 16:
					if(om_numchannels == 2){
						g_ombuf[i] =
							((int16_t*)g_obl.head->buf)[(g_obl.head->i>>1)];
						g_ombuf[i+1] =
							((int16_t*)g_obl.head->buf)[(g_obl.head->i>>1)+1];
					}else{
						g_ombuf[i] =
							g_ombuf[i+1] =
							((int16_t*)g_obl.head->buf)[(g_obl.head->i>>1)];
					}
					break;
				case 32:
					if(om_numchannels == 2){
						g_ombuf[i] =
							(
								(int32_t*)g_obl.head->buf)[
									(g_obl.head->i>>2)] >> 16;
						g_ombuf[i+1] =
							(
								(int32_t*)g_obl.head->buf)[
									(g_obl.head->i>>2)+1] >> 16;
					}else{
						g_ombuf[i] =
							g_ombuf[i+1] = (
								(int32_t*)g_obl.head->buf)[
									(g_obl.head->i>>2)] >> 16;
					}
					break;
				}
				didx += addidx;
				g_obl.head->i = (int)didx*(om_bitspersamp>>3)*om_numchannels;
			}
			for(j = om_bufidx; j < i; j++){
				g_ombuf[j] =
					(int16_t)(
						normalize(
							(double)g_ombuf[j]/32768.0, 2, 44100, g__nvMusic)
						* 32767.0);
			}
			if(i >= g_samples*2){
				g_omdata = g_ombuf;
				om_bufidx = 0;
			}else{
				om_bufidx = i;
			}
		}
	}
	return true;
}

TUserFunc(bool, PlayBGM, Reference fn, Reference pldir)
{
	bgmclear(true);
	if(fn.len() == 0) return true;
	std::wstring fnamew;
	std::string fname;
	fnamew.append((wchar_t*)fn.atpos(), fn.len()/(int)sizeof(wchar_t));
	fname.resize(WideCharToMultiByte(
		CP_THREAD_ACP, 0, fnamew.data(), fnamew.size(),
		nullptr, 0, nullptr, nullptr));
	if(fname.size() > 0){
		WideCharToMultiByte(
			CP_THREAD_ACP, 0, fnamew.data(), fnamew.size(),
			(char*)fname.data(), fname.size(), nullptr, nullptr);
	}
	intptr_t i = fname.size() - 1;
	for(; i >= 0; i--){
		if(fname[i] == L'.') break;
	}
	if(i < 0) return false;
	std::string ext;
	for(i++; i < (intptr_t)fname.size(); i++){
		ext += tolower(fname[i]);
	}
	if(ext.size() < 1) return false;
	char *pc;
	pc = _fullpath(nullptr, fname.c_str(), 0);
	if(pc == nullptr) return false;
	fname = pc;
	free(pc);
	std::wstring pd = pu->refToWstr(pldir);
	pd += '\\';
	std::wstring tmp = pd;
	tmp += L"in_*.dll";
	bool ret = false, uni = false;;
	WIN32_FIND_DATA wfd;
	HANDLE hff = FindFirstFile(tmp.c_str(), &wfd);
	if(hff != INVALID_HANDLE_VALUE) do{
		tmp = pd;
		tmp += wfd.cFileName;
		g_omdll = LoadLibrary(tmp.c_str());
		if(g_omdll == nullptr) continue;
		FARPROC	wgim2 = GetProcAddress(g_omdll, "winampGetInModule2");
		if(wgim2 == nullptr){
			bgmclear(false);
			continue;
		}
		in_mod = (In_Module*)wgim2();
		if(in_mod != nullptr){
			if(in_mod->version == IN_VER){
				uni = false;
			}else if(in_mod->version == IN_VER_UNICODE){
				uni = true;
			}else{
				in_mod = nullptr;
			}
		}
		if(in_mod == nullptr){
			bgmclear(false);
			continue;
		}
		in_mod->hMainWindow = nullptr;
		in_mod->hDllInstance = g_omdll;
		in_mod->SAVSAInit = dummySAVAInit;
		in_mod->SAVSADeInit = dummySAVADeInit;
		in_mod->SAAddPCMData = dummySAAddPCMData;
		in_mod->SAGetMode = dummySAGetMode;
		in_mod->SAAdd = dummySAAdd;
		in_mod->VSAAddPCMData = dummyVSAAddPCMData;
		in_mod->VSAGetMode = dummyVSAGetMode;
		in_mod->VSAAdd = dummyVSAAdd;
		in_mod->VSASetInfo = dummyVSASetInfo;
		in_mod->dsp_isactive = dummydsp_isactive;
		in_mod->dsp_dosamples = dummydsp_dosamples;
		in_mod->SetInfo = dummySetInfo;
		in_mod->Init();
		in_mod->outMod = &out_mod;
		bool found = false;
		char *exs = in_mod->FileExtensions;
		if(exs != nullptr) while(*exs != '\0'){
			char* ex = (char*)ext.c_str();
			while(*exs != '\0' && *ex != '\0'){
				if(tolower(*exs) != *ex){
					if(*exs == ';' && *ex == '\0') break;
					ex = (char*)ext.c_str();
					while(*exs != '\0' && *exs != ';') exs++;
					if(*exs == '\0') break;
					exs++;
					continue;
				}
				exs++;
				ex++;
			}
			if(*ex == '\0' && (*exs == ';' || *exs == '\0')){
				found = true;
				break;
			}
			while(*exs != '\0') exs++;
			if(*++exs == '\0') break;
			while(*exs != '\0') exs++;
			exs++;
		}
		if(
			!found || (in_mod->UsesOutputPlug&1) == 0
			|| in_mod->Play(uni ? (char*)fnamew.c_str() : (char*)fname.c_str())
			!= 0)
		{
			bgmclear(false);
			continue;
		}
		ret = true;
		break;
	}while(FindNextFile(hff, &wfd));
	FindClose(hff);
	return ret;
}

TUserFunc(void, PauseBGM, bool pause)
{
	if(pause != om_paused){
		if(in_mod != nullptr){
			if(pause){
				in_mod->Pause();
			}else{
				in_mod->UnPause();
			}
		}else{
			om_paused = pause;
		}
	}
}

TUserFunc(bool, SendOpenBGM, int32_t channels, int32_t rate)
{
	bgmclear(true);
	return om_open(rate, channels, 16, 5000, 5000) >= 0;
}

TUserFunc(void, SendCloseBGM)
{
	om_close();
}

TUserFunc(intptr_t, SendWriteBGM, Reference buffer)
{
	if(buffer.len() == 0) return 0;
	auto len = min(om_canwrite(), buffer.len());
	om_write((char*)buffer.atpos(), len);
	return len / sizeof(int16_t);
}

TUserFunc(void, SetVolume, int32_t v)
{
	g_volume = v;
	if(g_volume < 0){
		g_volume = 0;
	}else if(g_volume > 256){
		g_volume = 256;
	}
}



void kaiten(float& x, float& y, float angle, float rcx, float rcy, float vscl)
{
	float temp = (y - rcy) / vscl;
	float length = sqrt((x - rcx)*(x - rcx) + temp*temp);
	if(x - rcx == 0.0f){
		angle += (float)(y - rcy > 0.0f ? (float)PI/2.0f : -(float)PI/2.0f);
		x = rcx + (float)(length*cos(angle));
		y = rcy + (float)(length*sin(angle)) * vscl;
		return;
	}
	double kakudo =
		atan(temp / (x - rcx)) + (x - rcx < 0 ? (float)PI : 0.0f) + angle;
	x = rcx + (float)(length*cos(kakudo));
	y = rcy + (float)(length*sin(kakudo)) * vscl;
}

struct PalletColorImg
{
	uint8_t* data;
	uint8_t* end;
	int currentx;
	int currenty;
	int width;
	int color;
	void setImg(Reference& r, int w)
	{
		data = (uint8_t*)r.atpos();
		end = data + r.len();
		width = w;
		currentx = width-1;
		currenty = -1;
		nextPixel();
	}
	void nextPixel()
	{
		if((unsigned int)++currentx >= (unsigned int)width){
			currenty++;
			if(data >= end){
				end = nullptr;
				currentx = -2;
				return;
			}
			currentx = 0;
		}
		color = *data++;
	}
	bool finished()
	{
		return end == nullptr;
	}
	void skip(int n)
	{
		while(n > 0 && !finished()){
			if(width-currentx  > n){
				data += n;
				currentx += n;
				color = *(data-1);
				return;
			}
			n -= width - currentx;
			data += (width-1)-currentx;
			currentx = width-1;
			nextPixel();
		}
	}
	void nextLine()
	{
		if(finished()) return;
		data += (width-1)-currentx;
		currentx = width-1;
		nextPixel();
	}
};

struct PcxRleImg
{
	struct LineInfo
	{
		uint8_t* data;
	};
	uint8_t* data;
	uint8_t* end;
	int currentx;
	int currenty;
	int width;
	int datawidth;
	int color;
	int restcount;
	Reference* nlbuf;
	void setImg(Reference& r, int w, int dw, Reference* b)
	{
		data = (uint8_t*)r.atpos();
		end = data + r.len();
		width = w;
		datawidth = max(width, dw);
		nlbuf = b;
		restcount = 0;
		currentx = datawidth-1;
		currenty = -1;
		nextPixel();
	}
	void forward1()
	{
		restcount--;
		while(restcount <= 0){
			color = *data++;
			if(color >= 0xC0){
				restcount = color & 0x3F;
				color = *data++;
			}else{
				restcount = 1;
				break;
			}
		}
	}
	void nextPixel()
	{
		if((unsigned int)++currentx >= (unsigned int)width){
			if(!newLine()) return;
		}
		forward1();
	}
	bool newLine()
	{
		while((unsigned int)currentx < (unsigned int)datawidth){
			currentx++;
			forward1();
		}
		currenty++;
		currentx = 0;
		restcount = 0;
		if(data >= end){
			end = nullptr;
			currentx = -2;
			return false;
		}
		return true;
	}
	bool finished()
	{
		return end == nullptr;
	}
	void skip(int n)
	{
		while(n > 0 && !finished()){
			if(datawidth-currentx  > restcount){
				if(n < restcount){
					currentx += n;
					restcount -= n;
					return;
				}
				n -= restcount;
				currentx += restcount-1;
				restcount = 1;
			}else if((datawidth-1) - currentx < restcount){
				if(n < datawidth - currentx){
					currentx += n;
					restcount -= n;
					return;
				}
				n -= datawidth - currentx;
				restcount -= (datawidth-1) - currentx;
				currentx = datawidth-1;
			}else{
				n--;
			}
			nextPixel();
		}
	}
	void nextLine()
	{
		if(currenty < nlbuf->len()/(int)sizeof(LineInfo)){
			data = ((LineInfo*)nlbuf->atpos())[currenty].data;
			currenty++;
			currentx = 0;
			restcount = 0;
			if(data >= end){
				end = nullptr;
				currentx = -2;
			}else{
				forward1();
			}
			return;
		}
		if(finished()) return;
		skip(width - 1 - currentx);
		currentx++;
		if(!newLine()) return;
		if(currenty-1 == nlbuf->len()/(int)sizeof(LineInfo)){
			nlbuf->addsize(1, sizeof(LineInfo), nullptr, nullptr);
			((LineInfo*)nlbuf->atpos())[currenty-1].data = data;
		}
		forward1();
	}
};

#include "rz.h"
typedef void (*copycolorproc)(uint32_t&, uint32_t, uint32_t);
template<typename Img> class Funcs
{
public:
	typedef void (*mzllporc)(
		uint32_t*, Img&, uint32_t*, uint32_t,
		int, SDL_Rect, int, int, int, int, int);
	typedef void (*mrllporc)(
		uint32_t*, int, int, int, Img, uint32_t*, uint32_t,
		bool, uint32_t, int, int, int, int, int, int, int, int);
	typedef void (*mzlslporc)(
		uint32_t*, Img&, uint32_t, uint32_t,
		int, int, int, int, int, int);
	typedef void (*mrlslporc)(
		uint32_t*, int, int, int, Img, uint32_t, uint32_t,
		bool, uint32_t, int, int, int, int, int, int, int, int, int);
};
void mTrans(uint32_t& dst, uint32_t color, uint32_t colorkey)
{
	dst = color;
}
void mAddTrans(uint32_t& dst, uint32_t color, uint32_t colorkey)
{
	uint32_t tmp =
		((dst & color) + (((dst ^ color) >> 1) & 0x7f7f7f7f)) & 0x80808080;
	uint32_t msk = (tmp << 1) - (tmp >> 7);
	dst = ((dst + color) - msk) | msk;
}
void mAdd1Trans(uint32_t& dst, uint32_t color, uint32_t colorkey)
{
	uint32_t tmpm = (1 << (8 - (colorkey >> 16))) - 1;
	tmpm |= tmpm << 8 | tmpm << 16;
	uint32_t tmpd = dst >> (colorkey >> 16) & tmpm;
	uint32_t tmp =
		((tmpd & color) + (((tmpd ^ color) >> 1) & 0x7f7f7f7f)) & 0x80808080;
	uint32_t msk = (tmp << 1) - (tmp >> 7);
	dst = ((tmpd + color) - msk) | msk;
}
void mSubTrans(uint32_t& dst, uint32_t color, uint32_t colorkey)
{
	uint32_t tmp =
		(((~dst & color) << 1) + ((~dst ^ color) & 0xfefefefe)) & 0x01010100;
	uint32_t msk = tmp - (tmp >> 8);
	dst = (dst - color + tmp) & ~msk;
}
void mAlphaTrans(uint32_t& dst, uint32_t color, uint32_t colorkey)
{
	uint64_t tmpd =
		((uint64_t)(dst&0xff0000) << 16)
		| ((uint64_t)(dst&0xff00) << 8) | (uint64_t)(dst&0xff);
	uint64_t tmps =
		((uint64_t)(color&0xff0000) << 16)
		| ((uint64_t)(color&0xff00) << 8) | (uint64_t)(color&0xff);
	tmpd *= colorkey >> 24;
	tmps *= colorkey >> 16 & 0xff;
	uint64_t tmp =
		((tmpd & tmps) + (((tmpd ^ tmps) >> 1) & 0x7fff7fff7fff7fffL))
		& 0x8000800080008000L;
	uint64_t msk = (tmp << 1) - (tmp >> 15);
	tmpd = ((tmpd + tmps) - msk) | msk;
	dst =
		(uint32_t)((tmpd&0xff0000000000L)>>24
		| (tmpd&0xff000000L)>>16 | (tmpd&0xff00L)>>8);
}
void mShadowTrans(uint32_t& dst, uint32_t color, uint32_t alpha)
{
	mSubTrans(dst, color, 0);
	uint64_t tmpd =
		((uint64_t)(dst&0xff0000) << 16)
		| ((uint64_t)(dst&0xff00) << 8) | (uint64_t)(dst&0xff);
	tmpd *= alpha;
	dst =
		(uint32_t)((tmpd&0xff0000000000L)>>24
		| (tmpd&0xff000000L)>>16 | (tmpd&0xff00L)>>8);
}

template<typename Img, copycolorproc ccp> void mzlLoop(
	uint32_t* pdpx, Img& pri, uint32_t* pspl, uint32_t colorkey,
	int xsign, SDL_Rect tile, int ix, int dxend, int ifx, int ixcl, int sx)
{
	Img tmppri = pri;
	tmppri.skip(sx);
	if(tile.w == 1){
		if(
			xsign*dxend
			> xsign*((ifx + ((tmppri.width-1) - tmppri.currentx)*ixcl) >> 16))
		{
			if(sx != 0 && tmppri.currentx <= 0) return;
			if(-65536 <= ixcl && ixcl <= 65536){
				for(;;){
					int n = (int)(ix == ifx>>16) - 1 & xsign;
					if(n != 0 && (uint16_t)colorkey != tmppri.color){
						ccp(pdpx[ix], pspl[tmppri.color], colorkey);
					}
					ix += n;
					tmppri.nextPixel();
					if(tmppri.currentx <= 0) return;
					ifx += ixcl;
				}
			}else{
				for(;;){
					if(ix == ifx>>16){
						tmppri.nextPixel();
						if(tmppri.currentx <= 0) return;
						ifx += ixcl;
					}
					if(((uint16_t)colorkey != tmppri.color)){
						ccp(pdpx[ix], pspl[tmppri.color], colorkey);
					}
					ix += xsign;
				}
			}
		}else{
			if(-65536 <= ixcl && ixcl <= 65536){
				for(;;){
					int n = (int)(ix == ifx>>16) - 1 & xsign;
					if(n != 0 && (uint16_t)colorkey != tmppri.color){
						ccp(pdpx[ix], pspl[tmppri.color], colorkey);
					}
					if((ix += n) == dxend) return;
					tmppri.nextPixel();
					ifx += ixcl;
				}
			}else{
				for(;;){
					if(ix == ifx>>16){
						tmppri.nextPixel();
						ifx += ixcl;
					}
					if(((uint16_t)colorkey != tmppri.color)){
						ccp(pdpx[ix], pspl[tmppri.color], colorkey);
					}
					if((ix += xsign) == dxend) return;
				}
			}
		}
	}else{
		int bix = ix;
		if(-65536 <= ixcl && ixcl <= 65536){
			for(;;){
				int n = (int)(ix == ifx>>16) - 1 & xsign;
				if(n != 0 && (uint16_t)colorkey != tmppri.color){
					ccp(pdpx[ix], pspl[tmppri.color], colorkey);
				}
				if((ix += n) == dxend) return;
				tmppri.nextPixel();
				if(tmppri.currentx <= 0){
					ifx += ixcl*tile.x;
					ix = ifx>>16;
					if(xsign*ix < xsign*bix) for(;;){
						ix = (ifx+ixcl)>>16;
						if(xsign*ix >= xsign*bix) break;
						ifx += ixcl;
					}
					if(--tile.w == 0 || xsign*ix >= xsign*dxend) return;
					tmppri = pri;
				}
				ifx += ixcl;
			}
		}else{
			for(;;){
				if(ix == ifx>>16){
					tmppri.nextPixel();
					if(tmppri.currentx <= 0){
						ifx += ixcl*tile.x;
						ix = ifx>>16;
						if(xsign*ix < xsign*bix) for(;;){
							ix = (ifx+ixcl)>>16;
							if(xsign*ix >= xsign*bix) break;
							ifx += ixcl;
						}
						if(--tile.w == 0 || xsign*ix >= xsign*dxend) return;
						tmppri = pri;
					}
					ifx += ixcl;
				}
				if(((uint16_t)colorkey != tmppri.color)){
					ccp(pdpx[ix], pspl[tmppri.color], colorkey);
				}
				if((ix += xsign) == dxend) return;
			}
		}
	}
}
template<typename Img> void mzLineBilt(
	typename Funcs<Img>::mzllporc loop, uint32_t* pdpx, SDL_Rect& dr,
	float dcx, Img& pri, uint32_t* pspl, float cx, SDL_Rect& til,
	float xscl, uint32_t colorkey)
{
	float fx = dcx - cx*xscl;
	if(
		abs(fx) > 1.0e5f || abs(xscl) < 0.001f
		|| abs((float)pri.width * xscl) + (float)g_w > 32767.0f)
	{
		return;
	}
	int xsign = (xscl < 0.0f ? -1 : 1);
	int ix;
	int sx = 0;
	int dxend;
	SDL_Rect tile = til;
	if(xsign < 0){
		dxend = dr.x-1;
		if(til.w == 1 || (uint32_t)til.w > UINT16_MAX){
			tile.w = UINT16_MAX;
			if(floor(fx) < (float)(dr.x+dr.w-1)){
				fx +=
					ceil(
						((float)(dr.x+dr.w-1)-floor(fx))
						/ ((float)(pri.width+tile.x)*-xscl))
					* (float)(pri.width+tile.x)*-xscl;
			}
		}else if(til.w == 0){
			tile.w = 1;
		}
		ix = (int)floor(fx);
		if(ix > (int)dr.x+dr.w-1){
FOOFOOFOO:
			ix = (int)dr.x+dr.w-1;
			float n = floor(((float)ix-floor(fx))/xscl);
			fx += n*xscl;
			if(floor(fx+xscl) > (float)ix){
				fx += xscl;
				n += 1.0f;
			}
			sx += (int)n;
			if(sx >= pri.width+tile.x){
				if(sx >= (pri.width+tile.x)*tile.w) return;
				tile.w -= sx/(pri.width+tile.x);
				sx = sx%(pri.width+tile.x);
			}
			if(sx >= pri.width){
				if(--tile.w == 0) return;
				fx += xscl*(float)((pri.width+tile.x)-sx);
				ix = (int)floor(fx);
				sx = 0;
				if(ix > (int)dr.x+dr.w-1) goto FOOFOOFOO;
			}
		}
	}else{
		dxend = dr.x+dr.w;
		if(til.w == 1 || (uint32_t)til.w > UINT16_MAX){
			tile.w = UINT16_MAX;
			if(floor(fx) > (float)dr.x){
				fx -=
					ceil(
						(floor(fx)-(float)dr.x)
						/ ((float)(pri.width+tile.x)*xscl))
					* (float)(pri.width+tile.x)*xscl;
			}
		}else if(til.w == 0){
			tile.w = 1;
		}
		ix = (int)floor(fx);
		if(ix < dr.x){
BARBARBAR:
			ix = dr.x;
			float n = floor(((float)ix-floor(fx))/xscl);
			fx += n*xscl;
			if(floor(fx+xscl) < (float)ix){
				fx += xscl;
				n += 1.0f;
			}
			sx += (int)n;
			if(sx >= pri.width+tile.x){
				if(sx >= (pri.width+tile.x)*tile.w) return;
				tile.w -= sx/(pri.width+tile.x);
				sx = sx%(pri.width+tile.x);
			}
			if(sx >= pri.width){
				if(--tile.w == 0) return;
				fx += xscl*(float)((pri.width+tile.x)-sx);
				ix = (int)floor(fx);
				sx = 0;
				if(ix < dr.x) goto BARBARBAR;
			}
		}
	}
	if(xsign*ix >= xsign*dxend) return;
	fx += xscl;
	int ifx = (int)floor(fx*65536.0f);
	int ixcl = (int)(xscl*65536.0f);
	loop(pdpx, pri, pspl, colorkey, xsign, tile, ix, dxend, ifx, ixcl, sx);
}
void getdxdy(int& dx, int& dy, const Zurashi* zt, uint8_t ztofs, uint32_t roto)
{
	if((roto & 0x80) == 0){
		dx = zt[ztofs].dx;
		dy = zt[ztofs].dy;
	}else{
		dx = -zt[ztofs].dy;
		dy = -zt[ztofs].dx;
	}
}

template<int sign> void inclrxy(
	int& rx, int& ry, const Zurashi* xzt, uint8_t xztofs, uint32_t roto)
{
	int xp1 = (roto+256)>>9 & 1;
	int xmask = (int)(xp1 == 0) - 1;
	int yp1 = roto>>9 & 1;
	int ymask = (int)(yp1 == 0) - 1;
	int dx, dy;
	getdxdy(dx, dy, xzt, xztofs, roto);
	if((roto & 0x100) != 0){
		ry += sign*((dx^xmask) + xp1);
		rx += sign*((dy^ymask) + yp1);
	}else{
		rx += sign*((dx^xmask) + xp1);
		ry += sign*((dy^ymask) + yp1);
	}
}
template<typename Img, copycolorproc ccp> void mzrlLoop(
	uint32_t* pdpx, int dstw, int rx, int ry, Img pri, uint32_t* pspl,
	uint32_t roto, bool biltflg, uint32_t colorkey, int rxsrt, int rxend,
	int rysrt, int ryend, int rxlimmask, int rylimmask, int ifx, int ixcl)
{
	const Zurashi *xzt =
		RotoZurasiTable[(roto&0x80) == 0 ? roto & 0x7f : 128 - (roto & 0x7f)];
	uint8_t xztofs = 0;
	int ix = ifx>>16;
	ifx += ixcl;
	int tx = 1;
	if(ixcl > 0){
		if(ixcl < 65536){
			for(;;){
				if(ix >= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
						&& (ry^rylimmask)+(rylimmask&1) >= rysrt)
					{
						break;
					}
					xztofs++;
					inclrxy<1>(rx, ry, xzt, xztofs, roto);
					ix++;
				}
			}
			for(;;){
				if(ix >= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
						|| (ry^rylimmask)+(rylimmask&1) >= ryend)
					{
						return;
					}
					if(
						(uint16_t)colorkey != pri.color
						&& (
							biltflg
							|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
						&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
					{
						ccp(pdpx[rx + ry*dstw], pspl[pri.color], colorkey);
					}
					xztofs++;
					inclrxy<1>(rx, ry, xzt, xztofs, roto);
					ix++;
				}
			}
		}else{
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
					&& (ry^rylimmask)+(rylimmask&1) >= rysrt)
				{
					break;
				}
				xztofs++;
				inclrxy<1>(rx, ry, xzt, xztofs, roto);
				if(++ix >= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
					|| (ry^rylimmask)+(rylimmask&1) >= ryend)
				{
					return;
				}
				if(
					(uint16_t)colorkey != pri.color
					&& (
						biltflg
						|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
					&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
				{
					ccp(pdpx[rx + ry*dstw], pspl[pri.color], colorkey);
				}
				xztofs++;
				inclrxy<1>(rx, ry, xzt, xztofs, roto);
				if(++ix >= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
		}
	}else{
		if(ixcl > -65536){
			for(;;){
				if(ix <= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
						&& (ry^rylimmask)+(rylimmask&1) >= rysrt)
					{
						break;
					}
					xztofs--;
					inclrxy<-1>(rx, ry, xzt, xztofs, roto);
					ix--;
				}
			}
			for(;;){
				if(ix <= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
						|| (ry^rylimmask)+(rylimmask&1) >= ryend)
					{
						return;
					}
					xztofs--;
					if(
						(uint16_t)colorkey != pri.color
						&& (
							biltflg
							|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
						&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
					{
						ccp(pdpx[rx + ry*dstw], pspl[pri.color], colorkey);
					}
					inclrxy<-1>(rx, ry, xzt, xztofs, roto);
					ix--;
				}
			}
		}else{
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
					&& (ry^rylimmask)+(rylimmask&1) >= rysrt)
				{
					break;
				}
				xztofs--;
				inclrxy<-1>(rx, ry, xzt, xztofs, roto);
				if(--ix <= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
					|| (ry^rylimmask)+(rylimmask&1) >= ryend)
				{
					return;
				}
				xztofs--;
				if(
					(uint16_t)colorkey != pri.color
					&& (
						biltflg
						|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
					&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
				{
					ccp(pdpx[rx + ry*dstw], pspl[pri.color], colorkey);
				}
				inclrxy<-1>(rx, ry, xzt, xztofs, roto);
				if(--ix <= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
		}
	}
}
template<typename Img> void mzrLineBilt(
	typename Funcs<Img>::mrllporc loop, uint32_t* pdpx, int dstw,
	int rx, int ry, int xlim, int ylim, float fx, Img& pri, uint32_t* pspl,
	float xscl, uint32_t roto, bool biltflg, uint32_t colorkey)
{
	if(abs(fx) > 16383.0f) return;
	int rxsrt, rxend, rysrt, ryend;
	int rxlimmask, rylimmask;
	if(xscl < 0.0f){
		if(roto < 256){
			if(roto == 0 && ry < 0) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}else if(roto < 512){
			if(roto == 256 && rx < 0) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}else if(roto < 768){
			if(roto == 512 && ry >= ylim) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}else{
			if(roto == 768 && rx >= xlim) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}
	}else{
		if(roto < 256){
			if(roto == 0 && ry >= ylim) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}else if(roto < 512){
			if(roto == 256 && rx >= xlim) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}else if(roto < 768){
			if(roto == 512 && ry < 0) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}else{
			if(roto == 768 && rx < 0) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}
	}
	int ifx = (int)floor(fx*65536.0f);
	int ixcl = (int)(xscl*65536.0f);
	loop(
		pdpx, dstw, rx, ry, pri, pspl, roto, biltflg, colorkey,
		rxsrt, rxend, rysrt, ryend, rxlimmask, rylimmask, ifx, ixcl);
}
template<typename Img> void mzScreenBilt(
	typename Funcs<Img>::mzllporc loop, SDL_Rect& dr,
	float rcx, Img pri, uint32_t *ppal, SDL_Rect& srcr, float cx, float ty,
	SDL_Rect& tile, float xtopscl, float xbotscl, float yscl,
	float rasterxadd, uint32_t colorkey)
{
	if(abs(yscl) < 0.001f) return;
	if(dr.x < 0){
		dr.w += dr.x;
		dr.x = 0;
	}
	if((int)dr.x+dr.w > g_w) dr.w -= dr.x+dr.w - g_w;
	if((int16_t)dr.w <= 0) return;
	if(dr.y < 0){
		dr.h += dr.y;
		dr.y = 0;
	}
	if((int)dr.y+dr.h > g_h) dr.h -= dr.y+dr.h - g_h;
	if((int16_t)dr.h <= 0) return;
	float fcx = cx / abs(xtopscl);
	uint32_t* pdpx = g_pix;
	int dstw = g_pitch / sizeof(uint32_t);
	int ysign;
	int dybgn;
	int dyend;
	if(yscl < 0.0f){
		ysign = -1;
		dybgn = dr.y+dr.h-1;
		dyend = dr.y-1;
		ty -= (float)(dr.y+(int)dr.h);
	}else{
		ysign = 1;
		dybgn = dr.y;
		dyend = dr.y+dr.h;
		ty += (float)dr.y;
	}
	float xscdf = (xbotscl - xtopscl) / ((float)(ysign*srcr.h) * yscl);
	float xscl = xtopscl + xscdf*0.5f;
	float dcx = rcx + (xscl < 0.0 ? -0.5f : 0.5f);
	float fy = (float)dybgn - (float)ysign*ty + 0.5f;
	int iy = dybgn;
	int sy = 0;
	if(ty < 0.0f){
		if(tile.h != 1){
			iy = (int)floor(fy);
		}else{
			xscl += xscdf*ty;
			dcx += rasterxadd*ty;
			float n = floor((float)ysign*ty/yscl);
			fy += n*yscl;
			if((float)ysign*floor(fy+yscl) < (float)(ysign*iy)){
				fy += yscl;
				n += 1.0f;
			}
			sy = (sy + (int)n) % (srcr.h+tile.y);
			if(sy < 0) sy += srcr.h+tile.y;
		}
		if(tile.h == 0){
			tile.h = 1;
		}else if(tile.h == 1 || (uint32_t)tile.h > UINT16_MAX){
			tile.h = UINT16_MAX;
		}
	}else{
		xscl += xscdf*ty;
		dcx += rasterxadd*ty;
		float n = floor((float)ysign*ty/yscl);
		fy += n*yscl;
		if((float)ysign*floor(fy+yscl) < (float)(ysign*iy)){
			fy += yscl;
			n += 1.0f;
		}
		sy += (int)n;
		if(tile.h == 0){
			tile.h = 1;
		}else if(tile.h == 1 || (uint32_t)tile.h > UINT16_MAX){
			tile.h = UINT16_MAX;
		}
		if(sy >= srcr.h+tile.y){
			if(sy >= (int)(srcr.h+tile.y)*tile.h) return;
			tile.h -= sy/(srcr.h+tile.y);
			sy = sy%(srcr.h+tile.y);
		}
	}
	if(sy >= srcr.h){
		fy += yscl*(float)(tile.y - (sy-srcr.h));
		xscl += xscdf*(float)(ysign*((int)floor(fy)-iy));
		dcx += rasterxadd*(float)(ysign*((int)floor(fy)-iy));
		iy = (int)floor(fy);
		sy = 0;
		if(--tile.h == 0) return;
	}
	if(ysign*iy >= ysign*dyend) return;
	pdpx += dstw*iy;
	Img newpri = pri;
	int i;
	for(i = 0; i < sy; i++) newpri.nextLine();
	fy += yscl;
	if(newpri.finished()){
		xscl += (float)ysign*(floor(fy)-(float)iy)*xscdf;
		dcx += (float)ysign*(floor(fy)-(float)iy)*rasterxadd;
		pdpx += ((int)floor(fy)-iy)*dstw;
		iy = (int)floor(fy);
	}
	float dcx2 = dcx;
	while(ysign*iy < ysign*dyend){
		if(iy == (int)floor(fy)){
			do{
				newpri.nextLine();
				if(newpri.currenty >= srcr.h || newpri.finished()){
					fy += yscl*(float)(tile.y+srcr.h-newpri.currenty);
					xscl += xscdf*(float)(ysign*((int)floor(fy)-iy));
					dcx += rasterxadd*(float)(ysign*((int)floor(fy)-iy));
					pdpx += ((int)floor(fy) - iy)*dstw;
					iy = (int)floor(fy);
					if(--tile.h == 0 || ysign*iy >= ysign*dyend) return;
					newpri = pri;
				}
				fy += yscl;
			}while(iy == (int)floor(fy));
			dcx2 = dcx;
		}
		if(ysign*iy >= ysign*dybgn){
			mzLineBilt(
				loop, pdpx, dr, dcx2, newpri, ppal, fcx, tile, xscl, colorkey);
		}
		xscl += xscdf;
		dcx += rasterxadd;
		iy += ysign;
		pdpx += ysign*dstw;
	}
}
template<typename Img> void mzrScreenBilt(
	typename Funcs<Img>::mrllporc loop,
	float rcx, float rcy, Img& pri, uint32_t* ppal, SDL_Rect& srcr,
	float fx, float fy, float xscl, float yscl,
	uint32_t roto, uint32_t colorkey)
{
	if(yscl < 0.0f){
		xscl *= -1.0f;
		yscl *= -1.0f;
		roto = roto + 512 & 0x3ff;
	}
	const Zurashi *yzt =
		RotoZurasiTable[
			(roto-256 & 0x80) == 0
			? roto-256 & 0x7f : 128 - (roto-256 & 0x7f)];
	uint8_t yztofs = 0;
	uint32_t* pdpx = g_pix;
	int dstw = g_pitch / sizeof(uint32_t);
	int xlim = g_w;
	int ylim = g_h;
	float tmpx = fx = rcx + (xscl < 0.0f ? fx : -fx);
	float tmpy = fy = rcy - fy;
	kaiten(tmpx, tmpy, -((float)PI*(float)roto/512.0f), rcx, rcy, 1.0);
	int rx = (int)floor(tmpx + 0.5f), ry = (int)floor(tmpy + 0.5f);
	intptr_t pmask = (int32_t)((roto-256)<<(31-8))>>31;
	int xp1 = roto>>9 & 1;
	int xmask = (int)(xp1 == 0) - 1;
	int yp1 = (roto-256)>>9 & 1;
	int ymask = (int)(yp1 == 0) - 1;
	fx += xscl < 0.0 ? -0.5f : 0.5f;
	fy += 0.5f;
	int iy = (int)floor(fy);
	fy += yscl;
	int tmpdx = 0, tmpdy = 1;
	*(int*)(((intptr_t)&rx&pmask) | ((intptr_t)&ry&~pmask)) -=
		((tmpdy^ymask) + yp1);
	for(;;){
		while(iy == (int)floor(fy)){
			pri.nextLine();
			if(pri.currenty >= srcr.h || pri.finished()) return;
			fy += yscl;
		}
		if(tmpdx != 0){
			*(int*)(((intptr_t)&rx&~pmask) | ((intptr_t)&ry&pmask)) +=
				((tmpdx^xmask) + xp1);
			mzrLineBilt(
				loop, pdpx, dstw, rx, ry, xlim, ylim, fx,
				pri, ppal, xscl, roto, tmpdy == 0, colorkey);
		}
		if(tmpdy != 0){
			*(int*)(((intptr_t)&rx&pmask) | ((intptr_t)&ry&~pmask)) +=
				((tmpdy^ymask) + yp1);
			mzrLineBilt(loop, pdpx, dstw, rx, ry, xlim, ylim, fx,
				pri, ppal, xscl, roto, true, colorkey);
		}
		getdxdy(tmpdx, tmpdy, yzt, yztofs, roto-256);
		yztofs++;
		iy++;
	}
}
template<copycolorproc ccp> void mRender(
	SDL_Rect dr, float rcx, float rcy, Reference img,
	uint32_t *ppal, SDL_Rect psrcr, float cx, float ty, SDL_Rect tile,
	float xtopscl, float xbotscl, float yscl, float rasterxadd,
	uint32_t roto, uint32_t colorkey, int rle, Reference *pluginbuf)
{
	roto &= 0x3ff;
	if(rle > 0){
		PcxRleImg pri;
		pri.setImg(img, psrcr.w, rle, pluginbuf);
		if(roto == 0){
			mzScreenBilt(
				mzlLoop<PcxRleImg, ccp>, dr, rcx, pri, ppal, psrcr,
				cx, ty, tile, xtopscl, xbotscl, yscl, rasterxadd, colorkey);
		}else{
			mzrScreenBilt(
				mzrlLoop<PcxRleImg, ccp>, rcx, rcy, pri, ppal, psrcr,
				cx, ty, xtopscl, yscl, roto, colorkey);
		}
	}else{
		PalletColorImg pri;
		pri.setImg(img, psrcr.w);
		if(roto == 0){
			mzScreenBilt(
				mzlLoop<PalletColorImg, ccp>, dr, rcx, pri, ppal, psrcr,
				cx, ty, tile, xtopscl, xbotscl, yscl, rasterxadd, colorkey);
		}else{
			mzrScreenBilt(
				mzrlLoop<PalletColorImg, ccp>, rcx, rcy, pri, ppal,
				psrcr, cx, ty, xtopscl, yscl, roto, colorkey);
		}
	}
}
int foobar(int n)
{
	if(n == 127 || n == 128) return 1;
	if(n == 63 || n == 64) return 2;
	if(n == 31 || n == 32) return 3;
	if(n == 15 || n == 16) return 4;
	if(n == 7 || n == 8) return 5;
	if(n == 3 || n == 4) return 6;
	if(n == 1 || n == 2) return 7;
	return 0;
}
TUserFunc(
	bool, RenderMugenZoom, Reference* pluginbuf, int32_t rle,
	float rcy, float rcx, SDL_Rect* pdstr, int32_t alpha,
	uint32_t roto, float rasterxadd, float yscl, float xbotscl, float xtopscl,
	SDL_Rect* tile, float ty, float cx, SDL_Rect* psrcr,
	uint16_t ckey, uint32_t* ppal, Reference img)
{
	SDL_Rect tl = *tile;
	if(tl.x > 0) tl.x -= psrcr->w;
	if(tl.y > 0) tl.y -= psrcr->h;
	if(tl.w == 0) tl.x = 0;
	if(tl.h == 0) tl.y = 0;
	if(
		img.len() == 0
		|| tl.x <= -(int)psrcr->w || tl.y <= -(int)psrcr->h
		|| _finite(cx+ty+rcx+rcy+xtopscl+xbotscl+yscl+rasterxadd) == 0
		|| abs(rcx) > 1.0e5f || abs(rcy) > 1.0e5f
		|| abs(cx) > 1.0e5f || abs(ty) > 1.0e5f
		|| abs(xtopscl) > 16383.0f || abs(xbotscl) > 16383.0f
		|| abs(yscl) > 16383.0f) return false;
	uint32_t pal[256];
	int i;
	pu->setSSZFunc();
	if(
		(
			127 <= alpha && alpha <= 254 && foobar(255 - alpha)
			&& (alpha |=  1 << 9 | (255 - alpha) << 10, true))
		|| (
			alpha >= 512 && (
				(alpha&0x3fc00) >> 10 == 0 || (alpha&0x3fc00) >> 10 == 255
				|| ((alpha&0xff) != 255 && foobar((alpha&0x3fc00) >> 10)))))
	{
		uint64_t tmps;
		for(i = 0; i < 256; i++){
			tmps =
				((uint64_t)(ppal[i]&0xff0000) << 16)
				| ((uint64_t)(ppal[i]&0xff00) << 8) | (uint64_t)(ppal[i]&0xff);
			tmps *= alpha&0xff;
			pal[i] =
				(uint32_t)((tmps&0xff0000000000L)>>24
				| (tmps&0xff000000L)>>16 | (tmps&0xff00L)>>8);
		}
		ppal = pal;
		if((alpha&0x3fc00) >> 10 == 0){
			alpha = 255;
		}else if((alpha&0x3fc00) >> 10 == 255){
			alpha = -1;
		}else{
			alpha = 255 | 1 << 9 | (alpha&0x3fc00);
		}
	}
	if(alpha == -1){
		mRender<mAddTrans>(
			*pdstr, rcx, rcy, img, ppal, *psrcr, cx, ty, tl,
			xtopscl, xbotscl, yscl, rasterxadd, roto, ckey, rle, pluginbuf);
	}else if(alpha == -2){
		mRender<mSubTrans>(
			*pdstr, rcx, rcy, img, ppal, *psrcr, cx, ty, tl,
			xtopscl, xbotscl, yscl, rasterxadd, roto, ckey, rle, pluginbuf);
	}else if(alpha <= 0){
	}else if(alpha < 255){
		uint32_t ck = ckey;
		ck |= (uint32_t)(alpha&0xff) << 16;
		ck |= (uint32_t)(256-alpha) << 24;
		mRender<mAlphaTrans>(
			*pdstr, rcx, rcy, img, ppal, *psrcr, cx, ty, tl,
			xtopscl, xbotscl, yscl, rasterxadd, roto, ck, rle, pluginbuf);
	}else if(alpha < 512){
		mRender<mTrans>(
			*pdstr, rcx, rcy, img, ppal, *psrcr, cx, ty, tl,
			xtopscl, xbotscl, yscl, rasterxadd, roto, ckey, rle, pluginbuf);
	}else{
		if((alpha&0xff) == 255 && foobar((alpha&0x3fc00) >> 10)){
			uint32_t ck = ckey;
			ck |= foobar((alpha&0x3fc00) >> 10) << 16;
			mRender<mAdd1Trans>(
				*pdstr, rcx, rcy, img, ppal, *psrcr, cx, ty, tl,
				xtopscl, xbotscl, yscl, rasterxadd, roto, ck, rle, pluginbuf);
		}else{
			uint32_t ck = ckey;
			ck |= (uint32_t)(alpha&0xff) << 16;
			ck |= (uint32_t)(alpha&0x3fc00) << 14;
			mRender<mAlphaTrans>(
				*pdstr, rcx, rcy, img, ppal, *psrcr, cx, ty, tl,
				xtopscl, xbotscl, yscl, rasterxadd, roto, ck, rle, pluginbuf);
		}
	}
	return true;
}


template<typename Img> void mzlShadowLoop(
	uint32_t* pdpx, Img& pri, uint32_t color, uint32_t alpha,
	int xsign, int ix, int dxend, int ifx, int ixcl, int sx)
{
	Img tmppri = pri;
	tmppri.skip(sx);
	if(
		xsign*dxend
		> xsign*((ifx + ((tmppri.width-1) - tmppri.currentx)*ixcl) >> 16))
	{
		if(sx != 0 && tmppri.currentx <= 0) return;
		if(-65536 <= ixcl && ixcl <= 65536){
			for(;;){
				int n = (int)(ix == ifx>>16) - 1 & xsign;
				if(n != 0 && tmppri.color != 0){
					mShadowTrans(pdpx[ix], color, alpha);
				}
				ix += n;
				tmppri.nextPixel();
				if(tmppri.currentx <= 0) return;
				ifx += ixcl;
			}
		}else{
			for(;;){
				if(ix == ifx>>16){
					tmppri.nextPixel();
					if(tmppri.currentx <= 0) return;
					ifx += ixcl;
				}
				if(tmppri.color != 0){
					mShadowTrans(pdpx[ix], color, alpha);
				}
				ix += xsign;
			}
		}
	}else{
		if(-65536 <= ixcl && ixcl <= 65536){
			for(;;){
				int n = (int)(ix == ifx>>16) - 1 & xsign;
				if(n != 0 && tmppri.color != 0){
					mShadowTrans(pdpx[ix], color, alpha);
				}
				if((ix += n) == dxend) return;
				tmppri.nextPixel();
				ifx += ixcl;
			}
		}else{
			for(;;){
				if(ix == ifx>>16){
					tmppri.nextPixel();
					ifx += ixcl;
				}
				if(tmppri.color != 0){
					mShadowTrans(pdpx[ix], color, alpha);
				}
				if((ix += xsign) == dxend) return;
			}
		}
	}
}
template<typename Img> void mzShadowLineBilt(
	typename Funcs<Img>::mzlslporc loop, uint32_t* pdpx, SDL_Rect& dr,
	float fx, Img& pri, uint32_t color, float xscl, uint32_t alpha)
{
	if(
		abs(fx) > 1.0e5f || abs(xscl) < 0.001f
		|| abs((float)pri.width * xscl) + (float)g_w > 32767.0f)
	{
		return;
	}
	int xsign = (xscl < 0.0f ? -1 : 1);
	int ix;
	int sx = 0;
	int dxend;
	if(xsign < 0){
		dxend = dr.x-1;
		ix = (int)floor(fx);
		if(ix > (int)dr.x+dr.w-1){
			ix = (int)dr.x+dr.w-1;
			float n = floor(((float)ix-floor(fx))/xscl);
			fx += n*xscl;
			if(floor(fx+xscl) > (float)ix){
				fx += xscl;
				n += 1.0f;
			}
			sx += (int)n;
			if(sx >= pri.width) return;
		}
	}else{
		dxend = dr.x+dr.w;
		ix = (int)floor(fx);
		if(ix < dr.x){
			ix = dr.x;
			float n = floor(((float)ix-floor(fx))/xscl);
			fx += n*xscl;
			if(floor(fx+xscl) < (float)ix){
				fx += xscl;
				n += 1.0f;
			}
			sx += (int)n;
			if(sx >= pri.width) return;
		}
	}
	if(xsign*ix >= xsign*dxend) return;
	fx += xscl;
	int ifx = (int)floor(fx*65536.0f);
	int ixcl = (int)(xscl*65536.0f);
	loop(pdpx, pri, color, alpha, xsign, ix, dxend, ifx, ixcl, sx);
}

template<int sign> void inclrxyShadow(
	int& rx, int& ry, const Zurashi* xzt, uint8_t xztofs, uint32_t roto,
	int vscl)
{
	int xp1 = (roto+256)>>9 & 1;
	int xmask = (int)(xp1 == 0) - 1;
	int yp1 = roto>>9 & 1;
	int ymask = (int)(yp1 == 0) - 1;
	int dx, dy;
	getdxdy(dx, dy, xzt, xztofs, roto);
	if((roto & 0x100) != 0){
		ry += sign*((dx^xmask) + xp1)*vscl;
		rx += sign*((dy^ymask) + yp1);
	}else{
		rx += sign*((dx^xmask) + xp1);
		ry += sign*((dy^ymask) + yp1)*vscl;
	}
}
template<typename Img> void mzrlShadowLoop(
	uint32_t* pdpx, int dstw, int rx, int ry, Img pri, uint32_t color,
	uint32_t roto, bool biltflg, uint32_t alpha, int rxsrt, int rxend,
	int rysrt, int ryend, int rxlimmask, int rylimmask, int ifx,
	int ixcl, int ivcl)
{
	const Zurashi* xzt =
		RotoZurasiTable[(roto&0x80) == 0 ? roto & 0x7f : 128 - (roto & 0x7f)];
	uint8_t xztofs = 0;
	int ix = ifx>>16;
	ifx += ixcl;
	int tx = 1;
	if(ixcl > 0){
		if(ixcl < 65536){
			for(;;){
				if(ix >= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
						&& (ry>>16^rylimmask)+(rylimmask&1) >= rysrt)
					{
						break;
					}
					xztofs++;
					inclrxyShadow<1>(rx, ry, xzt, xztofs, roto, ivcl);
					ix++;
				}
			}
			for(;;){
				if(ix >= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
						|| (ry>>16^rylimmask)+(rylimmask&1) >= ryend)
					{
						return;
					}
					if(
						pri.color != 0 && abs(ry - ((ry>>16)<<16)) <= abs(ivcl)
						&& (
							biltflg
							|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
						&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
					{
						mShadowTrans(pdpx[rx + (ry>>16)*dstw], color, alpha);
					}
					xztofs++;
					inclrxyShadow<1>(rx, ry, xzt, xztofs, roto, ivcl);
					ix++;
				}
			}
		}else{
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
					&& (ry>>16^rylimmask)+(rylimmask&1) >= rysrt)
				{
					break;
				}
				xztofs++;
				inclrxyShadow<1>(rx, ry, xzt, xztofs, roto, ivcl);
				if(++ix >= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
					|| (ry>>16^rylimmask)+(rylimmask&1) >= ryend)
				{
					return;
				}
				if(
					pri.color != 0 && abs(ry - ((ry>>16)<<16)) <= abs(ivcl)
					&& (
						biltflg
						|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
					&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
				{
					mShadowTrans(pdpx[rx + (ry>>16)*dstw], color, alpha);
				}
				xztofs++;
				inclrxyShadow<1>(rx, ry, xzt, xztofs, roto, ivcl);
				if(++ix >= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
		}
	}else{
		if(ixcl > -65536){
			for(;;){
				if(ix <= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
						&& (ry>>16^rylimmask)+(rylimmask&1) >= rysrt)
					{
						break;
					}
					xztofs--;
					inclrxyShadow<-1>(rx, ry, xzt, xztofs, roto, ivcl);
					ix--;
				}
			}
			for(;;){
				if(ix <= ifx>>16 && tx > 0){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}else{
					if(
						tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
						|| (ry>>16^rylimmask)+(rylimmask&1) >= ryend)
					{
						return;
					}
					xztofs--;
					if(
						pri.color != 0 && abs(ry - ((ry>>16)<<16)) <= abs(ivcl)
						&& (
							biltflg
							|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
						&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
					{
						mShadowTrans(pdpx[rx + (ry>>16)*dstw], color, alpha);
					}
					inclrxyShadow<-1>(rx, ry, xzt, xztofs, roto, ivcl);
					ix--;
				}
			}
		}else{
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxsrt
					&& (ry>>16^rylimmask)+(rylimmask&1) >= rysrt)
				{
					break;
				}
				xztofs--;
				inclrxyShadow<-1>(rx, ry, xzt, xztofs, roto, ivcl);
				if(--ix <= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
			for(;;){
				if(
					tx <= 0 || (rx^rxlimmask)+(rxlimmask&1) >= rxend
					|| (ry>>16^rylimmask)+(rylimmask&1) >= ryend)
				{
					return;
				}
				xztofs--;
				if(
					pri.color != 0 && abs(ry - ((ry>>16)<<16)) <= abs(ivcl)
					&& (
						biltflg
						|| (xzt[xztofs].dy == 0) == (xzt[xztofs].dx == 0))
					&& (xzt[xztofs].dy != 0 || xzt[xztofs].dx != 0))
				{
					mShadowTrans(pdpx[rx + (ry>>16)*dstw], color, alpha);
				}
				inclrxyShadow<-1>(rx, ry, xzt, xztofs, roto, ivcl);
				if(--ix <= ifx>>16){
					pri.nextPixel();
					tx = pri.currentx;
					ifx += ixcl;
				}
			}
		}
	}
}
template<typename Img> void mzrShadowLineBilt(
	typename Funcs<Img>::mrlslporc loop, uint32_t* pdpx, int dstw,
	int rx, int ry, int xlim, int ylim, float fx, Img& pri, uint32_t color,
	float xscl, float vscl, uint32_t roto, bool biltflg, uint32_t alpha)
{
	if(abs(fx) > 16383.0f) return;
	int rxsrt, rxend, rysrt, ryend;
	int rxlimmask, rylimmask;
	if(xscl < 0.0f){
		if(roto < 256){
			if(roto == 0 && ry < 0) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}else if(roto < 512){
			if(roto == 256 && rx < 0) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}else if(roto < 768){
			if(roto == 512 && ry>>16 >= ylim) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}else{
			if(roto == 768 && rx >= xlim) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}
	}else{
		if(roto < 256){
			if(roto == 0 && ry>>16 >= ylim) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}else if(roto < 512){
			if(roto == 256 && rx >= xlim) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = -ylim+1; ryend = 1;    rylimmask = -1;
		}else if(roto < 768){
			if(roto == 512 && ry < 0) return;
			rxsrt = -xlim+1; rxend = 1;    rxlimmask = -1;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}else{
			if(roto == 768 && rx < 0) return;
			rxsrt = 0;       rxend = xlim; rxlimmask = 0;
			rysrt = 0;       ryend = ylim; rylimmask = 0;
		}
	}
	int ifx = (int)floor(fx*65536.0f);
	int ixcl = (int)(xscl*65536.0f);
	int ivcl = (int)(vscl*65536.0f);
	loop(
		pdpx, dstw, rx, ry, pri, color, roto, biltflg, alpha,
		rxsrt, rxend, rysrt, ryend, rxlimmask, rylimmask, ifx, ixcl, ivcl);
}

template<typename Img> void mzShadowScreenBilt(
	typename Funcs<Img>::mzlslporc loop, SDL_Rect& dr,
	Img pri, uint32_t color, SDL_Rect& srcr,
	float fx, float fy, float xscl, float yscl, uint32_t alpha)
{
	if(abs(yscl) < 0.001f) return;
	if(dr.x < 0){
		dr.w += dr.x;
		dr.x = 0;
	}
	if((int)dr.x+dr.w > g_w) dr.w -= dr.x+dr.w - g_w;
	if((int16_t)dr.w <= 0) return;
	if(dr.y < 0){
		dr.h += dr.y;
		dr.y = 0;
	}
	if((int)dr.y+dr.h > g_h) dr.h -= dr.y+dr.h - g_h;
	if((int16_t)dr.h <= 0) return;
	int dstw = g_pitch / sizeof(uint32_t);
	int ysign = yscl < 0.0f ? -1 : 1;
	fy += yscl < 0.0f ? -0.5f : 0.5f;
	fx += xscl < 0.0f ? -0.5f : 0.5f;
	int iy = (int)floor(fy);
	if((iy < dr.y && ysign < 0) || (iy >= dr.h && ysign > 0)) return;
	while(iy < dr.y || iy >= dr.h){
		pri.nextLine();
		if(pri.currenty >= srcr.h || pri.finished()) return;
		fy += yscl;
		iy = (int)floor(fy);
	}
	uint32_t* pdpx = g_pix + dstw*iy;
	fy += yscl;
	while(iy >= dr.y && iy < dr.h){
		while(iy == (int)floor(fy)){
			pri.nextLine();
			if(pri.currenty >= srcr.h || pri.finished()) return;
			fy += yscl;
		}
		mzShadowLineBilt(loop, pdpx, dr, fx, pri, color, xscl, alpha);
		iy += ysign;
		pdpx = g_pix + iy*dstw;
	}
}
template<typename Img> void mzrShadowScreenBilt(
	typename Funcs<Img>::mrlslporc loop, float rcx,
	float rcy, Img& pri, uint32_t color, SDL_Rect& srcr, float fx, float fy,
	float xscl, float yscl, float vscl, uint32_t roto, uint32_t alpha)
{
	if(vscl < 0.0f){
		vscl *= -1;
		yscl *= -1;
		roto = (0 - roto) & 0x3ff;
	}
	if(yscl < 0.0f){
		xscl *= -1.0f;
		yscl *= -1.0f;
		roto = roto + 512 & 0x3ff;
	}
	const Zurashi* yzt =
		RotoZurasiTable[
			(roto-256 & 0x80) == 0
			? roto-256 & 0x7f : 128 - (roto-256 & 0x7f)];
	uint8_t yztofs = 0;
	uint32_t* pdpx = g_pix;
	int dstw = g_pitch / sizeof(uint32_t);
	int xlim = g_w;
	int ylim = g_h;
	float tmpx = fx = rcx + (xscl < 0.0f ? fx : -fx);
	float tmpy = rcy - fy*vscl;
	fy = rcy - fy;
	kaiten(tmpx, tmpy, -((float)PI*(float)roto/512.0f), rcx, rcy, vscl);
	int rx = (int)floor(tmpx + 0.5f), ry = (int)floor(tmpy*65536 + 0.5f);
	bool kakudoToKa = (int32_t)((roto-256)<<(31-8))>>31 == 0;
	int xmul = (roto>>9 & 1) == 0 ? 1 : -1;
	int ymul = ((roto-256)>>9 & 1) == 0 ? 1 : -1;
	int ivscl = (int)(vscl*65536);
	fx += xscl < 0.0 ? -0.5f : 0.5f;
	fy += 0.5f;
	int iy = (int)floor(fy);
	fy += yscl;
	int tmpdx = 0, tmpdy = 1;
	if(kakudoToKa){
		ry -= tmpdy*ymul * ivscl;
	}else{
		rx -= tmpdy*ymul;
	}
	for(;;){
		while(iy == (int)floor(fy)){
			pri.nextLine();
			if(pri.currenty >= srcr.h || pri.finished()) return;
			fy += yscl;
		}
		if(tmpdx != 0){
			if(kakudoToKa){
				rx += tmpdx*xmul;
			}else{
				ry += tmpdx*xmul * ivscl;
			}
			mzrShadowLineBilt(
				loop, pdpx, dstw, rx, ry, xlim, ylim, fx,
				pri, color, xscl, vscl, roto, tmpdy == 0, alpha);
		}
		if(tmpdy != 0){
			if(kakudoToKa){
				ry += tmpdy*ymul * ivscl;
			}else{
				rx += tmpdy*ymul;
			}
			mzrShadowLineBilt(
				loop, pdpx, dstw, rx, ry, xlim, ylim, fx,
				pri, color, xscl, vscl, roto, true, alpha);
		}
		getdxdy(tmpdx, tmpdy, yzt, yztofs, roto-256);
		yztofs++;
		iy++;
	}
}
void mShadowRender(
	SDL_Rect dr, float rcx, float rcy, Reference img,
	uint32_t color, SDL_Rect srcr, float cx, float ty,
	float xscl, float yscl, float vscl,
	uint32_t roto, uint32_t alpha, int rle, Reference* pluginbuf)
{
	roto &= 0x3ff;
	alpha = 256 - alpha;
	if(roto == 0){
		if(xscl >= 0) cx = -cx;
		cx += rcx;
		if(yscl*vscl >= 0) ty = -ty;
		ty = rcy + ty * abs(vscl);
	}
	if(rle > 0){
		PcxRleImg pri;
		pri.setImg(img, srcr.w, rle, pluginbuf);
		if(roto == 0){
			mzShadowScreenBilt(
				mzlShadowLoop<PcxRleImg>, dr, pri, color,
				srcr, cx, ty, xscl, yscl*vscl, alpha);
		}else{
			mzrShadowScreenBilt(
				mzrlShadowLoop<PcxRleImg>, rcx, rcy, pri, color,
				srcr, cx, ty, xscl, yscl, vscl, roto, alpha);
		}
	}else{
		PalletColorImg pri;
		pri.setImg(img, srcr.w);
		if(roto == 0){
			mzShadowScreenBilt(
				mzlShadowLoop<PalletColorImg>, dr, pri,
				color, srcr, cx, ty, xscl, yscl*vscl, alpha);
		}else{
			mzrShadowScreenBilt(
				mzrlShadowLoop<PalletColorImg>, rcx, rcy, pri,
				color, srcr, cx, ty, xscl, yscl, vscl, roto, alpha);
		}
	}
}
TUserFunc(
	bool, RenderMugenShadow, Reference* pluginbuf, int32_t rle,
	float rcy, float rcx, SDL_Rect* pdstr, int32_t alpha,
	uint32_t roto, float vscl, float yscl, float xscl,
	float ty, float cx, SDL_Rect* psrcr, uint32_t color, Reference img)
{
	if(
		img.len() == 0
		|| _finite(cx+ty+rcx+rcy+xscl+vscl+yscl) == 0
		|| abs(rcx) > 1.0e5f || abs(rcy) > 1.0e5f
		|| abs(cx) > 1.0e5f || abs(ty) > 1.0e5f
		|| abs(xscl) > 16383.0f
		|| abs(yscl) > 16383.0f || abs(vscl) > 16383.0f) return false;
	mShadowRender(
		*pdstr, rcx, rcy, img, color, *psrcr, cx, ty,
		xscl, yscl, vscl, roto, alpha, rle, pluginbuf);
	return true;
}

TUserFunc(uint32_t, Load8bitTexture, int32_t h, int32_t w, uint8_t* ppxl)
{
	uint32_t texid;
	glGenTextures(1, &texid);
	glBindTexture(GL_TEXTURE_2D, texid);
	glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
	glTexImage2D(
		GL_TEXTURE_2D, 0, GL_LUMINANCE,
		w, h, 0, GL_LUMINANCE, GL_UNSIGNED_BYTE, ppxl);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	return texid;
}

TUserFunc(uint32_t, LoadPngTexture, FILE* fp, int32_t* h, int32_t* w)
{
	*w = *h = 0;
	if(!fp) return 0;
	uint8_t header[8] = {0};
	fread(header, 1, 8, fp);
	if(png_sig_cmp(header, 0, 8)) return 0;
	auto png_ptr =
		png_create_read_struct(
			PNG_LIBPNG_VER_STRING, nullptr, nullptr, nullptr);
	if(!png_ptr) return 0;
	auto info_ptr = png_create_info_struct(png_ptr);
	if(!info_ptr){
		png_destroy_read_struct(&png_ptr, nullptr, nullptr);
		return 0;
	}
	png_init_io(png_ptr, fp);
	png_set_sig_bytes(png_ptr, 8);
	png_read_info(png_ptr, info_ptr);
	png_uint_32 width, height;
	int bit_depth, color_type;
	uint32_t texid = 0;
	if(
		png_get_IHDR(
			png_ptr, info_ptr, &width, &height, &bit_depth, &color_type,
			nullptr, nullptr, nullptr))
	{
		if(bit_depth > 8) png_set_strip_16(png_ptr);
		png_set_expand(png_ptr);
		if((color_type & PNG_COLOR_MASK_ALPHA) == 0){
			png_set_add_alpha(png_ptr, 0xFF, PNG_FILLER_AFTER);
		}
		*w = width;
		*h = height;
		auto buff = new png_byte[width * height * 4];
		auto p = buff;
		auto pp = new png_bytep[height];
		for(int i = height-1; i >= 0; i--) pp[i] = p + width*i*4;
		png_read_image(png_ptr, pp);
		delete [] pp;
		glGenTextures(1, &texid);
		glBindTexture(GL_TEXTURE_2D, texid);
		glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
		glTexImage2D(
			GL_TEXTURE_2D, 0, GL_RGBA,
			width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, buff);
		delete [] buff;
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
	}
	png_destroy_read_struct(&png_ptr, &info_ptr, nullptr);
	return texid;
}

TUserFunc(void, DeleteGlTexture, uint32_t texid)
{
	if(texid != 0) glDeleteTextures(1, &texid);
}

TUserFunc(void, GlSwapBuffers)
{
	SDL_GL_SwapWindow(g_window);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

TUserFunc(bool, InitMugenGl)
{
	const GLchar* vertShader =
		"void main(void){"
			"gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;"
			"gl_Position = ftransform();"
		"}";
	const GLchar* fragShader =
		"uniform float a;"
		"uniform sampler2D tex;"
		"uniform sampler1D pal;"
		"uniform int msk;"
		"void main(void){"
		"float r = texture2D(tex, gl_TexCoord[0].st).r;"
		"vec4 c;"
		"gl_FragColor ="
		"int(255.0*r) == msk ? vec4(0.0)"
		": (c = texture1D(pal, r*0.9961), vec4(c.b, c.g, c.r, a));"
		"}";
	const GLchar* fragShaderFc =
		"uniform float a;"
		"uniform sampler2D tex;"
		"uniform bool neg;"
		"uniform float gray;"
		"uniform vec3 add;"
		"uniform vec3 mul;"
		"void main(void){"
		"vec4 c = texture2D(tex, gl_TexCoord[0].st);"
		"if(neg) c.rgb = vec3(1.0) - c.rgb;"
		"c.rgb += (vec3((c.r + c.g + c.b) / 3.0) - c.rgb) * gray + add;"
		"c.rgb *= mul;"
		"c.a *= a;"
		"gl_FragColor = c;"
		"}";
	const GLchar* fragShaderFcS =
		"uniform float a;"
		"uniform sampler2D tex;"
		"uniform vec3 color;"
		"void main(void){"
		"vec4 c = texture2D(tex, gl_TexCoord[0].st);"
		"c.rgb = color * c.a;"
		"c.a *= a;"
		"gl_FragColor = c;"
		"}";
	if(
		!GLEW_ARB_shader_objects || !GLEW_ARB_vertex_shader
		|| !GLEW_ARB_fragment_shader
		|| g_mugenshader != 0 || g_mugenshaderFc != 0 || g_mugenshaderFcS != 0)
	{
		return false;
	}
	g_mugenshader = glCreateProgramObjectARB();
	g_mugenshaderFc = glCreateProgramObjectARB();
	g_mugenshaderFcS = glCreateProgramObjectARB();
	GLhandleARB hVertShaderObject = glCreateShaderObjectARB(GL_VERTEX_SHADER);
	GLhandleARB hFragShaderObject =
		glCreateShaderObjectARB(GL_FRAGMENT_SHADER);
	int vert_compiled = 0;
	int frag_compiled = 0;
	int linked = 0;
	GLint length;
	length = strlen((char*)vertShader);
	glShaderSourceARB(
		hVertShaderObject, 1, (const GLchar**)&vertShader, &length);
	glCompileShaderARB(hVertShaderObject);
	glGetObjectParameterivARB(
		hVertShaderObject, GL_OBJECT_COMPILE_STATUS_ARB, &vert_compiled);
	if(vert_compiled == 0) goto fail;

	length = strlen((char*)fragShader);
	glShaderSourceARB(
		hFragShaderObject, 1, (const GLchar**)&fragShader, &length);
	glCompileShaderARB(hFragShaderObject);
	glGetObjectParameterivARB(
		hFragShaderObject, GL_OBJECT_COMPILE_STATUS_ARB, &frag_compiled);
	if(frag_compiled == 0) goto fail;
	glAttachObjectARB(g_mugenshader, hVertShaderObject);
	glAttachObjectARB(g_mugenshader, hFragShaderObject);
	glLinkProgramARB(g_mugenshader);
	glGetObjectParameterivARB(
		g_mugenshader, GL_OBJECT_LINK_STATUS_ARB, &linked);
	if(linked == 0) goto fail;
	g_uniformPal = glGetUniformLocationARB(g_mugenshader, "pal");
	g_uniformMsk = glGetUniformLocationARB(g_mugenshader, "msk");

	glDeleteObjectARB(hFragShaderObject);
	hFragShaderObject =
		glCreateShaderObjectARB(GL_FRAGMENT_SHADER);
	length = strlen((char*)fragShaderFc);
	glShaderSourceARB(
		hFragShaderObject, 1, (const GLchar**)&fragShaderFc, &length);
	glCompileShaderARB(hFragShaderObject);
	glGetObjectParameterivARB(
		hFragShaderObject, GL_OBJECT_COMPILE_STATUS_ARB, &frag_compiled);
	if(frag_compiled == 0) goto fail;
	glAttachObjectARB(g_mugenshaderFc, hVertShaderObject);
	glAttachObjectARB(g_mugenshaderFc, hFragShaderObject);
	glLinkProgramARB(g_mugenshaderFc);
	glGetObjectParameterivARB(
		g_mugenshaderFc, GL_OBJECT_LINK_STATUS_ARB, &linked);
	if(linked == 0) goto fail;
	g_uniformNeg = glGetUniformLocationARB(g_mugenshaderFc, "neg");
	g_uniformGray = glGetUniformLocationARB(g_mugenshaderFc, "gray");
	g_uniformAdd = glGetUniformLocationARB(g_mugenshaderFc, "add");
	g_uniformMul = glGetUniformLocationARB(g_mugenshaderFc, "mul");

	glDeleteObjectARB(hFragShaderObject);
	hFragShaderObject =
		glCreateShaderObjectARB(GL_FRAGMENT_SHADER);
	length = strlen((char*)fragShaderFcS);
	glShaderSourceARB(
		hFragShaderObject, 1, (const GLchar**)&fragShaderFcS, &length);
	glCompileShaderARB(hFragShaderObject);
	glGetObjectParameterivARB(
		hFragShaderObject, GL_OBJECT_COMPILE_STATUS_ARB, &frag_compiled);
	if(frag_compiled == 0) goto fail;
	glAttachObjectARB(g_mugenshaderFcS, hVertShaderObject);
	glAttachObjectARB(g_mugenshaderFcS, hFragShaderObject);
	glLinkProgramARB(g_mugenshaderFcS);
	glGetObjectParameterivARB(
		g_mugenshaderFcS, GL_OBJECT_LINK_STATUS_ARB, &linked);
	if(linked == 0) goto fail;
	g_uniformColor = glGetUniformLocationARB(g_mugenshaderFcS, "color");

	glDeleteObjectARB(hVertShaderObject);
	glDeleteObjectARB(hFragShaderObject);
	return true;

fail:
	glDeleteObjectARB(g_mugenshader);
	glDeleteObjectARB(g_mugenshaderFc);
	glDeleteObjectARB(g_mugenshaderFcS);
	g_mugenshader = g_mugenshaderFc = g_mugenshaderFcS = 0;
	glDeleteObjectARB(hVertShaderObject);
	glDeleteObjectARB(hFragShaderObject);
	return false;
}

void drawQuads(
	float x1, float y1, float x2, float y2, float x3, float y3,
	float x4, float y4, float r, float g, float b, float a, float pers)
{
	glColor4f(r, g, b, a);
	glBegin(GL_TRIANGLE_STRIP);
	glTexCoord2f(0, 1);
	glVertex2f(x1, y1);
	glTexCoord2f(0, 0);
	glVertex2f(x4, y4);
	int n =
		(int)(
			(
				pers > 1.0
				? (1-1/(pers*pers))*abs(x3-x4) : (1-(pers*pers))*abs(x1-x2))
			* (g_h>>5) / (abs(y1-y4) + (g_h>>5)));
	for(int i = 1; i < n; i++){
		glTexCoord2f((float)i/n, 1);
		glVertex2f(x1 + (x2 - x1)*i/n, y1 + (y2 - y1)*i/n);
		glTexCoord2f((float)i/n, 0);
		glVertex2f(x4 + (x3 - x4)*i/n, y4 + (y3 - y4)*i/n);
	}
	glTexCoord2f(1, 1);
	glVertex2f(x2, y2);
	glTexCoord2f(1, 0);
	glVertex2f(x3, y3);
	glEnd();
}

void drawTileHolizon(
	float x1, float y1, float x2, float y2, float x3, float y3,
	float x4, float y4, float xtw, float xbw,
	float xtopscl, float xbotscl, SDL_Rect tile, float rcx,
	float r, float g, float b, float a, float pers)
{
	float topbtwn = xtw + xtopscl*(float)tile.x;
	float db =
		((xbw + xbotscl*(float)tile.x) - topbtwn) * (rcx - x4) / abs(topbtwn);
	x1 -= db;
	x2 -= db;
	if(tile.w == 1){
		float x1d=x1, x2d=x2, x3d=x3, x4d=x4;
		for(;;){
			x2d = x1d - xbotscl*(float)tile.x;
			x3d = x4d - xtopscl*(float)tile.x;
			x4d = x3d - xtw;
			x1d = x2d - xbw;
			if(abs(topbtwn) < 0.01) break;
			if(topbtwn < 0){
				if(
					x1d >= (float)g_w && x2d >= (float)g_w
					&& x3d >= (float)g_w && x4d >= (float)g_w) break;
			}else{
				if(x1d <= 0.0 && x2d <= 0.0 && x3d <= 0.0 && x4d <= 0.0) break;
			}
			if(
				(
					(0.0 < x1d || 0.0 < x2d)
					&& (x1d < (float)g_w || x2d < (float)g_w))
				|| (
					(0.0 < x3d || 0.0 < x4d)
					&& (x3d < (float)g_w || x4d < (float)g_w)))
			{
				drawQuads(
					x1d, y1, x2d, y2, x3d, y3, x4d, y4, r, g, b, a, pers);
			}
		}
	}
	int n = tile.w;
	for(;;){
		if(topbtwn > 0){
			if(
				x1 >= (float)g_w && x2 >= (float)g_w
				&& x3 >= (float)g_w && x4 >= (float)g_w) break;
		}else{
			if(x1 <= 0.0 && x2 <= 0.0 && x3 <= 0.0 && x4 <= 0.0) break;
		}
		if(
			((0.0 < x1 || 0.0 < x2) && (x1 < (float)g_w || x2 < (float)g_w))
			|| (
				(0.0 < x3 || 0.0 < x4)
				&& (x3 < (float)g_w || x4 < (float)g_w)))
		{
			drawQuads(x1, y1, x2, y2, x3, y3, x4, y4, r, g, b, a, pers);
		}
		if(tile.w != 1 && n != 0) n--;
		if(n == 0) break;
		x4 = x3 + xtopscl*(float)tile.x;
		x1 = x2 + xbotscl*(float)tile.x;
		x2 = x1 + xbw;
		x3 = x4 + xtw;
		if(abs(topbtwn) < 0.01) break;
	}
}
void drawTile(
	uint16_t w, uint16_t h, float x, float y,
	SDL_Rect tile, float xtopscl, float xbotscl,  float yscl, float vscl,
	float rasterxadd, float angle, float rcx, float rcy,
	float r, float g, float b, float a)
{
	float x1, y1, x2, y2, x3, y3, x4, y4;
	x1 = x + rasterxadd*yscl*(float)h;
	y1 = rcy + ((y - yscl*(float)h) - rcy) * vscl;
	x2 = x1 + xbotscl*(float)w;
	y2 = y1;
	x3 = x + xtopscl*(float)w;
	y3 = rcy + (y - rcy) * vscl;
	x4 = x;
	y4 = y3;
	float pers = abs(x3 - x4) / abs(x2 - x1);
	if(angle != 0.0f){
		kaiten(x1, y1, angle, rcx, rcy, vscl);
		kaiten(x2, y2, angle, rcx, rcy, vscl);
		kaiten(x3, y3, angle, rcx, rcy, vscl);
		kaiten(x4, y4, angle, rcx, rcy, vscl);
		drawQuads(x1, y1, x2, y2, x3, y3, x4, y4, r, g, b, a, pers);
	}else{
		if(tile.h == 1){
			float x1d=x1, y1d=y1, x2d=x2, y2d=y2, x3d=x3;
			float y3d=y3, x4d=x4, y4d=y4;
			for(;;){
				x1d = x4d;
				y1d = y4d + yscl*vscl*(float)tile.y;
				x2d = x3d;
				y2d = y1d;
				x3d =
					(x4d - rasterxadd*yscl*(float)h)
					+ (xtopscl/xbotscl)*(x3d - x4d);
				y3d = y2d + yscl*vscl*(float)h;
				x4d = x4d - rasterxadd*yscl*(float)h;
				if(abs(y3d - y4d) < 0.01) break;
				y4d = y3d;
				if(yscl*((float)h + (float)tile.y) < 0){
					if(y1d <= (float)-g_h && y4d <= (float)-g_h) break;
				}else{
					if(y1d >= 0.0 && y4d >= 0.0) break;
				}
				if(
					((0.0 > y1d || 0.0 > y4d)
					&& (y1d > (float)-g_h || y4d > (float)-g_h)))
				{
					drawTileHolizon(
						x1d, y1d, x2d, y2d, x3d, y3d, x4d, y4d,
						x3d-x4d, x2d-x1d, (x3d-x4d)/(float)w,
						(x2d-x1d)/(float)w, tile, rcx, r, g, b, a, pers);
				}
			}
		}
		int n = tile.h;
		for(;;){
			if(yscl*((float)h + (float)tile.y) > 0){
				if(y1 <= (float)-g_h && y4 <= (float)-g_h) break;
			}else{
				if(y1 >= 0.0 && y4 >= 0.0) break;
			}
			if(
				((0.0 > y1 || 0.0 > y4)
				&& (y1 > (float)-g_h || y4 > (float)-g_h)))
			{
				drawTileHolizon(
					x1, y1, x2, y2, x3, y3, x4, y4, x3-x4, x2-x1,
					(x3-x4)/(float)w, (x2-x1)/(float)w,
					tile, rcx, r, g, b, a, pers);
			}
			if(tile.h != 1 && n != 0) n--;
			if(n == 0) break;
			x4 = x1;
			y4 = y1 - yscl*vscl*(float)tile.y;
			x3 = x2;
			y3 = y4;
			x2 = x1 + rasterxadd*yscl*(float)h + (xbotscl/xtopscl)*(x2 - x1);
			y2 = y3 - yscl*vscl*(float)h;
			x1 = x1 + rasterxadd*yscl*(float)h;
			if(abs(y1 - y2) < 0.01) break;
			y1 = y2;
		}
	}
}

void renderMugenGl(
	float rcy, float rcx, int alpha, float angle, float rasterxadd,
	float vscl, float yscl, float xbotscl, float xtopscl, const SDL_Rect& tl,
	float y, float x, const SDL_Rect& r, GLhandleARB shader)
{
	glMatrixMode(GL_PROJECTION);
	glPushMatrix();
	glLoadIdentity();
	glOrtho(0, g_w, 0, g_h, -1, 1);
	glMatrixMode(GL_MODELVIEW);
	glPushMatrix();
	glTranslated(0, g_h, 0);
	if (shader == g_mugenshaderFc) {
		drawQuads(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
	}
	if(alpha == -1){
		glUniform1fARB(glGetUniformLocation(shader, "a"), 1.0);
		glBlendFunc(GL_SRC_ALPHA, GL_ONE);
		drawTile(
			r.w, r.h, x, y, tl, xtopscl, xbotscl, yscl, vscl, rasterxadd,
			angle, rcx, rcy, 1, 1, 1, 1);
	}else if(alpha == -2){
		glUniform1fARB(glGetUniformLocation(shader, "a"), 1.0);
		glBlendFunc(GL_ZERO, GL_ONE_MINUS_SRC_COLOR);
		drawTile(
			r.w, r.h, x, y, tl, xtopscl, xbotscl, yscl, vscl, rasterxadd,
			angle, rcx, rcy, 1, 1, 1, 1);
	}else if(alpha <= 0){
	}else if(alpha < 255){
		glUniform1fARB(
			glGetUniformLocation(shader, "a"),
			(GLfloat)alpha / 255.0f);
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
		drawTile(
			r.w, r.h, x, y, tl, xtopscl, xbotscl, yscl, vscl, rasterxadd,
			angle, rcx, rcy, 1, 1, 1, (GLfloat)alpha / 255.0f);
	}else if(alpha < 512){
		glUniform1fARB(glGetUniformLocation(shader, "a"), 1.0);
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
		drawTile(
			r.w, r.h, x, y, tl, xtopscl, xbotscl, yscl, vscl, rasterxadd,
			angle, rcx, rcy, 1, 1, 1, 1);
	}else{
		int src = alpha & 0xff;
		int dst = (alpha & 0x3fc00) >> 10;
		if(dst < 255){
			glUniform1fARB(
				glGetUniformLocation(shader, "a"),
				1.0f - (GLfloat)dst / 255.0f);
			glBlendFunc(GL_ZERO, GL_ONE_MINUS_SRC_ALPHA);
			drawTile(
				r.w, r.h, x, y, tl, xtopscl, xbotscl, yscl, vscl, rasterxadd,
				angle, rcx, rcy, 1, 1, 1, 1.0f - (GLfloat)dst / 255.0f);
		}
		if(src > 0){
			glUniform1fARB(
				glGetUniformLocation(shader, "a"), (GLfloat)src / 255.0f);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE);
			drawTile(
				r.w, r.h, x, y, tl, xtopscl, xbotscl, yscl, vscl, rasterxadd,
				angle, rcx, rcy, 1, 1, 1, (GLfloat)src / 255.0f);
		}
	}
	glPopMatrix();
	glMatrixMode(GL_PROJECTION);
	glPopMatrix();
}

TUserFunc(
	bool, RenderMugenGl, float rcy, float rcx, SDL_Rect* dstr, int alpha,
	float angle, float rasterxadd, float vscl, float yscl,
	float xbotscl, float xtopscl, SDL_Rect* tile, float y, float x,
	SDL_Rect* rect, int mask, uint8_t* ppal, uint32_t texid)
{
	if(
		texid == 0
		|| _finite(
			x+y+rcx+rcy+xtopscl+xbotscl+yscl+vscl+rasterxadd+angle) == 0)
	{
		return false;
	}
	if(vscl < 0.0f){
		vscl *= -1;
		yscl *= -1;
		angle *= -1;
	}
	SDL_Rect r = *rect, tl = *tile;
	if(tl.x > 0) tl.x -= r.w;
	if(tl.y > 0) tl.y -= r.h;
	if(tl.w == 0) tl.x = 0;
	if(tl.h == 0) tl.y = 0;
	if(xtopscl >= 0) x = -x;
	x += rcx;
	rcy = -rcy;
	if(yscl < 0) y = -y;
	y += rcy;
	glUseProgramObjectARB(g_mugenshader);
	glUniform1iARB(g_uniformPal, 1);
	glUniform1iARB(g_uniformMsk, mask);
	glEnable(GL_TEXTURE_1D);
	glEnable(GL_TEXTURE_2D);
	glDisable(GL_DEPTH_TEST);
	glEnable(GL_SCISSOR_TEST);
	glScissor(dstr->x, g_h - (dstr->y+dstr->h), dstr->w, dstr->h);
	//
	glActiveTexture(GL_TEXTURE1);
	if (ppal) {
		if(g_paltex) glDeleteTextures(1, &g_paltex);
		glGenTextures(1, &g_paltex);
		glBindTexture(GL_TEXTURE_1D, g_paltex);
		glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
		glTexImage1D(
			GL_TEXTURE_1D, 0, GL_RGBA, 256, 0, GL_RGBA, GL_UNSIGNED_BYTE, ppal);
		glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_1D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	}
	else {
		glBindTexture(GL_TEXTURE_1D, g_paltex);
	}
	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texid);
	renderMugenGl(
		rcy, rcx, alpha, angle, rasterxadd, vscl, yscl, xbotscl, xtopscl,
		tl, y, x, r, g_mugenshader);
	//
	glDisable(GL_SCISSOR_TEST);
	glDisable(GL_TEXTURE_2D);
	glDisable(GL_TEXTURE_1D);
	glUseProgramObjectARB(0);
	return true;
}

TUserFunc(
	bool, RenderMugenGlFc, float mulb, float mulg, float mulr,
	float addb, float addg, float addr, float color, bool neg,
	float rcy, float rcx, SDL_Rect* dstr, int alpha,
	float angle, float rasterxadd, float vscl, float yscl,
	float xbotscl, float xtopscl, SDL_Rect* tile, float y, float x,
	SDL_Rect* rect, uint32_t texid)
{
	if(
		texid == 0
		|| _finite(
			x+y+rcx+rcy+xtopscl+xbotscl+yscl+vscl+rasterxadd+angle) == 0)
	{
		return false;
	}
	if(vscl < 0.0f){
		vscl *= -1;
		yscl *= -1;
		angle *= -1;
	}
	SDL_Rect r = *rect, tl = *tile;
	if(tl.x > 0) tl.x -= r.w;
	if(tl.y > 0) tl.y -= r.h;
	if(tl.w == 0) tl.x = 0;
	if(tl.h == 0) tl.y = 0;
	if(xtopscl >= 0) x = -x;
	x += rcx;
	rcy = -rcy;
	if(yscl < 0) y = -y;
	y += rcy;
	glUseProgramObjectARB(g_mugenshaderFc);
	glUniform1iARB(g_uniformNeg, neg);
	glUniform1fARB(g_uniformGray, 1 - color);
	glUniform3fARB(g_uniformAdd, addr, addg, addb);
	glUniform3fARB(g_uniformMul, mulr, mulg, mulb);
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texid);
	glDisable(GL_DEPTH_TEST);
	glEnable(GL_SCISSOR_TEST);
	glScissor(dstr->x, g_h - (dstr->y+dstr->h), dstr->w, dstr->h);
	//
	renderMugenGl(
		rcy, rcx, alpha, angle, rasterxadd, vscl, yscl, xbotscl, xtopscl,
		tl, y, x, r, g_mugenshaderFc);
	//
	glDisable(GL_SCISSOR_TEST);
	glDisable(GL_TEXTURE_2D);
	glUseProgramObjectARB(0);
	return true;
}

TUserFunc(
	bool, RenderMugenGlFcS, uint32_t color,
	float rcy, float rcx, SDL_Rect* dstr, int alpha,
	float angle, float rasterxadd, float vscl, float yscl,
	float xbotscl, float xtopscl, SDL_Rect* tile, float y, float x,
	SDL_Rect* rect, uint32_t texid)
{
	if(
		texid == 0
		|| _finite(
			x+y+rcx+rcy+xtopscl+xbotscl+yscl+vscl+rasterxadd+angle) == 0)
	{
		return false;
	}
	if(vscl < 0.0f){
		vscl *= -1;
		yscl *= -1;
		angle *= -1;
	}
	SDL_Rect r = *rect, tl = *tile;
	if(tl.x > 0) tl.x -= r.w;
	if(tl.y > 0) tl.y -= r.h;
	if(tl.w == 0) tl.x = 0;
	if(tl.h == 0) tl.y = 0;
	if(xtopscl >= 0) x = -x;
	x += rcx;
	rcy = -rcy;
	if(yscl < 0) y = -y;
	y += rcy;
	glUseProgramObjectARB(g_mugenshaderFcS);
	glUniform3fARB(
		g_uniformColor, (float)(color >> 16 & 0xff) / 255, (float)(color >> 8 & 0xff) / 255,
		(float)(color & 0xff) / 255);
	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, texid);
	glDisable(GL_DEPTH_TEST);
	glEnable(GL_SCISSOR_TEST);
	glScissor(dstr->x, g_h - (dstr->y+dstr->h), dstr->w, dstr->h);
	//
	renderMugenGl(
		rcy, rcx, alpha, angle, rasterxadd, vscl, yscl, xbotscl, xtopscl,
		tl, y, x, r, g_mugenshaderFcS);
	//
	glDisable(GL_SCISSOR_TEST);
	glDisable(GL_TEXTURE_2D);
	glUseProgramObjectARB(0);
	return true;
}

void rectFillGl(float r, float g, float b, float a, SDL_Rect rect)
{
	glBegin(GL_QUADS);
	{
		glColor4f(r, g, b, a);
		glVertex2f((float)rect.x, -(float)(rect.y+rect.h));
		glVertex2f((float)(rect.x+rect.w), -(float)(rect.y+rect.h));
		glVertex2f((float)(rect.x+rect.w), -(float)rect.y);
		glVertex2f((float)rect.x, -(float)rect.y);
	}
	glEnd();
}
TUserFunc(void, MugenFillGl, int32_t alpha, uint32_t color, SDL_Rect rect)
{
	float r = (float)(color>>16&0xff)/255.0f;
	float g = (float)(color>>8&0xff)/255.0f;
	float b = (float)(color&0xff)/255.0f;
	glDisable(GL_DEPTH_TEST);
	glMatrixMode(GL_PROJECTION);
	glPushMatrix();
	glLoadIdentity();
	glOrtho(0, g_w, 0, g_h, -1, 1);
	glMatrixMode(GL_MODELVIEW);
	glPushMatrix();
	glTranslated(0, g_h, 0);
	//
	if(alpha == -1){
		glBlendFunc(GL_SRC_ALPHA, GL_ONE);
		rectFillGl(r, g, b, 1.0f, rect);
	}else if(alpha == -2){
		glBlendFunc(GL_ZERO, GL_ONE_MINUS_SRC_COLOR);
		rectFillGl(r, g, b, 1.0f, rect);
	}else if(alpha <= 0){
	}else if(alpha < 255){
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
		rectFillGl(r, g, b, (GLfloat)alpha / 256.0f, rect);
	}else if(alpha < 512){
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
		rectFillGl(r, g, b, 1.0f, rect);
	}else{
		int src = alpha & 0xff;
		int dst = (alpha & 0x3fc00) >> 10;
		glBlendFunc(GL_ZERO, GL_ONE_MINUS_SRC_ALPHA);
		rectFillGl(r, g, b, 1.0f - (GLfloat)dst / 255.0f, rect);
		glBlendFunc(GL_SRC_ALPHA, GL_ONE);
		rectFillGl(r, g, b, (GLfloat)src / 255.0f, rect);
	}
	//
	glPopMatrix();
	glMatrixMode(GL_PROJECTION);
	glPopMatrix();
}

TUserFunc(bool, BindGlContext)
{
	return
		wglMakeCurrent(
			g_hdc,
			g_mainTreadId == GetCurrentThreadId() ? g_hglrc : g_hglrc2) != 0;
}

TUserFunc(bool, UnbindGlContext)
{
	return wglMakeCurrent(nullptr, nullptr) != 0;
}

