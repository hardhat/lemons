#ifndef GAME_H
#define GAME_H

#include "main.h"

/// Load the palette and tiles, and set up the title maze
void game_init(void);
/// Draw the whole maze (call after game_init)
void game_start(void);
/// @param delta Milliseconds since the previous call
void game_update(uint16_t delta);
/// Draw whatever changed since the last call (call during vblank)
void game_paint(void);
/// Arrows move the cursor; space selects; b/c/e/p/s give orders
void game_handle_input(uint8_t input, bool pressed);

#endif // GAME_H