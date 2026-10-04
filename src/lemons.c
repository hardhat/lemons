/* lemons -- they follow your every whim
 * by Dale Wick
 * 2000 08 29
 * Revised 2026 10 03
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#include <zvb_hardware.h>
#include <zvb_gfx.h>

#include "main.h"
#include "game.h"

enum {
	BGTILE=0,
	HTILE=1,
	VTILE=2,
	SQTILE=3,
	HEROTILE=4,
	BADTILE=5,
	ENTERANCE=6,
	EXITDOOR=7,
	CURSORTILE=8,
	TILECOUNT=9
};

/* Tiles are 16x16 pixels, one hardware tile each; only sprites are placed by pixel. */
enum {
	TILEWIDTH=16,
	TILEHEIGHT=16,
	TILESACROSS=32,
	TILESDOWN=16,
	SCREENCOLS=40
};

enum { MAXLEMON=50 };

/* Game time between lemon moves, and moves between lemons entering */
enum {
	TICKMS=200,
	DROPTICKS=5
};

enum {
	S_INACTIVE=0,
	S_WALK=1,
	S_PARACHUTE=2,
	S_CLIMB=3,
	S_PARACLIMB=4,
	S_BUILD=5,
	S_STOP=6,
	S_EXPLODE=7
};

const char tile[TILECOUNT][TILEWIDTH*TILEHEIGHT] = {
{ /* BGTILE */
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,

	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,

	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,

	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
},{ /* HTILE */
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,

	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,0,0, 0,0,0,0, 0,0,0,0, 0,0,3,3,
	3,3,0,0, 0,0,0,0, 0,0,0,0, 0,0,3,3,

	3,3,0,0, 0,0,0,0, 0,0,0,0, 0,0,3,3,
	3,3,0,0, 0,0,0,0, 0,0,0,0, 0,0,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,

	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
},{ /* VTILE */
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,

	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,

	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,

	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,0,0, 0,0,3,3, 0,0,0,0,
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
},{ /* SQTILE */
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
	0,0,0,3, 3,3,3,3, 3,3,3,3, 3,0,0,0,
	0,0,3,3, 3,3,3,3, 3,3,3,3, 3,3,0,0,

	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,

	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,
	3,3,3,3, 3,3,3,3, 3,3,3,3, 3,3,3,3,

	0,0,3,3, 3,3,3,3, 3,3,3,3, 3,3,0,0,
	0,0,0,3, 3,3,3,3, 3,3,3,3, 3,0,0,0,
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
	0,0,0,0, 3,3,3,3, 3,3,3,3, 0,0,0,0,
},{ /* HEROTILE */
	0,0,0,0, 0,0,0,5, 5,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,5,5, 5,5,0,0, 0,0,0,0,
	0,0,0,0, 0,5,5,5, 5,5,5,0, 0,0,0,0,
	0,0,0,0, 5,5,5,5, 5,5,5,5, 0,0,0,0,

	0,0,0,5, 5,5,5,5, 5,5,5,5, 5,0,0,0,
	0,0,5,5, 1,1,5,5, 1,1,5,5, 5,5,0,0,
	0,0,5,5, 1,1,1,5, 1,1,1,5, 5,5,0,0,
	0,0,5,5, 5,5,5,5, 5,5,5,5, 5,5,0,0,

	0,0,5,5, 5,5,5,5, 5,5,5,5, 5,5,0,0,
	0,0,5,5, 5,5,5,5, 5,5,5,5, 5,5,0,0,
	0,0,5,5, 1,1,5,5, 5,5,1,1, 5,5,0,0,
	0,0,0,5, 5,1,1,1, 1,1,1,5, 5,0,0,0,

	0,0,0,0, 5,5,1,1, 1,1,5,5, 0,0,0,0,
	0,0,0,0, 0,5,5,5, 5,5,5,0, 0,0,0,0,
	0,0,0,0, 0,0,5,5, 5,5,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,5, 5,0,0,0, 0,0,0,0,
},{ /* BADGTILE */
	0,0,0,0, 0,0,0,4, 4,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,4,4, 4,4,0,0, 0,0,0,0,
	0,0,0,0, 0,4,4,4, 4,4,4,0, 0,0,0,0,
	0,0,0,0, 4,4,4,4, 4,4,4,4, 0,0,0,0,

	0,0,0,4, 4,4,4,4, 4,4,4,4, 4,0,0,0,
	0,0,4,4, 7,7,4,4, 7,7,4,4, 4,4,0,0,
	0,0,4,4, 7,7,7,4, 7,7,7,4, 4,4,0,0,
	0,0,4,4, 4,4,4,4, 4,4,4,4, 4,4,0,0,

	0,0,4,4, 4,4,4,4, 4,4,4,4, 4,4,0,0,
	0,0,4,4, 4,4,4,4, 4,4,4,4, 4,4,0,0,
	0,0,4,4, 7,7,4,4, 4,4,7,7, 4,4,0,0,
	0,0,0,4, 4,7,7,7, 7,7,7,4, 4,0,0,0,

	0,0,0,0, 4,4,7,7, 7,7,4,4, 0,0,0,0,
	0,0,0,0, 0,4,4,4, 4,4,4,0, 0,0,0,0,
	0,0,0,0, 0,0,4,4, 4,4,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,4, 4,0,0,0, 0,0,0,0,
},{ /* ENTERANCE */
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,6,6, 6,6,0,0, 0,0,0,0,
	0,0,0,0, 0,6,6,6, 6,6,6,0, 0,0,0,0,
	0,0,0,0, 6,6,6,6, 6,6,6,6, 0,0,0,0,

	0,0,0,6, 6,6,6,6, 6,6,6,6, 6,0,0,0,
	0,0,6,6, 6,6,6,6, 6,6,6,6, 6,6,0,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,

	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,0,6,6, 6,6,6,6, 6,6,6,6, 6,6,0,0,
	0,0,0,6, 6,6,6,6, 6,6,6,6, 6,0,0,0,

	0,0,0,0, 6,6,6,6, 6,6,6,6, 0,0,0,0,
	0,0,0,0, 0,6,6,6, 6,6,6,0, 0,0,0,0,
	0,0,0,0, 0,0,6,6, 6,6,0,0, 0,0,0,0,
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
},{ /* EXITDOOR */
	0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
	0,0,0,0, 0,0,6,6, 6,6,0,0, 0,0,0,0,
	0,0,0,0, 0,6,6,6, 6,6,6,0, 0,0,0,0,
	0,0,0,0, 6,6,6,6, 6,6,6,6, 0,0,0,0,

	0,0,0,6, 6,6,6,6, 6,6,6,6, 6,0,0,0,
	0,0,6,6, 6,6,6,6, 1,1,6,6, 6,6,0,0,
	0,6,6,6, 6,6,6,6, 1,1,1,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,

	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,

	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
	0,6,6,6, 6,6,6,6, 6,6,6,6, 6,6,6,0,
},{ /* CURSORTILE */
	7,7,7,7, 7,7,7,7, 7,7,7,7, 7,7,7,7,
	7,7,7,7, 7,7,7,7, 7,7,7,7, 7,7,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,

	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,

	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,

	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,0,0, 0,0,0,0, 0,0,0,0, 0,0,7,7,
	7,7,7,7, 7,7,7,7, 7,7,7,7, 7,7,7,7,
	7,7,7,7, 7,7,7,7, 7,7,7,7, 7,7,7,7,
} };

enum {
	BACK=0,
	HORI=1,
	VERT=2,
	SQUA=3,
	HERO=4,
	BADG=5,
	ENTE=6,
	DOOR=7
};

const char *maze0[]={
	"+------------------------------+",
	"|i                   +    +    |",
	"|                   +      +   |",
	"|----+   +    --+--+        +--|",
	"|ll   llll l   l  ll  l  l  lll|",
	"|l    l    ll ll l  l l  l l   |",
	"|l    lll  l l l l  l ll l  ll |",
	"|l    l    l   l l  l l ll    l|",
	"+l    l    l   l l  l l  l    l|",
	"|llll llll l   l  ll  l  l lll |",
	"| ---+        --+--            |",
	"|                         o    |",
	"|+       +-----+--------+------|",
	"| +     +      |++++++++|      |",
	"|  +---+       |++++++++|      |",
	"+------------------------------+",
};
const char *maze1[]={
	"+------------------------------+",
	"|i                   +    +    |",
	"|                   +      +   |",
	"|----+   +    --+--+        +--|",
	"|     +  |      |              |",
	"|      + |      |        o     |",
	"| __     |      |    ----------|",
	"|    +---+--    |              |",
	"+--  |          |           ---|",
	"|    |          |              |",
	"| ---+        --+--            |",
	"|                              |",
	"|+       +-----+--------+------|",
	"| +     +      |        |      |",
	"|  +---+       |        |      |",
	"+------------------------------+",
};
const char *maze2[]={
	"+------------------------------+",
	"|                              |",
	"| o                            |",
	"|----+   +        ++        +--|",
	"|     +  |      +-+            |",
	"|      + |      |              |",
	"| __     |      +--------------|",
	"|    +---+--    |           i  |",
	"+--  |          |           ---|",
	"|    |          |              |",
	"| ---+        --+--        -   |",
	"|                              |",
	"|+       +-----+--+     +------|",
	"| +     +      |   +    |      |",
	"|  +   +       |    +   |      |",
	"+---   ------------------------+",
};

char maze[TILESACROSS*TILESDOWN];

int enterX,enterY,doorX,doorY;
int selected=-1;
int next=0;
int active=0;
int rescued=0;
int lemonType[MAXLEMON];
int lemonX[MAXLEMON];
int lemonY[MAXLEMON];
int lemonDir[MAXLEMON];
int lemonFallen[MAXLEMON];
int lemonExplode[MAXLEMON];

bool invalid[TILESACROSS*TILESDOWN];

/* Cursor position in tiles; only its sprite is placed by pixel */
int cursorX=0,cursorY=0;
bool titleScreen=true;
bool mazeWait=false;
bool needFull=true;
bool dirty=true;
uint16_t tickTimer=0;
int dropTimer=1;

void resetmaze(const char *template[TILESDOWN])
{
	int i,j;

	active=0;
	next=0;
	rescued=0;
	selected=-1;
	tickTimer=0;
	dropTimer=1;
	memset(invalid,0,sizeof(invalid));
	needFull=true;
	dirty=true;

	for(j=0;j<TILESDOWN;j++) {
		for(i=0;i<TILESACROSS;i++) {
			switch(template[j][i]) {
			case '|': maze[j*TILESACROSS+i]=VERT; break;
			case '-': maze[j*TILESACROSS+i]=HORI; break;
			case '+': maze[j*TILESACROSS+i]=SQUA; break;
			case 'l': maze[j*TILESACROSS+i]=HERO; break;
			case 'i': maze[j*TILESACROSS+i]=ENTE; enterX=i; enterY=j; break;
			case 'o': maze[j*TILESACROSS+i]=DOOR; doorX=i; doorY=j; break;
			default:  maze[j*TILESACROSS+i]=BACK; break;
			}
		}
	}
	cursorX=enterX;
	cursorY=enterY;
}

void rendertile(int col,int row,int id)
{
	gfx_tilemap_place(&ctx, id, 0, col, row);
}

/* Draw one line of text on the tilemap; ASCII codes are tile indexes */
void print_row(int row,const char *text)
{
	uint8_t line[SCREENCOLS];
	int i;

	memset(line,' ',sizeof(line));
	for(i=0;i<SCREENCOLS && text[i];i++) line[i]=text[i];
	gfx_tilemap_load(&ctx, line, SCREENCOLS, 0, 0, row);
}

void print_col(int row,const char *text)
{
	uint8_t line[SCREENCOLS];
	int i;

	memset(line,' ',sizeof(line));
	for(i=0;i<SCREENCOLS && text[i];i++) line[i]=text[i];
	gfx_tilemap_load(&ctx, line, SCREENCOLS, 0, TILESACROSS, row);
}

const char *statename(int type)
{
	switch(type) {
	case S_WALK: return "Walk";
	case S_CLIMB: return "Climb";
	case S_PARACHUTE: return "Parachute";
	case S_PARACLIMB: return "Paraclimb";
	case S_BUILD: return "Build";
	case S_EXPLODE: return "Explode";
	case S_STOP: return "Stop";
	}
	return "";
}

/* Status text goes in the tile rows below the maze */
void renderinfo(void)
{
	char s[64];

	sprintf(s, "Lemons - %d of %d. %d rescued. %d left.", next, MAXLEMON, rescued, active);
	print_row(TILESDOWN,s);
	if(titleScreen) {
		strcpy(s, "Press space to start");
	} else if(mazeWait) {
		strcpy(s, "Level done. Press space for next");
	} else if(selected!=-1 && lemonType[selected]!=S_INACTIVE) {
		sprintf(s, "Selected lemon %d: %s @%d,%d", selected, statename(lemonType[selected]), lemonX[selected], lemonY[selected]);
	} else {
		strcpy(s, "No lemons selected");
	}
	print_row(TILESDOWN+1,s);
	print_col(0,"Controls:");
	print_col(2,"B)uild");
	print_col(3,"C)limb");
	print_col(4,"E)xplode");
	print_col(5,"P)ara-");
	print_col(6,"chute");
	print_col(7,"S)top");
	print_col(9,"Arrows - ");
	print_col(10,"Cursor");
	print_col(12,"Space - ");
	print_col(13,"Select");
}

void rendermaze(void)
{
	int j,k;

	for(j=0;j<TILESDOWN;j++) {
		gfx_tilemap_load(&ctx, &maze[j*TILESACROSS], TILESACROSS, 0, 0, j);
	}
	for(k=0;k<next;k++) {
		if(lemonType[k]!=S_INACTIVE) rendertile(lemonX[k],lemonY[k],HERO);
	}
	if(selected!=-1 && lemonType[selected]!=S_INACTIVE) {
		rendertile(lemonX[selected],lemonY[selected],BADG);
	}
}

int cellid(int x,int y)
{
	int k,id=maze[y*TILESACROSS+x];

	for(k=0;k<next;k++) {
		if(x==lemonX[k] && y==lemonY[k] && lemonType[k]!=S_INACTIVE) {
			if(k==selected) return BADG;
			id=HERO;
		}
	}
	return id;
}

void updateState(void)
{
	int x,y,row;

	for(y=0;y<TILESDOWN;y++) {
		row=y*TILESACROSS;
		for(x=0;x<TILESACROSS;x++) {
			if(invalid[row+x]) {
				rendertile(x,y,cellid(x,y));
				invalid[row+x]=false;
			}
		}
	}
}

void nextStateId(int id);

void nextState()
{
	int id,oldX,oldY;

	for(id=0;id<next;id++) {
		oldX=lemonX[id];
		oldY=lemonY[id];
		nextStateId(id);
		if(oldX!=lemonX[id] || oldY!=lemonY[id]) {
			invalid[oldY*TILESACROSS+oldX]=true;
			invalid[lemonY[id]*TILESACROSS+lemonX[id]]=true;
		}
	}
}
	
void nextStateId(int id)
{
	int x,y,dir;

	x=lemonX[id];
	y=lemonY[id];
	dir=lemonDir[id];

	if(lemonType[id]==S_INACTIVE) return;

	/* Apply gravity */
	//System.out.print("lemon id "+id+": ");
	if(y<TILESDOWN-1) {
		if((lemonType[id]==S_CLIMB || lemonType[id]==S_PARACLIMB) && maze[(y+1)*TILESACROSS+x+dir]!=BACK) {
			//System.out.println("..C: Grip baby!");
			lemonFallen[id]=0;
		} else {
			switch(maze[(y+1)*TILESACROSS+x]) {
			case BACK:
			case ENTE:
				//System.out.println("..dropping");
				lemonY[id]++;
				lemonFallen[id]++;
				return;
			case DOOR:
				//System.out.println("..exiting");
				active--;
				rescued++;
				lemonType[id]=S_INACTIVE;
				invalid[y*TILESACROSS+x]=true;
				return;
			default:
				if(lemonFallen[id]>=4 && lemonType[id]!=S_PARACHUTE && lemonType[id]!=S_PARACLIMB) {
					/* Splat! */
					//System.out.println("..splat");
					active--;
					lemonType[id]=S_INACTIVE;
					invalid[y*TILESACROSS+x]=true;
					return;
				}
				lemonFallen[id]=0;
			}
		}
	} else {
		/* Death to the opposition! */
		active--;
		lemonType[id]=S_INACTIVE;
		invalid[y*TILESACROSS+x]=true;
		//System.out.println("..death to the opposition!");
		return;
	}

	if(dir==0) {
		lemonDir[id]=1;
		return;
	}

	switch(lemonType[id]) {
	case S_EXPLODE:
		lemonExplode[id]++;

		if(lemonExplode[id]>10) {
			lemonType[id]=S_INACTIVE;
			active--;
			invalid[y*TILESACROSS+x]=true;
			int dx,dy;
			//System.out.println("..E: kaboom!");
			for(dy=y-1;dy<=y+1;dy++) {
			for(dx=x-1;dx<=x+1;dx++) {
				/* Keep the left, right and top border so lemons stay inside the maze array */
				if(dx<1 || dx>=TILESACROSS-1 || dy<1) continue;
				maze[dy*TILESACROSS+dx]=BACK;
				invalid[dy*TILESACROSS+dx]=true;
			} }
			
			return;
		}
		/* fallthorugh */
	case S_STOP:
		//System.out.println("..S: still");
		break;
	case S_WALK:
	case S_PARACHUTE:
		switch(maze[y*TILESACROSS+x+dir]) {
		case BACK:
		case ENTE:
			lemonX[id]+=dir;
			//System.out.println("..W: walk");
			break;
		case DOOR:
			active--;
			rescued++;
			invalid[y*TILESACROSS+x]=true;
			lemonType[id]=S_INACTIVE;
			//System.out.println("..W: exit");
			break;
		default:
			switch(maze[(y-1)*TILESACROSS+x+dir]) {
			case BACK:
			case ENTE:
				lemonX[id]+=dir;
				lemonY[id]--;
				//System.out.println("..W: walk");
				return;
			case DOOR:
				active--;
				rescued++;
				invalid[y*TILESACROSS+x]=true;
				lemonType[id]=S_INACTIVE;
				//System.out.println("..W: exit");
				return;
			}
			//System.out.println("..W: @"+x+","+y+" looking "+dir+"; about face"+lemonDir[id]+"!");
			lemonDir[id]=-lemonDir[id];
			//System.out.println("..W: about face"+lemonDir[id]+"!");
			break;
		}
		return;
	case S_CLIMB:
	case S_PARACLIMB:
		switch(maze[y*TILESACROSS+x+dir]) {
		case BACK:
		case ENTE:
			lemonX[id]+=dir;
			//System.out.println("..C: walk");
			return;
		case DOOR:
			active--;
			rescued++;
			lemonType[id]=S_INACTIVE;
			invalid[y*TILESACROSS+x]=true;
			//System.out.println("..C: exit");
			return;
		default:
			switch(maze[(y-1)*TILESACROSS+x+dir]) {
			case BACK:
			case ENTE:
				lemonX[id]+=dir;
				lemonY[id]--;
				//System.out.println("..W: walk");
				break;
			case DOOR:
				active--;
				rescued++;
				lemonType[id]=S_INACTIVE;
				invalid[y*TILESACROSS+x]=true;
				//System.out.println("..W: exit");
				break;
			}
			/* if in doubt, climb it */
			if(y==1) {
				lemonDir[id]=-dir;
				//System.out.println("..C: About face!");
				return;
			}
			switch(maze[(y-1)*TILESACROSS+x]) {
			case BACK:
			case ENTE:
				lemonY[id]--;
				//System.out.println("..C: up we go");
				break;
			case DOOR:
				active--;
				rescued++;
				//System.out.println("..C: exit");
				invalid[y*TILESACROSS+x]=true;
				lemonType[id]=S_INACTIVE;
				break;
			default:
				/* if in doubt fall */
				lemonDir[id]=-dir;
				//System.out.println("..C: about face!");
				break;
			}
			return;
		}
		// break;
	case S_BUILD:
		switch(maze[y*TILESACROSS+x+dir]) {
		case BACK:
		case ENTE:
			if(y>0) {
				maze[y*TILESACROSS+x+dir]=SQUA;
				invalid[y*TILESACROSS+x+dir]=true;
				switch(maze[(y-1)*TILESACROSS+x+dir]) {
				case BACK:
				case ENTE:
					break;
				case DOOR:
					active--;
					rescued++;
					lemonType[id]=S_INACTIVE;
					invalid[y*TILESACROSS+x]=true;
					//System.out.println("..B: exit");
					return;
				default:
					lemonType[id]=S_WALK;
					//System.out.println("..B: to walker");
					return;
				}
				lemonX[id]+=dir;
				lemonY[id]--;
				//System.out.println("..B: walk");
			} else {
				lemonType[id]=S_WALK;
			}
			return;
		case DOOR:
			active--;
			rescued++;
			lemonType[id]=S_INACTIVE;
			invalid[y*TILESACROSS+x]=true;
			//System.out.println("..B: exit");
			return;
		default:
			switch(maze[(y-1)*TILESACROSS+x+dir]) {
			case BACK:
			case ENTE:
				lemonX[id]+=dir;
				lemonY[id]--;
				//System.out.println("..W: walk");
				return;
			case DOOR:
				active--;
				rescued++;
				invalid[y*TILESACROSS+x]=true;
				lemonType[id]=S_INACTIVE;
				//System.out.println("..W: exit");
				return;
			}
			dir=-dir;
			lemonDir[id]=dir;
			//System.out.println("..B: about face!");
			return;
		}
		// break;
	}
}

const uint16_t palette[]={ 
	RGB888_TO_RGB565(0,0,0),
	RGB888_TO_RGB565(0,0,0xff),
	RGB888_TO_RGB565(0,0xff,0),
	RGB888_TO_RGB565(0,0xff,0xff),
	(uint16_t)RGB888_TO_RGB565(0xff,0,0),
	(uint16_t)RGB888_TO_RGB565(0xff,0xff,0),
	(uint16_t)RGB888_TO_RGB565(0xff,0,0xff),
	(uint16_t)RGB888_TO_RGB565(0xff,0xff,0xff) };

void game_init(void)
{
	int i;

	titleScreen=true;
	mazeWait=false;
	resetmaze(maze0);

	gfx_palette_load(&ctx, palette, sizeof(palette), 0);
	for(i=0;i<TILECOUNT;i++) {
		gfx_tileset_options options1 = {TILESET_COMP_NONE, i*256, 0, 0};
        gfx_tileset_load(&ctx, tile[i], 256, &options1);
	}
}

void game_start(void)
{
	rendermaze();
	renderinfo();
	needFull=false;
	dirty=false;
}

void game_update(uint16_t delta)
{
	if(titleScreen || mazeWait) return;

	tickTimer+=delta;
	if(tickTimer<TICKMS) return;
	tickTimer-=TICKMS;

	if(next<MAXLEMON) {
		if(dropTimer==0) {
			// A new lemon is born.
			lemonX[next]=enterX;
			lemonY[next]=enterY;
			lemonType[next]=S_WALK;
			lemonDir[next]=1;
			lemonFallen[next]=0;
			lemonExplode[next]=0;
			next++;
			active++;
			//System.out.println("Added lemon "+next+" at "+enterX+","+enterY);
			dropTimer=DROPTICKS;
		} else {
			dropTimer--;
		}
	}

	// Calculate the next round
	nextState();
	dirty=true;

	// With victory prepare next level.
	if(next==MAXLEMON && active==0) {
		mazeWait=true;
	}
}

void game_paint(void)
{
	if(needFull) {
		rendermaze();
		needFull=false;
	} else if(dirty) {
		updateState();
	}
	if(dirty) {
		renderinfo();
		dirty=false;
	}

	reset_sprite();
	if(!titleScreen && !mazeWait) {
		// Sprites are the one thing placed in pixels
		add_sprite(cursorX*TILEWIDTH, cursorY*TILEHEIGHT, CURSORTILE, SPRITE_FLAG_NONE);
	}
	render_sprites();
}

void select_lemon(void)
{
	int id;
	int old=selected;

	selected=-1;
	for(id=0;id<next && selected==-1;id++) {
		if(lemonType[id]!=S_INACTIVE && lemonX[id]==cursorX && lemonY[id]==cursorY) {
			selected=id;
		}
	}
	/* Now look for the nearest lemon (any within one square would do) */
	for(id=0;id<next && selected==-1;id++) {
		if(lemonType[id]!=S_INACTIVE && abs(lemonX[id]-cursorX)<2 && abs(lemonY[id]-cursorY)<2) {
			selected=id;
		}
	}

	if(old!=-1) invalid[lemonY[old]*TILESACROSS+lemonX[old]]=true;
	if(selected!=-1) invalid[lemonY[selected]*TILESACROSS+lemonX[selected]]=true;
	dirty=true;
}

void game_handle_input(uint8_t input, bool pressed)
{
	if(!pressed) return;

	if(titleScreen || mazeWait) {
		if(input==INPUT_A || input==INPUT_START) {
			resetmaze(titleScreen?maze1:maze2);
			titleScreen=false;
			mazeWait=false;
		}
		return;
	}

	switch(input) {
	case INPUT_LEFT: if(cursorX>0) cursorX--; return;
	case INPUT_RIGHT: if(cursorX<TILESACROSS-1) cursorX++; return;
	case INPUT_UP: if(cursorY>0) cursorY--; return;
	case INPUT_DOWN: if(cursorY<TILESDOWN-1) cursorY++; return;
	case INPUT_A: select_lemon(); return;
	}

	if(selected==-1 || lemonType[selected]==S_INACTIVE) {
		return;
	}
	dirty=true;
	switch(input) {
	case INPUT_X:
		debug_log("climber!");
		if(lemonType[selected]==S_PARACHUTE) {
			lemonType[selected]=S_PARACLIMB;
		} else {
			lemonType[selected]=S_CLIMB;
		}
		break;
	case INPUT_Y:
		debug_log("parachute!");
		if(lemonType[selected]==S_CLIMB) {
			lemonType[selected]=S_PARACLIMB;
		} else {
			lemonType[selected]=S_PARACHUTE;
		}
		break;
	case INPUT_B:
		debug_log("build!");
		lemonType[selected]=S_BUILD;
		break;
	case INPUT_L:
		debug_log("stop!");
		lemonType[selected]=S_STOP;
		break;
	case INPUT_R:
		debug_log("explode!");
		lemonType[selected]=S_EXPLODE;
		break;
	}	
}
