  .include "stdlib8080.inc"
drawChar:
  push b
  sta drawChar_2
  ; 29 if(c>='0' && c<='9') s = font    + 6 * (c - '0'); else
  cpi 48
  jc l0
  cpi 57
  jz l1
  jnc l0
l1:
  ; 29 s = font    + 6 * (c - '0'); elseАрифметика 4/3
  lda drawChar_2
  sui 48
  mvi d, 6
  call op_mul
  ; Сложение
  lxi d, font
  dad d
  mov b, h
  mov c, l
  jmp l2
l0:
  ; 30 if(c>='A' && c<='Z') s = fontEng + 6 * (c - 'A'); else
  lda drawChar_2
  cpi 65
  jc l3
  cpi 90
  jz l4
  jnc l3
l4:
  ; 30 s = fontEng + 6 * (c - 'A'); elseАрифметика 4/3
  lda drawChar_2
  sui 65
  mvi d, 6
  call op_mul
  ; Сложение
  lxi d, fontEng
  dad d
  mov b, h
  mov c, l
  jmp l5
l3:
  ; 31 if(c>='`' && c<='~') s = font2   + 6 * (c - '`'); else s = fontSpace;
  lda drawChar_2
  cpi 96
  jc l6
  cpi 126
  jz l7
  jnc l6
l7:
  ; 31 s = font2   + 6 * (c - '`'); else s = fontSpace;Арифметика 4/3
  lda drawChar_2
  sui 96
  mvi d, 6
  call op_mul
  ; Сложение
  lxi d, font2
  dad d
  mov b, h
  mov c, l
  jmp l8
l6:
  ; 31 s = fontSpace;
  lxi b, fontSpace
l8:
l5:
l2:
  ; 33 *d = *s; ++d; ++s;
  ldax b
  lhld drawChar_1
  mov m, a
  ; 33 ++d; ++s;
  lhld drawChar_1
  inx h
  shld drawChar_1
  ; 33 ++s;
  inx b
  ; 34 *d = *s; ++s; d += APOGEY_VIDEO_BPL - 1;
  ldax b
  mov m, a
  ; 34 ++s; d += APOGEY_VIDEO_BPL - 1;
  inx b
  ; 34 d += APOGEY_VIDEO_BPL - 1;Сложение
  lxi d, 93
  lhld drawChar_1
  dad d
  shld drawChar_1
  ; 35 *d = *s; ++d; ++s;
  ldax b
  mov m, a
  ; 35 ++d; ++s;
  lhld drawChar_1
  inx h
  shld drawChar_1
  ; 35 ++s;
  inx b
  ; 36 *d = *s; ++s; d += APOGEY_VIDEO_BPL - 1;
  ldax b
  mov m, a
  ; 36 ++s; d += APOGEY_VIDEO_BPL - 1;
  inx b
  ; 36 d += APOGEY_VIDEO_BPL - 1;Сложение
  lxi d, 93
  lhld drawChar_1
  dad d
  shld drawChar_1
  ; 37 *d = *s; ++d; ++s;
  ldax b
  mov m, a
  ; 37 ++d; ++s;
  lhld drawChar_1
  inx h
  shld drawChar_1
  ; 37 ++s;
  inx b
  ; 38 *d = *s;
  ldax b
  mov m, a
  pop b
  ret
  ; --- drawText -----------------------------------------------------------------
drawText:
  shld drawText_2
  ; 43 for(;c=*text; text++) {
l9:
  lhld drawText_2
  mov a, m
  sta drawText_c
  ; convertToConfition
  ora a
  jz l10
  ; 44 drawChar(d, c);
  lhld drawText_1
  shld drawChar_1
  lda drawText_c
  call drawChar
  ; 45 d += 2; Сложение с константой 2
  lhld drawText_1
  inx h
  inx h
  shld drawText_1
l11:
  lhld drawText_2
  mov d, h
  mov e, l
  inx h
  shld drawText_2
  xchg
  jmp l9
l10:
  ret
  ; --- drawSprite0 -----------------------------------------------------------------
drawSprite0:
  push b
  shld drawSprite0_3
  ; 50 dd;<d>
  lhld drawSprite0_1
  mov b, h
  mov c, l
  ; 51 c = colors[c];Сложение
  lhld drawSprite0_2
  mvi h, 0
  lxi d, colors
  dad d
  mov a, m
  sta drawSprite0_2
  ; 53 *d = c;  ++d;  
  stax b
  ; 53 ++d;  
  inx b
  ; 54 *d = *s; ++d; ++s;
  lhld drawSprite0_3
  mov a, m
  stax b
  ; 54 ++d; ++s;
  inx b
  ; 54 ++s;
  inx h
  shld drawSprite0_3
  ; 55 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 55 ++d; ++s;
  inx b
  ; 55 ++s;
  inx h
  shld drawSprite0_3
  ; 56 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 56 ++d; ++s;
  inx b
  ; 56 ++s;
  inx h
  shld drawSprite0_3
  ; 57 *d = *s; ++s; d += APOGEY_VIDEO_BPL - 4;
  mov a, m
  stax b
  ; 57 ++s; d += APOGEY_VIDEO_BPL - 4;
  inx h
  shld drawSprite0_3
  ; 57 d += APOGEY_VIDEO_BPL - 4;Сложение с BC
  lxi h, 90
  dad b
  mov b, h
  mov c, l
  ; 58 *d = c;  ++d;  
  lda drawSprite0_2
  stax b
  ; 58 ++d;  
  inx b
  ; 59 *d = *s; ++d; ++s;
  lhld drawSprite0_3
  mov a, m
  stax b
  ; 59 ++d; ++s;
  inx b
  ; 59 ++s;
  inx h
  shld drawSprite0_3
  ; 60 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 60 ++d; ++s;
  inx b
  ; 60 ++s;
  inx h
  shld drawSprite0_3
  ; 61 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 61 ++d; ++s;
  inx b
  ; 61 ++s;
  inx h
  shld drawSprite0_3
  ; 62 *d = *s; ++s; d += APOGEY_VIDEO_BPL - 4;
  mov a, m
  stax b
  ; 62 ++s; d += APOGEY_VIDEO_BPL - 4;
  inx h
  shld drawSprite0_3
  ; 62 d += APOGEY_VIDEO_BPL - 4;Сложение с BC
  lxi h, 90
  dad b
  mov b, h
  mov c, l
  ; 63 *d = c;  ++d;  
  lda drawSprite0_2
  stax b
  ; 63 ++d;  
  inx b
  ; 64 *d = *s; ++d; ++s;
  lhld drawSprite0_3
  mov a, m
  stax b
  ; 64 ++d; ++s;
  inx b
  ; 64 ++s;
  inx h
  shld drawSprite0_3
  ; 65 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 65 ++d; ++s;
  inx b
  ; 65 ++s;
  inx h
  shld drawSprite0_3
  ; 66 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 66 ++d; ++s;
  inx b
  ; 66 ++s;
  inx h
  shld drawSprite0_3
  ; 67 *d = *s; ++s; d += APOGEY_VIDEO_BPL - 4;
  mov a, m
  stax b
  ; 67 ++s; d += APOGEY_VIDEO_BPL - 4;
  inx h
  shld drawSprite0_3
  ; 67 d += APOGEY_VIDEO_BPL - 4;Сложение с BC
  lxi h, 90
  dad b
  mov b, h
  mov c, l
  ; 68 *d = c;  ++d;  
  lda drawSprite0_2
  stax b
  ; 68 ++d;  
  inx b
  ; 69 *d = *s; ++d; ++s;
  lhld drawSprite0_3
  mov a, m
  stax b
  ; 69 ++d; ++s;
  inx b
  ; 69 ++s;
  inx h
  shld drawSprite0_3
  ; 70 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 70 ++d; ++s;
  inx b
  ; 70 ++s;
  inx h
  shld drawSprite0_3
  ; 71 *d = *s; ++d; ++s;
  mov a, m
  stax b
  ; 71 ++d; ++s;
  inx b
  ; 71 ++s;
  inx h
  shld drawSprite0_3
  ; 72 *d = *s;
  mov a, m
  stax b
  pop b
  ret
  ; --- drawSprite -----------------------------------------------------------------
drawSprite:
  shld drawSprite_4
  ; 76 drawSprite0(COORDS(x$5 + PLAYFIELD_X, y$4+PLAYFIELD_Y), c, s);
  lda drawSprite_1
  ; Умножение A на 5
  mov d, a
  add a
  add a
  add d
  adi 18
  ; Сложение
  mvi h, 0
  mov l, a
  lxi d, 52811
  dad d
  lda drawSprite_2
  ; Умножение A на 4
  add a
  add a
  adi 6
  push h
  mvi d, 94
  call op_mul
  ; Сложение
  pop d
  dad d
  shld drawSprite0_1
  lda drawSprite_3
  sta drawSprite0_2
  lhld drawSprite_4
  jmp drawSprite0
fillScreen:
  shld fillScreen_1
  ; 81 apogeyVideoMem;<d>
  lhld apogeyVideoMem
  shld fillScreen_d
  ; 83 for(i=51; i; --i, d += APOGEY_VIDEO_BPL, s += 80)
  mvi a, 51
  sta fillScreen_i
l12:
  ; convertToConfition
  lda fillScreen_i
  ora a
  jz l13
  ; 84 memcpy(d, s, 80);
  lhld fillScreen_d
  shld memcpy_1
  lhld fillScreen_1
  shld memcpy_2
  lxi h, 80
  call memcpy
l14:
  lxi h, fillScreen_i
  dcr m
  ; Сложение
  lxi d, 94
  lhld fillScreen_d
  dad d
  shld fillScreen_d
  ; Сложение
  lxi d, 80
  lhld fillScreen_1
  dad d
  shld fillScreen_1
  jmp l12
l13:
  ret
  ; --- i2s -----------------------------------------------------------------
i2s:
  shld i2s_2
  ; 91 *buf = ' '; ++buf;
  lhld i2s_1
  mvi m, 32
  ; 91 ++buf;
  inx h
  shld i2s_1
  ; 92 *buf = ' '; ++buf;
  mvi m, 32
  ; 92 ++buf;
  inx h
  shld i2s_1
  ; 93 *buf = ' '; ++buf;
  mvi m, 32
  ; 93 ++buf;
  inx h
  shld i2s_1
  ; 94 *buf = ' '; ++buf;
  mvi m, 32
  ; 94 ++buf;
  inx h
  shld i2s_1
  ; 95 for(i=0; i<5; i++) {
  xra a
  sta i2s_i
l15:
  lda i2s_i
  cpi 5
  jnc l16
  ; 96 x/=10, *buf = (uchar)op_div16_mod + '0', --buf; 
  lxi d, 10
  lhld i2s_2
  call op_div16
  shld i2s_2
  lda op_div16_mod
  adi 48
  lhld i2s_1
  mov m, a
  lhld i2s_1
  dcx h
  shld i2s_1
  ; 97 if(x==0) break;Сложение с константой 0
  lhld i2s_2
  mov a, l
  ora h
  jz l16
l17:
  lxi h, i2s_i
  mov a, m
  inr m
  jmp l15
l16:
  ret
  ; --- drawNumber -----------------------------------------------------------------
drawNumber:
  shld drawNumber_2
  ; 103 i2s(buf, x);
  lxi h, drawNumber_buf
  shld i2s_1
  lhld drawNumber_2
  call i2s
  ; 104 drawText(addr, buf);
  lhld drawNumber_1
  shld drawText_1
  lxi h, drawNumber_buf
  jmp drawText
superDraw:
  push b
  sta superDraw_7
  ; 110 dd;<d>
  lhld superDraw_1
  mov b, h
  mov c, l
  ; 111 for(; a; --a, d += APOGEY_VIDEO_BPL) memcpy(d, s, w);
l19:
  ; convertToConfition
  lda superDraw_2
  ora a
  jz l20
  ; 111 memcpy(d, s, w);
  shld memcpy_1
  lhld superDraw_5
  shld memcpy_2
  lhld superDraw_6
  mvi h, 0
  call memcpy
l21:
  lxi h, superDraw_2
  dcr m
  ; Сложение с BC
  lxi h, 94
  dad b
  mov b, h
  mov c, l
  jmp l19
l20:
  ; 112 for(; b; --b, d += APOGEY_VIDEO_BPL, s+=bpl) memcpy(d, s, w);
l22:
  ; convertToConfition
  lda superDraw_3
  ora a
  jz l23
  ; 112 memcpy(d, s, w);
  mov h, b
  mov l, c
  shld memcpy_1
  lhld superDraw_5
  shld memcpy_2
  lhld superDraw_6
  mvi h, 0
  call memcpy
l24:
  lxi h, superDraw_3
  dcr m
  ; Сложение с BC
  lxi h, 94
  dad b
  mov b, h
  mov c, l
  ; Сложение
  lhld superDraw_7
  mvi h, 0
  xchg
  lhld superDraw_5
  dad d
  shld superDraw_5
  jmp l22
l23:
  ; 113 for(; c; --c, d += APOGEY_VIDEO_BPL) memcpy(d, s, w);
l25:
  ; convertToConfition
  lda superDraw_4
  ora a
  jz l26
  ; 113 memcpy(d, s, w);
  mov h, b
  mov l, c
  shld memcpy_1
  lhld superDraw_5
  shld memcpy_2
  lhld superDraw_6
  mvi h, 0
  call memcpy
l27:
  lxi h, superDraw_4
  dcr m
  ; Сложение с BC
  lxi h, 94
  dad b
  mov b, h
  mov c, l
  jmp l25
l26:
  pop b
  ret
  ; --- drawScore -----------------------------------------------------------------
drawScore:
  shld drawScore_1
  ; 119 drawNumber(COORDS(67, 1), score);
  lxi h, 52972
  shld drawNumber_1
  lhld drawScore_1
  call drawNumber
  ; 121 if(score < hiScores[0].score) n = (score / (hiScores[0].score / 6));
  lhld drawScore_1
  xchg
  lhld ((hiScores)+(0))+(14)
  call op_cmp16
  jc l28
  ; 121 n = (score / (hiScores[0].score / 6));
  lxi d, 6
  lhld ((hiScores)+(0))+(14)
  call op_div16
  xchg
  lhld drawScore_1
  call op_div16
  mov a, l
  sta drawScore_n
  jmp l29
l28:
  ; 122 n = 7;
  mvi a, 7
  sta drawScore_n
l29:
  ; 124 if(playerSpriteTop != n) {
  lxi h, drawScore_n
  lda playerSpriteTop
  cmp m
  jz l30
  ; 125 playerSpriteTop = n;
  mov a, m
  sta playerSpriteTop
  ; 126 waitHorzSync();
  call waitHorzSync
  ; 127 if(n > 6) { superDraw(COORDS(63, 6), 0, 23, 7, rightSprite, 17, 17); n=1; }
  lda drawScore_n
  cpi 6
  jc l31
  jz l31
  ; 127 superDraw(COORDS(63, 6), 0, 23, 7, rightSprite, 17, 17); n=1; }
  lxi h, 53438
  shld superDraw_1
  xra a
  sta superDraw_2
  mvi a, 23
  sta superDraw_3
  mvi a, 7
  sta superDraw_4
  lxi h, rightSprite
  shld superDraw_5
  mvi a, 17
  sta superDraw_6
  call superDraw
  ; 127 n=1; }
  mvi a, 1
  sta drawScore_n
  jmp l32
l31:
  ; 128 superDraw(COORDS(63, 6), 6-n, 23, n, gameScreen + 63 + 12*80, 17, 80); n=0; }  
  lxi h, 53438
  shld superDraw_1
  ; Арифметика 3/4
  lxi h, drawScore_n
  mvi a, 6
  sub m
  sta superDraw_2
  mvi a, 23
  sta superDraw_3
  mov a, m
  sta superDraw_4
  lxi h, ((gameScreen)+(63))+(960)
  shld superDraw_5
  mvi a, 17
  sta superDraw_6
  mvi a, 80
  call superDraw
  ; 128 n=0; }  
  xra a
  sta drawScore_n
l32:
  ; 129 if(kingSprite != n) {
  lxi h, drawScore_n
  lda kingSprite
  cmp m
  jz l33
  ; 130 kingSprite = n;
  mov a, m
  sta kingSprite
  ; 131 if(n) superDraw(COORDS(0, 6), 5, 16, 0, leftSprite, 18, 18);convertToConfition
  xra a
  ora m
  jz l34
  ; 131 superDraw(COORDS(0, 6), 5, 16, 0, leftSprite, 18, 18);
  lxi h, 53375
  shld superDraw_1
  mvi a, 5
  sta superDraw_2
  mvi a, 16
  sta superDraw_3
  xra a
  sta superDraw_4
  lxi h, leftSprite
  shld superDraw_5
  mvi a, 18
  sta superDraw_6
  call superDraw
  jmp l35
l34:
  ; 132 superDraw(COORDS(0, 6), 0, 21, 0, gameScreen + 0 + 6*80, 18, 80);
  lxi h, 53375
  shld superDraw_1
  xra a
  sta superDraw_2
  mvi a, 21
  sta superDraw_3
  xra a
  sta superDraw_4
  lxi h, ((gameScreen)+(0))+(480)
  shld superDraw_5
  mvi a, 18
  sta superDraw_6
  mvi a, 80
  call superDraw
l35:
l33:
l30:
  ret
  ; --- redrawNewBall -----------------------------------------------------------------
redrawNewBall:
  sta redrawNewBall_2
  ; 138 c = colors[c];Сложение
  mov l, a
  mvi h, 0
  lxi d, colors
  dad d
  mov a, m
  sta redrawNewBall_2
  ; 139 *p = c; p += 94;
  lhld redrawNewBall_1
  mov m, a
  ; 139 p += 94;Сложение
  lxi d, 94
  lhld redrawNewBall_1
  dad d
  shld redrawNewBall_1
  ; 140 *p = c; p += 94;
  lda redrawNewBall_2
  mov m, a
  ; 140 p += 94;Сложение
  lxi d, 94
  lhld redrawNewBall_1
  dad d
  shld redrawNewBall_1
  ; 141 *p = c;
  lda redrawNewBall_2
  mov m, a
  ret
  ; --- redrawNewBalls -----------------------------------------------------------------
redrawNewBalls:
  sta redrawNewBalls_3
  ; 145 redrawNewBall(COORDS(36, 1), a);
  lxi h, 52941
  shld redrawNewBall_1
  lda redrawNewBalls_1
  call redrawNewBall
  ; 146 redrawNewBall(COORDS(41, 1), b);
  lxi h, 52946
  shld redrawNewBall_1
  lda redrawNewBalls_2
  call redrawNewBall
  ; 147 redrawNewBall(COORDS(46, 1), c);
  lxi h, 52951
  shld redrawNewBall_1
  lda redrawNewBalls_3
  jmp redrawNewBall
drawOnOff:
  sta drawOnOff_2
  ; 154 switch(n) {
  lda drawOnOff_1
  ora a
  jz l37
  cpi 1
  jz l38
  cpi 2
  jz l39
  jmp l40
l37:
  ; 155 addr = COORDS(5,  43); break;
  lxi h, 56858
  shld drawOnOff_addr
  ; 155 break;
  jmp l36
l38:
  ; 156 addr = COORDS(19, 43); break;
  lxi h, 56872
  shld drawOnOff_addr
  ; 156 break;
  jmp l36
l39:
  ; 157 addr = COORDS(34, 43); break;
  lxi h, 56887
  shld drawOnOff_addr
  ; 157 break;
  jmp l36
l40:
  ; 158 return;
  ret
l36:
  ; 161 state = state ? 0x84 : 0x80;
  lda drawOnOff_2
  ora a
  jz l41
  mvi a, 132
  jmp l42
l41:
  mvi a, 128
l42:
  sta drawOnOff_2
  ; 163 for(i=0; i<4; i++, addr+=APOGEY_VIDEO_BPL)
  xra a
  sta drawOnOff_i
l43:
  lda drawOnOff_i
  cpi 4
  jnc l44
  ; 164 *addr = state;
  lda drawOnOff_2
  lhld drawOnOff_addr
  mov m, a
l45:
  lxi h, drawOnOff_i
  mov a, m
  inr m
  ; Сложение
  lxi d, 94
  lhld drawOnOff_addr
  dad d
  shld drawOnOff_addr
  jmp l43
l44:
  ret
  ; --- soundJumpSel -----------------------------------------------------------------
soundJumpSel:
  push b
  ; 1 ((uchar*)0xEC00)[CH] = (uchar)(FREQ); ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  lxi h, 60416
  mvi m, 232
  ; 1 ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  mvi m, 3
  ; 170 for(x=255; x; x--);
  mvi b, 255
l46:
  ; convertToConfition
  mov a, b
  ora a
  jz l47
l48:
  mov a, b
  dcr b
  jmp l46
l47:
  ; 1 *(uchar*)0xEC03 = ((CH)==0 ? 0x3E : ((CH)==1 ? 0x7E : 0xBE)); }
  lxi h, 60419
  mvi m, 62
  pop b
  ret
  ; --- delayX -----------------------------------------------------------------
delayX:
  shld delayX_1
  ; 175 while(--x);
l53:
  dcx h
  shld delayX_1
  ; convertToConfition
  mov a, l
  ora h
  jz l54
  jmp l53
l54:
  ret
  ; --- soundBadMove -----------------------------------------------------------------
soundBadMove:
  xra a
  sta soundBadMove_i
l55:
  lda soundBadMove_i
  cpi 2
  jnc l56
  ; 1 ((uchar*)0xEC00)[CH] = (uchar)(FREQ); ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  lxi h, 60416
  mvi m, 16
  ; 1 ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  mvi m, 39
  ; 182 delayX(2000);
  lxi h, 2000
  call delayX
  ; 1 *(uchar*)0xEC03 = ((CH)==0 ? 0x3E : ((CH)==1 ? 0x7E : 0xBE)); }
  lxi h, 60419
  mvi m, 62
  ; 184 delayX(2000);
  lxi h, 2000
  call delayX
l57:
  lxi h, soundBadMove_i
  mov a, m
  inr m
  jmp l55
l56:
  ret
  ; --- showGameOver -----------------------------------------------------------------
showGameOver:
  lxi h, 56478
  shld drawText_1
  lxi h, string0
  call drawText
  ; 190 drawText(COORDS(4, 39), "o");
  lxi h, 56481
  shld drawText_1
  lxi h, string1
  call drawText
  ; 191 drawText(COORDS(7, 39), "n");
  lxi h, 56484
  shld drawText_1
  lxi h, string2
  call drawText
  ; 192 drawText(COORDS(10, 39), "e");
  lxi h, 56487
  shld drawText_1
  lxi h, string3
  call drawText
  ; 193 drawText(COORDS(12, 39), "c  ");
  lxi h, 56489
  shld drawText_1
  lxi h, string4
  jmp drawText
delayHS:
  sta delayHS_1
  ; 197 while(f--)
l62:
  lxi h, delayHS_1
  mov a, m
  dcr m
  ; convertToConfition
  ora a
  jz l63
  ; 198 waitHorzSync();
  call waitHorzSync
  jmp l62
l63:
  ret
  ; --- demo -----------------------------------------------------------------
demo:
  lxi h, music
  shld demo_p
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 191
  ; 1 ((uchar*)0xEF00)
  mvi m, 51
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, (startScreen) & 0FFh
  ; 1 ((uchar*)0xF000)
  mvi m, ((startScreen)>>(8)) & 0FFh
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 77
  ; 1 ((uchar*)0xF000)
  mvi m, 102
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 
 ei 
  ; 13 asm { di } 208 while(d = * p) {
l70:
  lhld demo_p
  mov a, m
  sta demo_d
  ; convertToConfition
  ora a
  jz l71
  ; 209 ++p;
  inx h
  shld demo_p
  ; 210 s = musicFreq[d-1];
  lda demo_d
  dcr a
  mvi h, 0
  mov l, a
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, musicFreq
  dad d
  mov e, m
  inx h
  mov d, m
  xchg
  shld demo_s
  ; 1 ((uchar*)0xEC00)[CH] = (uchar)(FREQ); ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  lda demo_s
  sta 60416
  ; 1 ((uchar*)0xEC00)[CH] = (FREQ)>>8; }Сдвиг на 8 вправо
  lhld demo_s
  mov l, h
  mvi h, 0
  mov a, l
  sta 60416
  ; 212 s += 10; Сложение
  lxi d, 10
  lhld demo_s
  dad d
  shld demo_s
  ; 1 ((uchar*)0xEC00)[CH] = (uchar)(FREQ); ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  lda demo_s
  sta 60417
  ; 1 ((uchar*)0xEC00)[CH] = (FREQ)>>8; }Сдвиг на 8 вправо
  lhld demo_s
  mov l, h
  mov h, d
  mov a, l
  sta 60417
  ; 214 s += 15;Сложение
  lxi d, 15
  lhld demo_s
  dad d
  shld demo_s
  ; 1 ((uchar*)0xEC00)[CH] = (uchar)(FREQ); ((uchar*)0xEC00)[CH] = (FREQ)>>8; }
  lda demo_s
  sta 60418
  ; 1 ((uchar*)0xEC00)[CH] = (FREQ)>>8; }Сдвиг на 8 вправо
  lhld demo_s
  mov l, h
  mov h, d
  mov a, l
  sta 60418
  ; 216 d = *p; ++p;
  lhld demo_p
  mov a, m
  sta demo_d
  ; 216 ++p;
  inx h
  shld demo_p
  ; 217 d >>= 1; Сдвиг на 1 влево
  cmp a
  rar
  sta demo_d
  ; 218 delayHS(d); 
  call delayHS
  ; 1 *(uchar*)0xEC03 = ((CH)==0 ? 0x3E : ((CH)==1 ? 0x7E : 0xBE)); }
  lxi h, 60419
  mvi m, 190
  ; 220 d <<= 1; Сдвиг на 1 влево
  lda demo_d
  add a
  sta demo_d
  ; 221 delayHS(d); 
  call delayHS
  ; 1 *(uchar*)0xEC03 = ((CH)==0 ? 0x3E : ((CH)==1 ? 0x7E : 0xBE)); }
  lxi h, 60419
  mvi m, 126
  ; 223 d <<= 1; Сдвиг на 1 влево
  lda demo_d
  add a
  sta demo_d
  ; 224 delayHS(d);
  call delayHS
  ; 1 *(uchar*)0xEC03 = ((CH)==0 ? 0x3E : ((CH)==1 ? 0x7E : 0xBE)); }
  lxi h, 60419
  mvi m, 62
  ; 226 delayHS(2);
  mvi a, 2
  call delayHS
  ; 227 if(bioskey()!=255) return;
  call 63515
  cpi 255
  jz l84
  ; 227 return;
  ret
l84:
  jmp l70
l71:
  ; 229 while(bioskey()==255);
l85:
  call 63515
  cpi 255
  jnz l86
  jmp l85
l86:
  ret
  ; --- printCenter -----------------------------------------------------------------
printCenter:
  sta printCenter_4
  ; 234 while(1) {
l87:
  ; 235 *a = cl;   a += APOGEY_VIDEO_BPL;
  lda printCenter_1
  lhld printCenter_2
  mov m, a
  ; 235 a += APOGEY_VIDEO_BPL;Сложение
  lxi d, 94
  lhld printCenter_2
  dad d
  shld printCenter_2
  ; 236 *a = cl;   a += APOGEY_VIDEO_BPL;
  lda printCenter_1
  mov m, a
  ; 236 a += APOGEY_VIDEO_BPL;Сложение
  lxi d, 94
  lhld printCenter_2
  dad d
  shld printCenter_2
  ; 237 *a = cl;   a += APOGEY_VIDEO_BPL;
  lda printCenter_1
  mov m, a
  ; 237 a += APOGEY_VIDEO_BPL;Сложение
  lxi d, 94
  lhld printCenter_2
  dad d
  shld printCenter_2
  ; 238 *a = 0x8D; a -= APOGEY_VIDEO_BPL*3-1;
  mvi m, 141
  ; 238 a -= APOGEY_VIDEO_BPL*3-1;Сложение
  lxi d, 65255
  dad d
  shld printCenter_2
  ; 240 c = *text;
  lhld printCenter_3
  mov a, m
  sta printCenter_c
  ; 241 ++text;
  inx h
  shld printCenter_3
  ; 242 drawChar(a, c);
  lhld printCenter_2
  shld drawChar_1
  call drawChar
  ; 243 a += 2;Сложение с константой 2
  lhld printCenter_2
  inx h
  inx h
  shld printCenter_2
  ; 245 c = *text;
  lhld printCenter_3
  mov a, m
  sta printCenter_c
  ; 246 ++text;
  inx h
  shld printCenter_3
  ; 247 drawChar(a, c);
  lhld printCenter_2
  shld drawChar_1
  call drawChar
  ; 248 a += 2;Сложение с константой 2
  lhld printCenter_2
  inx h
  inx h
  shld printCenter_2
  ; 250 if(--l==0) return;
  lxi h, printCenter_4
  dcr m
  lda printCenter_4
  ora a
  jnz l89
  ; 250 return;
  ret
l89:
  jmp l87
l88:
  ret
  ; --- showRecordScreen -----------------------------------------------------------------
showRecordScreen:
  push b
  sta showRecordScreen_1
  ; 261 a = COORDS(18, 6);
  lxi b, 53393
  ; 263 buf[0]=' ';
  mvi a, 32
  sta (showRecordScreen_buf)+(0)
  ; 264 buf[6]=0;
  xra a
  sta (showRecordScreen_buf)+(6)
  ; 266 for(i=0, h=hiScores; i<9; ++i, ++h) {
  sta showRecordScreen_i
  lxi h, hiScores
  shld showRecordScreen_h
l90:
  lda showRecordScreen_i
  cpi 9
  jnc l91
  ; 267 if(i==pos) c=0x84; else c=0x80;
  lxi h, showRecordScreen_1
  cmp m
  jnz l93
  ; 267 c=0x84; else c=0x80;
  mvi a, 132
  sta showRecordScreen_c
  jmp l94
l93:
  ; 267 c=0x80;
  mvi a, 128
  sta showRecordScreen_c
l94:
  ; 269 printCenter(c, a, buf, 1);
  lda showRecordScreen_c
  sta printCenter_1
  mov h, b
  mov l, c
  shld printCenter_2
  lxi h, showRecordScreen_buf
  shld printCenter_3
  mvi a, 1
  call printCenter
  ; 271 printCenter(c, a + 5, h->name, 4);
  lda showRecordScreen_c
  sta printCenter_1
  ; Сложение с BC
  lxi h, 5
  dad b
  shld printCenter_2
  lhld showRecordScreen_h
  shld printCenter_3
  mvi a, 4
  call printCenter
  ; 273 i2s(buf+1, h->score);
  lxi h, (showRecordScreen_buf)+(1)
  shld i2s_1
  ; Сложение
  lhld showRecordScreen_h
  lxi d, 14
  dad d
  mov e, m
  inx h
  mov d, m
  xchg
  call i2s
  ; 274 printCenter(c, a + 5*5, buf, 4);
  lda showRecordScreen_c
  sta printCenter_1
  ; Сложение с BC
  lxi h, 25
  dad b
  shld printCenter_2
  lxi h, showRecordScreen_buf
  shld printCenter_3
  mvi a, 4
  call printCenter
  ; 276 a += APOGEY_VIDEO_BPL*4;Сложение с BC
  lxi h, 376
  dad b
  mov b, h
  mov c, l
l92:
  lxi h, showRecordScreen_i
  inr m
  lhld showRecordScreen_h
  lxi d, 16
  dad d
  shld showRecordScreen_h
  jmp l90
l91:
  pop b
  ret
  ; --- updateTopScore -----------------------------------------------------------------
updateTopScore:
  lxi h, 52910
  shld drawNumber_1
  lhld ((hiScores)+(0))+(14)
  call drawNumber
  ; 285 drawChar(COORDS(1,  39), hiScores[0].name[0]);
  lxi h, 56478
  shld drawChar_1
  lda ((hiScores)+(0))+(0)
  call drawChar
  ; 286 drawChar(COORDS(4,  39), hiScores[0].name[1]);
  lxi h, 56481
  shld drawChar_1
  lda ((hiScores)+(0))+(1)
  call drawChar
  ; 287 drawChar(COORDS(7,  39), hiScores[0].name[2]);
  lxi h, 56484
  shld drawChar_1
  lda ((hiScores)+(0))+(2)
  call drawChar
  ; 288 drawChar(COORDS(10, 39), hiScores[0].name[3]);
  lxi h, 56487
  shld drawChar_1
  lda ((hiScores)+(0))+(3)
  call drawChar
  ; 289 drawChar(COORDS(12, 39), hiScores[0].name[4]);
  lxi h, 56489
  shld drawChar_1
  lda ((hiScores)+(0))+(4)
  call drawChar
  ; 290 drawChar(COORDS(14, 39), hiScores[0].name[5]);
  lxi h, 56491
  shld drawChar_1
  lda ((hiScores)+(0))+(5)
  jmp drawChar
initGameScreen:
  push b
  ; 296 apogeyScreen3c();
  call apogeyScreen3c
  ; 298 fillScreen(gameScreen);
  lxi h, gameScreen
  call fillScreen
  ; 300 for(y=0; y<9; y++)
  mvi b, 0
l95:
  mvi a, 9
  cmp b
  jc l96
  jz l96
  ; 301 for(x=0; x<9; x++)
  mvi c, 0
l98:
  mvi a, 9
  cmp c
  jc l99
  jz l99
  ; 302 drawSprite(x, y, 0, emptySprite);
  mov a, c
  sta drawSprite_1
  mov a, b
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, emptySprite
  call drawSprite
l100:
  mov a, c
  inr c
  jmp l98
l99:
l97:
  mov a, b
  inr b
  jmp l95
l96:
  ; 304 updateTopScore();
  call updateTopScore
  pop b
  ret
  ; --- drawCell -----------------------------------------------------------------
drawCell:
  sta drawCell_2
  ; 33 game[x][y];<g>
  lhld drawCell_1
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  mov l, a
  mvi h, 0
  dad d
  mov a, m
  sta drawCell_g
  ; 34 if(g==0) drawSprite(x, y, 0, emptySprite);
  ora a
  jnz l101
  ; 34 drawSprite(x, y, 0, emptySprite);
  lda drawCell_1
  sta drawSprite_1
  lda drawCell_2
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, emptySprite
  call drawSprite
  jmp l102
l101:
  ; 35 drawSprite(x, y, g, ballSprite);
  lda drawCell_1
  sta drawSprite_1
  lda drawCell_2
  sta drawSprite_2
  lda drawCell_g
  sta drawSprite_3
  lxi h, ballSprite
  call drawSprite
l102:
  ret
  ; --- drawCursor -----------------------------------------------------------------
drawCursor:
  lhld cursorX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld cursorY
  mvi h, 0
  dad d
  mov a, m
  sta drawCursor_g
  ; 40 if(g==0) drawSprite(cursorX, cursorY, g, cursorSprite);
  ora a
  jnz l103
  ; 40 drawSprite(cursorX, cursorY, g, cursorSprite);
  lda cursorX
  sta drawSprite_1
  lda cursorY
  sta drawSprite_2
  lda drawCursor_g
  sta drawSprite_3
  lxi h, cursorSprite
  call drawSprite
  jmp l104
l103:
  ; 41 drawSprite(cursorX, cursorY, g, ballCursorSprite);
  lda cursorX
  sta drawSprite_1
  lda cursorY
  sta drawSprite_2
  lda drawCursor_g
  sta drawSprite_3
  lxi h, ballCursorSprite
  call drawSprite
l104:
  ret
  ; --- drawCells -----------------------------------------------------------------
drawCells:
  xra a
  sta drawCells_y
l105:
  lda drawCells_y
  cpi 9
  jnc l106
  ; 47 for(x=0; x<9; x++)
  xra a
  sta drawCells_x
l108:
  lda drawCells_x
  cpi 9
  jnc l109
  ; 48 drawCell(x,y);
  sta drawCell_1
  lda drawCells_y
  call drawCell
l110:
  lxi h, drawCells_x
  mov a, m
  inr m
  jmp l108
l109:
l107:
  lxi h, drawCells_y
  mov a, m
  inr m
  jmp l105
l106:
  ; 49 drawCursor();
  jmp drawCursor
clearCursor:
  lda cursorX
  sta drawCell_1
  lda cursorY
  jmp drawCell
delay:
  push b
  ; 58 for(x=0; x<700; x++);
  lxi b, 0
l111:
  ; Сложение с BC
  lxi h, 64835
  dad b
  jc l112
l113:
  mov h, b
  mov l, c
  inx b
  jmp l111
l112:
  pop b
  ret
  ; --- delayStep -----------------------------------------------------------------
delayStep:
  push b
  ; 63 for(x=0; x<2000; x++);
  lxi b, 0
l114:
  ; Сложение с BC
  lxi h, 63535
  dad b
  jc l115
l116:
  mov h, b
  mov l, c
  inx b
  jmp l114
l115:
  pop b
  ret
  ; --- clearLine -----------------------------------------------------------------
clearLine:
  push b
  sta clearLine_5
  ; 72 c =  game[x0][y0];
  lhld clearLine_1
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld clearLine_2
  mvi h, 0
  dad d
  mov b, m
  ; 74 for(o=0; o<4*16; o+=16) {
  xra a
  sta clearLine_o
l117:
  cpi 64
  jnc l118
  ; 75 for(x=x0, y=y0, i=n; i; --i, x=x+dx, y=y+dy)
  lda clearLine_1
  mov c, a
  lda clearLine_2
  sta clearLine_y
  lda clearLine_5
  sta clearLine_i
l120:
  ; convertToConfition
  lda clearLine_i
  ora a
  jz l121
  ; 76 drawSprite(x, y, c, killBallSprite+o);
  mov a, c
  sta drawSprite_1
  lda clearLine_y
  sta drawSprite_2
  mov a, b
  sta drawSprite_3
  ; Сложение
  lhld clearLine_o
  mvi h, 0
  lxi d, killBallSprite
  dad d
  call drawSprite
l122:
  lxi h, clearLine_i
  dcr m
  lda clearLine_3
  add c
  mov c, a
  lxi h, clearLine_4
  lda clearLine_y
  add m
  sta clearLine_y
  jmp l120
l121:
  ; 77 delay();
  call delay
l119:
  lda clearLine_o
  adi 16
  sta clearLine_o
  jmp l117
l118:
  ; 81 for(x=x0, y=y0, i=n; i; --i, x=x+dx, y=y+dy) {
  lda clearLine_1
  mov c, a
  lda clearLine_2
  sta clearLine_y
  lda clearLine_5
  sta clearLine_i
l123:
  ; convertToConfition
  lda clearLine_i
  ora a
  jz l124
  ; 82 game[x][y] = 0;
  mvi h, 0
  mov l, c
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld clearLine_y
  mvi h, 0
  dad d
  mvi m, 0
  ; 83 drawSprite(x, y, 0, emptySprite);
  mov a, c
  sta drawSprite_1
  lda clearLine_y
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, emptySprite
  call drawSprite
l125:
  lxi h, clearLine_i
  dcr m
  lda clearLine_3
  add c
  mov c, a
  lxi h, clearLine_4
  lda clearLine_y
  add m
  sta clearLine_y
  jmp l123
l124:
  pop b
  ret
  ; --- check -----------------------------------------------------------------
check:
  push b
  ; 93 0;<total>
  xra a
  sta check_total
  ; 96 for(y=0; y!=GAME_HEIGHT; ++y) {
  mov c, a
l126:
  mvi a, 9
  cmp c
  jz l127
  ; 97 for(p=&game[0][y], x=0; x<GAME_WIDTH;) {Сложение
  lhld (game)+(0)
  mov e, c
  mvi d, 0
  dad d
  shld check_p
  mov b, d
l129:
  mvi a, 9
  cmp b
  jc l130
  jz l130
  ; 98 prevx = x;
  mov a, b
  sta check_prevx
  ; 99 c = *p;
  lhld check_p
  mov a, m
  sta check_c
  ; 100 ++x;
  inr b
  ; 101 p += GAME_WIDTH;Сложение
  lxi d, 9
  dad d
  shld check_p
  ; 102 if(c==0) continue;
  ora a
  jz l131
l133:
  mov a, e
  cmp b
  jz l134
  mov a, m
  lxi h, check_c
  cmp m
  jnz l134
  ; 103 p+=GAME_WIDTH, ++x;Сложение
  lxi d, 9
  lhld check_p
  dad d
  shld check_p
  inr b
  jmp l133
l134:
  ; 104 n = x - prevx;Арифметика 1/4
  mov a, b
  lxi h, check_prevx
  sub m
  sta check_n
  ; 105 if(n<5) continue;
  cpi 5
  jc l131
  mov a, m
  sta clearLine_1
  mov a, c
  sta clearLine_2
  mvi a, 1
  sta clearLine_3
  xra a
  sta clearLine_4
  lda check_n
  call clearLine
  ; 107 total += n;
  lxi h, check_n
  lda check_total
  add m
  sta check_total
  ; 108 break;
  jmp l130
l131:
  jmp l129
l130:
l128:
  inr c
  jmp l126
l127:
  ; 111 for(x=0; x!=9; ++x) {
  mvi b, 0
l136:
  mvi a, 9
  cmp b
  jz l137
  ; 112 for(p=&game[x][0], y=0; y<5;) {
  mvi h, 0
  mov l, b
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение с константой 0
  mov e, m
  inx h
  mov d, m
  xchg
  shld check_p
  mvi c, 0
l139:
  mvi a, 5
  cmp c
  jc l140
  jz l140
  ; 113 c = *p;  
  lhld check_p
  mov a, m
  sta check_c
  ; 114 prevy = y;
  mov a, c
  sta check_prevy
  ; 115 ++y;
  inr c
  ; 116 ++p;
  inx h
  shld check_p
  ; 117 if(c==0) continue;
  lda check_c
  ora a
  jz l141
l143:
  mvi a, 9
  cmp c
  jz l144
  mov a, m
  lxi h, check_c
  cmp m
  jnz l144
  ; 118 ++p, ++y;
  lhld check_p
  inx h
  shld check_p
  inr c
  jmp l143
l144:
  ; 119 n = y - prevy;Арифметика 2/4
  mov a, c
  lxi h, check_prevy
  sub m
  sta check_n
  ; 120 if(n<5) continue;      
  cpi 5
  jc l141
  mov a, b
  sta clearLine_1
  mov a, m
  sta clearLine_2
  xra a
  sta clearLine_3
  inr a
  sta clearLine_4
  lda check_n
  call clearLine
  ; 122 total += n;
  lxi h, check_n
  lda check_total
  add m
  sta check_total
  ; 123 break;
  jmp l140
l141:
  jmp l139
l140:
l138:
  inr b
  jmp l136
l137:
  ; 126 for(y=0; y!=6; ++y) {
  mvi c, 0
l146:
  mvi a, 6
  cmp c
  jz l147
  ; 127 for(x=0; x!=6; ++x) {
  mvi b, 0
l149:
  mvi a, 6
  cmp b
  jz l150
  ; 128 p = &game[x][y];
  mvi h, 0
  mov l, b
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  xchg
  mov e, c
  mvi d, 0
  dad d
  shld check_p
  ; 129 c = *p;  
  mov a, m
  sta check_c
  ; 130 if(c==0) continue;
  ora a
  jz l151
  mov a, b
  sta check_prevx
  ; 132 prevy = y;
  mov a, c
  sta check_prevy
  ; 133 while(1) {
l153:
  ; 134 ++prevy;
  lxi h, check_prevy
  inr m
  ; 135 ++prevx;
  lxi h, check_prevx
  inr m
  ; 136 p += GAME_WIDTH+1;Сложение
  lxi d, 10
  lhld check_p
  dad d
  shld check_p
  ; 137 if(prevx==9) break;
  lda check_prevx
  cpi 9
  jz l154
  lda check_prevy
  cpi 9
  jz l154
  mov a, m
  lxi h, check_c
  cmp m
  jnz l154
  jmp l153
l154:
  ; 141 n = prevy-y;Арифметика 4/2
  lda check_prevy
  sub c
  sta check_n
  ; 142 if(n<5) continue;
  cpi 5
  jc l151
  mov a, b
  sta clearLine_1
  mov a, c
  sta clearLine_2
  mvi a, 1
  sta clearLine_3
  sta clearLine_4
  lda check_n
  call clearLine
  ; 144 total += n;
  lxi h, check_n
  lda check_total
  add m
  sta check_total
l151:
  inr b
  jmp l149
l150:
l148:
  inr c
  jmp l146
l147:
  ; 147 for(y=0; y!=6; ++y) {
  mvi c, 0
l159:
  mvi a, 6
  cmp c
  jz l160
  ; 148 for(x=4; x!=9; ++x) {
  mvi b, 4
l162:
  mvi a, 9
  cmp b
  jz l163
  ; 149 p = &game[x][y];
  mvi h, 0
  mov l, b
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  xchg
  mov e, c
  mvi d, 0
  dad d
  shld check_p
  ; 150 c = *p;  
  mov a, m
  sta check_c
  ; 151 if(c==0) continue;
  ora a
  jz l164
  mov a, b
  sta check_prevx
  ; 153 prevy = y;
  mov a, c
  sta check_prevy
  ; 154 while(1) {
l166:
  ; 155 ++prevy;
  lxi h, check_prevy
  inr m
  ; 156 --prevx;
  lxi h, check_prevx
  dcr m
  ; 157 p += 1-GAME_WIDTH;Сложение
  lxi d, 65528
  lhld check_p
  dad d
  shld check_p
  ; 158 if(prevx==-1) break;
  lda check_prevx
  cpi -1
  jz l167
  lda check_prevy
  cpi 9
  jz l167
  mov a, m
  lxi h, check_c
  cmp m
  jnz l167
  jmp l166
l167:
  ; 162 n = prevy-y;Арифметика 4/2
  lda check_prevy
  sub c
  sta check_n
  ; 163 if(n<5) continue;
  cpi 5
  jc l164
  mov a, b
  sta clearLine_1
  mov a, c
  sta clearLine_2
  mvi a, 255
  sta clearLine_3
  mvi a, 1
  sta clearLine_4
  lda check_n
  call clearLine
  ; 165 total += n;
  lxi h, check_n
  lda check_total
  add m
  sta check_total
l164:
  inr b
  jmp l162
l163:
l161:
  inr c
  jmp l159
l160:
  ; 168 if(total==0) return 0;
  lda check_total
  ora a
  jnz l172
  ; 168 return 0;
  xra a
  pop b
  ret
l172:
  ; 171 score += total*2;
  lhld check_total
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  xchg
  lhld score
  dad d
  shld score
  ; 172 drawScore(score);
  call drawScore
  ; 173 return 1;
  mvi a, 1
  pop b
  ret
  ; --- calcFreeCell -----------------------------------------------------------------
calcFreeCell:
  push b
  ; 182 for(c=0, p=&game[0][0], i=81; i; --i, ++p)
  xra a
  sta calcFreeCell_c
  ; Сложение с константой 0
  lhld (game)+(0)
  mov b, h
  mov c, l
  mvi a, 81
  sta calcFreeCell_i
l173:
  ; convertToConfition
  lda calcFreeCell_i
  ora a
  jz l174
  ; 183 if(*p==0)
  ldax b
  ora a
  jnz l176
  ; 184 c++;
  lxi h, calcFreeCell_c
  inr m
l176:
l175:
  lxi h, calcFreeCell_i
  dcr m
  inx b
  jmp l173
l174:
  ; 185 return c;
  lda calcFreeCell_c
  pop b
  ret
  ; --- newBall -----------------------------------------------------------------
newBall:
  push b
  sta newBall_1
  ; 198 c = calcFreeCell();
  call calcFreeCell
  sta newBall_c
  ; 199 if(c==0) { nx=-1; gameover=1; return; }
  ora a
  jnz l177
  ; 199 nx=-1; gameover=1; return; }
  mvi a, 255
  sta nx
  ; 199 gameover=1; return; }
  mvi a, 1
  sta gameOver
  ; 199 return; }
  pop b
  ret
l177:
  ; 202 c = rand()%c;
  call rand
  lxi h, newBall_c
  mov d, m
  call op_mod
  sta newBall_c
  ; 205 for(p=&game[0][0], i=81; i; --i, ++p)Сложение с константой 0
  lhld (game)+(0)
  mov b, h
  mov c, l
  mvi a, 81
  sta newBall_i
l178:
  ; convertToConfition
  lda newBall_i
  ora a
  jz l179
  ; 206 if(*p==0) {
  ldax b
  ora a
  jnz l181
  ; 207 if(c==0) break;
  lda newBall_c
  ora a
  jz l179
  lxi h, newBall_c
  dcr m
l181:
l180:
  lxi h, newBall_i
  dcr m
  inx b
  jmp l178
l179:
  ; 212 nx = (81-i)/9, ny = op_div_mod;Арифметика 3/4
  lxi h, newBall_i
  mvi a, 81
  sub m
  mvi d, 9
  call op_div
  sta nx
  lda op_div_mod
  sta ny
  ; 215 game[nx][ny] = color;
  lhld nx
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  mov l, a
  mvi h, 0
  dad d
  lda newBall_1
  mov m, a
  pop b
  ret
  ; --- randNewBall -----------------------------------------------------------------
randNewBall:
  call rand
  mvi d, 6
  call op_mod
  inr a
  sta newBall1
  ; 223 newBall2 = rand()%6+1;
  call rand
  mvi d, 6
  call op_mod
  inr a
  sta newBall2
  ; 224 newBall3 = rand()%6+1;
  call rand
  mvi d, 6
  call op_mod
  inr a
  sta newBall3
  ret
  ; --- redrawNewBalls1 -----------------------------------------------------------------
redrawNewBalls1:
  lda showHelp
  ora a
  jz l183
  ; 230 redrawNewBalls(newBall1, newBall2, newBall3);
  lda newBall1
  sta redrawNewBalls_1
  lda newBall2
  sta redrawNewBalls_2
  lda newBall3
  call redrawNewBalls
l183:
  ret
  ; --- gameStep -----------------------------------------------------------------
gameStep:
  call check
  ; convertToConfition
  ora a
  jnz l184
  ; 243 newBall(newBall1); nx1=nx; ny1=ny;
  lda newBall1
  call newBall
  ; 243 nx1=nx; ny1=ny;
  lda nx
  sta gameStep_nx1
  ; 243 ny1=ny;
  lda ny
  sta gameStep_ny1
  ; 244 newBall(newBall2); nx2=nx; ny2=ny;
  lda newBall2
  call newBall
  ; 244 nx2=nx; ny2=ny;
  lda nx
  sta gameStep_nx2
  ; 244 ny2=ny;
  lda ny
  sta gameStep_ny2
  ; 245 newBall(newBall3);
  lda newBall3
  call newBall
  ; 248 for(o=0; o<16*5; o+=16) {
  xra a
  sta gameStep_o
l185:
  cpi 80
  jnc l186
  ; 249 if(nx1!=-1) drawSprite(nx1, ny1, newBall1, newBallSprite + o);
  lda gameStep_nx1
  cpi -1
  jz l188
  ; 249 drawSprite(nx1, ny1, newBall1, newBallSprite + o);
  sta drawSprite_1
  lda gameStep_ny1
  sta drawSprite_2
  lda newBall1
  sta drawSprite_3
  ; Сложение
  lhld gameStep_o
  mvi h, 0
  lxi d, newBallSprite
  dad d
  call drawSprite
l188:
  ; 250 if(nx2!=-1) drawSprite(nx2, ny2, newBall2, newBallSprite + o);
  lda gameStep_nx2
  cpi -1
  jz l189
  ; 250 drawSprite(nx2, ny2, newBall2, newBallSprite + o);
  sta drawSprite_1
  lda gameStep_ny2
  sta drawSprite_2
  lda newBall2
  sta drawSprite_3
  ; Сложение
  lhld gameStep_o
  mvi h, 0
  lxi d, newBallSprite
  dad d
  call drawSprite
l189:
  ; 251 if(nx !=-1) drawSprite(nx,  ny,  newBall3, newBallSprite + o);
  lda nx
  cpi -1
  jz l190
  ; 251 drawSprite(nx,  ny,  newBall3, newBallSprite + o);
  sta drawSprite_1
  lda ny
  sta drawSprite_2
  lda newBall3
  sta drawSprite_3
  ; Сложение
  lhld gameStep_o
  mvi h, 0
  lxi d, newBallSprite
  dad d
  call drawSprite
l190:
  ; 252 delay();
  call delay
l187:
  lda gameStep_o
  adi 16
  sta gameStep_o
  jmp l185
l186:
  ; 256 randNewBall();
  call randNewBall
  ; 257 redrawNewBalls1();
  call redrawNewBalls1
  ; 259 if(!gameOver) {    convertToConfition
  lda gameOver
  ora a
  jnz l191
  ; 261 check();
  call check
  ; 264 if(calcFreeCell()==0) gameOver=1;
  call calcFreeCell
  ora a
  jnz l192
  ; 264 gameOver=1;
  mvi a, 1
  sta gameOver
l192:
l191:
l184:
  ; 268 drawCursor(); 
  jmp drawCursor
path_find:
  push b
  ; 286 path_c = game[selX][selY];  
  lhld selX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld selY
  mvi h, 0
  dad d
  mov a, m
  sta path_c
  ; 287 game[selX][selY] = 255;
  lhld selX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld selY
  mvi h, 0
  dad d
  mvi m, 255
  ; 288 game[cursorX][cursorY] = PATH_START_VAL;
  lhld cursorX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld cursorY
  mvi h, 0
  dad d
  mvi a, 10
  mov m, a
  ; 291 for(path_n = PATH_START_VAL; path_n != PATH_START_VAL+GAME_WIDTH*GAME_HEIGHT; ++path_n)
  sta path_n
l193:
  lda path_n
  cpi 91
  jz l194
  ; 292 for(p = &game[0][0], path_x=0; path_x != GAME_WIDTH; ++path_x)Сложение с константой 0
  lhld (game)+(0)
  mov b, h
  mov c, l
  xra a
  sta path_x
l196:
  lda path_x
  cpi 9
  jz l197
  ; 293 for(path_y=0; path_y != GAME_HEIGHT; ++path_y, ++p)
  xra a
  sta path_y
l199:
  lda path_y
  cpi 9
  jz l200
  ; 294 if(*p == path_n) {
  lxi h, path_n
  ldax b
  cmp m
  jnz l202
  ; 295 if(path_y != 0            ) { p-=1;           if(*p==255) { --path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=1;           }
  lda path_y
  ora a
  jz l203
  ; 295 p-=1;           if(*p==255) { --path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=1;           }Сложение BC с константой -1
  dcx b
  ; 295 if(*p==255) { --path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=1;           }
  ldax b
  cpi 255
  jnz l204
  ; 295 --path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=1;           }
  lxi h, path_y
  dcr m
  ; 295 path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=1;           }
  mov h, b
  mov l, c
  shld path_p
  ; 295 return 1; } else if(*p==0) *p=path_n+1; p+=1;           }
  mvi a, 1
  pop b
  ret
  jmp l205
l204:
  ; 295 if(*p==0) *p=path_n+1; p+=1;           }
  ldax b
  ora a
  jnz l206
  ; 295 *p=path_n+1; p+=1;           }
  lda path_n
  inr a
  stax b
l206:
l205:
  ; 295 p+=1;           }Сложение BC с константой 1
  inx b
l203:
  ; 296 if(path_y != GAME_HEIGHT-1) { p+=1;           if(*p==255) { ++path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=1;           }
  lda path_y
  cpi 8
  jz l207
  ; 296 p+=1;           if(*p==255) { ++path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=1;           }Сложение BC с константой 1
  inx b
  ; 296 if(*p==255) { ++path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=1;           }
  ldax b
  cpi 255
  jnz l208
  ; 296 ++path_y; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=1;           }
  lxi h, path_y
  inr m
  ; 296 path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=1;           }
  mov h, b
  mov l, c
  shld path_p
  ; 296 return 1; } else if(*p==0) *p=path_n+1; p-=1;           }
  mvi a, 1
  pop b
  ret
  jmp l209
l208:
  ; 296 if(*p==0) *p=path_n+1; p-=1;           }
  ldax b
  ora a
  jnz l210
  ; 296 *p=path_n+1; p-=1;           }
  lda path_n
  inr a
  stax b
l210:
l209:
  ; 296 p-=1;           }Сложение BC с константой -1
  dcx b
l207:
  ; 297 if(path_x != 0            ) { p-=GAME_HEIGHT; if(*p==255) { --path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }
  lda path_x
  ora a
  jz l211
  ; 297 p-=GAME_HEIGHT; if(*p==255) { --path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }Сложение с BC
  lxi h, 65527
  dad b
  mov b, h
  mov c, l
  ; 297 if(*p==255) { --path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }
  ldax b
  cpi 255
  jnz l212
  ; 297 --path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }
  lxi h, path_x
  dcr m
  ; 297 path_p=p; return 1; } else if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }
  mov h, b
  mov l, c
  shld path_p
  ; 297 return 1; } else if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }
  mvi a, 1
  pop b
  ret
  jmp l213
l212:
  ; 297 if(*p==0) *p=path_n+1; p+=GAME_HEIGHT; }
  ldax b
  ora a
  jnz l214
  ; 297 *p=path_n+1; p+=GAME_HEIGHT; }
  lda path_n
  inr a
  stax b
l214:
l213:
  ; 297 p+=GAME_HEIGHT; }Сложение с BC
  lxi h, 9
  dad b
  mov b, h
  mov c, l
l211:
  ; 298 if(path_x != GAME_WIDTH -1) { p+=GAME_HEIGHT; if(*p==255) { ++path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }
  lda path_x
  cpi 8
  jz l215
  ; 298 p+=GAME_HEIGHT; if(*p==255) { ++path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }Сложение с BC
  lxi h, 9
  dad b
  mov b, h
  mov c, l
  ; 298 if(*p==255) { ++path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }
  ldax b
  cpi 255
  jnz l216
  ; 298 ++path_x; path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }
  lxi h, path_x
  inr m
  ; 298 path_p=p; return 1; } else if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }
  mov h, b
  mov l, c
  shld path_p
  ; 298 return 1; } else if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }
  mvi a, 1
  pop b
  ret
  jmp l217
l216:
  ; 298 if(*p==0) *p=path_n+1; p-=GAME_HEIGHT; }
  ldax b
  ora a
  jnz l218
  ; 298 *p=path_n+1; p-=GAME_HEIGHT; }
  lda path_n
  inr a
  stax b
l218:
l217:
  ; 298 p-=GAME_HEIGHT; }Сложение с BC
  lxi h, 65527
  dad b
  mov b, h
  mov c, l
l215:
l202:
l201:
  lxi h, path_y
  inr m
  inx b
  jmp l199
l200:
l198:
  lxi h, path_x
  inr m
  jmp l196
l197:
l195:
  lxi h, path_n
  inr m
  jmp l193
l194:
  ; 302 path_end();
  call path_end
  ; 303 game[selX][selY] = path_c;
  lhld selX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld selY
  mvi h, 0
  dad d
  lda path_c
  mov m, a
  ; 304 return 0;
  xra a
  pop b
  ret
  ; --- path_nextStep -----------------------------------------------------------------
path_nextStep:
  push b
  ; 311 path_p;<p>
  lhld path_p
  mov b, h
  mov c, l
  ; 312 if(path_y != 0            ) { p -= 1;           if(*p == path_n) { --path_y; --path_n; path_p=p; return 1; } p+=1;           }
  lda path_y
  ora a
  jz l219
  ; 312 p -= 1;           if(*p == path_n) { --path_y; --path_n; path_p=p; return 1; } p+=1;           }Сложение BC с константой -1
  dcx b
  ; 312 if(*p == path_n) { --path_y; --path_n; path_p=p; return 1; } p+=1;           }
  lxi h, path_n
  ldax b
  cmp m
  jnz l220
  ; 312 --path_y; --path_n; path_p=p; return 1; } p+=1;           }
  lxi h, path_y
  dcr m
  ; 312 --path_n; path_p=p; return 1; } p+=1;           }
  lxi h, path_n
  dcr m
  ; 312 path_p=p; return 1; } p+=1;           }
  mov h, b
  mov l, c
  shld path_p
  ; 312 return 1; } p+=1;           }
  mvi a, 1
  pop b
  ret
l220:
  ; 312 p+=1;           }Сложение BC с константой 1
  inx b
l219:
  ; 313 if(path_y != GAME_HEIGHT-1) { p += 1;           if(*p == path_n) { ++path_y; --path_n; path_p=p; return 2; } p-=1;           }
  lda path_y
  cpi 8
  jz l221
  ; 313 p += 1;           if(*p == path_n) { ++path_y; --path_n; path_p=p; return 2; } p-=1;           }Сложение BC с константой 1
  inx b
  ; 313 if(*p == path_n) { ++path_y; --path_n; path_p=p; return 2; } p-=1;           }
  lxi h, path_n
  ldax b
  cmp m
  jnz l222
  ; 313 ++path_y; --path_n; path_p=p; return 2; } p-=1;           }
  lxi h, path_y
  inr m
  ; 313 --path_n; path_p=p; return 2; } p-=1;           }
  lxi h, path_n
  dcr m
  ; 313 path_p=p; return 2; } p-=1;           }
  mov h, b
  mov l, c
  shld path_p
  ; 313 return 2; } p-=1;           }
  mvi a, 2
  pop b
  ret
l222:
  ; 313 p-=1;           }Сложение BC с константой -1
  dcx b
l221:
  ; 314 if(path_x != 0            ) { p -= GAME_HEIGHT; if(*p == path_n) { --path_x; --path_n; path_p=p; return 3; } p+=GAME_HEIGHT; }
  lda path_x
  ora a
  jz l223
  ; 314 p -= GAME_HEIGHT; if(*p == path_n) { --path_x; --path_n; path_p=p; return 3; } p+=GAME_HEIGHT; }Сложение с BC
  lxi h, 65527
  dad b
  mov b, h
  mov c, l
  ; 314 if(*p == path_n) { --path_x; --path_n; path_p=p; return 3; } p+=GAME_HEIGHT; }
  lxi h, path_n
  ldax b
  cmp m
  jnz l224
  ; 314 --path_x; --path_n; path_p=p; return 3; } p+=GAME_HEIGHT; }
  lxi h, path_x
  dcr m
  ; 314 --path_n; path_p=p; return 3; } p+=GAME_HEIGHT; }
  lxi h, path_n
  dcr m
  ; 314 path_p=p; return 3; } p+=GAME_HEIGHT; }
  mov h, b
  mov l, c
  shld path_p
  ; 314 return 3; } p+=GAME_HEIGHT; }
  mvi a, 3
  pop b
  ret
l224:
  ; 314 p+=GAME_HEIGHT; }Сложение с BC
  lxi h, 9
  dad b
  mov b, h
  mov c, l
l223:
  ; 315 if(path_x != GAME_WIDTH -1) { p += GAME_HEIGHT; if(*p == path_n) { ++path_x; --path_n; path_p=p; return 4; } p-=GAME_HEIGHT; }
  lda path_x
  cpi 8
  jz l225
  ; 315 p += GAME_HEIGHT; if(*p == path_n) { ++path_x; --path_n; path_p=p; return 4; } p-=GAME_HEIGHT; }Сложение с BC
  lxi h, 9
  dad b
  mov b, h
  mov c, l
  ; 315 if(*p == path_n) { ++path_x; --path_n; path_p=p; return 4; } p-=GAME_HEIGHT; }
  lxi h, path_n
  ldax b
  cmp m
  jnz l226
  ; 315 ++path_x; --path_n; path_p=p; return 4; } p-=GAME_HEIGHT; }
  lxi h, path_x
  inr m
  ; 315 --path_n; path_p=p; return 4; } p-=GAME_HEIGHT; }
  lxi h, path_n
  dcr m
  ; 315 path_p=p; return 4; } p-=GAME_HEIGHT; }
  mov h, b
  mov l, c
  shld path_p
  ; 315 return 4; } p-=GAME_HEIGHT; }
  mvi a, 4
  pop b
  ret
l226:
  ; 315 p-=GAME_HEIGHT; }Сложение с BC
  lxi h, 65527
  dad b
  mov b, h
  mov c, l
l225:
  ; 316 while(1);
l227:
  jmp l227
l228:
  pop b
  ret
  ; --- path_save -----------------------------------------------------------------
path_save:
  lhld path_p
  shld path_p1
  ; 323 path_x1 = path_x; 
  lda path_x
  sta path_x1
  ; 324 path_y1 = path_y;
  lda path_y
  sta path_y1
  ; 325 path_n1 = path_n;
  lda path_n
  sta path_n1
  ret
  ; --- path_load -----------------------------------------------------------------
path_load:
  lhld path_p1
  shld path_p
  ; 332 path_x = path_x1;
  lda path_x1
  sta path_x
  ; 333 path_y = path_y1;
  lda path_y1
  sta path_y
  ; 334 path_n = path_n1;
  lda path_n1
  sta path_n
  ret
  ; --- path_end -----------------------------------------------------------------
path_end:
  push b
  ; 342 for(p=&game[0][0]; p != &game[8][8]+1; ++p)Сложение с константой 0
  lhld (game)+(0)
  mov b, h
  mov c, l
l229:
  ; Сложение
  lhld (game)+(16)
  lxi d, 8
  dad d
  ; Сложение с константой 1
  inx h
  mov d, b
  mov e, c
  call op_cmp16
  jz l230
  ; 343 if(*p >= PATH_START_VAL)
  ldax b
  cpi 10
  jc l232
  ; 344 *p=0;
  xra a
  stax b
l232:
l231:
  inx b
  jmp l229
l230:
  pop b
  ret
  ; --- move -----------------------------------------------------------------
move:
  call path_find
  ; convertToConfition
  ora a
  jnz l233
  ; 353 if(playSound) soundBadMove();convertToConfition
  lda playSound
  ora a
  cnz soundBadMove
  ret
l233:
  ; 357 if(showPath) {convertToConfition
  lda showPath
  ora a
  jz l235
  ; 359 path_save();
  call path_save
  ; 360 while(1) {
l236:
  ; 361 switch(path_nextStep()) {
  call path_nextStep
  cpi 1
  jz l239
  cpi 2
  jz l240
  cpi 3
  jz l241
  cpi 4
  jz l242
  jmp l238
l239:
  ; 362 drawSprite(path_x, path_y+1, 0, sprite_stepUp   ); break;
  lda path_x
  sta drawSprite_1
  lda path_y
  inr a
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, sprite_stepUp
  call drawSprite
  ; 362 break;
  jmp l238
l240:
  ; 363 drawSprite(path_x, path_y-1, 0, sprite_stepDown ); break;
  lda path_x
  sta drawSprite_1
  lda path_y
  dcr a
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, sprite_stepDown
  call drawSprite
  ; 363 break;
  jmp l238
l241:
  ; 364 drawSprite(path_x+1, path_y, 0, sprite_stepLeft ); break;
  lda path_x
  inr a
  sta drawSprite_1
  lda path_y
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, sprite_stepLeft
  call drawSprite
  ; 364 break;
  jmp l238
l242:
  ; 365 drawSprite(path_x-1, path_y, 0, sprite_stepRight); break;
  lda path_x
  dcr a
  sta drawSprite_1
  lda path_y
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, sprite_stepRight
  call drawSprite
  ; 365 break;
l238:
  ; 367 drawSprite(path_x, path_y, path_c, ballSprite);
  lda path_x
  sta drawSprite_1
  lda path_y
  sta drawSprite_2
  lda path_c
  sta drawSprite_3
  lxi h, ballSprite
  call drawSprite
  ; 368 if(path_n==LAST_STEP) break;
  lda path_n
  cpi 9
  jz l237
  lda playSound
  ora a
  cnz soundJumpSel
  call delayStep
  jmp l236
l237:
  ; 374 path_load();
  call path_load
  ; 375 while(1) {
l245:
  ; 376 drawSprite(path_x, path_y, 0, emptySprite);
  lda path_x
  sta drawSprite_1
  lda path_y
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, emptySprite
  call drawSprite
  ; 377 path_nextStep();
  call path_nextStep
  ; 378 if(path_n==LAST_STEP) break;
  lda path_n
  cpi 9
  jz l246
  jmp l245
l246:
  jmp l248
l235:
  ; 381 drawSprite(selX, selY, 0, emptySprite);
  lda selX
  sta drawSprite_1
  lda selY
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, emptySprite
  call drawSprite
l248:
  ; 385 game[cursorX][cursorY] = path_c;
  lhld cursorX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld cursorY
  mvi h, 0
  dad d
  lda path_c
  mov m, a
  ; 388 selX = -1;
  mvi a, 255
  sta selX
  ; 391 path_end();
  call path_end
  ; 394 gameStep();
  jmp gameStep
startGame:
  push b
  ; 403 selX = -1;
  mvi a, 255
  sta selX
  ; 404 score = 0;
  lxi h, 0
  shld score
  ; 405 gameOver = 0;
  xra a
  sta gameOver
  ; 406 drawScore(0);
  call drawScore
  ; 408 for(y=0; y!=GAME_HEIGHT; ++y)
  mvi c, 0
l249:
  mvi a, 9
  cmp c
  jz l250
  ; 409 for(x=0; x!=GAME_WIDTH; ++x) {
  mvi b, 0
l252:
  mvi a, 9
  cmp b
  jz l253
  ; 410 game[x][y] = 0;
  mvi h, 0
  mov l, b
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  xchg
  mov e, c
  mvi d, 0
  dad d
  mvi m, 0
  ; 411 drawSprite(x,y,0,emptySprite);
  mov a, b
  sta drawSprite_1
  mov a, c
  sta drawSprite_2
  xra a
  sta drawSprite_3
  lxi h, emptySprite
  call drawSprite
l254:
  inr b
  jmp l252
l253:
l251:
  inr c
  jmp l249
l250:
  ; 414 randNewBall();
  call randNewBall
  ; 415 gameStep();
  call gameStep
  pop b
  ret
  ; --- recordAnimation -----------------------------------------------------------------
recordAnimation:
  lhld score
  xchg
  lhld ((hiScores)+(128))+(14)
  call op_cmp16
  jc l255
  ; 430 return;
  ret
l255:
  ; 432 hiScores[8].score = score;
  lhld score
  shld ((hiScores)+(128))+(14)
  ; 434 memset(hiScores[8].name, 0, 6);
  lxi h, (hiScores)+(128)
  shld memset_1
  xra a
  sta memset_2
  lxi h, 6
  call memset
  ; 435 i = 0;
  xra a
  sta recordAnimation_i
  ; 436 while(1) {
l256:
  ; 437 showRecordScreen(8);
  mvi a, 8
  call showRecordScreen
  ; 438 c = getch();
  call 63491
  sta recordAnimation_c
  ; 439 if(c==13) break;  
  cpi 13
  jz l257
  cpi 127
  jnz l259
  ; 441 if(i==0) continue;
  lda recordAnimation_i
  ora a
  jz l256
  lxi h, recordAnimation_i
  dcr m
  ; 443 hiScores[8].name[i] = 0;Сложение
  lhld recordAnimation_i
  mvi h, 0
  lxi d, (hiScores)+(128)
  dad d
  mvi m, 0
  ; 444 continue;
  jmp l256
l259:
  ; 446 if(c>=32 && c<127) {
  lda recordAnimation_c
  cpi 32
  jc l261
  cpi 127
  jnc l261
  ; 447 if(i==6) continue;
  lda recordAnimation_i
  cpi 6
  jz l256
  mov l, a
  mvi h, 0
  lxi d, (hiScores)+(128)
  dad d
  lda recordAnimation_c
  mov m, a
  ; 449 hiScores[8].name[i+1] = 0;
  lda recordAnimation_i
  inr a
  ; Сложение
  mvi h, 0
  mov l, a
  lxi d, (hiScores)+(128)
  dad d
  mvi m, 0
  ; 450 ++i;   
  lxi h, recordAnimation_i
  inr m
l261:
  jmp l256
l257:
  ; 453 c = 8;
  mvi a, 8
  sta recordAnimation_c
  ; 454 p = hiScores+8;
  lxi h, (hiScores)+(128)
  shld recordAnimation_p
  ; 455 while(1) {
l263:
  ; 456 showRecordScreen(c);
  lda recordAnimation_c
  call showRecordScreen
  ; 458 if(c==0) {
  lda recordAnimation_c
  ora a
  jnz l265
  ; 459 updateTopScore();      
  call updateTopScore
  ; 460 break;
  jmp l264
l265:
  ; 463 if(p->score >= p[-1].score) break;Сложение
  lhld recordAnimation_p
  lxi d, 14
  dad d
  ; Сложение
  push h
  lhld recordAnimation_p
  lxi d, 65520
  dad d
  ; Сложение
  lxi d, 14
  dad d
  mov e, m
  inx h
  mov d, m
  pop h
  mov a, m
  inx h
  mov h, m
  mov l, a
  call op_cmp16
  jc l264
  lhld recordAnimation_p
  push h
  lxi d, 65520
  dad d
  shld recordAnimation_p
  pop h
  ; 466 memcpy(&tmp, p+1, sizeof(tmp));
  lxi h, recordAnimation_tmp
  shld memcpy_1
  ; Сложение
  lhld recordAnimation_p
  lxi d, 16
  dad d
  shld memcpy_2
  lxi h, 16
  call memcpy
  ; 467 memcpy(p+1, p, sizeof(tmp));Сложение
  lhld recordAnimation_p
  lxi d, 16
  dad d
  shld memcpy_1
  lhld recordAnimation_p
  shld memcpy_2
  lxi h, 16
  call memcpy
  ; 468 memcpy(p, &tmp, sizeof(tmp));
  lhld recordAnimation_p
  shld memcpy_1
  lxi h, recordAnimation_tmp
  shld memcpy_2
  lxi h, 16
  call memcpy
  ; 469 c--;    
  lxi h, recordAnimation_c
  dcr m
  ; 470 delayHS(8);
  mvi a, 8
  call delayHS
  jmp l263
l264:
  ; 473 getch();
  jmp 63491
main:
  xra a
  sta main_selAnimationT
  ; 479 0, keybTimeout=0; <selAnimationTT>
  lxi h, 0
  shld main_selAnimationTT
  ; 479 0; <keybTimeout>
  shld main_keybTimeout
  ; 481 demo();
  call demo
  ; 484 initGameScreen();
  call initGameScreen
  ; 490 startGame();
  call startGame
  ; 492 while(1) {
l267:
  ; 493 rand();
  call rand
  ; 495 if(selX!=-1) {
  lda selX
  cpi -1
  jz l269
  ; 496 selAnimationTT++;
  lhld main_selAnimationTT
  mov d, h
  mov e, l
  inx h
  shld main_selAnimationTT
  xchg
  ; 497 if(selAnimationTT==500) {Сложение
  lhld main_selAnimationTT
  lxi d, 65036
  dad d
  mov a, l
  ora h
  jnz l270
  ; 498 selAnimationTT=0;
  lxi h, 0
  shld main_selAnimationTT
  ; 499 drawSprite(selX, selY, game[selX][selY], ((selX==cursorX && selY==cursorY) ? selCursorAnimation : selAnimation)[selAnimationT]);
  lda selX
  sta drawSprite_1
  lda selY
  sta drawSprite_2
  lhld selX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld selY
  mvi h, 0
  dad d
  mov a, m
  sta drawSprite_3
  lxi h, cursorX
  lda selX
  cmp m
  jnz l271
  lxi h, cursorY
  lda selY
  cmp m
  jnz l271
  mvi a, 1
  jmp l272
l271:
  xra a
l272:
  ora a
  jz l273
  lxi h, selCursorAnimation
  jmp l274
l273:
  lxi h, selAnimation
l274:
  push h
  lhld main_selAnimationT
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  pop d
  dad d
  mov e, m
  inx h
  mov d, m
  xchg
  call drawSprite
  ; 500 selAnimationT++;
  lxi h, main_selAnimationT
  inr m
  ; 501 if(selAnimationT>=4) selAnimationT=0; else
  lda main_selAnimationT
  cpi 4
  jc l275
  ; 501 selAnimationT=0; else
  xra a
  sta main_selAnimationT
  jmp l276
l275:
  ; 502 if(playSound && selAnimationT==2) soundJumpSel();convertToConfition
  lda playSound
  ora a
  jz l277
  lda main_selAnimationT
  cpi 2
  cz soundJumpSel
l277:
l276:
l270:
l269:
  ; 506 if(keybTimeout) {convertToConfition
  lhld main_keybTimeout
  mov a, l
  ora h
  jz l278
  ; 507 keybTimeout--;
  mov d, h
  mov e, l
  dcx h
  shld main_keybTimeout
  xchg
  ; 508 continue;
  jmp l267
l278:
  ; 511 c1 = bioskey();
  call 63515
  sta main_c1
  ; 512 if(c == c1) continue;
  lxi h, main_c1
  lda main_c
  cmp m
  jz l267
  mov a, m
  sta main_c
  ; 515 switch(c) {
  cpi 49
  jz l281
  cpi 50
  jz l282
  cpi 51
  jz l283
  cpi 52
  jz l286
  cpi 53
  jz l287
  cpi 255
  jz l288
  cpi 25
  jz l289
  cpi 26
  jz l292
  cpi 8
  jz l295
  cpi 24
  jz l298
  cpi 32
  jz l301
  jmp l280
l281:
  ; 516 showPath  = !showPath;  drawOnOff(0, showPath);  break;convertToConfition
  lda showPath
  ora a
  sui 1
  sbb a
  sta showPath
  ; 516 drawOnOff(0, showPath);  break;
  xra a
  sta drawOnOff_1
  lda showPath
  call drawOnOff
  ; 516 break;
  jmp l280
l282:
  ; 517 playSound = !playSound; drawOnOff(1, playSound); break;convertToConfition
  lda playSound
  ora a
  sui 1
  sbb a
  sta playSound
  ; 517 drawOnOff(1, playSound); break;
  mvi a, 1
  sta drawOnOff_1
  lda playSound
  call drawOnOff
  ; 517 break;
  jmp l280
l283:
  ; 518 showHelp  = !showHelp;  drawOnOff(2, showHelp);  if(showHelp) redrawNewBalls1(); else redrawNewBalls(7,7,7); break;convertToConfition
  lda showHelp
  ora a
  sui 1
  sbb a
  sta showHelp
  ; 518 drawOnOff(2, showHelp);  if(showHelp) redrawNewBalls1(); else redrawNewBalls(7,7,7); break;
  mvi a, 2
  sta drawOnOff_1
  lda showHelp
  call drawOnOff
  ; 518 if(showHelp) redrawNewBalls1(); else redrawNewBalls(7,7,7); break;convertToConfition
  lda showHelp
  ora a
  jz l284
  ; 518 redrawNewBalls1(); else redrawNewBalls(7,7,7); break;
  call redrawNewBalls1
  jmp l285
l284:
  ; 518 redrawNewBalls(7,7,7); break;
  mvi a, 7
  sta redrawNewBalls_1
  sta redrawNewBalls_2
  call redrawNewBalls
l285:
  ; 518 break;
  jmp l280
l286:
  ; 520 showRecordScreen(-1);
  mvi a, 255
  call showRecordScreen
  ; 521 getch();
  call 63491
  ; 522 drawCells();
  call drawCells
  ; 523 break;
  jmp l280
l287:
  ; 524 startGame(); break;
  call startGame
  ; 524 break;
  jmp l280
l288:
  ; 535 continue;
  jmp l267
l289:
  ; 536 clearCursor(); if(cursorY==0) cursorY=8; else cursorY--; drawCursor(); break;
  call clearCursor
  ; 536 if(cursorY==0) cursorY=8; else cursorY--; drawCursor(); break;
  lda cursorY
  ora a
  jnz l290
  ; 536 cursorY=8; else cursorY--; drawCursor(); break;
  mvi a, 8
  sta cursorY
  jmp l291
l290:
  ; 536 cursorY--; drawCursor(); break;
  lxi h, cursorY
  dcr m
l291:
  ; 536 drawCursor(); break;
  call drawCursor
  ; 536 break;
  jmp l280
l292:
  ; 537 clearCursor(); if(cursorY==8) cursorY=0; else cursorY++; drawCursor(); break;
  call clearCursor
  ; 537 if(cursorY==8) cursorY=0; else cursorY++; drawCursor(); break;
  lda cursorY
  cpi 8
  jnz l293
  ; 537 cursorY=0; else cursorY++; drawCursor(); break;
  xra a
  sta cursorY
  jmp l294
l293:
  ; 537 cursorY++; drawCursor(); break;
  lxi h, cursorY
  inr m
l294:
  ; 537 drawCursor(); break;
  call drawCursor
  ; 537 break;
  jmp l280
l295:
  ; 538 clearCursor(); if(cursorX==0) cursorX=8; else cursorX--; drawCursor(); break;
  call clearCursor
  ; 538 if(cursorX==0) cursorX=8; else cursorX--; drawCursor(); break;
  lda cursorX
  ora a
  jnz l296
  ; 538 cursorX=8; else cursorX--; drawCursor(); break;
  mvi a, 8
  sta cursorX
  jmp l297
l296:
  ; 538 cursorX--; drawCursor(); break;
  lxi h, cursorX
  dcr m
l297:
  ; 538 drawCursor(); break;
  call drawCursor
  ; 538 break;
  jmp l280
l298:
  ; 539 clearCursor(); if(cursorX==8) cursorX=0; else cursorX++; drawCursor(); break;
  call clearCursor
  ; 539 if(cursorX==8) cursorX=0; else cursorX++; drawCursor(); break;
  lda cursorX
  cpi 8
  jnz l299
  ; 539 cursorX=0; else cursorX++; drawCursor(); break;
  xra a
  sta cursorX
  jmp l300
l299:
  ; 539 cursorX++; drawCursor(); break;
  lxi h, cursorX
  inr m
l300:
  ; 539 drawCursor(); break;
  call drawCursor
  ; 539 break;
  jmp l280
l301:
  ; 541 if(game[cursorX][cursorY]) { if(selX!=-1) drawCell(selX, selY); selX=cursorX, selY=cursorY; break; }
  lhld cursorX
  mvi h, 0
  ; Умножение HL на 2
  dad h
  ; Сложение
  lxi d, game
  dad d
  ; Сложение
  mov e, m
  inx h
  mov d, m
  lhld cursorY
  mvi h, 0
  dad d
  ; convertToConfition
  xra a
  ora m
  jz l302
  ; 541 if(selX!=-1) drawCell(selX, selY); selX=cursorX, selY=cursorY; break; }
  lda selX
  cpi -1
  jz l303
  ; 541 drawCell(selX, selY); selX=cursorX, selY=cursorY; break; }
  sta drawCell_1
  lda selY
  call drawCell
l303:
  ; 541 selX=cursorX, selY=cursorY; break; }
  lda cursorX
  sta selX
  lda cursorY
  sta selY
  ; 541 break; }
  jmp l280
l302:
  ; 542 if(selX==-1) break;
  lda selX
  cpi -1
  jz l280
  call move
  ; 544 if(gameOver) {convertToConfition
  lda gameOver
  ora a
  jz l305
  ; 545 recordAnimation();
  call recordAnimation
  ; 546 startGame();
  call startGame
l305:
  ; 548 break;        
l280:
  ; 553 keybTimeout=300;
  lxi h, 300
  shld main_keybTimeout
  jmp l267
l268:
  ret
  ; --- op_mul -----------------------------------------------------------------
op_mul:
  push b
  lxi h, 0
  mov e, d  ; de=d
  mov d, l  
  mvi c, 8
op_mul1:
  dad h
  add a
  jnc op_mul2
    dad d
op_mul2:
  dcr c
  jnz op_mul1
pop_bc_ret:
  pop b

  ret
  ; --- memcpy -----------------------------------------------------------------
memcpy:
  shld memcpy_3
  ; 2 asm {
    push b
    ; de = count
    xchg
    ; bc = from
    lhld memcpy_2
    mov c, l
    mov b, h
    ; hl = to
    lhld memcpy_1
memcpy_l1:
    ; if(cnt==0) return
    mov a, d
    ora e
    jz memcpy_l2
    ; *dest = *src
    ldax b
    mov m, a
    ; dest++, src++, cnt--
    inx h
    inx b
    dcx d
    ; loop
    jp memcpy_l1
memcpy_l2:
    pop b
  
  ret
  ; --- op_div16 -----------------------------------------------------------------
op_div16:
        PUSH B
        XCHG
        CALL _DIV0
        XCHG
        SHLD op_div16_mod
        XCHG
        POP B
        RET

_DIV0:
_DIV:	MOV A,H
	ORA L
	RZ
	LXI B,0000
	PUSH B
_DIV1:	MOV A,E
	SUB L
	MOV A,D
	SBB H
	JC _DIV2
	PUSH H
	DAD H
	JNC _DIV1
_DIV2:	LXI H,0000
_DIV3:	POP B
	MOV A,B
	ORA C
	RZ
	DAD H
	PUSH D
	MOV A,E
	SUB C
	MOV E,A
	MOV A,D
	SBB B
	MOV D,A
	JC _DIV4
	INX H
	POP B
	JMP _DIV3
_DIV4:	POP D
	JMP _DIV3  
  
  ret
  ; --- op_cmp16 -----------------------------------------------------------------
op_cmp16:
    mov a, h
    cmp d
    rnz
    mov a, l
    cmp e
    ret
  
  ret
  ; --- waitHorzSync -----------------------------------------------------------------
waitHorzSync:
    lxi h, 0EF01h
    mov a, m
waitHorzSync_1:
    mov a, m
    ani 20h
    jz waitHorzSync_1
  
  ret
  ; --- apogeyScreen3c -----------------------------------------------------------------
apogeyScreen3c:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 52789
  shld memset_1
  xra a
  sta memset_2
  lxi h, 4810
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 52788
  mvi a, 7
  sta apogeyScreen3c_i
l306:
  ; convertToConfition
  lda apogeyScreen3c_i
  ora a
  jz l307
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l308:
  lxi h, apogeyScreen3c_i
  dcr m
  jmp l306
l307:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57598
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 8; 
  lxi h, 52811
  shld apogeyVideoMem
  ; 11 apogeyVideoBpl = (BPL); 
  mvi a, 94
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 191
  ; 1 ((uchar*)0xEF00)
  mvi m, 51
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 53
  ; 1 ((uchar*)0xF000)
  mvi m, 206
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 201
  ; 1 ((uchar*)0xF000)
  mvi m, 82
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 
 ei 
  ; 13 asm { di } 
  pop b
  ret
  ; --- rand -----------------------------------------------------------------
rand:
    LDA rand_seed
    mov b,a
    add a
    add a
    add b
    inr a
    sta rand_seed
  
  ret
  ; --- op_mod -----------------------------------------------------------------
op_mod:
    PUSH B
    MOV E, A
    LXI H, 8
    MVI C, 0
op_mod_1:
    MOV A,E
    RAL
    MOV E,A
    MOV A,C
    RAL
    SUB D
    JNC op_mod_2
    ADD D
op_mod_2:
    MOV C,A ; Остаток в С
    CMC
    MOV A,H
    RAL
    MOV H,A ; Частное в Н
    DCR L
    JNZ op_mod_1
    MOV A, C
    POP B
  
  ret
  ; --- op_div -----------------------------------------------------------------
op_div:
    push b
    mov e, a
    LXI H,0008h
    MVI C,00
op_div_1:
    MOV A,E
    RAL
    MOV E,A
    MOV A,C
    RAL
    SUB D
    JNC op_div_2
    ADD D
op_div_2:
    MOV C,A ; Остаток в С
    CMC
    MOV A,H
    RAL
    MOV H,A ; Частное в Н
    DCR L
    JNZ op_div_1
    MOV A, C
    STA op_div_mod
    MOV A, H
    pop b
  
  ret
  ; --- memset -----------------------------------------------------------------
memset:
  shld memset_3
  ; 2 asm {
    push b
    lda memset_2
    xchg
    lhld memset_1
    xchg
    lxi b, -1    
memset_l1:
    dad b
    jnc memset_l2
    stax d
    inx d
    jp memset_l1
memset_l2:
    pop b
  
  ret
apogeyVideoMem:
 .dw 58050

apogeyVideoBpl:
 .db 78

colors:
 .db 129
 .db 132
 .db 133
 .db 136
 .db 137
 .db 140
 .db 128
 .db 141

drawChar_1:
 .ds 2
drawChar_2:
 .ds 1
drawText_1:
 .ds 2
drawText_2:
 .ds 2
drawText_c:
 .ds 1
drawSprite0_1:
 .ds 2
drawSprite0_2:
 .ds 1
drawSprite0_3:
 .ds 2
drawSprite_1:
 .ds 1
drawSprite_2:
 .ds 1
drawSprite_3:
 .ds 1
drawSprite_4:
 .ds 2
fillScreen_1:
 .ds 2
fillScreen_i:
 .ds 1
fillScreen_d:
 .ds 2
i2s_1:
 .ds 2
i2s_2:
 .ds 2
i2s_i:
 .ds 1
drawNumber_1:
 .ds 2
drawNumber_2:
 .ds 2
drawNumber_buf:
 .ds 16
playerSpriteTop:
 .ds 1
kingSprite:
 .ds 1
superDraw_1:
 .ds 2
superDraw_2:
 .ds 1
superDraw_3:
 .ds 1
superDraw_4:
 .ds 1
superDraw_5:
 .ds 2
superDraw_6:
 .ds 1
superDraw_7:
 .ds 1
drawScore_1:
 .ds 2
drawScore_n:
 .ds 1
redrawNewBall_1:
 .ds 2
redrawNewBall_2:
 .ds 1
redrawNewBalls_1:
 .ds 1
redrawNewBalls_2:
 .ds 1
redrawNewBalls_3:
 .ds 1
drawOnOff_1:
 .ds 1
drawOnOff_2:
 .ds 1
drawOnOff_i:
 .ds 1
drawOnOff_addr:
 .ds 2
delayX_1:
 .ds 2
soundBadMove_i:
 .ds 1
delayHS_1:
 .ds 1
demo_p:
 .ds 2
demo_x:
 .ds 2
demo_s:
 .ds 2
demo_d:
 .ds 1
printCenter_1:
 .ds 1
printCenter_2:
 .ds 2
printCenter_3:
 .ds 2
printCenter_4:
 .ds 1
printCenter_c:
 .ds 1
showRecordScreen_1:
 .ds 1
showRecordScreen_h:
 .ds 2
showRecordScreen_c:
 .ds 1
showRecordScreen_i:
 .ds 1
showRecordScreen_x:
 .ds 1
showRecordScreen_y:
 .ds 1
showRecordScreen_buf:
 .ds 7
showRecordScreen_text:
 .ds 2
topScoreNamePos:
 .db 3
 .db 3
 .db 3
 .db 2
 .db 2

game:
 .dw $+18
 .dw $+25
 .dw $+32
 .dw $+39
 .dw $+46
 .dw $+53
 .dw $+60
 .dw $+67
 .dw $+74
 .ds 81
gameOver:
 .db 0

cursorX:
 .db 4

cursorY:
 .db 4

selX:
 .db 255

selY:
 .ds 1
score:
 .dw 0

newBall1:
 .ds 1
newBall2:
 .ds 1
newBall3:
 .ds 1
showPath:
 .db 1

playSound:
 .db 1

showHelp:
 .db 1

nx:
 .ds 1
ny:
 .ds 1
hiScores:
 .db "VINXRU",0,0,0,0,0,0,0,0
 .dw 300
 .db "ELTARO",0,0,0,0,0,0,0,0
 .dw 260
 .db "ERR404",0,0,0,0,0,0,0,0
 .dw 230
 .db "SYSCAT",0,0,0,0,0,0,0,0
 .dw 200
 .db "MICK",0,0,0,0,0,0,0,0,0,0
 .dw 160
 .db "SCL MC",0,0,0,0,0,0,0,0
 .dw 130
 .db "SVOFSK",0,0,0,0,0,0,0,0
 .dw 100
 .db "TITUS",0,0,0,0,0,0,0,0,0
 .dw 90
 .db "B2M",0,0,0,0,0,0,0,0,0,0,0
 .dw 60

drawCell_1:
 .ds 1
drawCell_2:
 .ds 1
drawCell_g:
 .ds 1
drawCursor_g:
 .ds 1
drawCells_x:
 .ds 1
drawCells_y:
 .ds 1
clearLine_1:
 .ds 1
clearLine_2:
 .ds 1
clearLine_3:
 .ds 1
clearLine_4:
 .ds 1
clearLine_5:
 .ds 1
clearLine_y:
 .ds 1
clearLine_o:
 .ds 1
clearLine_i:
 .ds 1
check_prevx:
 .ds 1
check_prevy:
 .ds 1
check_c:
 .ds 1
check_n:
 .ds 1
check_total:
 .ds 1
check_p:
 .ds 2
calcFreeCell_c:
 .ds 1
calcFreeCell_i:
 .ds 1
newBall_1:
 .ds 1
newBall_i:
 .ds 1
newBall_c:
 .ds 1
gameStep_nx1:
 .ds 1
gameStep_ny1:
 .ds 1
gameStep_nx2:
 .ds 1
gameStep_ny2:
 .ds 1
gameStep_o:
 .ds 1
path_c:
 .ds 1
path_p:
 .dw $+2
 .ds 1
path_n:
 .ds 1
path_x:
 .ds 1
path_y:
 .ds 1
path_p1:
 .dw $+2
 .ds 1
path_n1:
 .ds 1
path_x1:
 .ds 1
path_y1:
 .ds 1
selAnimation:
 .dw (ballSprite) & 65535
 .dw (selAnimation1) & 65535
 .dw (selAnimation2) & 65535
 .dw (selAnimation1) & 65535

selCursorAnimation:
 .dw (ballCursorSprite) & 65535
 .dw (selCursorAnimation1) & 65535
 .dw (selCursorAnimation2) & 65535
 .dw (selCursorAnimation1) & 65535

recordAnimation_c:
 .ds 1
recordAnimation_i:
 .ds 1
recordAnimation_p:
 .ds 2
recordAnimation_tmp:
 .ds 16
main_c:
 .ds 1
main_c1:
 .ds 1
main_selAnimationT:
 .ds 1
main_selAnimationTT:
 .ds 2
main_keybTimeout:
 .ds 2
newBallSprite:
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 32
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 32
 .db 8
 .db 0
 .db 0
 .db 4
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 52
 .db 25
 .db 0
 .db 0
 .db 38
 .db 10
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 62
 .db 43
 .db 0
 .db 0
 .db 55
 .db 28
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0

ballSprite:
 .db 0
 .db 48
 .db 24
 .db 0
 .db 52
 .db 63
 .db 31
 .db 25
 .db 38
 .db 15
 .db 33
 .db 11
 .db 0
 .db 6
 .db 3
 .db 0

selAnimation1:
 .db 0
 .db 0
 .db 0
 .db 0
 .db 32
 .db 62
 .db 59
 .db 8
 .db 54
 .db 63
 .db 11
 .db 27
 .db 4
 .db 49
 .db 28
 .db 1

selAnimation2:
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 56
 .db 56
 .db 0
 .db 54
 .db 63
 .db 15
 .db 27
 .db 6
 .db 57
 .db 60
 .db 3

selCursorAnimation1:
 .db 11
 .db 0
 .db 0
 .db 38
 .db 32
 .db 62
 .db 59
 .db 8
 .db 54
 .db 63
 .db 11
 .db 27
 .db 29
 .db 49
 .db 28
 .db 53

selCursorAnimation2:
 .db 11
 .db 0
 .db 0
 .db 38
 .db 0
 .db 56
 .db 56
 .db 0
 .db 54
 .db 63
 .db 15
 .db 27
 .db 31
 .db 57
 .db 60
 .db 55

killBallSprite:
 .db 32
 .db 56
 .db 56
 .db 8
 .db 54
 .db 63
 .db 1
 .db 27
 .db 54
 .db 3
 .db 32
 .db 27
 .db 4
 .db 7
 .db 7
 .db 1
 .db 32
 .db 56
 .db 56
 .db 8
 .db 22
 .db 1
 .db 4
 .db 19
 .db 50
 .db 8
 .db 32
 .db 26
 .db 4
 .db 7
 .db 7
 .db 1
 .db 32
 .db 24
 .db 48
 .db 8
 .db 6
 .db 0
 .db 0
 .db 3
 .db 48
 .db 0
 .db 0
 .db 24
 .db 4
 .db 3
 .db 6
 .db 1
 .db 32
 .db 8
 .db 32
 .db 8
 .db 2
 .db 0
 .db 0
 .db 2
 .db 16
 .db 0
 .db 0
 .db 16
 .db 4
 .db 1
 .db 4
 .db 1

ballCursorSprite:
 .db 11
 .db 48
 .db 24
 .db 38
 .db 52
 .db 63
 .db 31
 .db 25
 .db 38
 .db 15
 .db 33
 .db 11
 .db 25
 .db 6
 .db 3
 .db 52

emptySprite:
 .db 16
 .db 40
 .db 16
 .db 8
 .db 20
 .db 42
 .db 21
 .db 10
 .db 20
 .db 42
 .db 21
 .db 10
 .db 4
 .db 2
 .db 5
 .db 2

sprite_stepUp:
 .db 0
 .db 26
 .db 16
 .db 0
 .db 0
 .db 27
 .db 54
 .db 0
 .db 0
 .db 2
 .db 22
 .db 0
 .db 0
 .db 2
 .db 16
 .db 0

sprite_stepDown:
 .db 0
 .db 16
 .db 2
 .db 0
 .db 0
 .db 16
 .db 50
 .db 0
 .db 0
 .db 27
 .db 54
 .db 0
 .db 0
 .db 19
 .db 2
 .db 0

sprite_stepLeft:
 .db 0
 .db 56
 .db 0
 .db 0
 .db 4
 .db 7
 .db 5
 .db 0
 .db 0
 .db 56
 .db 24
 .db 8
 .db 0
 .db 6
 .db 1
 .db 0

sprite_stepRight:
 .db 0
 .db 32
 .db 24
 .db 0
 .db 4
 .db 6
 .db 7
 .db 0
 .db 0
 .db 40
 .db 56
 .db 8
 .db 0
 .db 0
 .db 7
 .db 0

cursorSprite:
 .db 27
 .db 40
 .db 16
 .db 46
 .db 20
 .db 42
 .db 21
 .db 10
 .db 20
 .db 42
 .db 21
 .db 10
 .db 29
 .db 2
 .db 5
 .db 54

gameScreen:
 .db 128
 .db 63
 .db 128
 .db 31
 .db 128
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 54
 .db 128
 .db 45
 .db 128
 .db 49
 .db 128
 .db 46
 .db 48
 .db 46
 .db 54
 .db 63
 .db 18
 .db 56
 .db 62
 .db 141
 .db 32
 .db 62
 .db 59
 .db 8
 .db 141
 .db 32
 .db 62
 .db 59
 .db 8
 .db 141
 .db 32
 .db 62
 .db 59
 .db 8
 .db 128
 .db 27
 .db 63
 .db 54
 .db 48
 .db 46
 .db 48
 .db 60
 .db 24
 .db 60
 .db 49
 .db 46
 .db 63
 .db 63
 .db 27
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 48
 .db 128
 .db 44
 .db 128
 .db 54
 .db 128
 .db 45
 .db 48
 .db 46
 .db 48
 .db 46
 .db 18
 .db 56
 .db 63
 .db 141
 .db 54
 .db 63
 .db 11
 .db 27
 .db 141
 .db 54
 .db 63
 .db 11
 .db 27
 .db 141
 .db 54
 .db 63
 .db 11
 .db 27
 .db 128
 .db 27
 .db 63
 .db 54
 .db 48
 .db 46
 .db 48
 .db 62
 .db 27
 .db 63
 .db 6
 .db 37
 .db 63
 .db 63
 .db 27
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 54
 .db 128
 .db 45
 .db 128
 .db 14
 .db 128
 .db 53
 .db 6
 .db 53
 .db 6
 .db 53
 .db 18
 .db 7
 .db 55
 .db 141
 .db 4
 .db 49
 .db 28
 .db 1
 .db 141
 .db 4
 .db 49
 .db 28
 .db 1
 .db 141
 .db 4
 .db 49
 .db 28
 .db 1
 .db 128
 .db 27
 .db 7
 .db 38
 .db 6
 .db 53
 .db 6
 .db 39
 .db 27
 .db 63
 .db 54
 .db 45
 .db 63
 .db 63
 .db 27
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 59
 .db 128
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 61
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 8
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 52
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 38
 .db 11
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 4
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 52
 .db 60
 .db 57
 .db 25
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 32
 .db 63
 .db 40
 .db 52
 .db 59
 .db 0
 .db 0
 .db 4
 .db 36
 .db 9
 .db 1
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 47
 .db 45
 .db 54
 .db 55
 .db 9
 .db 0
 .db 0
 .db 62
 .db 59
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 36
 .db 40
 .db 45
 .db 50
 .db 52
 .db 0
 .db 0
 .db 0
 .db 63
 .db 63
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 132
 .db 7
 .db 5
 .db 6
 .db 3
 .db 0
 .db 0
 .db 0
 .db 38
 .db 11
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 132
 .db 38
 .db 63
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 140
 .db 28
 .db 39
 .db 7
 .db 57
 .db 0
 .db 0
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 140
 .db 32
 .db 62
 .db 45
 .db 1
 .db 38
 .db 54
 .db 59
 .db 8
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 140
 .db 62
 .db 63
 .db 57
 .db 54
 .db 9
 .db 62
 .db 63
 .db 59
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 30
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 140
 .db 36
 .db 140
 .db 63
 .db 63
 .db 27
 .db 61
 .db 27
 .db 63
 .db 63
 .db 63
 .db 8
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 38
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 129
 .db 56
 .db 140
 .db 7
 .db 140
 .db 63
 .db 47
 .db 56
 .db 60
 .db 55
 .db 63
 .db 63
 .db 25
 .db 52
 .db 25
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 128
 .db 32
 .db 128
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 32
 .db 62
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 129
 .db 32
 .db 129
 .db 63
 .db 129
 .db 63
 .db 24
 .db 140
 .db 51
 .db 56
 .db 56
 .db 31
 .db 16
 .db 55
 .db 55
 .db 63
 .db 11
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 128
 .db 36
 .db 128
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 54
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 129
 .db 52
 .db 129
 .db 63
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 8
 .db 140
 .db 63
 .db 36
 .db 4
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 0
 .db 0
 .db 136
 .db 32
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 129
 .db 54
 .db 129
 .db 63
 .db 63
 .db 7
 .db 7
 .db 7
 .db 140
 .db 56
 .db 56
 .db 2
 .db 10
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 0
 .db 136
 .db 48
 .db 31
 .db 24
 .db 33
 .db 46
 .db 24
 .db 0
 .db 0
 .db 0
 .db 129
 .db 54
 .db 129
 .db 63
 .db 1
 .db 140
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 136
 .db 32
 .db 63
 .db 27
 .db 33
 .db 24
 .db 37
 .db 63
 .db 25
 .db 0
 .db 0
 .db 129
 .db 63
 .db 129
 .db 1
 .db 0
 .db 0
 .db 140
 .db 39
 .db 15
 .db 55
 .db 7
 .db 0
 .db 0
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 128
 .db 61
 .db 61
 .db 0
 .db 136
 .db 54
 .db 63
 .db 63
 .db 20
 .db 59
 .db 55
 .db 63
 .db 63
 .db 8
 .db 0
 .db 129
 .db 27
 .db 129
 .db 0
 .db 140
 .db 62
 .db 8
 .db 52
 .db 25
 .db 62
 .db 8
 .db 52
 .db 25
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 136
 .db 32
 .db 136
 .db 24
 .db 32
 .db 63
 .db 63
 .db 63
 .db 14
 .db 7
 .db 62
 .db 63
 .db 63
 .db 1
 .db 0
 .db 129
 .db 1
 .db 140
 .db 36
 .db 140
 .db 60
 .db 63
 .db 63
 .db 27
 .db 63
 .db 63
 .db 63
 .db 60
 .db 0
 .db 132
 .db 36
 .db 9
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 136
 .db 54
 .db 63
 .db 52
 .db 63
 .db 7
 .db 59
 .db 7
 .db 7
 .db 53
 .db 31
 .db 133
 .db 56
 .db 63
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 140
 .db 7
 .db 7
 .db 7
 .db 1
 .db 6
 .db 7
 .db 7
 .db 3
 .db 0
 .db 132
 .db 4
 .db 1
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 136
 .db 4
 .db 55
 .db 31
 .db 11
 .db 58
 .db 6
 .db 7
 .db 7
 .db 7
 .db 133
 .db 60
 .db 63
 .db 63
 .db 9
 .db 128
 .db 0
 .db 128
 .db 57
 .db 128
 .db 56
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 32
 .db 56
 .db 26
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 6
 .db 3
 .db 0
 .db 136
 .db 17
 .db 23
 .db 133
 .db 4
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 9
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 4
 .db 56
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 133
 .db 39
 .db 63
 .db 27
 .db 128
 .db 0
 .db 128
 .db 21
 .db 128
 .db 61
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 30
 .db 10
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 4
 .db 63
 .db 63
 .db 63
 .db 63
 .db 3
 .db 0
 .db 133
 .db 39
 .db 59
 .db 128
 .db 0
 .db 128
 .db 21
 .db 128
 .db 58
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 29
 .db 10
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 48
 .db 0
 .db 36
 .db 9
 .db 54
 .db 0
 .db 32
 .db 8
 .db 0
 .db 133
 .db 55
 .db 128
 .db 0
 .db 128
 .db 21
 .db 128
 .db 61
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 30
 .db 10
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 136
 .db 32
 .db 39
 .db 57
 .db 62
 .db 27
 .db 63
 .db 57
 .db 62
 .db 35
 .db 0
 .db 133
 .db 38
 .db 128
 .db 0
 .db 128
 .db 21
 .db 128
 .db 58
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 29
 .db 10
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 136
 .db 4
 .db 63
 .db 63
 .db 63
 .db 11
 .db 55
 .db 63
 .db 63
 .db 31
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 21
 .db 128
 .db 61
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 30
 .db 10
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 128
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 16
 .db 0
 .db 128
 .db 0
 .db 128
 .db 21
 .db 128
 .db 58
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 29
 .db 10
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 128
 .db 23
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 31
 .db 11
 .db 0
 .db 128
 .db 0
 .db 128
 .db 29
 .db 128
 .db 61
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 30
 .db 26
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 128
 .db 29
 .db 58
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 29
 .db 26
 .db 0
 .db 128
 .db 60
 .db 128
 .db 14
 .db 128
 .db 7
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 7
 .db 53
 .db 56
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 128
 .db 60
 .db 14
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 7
 .db 53
 .db 56
 .db 128
 .db 39
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 128
 .db 39
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 15
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 4
 .db 128
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 128
 .db 4
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 1
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 22
 .db 17
 .db 9
 .db 18
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 22
 .db 17
 .db 43
 .db 18
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 132
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 0
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 50
 .db 10
 .db 29
 .db 18
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 128
 .db 63
 .db 63
 .db 63
 .db 31
 .db 132
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 128
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 132
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 128
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 132
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 128
 .db 55
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 31
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 56
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 46
 .db 63
 .db 63
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 27
 .db 56
 .db 62
 .db 37
 .db 63
 .db 128
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 27
 .db 56
 .db 58
 .db 56
 .db 55
 .db 128
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 27
 .db 56
 .db 58
 .db 56
 .db 55
 .db 128
 .db 54
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 27
 .db 128
 .db 56
 .db 128
 .db 26
 .db 128
 .db 63
 .db 54
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 43
 .db 28
 .db 41
 .db 28
 .db 57
 .db 28
 .db 45
 .db 63
 .db 63
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 27
 .db 60
 .db 63
 .db 45
 .db 63
 .db 128
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 27
 .db 60
 .db 31
 .db 56
 .db 63
 .db 128
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 27
 .db 60
 .db 63
 .db 57
 .db 55
 .db 128
 .db 54
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 27
 .db 128
 .db 60
 .db 128
 .db 59
 .db 128
 .db 56
 .db 54
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 13
 .db 3
 .db 13
 .db 35
 .db 43
 .db 60
 .db 45
 .db 63
 .db 63
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 59
 .db 63
 .db 59
 .db 56
 .db 62
 .db 128
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 59
 .db 63
 .db 59
 .db 56
 .db 62
 .db 128
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 132
 .db 59
 .db 63
 .db 59
 .db 56
 .db 63
 .db 128
 .db 54
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 59
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 62
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 61
 .db 59
 .db 61
 .db 63
 .db 57
 .db 56
 .db 45
 .db 63
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 63
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 128
 .db 56
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 62
 .db 63
 .db 63
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 56
 .db 128
 .db 18
 .db 128
 .db 63
 .db 128
 .db 50
 .db 40
 .db 26
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 56
 .db 19
 .db 56
 .db 19
 .db 63
 .db 18
 .db 31
 .db 62
 .db 63
 .db 63
 .db 63
 .db 27
 .db 56
 .db 22
 .db 56
 .db 23
 .db 56
 .db 23
 .db 56
 .db 19
 .db 31
 .db 62
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 56
 .db 128
 .db 19
 .db 128
 .db 56
 .db 128
 .db 26
 .db 128
 .db 31
 .db 128
 .db 30
 .db 128
 .db 56
 .db 19
 .db 56
 .db 23
 .db 56
 .db 55
 .db 63
 .db 54
 .db 45
 .db 49
 .db 46
 .db 54
 .db 45
 .db 49
 .db 46
 .db 49
 .db 46
 .db 49
 .db 46
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 63
 .db 128
 .db 54
 .db 128
 .db 56
 .db 128
 .db 54
 .db 45
 .db 27
 .db 63
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 19
 .db 56
 .db 55
 .db 56
 .db 18
 .db 28
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 63
 .db 18
 .db 63
 .db 18
 .db 63
 .db 18
 .db 63
 .db 19
 .db 28
 .db 63
 .db 128
 .db 63
 .db 128
 .db 27
 .db 128
 .db 56
 .db 128
 .db 27
 .db 128
 .db 56
 .db 128
 .db 27
 .db 128
 .db 28
 .db 128
 .db 27
 .db 128
 .db 63
 .db 18
 .db 56
 .db 27
 .db 63
 .db 54
 .db 63
 .db 48
 .db 44
 .db 6
 .db 37
 .db 56
 .db 44
 .db 6
 .db 37
 .db 54
 .db 45
 .db 54
 .db 45
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 59
 .db 128
 .db 63
 .db 128
 .db 62
 .db 128
 .db 56
 .db 128
 .db 63
 .db 61
 .db 59
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 56
 .db 59
 .db 56
 .db 63
 .db 56
 .db 59
 .db 63
 .db 62
 .db 63
 .db 63
 .db 63
 .db 59
 .db 63
 .db 62
 .db 56
 .db 57
 .db 56
 .db 60
 .db 56
 .db 59
 .db 63
 .db 62
 .db 128
 .db 63
 .db 128
 .db 59
 .db 128
 .db 63
 .db 128
 .db 59
 .db 128
 .db 56
 .db 128
 .db 58
 .db 128
 .db 63
 .db 128
 .db 62
 .db 128
 .db 56
 .db 59
 .db 63
 .db 57
 .db 56
 .db 60
 .db 63
 .db 62
 .db 61
 .db 62
 .db 61
 .db 63
 .db 61
 .db 62
 .db 61
 .db 62
 .db 61
 .db 57
 .db 62

startScreen:
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 8
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 16
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 16
 .db 0
 .db 0
 .db 58
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 56
 .db 8
 .db 0
 .db 16
 .db 0
 .db 0
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 52
 .db 128
 .db 8
 .db 128
 .db 32
 .db 128
 .db 25
 .db 128
 .db 0
 .db 128
 .db 62
 .db 128
 .db 24
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 52
 .db 128
 .db 59
 .db 128
 .db 62
 .db 128
 .db 8
 .db 128
 .db 0
 .db 128
 .db 60
 .db 63
 .db 24
 .db 0
 .db 32
 .db 25
 .db 0
 .db 58
 .db 0
 .db 32
 .db 25
 .db 0
 .db 0
 .db 32
 .db 59
 .db 0
 .db 52
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 52
 .db 63
 .db 59
 .db 32
 .db 63
 .db 8
 .db 52
 .db 63
 .db 8
 .db 32
 .db 25
 .db 0
 .db 58
 .db 0
 .db 58
 .db 0
 .db 32
 .db 63
 .db 8
 .db 32
 .db 25
 .db 0
 .db 52
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 55
 .db 128
 .db 11
 .db 128
 .db 38
 .db 128
 .db 31
 .db 128
 .db 36
 .db 128
 .db 63
 .db 128
 .db 47
 .db 128
 .db 59
 .db 128
 .db 0
 .db 128
 .db 55
 .db 128
 .db 11
 .db 55
 .db 0
 .db 63
 .db 39
 .db 63
 .db 39
 .db 27
 .db 38
 .db 31
 .db 4
 .db 63
 .db 1
 .db 38
 .db 31
 .db 137
 .db 48
 .db 56
 .db 128
 .db 4
 .db 63
 .db 1
 .db 36
 .db 27
 .db 38
 .db 9
 .db 137
 .db 56
 .db 56
 .db 8
 .db 128
 .db 54
 .db 15
 .db 63
 .db 0
 .db 63
 .db 0
 .db 54
 .db 55
 .db 9
 .db 38
 .db 31
 .db 4
 .db 63
 .db 5
 .db 63
 .db 1
 .db 54
 .db 63
 .db 27
 .db 38
 .db 31
 .db 0
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 36
 .db 128
 .db 27
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 0
 .db 63
 .db 1
 .db 54
 .db 9
 .db 54
 .db 0
 .db 63
 .db 36
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 128
 .db 36
 .db 27
 .db 137
 .db 54
 .db 63
 .db 9
 .db 128
 .db 63
 .db 137
 .db 36
 .db 128
 .db 36
 .db 27
 .db 52
 .db 9
 .db 137
 .db 63
 .db 63
 .db 9
 .db 128
 .db 62
 .db 9
 .db 63
 .db 0
 .db 63
 .db 0
 .db 62
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 54
 .db 45
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 0
 .db 63
 .db 0
 .db 54
 .db 9
 .db 38
 .db 1
 .db 23
 .db 36
 .db 63
 .db 0
 .db 1
 .db 36
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 137
 .db 22
 .db 39
 .db 9
 .db 132
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 0
 .db 137
 .db 32
 .db 63
 .db 63
 .db 9
 .db 132
 .db 63
 .db 9
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 62
 .db 45
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 54
 .db 9
 .db 0
 .db 137
 .db 48
 .db 8
 .db 132
 .db 36
 .db 63
 .db 0
 .db 137
 .db 24
 .db 132
 .db 36
 .db 59
 .db 32
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 0
 .db 8
 .db 137
 .db 1
 .db 132
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 59
 .db 24
 .db 137
 .db 62
 .db 63
 .db 63
 .db 9
 .db 132
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 36
 .db 31
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 37
 .db 27
 .db 36
 .db 27
 .db 32
 .db 31
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 63
 .db 32
 .db 31
 .db 0
 .db 54
 .db 61
 .db 9
 .db 137
 .db 63
 .db 59
 .db 132
 .db 36
 .db 63
 .db 137
 .db 36
 .db 63
 .db 132
 .db 36
 .db 63
 .db 39
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 59
 .db 46
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 0
 .db 137
 .db 38
 .db 63
 .db 63
 .db 9
 .db 132
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 52
 .db 27
 .db 54
 .db 9
 .db 36
 .db 63
 .db 60
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 36
 .db 27
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 63
 .db 39
 .db 27
 .db 0
 .db 54
 .db 9
 .db 0
 .db 137
 .db 38
 .db 63
 .db 132
 .db 36
 .db 63
 .db 137
 .db 36
 .db 63
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 52
 .db 8
 .db 137
 .db 63
 .db 63
 .db 132
 .db 32
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 9
 .db 54
 .db 9
 .db 36
 .db 31
 .db 4
 .db 63
 .db 0
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 36
 .db 27
 .db 52
 .db 27
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 38
 .db 9
 .db 52
 .db 8
 .db 137
 .db 63
 .db 132
 .db 36
 .db 63
 .db 137
 .db 36
 .db 63
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 137
 .db 36
 .db 132
 .db 36
 .db 27
 .db 36
 .db 9
 .db 137
 .db 63
 .db 63
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 1
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 36
 .db 27
 .db 54
 .db 9
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 0
 .db 63
 .db 0
 .db 54
 .db 9
 .db 54
 .db 0
 .db 137
 .db 63
 .db 132
 .db 36
 .db 63
 .db 137
 .db 4
 .db 31
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 52
 .db 27
 .db 52
 .db 27
 .db 0
 .db 63
 .db 137
 .db 4
 .db 132
 .db 36
 .db 27
 .db 60
 .db 9
 .db 137
 .db 63
 .db 31
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 62
 .db 0
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 9
 .db 36
 .db 27
 .db 36
 .db 27
 .db 62
 .db 1
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 140
 .db 54
 .db 140
 .db 9
 .db 140
 .db 36
 .db 140
 .db 27
 .db 140
 .db 0
 .db 140
 .db 63
 .db 140
 .db 0
 .db 140
 .db 63
 .db 140
 .db 8
 .db 140
 .db 54
 .db 140
 .db 25
 .db 62
 .db 0
 .db 137
 .db 63
 .db 140
 .db 36
 .db 63
 .db 9
 .db 0
 .db 38
 .db 31
 .db 4
 .db 63
 .db 1
 .db 38
 .db 31
 .db 7
 .db 1
 .db 4
 .db 63
 .db 1
 .db 38
 .db 63
 .db 1
 .db 137
 .db 32
 .db 63
 .db 27
 .db 140
 .db 38
 .db 31
 .db 4
 .db 63
 .db 1
 .db 55
 .db 31
 .db 0
 .db 55
 .db 11
 .db 52
 .db 59
 .db 0
 .db 63
 .db 0
 .db 63
 .db 62
 .db 9
 .db 36
 .db 27
 .db 36
 .db 27
 .db 63
 .db 0
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 140
 .db 54
 .db 9
 .db 36
 .db 27
 .db 32
 .db 63
 .db 61
 .db 63
 .db 0
 .db 55
 .db 63
 .db 55
 .db 1
 .db 137
 .db 63
 .db 8
 .db 140
 .db 23
 .db 0
 .db 0
 .db 0
 .db 1
 .db 0
 .db 2
 .db 0
 .db 0
 .db 1
 .db 137
 .db 56
 .db 56
 .db 24
 .db 140
 .db 2
 .db 137
 .db 52
 .db 8
 .db 140
 .db 1
 .db 137
 .db 52
 .db 63
 .db 63
 .db 63
 .db 8
 .db 140
 .db 1
 .db 137
 .db 24
 .db 140
 .db 2
 .db 137
 .db 56
 .db 140
 .db 4
 .db 1
 .db 137
 .db 58
 .db 140
 .db 4
 .db 0
 .db 4
 .db 11
 .db 4
 .db 63
 .db 1
 .db 55
 .db 63
 .db 1
 .db 52
 .db 27
 .db 36
 .db 63
 .db 63
 .db 0
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 140
 .db 62
 .db 140
 .db 59
 .db 140
 .db 62
 .db 140
 .db 63
 .db 140
 .db 4
 .db 140
 .db 63
 .db 140
 .db 15
 .db 140
 .db 0
 .db 140
 .db 0
 .db 4
 .db 11
 .db 0
 .db 137
 .db 52
 .db 63
 .db 59
 .db 0
 .db 62
 .db 63
 .db 59
 .db 60
 .db 63
 .db 56
 .db 63
 .db 59
 .db 62
 .db 63
 .db 63
 .db 63
 .db 57
 .db 63
 .db 59
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 60
 .db 59
 .db 60
 .db 63
 .db 59
 .db 60
 .db 63
 .db 9
 .db 62
 .db 8
 .db 32
 .db 8
 .db 140
 .db 2
 .db 137
 .db 62
 .db 140
 .db 4
 .db 3
 .db 137
 .db 48
 .db 140
 .db 4
 .db 11
 .db 0
 .db 55
 .db 11
 .db 0
 .db 62
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 140
 .db 55
 .db 140
 .db 15
 .db 140
 .db 55
 .db 140
 .db 0
 .db 140
 .db 6
 .db 137
 .db 32
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 8
 .db 137
 .db 0
 .db 137
 .db 62
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 62
 .db 59
 .db 60
 .db 63
 .db 25
 .db 32
 .db 63
 .db 9
 .db 32
 .db 59
 .db 0
 .db 32
 .db 25
 .db 140
 .db 38
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 140
 .db 4
 .db 137
 .db 32
 .db 140
 .db 4
 .db 137
 .db 36
 .db 137
 .db 56
 .db 137
 .db 62
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 62
 .db 63
 .db 8
 .db 62
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 129
 .db 60
 .db 129
 .db 59
 .db 129
 .db 60
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 45
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 5
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 0
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 63
 .db 63
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 62
 .db 31
 .db 38
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 25
 .db 62
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 0
 .db 4
 .db 1
 .db 0
 .db 55
 .db 31
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 63
 .db 63
 .db 63
 .db 31
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 25
 .db 8
 .db 2
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 52
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 36
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 6
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 39
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 31
 .db 137
 .db 7
 .db 137
 .db 55
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 25
 .db 8
 .db 0
 .db 140
 .db 48
 .db 62
 .db 57
 .db 137
 .db 38
 .db 63
 .db 63
 .db 11
 .db 4
 .db 7
 .db 7
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 32
 .db 56
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 4
 .db 137
 .db 0
 .db 137
 .db 4
 .db 137
 .db 3
 .db 137
 .db 0
 .db 137
 .db 54
 .db 137
 .db 27
 .db 137
 .db 0
 .db 137
 .db 6
 .db 137
 .db 23
 .db 39
 .db 63
 .db 7
 .db 55
 .db 63
 .db 63
 .db 9
 .db 0
 .db 140
 .db 32
 .db 63
 .db 63
 .db 63
 .db 59
 .db 137
 .db 55
 .db 31
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 32
 .db 63
 .db 63
 .db 63
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 6
 .db 137
 .db 3
 .db 137
 .db 0
 .db 137
 .db 0
 .db 137
 .db 2
 .db 0
 .db 7
 .db 0
 .db 54
 .db 63
 .db 63
 .db 1
 .db 0
 .db 140
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 137
 .db 54
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 6
 .db 7
 .db 0
 .db 0
 .db 140
 .db 4
 .db 63
 .db 63
 .db 63
 .db 31
 .db 137
 .db 6
 .db 7
 .db 0
 .db 0
 .db 136
 .db 32
 .db 56
 .db 56
 .db 0
 .db 0
 .db 0
 .db 133
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 31
 .db 132
 .db 35
 .db 132
 .db 24
 .db 129
 .db 39
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 56
 .db 7
 .db 55
 .db 63
 .db 63
 .db 57
 .db 28
 .db 7
 .db 39
 .db 63
 .db 59
 .db 56
 .db 140
 .db 6
 .db 55
 .db 15
 .db 1
 .db 129
 .db 63
 .db 63
 .db 0
 .db 136
 .db 48
 .db 63
 .db 63
 .db 63
 .db 59
 .db 8
 .db 0
 .db 133
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 1
 .db 129
 .db 60
 .db 63
 .db 63
 .db 7
 .db 7
 .db 56
 .db 63
 .db 63
 .db 63
 .db 7
 .db 49
 .db 62
 .db 63
 .db 63
 .db 31
 .db 3
 .db 132
 .db 28
 .db 39
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 63
 .db 132
 .db 59
 .db 132
 .db 28
 .db 132
 .db 35
 .db 132
 .db 24
 .db 129
 .db 39
 .db 63
 .db 63
 .db 63
 .db 57
 .db 28
 .db 7
 .db 7
 .db 7
 .db 7
 .db 3
 .db 0
 .db 0
 .db 7
 .db 1
 .db 140
 .db 48
 .db 8
 .db 129
 .db 48
 .db 56
 .db 56
 .db 0
 .db 136
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 129
 .db 48
 .db 133
 .db 4
 .db 63
 .db 63
 .db 63
 .db 11
 .db 0
 .db 0
 .db 129
 .db 8
 .db 0
 .db 7
 .db 39
 .db 63
 .db 15
 .db 35
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 7
 .db 132
 .db 28
 .db 35
 .db 60
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 132
 .db 55
 .db 132
 .db 63
 .db 132
 .db 59
 .db 132
 .db 28
 .db 49
 .db 129
 .db 6
 .db 35
 .db 56
 .db 56
 .db 60
 .db 63
 .db 56
 .db 28
 .db 7
 .db 63
 .db 63
 .db 63
 .db 31
 .db 140
 .db 62
 .db 56
 .db 56
 .db 129
 .db 4
 .db 7
 .db 7
 .db 136
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 129
 .db 6
 .db 7
 .db 133
 .db 4
 .db 7
 .db 3
 .db 129
 .db 48
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 3
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 0
 .db 132
 .db 56
 .db 35
 .db 60
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 7
 .db 132
 .db 63
 .db 132
 .db 63
 .db 57
 .db 14
 .db 51
 .db 129
 .db 4
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 14
 .db 7
 .db 1
 .db 140
 .db 3
 .db 56
 .db 56
 .db 63
 .db 129
 .db 54
 .db 57
 .db 136
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 129
 .db 48
 .db 11
 .db 133
 .db 60
 .db 63
 .db 59
 .db 8
 .db 129
 .db 56
 .db 24
 .db 7
 .db 48
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 7
 .db 132
 .db 56
 .db 7
 .db 56
 .db 63
 .db 63
 .db 31
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 132
 .db 55
 .db 63
 .db 63
 .db 57
 .db 14
 .db 51
 .db 129
 .db 4
 .db 7
 .db 63
 .db 7
 .db 7
 .db 56
 .db 60
 .db 59
 .db 8
 .db 140
 .db 14
 .db 39
 .db 63
 .db 63
 .db 129
 .db 54
 .db 63
 .db 27
 .db 136
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 129
 .db 15
 .db 133
 .db 52
 .db 63
 .db 63
 .db 63
 .db 3
 .db 129
 .db 33
 .db 60
 .db 63
 .db 57
 .db 56
 .db 28
 .db 7
 .db 23
 .db 3
 .db 132
 .db 60
 .db 7
 .db 56
 .db 63
 .db 63
 .db 63
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 132
 .db 15
 .db 132
 .db 59
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 6
 .db 63
 .db 63
 .db 63
 .db 57
 .db 14
 .db 55
 .db 56
 .db 129
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 25
 .db 140
 .db 55
 .db 59
 .db 56
 .db 1
 .db 129
 .db 4
 .db 1
 .db 56
 .db 136
 .db 6
 .db 63
 .db 63
 .db 63
 .db 31
 .db 1
 .db 129
 .db 24
 .db 133
 .db 56
 .db 7
 .db 35
 .db 56
 .db 62
 .db 9
 .db 129
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 3
 .db 132
 .db 60
 .db 7
 .db 56
 .db 63
 .db 63
 .db 63
 .db 31
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 62
 .db 39
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 54
 .db 132
 .db 0
 .db 132
 .db 54
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 0
 .db 0
 .db 39
 .db 63
 .db 63
 .db 63
 .db 57
 .db 14
 .db 55
 .db 56
 .db 129
 .db 7
 .db 63
 .db 63
 .db 63
 .db 57
 .db 140
 .db 6
 .db 1
 .db 129
 .db 56
 .db 59
 .db 56
 .db 4
 .db 39
 .db 136
 .db 4
 .db 7
 .db 7
 .db 129
 .db 60
 .db 7
 .db 3
 .db 133
 .db 56
 .db 62
 .db 59
 .db 56
 .db 7
 .db 1
 .db 129
 .db 63
 .db 63
 .db 15
 .db 1
 .db 132
 .db 60
 .db 7
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 27
 .db 0
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 38
 .db 132
 .db 57
 .db 132
 .db 63
 .db 132
 .db 24
 .db 132
 .db 0
 .db 132
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 8
 .db 132
 .db 6
 .db 55
 .db 63
 .db 63
 .db 63
 .db 57
 .db 14
 .db 63
 .db 56
 .db 129
 .db 7
 .db 35
 .db 56
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 1
 .db 136
 .db 4
 .db 7
 .db 7
 .db 0
 .db 129
 .db 32
 .db 63
 .db 133
 .db 38
 .db 63
 .db 63
 .db 63
 .db 31
 .db 129
 .db 56
 .db 8
 .db 1
 .db 132
 .db 62
 .db 15
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 1
 .db 137
 .db 32
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 63
 .db 60
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 7
 .db 132
 .db 39
 .db 132
 .db 63
 .db 132
 .db 24
 .db 133
 .db 32
 .db 133
 .db 30
 .db 47
 .db 59
 .db 28
 .db 1
 .db 0
 .db 0
 .db 132
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 7
 .db 63
 .db 56
 .db 129
 .db 6
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 136
 .db 6
 .db 1
 .db 56
 .db 56
 .db 6
 .db 1
 .db 129
 .db 63
 .db 59
 .db 133
 .db 39
 .db 63
 .db 31
 .db 1
 .db 129
 .db 1
 .db 132
 .db 62
 .db 15
 .db 49
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 3
 .db 0
 .db 0
 .db 137
 .db 4
 .db 49
 .db 62
 .db 47
 .db 51
 .db 8
 .db 132
 .db 48
 .db 63
 .db 15
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 36
 .db 132
 .db 12
 .db 132
 .db 55
 .db 132
 .db 57
 .db 133
 .db 59
 .db 133
 .db 61
 .db 133
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 7
 .db 63
 .db 57
 .db 129
 .db 6
 .db 23
 .db 7
 .db 7
 .db 136
 .db 32
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 57
 .db 129
 .db 48
 .db 6
 .db 51
 .db 0
 .db 132
 .db 56
 .db 63
 .db 15
 .db 49
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 1
 .db 0
 .db 0
 .db 0
 .db 137
 .db 32
 .db 63
 .db 63
 .db 61
 .db 62
 .db 3
 .db 132
 .db 31
 .db 33
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 133
 .db 63
 .db 132
 .db 60
 .db 133
 .db 57
 .db 132
 .db 59
 .db 133
 .db 63
 .db 63
 .db 15
 .db 19
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 7
 .db 63
 .db 57
 .db 8
 .db 129
 .db 55
 .db 25
 .db 136
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 129
 .db 62
 .db 7
 .db 132
 .db 56
 .db 63
 .db 15
 .db 49
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 22
 .db 39
 .db 63
 .db 63
 .db 132
 .db 62
 .db 137
 .db 60
 .db 132
 .db 57
 .db 137
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 6
 .db 133
 .db 39
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 45
 .db 133
 .db 57
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 7
 .db 63
 .db 57
 .db 24
 .db 136
 .db 6
 .db 63
 .db 63
 .db 63
 .db 15
 .db 1
 .db 132
 .db 56
 .db 63
 .db 15
 .db 49
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 60
 .db 45
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 36
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 27
 .db 133
 .db 56
 .db 133
 .db 63
 .db 132
 .db 32
 .db 132
 .db 15
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 28
 .db 39
 .db 63
 .db 59
 .db 24
 .db 136
 .db 7
 .db 132
 .db 32
 .db 60
 .db 63
 .db 31
 .db 35
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 62
 .db 39
 .db 8
 .db 137
 .db 63
 .db 56
 .db 54
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 132
 .db 63
 .db 132
 .db 63
 .db 132
 .db 63
 .db 132
 .db 57
 .db 133
 .db 7
 .db 133
 .db 3
 .db 132
 .db 54
 .db 132
 .db 0
 .db 132
 .db 54
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 28
 .db 39
 .db 63
 .db 9
 .db 63
 .db 31
 .db 35
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 27
 .db 0
 .db 27
 .db 137
 .db 6
 .db 7
 .db 132
 .db 60
 .db 63
 .db 63
 .db 63
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 38
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 132
 .db 55
 .db 132
 .db 0
 .db 38
 .db 57
 .db 63
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 8
 .db 132
 .db 6
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 28
 .db 1
 .db 35
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 1
 .db 136
 .db 32
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 48
 .db 63
 .db 60
 .db 11
 .db 0
 .db 31
 .db 137
 .db 63
 .db 63
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 39
 .db 133
 .db 15
 .db 133
 .db 31
 .db 133
 .db 3
 .db 0
 .db 0
 .db 132
 .db 7
 .db 39
 .db 63
 .db 24
 .db 140
 .db 32
 .db 30
 .db 47
 .db 59
 .db 28
 .db 1
 .db 0
 .db 0
 .db 132
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 1
 .db 0
 .db 0
 .db 136
 .db 4
 .db 49
 .db 62
 .db 47
 .db 51
 .db 8
 .db 132
 .db 48
 .db 63
 .db 15
 .db 7
 .db 0
 .db 0
 .db 137
 .db 6
 .db 55
 .db 39
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 32
 .db 133
 .db 63
 .db 133
 .db 60
 .db 133
 .db 9
 .db 133
 .db 63
 .db 133
 .db 60
 .db 59
 .db 0
 .db 0
 .db 132
 .db 36
 .db 12
 .db 55
 .db 57
 .db 140
 .db 59
 .db 61
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 32
 .db 63
 .db 63
 .db 61
 .db 62
 .db 3
 .db 132
 .db 31
 .db 33
 .db 9
 .db 0
 .db 0
 .db 137
 .db 62
 .db 57
 .db 63
 .db 36
 .db 57
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 133
 .db 7
 .db 7
 .db 0
 .db 6
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 140
 .db 63
 .db 132
 .db 60
 .db 140
 .db 57
 .db 132
 .db 59
 .db 140
 .db 63
 .db 63
 .db 15
 .db 19
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 6
 .db 63
 .db 63
 .db 63
 .db 9
 .db 63
 .db 63
 .db 63
 .db 15
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 22
 .db 39
 .db 63
 .db 63
 .db 132
 .db 62
 .db 136
 .db 60
 .db 132
 .db 57
 .db 136
 .db 63
 .db 0
 .db 0
 .db 0
 .db 137
 .db 6
 .db 7
 .db 3
 .db 0
 .db 7
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 140
 .db 6
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 45
 .db 57
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 39
 .db 63
 .db 9
 .db 63
 .db 31
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 60
 .db 45
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 140
 .db 36
 .db 63
 .db 63
 .db 63
 .db 27
 .db 56
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 6
 .db 57
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 63
 .db 56
 .db 54
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 63
 .db 63
 .db 63
 .db 57
 .db 140
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 6
 .db 7
 .db 132
 .db 60
 .db 63
 .db 63
 .db 63
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 38
 .db 63
 .db 63
 .db 63
 .db 132
 .db 55
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 31
 .db 136
 .db 63
 .db 63
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 39
 .db 15
 .db 31
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 6
 .db 55
 .db 39
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 140
 .db 32
 .db 63
 .db 60
 .db 9
 .db 63
 .db 60
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 62
 .db 57
 .db 63
 .db 36
 .db 57
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 140
 .db 7
 .db 7
 .db 0
 .db 6
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 6
 .db 7
 .db 3
 .db 0
 .db 7
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 255
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 241
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 8
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 16
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 16
 .db 0
 .db 0
 .db 58
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 56
 .db 8
 .db 0
 .db 16
 .db 0
 .db 0
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 52
 .db 128
 .db 8
 .db 128
 .db 32
 .db 128
 .db 25
 .db 128
 .db 0
 .db 128
 .db 62
 .db 128
 .db 24
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 52
 .db 128
 .db 59
 .db 128
 .db 62
 .db 128
 .db 8
 .db 128
 .db 0
 .db 128
 .db 60
 .db 63
 .db 24
 .db 0
 .db 32
 .db 25
 .db 0
 .db 58
 .db 0
 .db 32
 .db 25
 .db 0
 .db 0
 .db 32
 .db 59
 .db 0
 .db 52
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 52
 .db 63
 .db 59
 .db 32
 .db 63
 .db 8
 .db 52
 .db 63
 .db 8
 .db 32
 .db 25
 .db 0
 .db 58
 .db 0
 .db 58
 .db 0
 .db 32
 .db 63
 .db 8
 .db 32
 .db 25
 .db 0
 .db 52
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 55
 .db 128
 .db 11
 .db 128
 .db 38
 .db 128
 .db 31
 .db 128
 .db 36
 .db 128
 .db 63
 .db 128
 .db 47
 .db 128
 .db 59
 .db 128
 .db 0
 .db 128
 .db 55
 .db 128
 .db 11
 .db 128
 .db 55
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 39
 .db 63
 .db 39
 .db 27
 .db 38
 .db 31
 .db 4
 .db 63
 .db 1
 .db 38
 .db 31
 .db 0
 .db 0
 .db 4
 .db 63
 .db 1
 .db 36
 .db 27
 .db 38
 .db 9
 .db 0
 .db 0
 .db 0
 .db 54
 .db 15
 .db 63
 .db 0
 .db 63
 .db 0
 .db 54
 .db 55
 .db 9
 .db 38
 .db 31
 .db 4
 .db 63
 .db 5
 .db 63
 .db 1
 .db 54
 .db 63
 .db 27
 .db 38
 .db 31
 .db 0
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 36
 .db 128
 .db 27
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 1
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 54
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 36
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 0
 .db 0
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 52
 .db 9
 .db 0
 .db 0
 .db 0
 .db 62
 .db 9
 .db 63
 .db 0
 .db 63
 .db 0
 .db 62
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 54
 .db 45
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 36
 .db 128
 .db 27
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 38
 .db 128
 .db 1
 .db 128
 .db 23
 .db 128
 .db 36
 .db 63
 .db 0
 .db 1
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 0
 .db 0
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 63
 .db 9
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 62
 .db 45
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 36
 .db 128
 .db 27
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 36
 .db 63
 .db 0
 .db 0
 .db 36
 .db 59
 .db 32
 .db 63
 .db 0
 .db 36
 .db 27
 .db 0
 .db 8
 .db 0
 .db 63
 .db 0
 .db 36
 .db 59
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 36
 .db 31
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 37
 .db 27
 .db 36
 .db 27
 .db 32
 .db 31
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 9
 .db 128
 .db 36
 .db 128
 .db 27
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 32
 .db 128
 .db 31
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 61
 .db 128
 .db 9
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 36
 .db 63
 .db 0
 .db 0
 .db 36
 .db 63
 .db 39
 .db 63
 .db 0
 .db 36
 .db 59
 .db 46
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 52
 .db 27
 .db 54
 .db 9
 .db 36
 .db 63
 .db 60
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 36
 .db 27
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 39
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 36
 .db 63
 .db 0
 .db 0
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 52
 .db 8
 .db 0
 .db 0
 .db 32
 .db 63
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 9
 .db 54
 .db 9
 .db 36
 .db 31
 .db 4
 .db 63
 .db 0
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 36
 .db 27
 .db 52
 .db 27
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 0
 .db 132
 .db 38
 .db 132
 .db 9
 .db 132
 .db 52
 .db 132
 .db 8
 .db 132
 .db 0
 .db 132
 .db 36
 .db 63
 .db 0
 .db 0
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 36
 .db 27
 .db 36
 .db 9
 .db 0
 .db 0
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 1
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 36
 .db 27
 .db 36
 .db 27
 .db 36
 .db 27
 .db 54
 .db 9
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 0
 .db 63
 .db 0
 .db 54
 .db 9
 .db 54
 .db 0
 .db 137
 .db 63
 .db 132
 .db 36
 .db 63
 .db 137
 .db 4
 .db 31
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 52
 .db 27
 .db 52
 .db 27
 .db 0
 .db 63
 .db 137
 .db 4
 .db 132
 .db 36
 .db 27
 .db 60
 .db 9
 .db 137
 .db 63
 .db 31
 .db 132
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 62
 .db 0
 .db 54
 .db 9
 .db 36
 .db 27
 .db 0
 .db 63
 .db 0
 .db 63
 .db 54
 .db 9
 .db 36
 .db 27
 .db 36
 .db 27
 .db 62
 .db 1
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 132
 .db 9
 .db 132
 .db 36
 .db 132
 .db 27
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 0
 .db 132
 .db 63
 .db 132
 .db 8
 .db 132
 .db 54
 .db 132
 .db 25
 .db 62
 .db 0
 .db 137
 .db 63
 .db 132
 .db 36
 .db 63
 .db 9
 .db 0
 .db 38
 .db 31
 .db 4
 .db 63
 .db 1
 .db 38
 .db 31
 .db 7
 .db 1
 .db 4
 .db 63
 .db 1
 .db 38
 .db 63
 .db 1
 .db 137
 .db 32
 .db 63
 .db 27
 .db 132
 .db 38
 .db 31
 .db 4
 .db 63
 .db 1
 .db 55
 .db 31
 .db 0
 .db 55
 .db 11
 .db 52
 .db 59
 .db 0
 .db 63
 .db 0
 .db 63
 .db 62
 .db 9
 .db 36
 .db 27
 .db 36
 .db 27
 .db 63
 .db 0
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 54
 .db 9
 .db 36
 .db 27
 .db 32
 .db 63
 .db 61
 .db 63
 .db 0
 .db 55
 .db 63
 .db 55
 .db 1
 .db 137
 .db 63
 .db 8
 .db 132
 .db 23
 .db 0
 .db 0
 .db 0
 .db 1
 .db 0
 .db 2
 .db 0
 .db 0
 .db 1
 .db 137
 .db 56
 .db 56
 .db 24
 .db 132
 .db 2
 .db 137
 .db 52
 .db 8
 .db 132
 .db 1
 .db 137
 .db 52
 .db 63
 .db 63
 .db 63
 .db 8
 .db 132
 .db 1
 .db 137
 .db 24
 .db 132
 .db 2
 .db 137
 .db 56
 .db 132
 .db 4
 .db 1
 .db 137
 .db 58
 .db 132
 .db 4
 .db 0
 .db 4
 .db 11
 .db 4
 .db 63
 .db 1
 .db 55
 .db 63
 .db 1
 .db 52
 .db 27
 .db 36
 .db 63
 .db 63
 .db 0
 .db 54
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 132
 .db 62
 .db 132
 .db 59
 .db 132
 .db 62
 .db 132
 .db 63
 .db 132
 .db 4
 .db 132
 .db 63
 .db 132
 .db 15
 .db 132
 .db 0
 .db 132
 .db 0
 .db 4
 .db 11
 .db 0
 .db 137
 .db 52
 .db 63
 .db 59
 .db 0
 .db 62
 .db 63
 .db 59
 .db 60
 .db 63
 .db 56
 .db 63
 .db 59
 .db 62
 .db 63
 .db 63
 .db 63
 .db 57
 .db 63
 .db 59
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 60
 .db 59
 .db 60
 .db 63
 .db 59
 .db 60
 .db 63
 .db 9
 .db 62
 .db 8
 .db 32
 .db 8
 .db 132
 .db 2
 .db 137
 .db 62
 .db 132
 .db 4
 .db 3
 .db 137
 .db 48
 .db 132
 .db 4
 .db 11
 .db 0
 .db 55
 .db 11
 .db 0
 .db 62
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 55
 .db 132
 .db 15
 .db 132
 .db 55
 .db 132
 .db 0
 .db 132
 .db 6
 .db 137
 .db 32
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 8
 .db 137
 .db 0
 .db 137
 .db 62
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 62
 .db 59
 .db 60
 .db 63
 .db 25
 .db 32
 .db 63
 .db 9
 .db 32
 .db 59
 .db 0
 .db 32
 .db 25
 .db 132
 .db 38
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 137
 .db 32
 .db 132
 .db 4
 .db 137
 .db 36
 .db 137
 .db 56
 .db 137
 .db 62
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 62
 .db 63
 .db 8
 .db 62
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 60
 .db 137
 .db 59
 .db 137
 .db 60
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 45
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 5
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 0
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 137
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 63
 .db 63
 .db 54
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 62
 .db 31
 .db 38
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 25
 .db 62
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 0
 .db 4
 .db 1
 .db 0
 .db 55
 .db 31
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 7
 .db 63
 .db 63
 .db 63
 .db 31
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 25
 .db 8
 .db 2
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 52
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 36
 .db 63
 .db 63
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 6
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 39
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 31
 .db 128
 .db 7
 .db 128
 .db 55
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 25
 .db 8
 .db 0
 .db 140
 .db 48
 .db 62
 .db 57
 .db 128
 .db 38
 .db 63
 .db 63
 .db 11
 .db 4
 .db 7
 .db 7
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 32
 .db 56
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 4
 .db 128
 .db 0
 .db 128
 .db 4
 .db 128
 .db 3
 .db 128
 .db 0
 .db 128
 .db 54
 .db 128
 .db 27
 .db 128
 .db 0
 .db 6
 .db 23
 .db 39
 .db 63
 .db 7
 .db 55
 .db 63
 .db 63
 .db 9
 .db 0
 .db 140
 .db 32
 .db 128
 .db 63
 .db 140
 .db 63
 .db 63
 .db 9
 .db 128
 .db 55
 .db 31
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 32
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 6
 .db 128
 .db 3
 .db 128
 .db 0
 .db 0
 .db 2
 .db 0
 .db 7
 .db 0
 .db 54
 .db 63
 .db 63
 .db 1
 .db 0
 .db 140
 .db 36
 .db 63
 .db 63
 .db 63
 .db 0
 .db 128
 .db 54
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 133
 .db 62
 .db 128
 .db 63
 .db 133
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 6
 .db 7
 .db 0
 .db 0
 .db 140
 .db 4
 .db 55
 .db 63
 .db 3
 .db 0
 .db 128
 .db 6
 .db 7
 .db 0
 .db 0
 .db 136
 .db 32
 .db 56
 .db 56
 .db 0
 .db 0
 .db 0
 .db 133
 .db 63
 .db 63
 .db 63
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 31
 .db 128
 .db 35
 .db 128
 .db 24
 .db 129
 .db 39
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 63
 .db 129
 .db 56
 .db 129
 .db 7
 .db 55
 .db 63
 .db 63
 .db 57
 .db 28
 .db 7
 .db 39
 .db 63
 .db 59
 .db 56
 .db 8
 .db 0
 .db 0
 .db 52
 .db 63
 .db 63
 .db 0
 .db 136
 .db 48
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 133
 .db 55
 .db 63
 .db 63
 .db 63
 .db 0
 .db 129
 .db 48
 .db 60
 .db 63
 .db 63
 .db 7
 .db 7
 .db 56
 .db 63
 .db 63
 .db 63
 .db 7
 .db 49
 .db 62
 .db 63
 .db 63
 .db 31
 .db 3
 .db 132
 .db 28
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 63
 .db 132
 .db 59
 .db 132
 .db 28
 .db 128
 .db 35
 .db 128
 .db 24
 .db 129
 .db 39
 .db 63
 .db 63
 .db 63
 .db 57
 .db 28
 .db 7
 .db 7
 .db 7
 .db 7
 .db 3
 .db 0
 .db 0
 .db 7
 .db 1
 .db 0
 .db 0
 .db 48
 .db 56
 .db 56
 .db 0
 .db 136
 .db 63
 .db 128
 .db 63
 .db 63
 .db 136
 .db 63
 .db 63
 .db 0
 .db 129
 .db 48
 .db 8
 .db 133
 .db 6
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 129
 .db 8
 .db 0
 .db 7
 .db 39
 .db 63
 .db 15
 .db 35
 .db 56
 .db 63
 .db 63
 .db 63
 .db 63
 .db 7
 .db 132
 .db 28
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 132
 .db 55
 .db 132
 .db 63
 .db 132
 .db 59
 .db 132
 .db 28
 .db 128
 .db 49
 .db 129
 .db 6
 .db 129
 .db 35
 .db 56
 .db 56
 .db 60
 .db 63
 .db 56
 .db 28
 .db 7
 .db 63
 .db 63
 .db 63
 .db 31
 .db 0
 .db 0
 .db 0
 .db 4
 .db 7
 .db 7
 .db 136
 .db 36
 .db 63
 .db 128
 .db 63
 .db 63
 .db 136
 .db 63
 .db 63
 .db 9
 .db 129
 .db 6
 .db 7
 .db 0
 .db 0
 .db 0
 .db 48
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 3
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 0
 .db 132
 .db 56
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 7
 .db 132
 .db 63
 .db 132
 .db 63
 .db 132
 .db 57
 .db 128
 .db 14
 .db 128
 .db 51
 .db 129
 .db 4
 .db 129
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 14
 .db 7
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 54
 .db 57
 .db 136
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 0
 .db 129
 .db 48
 .db 11
 .db 0
 .db 0
 .db 0
 .db 32
 .db 56
 .db 24
 .db 7
 .db 48
 .db 60
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 7
 .db 132
 .db 56
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 132
 .db 55
 .db 132
 .db 63
 .db 132
 .db 63
 .db 132
 .db 57
 .db 128
 .db 14
 .db 51
 .db 129
 .db 4
 .db 7
 .db 63
 .db 7
 .db 7
 .db 56
 .db 60
 .db 59
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 54
 .db 63
 .db 27
 .db 136
 .db 63
 .db 63
 .db 63
 .db 63
 .db 11
 .db 0
 .db 129
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 33
 .db 60
 .db 63
 .db 57
 .db 56
 .db 28
 .db 7
 .db 23
 .db 3
 .db 132
 .db 60
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 132
 .db 15
 .db 132
 .db 59
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 6
 .db 132
 .db 63
 .db 132
 .db 63
 .db 63
 .db 57
 .db 128
 .db 14
 .db 55
 .db 56
 .db 129
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 4
 .db 1
 .db 56
 .db 8
 .db 136
 .db 7
 .db 7
 .db 7
 .db 0
 .db 129
 .db 48
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 36
 .db 63
 .db 63
 .db 63
 .db 63
 .db 31
 .db 3
 .db 132
 .db 60
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 62
 .db 39
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 54
 .db 132
 .db 0
 .db 132
 .db 18
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 39
 .db 132
 .db 63
 .db 132
 .db 63
 .db 63
 .db 57
 .db 128
 .db 14
 .db 55
 .db 56
 .db 129
 .db 7
 .db 63
 .db 63
 .db 63
 .db 57
 .db 8
 .db 32
 .db 56
 .db 59
 .db 56
 .db 4
 .db 39
 .db 24
 .db 0
 .db 0
 .db 60
 .db 7
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 4
 .db 63
 .db 63
 .db 15
 .db 1
 .db 132
 .db 60
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 18
 .db 0
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 6
 .db 132
 .db 57
 .db 132
 .db 43
 .db 132
 .db 24
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 0
 .db 0
 .db 133
 .db 8
 .db 132
 .db 6
 .db 55
 .db 63
 .db 63
 .db 63
 .db 57
 .db 128
 .db 14
 .db 63
 .db 56
 .db 129
 .db 7
 .db 35
 .db 56
 .db 62
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 32
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 56
 .db 8
 .db 1
 .db 132
 .db 62
 .db 15
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 32
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 30
 .db 60
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 32
 .db 132
 .db 39
 .db 132
 .db 24
 .db 133
 .db 32
 .db 133
 .db 14
 .db 133
 .db 15
 .db 133
 .db 24
 .db 133
 .db 4
 .db 1
 .db 0
 .db 0
 .db 132
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 128
 .db 7
 .db 63
 .db 56
 .db 129
 .db 6
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 63
 .db 59
 .db 0
 .db 0
 .db 0
 .db 4
 .db 1
 .db 132
 .db 62
 .db 15
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 4
 .db 1
 .db 48
 .db 39
 .db 35
 .db 8
 .db 132
 .db 48
 .db 15
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 36
 .db 132
 .db 8
 .db 132
 .db 6
 .db 132
 .db 57
 .db 133
 .db 57
 .db 133
 .db 57
 .db 133
 .db 63
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 128
 .db 7
 .db 63
 .db 57
 .db 129
 .db 6
 .db 23
 .db 7
 .db 7
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 48
 .db 6
 .db 51
 .db 0
 .db 132
 .db 56
 .db 63
 .db 15
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 63
 .db 60
 .db 60
 .db 3
 .db 132
 .db 3
 .db 32
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 133
 .db 63
 .db 132
 .db 60
 .db 133
 .db 57
 .db 132
 .db 59
 .db 133
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 128
 .db 7
 .db 63
 .db 57
 .db 8
 .db 129
 .db 55
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 62
 .db 7
 .db 132
 .db 56
 .db 63
 .db 15
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 36
 .db 63
 .db 63
 .db 132
 .db 62
 .db 137
 .db 60
 .db 132
 .db 57
 .db 137
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 6
 .db 133
 .db 39
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 45
 .db 133
 .db 57
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 56
 .db 128
 .db 7
 .db 63
 .db 57
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 56
 .db 63
 .db 15
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 60
 .db 45
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 36
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 63
 .db 133
 .db 27
 .db 133
 .db 56
 .db 133
 .db 27
 .db 132
 .db 32
 .db 132
 .db 15
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 28
 .db 128
 .db 39
 .db 63
 .db 59
 .db 24
 .db 0
 .db 132
 .db 32
 .db 60
 .db 63
 .db 31
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 62
 .db 39
 .db 8
 .db 137
 .db 54
 .db 56
 .db 54
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 132
 .db 63
 .db 132
 .db 63
 .db 132
 .db 63
 .db 132
 .db 57
 .db 132
 .db 0
 .db 132
 .db 0
 .db 132
 .db 54
 .db 132
 .db 0
 .db 132
 .db 18
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 28
 .db 128
 .db 39
 .db 63
 .db 9
 .db 132
 .db 63
 .db 31
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 18
 .db 0
 .db 27
 .db 0
 .db 0
 .db 60
 .db 63
 .db 63
 .db 63
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 38
 .db 133
 .db 63
 .db 133
 .db 11
 .db 0
 .db 132
 .db 55
 .db 0
 .db 6
 .db 57
 .db 43
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 8
 .db 132
 .db 6
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 28
 .db 128
 .db 1
 .db 132
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 32
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 48
 .db 46
 .db 60
 .db 3
 .db 0
 .db 31
 .db 0
 .db 137
 .db 38
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 33
 .db 133
 .db 0
 .db 133
 .db 24
 .db 133
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 39
 .db 24
 .db 140
 .db 32
 .db 14
 .db 15
 .db 24
 .db 4
 .db 1
 .db 0
 .db 0
 .db 132
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 4
 .db 1
 .db 48
 .db 39
 .db 35
 .db 8
 .db 132
 .db 48
 .db 15
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 48
 .db 0
 .db 12
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 133
 .db 32
 .db 133
 .db 63
 .db 133
 .db 60
 .db 133
 .db 0
 .db 133
 .db 63
 .db 133
 .db 60
 .db 27
 .db 0
 .db 0
 .db 132
 .db 36
 .db 8
 .db 6
 .db 57
 .db 140
 .db 57
 .db 57
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 55
 .db 63
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 63
 .db 60
 .db 60
 .db 3
 .db 132
 .db 3
 .db 32
 .db 9
 .db 0
 .db 0
 .db 137
 .db 54
 .db 57
 .db 63
 .db 0
 .db 57
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 133
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 63
 .db 132
 .db 60
 .db 140
 .db 57
 .db 132
 .db 59
 .db 140
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 6
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 36
 .db 63
 .db 63
 .db 132
 .db 62
 .db 136
 .db 60
 .db 132
 .db 57
 .db 136
 .db 63
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 137
 .db 4
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 140
 .db 6
 .db 39
 .db 63
 .db 63
 .db 63
 .db 63
 .db 45
 .db 57
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 4
 .db 39
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 60
 .db 45
 .db 63
 .db 63
 .db 63
 .db 63
 .db 15
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 140
 .db 36
 .db 63
 .db 63
 .db 63
 .db 27
 .db 56
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 6
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 54
 .db 56
 .db 54
 .db 63
 .db 63
 .db 63
 .db 9
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 132
 .db 4
 .db 63
 .db 63
 .db 63
 .db 57
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 60
 .db 63
 .db 63
 .db 63
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 38
 .db 63
 .db 11
 .db 0
 .db 132
 .db 55
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 31
 .db 0
 .db 136
 .db 38
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 33
 .db 0
 .db 24
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 48
 .db 0
 .db 12
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 140
 .db 32
 .db 63
 .db 60
 .db 0
 .db 63
 .db 60
 .db 27
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 54
 .db 57
 .db 63
 .db 0
 .db 57
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 140
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 4
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 255

leftSprite:
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 30
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 38
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 128
 .db 32
 .db 62
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 128
 .db 54
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 136
 .db 28
 .db 39
 .db 7
 .db 57
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 136
 .db 32
 .db 136
 .db 62
 .db 45
 .db 1
 .db 38
 .db 54
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 136
 .db 62
 .db 136
 .db 63
 .db 57
 .db 54
 .db 9
 .db 62
 .db 63
 .db 25
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 136
 .db 36
 .db 136
 .db 63
 .db 136
 .db 63
 .db 27
 .db 63
 .db 26
 .db 63
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 129
 .db 58
 .db 136
 .db 7
 .db 136
 .db 63
 .db 63
 .db 56
 .db 60
 .db 63
 .db 63
 .db 63
 .db 59
 .db 0
 .db 0
 .db 0
 .db 129
 .db 32
 .db 129
 .db 63
 .db 129
 .db 63
 .db 56
 .db 136
 .db 35
 .db 56
 .db 56
 .db 23
 .db 39
 .db 63
 .db 55
 .db 0
 .db 0
 .db 0
 .db 129
 .db 52
 .db 129
 .db 63
 .db 129
 .db 63
 .db 63
 .db 57
 .db 56
 .db 56
 .db 136
 .db 33
 .db 25
 .db 3
 .db 62
 .db 0
 .db 0
 .db 0
 .db 129
 .db 54
 .db 31
 .db 136
 .db 56
 .db 129
 .db 7
 .db 7
 .db 7
 .db 136
 .db 56
 .db 28
 .db 49
 .db 44
 .db 11
 .db 0
 .db 0
 .db 0
 .db 129
 .db 63
 .db 129
 .db 59
 .db 136
 .db 55
 .db 136
 .db 25
 .db 55
 .db 63
 .db 63
 .db 11
 .db 63
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 129
 .db 63
 .db 129
 .db 15
 .db 136
 .db 4
 .db 136
 .db 3
 .db 38
 .db 63
 .db 63
 .db 5
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 129
 .db 31
 .db 129
 .db 0
 .db 129
 .db 0
 .db 136
 .db 54
 .db 9
 .db 0
 .db 0
 .db 62
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 8
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 16
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 63
 .db 128
 .db 63
 .db 128
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 60
 .db 63
 .db 27
 .db 0
 .db 0
 .db 0

rightSprite:
 .db 128
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 32
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 140
 .db 38
 .db 1
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 32
 .db 63
 .db 40
 .db 52
 .db 59
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 54
 .db 47
 .db 45
 .db 54
 .db 55
 .db 9
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 132
 .db 36
 .db 40
 .db 45
 .db 50
 .db 52
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 32
 .db 9
 .db 0
 .db 0
 .db 0
 .db 132
 .db 7
 .db 5
 .db 6
 .db 3
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 0
 .db 0
 .db 132
 .db 38
 .db 63
 .db 63
 .db 11
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 0
 .db 0
 .db 136
 .db 32
 .db 63
 .db 63
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 0
 .db 136
 .db 48
 .db 31
 .db 24
 .db 33
 .db 46
 .db 24
 .db 0
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 36
 .db 9
 .db 0
 .db 136
 .db 32
 .db 63
 .db 27
 .db 33
 .db 24
 .db 37
 .db 63
 .db 25
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 61
 .db 61
 .db 0
 .db 136
 .db 54
 .db 63
 .db 63
 .db 20
 .db 59
 .db 55
 .db 63
 .db 63
 .db 8
 .db 0
 .db 128
 .db 0
 .db 136
 .db 32
 .db 136
 .db 24
 .db 32
 .db 63
 .db 63
 .db 63
 .db 14
 .db 7
 .db 62
 .db 63
 .db 63
 .db 1
 .db 0
 .db 128
 .db 0
 .db 136
 .db 54
 .db 63
 .db 52
 .db 63
 .db 7
 .db 59
 .db 7
 .db 7
 .db 53
 .db 31
 .db 133
 .db 56
 .db 63
 .db 0
 .db 128
 .db 0
 .db 136
 .db 4
 .db 55
 .db 31
 .db 11
 .db 58
 .db 6
 .db 7
 .db 7
 .db 7
 .db 133
 .db 60
 .db 63
 .db 63
 .db 9
 .db 0
 .db 128
 .db 6
 .db 3
 .db 0
 .db 136
 .db 17
 .db 23
 .db 133
 .db 4
 .db 7
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 27
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 4
 .db 56
 .db 63
 .db 63
 .db 56
 .db 56
 .db 56
 .db 133
 .db 39
 .db 63
 .db 27
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 4
 .db 63
 .db 63
 .db 63
 .db 63
 .db 3
 .db 0
 .db 133
 .db 39
 .db 59
 .db 128
 .db 0
 .db 0
 .db 0
 .db 0
 .db 136
 .db 48
 .db 0
 .db 36
 .db 9
 .db 54
 .db 0
 .db 32
 .db 8
 .db 0
 .db 133
 .db 55
 .db 128
 .db 0
 .db 0
 .db 0
 .db 136
 .db 32
 .db 39
 .db 57
 .db 62
 .db 27
 .db 63
 .db 57
 .db 62
 .db 35
 .db 0
 .db 133
 .db 38
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 136
 .db 4
 .db 63
 .db 63
 .db 63
 .db 11
 .db 55
 .db 63
 .db 63
 .db 31
 .db 0
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 128
 .db 8
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 16
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 128
 .db 23
 .db 63
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 56
 .db 31
 .db 11
 .db 0
 .db 128
 .db 0
 .db 128
 .db 0
 .db 0
 .db 128
 .db 29
 .db 58
 .db 63
 .db 63
 .db 63
 .db 63
 .db 63
 .db 59
 .db 29
 .db 26
 .db 0

fontSpace:
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0

font:
 .db 14
 .db 17
 .db 9
 .db 18
 .db 49
 .db 10
 .db 52
 .db 0
 .db 37
 .db 0
 .db 60
 .db 24
 .db 14
 .db 17
 .db 48
 .db 10
 .db 57
 .db 24
 .db 7
 .db 17
 .db 6
 .db 17
 .db 56
 .db 10
 .db 9
 .db 18
 .db 7
 .db 19
 .db 0
 .db 18
 .db 15
 .db 3
 .db 7
 .db 17
 .db 49
 .db 10
 .db 14
 .db 1
 .db 15
 .db 17
 .db 49
 .db 10
 .db 7
 .db 19
 .db 0
 .db 9
 .db 36
 .db 0
 .db 14
 .db 17
 .db 14
 .db 17
 .db 49
 .db 10
 .db 14
 .db 17
 .db 49
 .db 26
 .db 48
 .db 10

font2:
 .db 41
 .db 17
 .db 47
 .db 18
 .db 13
 .db 10
 .db 14
 .db 17
 .db 57
 .db 26
 .db 9
 .db 18
 .db 15
 .db 3
 .db 15
 .db 17
 .db 57
 .db 10
 .db 9
 .db 18
 .db 9
 .db 18
 .db 57
 .db 58
 .db 20
 .db 17
 .db 18
 .db 18
 .db 58
 .db 58
 .db 15
 .db 3
 .db 15
 .db 1
 .db 57
 .db 24
 .db 46
 .db 17
 .db 53
 .db 10
 .db 36
 .db 0
 .db 15
 .db 3
 .db 9
 .db 0
 .db 9
 .db 0
 .db 17
 .db 10
 .db 20
 .db 8
 .db 9
 .db 18
 .db 9
 .db 18
 .db 41
 .db 19
 .db 11
 .db 18
 .db 13
 .db 18
 .db 41
 .db 19
 .db 11
 .db 18
 .db 9
 .db 10
 .db 15
 .db 8
 .db 9
 .db 18
 .db 20
 .db 19
 .db 9
 .db 18
 .db 9
 .db 18
 .db 25
 .db 26
 .db 13
 .db 18
 .db 9
 .db 18
 .db 9
 .db 18
 .db 15
 .db 19
 .db 9
 .db 18
 .db 14
 .db 17
 .db 9
 .db 18
 .db 49
 .db 10
 .db 15
 .db 19
 .db 9
 .db 18
 .db 9
 .db 18
 .db 14
 .db 19
 .db 49
 .db 26
 .db 10
 .db 18
 .db 15
 .db 17
 .db 57
 .db 10
 .db 9
 .db 0
 .db 14
 .db 17
 .db 9
 .db 0
 .db 49
 .db 10
 .db 39
 .db 3
 .db 36
 .db 0
 .db 36
 .db 0
 .db 9
 .db 18
 .db 49
 .db 26
 .db 48
 .db 10
 .db 45
 .db 18
 .db 46
 .db 17
 .db 45
 .db 18
 .db 15
 .db 17
 .db 15
 .db 17
 .db 57
 .db 10
 .db 9
 .db 0
 .db 15
 .db 17
 .db 57
 .db 10
 .db 9
 .db 18
 .db 43
 .db 18
 .db 29
 .db 18
 .db 14
 .db 17
 .db 0
 .db 17
 .db 49
 .db 10
 .db 41
 .db 18
 .db 45
 .db 18
 .db 61
 .db 26
 .db 14
 .db 17
 .db 4
 .db 19
 .db 49
 .db 10
 .db 41
 .db 18
 .db 45
 .db 18
 .db 61
 .db 58
 .db 14
 .db 17
 .db 0
 .db 17
 .db 49
 .db 10
 .db 9
 .db 18
 .db 57
 .db 26
 .db 0
 .db 18

fontEng:
 .db 14
 .db 17
 .db 57
 .db 26
 .db 9
 .db 18
 .db 15
 .db 17
 .db 15
 .db 17
 .db 57
 .db 10
 .db 14
 .db 17
 .db 9
 .db 0
 .db 49
 .db 10
 .db 15
 .db 17
 .db 9
 .db 18
 .db 57
 .db 10
 .db 15
 .db 3
 .db 15
 .db 1
 .db 57
 .db 24
 .db 15
 .db 3
 .db 15
 .db 1
 .db 9
 .db 0
 .db 14
 .db 17
 .db 41
 .db 24
 .db 49
 .db 10
 .db 9
 .db 18
 .db 15
 .db 19
 .db 9
 .db 18
 .db 38
 .db 1
 .db 36
 .db 0
 .db 52
 .db 8
 .db 4
 .db 19
 .db 0
 .db 18
 .db 49
 .db 10
 .db 9
 .db 10
 .db 15
 .db 8
 .db 9
 .db 18
 .db 9
 .db 0
 .db 9
 .db 0
 .db 57
 .db 24
 .db 25
 .db 26
 .db 13
 .db 18
 .db 9
 .db 18
 .db 25
 .db 18
 .db 13
 .db 26
 .db 9
 .db 18
 .db 14
 .db 17
 .db 9
 .db 18
 .db 49
 .db 10
 .db 15
 .db 17
 .db 57
 .db 10
 .db 9
 .db 0
 .db 14
 .db 17
 .db 41
 .db 18
 .db 49
 .db 11
 .db 15
 .db 17
 .db 57
 .db 10
 .db 9
 .db 17
 .db 14
 .db 1
 .db 6
 .db 17
 .db 48
 .db 10
 .db 39
 .db 3
 .db 36
 .db 0
 .db 36
 .db 0
 .db 9
 .db 18
 .db 9
 .db 18
 .db 49
 .db 10
 .db 9
 .db 18
 .db 18
 .db 9
 .db 36
 .db 0
 .db 9
 .db 18
 .db 45
 .db 18
 .db 18
 .db 9
 .db 17
 .db 10
 .db 20
 .db 8
 .db 9
 .db 18
 .db 9
 .db 18
 .db 34
 .db 1
 .db 36
 .db 0
 .db 7
 .db 11
 .db 20
 .db 0
 .db 57
 .db 24

memcpy_1:
 .ds 2
memcpy_2:
 .ds 2
memcpy_3:
 .ds 2
op_div16_mod:
 .ds 2
apogeyScreen3c_i:
 .ds 1
rand_seed:
 .db 250

op_div_mod:
 .ds 1
memset_1:
 .ds 2
memset_2:
 .ds 1
memset_3:
 .ds 2
string13:
 .db 66,50,77,0
string6:
 .db 69,76,84,65,82,79,0
string7:
 .db 69,82,82,52,48,52,0
string9:
 .db 77,73,67,75,0
string10:
 .db 83,67,76,32,77,67,0
string11:
 .db 83,86,79,70,83,75,0
string8:
 .db 83,89,83,67,65,84,0
string12:
 .db 84,73,84,85,83,0
string5:
 .db 86,73,78,88,82,85,0
string4:
 .db 99,32,32,0
string3:
 .db 101,0
string0:
 .db 107,0
string2:
 .db 110,0
string1:
 .db 111,0
  .end
