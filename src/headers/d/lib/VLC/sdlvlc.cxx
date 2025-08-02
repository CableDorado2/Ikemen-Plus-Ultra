// libSDL and libVLC sample code.
// License: [http://en.wikipedia.org/wiki/WTFPL WTFPL]
// 
// Compile with: g++ -o sdlvlc dlvlc.cxx $(pkg-config --cflags --libs libvlc sdl2)
// Execute with: ./sdlvlc <video>.mp4

#include <stdio.h>
#include <stdlib.h>
#include "SDL.h"
#include "SDL_mutex.h"

#include "vlc/vlc.h"

#define WIDTH 640
#define HEIGHT 480

#define VIDEOWIDTH 320
#define VIDEOHEIGHT 240

struct context {
    SDL_Renderer *renderer;
    SDL_Surface *surface;
    SDL_mutex *mutex;
};

#ifndef vasprintf
int vasprintf(char **sptr, const char *__restrict fmt, va_list ap)
{
    *sptr = NULL;
    int count = vsnprintf(NULL, 0, fmt, ap); // Query the buffer size required.
    if (count >= 0) {
        char* p = static_cast<char*>(malloc(count + 1)); // Allocate memory for it.
        if (p == NULL)
            return -1;
        if (vsnprintf(p, count + 1, fmt, ap) == count) // We should have used exactly what was required.
            *sptr = p;
        else { // Otherwise something is wrong, likely a bug in vsnprintf. If so free the memory and report the error.
            free(p);
            return -1;
        }
    }
    return count;
}
#endif // vasprintf

static void *lock(void *data, void **p_pixels) {

    struct context *c = (context *)data;

    SDL_LockMutex(c->mutex);
    SDL_LockSurface(c->surface);
    *p_pixels = c->surface->pixels;
    return nullptr;
}

static void unlock(void *data, void *id, void *const *p_pixels) {
    struct context *c = (context *)data;
    SDL_UnlockSurface(c->surface);
    SDL_UnlockMutex(c->mutex);
}

static void display(void *data, void *id) {
    struct context *c = (context *)data;

    SDL_Rect rect;
    rect.w = VIDEOWIDTH;
    rect.h = VIDEOHEIGHT;
    rect.x = (int)((1. + .5 * sin(0.03 * 1)) * (WIDTH - VIDEOWIDTH) / 2);
    rect.y = (int)((1. + .5 * cos(0.03 * 1)) * (HEIGHT - VIDEOHEIGHT) / 2);

    SDL_SetRenderDrawColor(c->renderer, 0, 80, 0, 255);
    SDL_RenderClear(c->renderer);
    SDL_RenderCopy(c->renderer, SDL_CreateTextureFromSurface(c->renderer, c->surface), NULL, &rect);
    SDL_RenderPresent(c->renderer);
}

void vlc_log_cb(void *logdata, int level, const libvlc_log_t *ctx, const char *fmt, va_list args) {
    char* logmessage = { 0 };

    if (vasprintf(&logmessage, fmt, args) < 0)
        return;

    fprintf(stderr, "LOG(%d) %s\n", level, logmessage );
}


int main(int argc, char *argv[]) {

    libvlc_instance_t *libvlc;
    libvlc_media_t *m;
    libvlc_media_player_t *mp;
    SDL_Event event;
    int done = 0, action = 0, pause = 0, n = 0;
    struct context context;
    SDL_Window * window;

    Uint32 rmask, gmask, bmask, amask;
#if SDL_BYTEORDER == SDL_BIG_ENDIAN
    rmask = 0xff000000;
    gmask = 0x00ff0000;
    bmask = 0x0000ff00;
    amask = 0x000000ff;
#else
    rmask = 0x000000ff;
    gmask = 0x0000ff00;
    bmask = 0x00ff0000;
    amask = 0xff000000;
#endif



    char const *vlc_argv[] = { "--no-audio" };
    int vlc_argc = sizeof(vlc_argv) / sizeof(*vlc_argv);

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return EXIT_FAILURE;
    }

    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("Could not initialize SDL: %s.\n", SDL_GetError());
        return EXIT_FAILURE;
    }

    window = SDL_CreateWindow(
        "VIDEO PLAYER",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        WIDTH, HEIGHT,
        SDL_WINDOW_RESIZABLE);

    if (!window) {
        fprintf(stderr, "Couldn't create window: %s\n", SDL_GetError());
       return EXIT_FAILURE;
    }

    context.renderer = SDL_CreateRenderer(window, -1, 0);
    if (!context.renderer) {
        fprintf(stderr, "Couldn't create renderer: %s\n", SDL_GetError());
        return EXIT_FAILURE;
    }

    // See https://wiki.libsdl.org/SDL_CreateRGBSurface
    context.surface = SDL_CreateRGBSurface(SDL_SWSURFACE, VIDEOWIDTH, VIDEOHEIGHT, 32, rmask, gmask, bmask, amask);
    if (!context.surface) {
        fprintf(stderr, "Couldn't create texture: %s\n", SDL_GetError());
        return EXIT_FAILURE;
    };
    context.mutex = SDL_CreateMutex();


    libvlc = libvlc_new(vlc_argc, vlc_argv);
    if (NULL == libvlc) {
        fprintf(stderr, "LibVLC initialization failure.\n");
        return EXIT_FAILURE;
    }

    libvlc_log_set(libvlc, vlc_log_cb, NULL);
    m = libvlc_media_new_path(libvlc, argv[1]);
    mp = libvlc_media_player_new_from_media(m);
    libvlc_media_release(m);

    libvlc_video_set_callbacks(mp, lock, unlock, display, &context);
    // Ask VLC for RGBA pixel format
    libvlc_video_set_format(mp, "RGBA", VIDEOWIDTH, VIDEOHEIGHT, VIDEOWIDTH * 4);
    libvlc_media_player_play(mp);

    // Main loop.
    while (!done) {

        action = 0;

        // Keys: enter (fullscreen), space (pause), escape (quit).
        while (SDL_PollEvent(&event)) {

            switch (event.type) {
                case SDL_QUIT:
                    done = 1;
                    break;
                case SDL_KEYDOWN:
                    action = event.key.keysym.sym;
                    break;
            }
        }

        switch (action) {
            case SDLK_ESCAPE:
            case SDLK_q:
                done = 1;
                break;
            case ' ':
                printf("Pause toggle.\n");
                pause = !pause;
                break;
        }

        SDL_Delay(1000 / 10);
    }

   
    libvlc_media_player_stop(mp);
    libvlc_media_player_release(mp);
    libvlc_release(libvlc);

    SDL_DestroyMutex(context.mutex);
    SDL_DestroyRenderer(context.renderer);

    return 0;
}