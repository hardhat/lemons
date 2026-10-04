;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.4.0 #14620 (MINGW32)
;--------------------------------------------------------
	.module lemons
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mouseUp
	.globl _keyUp
	.globl _game_paint
	.globl _game_update
	.globl _game_destroy
	.globl _game_start
	.globl _game_init
	.globl _nextState
	.globl _updateState
	.globl _rendermaze
	.globl _renderinfo
	.globl _rendertile
	.globl _resetmaze
	.globl _debug_log
	.globl _show_map_xy
	.globl _show_map
	.globl _gfx_tileset_load
	.globl _gfx_palette_load
	.globl _strlen
	.globl _strcat
	.globl _rand
	.globl _sprintf
	.globl _mazeWait
	.globl _titleScreen
	.globl _rescued
	.globl _active
	.globl _next
	.globl _selected
	.globl _maze2
	.globl _maze1
	.globl _maze0
	.globl _tileData
	.globl _endRun
	.globl _invalid
	.globl _lemonExplode
	.globl _lemonFallen
	.globl _lemonDir
	.globl _lemonY
	.globl _lemonX
	.globl _lemonType
	.globl _doorY
	.globl _doorX
	.globl _enterY
	.globl _enterX
	.globl _maze
	.globl _palette
	.globl _tile
	.globl _nextStateId
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
G$maze$0_0$0==.
_maze::
	.ds 512
G$enterX$0_0$0==.
_enterX::
	.ds 2
G$enterY$0_0$0==.
_enterY::
	.ds 2
G$doorX$0_0$0==.
_doorX::
	.ds 2
G$doorY$0_0$0==.
_doorY::
	.ds 2
G$lemonType$0_0$0==.
_lemonType::
	.ds 100
G$lemonX$0_0$0==.
_lemonX::
	.ds 100
G$lemonY$0_0$0==.
_lemonY::
	.ds 100
G$lemonDir$0_0$0==.
_lemonDir::
	.ds 100
G$lemonFallen$0_0$0==.
_lemonFallen::
	.ds 100
G$lemonExplode$0_0$0==.
_lemonExplode::
	.ds 100
G$invalid$0_0$0==.
_invalid::
	.ds 512
G$endRun$0_0$0==.
_endRun::
	.ds 1
G$tileData$0_0$0==.
_tileData::
	.ds 4096
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$maze0$0_0$0==.
_maze0::
	.ds 32
G$maze1$0_0$0==.
_maze1::
	.ds 32
G$maze2$0_0$0==.
_maze2::
	.ds 32
G$selected$0_0$0==.
_selected::
	.ds 2
G$next$0_0$0==.
_next::
	.ds 2
G$active$0_0$0==.
_active::
	.ds 2
G$rescued$0_0$0==.
_rescued::
	.ds 2
G$titleScreen$0_0$0==.
_titleScreen::
	.ds 1
G$mazeWait$0_0$0==.
_mazeWait::
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
	G$resetmaze$0$0	= .
	.globl	G$resetmaze$0$0
	C$lemons.c$296$0_0$109	= .
	.globl	C$lemons.c$296$0_0$109
;src/lemons.c:296: void resetmaze(char *template[TILESDOWN])
;	---------------------------------
; Function resetmaze
; ---------------------------------
_resetmaze::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-26
	add	iy, sp
	ld	sp, iy
	ld	-6 (ix), l
	ld	-5 (ix), h
	C$lemons.c$300$1_0$109	= .
	.globl	C$lemons.c$300$1_0$109
;src/lemons.c:300: active=0;
	ld	hl, #0x0000
	ld	(_active), hl
	C$lemons.c$301$1_0$109	= .
	.globl	C$lemons.c$301$1_0$109
;src/lemons.c:301: next=0;
	ld	(_next), hl
	C$lemons.c$302$1_0$109	= .
	.globl	C$lemons.c$302$1_0$109
;src/lemons.c:302: rescued=0;
	ld	(_rescued), hl
	C$lemons.c$304$6_0$114	= .
	.globl	C$lemons.c$304$6_0$114
;src/lemons.c:304: for(j=0;j<TILESDOWN;j++) {
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	C$lemons.c$305$2_0$109	= .
	.globl	C$lemons.c$305$2_0$109
;src/lemons.c:305: for(i=0;i<TILESACROSS;i++) {
00123$:
	ld	a, -4 (ix)
	ld	-26 (ix), a
	ld	a, -3 (ix)
	ld	-25 (ix), a
	ld	b, #0x05
00182$:
	sla	-26 (ix)
	rl	-25 (ix)
	djnz	00182$
	ld	a, -26 (ix)
	ld	-24 (ix), a
	ld	a, -25 (ix)
	ld	-23 (ix), a
	ld	a, -26 (ix)
	ld	-22 (ix), a
	ld	a, -25 (ix)
	ld	-21 (ix), a
	ld	a, -26 (ix)
	ld	-20 (ix), a
	ld	a, -25 (ix)
	ld	-19 (ix), a
	ld	a, -26 (ix)
	ld	-18 (ix), a
	ld	a, -25 (ix)
	ld	-17 (ix), a
	ld	a, -26 (ix)
	ld	-16 (ix), a
	ld	a, -25 (ix)
	ld	-15 (ix), a
	ld	a, -26 (ix)
	ld	-14 (ix), a
	ld	a, -25 (ix)
	ld	-13 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, hl
	ld	a, -6 (ix)
	add	a, l
	ld	-12 (ix), a
	ld	a, -5 (ix)
	adc	a, h
	ld	-11 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00111$:
	C$lemons.c$306$5_0$113	= .
	.globl	C$lemons.c$306$5_0$113
;src/lemons.c:306: switch(template[j][i]) {
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
	ld	-7 (ix), a
	sub	a, #0x2b
	jr	Z, 00103$
	ld	a, -7 (ix)
	sub	a, #0x2d
	jr	Z, 00102$
	ld	a, -7 (ix)
	sub	a, #0x69
	jp	Z,00105$
	ld	a, -7 (ix)
	sub	a, #0x6c
	jr	Z, 00104$
	ld	a, -7 (ix)
	sub	a, #0x6f
	jp	Z,00106$
	ld	a, -7 (ix)
	sub	a, #0x7c
	jp	NZ,00107$
	C$lemons.c$307$6_0$114	= .
	.globl	C$lemons.c$307$6_0$114
;src/lemons.c:307: case '|': maze[j*TILESACROSS+i]=VERT; break;
	ld	a, -14 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -13 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_maze
	add	hl, bc
	ld	(hl), #0x02
	jp	00112$
	C$lemons.c$308$6_0$114	= .
	.globl	C$lemons.c$308$6_0$114
;src/lemons.c:308: case '-': maze[j*TILESACROSS+i]=HORI; break;
00102$:
	ld	a, -16 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -15 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_maze
	add	hl, bc
	ld	(hl), #0x01
	jp	00112$
	C$lemons.c$309$6_0$114	= .
	.globl	C$lemons.c$309$6_0$114
;src/lemons.c:309: case '+': maze[j*TILESACROSS+i]=SQUA; break;
00103$:
	ld	a, -18 (ix)
	add	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -17 (ix)
	adc	a, -1 (ix)
	ld	-9 (ix), a
	ld	a, #<(_maze)
	add	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, #>(_maze)
	adc	a, -9 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), #0x03
	jr	00112$
	C$lemons.c$310$6_0$114	= .
	.globl	C$lemons.c$310$6_0$114
;src/lemons.c:310: case 'l': maze[j*TILESACROSS+i]=HERO; break;
00104$:
	ld	a, -20 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -19 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_maze
	add	hl, bc
	ld	(hl), #0x04
	jr	00112$
	C$lemons.c$311$6_0$114	= .
	.globl	C$lemons.c$311$6_0$114
;src/lemons.c:311: case 'i': maze[j*TILESACROSS+i]=ENTE; enterX=i; enterY=j; break;
00105$:
	ld	a, -22 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -21 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_maze
	add	hl, bc
	ld	(hl), #0x06
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(_enterX), hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(_enterY), hl
	jr	00112$
	C$lemons.c$312$6_0$114	= .
	.globl	C$lemons.c$312$6_0$114
;src/lemons.c:312: case 'o': maze[j*TILESACROSS+i]=DOOR; doorX=i; doorY=j; break;
00106$:
	ld	a, -24 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -23 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_maze
	add	hl, bc
	ld	(hl), #0x07
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(_doorX), hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(_doorY), hl
	jr	00112$
	C$lemons.c$313$6_0$114	= .
	.globl	C$lemons.c$313$6_0$114
;src/lemons.c:313: default:  maze[j*TILESACROSS+i]=BACK; break;
00107$:
	ld	a, -26 (ix)
	add	a, -2 (ix)
	ld	c, a
	ld	a, -25 (ix)
	adc	a, -1 (ix)
	ld	b, a
	ld	hl, #_maze
	add	hl, bc
	ld	(hl), #0x00
	C$lemons.c$314$5_0$113	= .
	.globl	C$lemons.c$314$5_0$113
;src/lemons.c:314: }
00112$:
	C$lemons.c$305$4_0$112	= .
	.globl	C$lemons.c$305$4_0$112
;src/lemons.c:305: for(i=0;i<TILESACROSS;i++) {
	inc	-2 (ix)
	jr	NZ, 00190$
	inc	-1 (ix)
00190$:
	ld	a, -2 (ix)
	sub	a, #0x20
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00111$
	C$lemons.c$304$2_0$110	= .
	.globl	C$lemons.c$304$2_0$110
;src/lemons.c:304: for(j=0;j<TILESDOWN;j++) {
	inc	-4 (ix)
	jr	NZ, 00191$
	inc	-3 (ix)
00191$:
	ld	a, -4 (ix)
	sub	a, #0x10
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00123$
	C$lemons.c$317$2_0$109	= .
	.globl	C$lemons.c$317$2_0$109
;src/lemons.c:317: }
	ld	sp, ix
	pop	ix
	C$lemons.c$317$2_0$109	= .
	.globl	C$lemons.c$317$2_0$109
	XG$resetmaze$0$0	= .
	.globl	XG$resetmaze$0$0
	ret
G$tile$0_0$0 == .
_tile:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	G$rendertile$0$0	= .
	.globl	G$rendertile$0$0
	C$lemons.c$319$2_0$116	= .
	.globl	C$lemons.c$319$2_0$116
;src/lemons.c:319: void rendertile(int col,int row,int id)
;	---------------------------------
; Function rendertile
; ---------------------------------
_rendertile::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, l
	C$lemons.c$331$1_0$116	= .
	.globl	C$lemons.c$331$1_0$116
;src/lemons.c:331: buffer[0] = id;
	ld	hl, #0
	add	hl, sp
	ld	a, 4 (ix)
	ld	(hl), a
	C$lemons.c$332$1_0$116	= .
	.globl	C$lemons.c$332$1_0$116
;src/lemons.c:332: show_map(buffer, x, y);
	ld	a, c
	ld	d, e
	push	de
	inc	sp
	push	af
	inc	sp
	call	_show_map
	C$lemons.c$335$1_0$116	= .
	.globl	C$lemons.c$335$1_0$116
;src/lemons.c:335: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$renderinfo$0$0	= .
	.globl	G$renderinfo$0$0
	C$lemons.c$337$1_0$117	= .
	.globl	C$lemons.c$337$1_0$117
;src/lemons.c:337: void renderinfo()
;	---------------------------------
; Function renderinfo
; ---------------------------------
_renderinfo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-386
	add	hl, sp
	ld	sp, hl
	C$lemons.c$340$1_0$117	= .
	.globl	C$lemons.c$340$1_0$117
;src/lemons.c:340: memset(buffer, 0, sizeof(buffer));
	ld	hl, #0
	add	hl, sp
	ld	b, #0x80
00143$:
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	djnz	00143$
	C$lemons.c$341$1_0$117	= .
	.globl	C$lemons.c$341$1_0$117
;src/lemons.c:341: show_map_xy(buffer,80,2,0,TILESDOWN);
	ld	a, #0x10
	push	af
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	ld	hl, #4
	add	hl, sp
	call	_show_map_xy
	C$lemons.c$343$1_0$117	= .
	.globl	C$lemons.c$343$1_0$117
;src/lemons.c:343: sprintf(buffer, "Lemons Status - %d of %d. %d rescued. %d left.", next, MAXLEMON, rescued, active);
	ld	hl, (_active)
	push	hl
	ld	hl, (_rescued)
	push	hl
	ld	hl, #0x0032
	push	hl
	ld	hl, (_next)
	push	hl
	ld	hl, #___str_0
	push	hl
	ld	hl, #10
	add	hl, sp
	push	hl
	call	_sprintf
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	C$lemons.c$344$1_0$117	= .
	.globl	C$lemons.c$344$1_0$117
;src/lemons.c:344: show_map_xy(buffer,strlen(buffer),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT/2);
	ld	hl, #0
	add	hl, sp
	call	_strlen
	ld	a, e
	ld	h, #0x08
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #4
	add	hl, sp
	call	_show_map_xy
	C$lemons.c$345$1_0$117	= .
	.globl	C$lemons.c$345$1_0$117
;src/lemons.c:345: if(selected!=-1 && lemonType[selected]!=S_INACTIVE) {
	ld	a, (_selected+0)
	inc	a
	jr	NZ, 00145$
	ld	a, (_selected+1)
	inc	a
	jp	Z,00110$
00145$:
	ld	bc, #_lemonType+0
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	e, (hl)
	or	a, e
	jp	Z, 00110$
	C$lemons.c$347$2_0$118	= .
	.globl	C$lemons.c$347$2_0$118
;src/lemons.c:347: sprintf(s, "Selected lemon %d: ", selected);
	push	bc
	ld	hl, (_selected)
	push	hl
	ld	hl, #___str_1
	push	hl
	ld	hl, #262
	add	hl, sp
	push	hl
	call	_sprintf
	pop	af
	pop	af
	pop	af
	pop	bc
	C$lemons.c$348$2_0$118	= .
	.globl	C$lemons.c$348$2_0$118
;src/lemons.c:348: switch(lemonType[selected]) {
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x01
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00108$
	ld	a, #0x07
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00146$
	xor	a, #0x80
00146$:
	jp	M, 00108$
	dec	c
	ld	a, c
	ld	b, #0x00
	ld	hl, #00147$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00147$:
	jp	00101$
	jp	00103$
	jp	00102$
	jp	00104$
	jp	00105$
	jp	00107$
	jp	00106$
	C$lemons.c$349$3_0$119	= .
	.globl	C$lemons.c$349$3_0$119
;src/lemons.c:349: case S_WALK: strcat(s, "Walk"); break;
00101$:
	ld	de, #___str_2
	ld	hl, #256
	add	hl, sp
	call	_strcat
	jr	00108$
	C$lemons.c$350$3_0$119	= .
	.globl	C$lemons.c$350$3_0$119
;src/lemons.c:350: case S_CLIMB: strcat(s, "Climb"); break;
00102$:
	ld	de, #___str_3
	ld	hl, #256
	add	hl, sp
	call	_strcat
	jr	00108$
	C$lemons.c$351$3_0$119	= .
	.globl	C$lemons.c$351$3_0$119
;src/lemons.c:351: case S_PARACHUTE: strcat(s, "Parachute"); break;
00103$:
	ld	de, #___str_4
	ld	hl, #256
	add	hl, sp
	call	_strcat
	jr	00108$
	C$lemons.c$352$3_0$119	= .
	.globl	C$lemons.c$352$3_0$119
;src/lemons.c:352: case S_PARACLIMB: strcat(s, "Paraclimb"); break;
00104$:
	ld	de, #___str_5
	ld	hl, #256
	add	hl, sp
	call	_strcat
	jr	00108$
	C$lemons.c$353$3_0$119	= .
	.globl	C$lemons.c$353$3_0$119
;src/lemons.c:353: case S_BUILD: strcat(s, "Build"); break;
00105$:
	ld	de, #___str_6
	ld	hl, #256
	add	hl, sp
	call	_strcat
	jr	00108$
	C$lemons.c$354$3_0$119	= .
	.globl	C$lemons.c$354$3_0$119
;src/lemons.c:354: case S_EXPLODE: strcat(s, "Explode"); break;
00106$:
	ld	de, #___str_7
	ld	hl, #256
	add	hl, sp
	call	_strcat
	jr	00108$
	C$lemons.c$355$3_0$119	= .
	.globl	C$lemons.c$355$3_0$119
;src/lemons.c:355: case S_STOP: strcat(s, "Stop"); break;
00107$:
	ld	de, #___str_8
	ld	hl, #256
	add	hl, sp
	call	_strcat
	C$lemons.c$356$2_0$118	= .
	.globl	C$lemons.c$356$2_0$118
;src/lemons.c:356: }
00108$:
	C$lemons.c$357$2_0$118	= .
	.globl	C$lemons.c$357$2_0$118
;src/lemons.c:357: sprintf(s + strlen(s), " @%d,%d", lemonX[selected], lemonY[selected]);
	ld	hl, (_selected)
	add	hl, hl
	ex	de,hl
	ld	hl, #_lemonY
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #_lemonX
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #258
	add	hl, sp
	call	_strlen
	pop	bc
	ld	hl, #256
	add	hl, sp
	add	hl, de
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	push	de
	push	bc
	ld	de, #___str_9
	push	de
	push	hl
	call	_sprintf
	pop	af
	pop	af
	pop	af
	pop	af
	C$lemons.c$358$2_0$118	= .
	.globl	C$lemons.c$358$2_0$118
;src/lemons.c:358: show_map_xy(s,strlen(s),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT);
	ld	hl, #256
	add	hl, sp
	call	_strlen
	ld	b, e
	ld	hl, #0x1005
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #260
	add	hl, sp
	call	_show_map_xy
	jr	00111$
00110$:
	C$lemons.c$360$2_0$120	= .
	.globl	C$lemons.c$360$2_0$120
;src/lemons.c:360: show_map_xy("No lemons selected",strlen("No lemons selected"),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT);
	ld	hl, #___str_10
	call	_strlen
	ld	a, e
	ld	h, #0x10
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #___str_10
	call	_show_map_xy
00111$:
	C$lemons.c$362$1_0$117	= .
	.globl	C$lemons.c$362$1_0$117
;src/lemons.c:362: show_map_xy("b - Build | c - Climb | e - Explode",strlen("b - Build | c - Climb | e - Explode"),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT*3/2);
	ld	hl, #___str_11
	call	_strlen
	ld	a, e
	ld	h, #0x18
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #___str_11
	call	_show_map_xy
	C$lemons.c$363$1_0$117	= .
	.globl	C$lemons.c$363$1_0$117
;src/lemons.c:363: show_map_xy("p - Parachute | s - Stop",strlen("p - Parachute | s - Stop"),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT*2);	
	ld	hl, #___str_12
	call	_strlen
	ld	a, e
	ld	h, #0x20
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #___str_12
	call	_show_map_xy
	C$lemons.c$364$1_0$117	= .
	.globl	C$lemons.c$364$1_0$117
;src/lemons.c:364: }
	ld	sp, ix
	pop	ix
	C$lemons.c$364$1_0$117	= .
	.globl	C$lemons.c$364$1_0$117
	XG$renderinfo$0$0	= .
	.globl	XG$renderinfo$0$0
	ret
Flemons$__str_0$0_0$0 == .
___str_0:
	.ascii "Lemons Status - %d of %d. %d rescued. %d left."
	.db 0x00
Flemons$__str_1$0_0$0 == .
___str_1:
	.ascii "Selected lemon %d: "
	.db 0x00
Flemons$__str_2$0_0$0 == .
___str_2:
	.ascii "Walk"
	.db 0x00
Flemons$__str_3$0_0$0 == .
___str_3:
	.ascii "Climb"
	.db 0x00
Flemons$__str_4$0_0$0 == .
___str_4:
	.ascii "Parachute"
	.db 0x00
Flemons$__str_5$0_0$0 == .
___str_5:
	.ascii "Paraclimb"
	.db 0x00
Flemons$__str_6$0_0$0 == .
___str_6:
	.ascii "Build"
	.db 0x00
Flemons$__str_7$0_0$0 == .
___str_7:
	.ascii "Explode"
	.db 0x00
Flemons$__str_8$0_0$0 == .
___str_8:
	.ascii "Stop"
	.db 0x00
Flemons$__str_9$0_0$0 == .
___str_9:
	.ascii " @%d,%d"
	.db 0x00
Flemons$__str_10$0_0$0 == .
___str_10:
	.ascii "No lemons selected"
	.db 0x00
Flemons$__str_11$0_0$0 == .
___str_11:
	.ascii "b - Build | c - Climb | e - Explode"
	.db 0x00
Flemons$__str_12$0_0$0 == .
___str_12:
	.ascii "p - Parachute | s - Stop"
	.db 0x00
	G$rendermaze$0$0	= .
	.globl	G$rendermaze$0$0
	C$lemons.c$366$1_0$122	= .
	.globl	C$lemons.c$366$1_0$122
;src/lemons.c:366: void rendermaze()
;	---------------------------------
; Function rendermaze
; ---------------------------------
_rendermaze::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
	C$lemons.c$370$7_0$127	= .
	.globl	C$lemons.c$370$7_0$127
;src/lemons.c:370: for(j=0;j<TILESDOWN;j++) {
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
	C$lemons.c$371$2_0$122	= .
	.globl	C$lemons.c$371$2_0$122
;src/lemons.c:371: for(i=0;i<TILESACROSS;i++) {
00127$:
	ld	a, -6 (ix)
	ld	-11 (ix), a
	ld	a, -5 (ix)
	ld	-10 (ix), a
	ld	b, #0x05
00187$:
	sla	-11 (ix)
	rl	-10 (ix)
	djnz	00187$
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
00113$:
	C$lemons.c$372$5_0$125	= .
	.globl	C$lemons.c$372$5_0$125
;src/lemons.c:372: id=maze[j*TILESACROSS+i];
	ld	a, -11 (ix)
	add	a, -4 (ix)
	ld	-8 (ix), a
	ld	a, -10 (ix)
	adc	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	add	a, #<(_maze)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	adc	a, #>(_maze)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	C$lemons.c$373$2_0$122	= .
	.globl	C$lemons.c$373$2_0$122
;src/lemons.c:373: for(k=0;k<next;k++) {
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00111$:
	ld	hl, #_next
	ld	a, -2 (ix)
	sub	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00188$
	xor	a, #0x80
00188$:
	jp	P, 00107$
	C$lemons.c$374$7_0$127	= .
	.globl	C$lemons.c$374$7_0$127
;src/lemons.c:374: if(i==lemonX[k] && j==lemonY[k] && lemonType[k]!=S_INACTIVE) {
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	sla	c
	rl	b
	ld	hl, #_lemonX
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00112$
	ld	hl, #_lemonY
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00112$
	ld	hl, #_lemonType
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jr	Z, 00112$
	C$lemons.c$375$8_0$128	= .
	.globl	C$lemons.c$375$8_0$128
;src/lemons.c:375: id=(k==selected)?BADG:HERO;
	ld	a, -2 (ix)
	ld	iy, #_selected
	sub	a, 0 (iy)
	jr	NZ, 00194$
	ld	a, -1 (ix)
	sub	a, 1 (iy)
	ld	a, #0x01
	jr	Z, 00195$
00194$:
	xor	a, a
00195$:
	ld	-9 (ix), a
	or	a, a
	jr	Z, 00119$
	ld	-8 (ix), #0x05
	ld	-7 (ix), #0
	jr	00120$
00119$:
	ld	-8 (ix), #0x04
	ld	-7 (ix), #0
00120$:
	C$lemons.c$376$8_0$128	= .
	.globl	C$lemons.c$376$8_0$128
;src/lemons.c:376: if(k==selected) break;
	ld	a, -9 (ix)
	or	a, a
	jr	NZ, 00107$
00112$:
	C$lemons.c$373$6_0$126	= .
	.globl	C$lemons.c$373$6_0$126
;src/lemons.c:373: for(k=0;k<next;k++) {
	inc	-2 (ix)
	jp	NZ,00111$
	inc	-1 (ix)
	jp	00111$
00107$:
	C$lemons.c$379$5_0$125	= .
	.globl	C$lemons.c$379$5_0$125
;src/lemons.c:379: rendertile(i,j,id);
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_rendertile
	C$lemons.c$371$4_0$124	= .
	.globl	C$lemons.c$371$4_0$124
;src/lemons.c:371: for(i=0;i<TILESACROSS;i++) {
	inc	-4 (ix)
	jr	NZ, 00197$
	inc	-3 (ix)
00197$:
	ld	a, -4 (ix)
	sub	a, #0x20
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00113$
	C$lemons.c$370$2_0$122	= .
	.globl	C$lemons.c$370$2_0$122
;src/lemons.c:370: for(j=0;j<TILESDOWN;j++) {
	inc	-6 (ix)
	jr	NZ, 00198$
	inc	-5 (ix)
00198$:
	ld	a, -6 (ix)
	sub	a, #0x10
	ld	a, -5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00127$
	C$lemons.c$382$2_0$122	= .
	.globl	C$lemons.c$382$2_0$122
;src/lemons.c:382: }
	ld	sp, ix
	pop	ix
	C$lemons.c$382$2_0$122	= .
	.globl	C$lemons.c$382$2_0$122
	XG$rendermaze$0$0	= .
	.globl	XG$rendermaze$0$0
	ret
	G$updateState$0$0	= .
	.globl	G$updateState$0$0
	C$lemons.c$384$2_0$130	= .
	.globl	C$lemons.c$384$2_0$130
;src/lemons.c:384: void updateState()
;	---------------------------------
; Function updateState
; ---------------------------------
_updateState::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
	C$lemons.c$388$6_0$134	= .
	.globl	C$lemons.c$388$6_0$134
;src/lemons.c:388: for(y=0;y<TILESDOWN;y++) {
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
00117$:
	C$lemons.c$389$3_0$131	= .
	.globl	C$lemons.c$389$3_0$131
;src/lemons.c:389: row=y*TILESACROSS;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	inc	sp
	inc	sp
	push	hl
	C$lemons.c$390$6_0$134	= .
	.globl	C$lemons.c$390$6_0$134
;src/lemons.c:390: for(x=0;x<TILESACROSS;x++) {
	ld	-13 (ix), l
	ld	-12 (ix), h
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
00115$:
	C$lemons.c$391$2_0$130	= .
	.globl	C$lemons.c$391$2_0$130
;src/lemons.c:391: if(invalid[row+x]) {
	ld	a, -15 (ix)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -14 (ix)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, #<(_invalid)
	add	a, -2 (ix)
	ld	-11 (ix), a
	ld	a, #>(_invalid)
	adc	a, -1 (ix)
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	bit	0, -1 (ix)
	jp	Z, 00116$
	C$lemons.c$392$6_0$134	= .
	.globl	C$lemons.c$392$6_0$134
;src/lemons.c:392: id=maze[y*TILESACROSS+x];
	ld	a, -13 (ix)
	add	a, -4 (ix)
	ld	-8 (ix), a
	ld	a, -12 (ix)
	adc	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	add	a, #<(_maze)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	adc	a, #>(_maze)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	C$lemons.c$393$2_0$130	= .
	.globl	C$lemons.c$393$2_0$130
;src/lemons.c:393: for(k=0;k<next;k++) {
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00113$:
	ld	hl, #_next
	ld	a, -2 (ix)
	sub	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00196$
	xor	a, #0x80
00196$:
	jp	P, 00107$
	C$lemons.c$394$8_0$136	= .
	.globl	C$lemons.c$394$8_0$136
;src/lemons.c:394: if(x==lemonX[k] && y==lemonY[k] && lemonType[k]!=S_INACTIVE) {
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	sla	c
	rl	b
	ld	hl, #_lemonX
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00114$
	ld	hl, #_lemonY
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ, 00114$
	ld	hl, #_lemonType
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jr	Z, 00114$
	C$lemons.c$395$9_0$137	= .
	.globl	C$lemons.c$395$9_0$137
;src/lemons.c:395: id=(k==selected)?BADG:HERO;
	ld	a, -2 (ix)
	ld	iy, #_selected
	sub	a, 0 (iy)
	jr	NZ, 00202$
	ld	a, -1 (ix)
	sub	a, 1 (iy)
	ld	a, #0x01
	jr	Z, 00203$
00202$:
	xor	a, a
00203$:
	ld	-9 (ix), a
	or	a, a
	jr	Z, 00121$
	ld	-8 (ix), #0x05
	ld	-7 (ix), #0
	jr	00122$
00121$:
	ld	-8 (ix), #0x04
	ld	-7 (ix), #0
00122$:
	C$lemons.c$396$9_0$137	= .
	.globl	C$lemons.c$396$9_0$137
;src/lemons.c:396: if(k==selected) break;
	ld	a, -9 (ix)
	or	a, a
	jr	NZ, 00107$
00114$:
	C$lemons.c$393$7_0$135	= .
	.globl	C$lemons.c$393$7_0$135
;src/lemons.c:393: for(k=0;k<next;k++) {
	inc	-2 (ix)
	jp	NZ,00113$
	inc	-1 (ix)
	jp	00113$
00107$:
	C$lemons.c$399$6_0$134	= .
	.globl	C$lemons.c$399$6_0$134
;src/lemons.c:399: rendertile(x,y,id);
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_rendertile
	C$lemons.c$401$6_0$134	= .
	.globl	C$lemons.c$401$6_0$134
;src/lemons.c:401: invalid[row+x]=false;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x00
00116$:
	C$lemons.c$390$4_0$132	= .
	.globl	C$lemons.c$390$4_0$132
;src/lemons.c:390: for(x=0;x<TILESACROSS;x++) {
	inc	-4 (ix)
	jr	NZ, 00205$
	inc	-3 (ix)
00205$:
	ld	a, -4 (ix)
	sub	a, #0x20
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00115$
	C$lemons.c$388$2_0$130	= .
	.globl	C$lemons.c$388$2_0$130
;src/lemons.c:388: for(y=0;y<TILESDOWN;y++) {
	inc	-6 (ix)
	jr	NZ, 00206$
	inc	-5 (ix)
00206$:
	ld	a, -6 (ix)
	sub	a, #0x10
	ld	a, -5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00117$
	C$lemons.c$406$2_0$130	= .
	.globl	C$lemons.c$406$2_0$130
;src/lemons.c:406: }
	ld	sp, ix
	pop	ix
	C$lemons.c$406$2_0$130	= .
	.globl	C$lemons.c$406$2_0$130
	XG$updateState$0$0	= .
	.globl	XG$updateState$0$0
	ret
	G$nextState$0$0	= .
	.globl	G$nextState$0$0
	C$lemons.c$410$2_0$140	= .
	.globl	C$lemons.c$410$2_0$140
;src/lemons.c:410: void nextState()
;	---------------------------------
; Function nextState
; ---------------------------------
_nextState::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	C$lemons.c$414$3_0$141	= .
	.globl	C$lemons.c$414$3_0$141
;src/lemons.c:414: for(id=0;id<next;id++) {
	ld	bc, #0x0000
00106$:
	ld	hl, #_next
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	P, 00108$
	C$lemons.c$415$2_0$140	= .
	.globl	C$lemons.c$415$2_0$140
;src/lemons.c:415: oldX=lemonX[id];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ex	de,hl
	ld	hl, #_lemonX
	add	hl, de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	C$lemons.c$416$2_0$140	= .
	.globl	C$lemons.c$416$2_0$140
;src/lemons.c:416: oldY=lemonY[id];
	ld	hl, #_lemonY
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	C$lemons.c$417$3_0$141	= .
	.globl	C$lemons.c$417$3_0$141
;src/lemons.c:417: nextStateId(id);
	push	bc
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_nextStateId
	pop	de
	pop	bc
	C$lemons.c$418$3_0$141	= .
	.globl	C$lemons.c$418$3_0$141
;src/lemons.c:418: if(oldX!=lemonX[id] || oldY!=lemonY[id]) {
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	sub	a, -4 (ix)
	jr	NZ, 00101$
	ld	a, h
	sub	a, -3 (ix)
	jr	NZ, 00101$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, de
	jr	Z, 00107$
00101$:
	C$lemons.c$419$4_0$142	= .
	.globl	C$lemons.c$419$4_0$142
;src/lemons.c:419: invalid[oldY*TILESACROSS+oldX]=true;
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	de, #_invalid
	add	hl, de
	ld	(hl), #0x01
	C$lemons.c$420$4_0$142	= .
	.globl	C$lemons.c$420$4_0$142
;src/lemons.c:420: invalid[lemonY[id]*TILESACROSS+lemonX[id]]=true;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	de, #_invalid
	add	hl, de
	ld	(hl), #0x01
00107$:
	C$lemons.c$414$2_0$140	= .
	.globl	C$lemons.c$414$2_0$140
;src/lemons.c:414: for(id=0;id<next;id++) {
	inc	bc
	jp	00106$
00108$:
	C$lemons.c$423$2_0$140	= .
	.globl	C$lemons.c$423$2_0$140
;src/lemons.c:423: }
	ld	sp, ix
	pop	ix
	C$lemons.c$423$2_0$140	= .
	.globl	C$lemons.c$423$2_0$140
	XG$nextState$0$0	= .
	.globl	XG$nextState$0$0
	ret
	G$nextStateId$0$0	= .
	.globl	G$nextStateId$0$0
	C$lemons.c$425$2_0$144	= .
	.globl	C$lemons.c$425$2_0$144
;src/lemons.c:425: void nextStateId(int id)
;	---------------------------------
; Function nextStateId
; ---------------------------------
_nextStateId::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-32
	add	iy, sp
	ld	sp, iy
	C$lemons.c$427$1_0$144	= .
	.globl	C$lemons.c$427$1_0$144
;src/lemons.c:427: int r=rand()%4;
	push	hl
	call	_rand
	pop	de
	C$lemons.c$431$1_0$144	= .
	.globl	C$lemons.c$431$1_0$144
;src/lemons.c:431: x=lemonX[id];
	ex	de, hl
	add	hl, hl
	ex	de, hl
	inc	sp
	inc	sp
	push	de
	ld	a, -32 (ix)
	add	a, #<(_lemonX)
	ld	-30 (ix), a
	ld	a, -31 (ix)
	adc	a, #>(_lemonX)
	ld	-29 (ix), a
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	a, (hl)
	ld	-28 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-27 (ix), a
	C$lemons.c$432$1_0$144	= .
	.globl	C$lemons.c$432$1_0$144
;src/lemons.c:432: y=lemonY[id];
	ld	a, -32 (ix)
	add	a, #<(_lemonY)
	ld	-26 (ix), a
	ld	a, -31 (ix)
	adc	a, #>(_lemonY)
	ld	-25 (ix), a
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-24 (ix), a
	ld	a, -5 (ix)
	ld	-23 (ix), a
	C$lemons.c$433$1_0$144	= .
	.globl	C$lemons.c$433$1_0$144
;src/lemons.c:433: dir=lemonDir[id];
	ld	a, -32 (ix)
	add	a, #<(_lemonDir)
	ld	-22 (ix), a
	ld	a, -31 (ix)
	adc	a, #>(_lemonDir)
	ld	-21 (ix), a
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	a, (hl)
	ld	-20 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-19 (ix), a
	C$lemons.c$435$1_0$144	= .
	.globl	C$lemons.c$435$1_0$144
;src/lemons.c:435: if(lemonType[id]==S_INACTIVE) return;
	ld	a, -32 (ix)
	add	a, #<(_lemonType)
	ld	-18 (ix), a
	ld	a, -31 (ix)
	adc	a, #>(_lemonType)
	ld	-17 (ix), a
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	or	a, -4 (ix)
	jp	Z,00182$
	C$lemons.c$453$1_0$144	= .
	.globl	C$lemons.c$453$1_0$144
;src/lemons.c:453: active--;
	ld	a, (_active+0)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, (_active+1)
	adc	a, #0xff
	ld	-1 (ix), a
	C$lemons.c$456$1_0$144	= .
	.globl	C$lemons.c$456$1_0$144
;src/lemons.c:456: invalid[y*TILESACROSS+x]=true;
	ld	l, -24 (ix)
	ld	h, -23 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, -28 (ix)
	add	a, l
	ld	-16 (ix), a
	ld	a, -27 (ix)
	adc	a, h
	ld	-15 (ix), a
	C$lemons.c$439$1_0$144	= .
	.globl	C$lemons.c$439$1_0$144
;src/lemons.c:439: if(y<TILESDOWN-1) {
	ld	a, -24 (ix)
	sub	a, #0x0f
	ld	a, -23 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00118$
	C$lemons.c$440$1_0$144	= .
	.globl	C$lemons.c$440$1_0$144
;src/lemons.c:440: if((lemonType[id]==S_CLIMB || lemonType[id]==S_PARACLIMB) && maze[(y+1)*TILESACROSS+x+dir]!=BACK) {
	ld	a, -4 (ix)
	sub	a, #0x04
	or	a, -3 (ix)
	ld	a, #0x01
	jr	Z, 00495$
	xor	a, a
00495$:
	ld	e, a
	ld	a, -24 (ix)
	add	a, #0x01
	ld	-14 (ix), a
	ld	a, -23 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, -28 (ix)
	add	a, l
	ld	c, a
	ld	a, -27 (ix)
	adc	a, h
	ld	b, a
	ld	a, -4 (ix)
	sub	a, #0x03
	or	a, -3 (ix)
	jr	Z, 00116$
	ld	a, e
	or	a, a
	jr	Z, 00113$
00116$:
	ld	l, -20 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -19 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, #<(_maze)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_maze)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	or	a, a
	jr	Z, 00113$
	C$lemons.c$442$3_0$146	= .
	.globl	C$lemons.c$442$3_0$146
;src/lemons.c:442: lemonFallen[id]=0;
	ld	bc, #_lemonFallen+0
	pop	hl
	push	hl
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00119$
00113$:
	C$lemons.c$444$3_0$147	= .
	.globl	C$lemons.c$444$3_0$147
;src/lemons.c:444: switch(maze[(y+1)*TILESACROSS+x]) {
	ld	hl, #_maze+0
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
	cp	a, #0x06
	jr	Z, 00104$
	sub	a, #0x07
	jr	Z, 00105$
	jr	00106$
	C$lemons.c$446$4_0$148	= .
	.globl	C$lemons.c$446$4_0$148
;src/lemons.c:446: case ENTE:
00104$:
	C$lemons.c$448$4_0$148	= .
	.globl	C$lemons.c$448$4_0$148
;src/lemons.c:448: lemonY[id]++;
	ld	c, -6 (ix)
	ld	b, -5 (ix)
	inc	bc
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$449$4_0$148	= .
	.globl	C$lemons.c$449$4_0$148
;src/lemons.c:449: lemonFallen[id]++;
	ld	bc, #_lemonFallen+0
	pop	hl
	push	hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	inc	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$450$4_0$148	= .
	.globl	C$lemons.c$450$4_0$148
;src/lemons.c:450: return;
	jp	00182$
	C$lemons.c$451$4_0$148	= .
	.globl	C$lemons.c$451$4_0$148
;src/lemons.c:451: case DOOR:
00105$:
	C$lemons.c$453$4_0$148	= .
	.globl	C$lemons.c$453$4_0$148
;src/lemons.c:453: active--;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(_active), hl
	C$lemons.c$454$4_0$148	= .
	.globl	C$lemons.c$454$4_0$148
;src/lemons.c:454: rescued++;
	ld	hl, (_rescued)
	inc	hl
	ld	(_rescued), hl
	C$lemons.c$455$4_0$148	= .
	.globl	C$lemons.c$455$4_0$148
;src/lemons.c:455: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$456$4_0$148	= .
	.globl	C$lemons.c$456$4_0$148
;src/lemons.c:456: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$457$4_0$148	= .
	.globl	C$lemons.c$457$4_0$148
;src/lemons.c:457: return;
	jp	00182$
	C$lemons.c$458$4_0$148	= .
	.globl	C$lemons.c$458$4_0$148
;src/lemons.c:458: default:
00106$:
	C$lemons.c$459$4_0$148	= .
	.globl	C$lemons.c$459$4_0$148
;src/lemons.c:459: if(lemonFallen[id]>=4 && lemonType[id]!=S_PARACHUTE && lemonType[id]!=S_PARACLIMB) {
	ld	a, -32 (ix)
	add	a, #<(_lemonFallen)
	ld	c, a
	ld	a, -31 (ix)
	adc	a, #>(_lemonFallen)
	ld	b, a
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	d, (hl)
;	spillPairReg hl
;	spillPairReg hl
	sub	a, #0x04
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00108$
	ld	a, -4 (ix)
	sub	a, #0x02
	or	a, -3 (ix)
	jr	Z, 00108$
	bit	0, e
	jr	NZ, 00108$
	C$lemons.c$462$5_0$149	= .
	.globl	C$lemons.c$462$5_0$149
;src/lemons.c:462: active--;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(_active), hl
	C$lemons.c$463$5_0$149	= .
	.globl	C$lemons.c$463$5_0$149
;src/lemons.c:463: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$464$5_0$149	= .
	.globl	C$lemons.c$464$5_0$149
;src/lemons.c:464: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$465$5_0$149	= .
	.globl	C$lemons.c$465$5_0$149
;src/lemons.c:465: return;
	jp	00182$
00108$:
	C$lemons.c$467$4_0$148	= .
	.globl	C$lemons.c$467$4_0$148
;src/lemons.c:467: lemonFallen[id]=0;
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
	C$lemons.c$468$1_0$144	= .
	.globl	C$lemons.c$468$1_0$144
;src/lemons.c:468: }
	jr	00119$
00118$:
	C$lemons.c$472$2_0$150	= .
	.globl	C$lemons.c$472$2_0$150
;src/lemons.c:472: active--;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(_active), hl
	C$lemons.c$473$2_0$150	= .
	.globl	C$lemons.c$473$2_0$150
;src/lemons.c:473: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$474$2_0$150	= .
	.globl	C$lemons.c$474$2_0$150
;src/lemons.c:474: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$476$2_0$150	= .
	.globl	C$lemons.c$476$2_0$150
;src/lemons.c:476: return;
	jp	00182$
00119$:
	C$lemons.c$479$1_0$144	= .
	.globl	C$lemons.c$479$1_0$144
;src/lemons.c:479: if(dir==0) {
	ld	a, -19 (ix)
	or	a, -20 (ix)
	jr	NZ, 00121$
	C$lemons.c$480$2_0$151	= .
	.globl	C$lemons.c$480$2_0$151
;src/lemons.c:480: lemonDir[id]=1;
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$481$2_0$151	= .
	.globl	C$lemons.c$481$2_0$151
;src/lemons.c:481: return;
	jp	00182$
00121$:
	C$lemons.c$484$1_0$144	= .
	.globl	C$lemons.c$484$1_0$144
;src/lemons.c:484: switch(lemonType[id]) {
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x01
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00182$
	ld	a, #0x07
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00501$
	xor	a, #0x80
00501$:
	jp	M, 00182$
	ld	a, c
	dec	a
	ld	e, a
	C$lemons.c$453$1_0$144	= .
	.globl	C$lemons.c$453$1_0$144
;src/lemons.c:453: active--;
	ld	a, (_active+0)
	add	a, #0xff
	ld	-12 (ix), a
	ld	a, (_active+1)
	adc	a, #0xff
	ld	-11 (ix), a
	C$lemons.c$454$1_0$144	= .
	.globl	C$lemons.c$454$1_0$144
;src/lemons.c:454: rescued++;
	ld	hl, (_rescued)
	inc	hl
	ld	-10 (ix), l
	ld	-9 (ix), h
	C$lemons.c$494$1_0$144	= .
	.globl	C$lemons.c$494$1_0$144
;src/lemons.c:494: for(dy=y-1;dy<=y+1;dy++) {
	ld	c, -24 (ix)
	ld	b, -23 (ix)
	dec	bc
	C$lemons.c$576$1_0$144	= .
	.globl	C$lemons.c$576$1_0$144
;src/lemons.c:576: lemonDir[id]=-dir;
	xor	a, a
	sub	a, -20 (ix)
	ld	-8 (ix), a
	sbc	a, a
	sub	a, -19 (ix)
	ld	-7 (ix), a
	C$lemons.c$522$1_0$144	= .
	.globl	C$lemons.c$522$1_0$144
;src/lemons.c:522: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	C$lemons.c$508$1_0$144	= .
	.globl	C$lemons.c$508$1_0$144
;src/lemons.c:508: switch(maze[y*TILESACROSS+x+dir]) {
	ld	a, -16 (ix)
	add	a, -20 (ix)
	ld	-6 (ix), a
	ld	a, -15 (ix)
	adc	a, -19 (ix)
	ld	-5 (ix), a
	C$lemons.c$522$1_0$144	= .
	.globl	C$lemons.c$522$1_0$144
;src/lemons.c:522: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	a, -28 (ix)
	add	a, l
	ld	-4 (ix), a
	ld	a, -27 (ix)
	adc	a, h
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, -20 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, -19 (ix)
	ld	-1 (ix), a
	C$lemons.c$484$1_0$144	= .
	.globl	C$lemons.c$484$1_0$144
;src/lemons.c:484: switch(lemonType[id]) {
	ld	d, #0x00
	ld	hl, #00502$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00502$:
	jp	00129$
	jp	00129$
	jp	00140$
	jp	00140$
	jp	00157$
	jp	00182$
	jp	00122$
	C$lemons.c$485$2_0$152	= .
	.globl	C$lemons.c$485$2_0$152
;src/lemons.c:485: case S_EXPLODE:
00122$:
	C$lemons.c$486$2_0$152	= .
	.globl	C$lemons.c$486$2_0$152
;src/lemons.c:486: lemonExplode[id]++;
	ld	de, #_lemonExplode+0
	pop	hl
	push	hl
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	inc	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$lemons.c$488$2_0$152	= .
	.globl	C$lemons.c$488$2_0$152
;src/lemons.c:488: if(lemonExplode[id]>10) {
	ld	a, #0x0a
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00503$
	xor	a, #0x80
00503$:
	jp	P, 00182$
	C$lemons.c$489$3_0$153	= .
	.globl	C$lemons.c$489$3_0$153
;src/lemons.c:489: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$490$3_0$153	= .
	.globl	C$lemons.c$490$3_0$153
;src/lemons.c:490: active--;
	ld	hl, (_active)
	dec	hl
	ld	(_active), hl
	C$lemons.c$491$3_0$153	= .
	.globl	C$lemons.c$491$3_0$153
;src/lemons.c:491: invalid[y*TILESACROSS+x]=true;
	ld	a, -16 (ix)
	add	a, #<(_invalid)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -15 (ix)
	adc	a, #>(_invalid)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x01
	C$lemons.c$494$4_1$155	= .
	.globl	C$lemons.c$494$4_1$155
;src/lemons.c:494: for(dy=y-1;dy<=y+1;dy++) {
	ld	-2 (ix), c
	ld	-1 (ix), b
	ld	a, -28 (ix)
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, -27 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	a, -28 (ix)
	add	a, #0x01
	ld	-4 (ix), a
	ld	a, -27 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -14 (ix)
	ld	-10 (ix), a
	ld	a, -13 (ix)
	ld	-9 (ix), a
00180$:
	ld	a, -10 (ix)
	sub	a, -2 (ix)
	ld	a, -9 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00504$
	xor	a, #0x80
00504$:
	jp	M,00182$
	C$lemons.c$495$6_1$157	= .
	.globl	C$lemons.c$495$6_1$157
;src/lemons.c:495: for(dx=x-1;dx<=x+1;dx++) {
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-16 (ix), a
	ld	a, -1 (ix)
	ld	-15 (ix), a
	ld	b, #0x05
00505$:
	sla	-16 (ix)
	rl	-15 (ix)
	djnz	00505$
00177$:
	ld	a, -4 (ix)
	sub	a, -8 (ix)
	ld	a, -3 (ix)
	sbc	a, -7 (ix)
	jp	PO, 00506$
	xor	a, #0x80
00506$:
	jp	M, 00181$
	C$lemons.c$496$7_1$158	= .
	.globl	C$lemons.c$496$7_1$158
;src/lemons.c:496: maze[dy*TILESACROSS+dx]=BACK;
	ld	a, -16 (ix)
	add	a, -8 (ix)
	ld	-14 (ix), a
	ld	a, -15 (ix)
	adc	a, -7 (ix)
	ld	-13 (ix), a
	ld	a, #<(_maze)
	add	a, -14 (ix)
	ld	-12 (ix), a
	ld	a, #>(_maze)
	adc	a, -13 (ix)
	ld	-11 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x00
	C$lemons.c$497$7_1$158	= .
	.globl	C$lemons.c$497$7_1$158
;src/lemons.c:497: invalid[dy*TILESACROSS+dx]=true;
	ld	a, #<(_invalid)
	add	a, -14 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_invalid)
	adc	a, -13 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x01
	C$lemons.c$495$6_1$157	= .
	.globl	C$lemons.c$495$6_1$157
;src/lemons.c:495: for(dx=x-1;dx<=x+1;dx++) {
	inc	-8 (ix)
	jr	NZ, 00177$
	inc	-7 (ix)
	jr	00177$
00181$:
	C$lemons.c$494$4_1$155	= .
	.globl	C$lemons.c$494$4_1$155
;src/lemons.c:494: for(dy=y-1;dy<=y+1;dy++) {
	inc	-2 (ix)
	jp	NZ,00180$
	inc	-1 (ix)
	C$lemons.c$500$3_1$154	= .
	.globl	C$lemons.c$500$3_1$154
;src/lemons.c:500: return;
	jp	00180$
	C$lemons.c$507$2_0$152	= .
	.globl	C$lemons.c$507$2_0$152
;src/lemons.c:507: case S_PARACHUTE:
00129$:
	C$lemons.c$508$2_0$152	= .
	.globl	C$lemons.c$508$2_0$152
;src/lemons.c:508: switch(maze[y*TILESACROSS+x+dir]) {
	ld	bc, #_maze+0
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
	cp	a, #0x06
	jr	Z, 00131$
	sub	a, #0x07
	jr	Z, 00132$
	jr	00133$
	C$lemons.c$510$3_0$159	= .
	.globl	C$lemons.c$510$3_0$159
;src/lemons.c:510: case ENTE:
00131$:
	C$lemons.c$511$3_0$159	= .
	.globl	C$lemons.c$511$3_0$159
;src/lemons.c:511: lemonX[id]+=dir;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -20 (ix)
	add	a, c
	ld	c, a
	ld	a, -19 (ix)
	adc	a, b
	ld	b, a
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$513$3_0$159	= .
	.globl	C$lemons.c$513$3_0$159
;src/lemons.c:513: break;
	jp	00182$
	C$lemons.c$514$3_0$159	= .
	.globl	C$lemons.c$514$3_0$159
;src/lemons.c:514: case DOOR:
00132$:
	C$lemons.c$515$3_0$159	= .
	.globl	C$lemons.c$515$3_0$159
;src/lemons.c:515: active--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_active), hl
	C$lemons.c$516$3_0$159	= .
	.globl	C$lemons.c$516$3_0$159
;src/lemons.c:516: rescued++;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(_rescued), hl
	C$lemons.c$517$3_0$159	= .
	.globl	C$lemons.c$517$3_0$159
;src/lemons.c:517: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$518$3_0$159	= .
	.globl	C$lemons.c$518$3_0$159
;src/lemons.c:518: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$520$3_0$159	= .
	.globl	C$lemons.c$520$3_0$159
;src/lemons.c:520: break;
	jp	00182$
	C$lemons.c$521$3_0$159	= .
	.globl	C$lemons.c$521$3_0$159
;src/lemons.c:521: default:
00133$:
	C$lemons.c$522$3_0$159	= .
	.globl	C$lemons.c$522$3_0$159
;src/lemons.c:522: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00135$
	cp	a, #0x06
	jr	Z, 00135$
	sub	a, #0x07
	jr	Z, 00136$
	jr	00137$
	C$lemons.c$524$4_0$160	= .
	.globl	C$lemons.c$524$4_0$160
;src/lemons.c:524: case ENTE:
00135$:
	C$lemons.c$525$4_0$160	= .
	.globl	C$lemons.c$525$4_0$160
;src/lemons.c:525: lemonX[id]+=dir;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -20 (ix)
	add	a, c
	ld	c, a
	ld	a, -19 (ix)
	adc	a, b
	ld	b, a
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$526$4_0$160	= .
	.globl	C$lemons.c$526$4_0$160
;src/lemons.c:526: lemonY[id]--;
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$528$4_0$160	= .
	.globl	C$lemons.c$528$4_0$160
;src/lemons.c:528: return;
	jp	00182$
	C$lemons.c$529$4_0$160	= .
	.globl	C$lemons.c$529$4_0$160
;src/lemons.c:529: case DOOR:
00136$:
	C$lemons.c$530$4_0$160	= .
	.globl	C$lemons.c$530$4_0$160
;src/lemons.c:530: active--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_active), hl
	C$lemons.c$531$4_0$160	= .
	.globl	C$lemons.c$531$4_0$160
;src/lemons.c:531: rescued++;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(_rescued), hl
	C$lemons.c$532$4_0$160	= .
	.globl	C$lemons.c$532$4_0$160
;src/lemons.c:532: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$533$4_0$160	= .
	.globl	C$lemons.c$533$4_0$160
;src/lemons.c:533: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$535$4_0$160	= .
	.globl	C$lemons.c$535$4_0$160
;src/lemons.c:535: return;
	jp	00182$
	C$lemons.c$536$3_0$159	= .
	.globl	C$lemons.c$536$3_0$159
;src/lemons.c:536: }
00137$:
	C$lemons.c$538$3_0$159	= .
	.globl	C$lemons.c$538$3_0$159
;src/lemons.c:538: lemonDir[id]=-lemonDir[id];
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$541$2_0$152	= .
	.globl	C$lemons.c$541$2_0$152
;src/lemons.c:541: }
	C$lemons.c$542$2_0$152	= .
	.globl	C$lemons.c$542$2_0$152
;src/lemons.c:542: return;
	jp	00182$
	C$lemons.c$544$2_0$152	= .
	.globl	C$lemons.c$544$2_0$152
;src/lemons.c:544: case S_PARACLIMB:
00140$:
	C$lemons.c$545$2_0$152	= .
	.globl	C$lemons.c$545$2_0$152
;src/lemons.c:545: switch(maze[y*TILESACROSS+x+dir]) {
	ld	bc, #_maze+0
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00142$
	cp	a, #0x06
	jr	Z, 00142$
	sub	a, #0x07
	jr	Z, 00143$
	jr	00144$
	C$lemons.c$547$3_0$161	= .
	.globl	C$lemons.c$547$3_0$161
;src/lemons.c:547: case ENTE:
00142$:
	C$lemons.c$548$3_0$161	= .
	.globl	C$lemons.c$548$3_0$161
;src/lemons.c:548: lemonX[id]+=dir;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -20 (ix)
	add	a, c
	ld	c, a
	ld	a, -19 (ix)
	adc	a, b
	ld	b, a
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$550$3_0$161	= .
	.globl	C$lemons.c$550$3_0$161
;src/lemons.c:550: return;
	jp	00182$
	C$lemons.c$551$3_0$161	= .
	.globl	C$lemons.c$551$3_0$161
;src/lemons.c:551: case DOOR:
00143$:
	C$lemons.c$552$3_0$161	= .
	.globl	C$lemons.c$552$3_0$161
;src/lemons.c:552: active--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_active), hl
	C$lemons.c$553$3_0$161	= .
	.globl	C$lemons.c$553$3_0$161
;src/lemons.c:553: rescued++;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(_rescued), hl
	C$lemons.c$554$3_0$161	= .
	.globl	C$lemons.c$554$3_0$161
;src/lemons.c:554: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$555$3_0$161	= .
	.globl	C$lemons.c$555$3_0$161
;src/lemons.c:555: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$557$3_0$161	= .
	.globl	C$lemons.c$557$3_0$161
;src/lemons.c:557: return;
	jp	00182$
	C$lemons.c$558$3_0$161	= .
	.globl	C$lemons.c$558$3_0$161
;src/lemons.c:558: default:
00144$:
	C$lemons.c$559$3_0$161	= .
	.globl	C$lemons.c$559$3_0$161
;src/lemons.c:559: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00146$
	cp	a, #0x06
	jr	Z, 00146$
	sub	a, #0x07
	jr	Z, 00147$
	jr	00148$
	C$lemons.c$561$4_0$162	= .
	.globl	C$lemons.c$561$4_0$162
;src/lemons.c:561: case ENTE:
00146$:
	C$lemons.c$562$4_0$162	= .
	.globl	C$lemons.c$562$4_0$162
;src/lemons.c:562: lemonX[id]+=dir;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	add	a, -20 (ix)
	ld	e, a
	ld	a, d
	adc	a, -19 (ix)
	ld	d, a
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$lemons.c$563$4_0$162	= .
	.globl	C$lemons.c$563$4_0$162
;src/lemons.c:563: lemonY[id]--;
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$lemons.c$565$4_0$162	= .
	.globl	C$lemons.c$565$4_0$162
;src/lemons.c:565: break;
	jr	00148$
	C$lemons.c$566$4_0$162	= .
	.globl	C$lemons.c$566$4_0$162
;src/lemons.c:566: case DOOR:
00147$:
	C$lemons.c$567$4_0$162	= .
	.globl	C$lemons.c$567$4_0$162
;src/lemons.c:567: active--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_active), hl
	C$lemons.c$568$4_0$162	= .
	.globl	C$lemons.c$568$4_0$162
;src/lemons.c:568: rescued++;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(_rescued), hl
	C$lemons.c$569$4_0$162	= .
	.globl	C$lemons.c$569$4_0$162
;src/lemons.c:569: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$570$4_0$162	= .
	.globl	C$lemons.c$570$4_0$162
;src/lemons.c:570: invalid[y*TILESACROSS+x]=true;
	ld	de, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	(hl), #0x01
	C$lemons.c$573$3_0$161	= .
	.globl	C$lemons.c$573$3_0$161
;src/lemons.c:573: }
00148$:
	C$lemons.c$575$3_0$161	= .
	.globl	C$lemons.c$575$3_0$161
;src/lemons.c:575: if(y==1) {
	ld	a, -24 (ix)
	dec	a
	or	a, -23 (ix)
	jr	NZ, 00150$
	C$lemons.c$576$4_0$163	= .
	.globl	C$lemons.c$576$4_0$163
;src/lemons.c:576: lemonDir[id]=-dir;
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
	C$lemons.c$578$4_0$163	= .
	.globl	C$lemons.c$578$4_0$163
;src/lemons.c:578: return;
	jp	00182$
00150$:
	C$lemons.c$580$3_0$161	= .
	.globl	C$lemons.c$580$3_0$161
;src/lemons.c:580: switch(maze[(y-1)*TILESACROSS+x]) {
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00152$
	cp	a, #0x06
	jr	Z, 00152$
	sub	a, #0x07
	jr	Z, 00153$
	jr	00154$
	C$lemons.c$582$4_0$164	= .
	.globl	C$lemons.c$582$4_0$164
;src/lemons.c:582: case ENTE:
00152$:
	C$lemons.c$583$4_0$164	= .
	.globl	C$lemons.c$583$4_0$164
;src/lemons.c:583: lemonY[id]--;
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$585$4_0$164	= .
	.globl	C$lemons.c$585$4_0$164
;src/lemons.c:585: break;
	jp	00182$
	C$lemons.c$586$4_0$164	= .
	.globl	C$lemons.c$586$4_0$164
;src/lemons.c:586: case DOOR:
00153$:
	C$lemons.c$587$4_0$164	= .
	.globl	C$lemons.c$587$4_0$164
;src/lemons.c:587: active--;
	ld	hl, (_active)
	dec	hl
	ld	(_active), hl
	C$lemons.c$588$4_0$164	= .
	.globl	C$lemons.c$588$4_0$164
;src/lemons.c:588: rescued++;
	ld	hl, (_rescued)
	inc	hl
	ld	(_rescued), hl
	C$lemons.c$590$4_0$164	= .
	.globl	C$lemons.c$590$4_0$164
;src/lemons.c:590: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$591$4_0$164	= .
	.globl	C$lemons.c$591$4_0$164
;src/lemons.c:591: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$592$4_0$164	= .
	.globl	C$lemons.c$592$4_0$164
;src/lemons.c:592: break;
	jp	00182$
	C$lemons.c$593$4_0$164	= .
	.globl	C$lemons.c$593$4_0$164
;src/lemons.c:593: default:
00154$:
	C$lemons.c$595$4_0$164	= .
	.globl	C$lemons.c$595$4_0$164
;src/lemons.c:595: lemonDir[id]=-dir;
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
	C$lemons.c$598$3_0$161	= .
	.globl	C$lemons.c$598$3_0$161
;src/lemons.c:598: }
	C$lemons.c$599$3_0$161	= .
	.globl	C$lemons.c$599$3_0$161
;src/lemons.c:599: return;
	jp	00182$
	C$lemons.c$602$2_0$152	= .
	.globl	C$lemons.c$602$2_0$152
;src/lemons.c:602: case S_BUILD:
00157$:
	C$lemons.c$603$2_0$152	= .
	.globl	C$lemons.c$603$2_0$152
;src/lemons.c:603: switch(maze[y*TILESACROSS+x+dir]) {
	ld	bc, #_maze+0
	ld	a, c
	add	a, -6 (ix)
	ld	e, a
	ld	a, b
	adc	a, -5 (ix)
	ld	d, a
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$lemons.c$609$1_0$144	= .
	.globl	C$lemons.c$609$1_0$144
;src/lemons.c:609: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	a, c
	add	a, -2 (ix)
	ld	c, a
	ld	a, b
	adc	a, -1 (ix)
	ld	b, a
	C$lemons.c$603$2_0$152	= .
	.globl	C$lemons.c$603$2_0$152
;src/lemons.c:603: switch(maze[y*TILESACROSS+x+dir]) {
	ld	a, l
	or	a, a
	jr	Z, 00159$
	ld	a,l
	cp	a,#0x06
	jr	Z, 00159$
	sub	a, #0x07
	jp	Z,00168$
	jp	00169$
	C$lemons.c$605$3_0$165	= .
	.globl	C$lemons.c$605$3_0$165
;src/lemons.c:605: case ENTE:
00159$:
	C$lemons.c$606$3_0$165	= .
	.globl	C$lemons.c$606$3_0$165
;src/lemons.c:606: if(y>0) {
	xor	a, a
	cp	a, -24 (ix)
	sbc	a, -23 (ix)
	jp	PO, 00529$
	xor	a, #0x80
00529$:
	jp	P, 00166$
	C$lemons.c$607$4_0$166	= .
	.globl	C$lemons.c$607$4_0$166
;src/lemons.c:607: maze[y*TILESACROSS+x+dir]=SQUA;
	ld	a, #0x03
	ld	(de), a
	C$lemons.c$608$4_0$166	= .
	.globl	C$lemons.c$608$4_0$166
;src/lemons.c:608: invalid[y*TILESACROSS+x+dir]=true;
	ld	de, #_invalid+0
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	(hl), #0x01
	C$lemons.c$609$4_0$166	= .
	.globl	C$lemons.c$609$4_0$166
;src/lemons.c:609: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	a, (bc)
	or	a, a
	jr	Z, 00164$
	cp	a, #0x06
	jr	Z, 00164$
	sub	a, #0x07
	jr	NZ, 00163$
	C$lemons.c$614$5_0$167	= .
	.globl	C$lemons.c$614$5_0$167
;src/lemons.c:614: active--;
	ld	hl, (_active)
	dec	hl
	ld	(_active), hl
	C$lemons.c$615$5_0$167	= .
	.globl	C$lemons.c$615$5_0$167
;src/lemons.c:615: rescued++;
	ld	hl, (_rescued)
	inc	hl
	ld	(_rescued), hl
	C$lemons.c$616$5_0$167	= .
	.globl	C$lemons.c$616$5_0$167
;src/lemons.c:616: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$617$5_0$167	= .
	.globl	C$lemons.c$617$5_0$167
;src/lemons.c:617: invalid[y*TILESACROSS+x]=true;
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	(hl), #0x01
	C$lemons.c$619$5_0$167	= .
	.globl	C$lemons.c$619$5_0$167
;src/lemons.c:619: return;
	jp	00182$
	C$lemons.c$620$5_0$167	= .
	.globl	C$lemons.c$620$5_0$167
;src/lemons.c:620: default:
00163$:
	C$lemons.c$621$5_0$167	= .
	.globl	C$lemons.c$621$5_0$167
;src/lemons.c:621: lemonType[id]=S_WALK;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$623$5_0$167	= .
	.globl	C$lemons.c$623$5_0$167
;src/lemons.c:623: return;
	jp	00182$
	C$lemons.c$624$4_0$166	= .
	.globl	C$lemons.c$624$4_0$166
;src/lemons.c:624: }
00164$:
	C$lemons.c$625$4_0$166	= .
	.globl	C$lemons.c$625$4_0$166
;src/lemons.c:625: lemonX[id]+=dir;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	add	a, -20 (ix)
	ld	c, a
	ld	a, b
	adc	a, -19 (ix)
	ld	b, a
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$626$4_0$166	= .
	.globl	C$lemons.c$626$4_0$166
;src/lemons.c:626: lemonY[id]--;
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00182$
00166$:
	C$lemons.c$629$4_0$168	= .
	.globl	C$lemons.c$629$4_0$168
;src/lemons.c:629: lemonType[id]=S_WALK;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$631$3_0$165	= .
	.globl	C$lemons.c$631$3_0$165
;src/lemons.c:631: return;
	jp	00182$
	C$lemons.c$632$3_0$165	= .
	.globl	C$lemons.c$632$3_0$165
;src/lemons.c:632: case DOOR:
00168$:
	C$lemons.c$633$3_0$165	= .
	.globl	C$lemons.c$633$3_0$165
;src/lemons.c:633: active--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_active), hl
	C$lemons.c$634$3_0$165	= .
	.globl	C$lemons.c$634$3_0$165
;src/lemons.c:634: rescued++;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(_rescued), hl
	C$lemons.c$635$3_0$165	= .
	.globl	C$lemons.c$635$3_0$165
;src/lemons.c:635: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$636$3_0$165	= .
	.globl	C$lemons.c$636$3_0$165
;src/lemons.c:636: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$638$3_0$165	= .
	.globl	C$lemons.c$638$3_0$165
;src/lemons.c:638: return;
	jr	00182$
	C$lemons.c$639$3_0$165	= .
	.globl	C$lemons.c$639$3_0$165
;src/lemons.c:639: default:
00169$:
	C$lemons.c$640$3_0$165	= .
	.globl	C$lemons.c$640$3_0$165
;src/lemons.c:640: switch(maze[(y-1)*TILESACROSS+x+dir]) {
	ld	a, (bc)
	or	a, a
	jr	Z, 00171$
	cp	a, #0x06
	jr	Z, 00171$
	sub	a, #0x07
	jr	Z, 00172$
	jr	00173$
	C$lemons.c$642$4_0$169	= .
	.globl	C$lemons.c$642$4_0$169
;src/lemons.c:642: case ENTE:
00171$:
	C$lemons.c$643$4_0$169	= .
	.globl	C$lemons.c$643$4_0$169
;src/lemons.c:643: lemonX[id]+=dir;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	add	a, -20 (ix)
	ld	c, a
	ld	a, b
	adc	a, -19 (ix)
	ld	b, a
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$644$4_0$169	= .
	.globl	C$lemons.c$644$4_0$169
;src/lemons.c:644: lemonY[id]--;
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -26 (ix)
	ld	h, -25 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$646$4_0$169	= .
	.globl	C$lemons.c$646$4_0$169
;src/lemons.c:646: return;
	jr	00182$
	C$lemons.c$647$4_0$169	= .
	.globl	C$lemons.c$647$4_0$169
;src/lemons.c:647: case DOOR:
00172$:
	C$lemons.c$648$4_0$169	= .
	.globl	C$lemons.c$648$4_0$169
;src/lemons.c:648: active--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_active), hl
	C$lemons.c$649$4_0$169	= .
	.globl	C$lemons.c$649$4_0$169
;src/lemons.c:649: rescued++;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(_rescued), hl
	C$lemons.c$650$4_0$169	= .
	.globl	C$lemons.c$650$4_0$169
;src/lemons.c:650: invalid[y*TILESACROSS+x]=true;
	ld	bc, #_invalid+0
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x01
	C$lemons.c$651$4_0$169	= .
	.globl	C$lemons.c$651$4_0$169
;src/lemons.c:651: lemonType[id]=S_INACTIVE;
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$lemons.c$653$4_0$169	= .
	.globl	C$lemons.c$653$4_0$169
;src/lemons.c:653: return;
	jr	00182$
	C$lemons.c$654$3_0$165	= .
	.globl	C$lemons.c$654$3_0$165
;src/lemons.c:654: }
00173$:
	C$lemons.c$655$3_0$165	= .
	.globl	C$lemons.c$655$3_0$165
;src/lemons.c:655: dir=-dir;
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	C$lemons.c$656$3_0$165	= .
	.globl	C$lemons.c$656$3_0$165
;src/lemons.c:656: lemonDir[id]=dir;
	ld	l, -22 (ix)
	ld	h, -21 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$lemons.c$658$3_0$165	= .
	.globl	C$lemons.c$658$3_0$165
;src/lemons.c:658: return;
	C$lemons.c$661$1_0$144	= .
	.globl	C$lemons.c$661$1_0$144
;src/lemons.c:661: }
00182$:
	C$lemons.c$662$1_0$144	= .
	.globl	C$lemons.c$662$1_0$144
;src/lemons.c:662: }
	ld	sp, ix
	pop	ix
	C$lemons.c$662$1_0$144	= .
	.globl	C$lemons.c$662$1_0$144
	XG$nextStateId$0$0	= .
	.globl	XG$nextStateId$0$0
	ret
	G$game_init$0$0	= .
	.globl	G$game_init$0$0
	C$lemons.c$679$1_0$171	= .
	.globl	C$lemons.c$679$1_0$171
;src/lemons.c:679: void game_init(void)
;	---------------------------------
; Function game_init
; ---------------------------------
_game_init::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	C$lemons.c$682$1_0$171	= .
	.globl	C$lemons.c$682$1_0$171
;src/lemons.c:682: resetmaze(maze0);
	ld	hl, #_maze0
	call	_resetmaze
	C$lemons.c$683$1_0$171	= .
	.globl	C$lemons.c$683$1_0$171
;src/lemons.c:683: titleScreen=true;
	ld	hl, #_titleScreen
	ld	(hl), #0x01
	C$lemons.c$685$3_0$173	= .
	.globl	C$lemons.c$685$3_0$173
;src/lemons.c:685: for(i=0;i<PALETTECOUNT;i++) {
	ld	c, #0x00
00103$:
	C$lemons.c$686$3_0$173	= .
	.globl	C$lemons.c$686$3_0$173
;src/lemons.c:686: gfx_palette_load(&ctx, palette, sizeof(palette), 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0x0010
	push	hl
	ld	de, #_palette
	ld	hl, #_ctx
	call	_gfx_palette_load
	pop	bc
	C$lemons.c$685$2_0$172	= .
	.globl	C$lemons.c$685$2_0$172
;src/lemons.c:685: for(i=0;i<PALETTECOUNT;i++) {
	inc	c
	ld	a, c
	sub	a, #0x08
	jr	C, 00103$
	C$lemons.c$688$4_0$175	= .
	.globl	C$lemons.c$688$4_0$175
;src/lemons.c:688: for(i=0;i<TILECOUNT;i++) {
	ld	bc, #0x0000
00105$:
	C$lemons.c$689$4_0$175	= .
	.globl	C$lemons.c$689$4_0$175
;src/lemons.c:689: gfx_tileset_options options1 = {TILESET_COMP_NONE, i*256, 0, 0};
	ld	-5 (ix), #0x00
	ld	d, c
	ld	-4 (ix), #0x00
	ld	-3 (ix), d
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
	C$lemons.c$690$3_0$175	= .
	.globl	C$lemons.c$690$3_0$175
;src/lemons.c:690: gfx_tileset_load(&ctx, tile[i], 256, &options1);
	ld	d, c
	ld	e, #0x00
	ld	hl, #_tile
	add	hl, de
	push	bc
	ex	de, hl
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x0100
	push	hl
	ld	hl, #_ctx
	call	_gfx_tileset_load
	pop	bc
	C$lemons.c$688$2_0$174	= .
	.globl	C$lemons.c$688$2_0$174
;src/lemons.c:688: for(i=0;i<TILECOUNT;i++) {
	inc	bc
	ld	a, c
	sub	a, #0x08
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00105$
	C$lemons.c$692$1_0$171	= .
	.globl	C$lemons.c$692$1_0$171
;src/lemons.c:692: endRun=false;
	ld	hl, #_endRun
	ld	(hl), #0x00
	C$lemons.c$693$1_0$171	= .
	.globl	C$lemons.c$693$1_0$171
;src/lemons.c:693: }
	ld	sp, ix
	pop	ix
	C$lemons.c$693$1_0$171	= .
	.globl	C$lemons.c$693$1_0$171
	XG$game_init$0$0	= .
	.globl	XG$game_init$0$0
	ret
G$palette$0_0$0 == .
_palette:
	.dw #0x0000
	.dw #0x001f
	.dw #0x07e0
	.dw #0x07ff
	.dw #0xf800
	.dw #0xffe0
	.dw #0xf81f
	.dw #0xffff
	G$game_start$0$0	= .
	.globl	G$game_start$0$0
	C$lemons.c$695$1_0$177	= .
	.globl	C$lemons.c$695$1_0$177
;src/lemons.c:695: void game_start(void)
;	---------------------------------
; Function game_start
; ---------------------------------
_game_start::
	C$lemons.c$697$1_0$177	= .
	.globl	C$lemons.c$697$1_0$177
;src/lemons.c:697: rendermaze();
	C$lemons.c$698$1_0$177	= .
	.globl	C$lemons.c$698$1_0$177
;src/lemons.c:698: }
	C$lemons.c$698$1_0$177	= .
	.globl	C$lemons.c$698$1_0$177
	XG$game_start$0$0	= .
	.globl	XG$game_start$0$0
	jp	_rendermaze
	G$game_destroy$0$0	= .
	.globl	G$game_destroy$0$0
	C$lemons.c$700$1_0$179	= .
	.globl	C$lemons.c$700$1_0$179
;src/lemons.c:700: void game_destroy(void)
;	---------------------------------
; Function game_destroy
; ---------------------------------
_game_destroy::
	C$lemons.c$702$1_0$179	= .
	.globl	C$lemons.c$702$1_0$179
;src/lemons.c:702: endRun=true;
	ld	hl, #_endRun
	ld	(hl), #0x01
	C$lemons.c$703$1_0$179	= .
	.globl	C$lemons.c$703$1_0$179
;src/lemons.c:703: }
	C$lemons.c$703$1_0$179	= .
	.globl	C$lemons.c$703$1_0$179
	XG$game_destroy$0$0	= .
	.globl	XG$game_destroy$0$0
	ret
	G$game_update$0$0	= .
	.globl	G$game_update$0$0
	C$lemons.c$707$1_0$181	= .
	.globl	C$lemons.c$707$1_0$181
;src/lemons.c:707: void game_update(void) 
;	---------------------------------
; Function game_update
; ---------------------------------
_game_update::
	C$lemons.c$730$1_0$181	= .
	.globl	C$lemons.c$730$1_0$181
;src/lemons.c:730: nextState();
	call	_nextState
	C$lemons.c$734$1_0$181	= .
	.globl	C$lemons.c$734$1_0$181
;src/lemons.c:734: updateState();
	call	_updateState
	C$lemons.c$737$1_0$181	= .
	.globl	C$lemons.c$737$1_0$181
;src/lemons.c:737: if(next==MAXLEMON && active==0) {
	ld	a, (_next+0)
	sub	a, #0x32
	ld	hl, #_next + 1
	or	a, (hl)
	ret	NZ
	ld	a, (_active+1)
	ld	hl, #_active
	or	a, (hl)
	ret	NZ
	C$lemons.c$738$2_0$185	= .
	.globl	C$lemons.c$738$2_0$185
;src/lemons.c:738: mazeWait=true;
	ld	hl, #_mazeWait
	ld	(hl), #0x01
	C$lemons.c$740$1_0$181	= .
	.globl	C$lemons.c$740$1_0$181
;src/lemons.c:740: }
	C$lemons.c$740$1_0$181	= .
	.globl	C$lemons.c$740$1_0$181
	XG$game_update$0$0	= .
	.globl	XG$game_update$0$0
	ret
	G$game_paint$0$0	= .
	.globl	G$game_paint$0$0
	C$lemons.c$742$1_0$186	= .
	.globl	C$lemons.c$742$1_0$186
;src/lemons.c:742: void game_paint()
;	---------------------------------
; Function game_paint
; ---------------------------------
_game_paint::
	C$lemons.c$744$1_0$186	= .
	.globl	C$lemons.c$744$1_0$186
;src/lemons.c:744: rendermaze();
	call	_rendermaze
	C$lemons.c$745$1_0$186	= .
	.globl	C$lemons.c$745$1_0$186
;src/lemons.c:745: renderinfo();
	C$lemons.c$746$1_0$186	= .
	.globl	C$lemons.c$746$1_0$186
;src/lemons.c:746: }
	C$lemons.c$746$1_0$186	= .
	.globl	C$lemons.c$746$1_0$186
	XG$game_paint$0$0	= .
	.globl	XG$game_paint$0$0
	jp	_renderinfo
	G$keyUp$0$0	= .
	.globl	G$keyUp$0$0
	C$lemons.c$748$1_0$188	= .
	.globl	C$lemons.c$748$1_0$188
;src/lemons.c:748: bool keyUp(int key)
;	---------------------------------
; Function keyUp
; ---------------------------------
_keyUp::
	ex	de, hl
	C$lemons.c$751$1_0$188	= .
	.globl	C$lemons.c$751$1_0$188
;src/lemons.c:751: if(selected==-1 || lemonType[selected]==S_INACTIVE) {
	ld	a, (_selected+0)
	inc	a
	jr	NZ, 00174$
	ld	a, (_selected+1)
	inc	a
	jr	Z, 00101$
00174$:
	ld	bc, #_lemonType+0
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	or	a, l
	jr	NZ, 00102$
00101$:
	C$lemons.c$752$2_0$189	= .
	.globl	C$lemons.c$752$2_0$189
;src/lemons.c:752: return false;
	xor	a, a
	ret
00102$:
	C$lemons.c$755$1_0$188	= .
	.globl	C$lemons.c$755$1_0$188
;src/lemons.c:755: switch(key) {
	ld	a, e
	sub	a, #0x62
	or	a, d
	jr	Z, 00112$
	ld	a, e
	sub	a, #0x63
	or	a, d
	jr	Z, 00104$
	ld	a, e
	sub	a, #0x65
	or	a, d
	jp	Z,00114$
	ld	a, e
	sub	a, #0x70
	or	a, d
	jr	Z, 00108$
	ld	a, e
	sub	a, #0x73
	or	a, d
	jr	Z, 00113$
	jp	00115$
	C$lemons.c$756$2_0$190	= .
	.globl	C$lemons.c$756$2_0$190
;src/lemons.c:756: case 'c':
00104$:
	C$lemons.c$757$2_0$190	= .
	.globl	C$lemons.c$757$2_0$190
;src/lemons.c:757: debug_log("climber!");
	push	bc
	ld	hl, #___str_13
	call	_debug_log
	pop	bc
	C$lemons.c$758$2_0$190	= .
	.globl	C$lemons.c$758$2_0$190
;src/lemons.c:758: if(lemonType[selected]==S_PARACHUTE) {
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x02
	or	a, b
	jr	NZ, 00106$
	C$lemons.c$759$3_0$191	= .
	.globl	C$lemons.c$759$3_0$191
;src/lemons.c:759: lemonType[selected]=S_PARACLIMB;
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
	jr	00115$
00106$:
	C$lemons.c$761$3_0$192	= .
	.globl	C$lemons.c$761$3_0$192
;src/lemons.c:761: lemonType[selected]=S_CLIMB;
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$763$2_0$190	= .
	.globl	C$lemons.c$763$2_0$190
;src/lemons.c:763: break;
	jr	00115$
	C$lemons.c$764$2_0$190	= .
	.globl	C$lemons.c$764$2_0$190
;src/lemons.c:764: case 'p':
00108$:
	C$lemons.c$765$2_0$190	= .
	.globl	C$lemons.c$765$2_0$190
;src/lemons.c:765: debug_log("parachute!");
	push	bc
	ld	hl, #___str_14
	call	_debug_log
	pop	bc
	C$lemons.c$766$2_0$190	= .
	.globl	C$lemons.c$766$2_0$190
;src/lemons.c:766: if(lemonType[selected]==S_CLIMB) {
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x03
	or	a, b
	jr	NZ, 00110$
	C$lemons.c$767$3_0$193	= .
	.globl	C$lemons.c$767$3_0$193
;src/lemons.c:767: lemonType[selected]=S_PARACLIMB;
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
	jr	00115$
00110$:
	C$lemons.c$769$3_0$194	= .
	.globl	C$lemons.c$769$3_0$194
;src/lemons.c:769: lemonType[selected]=S_PARACHUTE;
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$771$2_0$190	= .
	.globl	C$lemons.c$771$2_0$190
;src/lemons.c:771: break;
	jr	00115$
	C$lemons.c$772$2_0$190	= .
	.globl	C$lemons.c$772$2_0$190
;src/lemons.c:772: case 'b':
00112$:
	C$lemons.c$773$2_0$190	= .
	.globl	C$lemons.c$773$2_0$190
;src/lemons.c:773: debug_log("build!");
	push	bc
	ld	hl, #___str_15
	call	_debug_log
	pop	bc
	C$lemons.c$774$2_0$190	= .
	.globl	C$lemons.c$774$2_0$190
;src/lemons.c:774: lemonType[selected]=S_BUILD;
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x05
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$775$2_0$190	= .
	.globl	C$lemons.c$775$2_0$190
;src/lemons.c:775: break;
	jr	00115$
	C$lemons.c$776$2_0$190	= .
	.globl	C$lemons.c$776$2_0$190
;src/lemons.c:776: case 's':
00113$:
	C$lemons.c$777$2_0$190	= .
	.globl	C$lemons.c$777$2_0$190
;src/lemons.c:777: debug_log("stop!");
	push	bc
	ld	hl, #___str_16
	call	_debug_log
	pop	bc
	C$lemons.c$778$2_0$190	= .
	.globl	C$lemons.c$778$2_0$190
;src/lemons.c:778: lemonType[selected]=S_STOP;
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x06
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$779$2_0$190	= .
	.globl	C$lemons.c$779$2_0$190
;src/lemons.c:779: break;
	jr	00115$
	C$lemons.c$780$2_0$190	= .
	.globl	C$lemons.c$780$2_0$190
;src/lemons.c:780: case 'e':
00114$:
	C$lemons.c$781$2_0$190	= .
	.globl	C$lemons.c$781$2_0$190
;src/lemons.c:781: debug_log("explode!");
	push	bc
	ld	hl, #___str_17
	call	_debug_log
	pop	bc
	C$lemons.c$782$2_0$190	= .
	.globl	C$lemons.c$782$2_0$190
;src/lemons.c:782: lemonType[selected]=S_EXPLODE;
	ld	hl, (_selected)
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x07
	inc	hl
	ld	(hl), #0x00
	C$lemons.c$784$1_0$188	= .
	.globl	C$lemons.c$784$1_0$188
;src/lemons.c:784: }	
00115$:
	C$lemons.c$785$1_0$188	= .
	.globl	C$lemons.c$785$1_0$188
;src/lemons.c:785: return true;
	ld	a, #0x01
	C$lemons.c$786$1_0$188	= .
	.globl	C$lemons.c$786$1_0$188
;src/lemons.c:786: }
	C$lemons.c$786$1_0$188	= .
	.globl	C$lemons.c$786$1_0$188
	XG$keyUp$0$0	= .
	.globl	XG$keyUp$0$0
	ret
Flemons$__str_13$0_0$0 == .
___str_13:
	.ascii "climber!"
	.db 0x00
Flemons$__str_14$0_0$0 == .
___str_14:
	.ascii "parachute!"
	.db 0x00
Flemons$__str_15$0_0$0 == .
___str_15:
	.ascii "build!"
	.db 0x00
Flemons$__str_16$0_0$0 == .
___str_16:
	.ascii "stop!"
	.db 0x00
Flemons$__str_17$0_0$0 == .
___str_17:
	.ascii "explode!"
	.db 0x00
	G$mouseUp$0$0	= .
	.globl	G$mouseUp$0$0
	C$lemons.c$788$1_0$196	= .
	.globl	C$lemons.c$788$1_0$196
;src/lemons.c:788: bool mouseUp(int x, int y)
;	---------------------------------
; Function mouseUp
; ---------------------------------
_mouseUp::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-16
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
	C$lemons.c$791$1_0$196	= .
	.globl	C$lemons.c$791$1_0$196
;src/lemons.c:791: int cx=x/TILEWIDTH,cy=y/TILEHEIGHT;
	ld	-2 (ix), c
	ld	-1 (ix), b
	bit	7, b
	jr	Z, 00123$
	ld	hl, #0x000f
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
00123$:
	ld	a, -2 (ix)
	ld	-16 (ix), a
	ld	a, -1 (ix)
	ld	-15 (ix), a
	sra	-15 (ix)
	rr	-16 (ix)
	sra	-15 (ix)
	rr	-16 (ix)
	sra	-15 (ix)
	rr	-16 (ix)
	sra	-15 (ix)
	rr	-16 (ix)
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z, 00124$
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
00124$:
	ld	-14 (ix), c
	ld	-13 (ix), b
	sra	-13 (ix)
	rr	-14 (ix)
	sra	-13 (ix)
	rr	-14 (ix)
	sra	-13 (ix)
	rr	-14 (ix)
	sra	-13 (ix)
	rr	-14 (ix)
	C$lemons.c$793$1_0$196	= .
	.globl	C$lemons.c$793$1_0$196
;src/lemons.c:793: if(titleScreen) {		
	ld	hl, #_titleScreen
	bit	0, (hl)
	jr	Z, 00102$
	C$lemons.c$794$2_0$197	= .
	.globl	C$lemons.c$794$2_0$197
;src/lemons.c:794: resetmaze(maze1);
	ld	hl, #_maze1
	call	_resetmaze
	C$lemons.c$797$2_0$197	= .
	.globl	C$lemons.c$797$2_0$197
;src/lemons.c:797: titleScreen=false;
	ld	hl, #_titleScreen
	ld	(hl), #0x00
00102$:
	C$lemons.c$799$1_0$196	= .
	.globl	C$lemons.c$799$1_0$196
;src/lemons.c:799: if(mazeWait) {		
	ld	hl, #_mazeWait
	bit	0, (hl)
	jr	Z, 00104$
	C$lemons.c$800$2_0$198	= .
	.globl	C$lemons.c$800$2_0$198
;src/lemons.c:800: resetmaze(maze2);
	ld	hl, #_maze2
	call	_resetmaze
	C$lemons.c$803$2_0$198	= .
	.globl	C$lemons.c$803$2_0$198
;src/lemons.c:803: mazeWait=false;
	ld	hl, #_mazeWait
	ld	(hl), #0x00
00104$:
	C$lemons.c$805$1_0$196	= .
	.globl	C$lemons.c$805$1_0$196
;src/lemons.c:805: selected=-1;
	ld	hl, #0xffff
	ld	(_selected), hl
	C$lemons.c$806$2_0$199	= .
	.globl	C$lemons.c$806$2_0$199
;src/lemons.c:806: for(id=0;id<next;id++) {
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00116$:
	ld	hl, #_next
	ld	a, -2 (ix)
	sub	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00241$
	xor	a, #0x80
00241$:
	jp	P, 00109$
	C$lemons.c$807$3_0$200	= .
	.globl	C$lemons.c$807$3_0$200
;src/lemons.c:807: if(lemonType[id]!=S_INACTIVE && lemonX[id]==cx && lemonY[id]==cy) {
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ex	de,hl
	ld	hl, #_lemonType
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jr	Z, 00117$
	ld	hl, #_lemonX+0
	add	hl, de
	ld	c,l
	ld	b,h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -16 (ix)
	jr	NZ, 00117$
	ld	a, h
	sub	a, -15 (ix)
	jr	NZ, 00117$
	ld	hl, #_lemonY
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -14 (ix)
	jr	NZ, 00117$
	ld	a, h
	sub	a, -13 (ix)
	jr	NZ, 00117$
	C$lemons.c$808$4_0$201	= .
	.globl	C$lemons.c$808$4_0$201
;src/lemons.c:808: selected=id;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(_selected), hl
	C$lemons.c$809$4_0$201	= .
	.globl	C$lemons.c$809$4_0$201
;src/lemons.c:809: invalid[lemonY[id]*TILESACROSS+lemonX[id]]=true;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
;	spillPairReg hl
	ld	a, (bc)
	ld	l, a
	inc	bc
	ld	a, (bc)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	de, #_invalid
	add	hl, de
	C$lemons.c$810$4_0$201	= .
	.globl	C$lemons.c$810$4_0$201
;src/lemons.c:810: return true;
	ld	a,#0x01
	ld	(hl),a
	jp	00121$
00117$:
	C$lemons.c$806$2_0$199	= .
	.globl	C$lemons.c$806$2_0$199
;src/lemons.c:806: for(id=0;id<next;id++) {
	inc	-2 (ix)
	jr	NZ, 00246$
	inc	-1 (ix)
00246$:
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	jp	00116$
00109$:
	C$lemons.c$814$2_0$202	= .
	.globl	C$lemons.c$814$2_0$202
;src/lemons.c:814: for(id=0;id<next;id++) {
	xor	a, a
	ld	-12 (ix), a
	ld	-11 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00119$:
	ld	hl, #_next
	ld	a, -2 (ix)
	sub	a, (hl)
	ld	a, -1 (ix)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00247$
	xor	a, #0x80
00247$:
	jp	P, 00114$
	C$lemons.c$815$1_0$196	= .
	.globl	C$lemons.c$815$1_0$196
;src/lemons.c:815: if(lemonType[id]!=S_INACTIVE && (lemonX[id]<cx?cx-lemonX[id]:lemonX[id]-cx)<2 && (lemonY[id]<cy?cy-lemonY[id]:lemonY[id]-cy)<2) {
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
	sla	-10 (ix)
	rl	-9 (ix)
	ld	a, #<(_lemonType)
	add	a, -10 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_lemonType)
	adc	a, -9 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jp	Z, 00120$
	ld	a, -10 (ix)
	add	a, #<(_lemonX)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	adc	a, #>(_lemonX)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	sub	a, -16 (ix)
	ld	a, -5 (ix)
	sbc	a, -15 (ix)
	jp	PO, 00249$
	xor	a, #0x80
00249$:
	jp	P, 00125$
	ld	a, -16 (ix)
	sub	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -15 (ix)
	sbc	a, -5 (ix)
	ld	-3 (ix), a
	jr	00126$
00125$:
	ld	a, -6 (ix)
	sub	a, -16 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	sbc	a, -15 (ix)
	ld	-3 (ix), a
00126$:
	ld	a, -4 (ix)
	sub	a, #0x02
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00120$
	ld	a, -10 (ix)
	add	a, #<(_lemonY)
	ld	c, a
	ld	a, -9 (ix)
	adc	a, #>(_lemonY)
	ld	b, a
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, -14 (ix)
	ld	a, d
	sbc	a, -13 (ix)
	jp	PO, 00250$
	xor	a, #0x80
00250$:
	jp	P, 00127$
	ld	a, -14 (ix)
	sub	a, e
	ld	e, a
	ld	a, -13 (ix)
	sbc	a, d
	ld	d, a
	jr	00128$
00127$:
	ld	a, e
	sub	a, -14 (ix)
	ld	e, a
	ld	a, d
	sbc	a, -13 (ix)
	ld	d, a
00128$:
	ld	a, e
	sub	a, #0x02
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00120$
	C$lemons.c$816$4_0$204	= .
	.globl	C$lemons.c$816$4_0$204
;src/lemons.c:816: selected=id;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(_selected), hl
	C$lemons.c$817$4_0$204	= .
	.globl	C$lemons.c$817$4_0$204
;src/lemons.c:817: invalid[lemonY[id]*TILESACROSS+lemonX[id]]=true;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	de, #_invalid
	add	hl, de
	C$lemons.c$818$4_0$204	= .
	.globl	C$lemons.c$818$4_0$204
;src/lemons.c:818: return true;
	ld	a,#0x01
	ld	(hl),a
	jr	00121$
00120$:
	C$lemons.c$814$2_0$202	= .
	.globl	C$lemons.c$814$2_0$202
;src/lemons.c:814: for(id=0;id<next;id++) {
	inc	-2 (ix)
	jr	NZ, 00251$
	inc	-1 (ix)
00251$:
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	jp	00119$
00114$:
	C$lemons.c$822$1_0$196	= .
	.globl	C$lemons.c$822$1_0$196
;src/lemons.c:822: return false;
	xor	a, a
00121$:
	C$lemons.c$823$1_0$196	= .
	.globl	C$lemons.c$823$1_0$196
;src/lemons.c:823: }
	ld	sp, ix
	pop	ix
	C$lemons.c$823$1_0$196	= .
	.globl	C$lemons.c$823$1_0$196
	XG$mouseUp$0$0	= .
	.globl	XG$mouseUp$0$0
	ret
	.area _TEXT
Flemons$__str_18$0_0$0 == .
___str_18:
	.ascii "+------------------------------+"
	.db 0x00
Flemons$__str_19$0_0$0 == .
___str_19:
	.ascii "|i                   +    +    |"
	.db 0x00
Flemons$__str_20$0_0$0 == .
___str_20:
	.ascii "|                   +      +   |"
	.db 0x00
Flemons$__str_21$0_0$0 == .
___str_21:
	.ascii "|----+   +    --+--+        +--|"
	.db 0x00
Flemons$__str_22$0_0$0 == .
___str_22:
	.ascii "|ll   llll l   l  ll  l  l  lll|"
	.db 0x00
Flemons$__str_23$0_0$0 == .
___str_23:
	.ascii "|l    l    ll ll l  l l  l l   |"
	.db 0x00
Flemons$__str_24$0_0$0 == .
___str_24:
	.ascii "|l    lll  l l l l  l ll l  ll |"
	.db 0x00
Flemons$__str_25$0_0$0 == .
___str_25:
	.ascii "|l    l    l   l l  l l ll    l|"
	.db 0x00
Flemons$__str_26$0_0$0 == .
___str_26:
	.ascii "+l    l    l   l l  l l  l    l|"
	.db 0x00
Flemons$__str_27$0_0$0 == .
___str_27:
	.ascii "|llll llll l   l  ll  l  l lll |"
	.db 0x00
Flemons$__str_28$0_0$0 == .
___str_28:
	.ascii "| ---+        --+--            |"
	.db 0x00
Flemons$__str_29$0_0$0 == .
___str_29:
	.ascii "|                         o    |"
	.db 0x00
Flemons$__str_30$0_0$0 == .
___str_30:
	.ascii "|+       +-----+--------+------|"
	.db 0x00
Flemons$__str_31$0_0$0 == .
___str_31:
	.ascii "| +     +      |++++++++|      |"
	.db 0x00
Flemons$__str_32$0_0$0 == .
___str_32:
	.ascii "|  +---+       |++++++++|      |"
	.db 0x00
Flemons$__str_33$0_0$0 == .
___str_33:
	.ascii "|     +  |      |              |"
	.db 0x00
Flemons$__str_34$0_0$0 == .
___str_34:
	.ascii "|      + |      |        o     |"
	.db 0x00
Flemons$__str_35$0_0$0 == .
___str_35:
	.ascii "| __     |      |    ----------|"
	.db 0x00
Flemons$__str_36$0_0$0 == .
___str_36:
	.ascii "|    +---+--    |              |"
	.db 0x00
Flemons$__str_37$0_0$0 == .
___str_37:
	.ascii "+--  |          |           ---|"
	.db 0x00
Flemons$__str_38$0_0$0 == .
___str_38:
	.ascii "|    |          |              |"
	.db 0x00
Flemons$__str_39$0_0$0 == .
___str_39:
	.ascii "|                              |"
	.db 0x00
Flemons$__str_40$0_0$0 == .
___str_40:
	.ascii "| +     +      |        |      |"
	.db 0x00
Flemons$__str_41$0_0$0 == .
___str_41:
	.ascii "|  +---+       |        |      |"
	.db 0x00
Flemons$__str_42$0_0$0 == .
___str_42:
	.ascii "| o                            |"
	.db 0x00
Flemons$__str_43$0_0$0 == .
___str_43:
	.ascii "|----+   +        ++        +--|"
	.db 0x00
Flemons$__str_44$0_0$0 == .
___str_44:
	.ascii "|     +  |      +-+            |"
	.db 0x00
Flemons$__str_45$0_0$0 == .
___str_45:
	.ascii "|      + |      |              |"
	.db 0x00
Flemons$__str_46$0_0$0 == .
___str_46:
	.ascii "| __     |      +--------------|"
	.db 0x00
Flemons$__str_47$0_0$0 == .
___str_47:
	.ascii "|    +---+--    |           i  |"
	.db 0x00
Flemons$__str_48$0_0$0 == .
___str_48:
	.ascii "| ---+        --+--        -   |"
	.db 0x00
Flemons$__str_49$0_0$0 == .
___str_49:
	.ascii "|+       +-----+--+     +------|"
	.db 0x00
Flemons$__str_50$0_0$0 == .
___str_50:
	.ascii "| +     +      |   +    |      |"
	.db 0x00
Flemons$__str_51$0_0$0 == .
___str_51:
	.ascii "|  +   +       |    +   |      |"
	.db 0x00
Flemons$__str_52$0_0$0 == .
___str_52:
	.ascii "+---   ------------------------+"
	.db 0x00
	.area _INITIALIZER
Flemons$__xinit_maze0$0_0$0 == .
__xinit__maze0:
	.dw ___str_18
	.dw ___str_19
	.dw ___str_20
	.dw ___str_21
	.dw ___str_22
	.dw ___str_23
	.dw ___str_24
	.dw ___str_25
	.dw ___str_26
	.dw ___str_27
	.dw ___str_28
	.dw ___str_29
	.dw ___str_30
	.dw ___str_31
	.dw ___str_32
	.dw ___str_18
Flemons$__xinit_maze1$0_0$0 == .
__xinit__maze1:
	.dw ___str_18
	.dw ___str_19
	.dw ___str_20
	.dw ___str_21
	.dw ___str_33
	.dw ___str_34
	.dw ___str_35
	.dw ___str_36
	.dw ___str_37
	.dw ___str_38
	.dw ___str_28
	.dw ___str_39
	.dw ___str_30
	.dw ___str_40
	.dw ___str_41
	.dw ___str_18
Flemons$__xinit_maze2$0_0$0 == .
__xinit__maze2:
	.dw ___str_18
	.dw ___str_39
	.dw ___str_42
	.dw ___str_43
	.dw ___str_44
	.dw ___str_45
	.dw ___str_46
	.dw ___str_47
	.dw ___str_37
	.dw ___str_38
	.dw ___str_48
	.dw ___str_39
	.dw ___str_49
	.dw ___str_50
	.dw ___str_51
	.dw ___str_52
Flemons$__xinit_selected$0_0$0 == .
__xinit__selected:
	.dw #0xffff
Flemons$__xinit_next$0_0$0 == .
__xinit__next:
	.dw #0x0000
Flemons$__xinit_active$0_0$0 == .
__xinit__active:
	.dw #0x0000
Flemons$__xinit_rescued$0_0$0 == .
__xinit__rescued:
	.dw #0x0000
Flemons$__xinit_titleScreen$0_0$0 == .
__xinit__titleScreen:
	.db #0x01	;  1
Flemons$__xinit_mazeWait$0_0$0 == .
__xinit__mazeWait:
	.db #0x00	;  0
	.area _CABS (ABS)
