// Copyright (c) 2026 Dale Wick
// SPDX-License-Identifier: MIT
// See LICENSE.md for the full license text.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>

#include<zos_sys.h>
#include<zos_time.h>
#include<zos_vfs.h>
#include<zos_keyboard.h>
#include<zos_video.h>
#include<zvb_hardware.h>
#include<zvb_gfx.h>
#include<zvb_sprite.h>
#include<zvb_sound.h>

#ifndef __SDCC_VERSION_MAJOR
#define __at(addr)
#define __naked
#define __sfr
#define va_list char * //struct {int dummy; }
#define va_start(ap, last)
#define va_end(ap)
#endif

#include "main.h"
#include "game.h"
//#include "sound.h"
#include "Night in Tokyo.h"

#define FONT_COLOR 255
#define FONT_PALETTE_BASE 0

gfx_context ctx;
uint8_t sprite_count=0;
uint8_t last_sprite_count=0;
gfx_sprite sprites[128];

enum GameState current_state;
bool done;

zos_dev_t ser;

void debug_log(const char *message)
{
    size_t size=strlen(message);

    write(ser, message, &size);
    size=2;
    write(ser, "\r\n", &size);
}

void debug_logf(const char *format, ...)
{
    char buffer[256];
    va_list args;
    va_start(args, format);
    vsprintf(buffer, format, args);
    va_end(args);
    debug_log(buffer);
}

void debug_exit_emulator(uint8_t code)
{
    debug_logf("Exiting emulator with code %d...", code);
    __asm
        LD L,A
        LD A,#0
        OUT (#0x10),A
    __endasm ; 
}

void draw_tileset_char(uint8_t c)
{
    uint8_t font_tile[256];
    uint8_t offset=0;

    if(c < 32  || c>126) return;
    memset(font_tile, 0, sizeof(font_tile));
    for(uint8_t i=0;i<8;i++) {
        uint8_t value = FONT_NIGHT_IN_TOKYO_BITMAP[(c-32)*8+i];
        uint8_t mask=128;
        for(uint8_t j=0;j<8;j++) {
            if(value & mask) {
                // Magnified pixel
                font_tile[offset+0x10] = FONT_COLOR;  // Text color
                font_tile[offset+0x11] = FONT_COLOR;  // Background color
                font_tile[offset] = FONT_COLOR;  // Text color
                font_tile[offset+1] = FONT_COLOR;  // Background color
            }
            mask >>= 1;
            offset+=2;
        }
        offset+=0x10;
    }
    gfx_tileset_options options = {0, c*256, FONT_PALETTE_BASE, 0};
    gfx_tileset_load(&ctx, font_tile, sizeof(font_tile), &options);
}

void draw_ascii() {
    for(uint8_t i=0;i<128;i++) {
        draw_tileset_char(i);
    } 
}

void initialize_graphics() {
    uint8_t buffer[256];
    
    ser = open("#SER0",O_WRONLY);
    if (ser < 0) {
        printf("Failed to open serial port\n");
	    exit(1);
    }
    debug_log("Initializing...");

    // Initialize the graphics context
    // Set to tiled 640x480 mode
    gfx_initialize(ZVB_CTRL_VID_MODE_GFX_640_8BIT, &ctx);

    char mapline[80];
    memset(mapline,0,sizeof(mapline));
    for(int layer=0;layer<2;layer++) {
        for(int y=0;y<80;y++)
        {
            gfx_tilemap_load(&ctx, mapline, sizeof(mapline), layer, 0, y);
        }
    }
    gfx_tileset_add_color_tile(&ctx,254,254);
    gfx_tileset_add_color_tile(&ctx,255,255);
    clear_sprites();
    const uint16_t solid_color[2]={(uint16_t)RGB888_TO_RGB565(0xF,0xF,0x00),(uint16_t)RGB888_TO_RGB565(0xE0,0xE0,0x00)}; // Yellow and dark yellow
    gfx_palette_load(&ctx,solid_color,4,254);

    draw_ascii();
    debug_log("Initalized.");
}

void show_map(uint8_t *map,uint8_t width,uint8_t height)
{
    uint8_t layer=0;
    for(int y=0;y<height;y++)
    {
        gfx_tilemap_load(&ctx, &map[width*y], width, layer, 0, y);
    }
}
void show_map1(uint8_t *map,uint8_t width,uint8_t height)
{
    uint8_t layer=1;
    for(int y=0;y<height;y++)
    {
        gfx_tilemap_load(&ctx, &map[width*y], width, layer, 0, y);
    }
}

void show_map_xy(uint8_t *map,uint8_t width,uint8_t height,uint8_t x,uint8_t y)
{
    uint8_t layer=0;
    for(int j=0;j<height;j++)
    {
        gfx_tilemap_load(&ctx, &map[width*j], width, layer, x, y+j);
    }
}

void show_map_xy1(uint8_t *map,uint8_t width,uint8_t height,uint8_t x,uint8_t y)
{
    uint8_t layer=1;
    for(int j=0;j<height;j++)
    {
        gfx_tilemap_load(&ctx, &map[width*j], width, layer, x, y+j);
    }
}

void show_number(uint16_t number, uint8_t x, uint8_t y)
{
    char buffer[6];
    sprintf(buffer, "%u", number);
    for(int i=0;buffer[i];i++)
    {
        gfx_tilemap_place(&ctx, buffer[i], 0, x+i, y);
    }
}

void set_game_state(enum GameState new_state) {
    current_state = new_state;
    // Initialize the game and menu
    switch(current_state) {
        case STATE_GAME:
            game_init();
            game_start();
            break;
        case STATE_MENU:
            //menu_init();
            break;
    }
}

void reset_sprite(void)
{
    last_sprite_count = sprite_count;
    sprite_count=0;
}

uint8_t add_sprite(uint16_t x, uint16_t y, uint8_t tile, uint16_t flags)
{
    if(sprite_count >= 128) return 255;
    sprites[sprite_count].x = x+16; // Note sprites are displayed anchored the bottom right corner
    sprites[sprite_count].y = y+16;
    sprites[sprite_count].tile = tile;
    sprites[sprite_count].flags = flags;
    sprite_count++;
    return sprite_count-1;
}

uint8_t update_sprite(uint8_t index, uint16_t x, uint16_t y, uint8_t tile, uint16_t flags)
{
    if(index >= 128) return 255;
    sprites[index].x = x+16; // Note sprites are displayed anchored the bottom right corner
    sprites[index].y = y+16;
    sprites[index].tile = tile;
    sprites[index].flags = flags;
    return index;
}

void render_sprites(void)
{
    uint8_t count = sprite_count;
    if(count < last_sprite_count) {
        // Clear only the stale tail left over from the previous, larger frame
        memset(&sprites[sprite_count], 0, (last_sprite_count - sprite_count) * sizeof(gfx_sprite));
        count = last_sprite_count;
    }
    gfx_sprite_render_array(&ctx, 0, sprites, count);
}

void clear_sprites(void)
{
    memset(sprites, 0, sizeof(sprites));
    sprite_count=128;
    render_sprites();
    sprite_count=0;
}

uint8_t handle_input(uint8_t key)
{
    switch(key)
    {
        case KB_ESC:
            done = true;
            return MAX_INPUT;
        case KB_UP_ARROW:
            return INPUT_UP;
        case KB_DOWN_ARROW:
            return INPUT_DOWN;
        case KB_LEFT_ARROW:
            return INPUT_LEFT;
        case KB_RIGHT_ARROW:
            return INPUT_RIGHT;
        case KB_KEY_V:
        case KB_KEY_SPACE:
            return INPUT_A;
        case KB_KEY_BACKSPACE:
        case KB_KEY_B:
            return INPUT_B;
        case KB_KEY_COMMA:
        case KB_KEY_C:
            return INPUT_X;
        case KB_KEY_PERIOD:
        case KB_KEY_P:
            return INPUT_Y;
        case KB_KEY_ENTER:
            return INPUT_START;
        case KB_KEY_QUOTE:
        case KB_RIGHT_SHIFT:
            return INPUT_SELECT;
        case KB_KEY_LEFT_BRACKET:
        case KB_KEY_S:
            return INPUT_L;
        case KB_KEY_RIGHT_BRACKET:
        case KB_KEY_E:
            return INPUT_R;
        default:
            return MAX_INPUT;
    }
}

void send_input(uint8_t input, bool down)
{
    switch(current_state) {
        case STATE_GAME:
            game_handle_input(input, down);
            break;
        case STATE_MENU:
            //menu_handle_input(input, down);
            break;
    }
 }

void process_input(void)
{
    unsigned char keys[32];
    int size;
    bool pressed = true;

    do {
        size=32;
        read(DEV_STDIN, &keys, &size);
        for(int i=0;i<size;i++) {
            char key = keys[i];
           //debug_logf("Processing input key %02x.", key);
           if(key == KB_RELEASED) {
                pressed = false;
            } else {
                uint8_t input = handle_input(key);
                if(input >= MAX_INPUT) {
                    pressed = true;
                    continue;
                }
                send_input(input, pressed);
                pressed=true;
            }
        }
    } while(size>0);
#if 0
    // Scan for game controller
    uint16_t value = controller_read();
    uint16_t changed = value ^ controller_state;
    if(changed) debug_logf("Ctrl: %04x, %04x", value, changed);
    controller_state = value;
    // Edge triggered
    for(uint8_t i=0;i<12;i++) {
        if(changed & (1<<i)) {
            uint8_t input = map_controller[i];
            bool down = (value & (1<<i)) == 0;
            send_input(input, down);
        }
    }
#endif
}


int main(int argc, char *argv[]) {
    (void)argc;
    (void)argv;

    printf("Starting game...\n");
    initialize_graphics();
    
    set_game_state(STATE_GAME);

    /* Initialize the keyboard by setting it to raw and non-blocking */
    void* arg = (void*) (KB_READ_NON_BLOCK | KB_MODE_RAW);
    ioctl(DEV_STDIN, KB_CMD_SET_MODE, arg);

    //sound_init();
    // Main loop
    while (!done) {
        // Handle input
        process_input();
        gfx_wait_end_vblank(&ctx);

        //sound_update(16);
        // Update game and menu state
        switch(current_state) {
            case STATE_GAME:
                game_update(16);
                break;
            case STATE_MENU:
                //menu_update(16);
                break;
        }

        gfx_wait_vblank(&ctx);
        // Render game and menu
        switch(current_state) {
            case STATE_GAME:
                game_paint();
                break;
            case STATE_MENU:
                //menu_render();
                break;
        }
    }

    debug_log("Quitting.");

    // Clear out sprites
    memset(sprites, 0, sizeof(sprites));
    render_sprites();
    zvb_sound_reset();
    ioctl(DEV_STDOUT, CMD_RESET_SCREEN, NULL);
    printf("Exiting...\n");

    printf("Goodbye!\n");
    close(ser);

    debug_exit_emulator(0);
    exit(0);

    return 0;
}