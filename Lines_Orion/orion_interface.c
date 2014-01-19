#include <mem.h>
#include <string.h>
#include <n.h>
#include <orion/bios.h>
#include "orion_graph.h"
#include "orion_music.h"
#include "interface.h"
#include "unmlz.h"

#define COLOR_BUFFER 0x8000

void sound(uchar s, uint d) {
  asm {
    xchg
sound_l3:
    di
    lda sound_1
sound_l0:
    dcr a 
    jnz sound_l0
    ei
    lda sound_1
sound_l1:
    dcr a 
    jnz sound_l1
    dcx d
    mov a, d
    ora e
    jnz sound_l3
  } 
}

extern uchar imgTitle[1], imgTitle_colors[1];
extern uchar imgScreen[1], imgScreen_colors[1];
extern uchar imgBalls[1];
extern uchar imgCursor[1];
extern uchar imgKingLose[1];
extern uchar imgPlayerWin[1];
extern uchar imgPlayer[1];
extern uchar imgPlayerD[1];
extern uchar imgFree[1];

#define KEY_COLOR 100

#define PLAYFIELD_Y 29
#define PLAYFIELD_X 11


//---------------------------------------------------------------------------
// ����� ���� 

uchar* cellAddr(uchar x, uchar y) {
  return PIXELCOORDS(PLAYFIELD_X+x*3, PLAYFIELD_Y+y*20);
}

//---------------------------------------------------------------------------

uchar colors[1] = { 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x00 };

void drawBall1(uchar* d, uchar* o, uchar c, uchar bg) {
  color = colors[c-1] | bg;
  bitblt_bw(d, o, 0x20E);
}

void drawBall(uchar x, uchar y, uchar* o, uchar c) {
  register uchar* d = cellAddr(x, y);
  color = 0x70;
  bitblt_bw(d-1, imgBalls+16*28+1, 0x20E);
  drawBall1(d, o, c, 0x70);
}

//---------------------------------------------------------------------------
// ���㥬 �����

void drawCursor() {
  register uchar* d = cellAddr(cursorX, cursorY);
  bitblt(d, imgCursor, 0x202);
  bitblt(d+12, imgCursor+8, 0x202);
}

//---------------------------------------------------------------------------
// ���㥬 �ਪ

void drawSprite(uchar x, uchar y, uchar c) {
  if(c==0) drawBall(x, y, imgBalls+28*16, 8);
      else drawBall(x, y, imgBalls, c);
}

//---------------------------------------------------------------------------
// ������� ��祧������� �ਪ�

uchar* removeAnimation[4] = { imgBalls+5*28, imgBalls+6*28, imgBalls+7*28, imgBalls+8*28 };

void drawSpriteRemove(uchar x, uchar y, uchar s, uchar n) {
  drawBall(x, y, removeAnimation[n], s);
}

//---------------------------------------------------------------------------
// ������� ����饣� �ਪ�

void drawSpriteNew(uchar x, uchar y, uchar s, uchar n) {
  drawBall(x, y, imgBalls+(4-n)*28, s);
}

//---------------------------------------------------------------------------
// ���㥬 蠣� �� ��⪠�

void drawSpriteStep(uchar x, uchar y, uchar n) {
  drawBall(x, y, imgBalls+(12+n)*28, 8);
  sound(1, 10);
}

//---------------------------------------------------------------------------
// ���㥬 ������� ��룠�饣� �ਪ�

uchar* selAnimation[6] = { imgBalls, imgBalls, imgBalls, imgBalls+28*10, imgBalls+28*11, imgBalls+28*10 };

void drawSpriteSel(uchar x, uchar y, uchar s, uchar c, uchar t) {
  uchar* d;
  if(t==1) {
    d = cellAddr(x, y)-1;
    d[14] = 0;
    d[0x100+14] = 0;  
    drawBall1(d, selAnimation[t], s, 0x70);  
  } else {
    drawBall(x, y, selAnimation[t], s);  
  }

  if(c) drawCursor();

  if(t==3) sound(1, 10);
}

//---------------------------------------------------------------------------

uchar playerSpriteTop;
        
void drawScore(uint score, char* scoreText) {
  uchar n;
  register uchar* s;  

//  SET_COLOR(COLOR_GREEN);
  print1(PIXELCOORDS(40,7),2,5,scoreText);
  
  if(score < hiScores[0].score) {
    n = (score / (hiScores[0].score / 13));
    if(n>13) n=13;
  } else {
    n = 14;
  }

  if(playerSpriteTop != n) {
    playerSpriteTop = n;
    for(s=PIXELCOORDS(40, 167); n; --n, s-=4)
      bitBlt(s, imgPlayerD, 5*256+4);  
    bitBlt(s-46, imgPlayer, 5*256+50);                                         
    if(playerSpriteTop == 14) {
      bitBlt(s-50+0x200, imgPlayerWin, 3*256+16);
      bitBlt(PIXELCOORDS(3, 53), imgKingLose, 6*256+62);                                         
    }
  }
}

//---------------------------------------------------------------------------
// �����뢠�� ���᪠���

void redrawNewBalls(uchar a, uchar b, uchar c) {
  if(a==8) {
    color = 0;
    colorRect(PIXELCOORDS(19, 3), 0x20E);
    colorRect(PIXELCOORDS(23, 3), 0x20E);
    colorRect(PIXELCOORDS(27, 3), 0x20E);
    return;
  }
  drawBall1(PIXELCOORDS(19, 3), imgBalls, a, 0x70);
  drawBall1(PIXELCOORDS(23, 3), imgBalls, b, 0x70);
  drawBall1(PIXELCOORDS(27, 3), imgBalls, c, 0x70);
}

//---------------------------------------------------------------------------
// ���ࠥ� ���᪠���

void redrawNewBallsOff() {
  redrawNewBalls(8,8,8);
}
                                          
//---------------------------------------------------------------------------
// �����塞 ��⨢����� ������

uchar* onOff[1] = { PIXELCOORDS(4, 240), PIXELCOORDS(13, 240), PIXELCOORDS(22, 240) };

void drawOnOff(uchar n, uchar state) {
  uchar i;
  uchar* d = onOff[n];
  if(state) color = 10; else color = 7;
  colorRect(d, 0x408);
}

//---------------------------------------------------------------------------
// ��� ��룠�饣� �ਪ�

void soundJumpSel() {  
 // beep();
}

//---------------------------------------------------------------------------

void delay(uchar a) {
  uchar i;
  while(--a) {
    i = 64;
    while(--i);
  }
}

//---------------------------------------------------------------------------
// ��� �訡�� ��६�饭�� �ਪ�

void soundBadMove() {
  sound(255, 10);
  delay(128);
  sound(255, 10);
  delay(128);
}                

//---------------------------------------------------------------------------
// ����

void intro() { 
  uint* p;
  uchar s;

//  while(1)
//    puthex(getch());
  
  SCREEN_MODE = 6;

  // ���⪠ ����� 梥�
  himem();  
  color = 0;
  colorRect(PIXELCOORDS(0,0), 0x3000);

  // ��ᯠ���뢠�� ����ࠦ���� ��אַ � �����������. �� ��� ���� �� �㤥� �����
  unmlz((uchar*)0xC000, imgTitle);

  // ��ᯠ���뢠�� 梥�
  unmlz((uchar*)COLOR_BUFFER, imgTitle_colors);

  // ����� ������뢠�� ⥪��
  himem();  
  colorizer_rand();    

  // �������
  p = music;
  while(1) {
    s = *p; ++p;
    if(s==0) { while(bioskey()==0xFF); break; }
    if(bioskey()!=0xFF) break;
    sound(s, *p); ++p;
    rand();
  }
}

//---------------------------------------------------------------------------
// ��뢠���� ���� ࠧ, ��। �ᮢ����� ���⠢��

void prepareRecordScreen() {
  memset((uchar*)COLOR_BUFFER, 0, 19*139);
  color = 0x0E;
  bitblt_bw(PIXELCOORDS(112/8, PLAYFIELD_Y+17), (uchar*)COLOR_BUFFER, 0x138B);
}

//---------------------------------------------------------------------------
// ��뢠���� ������⢮ ࠧ ��� ����ᮢ�� �࠭�

void drawRecordScreen1(uchar i, uchar pos) {
  struct HiScore* h;
  uchar l;
  char buf[14];

	  for(h=hiScores+i; i<9; ++i, ++h) {
//    if(pos==i) { SET_COLOR(COLOR_YELLOW); } else SET_COLOR(COLOR_WHITE);
            
    memcpy(buf, "             ", 14);
    memcpy(buf, h->name, strlen(h->name));
    i2s(buf+8, h->score);
  
    print(25, 7+i, 14, buf);
  }
}
    	
//---------------------------------------------------------------------------
void drawRecordScreen(uchar pos) {
  drawRecordScreen1(0, pos);
}

//---------------------------------------------------------------------------
// ��뢠���� ��� ����ᮢ�� ��᫥���� ��ப�

void drawRecordLastLine() {
  drawRecordScreen1(8, 8);
}

//---------------------------------------------------------------------------
// ����ᮢ�� ४�ठ

void updateTopScore() {
  char buf[7];

  // �뢮��� ��� ��ப�
  i2s(buf, hiScores[0].score);
  color = 12;
  print1(PIXELCOORDS(3,7),1,5,buf);

  // �뢮��� ��� ��ப�
  print1(PRINTARGS(5,19),7|0x80,hiScores[0].name);
}

//---------------------------------------------------------------------------
// ���樠������ ��஢��� �࠭�

void initGameScreen() {
  uchar *s, i, x, y;

  // ������ ��頥� �࠭
  memset((uchar*)COLOR_BUFFER, 0, 0x3000);
  colorizer_rand();    

  // ��ᯠ���뢠�� ����ࠦ���� ��אַ � �����������. �� ��� ���� �� �㤥� �����
  unmlz((uchar*)0xC000, imgScreen);

  // ��ᯠ���뢠�� 梥�
  unmlz((uchar*)COLOR_BUFFER, imgScreen_colors);  

  // ����� ������뢠�� ⥪��
  himem();
  colorizer_rand();
    
  // ������
  print(56,19,8,"��");  
  updateTopScore();
  playerSpriteTop = -1;
  drawScore1();
  if(!showPath ) drawOnOff(0, 0);
  if(!playSound) drawOnOff(1, 0);
  if(!showHelp ) drawOnOff(2, 0);
}               

char translate(uchar k) {
  switch(k) {
    case KEY_F1: return K_PATH;
    case KEY_F2: return K_SOUND;
    case KEY_F3: return K_HELP;
    case KEY_F4: return K_RECORD;
    case KEY_F5: return K_NEW;
    case KEY_UP: return K_UP;
    case KEY_DOWN: return K_DOWN;
    case KEY_LEFT: return K_LEFT;
    case KEY_RIGHT: return K_RIGHT;
    case KEY_ENTER: return K_ENTER;
    case KEY_BKSPC: return K_LEFT;
    case 255: return 255;
    default:    
      if(k >= ' ') return k;
      return 0;
  }
}


//---------------------------------------------------------------------------
// ��७��ࠢ����� �� �㭪樨 BIOS

char getch_() {
  return translate(getch());
}

//---------------------------------------------------------------------------
// ��७��ࠢ����� �� �㭪樨 BIOS

char bioskey_() {
  return translate(bioskey());
}
