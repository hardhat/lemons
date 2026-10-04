;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _process_input
	.globl _send_input
	.globl _handle_input
	.globl _initialize_graphics
	.globl _draw_ascii
	.globl _draw_tileset_char
	.globl _debug_exit_emulator
	.globl _game_handle_input
	.globl _game_render
	.globl _game_update
	.globl _game_init
	.globl _zvb_sound_reset
	.globl _gfx_sprite_render_array
	.globl _gfx_wait_end_vblank
	.globl _gfx_wait_vblank
	.globl _gfx_tilemap_place
	.globl _gfx_tilemap_load
	.globl _gfx_tileset_add_color_tile
	.globl _gfx_tileset_load
	.globl _gfx_palette_load
	.globl _gfx_initialize
	.globl _ioctl
	.globl _close
	.globl _open
	.globl _write
	.globl _read
	.globl _exit
	.globl _strlen
	.globl _puts
	.globl _vsprintf
	.globl _sprintf
	.globl _last_sprite_count
	.globl _sprite_count
	.globl _ser
	.globl _done
	.globl _current_state
	.globl _sprites
	.globl _ctx
	.globl _debug_log
	.globl _debug_logf
	.globl _show_map
	.globl _show_map1
	.globl _show_map_xy
	.globl _show_map_xy1
	.globl _show_number
	.globl _set_game_state
	.globl _reset_sprite
	.globl _add_sprite
	.globl _update_sprite
	.globl _render_sprites
	.globl _clear_sprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
G$zvb_config_ver_rev$0_0$0 == 0x0080
_zvb_config_ver_rev	=	0x0080
G$zvb_config_ver_min$0_0$0 == 0x0081
_zvb_config_ver_min	=	0x0081
G$zvb_config_ver_maj$0_0$0 == 0x0082
_zvb_config_ver_maj	=	0x0082
G$zvb_config_dev_idx$0_0$0 == 0x008e
_zvb_config_dev_idx	=	0x008e
G$zvb_config_phys_addr$0_0$0 == 0x008f
_zvb_config_phys_addr	=	0x008f
G$zvb_ctrl_vpos_low$0_0$0 == 0x0090
_zvb_ctrl_vpos_low	=	0x0090
G$zvb_ctrl_vpos_high$0_0$0 == 0x0091
_zvb_ctrl_vpos_high	=	0x0091
G$zvb_ctrl_hpos_low$0_0$0 == 0x0092
_zvb_ctrl_hpos_low	=	0x0092
G$zvb_ctrl_hpos_high$0_0$0 == 0x0093
_zvb_ctrl_hpos_high	=	0x0093
G$zvb_ctrl_l0_scr_y_low$0_0$0 == 0x0094
_zvb_ctrl_l0_scr_y_low	=	0x0094
G$zvb_ctrl_l0_scr_y_high$0_0$0 == 0x0095
_zvb_ctrl_l0_scr_y_high	=	0x0095
G$zvb_ctrl_l0_scr_x_low$0_0$0 == 0x0096
_zvb_ctrl_l0_scr_x_low	=	0x0096
G$zvb_ctrl_l0_scr_x_high$0_0$0 == 0x0097
_zvb_ctrl_l0_scr_x_high	=	0x0097
G$zvb_ctrl_l1_scr_y_low$0_0$0 == 0x0098
_zvb_ctrl_l1_scr_y_low	=	0x0098
G$zvb_ctrl_l1_scr_y_high$0_0$0 == 0x0099
_zvb_ctrl_l1_scr_y_high	=	0x0099
G$zvb_ctrl_l1_scr_x_low$0_0$0 == 0x009a
_zvb_ctrl_l1_scr_x_low	=	0x009a
G$zvb_ctrl_l1_scr_x_high$0_0$0 == 0x009b
_zvb_ctrl_l1_scr_x_high	=	0x009b
G$zvb_ctrl_video_mode$0_0$0 == 0x009c
_zvb_ctrl_video_mode	=	0x009c
G$zvb_ctrl_status$0_0$0 == 0x009d
_zvb_ctrl_status	=	0x009d
G$zvb_peri_text_print_char$0_0$0 == 0x00a0
_zvb_peri_text_print_char	=	0x00a0
G$zvb_peri_text_curs_y$0_0$0 == 0x00a1
_zvb_peri_text_curs_y	=	0x00a1
G$zvb_peri_text_curs_x$0_0$0 == 0x00a2
_zvb_peri_text_curs_x	=	0x00a2
G$zvb_peri_text_scroll_y$0_0$0 == 0x00a3
_zvb_peri_text_scroll_y	=	0x00a3
G$zvb_peri_text_scroll_x$0_0$0 == 0x00a4
_zvb_peri_text_scroll_x	=	0x00a4
G$zvb_peri_text_color$0_0$0 == 0x00a5
_zvb_peri_text_color	=	0x00a5
G$zvb_peri_text_curs_time$0_0$0 == 0x00a6
_zvb_peri_text_curs_time	=	0x00a6
G$zvb_peri_text_curs_char$0_0$0 == 0x00a7
_zvb_peri_text_curs_char	=	0x00a7
G$zvb_peri_text_curs_color$0_0$0 == 0x00a8
_zvb_peri_text_curs_color	=	0x00a8
G$zvb_peri_text_ctrl$0_0$0 == 0x00a9
_zvb_peri_text_ctrl	=	0x00a9
G$zvb_peri_spi_ctrl$0_0$0 == 0x00a1
_zvb_peri_spi_ctrl	=	0x00a1
G$zvb_peri_spi_clk_div$0_0$0 == 0x00a2
_zvb_peri_spi_clk_div	=	0x00a2
G$zvb_peri_spi_ram_len$0_0$0 == 0x00a3
_zvb_peri_spi_ram_len	=	0x00a3
G$zvb_peri_spi_fifo$0_0$0 == 0x00a7
_zvb_peri_spi_fifo	=	0x00a7
G$zvb_peri_spi_array_0$0_0$0 == 0x00a8
_zvb_peri_spi_array_0	=	0x00a8
G$zvb_peri_spi_array_1$0_0$0 == 0x00a9
_zvb_peri_spi_array_1	=	0x00a9
G$zvb_peri_spi_array_2$0_0$0 == 0x00aa
_zvb_peri_spi_array_2	=	0x00aa
G$zvb_peri_spi_array_3$0_0$0 == 0x00ab
_zvb_peri_spi_array_3	=	0x00ab
G$zvb_peri_spi_array_4$0_0$0 == 0x00ac
_zvb_peri_spi_array_4	=	0x00ac
G$zvb_peri_spi_array_5$0_0$0 == 0x00ad
_zvb_peri_spi_array_5	=	0x00ad
G$zvb_peri_spi_array_6$0_0$0 == 0x00ae
_zvb_peri_spi_array_6	=	0x00ae
G$zvb_peri_spi_array_7$0_0$0 == 0x00af
_zvb_peri_spi_array_7	=	0x00af
G$zvb_peri_crc_ctrl$0_0$0 == 0x00a0
_zvb_peri_crc_ctrl	=	0x00a0
G$zvb_peri_crc_data_in$0_0$0 == 0x00a1
_zvb_peri_crc_data_in	=	0x00a1
G$zvb_peri_crc_byte0$0_0$0 == 0x00a4
_zvb_peri_crc_byte0	=	0x00a4
G$zvb_peri_crc_byte1$0_0$0 == 0x00a5
_zvb_peri_crc_byte1	=	0x00a5
G$zvb_peri_crc_byte2$0_0$0 == 0x00a6
_zvb_peri_crc_byte2	=	0x00a6
G$zvb_peri_crc_byte3$0_0$0 == 0x00a7
_zvb_peri_crc_byte3	=	0x00a7
G$zvb_peri_sound_freq_low$0_0$0 == 0x00a0
_zvb_peri_sound_freq_low	=	0x00a0
G$zvb_peri_sound_freq_high$0_0$0 == 0x00a1
_zvb_peri_sound_freq_high	=	0x00a1
G$zvb_peri_sound_wave$0_0$0 == 0x00a2
_zvb_peri_sound_wave	=	0x00a2
G$zvb_peri_sound_volume$0_0$0 == 0x00a3
_zvb_peri_sound_volume	=	0x00a3
G$zvb_peri_sound_sample_fifo$0_0$0 == 0x00a0
_zvb_peri_sound_sample_fifo	=	0x00a0
G$zvb_peri_sound_sample_div$0_0$0 == 0x00a1
_zvb_peri_sound_sample_div	=	0x00a1
G$zvb_peri_sound_sample_conf$0_0$0 == 0x00a2
_zvb_peri_sound_sample_conf	=	0x00a2
G$zvb_peri_sound_left_channel$0_0$0 == 0x00ab
_zvb_peri_sound_left_channel	=	0x00ab
G$zvb_peri_sound_right_channel$0_0$0 == 0x00ac
_zvb_peri_sound_right_channel	=	0x00ac
G$zvb_peri_sound_hold$0_0$0 == 0x00ad
_zvb_peri_sound_hold	=	0x00ad
G$zvb_peri_sound_master_vol$0_0$0 == 0x00ae
_zvb_peri_sound_master_vol	=	0x00ae
G$zvb_peri_sound_select$0_0$0 == 0x00af
_zvb_peri_sound_select	=	0x00af
G$zvb_peri_dma_ctrl$0_0$0 == 0x00a0
_zvb_peri_dma_ctrl	=	0x00a0
G$zvb_peri_dma_addr0$0_0$0 == 0x00a1
_zvb_peri_dma_addr0	=	0x00a1
G$zvb_peri_dma_addr1$0_0$0 == 0x00a2
_zvb_peri_dma_addr1	=	0x00a2
G$zvb_peri_dma_addr2$0_0$0 == 0x00a3
_zvb_peri_dma_addr2	=	0x00a3
G$zvb_peri_dma_clk_div$0_0$0 == 0x00a9
_zvb_peri_dma_clk_div	=	0x00a9
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$ctx$0_0$0==.
_ctx::
	.ds 5
G$sprites$0_0$0==.
_sprites::
	.ds 1024
G$current_state$0_0$0==.
_current_state::
	.ds 1
G$done$0_0$0==.
_done::
	.ds 1
G$ser$0_0$0==.
_ser::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
Fmain$width$0_0$0==.
_width:
	.ds 2
Fmain$height$0_0$0==.
_height:
	.ds 2
Fmain$header_data_cmap$0_0$0==.
_header_data_cmap:
	.ds 768
Fmain$header_data$0_0$0==.
_header_data:
	.ds 640
G$sprite_count$0_0$0==.
_sprite_count::
	.ds 1
G$last_sprite_count$0_0$0==.
_last_sprite_count::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _TEXT
	Fmain$kernel_config$0$0	= .
	.globl	Fmain$kernel_config$0$0
	C$zos_sys.h$168$0_0$80	= .
	.globl	C$zos_sys.h$168$0_0$80
;../Zeal-8-bit-OS/kernel_headers/sdcc/include/zos_sys.h:168: static inline const zos_config_t* kernel_config(void)
;	---------------------------------
; Function kernel_config
; ---------------------------------
_kernel_config:
	C$zos_sys.h$170$1_0$80	= .
	.globl	C$zos_sys.h$170$1_0$80
;../Zeal-8-bit-OS/kernel_headers/sdcc/include/zos_sys.h:170: return *((zos_config_t**) 0x0004);
	ld	de, (#0x0004)
	C$zos_sys.h$171$1_0$80	= .
	.globl	C$zos_sys.h$171$1_0$80
;../Zeal-8-bit-OS/kernel_headers/sdcc/include/zos_sys.h:171: }
	C$zos_sys.h$171$1_0$80	= .
	.globl	C$zos_sys.h$171$1_0$80
	XFmain$kernel_config$0$0	= .
	.globl	XFmain$kernel_config$0$0
	ret
	G$debug_log$0$0	= .
	.globl	G$debug_log$0$0
	C$main.c$52$1_0$153	= .
	.globl	C$main.c$52$1_0$153
;src/main.c:52: void debug_log(const char *message)
;	---------------------------------
; Function debug_log
; ---------------------------------
_debug_log::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	call	_strlen
	ex	de, hl
	pop	de
	ex	(sp), hl
	C$main.c$56$1_0$153	= .
	.globl	C$main.c$56$1_0$153
;src/main.c:56: write(ser, message, &size);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	a, (_ser+0)
	call	_write
	C$main.c$57$1_0$153	= .
	.globl	C$main.c$57$1_0$153
;src/main.c:57: size=2;
	ld	hl, #0x0002
	ex	(sp), hl
	C$main.c$58$1_0$153	= .
	.globl	C$main.c$58$1_0$153
;src/main.c:58: write(ser, "\r\n", &size);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	de, #___str_0
	ld	a, (_ser+0)
	call	_write
	C$main.c$59$1_0$153	= .
	.globl	C$main.c$59$1_0$153
;src/main.c:59: }
	ld	sp, ix
	pop	ix
	C$main.c$59$1_0$153	= .
	.globl	C$main.c$59$1_0$153
	XG$debug_log$0$0	= .
	.globl	XG$debug_log$0$0
	ret
Fmain$FONT_NIGHT_IN_TOKYO_BITMAP$0_0$0 == .
_FONT_NIGHT_IN_TOKYO_BITMAP:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0xfe	; 254
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3e	; 62
	.db #0x66	; 102	'f'
	.db #0x70	; 112	'p'
	.db #0x3c	; 60
	.db #0x0e	; 14
	.db #0x7c	; 124
	.db #0x18	; 24
	.db #0x32	; 50	'2'
	.db #0x56	; 86	'V'
	.db #0x6c	; 108	'l'
	.db #0x18	; 24
	.db #0x36	; 54	'6'
	.db #0x6a	; 106	'j'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x06	; 6
	.db #0x3c	; 60
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0x06	; 6
	.db #0x1c	; 28
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x32	; 50	'2'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x46	; 70	'F'
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0x7a	; 122	'z'
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0xda	; 218
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0xc6	; 198
	.db #0xde	; 222
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0xe6	; 230
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x46	; 70	'F'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x68	; 104	'h'
	.db #0x6c	; 108	'l'
	.db #0x66	; 102	'f'
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x62	; 98	'b'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xee	; 238
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x00	; 0
	.db #0xe6	; 230
	.db #0x76	; 118	'v'
	.db #0x7e	; 126
	.db #0x6e	; 110	'n'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x6a	; 106	'j'
	.db #0x6c	; 108	'l'
	.db #0x36	; 54	'6'
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x70	; 112	'p'
	.db #0x3c	; 60
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xe6	; 230
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x78	; 120	'x'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x46	; 70	'F'
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x60	; 96
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x64	; 100	'd'
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0x60	; 96
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x60	; 96
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x32	; 50	'2'
	.db #0x30	; 48	'0'
	.db #0x7c	; 124
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x6c	; 108	'l'
	.db #0x76	; 118	'v'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x38	; 56	'8'
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x78	; 120	'x'
	.db #0x6c	; 108	'l'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0x76	; 118	'v'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7c	; 124
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x76	; 118	'v'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x62	; 98	'b'
	.db #0x3c	; 60
	.db #0x06	; 6
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x6c	; 108	'l'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0x7c	; 124
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x0c	; 12
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x4c	; 76	'L'
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x0e	; 14
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x32	; 50	'2'
	.db #0x7e	; 126
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x9d	; 157
	.db #0xb5	; 181
	.db #0xb1	; 177
	.db #0x9d	; 157
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
Fmain$__str_0$0_0$0 == .
___str_0:
	.db 0x0d
	.db 0x0a
	.db 0x00
	G$debug_logf$0$0	= .
	.globl	G$debug_logf$0$0
	C$main.c$61$1_0$155	= .
	.globl	C$main.c$61$1_0$155
;src/main.c:61: void debug_logf(const char *format, ...)
;	---------------------------------
; Function debug_logf
; ---------------------------------
_debug_logf::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-256
	add	hl, sp
	ld	sp, hl
	C$main.c$65$2_0$156	= .
	.globl	C$main.c$65$2_0$156
;src/main.c:65: va_start(args, format);
	C$main.c$66$1_0$155	= .
	.globl	C$main.c$66$1_0$155
;src/main.c:66: vsprintf(buffer, format, args);
	ld	hl, #262
	add	hl, sp
	push	hl
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #2
	add	hl, sp
	call	_vsprintf
	C$main.c$68$1_0$155	= .
	.globl	C$main.c$68$1_0$155
;src/main.c:68: debug_log(buffer);
	ld	hl, #0
	add	hl, sp
	call	_debug_log
	C$main.c$69$1_0$155	= .
	.globl	C$main.c$69$1_0$155
;src/main.c:69: }
	ld	sp, ix
	pop	ix
	C$main.c$69$1_0$155	= .
	.globl	C$main.c$69$1_0$155
	XG$debug_logf$0$0	= .
	.globl	XG$debug_logf$0$0
	ret
	G$debug_exit_emulator$0$0	= .
	.globl	G$debug_exit_emulator$0$0
	C$main.c$71$1_0$159	= .
	.globl	C$main.c$71$1_0$159
;src/main.c:71: void debug_exit_emulator(uint8_t code)
;	---------------------------------
; Function debug_exit_emulator
; ---------------------------------
_debug_exit_emulator::
	C$main.c$73$1_0$159	= .
	.globl	C$main.c$73$1_0$159
;src/main.c:73: debug_logf("Exiting emulator with code %d...", code);
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	hl, #___str_1
	push	hl
	call	_debug_logf
	pop	af
	pop	af
	C$main.c$78$1_0$159	= .
	.globl	C$main.c$78$1_0$159
;src/main.c:78: __endasm ; 
	LD	L,A
	LD	A,#0
	OUT	(#0x10),A
	C$main.c$79$1_0$159	= .
	.globl	C$main.c$79$1_0$159
;src/main.c:79: }
	C$main.c$79$1_0$159	= .
	.globl	C$main.c$79$1_0$159
	XG$debug_exit_emulator$0$0	= .
	.globl	XG$debug_exit_emulator$0$0
	ret
Fmain$__str_1$0_0$0 == .
___str_1:
	.ascii "Exiting emulator with code %d..."
	.db 0x00
	G$draw_tileset_char$0$0	= .
	.globl	G$draw_tileset_char$0$0
	C$main.c$81$1_0$161	= .
	.globl	C$main.c$81$1_0$161
;src/main.c:81: void draw_tileset_char(uint8_t c)
;	---------------------------------
; Function draw_tileset_char
; ---------------------------------
_draw_tileset_char::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-268
	add	hl, sp
	ld	sp, hl
	ld	c, a
	C$main.c$84$2_0$161	= .
	.globl	C$main.c$84$2_0$161
;src/main.c:84: uint8_t offset=0;
	ld	b, #0x00
	C$main.c$86$1_0$161	= .
	.globl	C$main.c$86$1_0$161
;src/main.c:86: if(c < 32  || c>126) return;
	ld	a, c
	sub	a, #0x20
	jp	C,00114$
	ld	a, #0x7e
	sub	a, c
	jp	C,00114$
	C$main.c$87$1_0$161	= .
	.globl	C$main.c$87$1_0$161
;src/main.c:87: memset(font_tile, 0, sizeof(font_tile));
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	b, #0x80
00160$:
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	djnz	00160$
	pop	bc
	C$main.c$88$3_0$163	= .
	.globl	C$main.c$88$3_0$163
;src/main.c:88: for(uint8_t i=0;i<8;i++) {
	ld	e, #0x00
00112$:
	C$main.c$89$1_1$161	= .
	.globl	C$main.c$89$1_1$161
;src/main.c:89: uint8_t value = FONT_NIGHT_IN_TOKYO_BITMAP[(c-32)*8+i];
	ld	-2 (ix), c
	ld	-1 (ix), #0x00
	C$main.c$88$2_0$162	= .
	.globl	C$main.c$88$2_0$162
;src/main.c:88: for(uint8_t i=0;i<8;i++) {
	ld	a, e
	sub	a, #0x08
	jp	NC, 00107$
	C$main.c$89$3_0$163	= .
	.globl	C$main.c$89$3_0$163
;src/main.c:89: uint8_t value = FONT_NIGHT_IN_TOKYO_BITMAP[(c-32)*8+i];
	ld	a, -2 (ix)
	add	a, #0xe0
	ld	d, a
	ld	a, #0x00
	adc	a, #0xff
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, e
	ld	d, #0x00
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, h
	ld	d, a
	ld	a, #<(_FONT_NIGHT_IN_TOKYO_BITMAP)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_FONT_NIGHT_IN_TOKYO_BITMAP)
	adc	a, d
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	-7 (ix), a
	C$main.c$90$3_0$163	= .
	.globl	C$main.c$90$3_0$163
;src/main.c:90: uint8_t mask=128;
	ld	-2 (ix), #0x80
	C$main.c$91$1_1$161	= .
	.globl	C$main.c$91$1_1$161
;src/main.c:91: for(uint8_t j=0;j<8;j++) {
	ld	-1 (ix), #0x00
00109$:
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	NC, 00106$
	C$main.c$92$5_0$165	= .
	.globl	C$main.c$92$5_0$165
;src/main.c:92: if(value & mask) {
	ld	a, -7 (ix)
	and	a, -2 (ix)
	or	a, a
	jr	Z, 00105$
	C$main.c$94$6_0$166	= .
	.globl	C$main.c$94$6_0$166
;src/main.c:94: font_tile[offset+0x10] = FONT_COLOR;  // Text color
	ld	-6 (ix), b
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	add	a, #0x10
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	push	de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	d,l
	ld	(hl), #0x1f
	C$main.c$95$6_0$166	= .
	.globl	C$main.c$95$6_0$166
;src/main.c:95: font_tile[offset+0x11] = FONT_COLOR;  // Background color
	ld	a, -6 (ix)
	add	a, #0x11
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	push	de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	(hl), #0x1f
	C$main.c$96$6_0$166	= .
	.globl	C$main.c$96$6_0$166
;src/main.c:96: font_tile[offset++] = FONT_COLOR;  // Text color
	ld	d, b
	inc	b
	push	de
	ld	e, d
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	(hl), #0x1f
	C$main.c$97$6_0$166	= .
	.globl	C$main.c$97$6_0$166
;src/main.c:97: font_tile[offset++] = FONT_COLOR;  // Background color
	ld	d, b
	inc	b
	push	de
	ld	e, d
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	(hl), #0x1f
00105$:
	C$main.c$99$5_0$165	= .
	.globl	C$main.c$99$5_0$165
;src/main.c:99: mask >>= 1;
	srl	-2 (ix)
	C$main.c$91$4_0$164	= .
	.globl	C$main.c$91$4_0$164
;src/main.c:91: for(uint8_t j=0;j<8;j++) {
	inc	-1 (ix)
	jr	00109$
00106$:
	C$main.c$101$3_0$163	= .
	.globl	C$main.c$101$3_0$163
;src/main.c:101: offset+=0x10;
	ld	a, b
	add	a, #0x10
	ld	b, a
	C$main.c$88$2_0$162	= .
	.globl	C$main.c$88$2_0$162
;src/main.c:88: for(uint8_t i=0;i<8;i++) {
	inc	e
	jp	00112$
00107$:
	C$main.c$103$2_0$167	= .
	.globl	C$main.c$103$2_0$167
;src/main.c:103: gfx_tileset_options options = {0, c*256, FONT_PALETTE_BASE, 0};
	ld	-12 (ix), #0x00
	ld	hl, #256
	add	hl, sp
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	c, -2 (ix)
	ld	(hl), #0x00
	inc	hl
	ld	(hl), c
	ld	-9 (ix), #0x00
	ld	-8 (ix), #0x00
	C$main.c$104$1_1$167	= .
	.globl	C$main.c$104$1_1$167
;src/main.c:104: gfx_tileset_load(&ctx, font_tile, sizeof(font_tile), &options);
	push	de
	ld	hl, #0x0100
	push	hl
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #_ctx
	call	_gfx_tileset_load
00114$:
	C$main.c$105$1_1$161	= .
	.globl	C$main.c$105$1_1$161
;src/main.c:105: }
	ld	sp, ix
	pop	ix
	C$main.c$105$1_1$161	= .
	.globl	C$main.c$105$1_1$161
	XG$draw_tileset_char$0$0	= .
	.globl	XG$draw_tileset_char$0$0
	ret
	G$draw_ascii$0$0	= .
	.globl	G$draw_ascii$0$0
	C$main.c$107$1_1$169	= .
	.globl	C$main.c$107$1_1$169
;src/main.c:107: void draw_ascii() {
;	---------------------------------
; Function draw_ascii
; ---------------------------------
_draw_ascii::
	C$main.c$108$2_0$169	= .
	.globl	C$main.c$108$2_0$169
;src/main.c:108: for(uint8_t i=0;i<128;i++) {
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x80
	ret	NC
	C$main.c$109$3_0$170	= .
	.globl	C$main.c$109$3_0$170
;src/main.c:109: draw_tileset_char(i);
	push	bc
	ld	a, c
	call	_draw_tileset_char
	pop	bc
	C$main.c$108$2_0$169	= .
	.globl	C$main.c$108$2_0$169
;src/main.c:108: for(uint8_t i=0;i<128;i++) {
	inc	c
	C$main.c$111$2_0$169	= .
	.globl	C$main.c$111$2_0$169
;src/main.c:111: }
	C$main.c$111$2_0$169	= .
	.globl	C$main.c$111$2_0$169
	XG$draw_ascii$0$0	= .
	.globl	XG$draw_ascii$0$0
	jr	00103$
	G$initialize_graphics$0$0	= .
	.globl	G$initialize_graphics$0$0
	C$main.c$113$2_0$171	= .
	.globl	C$main.c$113$2_0$171
;src/main.c:113: void initialize_graphics() {
;	---------------------------------
; Function initialize_graphics
; ---------------------------------
_initialize_graphics::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-366
	add	hl, sp
	ld	sp, hl
	C$main.c$116$1_0$171	= .
	.globl	C$main.c$116$1_0$171
;src/main.c:116: ser = open("#SER0",O_WRONLY);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #___str_2
	call	_open
	C$main.c$117$1_0$171	= .
	.globl	C$main.c$117$1_0$171
;src/main.c:117: if (ser < 0) {
	ld	(_ser+0), a
	bit	7, a
	jr	Z, 00102$
	C$main.c$118$2_0$172	= .
	.globl	C$main.c$118$2_0$172
;src/main.c:118: printf("Failed to open serial port\n");
	ld	hl, #___str_4
	call	_puts
	C$main.c$119$2_0$172	= .
	.globl	C$main.c$119$2_0$172
;src/main.c:119: exit(1);
	ld	a, #0x01
	call	_exit
00102$:
	C$main.c$121$1_0$171	= .
	.globl	C$main.c$121$1_0$171
;src/main.c:121: debug_log("Initializing...");
	ld	hl, #___str_5
	call	_debug_log
	C$main.c$125$1_0$171	= .
	.globl	C$main.c$125$1_0$171
;src/main.c:125: gfx_initialize(ZVB_CTRL_VID_MODE_GFX_640_8BIT, &ctx);
	ld	de, #_ctx
	ld	a, #0x04
	call	_gfx_initialize
	C$main.c$128$1_1$173	= .
	.globl	C$main.c$128$1_1$173
;src/main.c:128: memset(mapline,0,sizeof(mapline));
	ld	hl, #256
	add	hl, sp
	ld	b, #0x50
00309$:
	ld	(hl), #0x00
	inc	hl
	djnz	00309$
	C$main.c$129$5_1$177	= .
	.globl	C$main.c$129$5_1$177
;src/main.c:129: for(int layer=0;layer<2;layer++) {
	ld	-3 (ix), #0x00
00115$:
	ld	a, -3 (ix)
	sub	a, #0x02
	jr	NC, 00104$
	C$main.c$130$1_3$171	= .
	.globl	C$main.c$130$1_3$171
;src/main.c:130: for(int y=0;y<80;y++)
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00112$:
	ld	a, -2 (ix)
	sub	a, #0x50
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00116$
	C$main.c$132$5_1$177	= .
	.globl	C$main.c$132$5_1$177
;src/main.c:132: gfx_tilemap_load(&ctx, mapline, sizeof(mapline), layer, 0, y);
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -3 (ix)
	ld	-4 (ix), a
	ld	h, -5 (ix)
	ld	l, #0x00
	push	hl
	ld	h, -4 (ix)
	ld	l, #0x50
	push	hl
	ld	hl, #260
	add	hl, sp
	ex	de, hl
	ld	hl, #_ctx
	call	_gfx_tilemap_load
	C$main.c$130$4_1$176	= .
	.globl	C$main.c$130$4_1$176
;src/main.c:130: for(int y=0;y<80;y++)
	inc	-2 (ix)
	jr	NZ, 00112$
	inc	-1 (ix)
	jr	00112$
00116$:
	C$main.c$129$2_1$174	= .
	.globl	C$main.c$129$2_1$174
;src/main.c:129: for(int layer=0;layer<2;layer++) {
	inc	-3 (ix)
	jr	00115$
00104$:
	C$main.c$135$1_1$173	= .
	.globl	C$main.c$135$1_1$173
;src/main.c:135: gfx_tileset_add_color_tile(&ctx,254,254);
	ld	a, #0xfe
	push	af
	inc	sp
	ld	de, #0x00fe
	ld	hl, #_ctx
	call	_gfx_tileset_add_color_tile
	C$main.c$136$1_1$173	= .
	.globl	C$main.c$136$1_1$173
;src/main.c:136: gfx_tileset_add_color_tile(&ctx,255,255);
	ld	a, #0xff
	push	af
	inc	sp
	ld	de, #0x00ff
	ld	hl, #_ctx
	call	_gfx_tileset_add_color_tile
	C$main.c$139$1_1$173	= .
	.globl	C$main.c$139$1_1$173
;src/main.c:139: clear_sprites();
	call	_clear_sprites
	C$main.c$144$2_1$178	= .
	.globl	C$main.c$144$2_1$178
;src/main.c:144: const uint16_t solid_color[2]={(uint16_t)RGB888_TO_RGB565(0xF,0xF,0x00),(uint16_t)RGB888_TO_RGB565(0xE0,0xE0,0x00)}; // Yellow and dark yellow
	ld	-30 (ix), #0x60
	ld	-29 (ix), #0x08
	ld	-28 (ix), #0x00
	ld	-27 (ix), #0xe7
	C$main.c$145$1_2$178	= .
	.globl	C$main.c$145$1_2$178
;src/main.c:145: gfx_palette_load(&ctx,solid_color,4,254);
	ld	a, #0xfe
	push	af
	inc	sp
	ld	hl, #0x0004
	push	hl
	ld	hl, #339
	add	hl, sp
	ex	de, hl
	ld	hl, #_ctx
	call	_gfx_palette_load
	C$main.c$150$2_2$179	= .
	.globl	C$main.c$150$2_2$179
;src/main.c:150: const char circle[8] = {0x18, 0x3C, 0x7E, 0xFF, 0xFF, 0x7E, 0x3C, 0x18};
	ld	-26 (ix), #0x18
	ld	-25 (ix), #0x3c
	ld	-24 (ix), #0x7e
	ld	-23 (ix), #0xff
	ld	-22 (ix), #0xff
	ld	-21 (ix), #0x7e
	ld	-20 (ix), #0x3c
	ld	-19 (ix), #0x18
	C$main.c$151$1_3$179	= .
	.globl	C$main.c$151$1_3$179
;src/main.c:151: memset(buffer, 0, sizeof(buffer));
	ld	hl, #0
	add	hl, sp
	ld	b, #0x80
00312$:
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	djnz	00312$
	C$main.c$152$4_3$188	= .
	.globl	C$main.c$152$4_3$188
;src/main.c:152: for(uint8_t k=0;k<16;k++) {
	ld	-3 (ix), #0x00
00127$:
	ld	a, -3 (ix)
	sub	a, #0x10
	jp	NC, 00108$
	C$main.c$153$1_3$171	= .
	.globl	C$main.c$153$1_3$171
;src/main.c:153: for(uint8_t bit=0;bit<4;bit++) {
	ld	-2 (ix), #0x00
00124$:
	C$main.c$154$1_3$171	= .
	.globl	C$main.c$154$1_3$171
;src/main.c:154: uint8_t color = (k & (1 << bit)) ? 0xFF : 0xFE; // Use 0xFF for white, 0xFE for light gray
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	C$main.c$153$4_3$182	= .
	.globl	C$main.c$153$4_3$182
;src/main.c:153: for(uint8_t bit=0;bit<4;bit++) {
	ld	a, -2 (ix)
	sub	a, #0x04
	jp	NC, 00107$
	C$main.c$154$5_3$183	= .
	.globl	C$main.c$154$5_3$183
;src/main.c:154: uint8_t color = (k & (1 << bit)) ? 0xFF : 0xFE; // Use 0xFF for white, 0xFE for light gray
	ld	b, -2 (ix)
	ld	hl, #0x0001
	inc	b
	jr	00315$
00314$:
	add	hl, hl
00315$:
	djnz	00314$
	ld	a, l
	and	a, -5 (ix)
	ld	c, a
	ld	a, h
	and	a, -4 (ix)
	or	a, c
	ld	a, #0xff
	jr	NZ, 00138$
	ld	a, #0xfe
00138$:
	ld	-9 (ix), a
	C$main.c$155$5_3$183	= .
	.globl	C$main.c$155$5_3$183
;src/main.c:155: uint8_t offset = ((bit & 1)?8:0) + ((bit & 2)?128:0);
	bit	0, -2 (ix)
	ld	c, #0x08
	jr	NZ, 00140$
	ld	c, #0x00
00140$:
	bit	1, -2 (ix)
	ld	a, #0x80
	jr	NZ, 00142$
	xor	a, a
00142$:
	add	a, c
	ld	-8 (ix), a
	C$main.c$157$1_3$171	= .
	.globl	C$main.c$157$1_3$171
;src/main.c:157: for(uint8_t i=0;i<8;i++) {
	ld	e, #0x00
00121$:
	ld	a, e
	sub	a, #0x08
	jr	NC, 00125$
	C$main.c$158$8_3$186	= .
	.globl	C$main.c$158$8_3$186
;src/main.c:158: uint8_t mask=128;
	ld	c, #0x80
	C$main.c$159$9_3$187	= .
	.globl	C$main.c$159$9_3$187
;src/main.c:159: for(uint8_t j=0;j<8;j++) {
	push	de
	ld	d, #0x00
	ld	hl, #342
	add	hl, sp
	add	hl, de
	pop	de
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	-1 (ix), #0x00
00118$:
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	NC, 00122$
	C$main.c$160$9_3$187	= .
	.globl	C$main.c$160$9_3$187
;src/main.c:160: buffer[offset+(i<<4)+j] = (circle[i] & mask) ? color : 0x00;
	ld	a, -8 (ix)
	ld	b, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	ld	b, #0x00
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, h
	ld	d, a
	push	de
	ld	e, l
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	and	a,c
	jr	Z, 00143$
	ld	a, -9 (ix)
	jr	00144$
00143$:
	xor	a, a
00144$:
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), a
	C$main.c$161$9_3$187	= .
	.globl	C$main.c$161$9_3$187
;src/main.c:161: mask >>= 1;
	srl	c
	C$main.c$159$8_3$186	= .
	.globl	C$main.c$159$8_3$186
;src/main.c:159: for(uint8_t j=0;j<8;j++) {
	inc	-1 (ix)
	jr	00118$
00122$:
	C$main.c$157$6_3$184	= .
	.globl	C$main.c$157$6_3$184
;src/main.c:157: for(uint8_t i=0;i<8;i++) {
	inc	e
	jr	00121$
00125$:
	C$main.c$153$4_3$182	= .
	.globl	C$main.c$153$4_3$182
;src/main.c:153: for(uint8_t bit=0;bit<4;bit++) {
	inc	-2 (ix)
	jp	00124$
00107$:
	C$main.c$165$4_3$188	= .
	.globl	C$main.c$165$4_3$188
;src/main.c:165: gfx_tileset_options options1 = {TILESET_COMP_NONE, (192+k)*256, 0, 0};
	ld	-18 (ix), #0x00
	ld	hl, #348+1
	add	hl, sp
	ex	de, hl
	ld	a, -5 (ix)
	add	a, #0xc0
	ld	b, a
	xor	a, a
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ld	-15 (ix), #0x00
	ld	-14 (ix), #0x00
	C$main.c$166$3_4$188	= .
	.globl	C$main.c$166$3_4$188
;src/main.c:166: gfx_tileset_load(&ctx, buffer, 256, &options1);
	ld	hl, #348
	add	hl, sp
	push	hl
	ld	hl, #0x0100
	push	hl
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #_ctx
	call	_gfx_tileset_load
	C$main.c$152$2_3$180	= .
	.globl	C$main.c$152$2_3$180
;src/main.c:152: for(uint8_t k=0;k<16;k++) {
	inc	-3 (ix)
	jp	00127$
00108$:
	C$main.c$170$1_3$179	= .
	.globl	C$main.c$170$1_3$179
;src/main.c:170: memset(buffer, 0, sizeof(buffer));
	ld	hl, #0
	add	hl, sp
	ld	b, #0x80
00318$:
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	djnz	00318$
	C$main.c$171$5_3$192	= .
	.globl	C$main.c$171$5_3$192
;src/main.c:171: for(int y=0;y<16;y++) {
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
00133$:
	ld	a, -4 (ix)
	sub	a, #0x10
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00110$
	C$main.c$172$5_3$192	= .
	.globl	C$main.c$172$5_3$192
;src/main.c:172: for(int x=0;x<40;x++) {
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #0x0050
	add	hl, de
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-11 (ix), l
	ld	-10 (ix), h
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00130$:
	ld	a, -2 (ix)
	sub	a, #0x28
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00134$
	C$main.c$174$5_3$192	= .
	.globl	C$main.c$174$5_3$192
;src/main.c:174: buffer[80+(y>>1)*20+(x>>1)] |= 192 | (header_data[y*40+x] ? (1 << ((x&1)+(y&1)*2)) : 0);
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	sra	b
	rr	c
	ld	a, c
	add	a, -13 (ix)
	ld	c, a
	ld	a, b
	adc	a, -12 (ix)
	ld	b, a
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, -11 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -10 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_header_data
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
	ld	a, -2 (ix)
	and	a, #0x01
	ld	c, a
	ld	a, -4 (ix)
	and	a, #0x01
	add	a, a
	add	a, c
	ld	b, a
	ld	a, #0x01
	inc	b
	jr	00321$
00320$:
	add	a, a
00321$:
	djnz	00320$
	ld	-6 (ix), a
	rlca
	sbc	a, a
	ld	-5 (ix), a
	jr	00146$
00145$:
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
00146$:
	ld	a, -6 (ix)
	or	a, #0xc0
	or	a, -7 (ix)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	C$main.c$172$4_3$191	= .
	.globl	C$main.c$172$4_3$191
;src/main.c:172: for(int x=0;x<40;x++) {
	inc	-2 (ix)
	jp	NZ,00130$
	inc	-1 (ix)
	jp	00130$
00134$:
	C$main.c$171$2_3$189	= .
	.globl	C$main.c$171$2_3$189
;src/main.c:171: for(int y=0;y<16;y++) {
	inc	-4 (ix)
	jp	NZ,00133$
	inc	-3 (ix)
	jp	00133$
00110$:
	C$main.c$177$1_3$179	= .
	.globl	C$main.c$177$1_3$179
;src/main.c:177: show_map_xy(buffer,20,12,10,4);
	ld	hl, #0x40a
	push	hl
	ld	hl, #0xc14
	push	hl
	ld	hl, #4
	add	hl, sp
	call	_show_map_xy
	C$main.c$179$1_3$179	= .
	.globl	C$main.c$179$1_3$179
;src/main.c:179: draw_ascii();
	call	_draw_ascii
	C$main.c$185$1_3$179	= .
	.globl	C$main.c$185$1_3$179
;src/main.c:185: debug_log("Initalized.");
	ld	hl, #___str_6
	call	_debug_log
	C$main.c$187$1_3$171	= .
	.globl	C$main.c$187$1_3$171
;src/main.c:187: }
	ld	sp, ix
	pop	ix
	C$main.c$187$1_3$171	= .
	.globl	C$main.c$187$1_3$171
	XG$initialize_graphics$0$0	= .
	.globl	XG$initialize_graphics$0$0
	ret
Fmain$__str_2$0_0$0 == .
___str_2:
	.ascii "#SER0"
	.db 0x00
Fmain$__str_4$0_0$0 == .
___str_4:
	.ascii "Failed to open serial port"
	.db 0x00
Fmain$__str_5$0_0$0 == .
___str_5:
	.ascii "Initializing..."
	.db 0x00
Fmain$__str_6$0_0$0 == .
___str_6:
	.ascii "Initalized."
	.db 0x00
	G$show_map$0$0	= .
	.globl	G$show_map$0$0
	C$main.c$189$1_3$195	= .
	.globl	C$main.c$189$1_3$195
;src/main.c:189: void show_map(uint8_t *map,uint8_t width,uint8_t height)
;	---------------------------------
; Function show_map
; ---------------------------------
_show_map::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$main.c$192$3_0$196	= .
	.globl	C$main.c$192$3_0$196
;src/main.c:192: for(int y=0;y<height;y++)
	ld	bc, #0x0000
00103$:
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
	C$main.c$194$3_0$196	= .
	.globl	C$main.c$194$3_0$196
;src/main.c:194: gfx_tilemap_load(&ctx, &map[width*y], width, layer, 0, y);
	ld	-3 (ix), c
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	e, c
	ld	d, b
	call	__mulint
	pop	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	bc
	ex	de, hl
	ld	h, -3 (ix)
	ld	l, #0x00
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #_ctx
	call	_gfx_tilemap_load
	pop	bc
	C$main.c$192$2_0$195	= .
	.globl	C$main.c$192$2_0$195
;src/main.c:192: for(int y=0;y<height;y++)
	inc	bc
	jr	00103$
00105$:
	C$main.c$196$2_0$195	= .
	.globl	C$main.c$196$2_0$195
;src/main.c:196: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$show_map1$0$0	= .
	.globl	G$show_map1$0$0
	C$main.c$197$2_0$199	= .
	.globl	C$main.c$197$2_0$199
;src/main.c:197: void show_map1(uint8_t *map,uint8_t width,uint8_t height)
;	---------------------------------
; Function show_map1
; ---------------------------------
_show_map1::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$main.c$200$3_0$200	= .
	.globl	C$main.c$200$3_0$200
;src/main.c:200: for(int y=0;y<height;y++)
	ld	bc, #0x0000
00103$:
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
	C$main.c$202$3_0$200	= .
	.globl	C$main.c$202$3_0$200
;src/main.c:202: gfx_tilemap_load(&ctx, &map[width*y], width, layer, 0, y);
	ld	-3 (ix), c
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	e, c
	ld	d, b
	call	__mulint
	pop	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -3 (ix)
	push	af
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #_ctx
	call	_gfx_tilemap_load
	pop	bc
	C$main.c$200$2_0$199	= .
	.globl	C$main.c$200$2_0$199
;src/main.c:200: for(int y=0;y<height;y++)
	inc	bc
	jr	00103$
00105$:
	C$main.c$204$2_0$199	= .
	.globl	C$main.c$204$2_0$199
;src/main.c:204: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$show_map_xy$0$0	= .
	.globl	G$show_map_xy$0$0
	C$main.c$206$2_0$203	= .
	.globl	C$main.c$206$2_0$203
;src/main.c:206: void show_map_xy(uint8_t *map,uint8_t width,uint8_t height,uint8_t x,uint8_t y)
;	---------------------------------
; Function show_map_xy
; ---------------------------------
_show_map_xy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$main.c$209$3_0$204	= .
	.globl	C$main.c$209$3_0$204
;src/main.c:209: for(int j=0;j<height;j++)
	ld	bc, #0x0000
00103$:
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
	C$main.c$211$3_0$204	= .
	.globl	C$main.c$211$3_0$204
;src/main.c:211: gfx_tilemap_load(&ctx, &map[width*j], width, layer, x, y+j);
	ld	a, c
	ld	e, 7 (ix)
	add	a, e
	ld	-3 (ix), a
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	e, c
	ld	d, b
	call	__mulint
	pop	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	bc
	ex	de, hl
	ld	h, -3 (ix)
	ld	l, 6 (ix)
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #_ctx
	call	_gfx_tilemap_load
	pop	bc
	C$main.c$209$2_0$203	= .
	.globl	C$main.c$209$2_0$203
;src/main.c:209: for(int j=0;j<height;j++)
	inc	bc
	jr	00103$
00105$:
	C$main.c$213$2_0$203	= .
	.globl	C$main.c$213$2_0$203
;src/main.c:213: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
	G$show_map_xy1$0$0	= .
	.globl	G$show_map_xy1$0$0
	C$main.c$215$2_0$207	= .
	.globl	C$main.c$215$2_0$207
;src/main.c:215: void show_map_xy1(uint8_t *map,uint8_t width,uint8_t height,uint8_t x,uint8_t y)
;	---------------------------------
; Function show_map_xy1
; ---------------------------------
_show_map_xy1::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$main.c$218$3_0$208	= .
	.globl	C$main.c$218$3_0$208
;src/main.c:218: for(int j=0;j<height;j++)
	ld	bc, #0x0000
00103$:
	ld	e, 5 (ix)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00122$
	xor	a, #0x80
00122$:
	jp	P, 00105$
	C$main.c$220$3_0$208	= .
	.globl	C$main.c$220$3_0$208
;src/main.c:220: gfx_tilemap_load(&ctx, &map[width*j], width, layer, x, y+j);
	ld	a, c
	ld	e, 7 (ix)
	add	a, e
	ld	-3 (ix), a
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	e, c
	ld	d, b
	call	__mulint
	pop	bc
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	bc
	ex	de, hl
	ld	a, -3 (ix)
	push	af
	inc	sp
	ld	h, 6 (ix)
	ld	l, #0x01
	push	hl
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #_ctx
	call	_gfx_tilemap_load
	pop	bc
	C$main.c$218$2_0$207	= .
	.globl	C$main.c$218$2_0$207
;src/main.c:218: for(int j=0;j<height;j++)
	inc	bc
	jr	00103$
00105$:
	C$main.c$222$2_0$207	= .
	.globl	C$main.c$222$2_0$207
;src/main.c:222: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
	G$show_number$0$0	= .
	.globl	G$show_number$0$0
	C$main.c$224$2_0$210	= .
	.globl	C$main.c$224$2_0$210
;src/main.c:224: void show_number(uint16_t number, uint8_t x, uint8_t y)
;	---------------------------------
; Function show_number
; ---------------------------------
_show_number::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	C$main.c$227$1_0$210	= .
	.globl	C$main.c$227$1_0$210
;src/main.c:227: sprintf(buffer, "%u", number);
	push	hl
	ld	hl, #___str_7
	push	hl
	ld	hl, #4
	add	hl, sp
	push	hl
	call	_sprintf
	pop	af
	pop	af
	pop	af
	C$main.c$228$3_0$212	= .
	.globl	C$main.c$228$3_0$212
;src/main.c:228: for(int i=0;buffer[i];i++)
	ld	bc, #0x0000
00103$:
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	d, (hl)
	ld	a, d
	or	a, a
	jr	Z, 00105$
	C$main.c$230$3_0$212	= .
	.globl	C$main.c$230$3_0$212
;src/main.c:230: gfx_tilemap_place(&ctx, buffer[i], 0, x+i, y);
	ld	a, c
	ld	e, 4 (ix)
	add	a, e
	push	bc
	ld	h, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, a
	ld	l, #0x00
	push	hl
	push	de
	inc	sp
	ld	hl, #_ctx
	call	_gfx_tilemap_place
	pop	bc
	C$main.c$228$2_0$211	= .
	.globl	C$main.c$228$2_0$211
;src/main.c:228: for(int i=0;buffer[i];i++)
	inc	bc
	jr	00103$
00105$:
	C$main.c$232$2_0$210	= .
	.globl	C$main.c$232$2_0$210
;src/main.c:232: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
Fmain$__str_7$0_0$0 == .
___str_7:
	.ascii "%u"
	.db 0x00
	G$set_game_state$0$0	= .
	.globl	G$set_game_state$0$0
	C$main.c$234$2_0$214	= .
	.globl	C$main.c$234$2_0$214
;src/main.c:234: void set_game_state(enum GameState new_state) {
;	---------------------------------
; Function set_game_state
; ---------------------------------
_set_game_state::
	C$main.c$237$1_0$214	= .
	.globl	C$main.c$237$1_0$214
;src/main.c:237: switch(current_state) {
	ld	(_current_state+0),a
	or	a,a
	ret	Z
	dec	a
	jp	Z,_game_init
	C$main.c$239$2_0$215	= .
	.globl	C$main.c$239$2_0$215
;src/main.c:239: game_init();
	ret
	C$main.c$244$1_0$214	= .
	.globl	C$main.c$244$1_0$214
;src/main.c:244: }
	C$main.c$245$1_0$214	= .
	.globl	C$main.c$245$1_0$214
;src/main.c:245: }
	C$main.c$245$1_0$214	= .
	.globl	C$main.c$245$1_0$214
	XG$set_game_state$0$0	= .
	.globl	XG$set_game_state$0$0
	ret
	G$reset_sprite$0$0	= .
	.globl	G$reset_sprite$0$0
	C$main.c$247$1_0$217	= .
	.globl	C$main.c$247$1_0$217
;src/main.c:247: void reset_sprite(void)
;	---------------------------------
; Function reset_sprite
; ---------------------------------
_reset_sprite::
	C$main.c$249$1_0$217	= .
	.globl	C$main.c$249$1_0$217
;src/main.c:249: last_sprite_count = sprite_count;
	ld	a, (_sprite_count+0)
	ld	(_last_sprite_count+0), a
	C$main.c$250$1_0$217	= .
	.globl	C$main.c$250$1_0$217
;src/main.c:250: sprite_count=0;
	ld	hl, #_sprite_count
	ld	(hl), #0x00
	C$main.c$251$1_0$217	= .
	.globl	C$main.c$251$1_0$217
;src/main.c:251: }
	C$main.c$251$1_0$217	= .
	.globl	C$main.c$251$1_0$217
	XG$reset_sprite$0$0	= .
	.globl	XG$reset_sprite$0$0
	ret
	G$add_sprite$0$0	= .
	.globl	G$add_sprite$0$0
	C$main.c$253$1_0$219	= .
	.globl	C$main.c$253$1_0$219
;src/main.c:253: uint8_t add_sprite(uint16_t x, uint16_t y, uint8_t tile, uint16_t flags)
;	---------------------------------
; Function add_sprite
; ---------------------------------
_add_sprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	C$main.c$255$1_0$219	= .
	.globl	C$main.c$255$1_0$219
;src/main.c:255: if(sprite_count >= 128) return 255;
	ld	a, (_sprite_count+0)
	sub	a, #0x80
	jr	C, 00102$
	ld	a, #0xff
	jr	00103$
00102$:
	C$main.c$256$1_0$219	= .
	.globl	C$main.c$256$1_0$219
;src/main.c:256: sprites[sprite_count].x = x+16; // Note sprites are displayed anchored the bottom right corner
	ld	a, (_sprite_count+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_sprites
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	a, c
	add	a, #0x10
	ld	c, a
	jr	NC, 00112$
	inc	b
00112$:
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$main.c$257$1_0$219	= .
	.globl	C$main.c$257$1_0$219
;src/main.c:257: sprites[sprite_count].y = y+16;
	ld	a, (_sprite_count+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_sprites
	add	hl, bc
	ld	a, e
	add	a, #0x10
	ld	e, a
	jr	NC, 00113$
	inc	d
00113$:
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$main.c$258$1_0$219	= .
	.globl	C$main.c$258$1_0$219
;src/main.c:258: sprites[sprite_count].tile = tile;
	ld	a, (_sprite_count+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_sprites
	add	hl, de
	ld	bc, #0x0004
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
	C$main.c$259$1_0$219	= .
	.globl	C$main.c$259$1_0$219
;src/main.c:259: sprites[sprite_count].flags = flags;
	ld	a, (_sprite_count+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_sprites
	add	hl, de
	ld	bc, #0x0005
	add	hl, bc
	ld	a, 5 (ix)
	ld	(hl), a
	C$main.c$260$1_0$219	= .
	.globl	C$main.c$260$1_0$219
;src/main.c:260: sprite_count++;
	ld	iy, #_sprite_count
	inc	0 (iy)
	C$main.c$261$1_0$219	= .
	.globl	C$main.c$261$1_0$219
;src/main.c:261: return sprite_count-1;
	ld	a, (_sprite_count+0)
	dec	a
00103$:
	C$main.c$262$1_0$219	= .
	.globl	C$main.c$262$1_0$219
;src/main.c:262: }
	pop	ix
	pop	hl
	pop	bc
	inc	sp
	jp	(hl)
	G$update_sprite$0$0	= .
	.globl	G$update_sprite$0$0
	C$main.c$264$1_0$221	= .
	.globl	C$main.c$264$1_0$221
;src/main.c:264: uint8_t update_sprite(uint8_t index, uint16_t x, uint16_t y, uint8_t tile, uint16_t flags)
;	---------------------------------
; Function update_sprite
; ---------------------------------
_update_sprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$main.c$266$1_0$221	= .
	.globl	C$main.c$266$1_0$221
;src/main.c:266: if(index >= 128) return 255;
	ld	-1 (ix), a
	sub	a, #0x80
	jr	C, 00102$
	ld	a, #0xff
	jr	00103$
00102$:
	C$main.c$267$1_0$221	= .
	.globl	C$main.c$267$1_0$221
;src/main.c:267: sprites[index].x = x+16; // Note sprites are displayed anchored the bottom right corner
	ld	bc, #_sprites+0
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, e
	add	a, #0x10
	ld	e, a
	jr	NC, 00112$
	inc	d
00112$:
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$main.c$268$1_0$221	= .
	.globl	C$main.c$268$1_0$221
;src/main.c:268: sprites[index].y = y+16;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	ld	hl, #0x0010
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$main.c$269$1_0$221	= .
	.globl	C$main.c$269$1_0$221
;src/main.c:269: sprites[index].tile = tile;
	ld	hl, #0x0004
	add	hl, bc
	ld	a, 6 (ix)
	ld	(hl), a
	C$main.c$270$1_0$221	= .
	.globl	C$main.c$270$1_0$221
;src/main.c:270: sprites[index].flags = flags;
	ld	hl, #0x0005
	add	hl, bc
	ld	a, 7 (ix)
	ld	(hl), a
	C$main.c$271$1_0$221	= .
	.globl	C$main.c$271$1_0$221
;src/main.c:271: return index;
	ld	a, -1 (ix)
00103$:
	C$main.c$272$1_0$221	= .
	.globl	C$main.c$272$1_0$221
;src/main.c:272: }
	inc	sp
	pop	ix
	pop	hl
	pop	bc
	pop	bc
	inc	sp
	jp	(hl)
	G$render_sprites$0$0	= .
	.globl	G$render_sprites$0$0
	C$main.c$274$1_0$223	= .
	.globl	C$main.c$274$1_0$223
;src/main.c:274: void render_sprites(void)
;	---------------------------------
; Function render_sprites
; ---------------------------------
_render_sprites::
	C$main.c$276$2_0$223	= .
	.globl	C$main.c$276$2_0$223
;src/main.c:276: uint8_t count = sprite_count;
	ld	a, (_sprite_count+0)
	C$main.c$277$1_0$223	= .
	.globl	C$main.c$277$1_0$223
;src/main.c:277: if(count < last_sprite_count) {
	ld	d, a
	ld	hl, #_last_sprite_count
	sub	a, (hl)
	jr	NC, 00102$
	C$main.c$279$2_0$224	= .
	.globl	C$main.c$279$2_0$224
;src/main.c:279: memset(&sprites[sprite_count], 0, (last_sprite_count - sprite_count) * sizeof(gfx_sprite));
	ld	bc, #_sprites+0
	ld	a, (_sprite_count+0)
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (_last_sprite_count+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	de, #0x0000
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_memset
	C$main.c$280$2_0$224	= .
	.globl	C$main.c$280$2_0$224
;src/main.c:280: count = last_sprite_count;
	ld	a, (_last_sprite_count+0)
	ld	d, a
00102$:
	C$main.c$282$1_0$223	= .
	.globl	C$main.c$282$1_0$223
;src/main.c:282: gfx_sprite_render_array(&ctx, 0, sprites, count);
	push	de
	inc	sp
	ld	hl, #_sprites
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_ctx
	call	_gfx_sprite_render_array
	C$main.c$283$1_0$223	= .
	.globl	C$main.c$283$1_0$223
;src/main.c:283: }
	C$main.c$283$1_0$223	= .
	.globl	C$main.c$283$1_0$223
	XG$render_sprites$0$0	= .
	.globl	XG$render_sprites$0$0
	ret
	G$clear_sprites$0$0	= .
	.globl	G$clear_sprites$0$0
	C$main.c$285$1_0$226	= .
	.globl	C$main.c$285$1_0$226
;src/main.c:285: void clear_sprites(void)
;	---------------------------------
; Function clear_sprites
; ---------------------------------
_clear_sprites::
	C$main.c$287$1_0$226	= .
	.globl	C$main.c$287$1_0$226
;src/main.c:287: memset(sprites, 0, sizeof(sprites));
	ld	hl, #_sprites
	ld	(hl), #0x00
	ld	e, l
	ld	d, h
	inc	de
	ld	bc, #0x03ff
	ldir
	C$main.c$288$1_0$226	= .
	.globl	C$main.c$288$1_0$226
;src/main.c:288: sprite_count=128;
	ld	hl, #_sprite_count
	ld	(hl), #0x80
	C$main.c$289$1_0$226	= .
	.globl	C$main.c$289$1_0$226
;src/main.c:289: render_sprites();
	call	_render_sprites
	C$main.c$290$1_0$226	= .
	.globl	C$main.c$290$1_0$226
;src/main.c:290: sprite_count=0;
	ld	hl, #_sprite_count
	ld	(hl), #0x00
	C$main.c$291$1_0$226	= .
	.globl	C$main.c$291$1_0$226
;src/main.c:291: }
	C$main.c$291$1_0$226	= .
	.globl	C$main.c$291$1_0$226
	XG$clear_sprites$0$0	= .
	.globl	XG$clear_sprites$0$0
	ret
	G$handle_input$0$0	= .
	.globl	G$handle_input$0$0
	C$main.c$293$1_0$228	= .
	.globl	C$main.c$293$1_0$228
;src/main.c:293: uint8_t handle_input(uint8_t key)
;	---------------------------------
; Function handle_input
; ---------------------------------
_handle_input::
	C$main.c$295$1_0$228	= .
	.globl	C$main.c$295$1_0$228
;src/main.c:295: switch(key)
	cp	a, #0x08
	jr	Z, 00113$
	cp	a, #0x0a
	jr	Z, 00118$
	cp	a, #0x20
	jr	Z, 00111$
	cp	a, #0x27
	jr	Z, 00120$
	cp	a, #0x2c
	jr	Z, 00115$
	cp	a, #0x2e
	jr	Z, 00117$
	cp	a, #0x5b
	jr	Z, 00122$
	cp	a, #0x5d
	jr	Z, 00124$
	cp	a, #0x61
	jr	Z, 00107$
	cp	a, #0x62
	jr	Z, 00113$
	cp	a, #0x64
	jr	Z, 00109$
	cp	a, #0x65
	jr	Z, 00124$
	cp	a, #0x71
	jr	Z, 00122$
	cp	a, #0x73
	jr	Z, 00105$
	cp	a, #0x76
	jr	Z, 00111$
	cp	a, #0x77
	jr	Z, 00103$
	cp	a, #0x78
	jr	Z, 00115$
	cp	a, #0x79
	jr	Z, 00117$
	cp	a, #0x96
	jr	Z, 00120$
	cp	a, #0xa0
	jr	Z, 00103$
	cp	a, #0xa1
	jr	Z, 00105$
	cp	a, #0xa2
	jr	Z, 00107$
	cp	a, #0xa3
	jr	Z, 00109$
	sub	a, #0xf0
	jr	NZ, 00125$
	C$main.c$298$2_0$229	= .
	.globl	C$main.c$298$2_0$229
;src/main.c:298: done = true;
	ld	hl, #_done
	ld	(hl), #0x01
	C$main.c$299$2_0$229	= .
	.globl	C$main.c$299$2_0$229
;src/main.c:299: return MAX_INPUT;
	ld	a, #0x0c
	ret
	C$main.c$301$2_0$229	= .
	.globl	C$main.c$301$2_0$229
;src/main.c:301: case KB_UP_ARROW:
00103$:
	C$main.c$302$2_0$229	= .
	.globl	C$main.c$302$2_0$229
;src/main.c:302: return INPUT_UP;
	xor	a, a
	ret
	C$main.c$304$2_0$229	= .
	.globl	C$main.c$304$2_0$229
;src/main.c:304: case KB_DOWN_ARROW:
00105$:
	C$main.c$305$2_0$229	= .
	.globl	C$main.c$305$2_0$229
;src/main.c:305: return INPUT_DOWN;
	ld	a, #0x01
	ret
	C$main.c$307$2_0$229	= .
	.globl	C$main.c$307$2_0$229
;src/main.c:307: case KB_LEFT_ARROW:
00107$:
	C$main.c$308$2_0$229	= .
	.globl	C$main.c$308$2_0$229
;src/main.c:308: return INPUT_LEFT;
	ld	a, #0x02
	ret
	C$main.c$310$2_0$229	= .
	.globl	C$main.c$310$2_0$229
;src/main.c:310: case KB_RIGHT_ARROW:
00109$:
	C$main.c$311$2_0$229	= .
	.globl	C$main.c$311$2_0$229
;src/main.c:311: return INPUT_RIGHT;
	ld	a, #0x03
	ret
	C$main.c$313$2_0$229	= .
	.globl	C$main.c$313$2_0$229
;src/main.c:313: case KB_KEY_SPACE:
00111$:
	C$main.c$314$2_0$229	= .
	.globl	C$main.c$314$2_0$229
;src/main.c:314: return INPUT_A;
	ld	a, #0x04
	ret
	C$main.c$316$2_0$229	= .
	.globl	C$main.c$316$2_0$229
;src/main.c:316: case KB_KEY_B:
00113$:
	C$main.c$317$2_0$229	= .
	.globl	C$main.c$317$2_0$229
;src/main.c:317: return INPUT_B;
	ld	a, #0x05
	ret
	C$main.c$319$2_0$229	= .
	.globl	C$main.c$319$2_0$229
;src/main.c:319: case KB_KEY_X:
00115$:
	C$main.c$320$2_0$229	= .
	.globl	C$main.c$320$2_0$229
;src/main.c:320: return INPUT_X;
	ld	a, #0x06
	ret
	C$main.c$322$2_0$229	= .
	.globl	C$main.c$322$2_0$229
;src/main.c:322: case KB_KEY_Y:
00117$:
	C$main.c$323$2_0$229	= .
	.globl	C$main.c$323$2_0$229
;src/main.c:323: return INPUT_Y;
	ld	a, #0x07
	ret
	C$main.c$324$2_0$229	= .
	.globl	C$main.c$324$2_0$229
;src/main.c:324: case KB_KEY_ENTER:
00118$:
	C$main.c$325$2_0$229	= .
	.globl	C$main.c$325$2_0$229
;src/main.c:325: return INPUT_START;
	ld	a, #0x08
	ret
	C$main.c$327$2_0$229	= .
	.globl	C$main.c$327$2_0$229
;src/main.c:327: case KB_RIGHT_SHIFT:
00120$:
	C$main.c$328$2_0$229	= .
	.globl	C$main.c$328$2_0$229
;src/main.c:328: return INPUT_SELECT;
	ld	a, #0x09
	ret
	C$main.c$330$2_0$229	= .
	.globl	C$main.c$330$2_0$229
;src/main.c:330: case KB_KEY_Q:
00122$:
	C$main.c$331$2_0$229	= .
	.globl	C$main.c$331$2_0$229
;src/main.c:331: return INPUT_L;
	ld	a, #0x0a
	ret
	C$main.c$333$2_0$229	= .
	.globl	C$main.c$333$2_0$229
;src/main.c:333: case KB_KEY_E:
00124$:
	C$main.c$334$2_0$229	= .
	.globl	C$main.c$334$2_0$229
;src/main.c:334: return INPUT_R;
	ld	a, #0x0b
	ret
	C$main.c$335$2_0$229	= .
	.globl	C$main.c$335$2_0$229
;src/main.c:335: default:
00125$:
	C$main.c$336$2_0$229	= .
	.globl	C$main.c$336$2_0$229
;src/main.c:336: return MAX_INPUT;
	ld	a, #0x0c
	C$main.c$337$1_0$228	= .
	.globl	C$main.c$337$1_0$228
;src/main.c:337: }
	C$main.c$338$1_0$228	= .
	.globl	C$main.c$338$1_0$228
;src/main.c:338: }
	C$main.c$338$1_0$228	= .
	.globl	C$main.c$338$1_0$228
	XG$handle_input$0$0	= .
	.globl	XG$handle_input$0$0
	ret
	G$send_input$0$0	= .
	.globl	G$send_input$0$0
	C$main.c$340$1_0$231	= .
	.globl	C$main.c$340$1_0$231
;src/main.c:340: void send_input(uint8_t input, bool down)
;	---------------------------------
; Function send_input
; ---------------------------------
_send_input::
	ld	c, a
	C$main.c$342$1_0$231	= .
	.globl	C$main.c$342$1_0$231
;src/main.c:342: switch(current_state) {
	ld	a, (_current_state+0)
	or	a, a
	ret	Z
	ld	a, (_current_state+0)
	dec	a
	ret	NZ
	C$main.c$344$2_0$232	= .
	.globl	C$main.c$344$2_0$232
;src/main.c:344: game_handle_input(input, down);
	ld	a, c
	C$main.c$349$1_0$231	= .
	.globl	C$main.c$349$1_0$231
;src/main.c:349: }
	C$main.c$350$1_0$231	= .
	.globl	C$main.c$350$1_0$231
;src/main.c:350: }
	C$main.c$350$1_0$231	= .
	.globl	C$main.c$350$1_0$231
	XG$send_input$0$0	= .
	.globl	XG$send_input$0$0
	jp	_game_handle_input
	G$process_input$0$0	= .
	.globl	G$process_input$0$0
	C$main.c$352$1_0$234	= .
	.globl	C$main.c$352$1_0$234
;src/main.c:352: void process_input(void)
;	---------------------------------
; Function process_input
; ---------------------------------
_process_input::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-35
	add	hl, sp
	ld	sp, hl
	C$main.c$356$2_0$234	= .
	.globl	C$main.c$356$2_0$234
;src/main.c:356: bool pressed = true;
	ld	-1 (ix), #0x01
	C$main.c$358$2_0$235	= .
	.globl	C$main.c$358$2_0$235
;src/main.c:358: do {
00108$:
	C$main.c$359$2_0$235	= .
	.globl	C$main.c$359$2_0$235
;src/main.c:359: size=32;
	ld	-3 (ix), #0x20
	ld	-2 (ix), #0
	C$main.c$360$2_0$235	= .
	.globl	C$main.c$360$2_0$235
;src/main.c:360: read(DEV_STDIN, &keys, &size);
	ld	hl, #32
	add	hl, sp
	push	hl
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	ld	a, #0x01
	call	_read
	C$main.c$361$1_0$234	= .
	.globl	C$main.c$361$1_0$234
;src/main.c:361: for(int i=0;i<size;i++) {
	ld	de, #0x0000
00112$:
	ld	a, e
	sub	a, -3 (ix)
	ld	a, d
	sbc	a, -2 (ix)
	jp	PO, 00151$
	xor	a, #0x80
00151$:
	jp	P, 00109$
	C$main.c$362$4_0$237	= .
	.globl	C$main.c$362$4_0$237
;src/main.c:362: char key = keys[i];
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	c, (hl)
	C$main.c$364$4_0$237	= .
	.globl	C$main.c$364$4_0$237
;src/main.c:364: if(key == KB_RELEASED) {
	ld	a, c
	sub	a, #0xfe
	jr	NZ, 00104$
	C$main.c$365$5_0$238	= .
	.globl	C$main.c$365$5_0$238
;src/main.c:365: pressed = false;
	ld	-1 (ix), #0x00
	jr	00106$
00104$:
	C$main.c$367$5_0$239	= .
	.globl	C$main.c$367$5_0$239
;src/main.c:367: uint8_t input = handle_input(key);
	push	de
	ld	a, c
	call	_handle_input
	ld	c, a
	pop	de
	C$main.c$368$5_0$239	= .
	.globl	C$main.c$368$5_0$239
;src/main.c:368: if(input >= MAX_INPUT) {
	ld	a, c
	sub	a, #0x0c
	jr	C, 00102$
	C$main.c$369$6_0$240	= .
	.globl	C$main.c$369$6_0$240
;src/main.c:369: pressed = true;
	ld	-1 (ix), #0x01
	C$main.c$370$6_0$240	= .
	.globl	C$main.c$370$6_0$240
;src/main.c:370: continue;
	jr	00106$
00102$:
	C$main.c$372$5_0$239	= .
	.globl	C$main.c$372$5_0$239
;src/main.c:372: send_input(input, pressed);
	push	de
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_send_input
	pop	de
	C$main.c$373$5_0$239	= .
	.globl	C$main.c$373$5_0$239
;src/main.c:373: pressed=true;
	ld	-1 (ix), #0x01
00106$:
	C$main.c$361$3_0$236	= .
	.globl	C$main.c$361$3_0$236
;src/main.c:361: for(int i=0;i<size;i++) {
	inc	de
	jr	00112$
00109$:
	C$main.c$376$1_0$234	= .
	.globl	C$main.c$376$1_0$234
;src/main.c:376: } while(size>0);
	xor	a, a
	cp	a, -3 (ix)
	sbc	a, -2 (ix)
	jp	PO, 00154$
	xor	a, #0x80
00154$:
	jp	M, 00108$
	C$main.c$392$1_0$234	= .
	.globl	C$main.c$392$1_0$234
;src/main.c:392: }
	ld	sp, ix
	pop	ix
	C$main.c$392$1_0$234	= .
	.globl	C$main.c$392$1_0$234
	XG$process_input$0$0	= .
	.globl	XG$process_input$0$0
	ret
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$395$1_0$242	= .
	.globl	C$main.c$395$1_0$242
;src/main.c:395: int main(int argc, char *argv[]) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$399$1_0$242	= .
	.globl	C$main.c$399$1_0$242
;src/main.c:399: printf("Starting game...\n");
	ld	hl, #___str_9
	call	_puts
	C$main.c$400$1_0$242	= .
	.globl	C$main.c$400$1_0$242
;src/main.c:400: initialize_graphics();
	call	_initialize_graphics
	C$main.c$402$1_0$242	= .
	.globl	C$main.c$402$1_0$242
;src/main.c:402: set_game_state(STATE_GAME);
	ld	a, #0x01
	call	_set_game_state
	C$main.c$406$1_1$243	= .
	.globl	C$main.c$406$1_1$243
;src/main.c:406: ioctl(DEV_STDIN, KB_CMD_SET_MODE, arg);
	ld	hl, #0x0004
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_ioctl
	C$main.c$410$2_1$244	= .
	.globl	C$main.c$410$2_1$244
;src/main.c:410: while (!done) {
00107$:
	ld	hl, #_done
	bit	0, (hl)
	jr	NZ, 00109$
	C$main.c$412$2_1$244	= .
	.globl	C$main.c$412$2_1$244
;src/main.c:412: process_input();
	call	_process_input
	C$main.c$413$2_1$244	= .
	.globl	C$main.c$413$2_1$244
;src/main.c:413: gfx_wait_end_vblank(&ctx);
	ld	hl, #_ctx
	call	_gfx_wait_end_vblank
	C$main.c$417$2_1$244	= .
	.globl	C$main.c$417$2_1$244
;src/main.c:417: switch(current_state) {
	ld	a, (_current_state+0)
	or	a, a
	jr	Z, 00103$
	ld	a, (_current_state+0)
	dec	a
	jr	NZ, 00103$
	C$main.c$419$3_1$245	= .
	.globl	C$main.c$419$3_1$245
;src/main.c:419: game_update(16);
	ld	hl, #0x0010
	call	_game_update
	C$main.c$424$2_1$244	= .
	.globl	C$main.c$424$2_1$244
;src/main.c:424: }
00103$:
	C$main.c$426$2_1$244	= .
	.globl	C$main.c$426$2_1$244
;src/main.c:426: gfx_wait_vblank(&ctx);
	ld	hl, #_ctx
	call	_gfx_wait_vblank
	C$main.c$428$2_1$244	= .
	.globl	C$main.c$428$2_1$244
;src/main.c:428: switch(current_state) {
	ld	a, (_current_state+0)
	or	a, a
	jr	Z, 00107$
	ld	a, (_current_state+0)
	dec	a
	jr	NZ, 00107$
	C$main.c$430$3_1$246	= .
	.globl	C$main.c$430$3_1$246
;src/main.c:430: game_render();
	call	_game_render
	C$main.c$431$3_1$246	= .
	.globl	C$main.c$431$3_1$246
;src/main.c:431: break;
	jr	00107$
	C$main.c$435$1_1$243	= .
	.globl	C$main.c$435$1_1$243
;src/main.c:435: }
00109$:
	C$main.c$438$1_1$243	= .
	.globl	C$main.c$438$1_1$243
;src/main.c:438: debug_log("Quitting.");
	ld	hl, #___str_10
	call	_debug_log
	C$main.c$441$1_1$243	= .
	.globl	C$main.c$441$1_1$243
;src/main.c:441: memset(sprites, 0, sizeof(sprites));
	ld	hl, #_sprites
	ld	(hl), #0x00
	ld	e, l
	ld	d, h
	inc	de
	ld	bc, #0x03ff
	ldir
	C$main.c$442$1_1$243	= .
	.globl	C$main.c$442$1_1$243
;src/main.c:442: render_sprites();
	call	_render_sprites
	C$main.c$443$1_1$243	= .
	.globl	C$main.c$443$1_1$243
;src/main.c:443: zvb_sound_reset();
	call	_zvb_sound_reset
	C$main.c$444$1_1$243	= .
	.globl	C$main.c$444$1_1$243
;src/main.c:444: ioctl(DEV_STDOUT, CMD_RESET_SCREEN, NULL);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x07
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_ioctl
	C$main.c$447$1_1$243	= .
	.globl	C$main.c$447$1_1$243
;src/main.c:447: printf("Goodbye!\n");
	ld	hl, #___str_15
	call	_puts
	C$main.c$448$1_1$243	= .
	.globl	C$main.c$448$1_1$243
;src/main.c:448: close(ser);
	ld	a, (_ser+0)
	call	_close
	C$main.c$450$1_1$243	= .
	.globl	C$main.c$450$1_1$243
;src/main.c:450: debug_exit_emulator(0);
	xor	a, a
	call	_debug_exit_emulator
	C$main.c$451$1_1$243	= .
	.globl	C$main.c$451$1_1$243
;src/main.c:451: exit(0);
	xor	a, a
	call	_exit
	C$main.c$453$1_1$243	= .
	.globl	C$main.c$453$1_1$243
;src/main.c:453: return 0;
	ld	de, #0x0000
	C$main.c$454$1_1$242	= .
	.globl	C$main.c$454$1_1$242
;src/main.c:454: }
	C$main.c$454$1_1$242	= .
	.globl	C$main.c$454$1_1$242
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
Fmain$__str_9$0_0$0 == .
___str_9:
	.ascii "Starting game..."
	.db 0x00
Fmain$__str_10$0_0$0 == .
___str_10:
	.ascii "Quitting."
	.db 0x00
Fmain$__str_15$0_0$0 == .
___str_15:
	.ascii "Exiting..."
	.db 0x0a
	.ascii "Goodbye!"
	.db 0x00
	.area _TEXT
	.area _INITIALIZER
Fmain$__xinit_width$0_0$0 == .
__xinit__width:
	.dw #0x0028
Fmain$__xinit_height$0_0$0 == .
__xinit__height:
	.dw #0x0010
Fmain$__xinit_header_data_cmap$0_0$0 == .
__xinit__header_data_cmap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
Fmain$__xinit_header_data$0_0$0 == .
__xinit__header_data:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
Fmain$__xinit_sprite_count$0_0$0 == .
__xinit__sprite_count:
	.db #0x00	; 0
Fmain$__xinit_last_sprite_count$0_0$0 == .
__xinit__last_sprite_count:
	.db #0x00	; 0
	.area _CABS (ABS)
