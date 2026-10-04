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

enum {
	BGTILE=0,
	HTILE=1,
	VTILE=2,
	SQTILE=3,
	HEROTILE=4,
	BADTILE=5,
	ENTERANCE=6,
	EXITDOOR=7,
	TILECOUNT=8
};

enum {
	TILEWIDTH=16,
	TILEHEIGHT=16,
	TILESACROSS=32,
	TILESDOWN=16
};

enum { MAXLEMON=50 };

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



void resetmaze(char *template[TILESDOWN])
{
	int i,j;

	active=0;
	next=0;
	rescued=0;

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
}

void rendertile(int col,int row,int id)
{
	int i;
	int x,y;
	uint8_t buffer[1];

	x=col; //*TILEWIDTH;
	y=row; //*TILEHEIGHT;

	//g.setColor(new Color(palette[id]));
	//g.fillRect(x,y,TILEWIDTH,TILEHEIGHT);
	//zvb_gfx_draw_image(ctx, tileImage[id], x, y);
	buffer[0] = id;
	show_map(buffer, x, y);

	//System.out.println("Tile "+col+","+row+": "+id);
}

void renderinfo()
{
	char buffer[256];
	memset(buffer, 0, sizeof(buffer));
	show_map_xy(buffer,80,2,0,TILESDOWN);
	// Now 4 lines of status text
	sprintf(buffer, "Lemons Status - %d of %d. %d rescued. %d left.", next, MAXLEMON, rescued, active);
	show_map_xy(buffer,strlen(buffer),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT/2);
	if(selected!=-1 && lemonType[selected]!=S_INACTIVE) {
		char s[128];
		sprintf(s, "Selected lemon %d: ", selected);
		switch(lemonType[selected]) {
		case S_WALK: strcat(s, "Walk"); break;
		case S_CLIMB: strcat(s, "Climb"); break;
		case S_PARACHUTE: strcat(s, "Parachute"); break;
		case S_PARACLIMB: strcat(s, "Paraclimb"); break;
		case S_BUILD: strcat(s, "Build"); break;
		case S_EXPLODE: strcat(s, "Explode"); break;
		case S_STOP: strcat(s, "Stop"); break;
		}
		sprintf(s + strlen(s), " @%d,%d", lemonX[selected], lemonY[selected]);
		show_map_xy(s,strlen(s),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT);
	} else {
		show_map_xy("No lemons selected",strlen("No lemons selected"),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT);
	}
	show_map_xy("b - Build | c - Climb | e - Explode",strlen("b - Build | c - Climb | e - Explode"),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT*3/2);
	show_map_xy("p - Parachute | s - Stop",strlen("p - Parachute | s - Stop"),1,5,TILEHEIGHT*TILESDOWN+TILEHEIGHT*2);	
}

void rendermaze()
{
	int i,j,k;
	int id;
	for(j=0;j<TILESDOWN;j++) {
		for(i=0;i<TILESACROSS;i++) {
			id=maze[j*TILESACROSS+i];
			for(k=0;k<next;k++) {
				if(i==lemonX[k] && j==lemonY[k] && lemonType[k]!=S_INACTIVE) {
					id=(k==selected)?BADG:HERO;
					if(k==selected) break;
				}
			}
			rendertile(i,j,id);
		}
	}
}

void updateState()
{
	int id,x,y,row,k;

	for(y=0;y<TILESDOWN;y++) {
		row=y*TILESACROSS;
		for(x=0;x<TILESACROSS;x++) {
			if(invalid[row+x]) {
				id=maze[y*TILESACROSS+x];
				for(k=0;k<next;k++) {
					if(x==lemonX[k] && y==lemonY[k] && lemonType[k]!=S_INACTIVE) {
						id=(k==selected)?BADG:HERO;
						if(k==selected) break;
					}
				}
				rendertile(x,y,id);
				//repaint(x*TILEWIDTH,y*TILEHEIGHT,TILEWIDTH,TILEHEIGHT);
				invalid[row+x]=false;
			}
		}
	}
//	repaint(0,TILEHEIGHT*TILESDOWN,TILEWIDTH*TILESACROSS,TILEHEIGHT*2);
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
	int r=rand()%4;
	int dist,x,y,dir;
	int min,max;

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
enum { PALETTECOUNT=8 };

bool endRun;
bool titleScreen=true;
int tileData[TILEWIDTH*TILEHEIGHT*8];

void game_init(void)
{
	int i,j;
	resetmaze(maze0);
	titleScreen=true;

	for(i=0;i<PALETTECOUNT;i++) {
		gfx_palette_load(&ctx, palette, sizeof(palette), 0);
	}
	for(i=0;i<TILECOUNT;i++) {
		gfx_tileset_options options1 = {TILESET_COMP_NONE, i*256, 0, 0};
        gfx_tileset_load(&ctx, tile[i], 256, &options1);
	}
	endRun=false;
}

void game_start(void)
{
	rendermaze();
}

void game_destroy(void)
{
	endRun=true;
}

bool mazeWait=false;

void game_update(void) 
{
	int dropTimer=1;

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
			dropTimer=5;
		} else {
			dropTimer--;
		}
	}

	// Calculate the next round
	nextState();

	// Update display
	//System.out.println("Rendering."+active+"/"+rescued+"/"+next+"/"+MAXLEMON);
	updateState();

	// With victory prepare next level.
	if(next==MAXLEMON && active==0) {
		mazeWait=true;
	}
}

void game_paint()
{
	rendermaze();
	renderinfo();
}

bool keyUp(int key)
{
	//System.out.println("Handling Key: "+key);
	if(selected==-1 || lemonType[selected]==S_INACTIVE) {
		return false;
	}
	//System.out.println("Key: "+key);
	switch(key) {
	case 'c':
		debug_log("climber!");
		if(lemonType[selected]==S_PARACHUTE) {
			lemonType[selected]=S_PARACLIMB;
		} else {
			lemonType[selected]=S_CLIMB;
		}
		break;
	case 'p':
		debug_log("parachute!");
		if(lemonType[selected]==S_CLIMB) {
			lemonType[selected]=S_PARACLIMB;
		} else {
			lemonType[selected]=S_PARACHUTE;
		}
		break;
	case 'b':
		debug_log("build!");
		lemonType[selected]=S_BUILD;
		break;
	case 's':
		debug_log("stop!");
		lemonType[selected]=S_STOP;
		break;
	case 'e':
		debug_log("explode!");
		lemonType[selected]=S_EXPLODE;
		break;
	}	
	return true;
}

bool mouseUp(int x, int y)
{
	int id;
	int cx=x/TILEWIDTH,cy=y/TILEHEIGHT;

	if(titleScreen) {		
		resetmaze(maze1);
		//repaint();
		//new Thread(this).start();
		titleScreen=false;
	}
	if(mazeWait) {		
		resetmaze(maze2);
		//repaint();
		//new Thread(this).start();
		mazeWait=false;
	}
	selected=-1;
	for(id=0;id<next;id++) {
		if(lemonType[id]!=S_INACTIVE && lemonX[id]==cx && lemonY[id]==cy) {
			selected=id;
			invalid[lemonY[id]*TILESACROSS+lemonX[id]]=true;
			return true;
		}
	}
	/* Now look for the nearest lemon (any within one square would do) */
	for(id=0;id<next;id++) {
		if(lemonType[id]!=S_INACTIVE && (lemonX[id]<cx?cx-lemonX[id]:lemonX[id]-cx)<2 && (lemonY[id]<cy?cy-lemonY[id]:lemonY[id]-cy)<2) {
			selected=id;
			invalid[lemonY[id]*TILESACROSS+lemonX[id]]=true;
			return true;
		}
	}

	return false;
}
