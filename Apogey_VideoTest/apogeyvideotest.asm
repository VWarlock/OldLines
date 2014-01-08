  .include "stdlib8080.inc"
test:
  sta test_1
  ; 7 for(i=0; i<apogeyVideoHeight; i++) {
  xra a
  sta test_i
l0:
  lxi h, test_1
  lda test_i
  cmp m
  jnc l1
  ; 8 print(i,i,"\x81HELLO WORLD");
  sta print_1
  lda test_i
  sta print_2
  lxi h, string0
  call print
  ; 9 print(64-12-i,i,"\x84HELLO WORLD");Арифметика 3/4
  lxi h, test_i
  mvi a, 52
  sub m
  sta print_1
  mov a, m
  sta print_2
  lxi h, string1
  call print
l2:
  lxi h, test_i
  mov a, m
  inr m
  jmp l0
l1:
  ; 13 getch();
  jmp 63491
test16:
  sta test16_1
  ; 18 for(i=0; i<apogeyVideoHeight; i++) {
  xra a
  sta test16_i
l3:
  lxi h, test16_1
  lda test16_i
  cmp m
  jnc l4
  ; 19 for(j=0; j<16*5; j+=40) {      
  xra a
  sta test16_j
l6:
  cpi 80
  jnc l7
  ; 20 print(j,i,"\x80HELL\x81O WO\x84RLD \x85!!! \x88THIS\x89 IS \x8CTEST\x8D:):)");
  sta print_1
  lda test16_i
  sta print_2
  lxi h, string2
  call print
l8:
  lda test16_j
  adi 40
  sta test16_j
  jmp l6
l7:
l5:
  lxi h, test16_i
  mov a, m
  inr m
  jmp l3
l4:
  ; 23 getch();
  jmp 63491
main:
l9:
  ; 28 apogeyScreen0(); 
  call apogeyScreen0
  ; 29 test(25);
  mvi a, 25
  call test
  ; 30 apogeyScreen0B(); 
  call apogeyScreen0b
  ; 31 test(25);
  mvi a, 25
  call test
  ; 32 apogeyScreen1();
  call apogeyScreen1
  ; 33 test(25);    
  mvi a, 25
  call test
  ; 34 apogeyScreen1B();
  call apogeyScreen1b
  ; 35 test(25);
  mvi a, 25
  call test
  ; 36 apogeyScreen2A();
  call apogeyScreen2a
  ; 37 test(31);    
  mvi a, 31
  call test
  ; 38 apogeyScreen2B();
  call apogeyScreen2b
  ; 39 test(31);
  mvi a, 31
  call test
  ; 40 apogeyScreen2C();
  call apogeyScreen2c
  ; 41 test16(31);
  mvi a, 31
  call test16
  ; 42 apogeyScreen3A();
  call apogeyScreen3a
  ; 43 test(51);    
  mvi a, 51
  call test
  ; 44 apogeyScreen3B();
  call apogeyScreen3b
  ; 45 test(51);
  mvi a, 51
  call test
  ; 46 apogeyScreen3C();
  call apogeyScreen3c
  ; 47 test16(51);
  mvi a, 51
  call test16
  jmp l9
l10:
  ret
  ; --- print -----------------------------------------------------------------
print:
  shld print_3
  ; 4 apogeyVideoMem + y * apogeyVideoBpl + x;<dest>
  lxi h, apogeyVideoBpl
  mov d, m
  lda print_2
  call op_mul
  ; Сложение
  xchg
  lhld apogeyVideoMem
  dad d
  ; Сложение
  xchg
  lhld print_1
  mvi h, 0
  dad d
  shld print_dest
  ; 5 for(;*text; ++text, ++dest)
l11:
  ; convertToConfition
  lhld print_3
  xra a
  ora m
  jz l12
  ; 6 *dest = *text;
  mov a, m
  lhld print_dest
  mov m, a
l13:
  lhld print_3
  inx h
  shld print_3
  lhld print_dest
  inx h
  shld print_dest
  jmp l11
l12:
  ret
  ; --- apogeyScreen0 -----------------------------------------------------------------
apogeyScreen0:
  push b
  ; 3 memset((uchar*)(MEM_ADDR), 0, (FULL_HEIGHT)*(BPL)); 
  lxi h, 57808
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2340
  call memset
  ; 4 if(FILL_EOL) { 5 v = (uchar*)(MEM_ADDR)-1; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + 8; 
  lxi h, 58050
  shld apogeyVideoMem
  ; 10 apogeyVideoBpl = (BPL); 
  mvi a, 78
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 157
  ; 1 ((uchar*)0xEF00)
  mvi m, 153
  ; 1 ((uchar*)0xEF00)
  mvi m, 211
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  mvi m, 225
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 35
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen0b -----------------------------------------------------------------
apogeyScreen0b:
  push b
  ; 3 memset((uchar*)(MEM_ADDR), 0, (FULL_HEIGHT)*(BPL)); 
  lxi h, 57808
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2340
  call memset
  ; 4 if(FILL_EOL) { 5 v = (uchar*)(MEM_ADDR)-1; 
  lxi b, 57807
  ; 6 for(i = FULL_HEIGHT; i; --i) 
  mvi a, 30
  sta apogeyScreen0b_i
l25:
  ; convertToConfition
  lda apogeyScreen0b_i
  ora a
  jz l26
  ; 7 v += apogeyVideoBpl; *v = 0xF1; } Сложение с BC
  lhld apogeyVideoBpl
  mvi h, 0
  dad b
  mov b, h
  mov c, l
  ; 7 *v = 0xF1; } 
  mvi a, 241
  stax b
l27:
  lxi h, apogeyScreen0b_i
  dcr m
  jmp l25
l26:
  ; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + 8; 
  lxi h, 58050
  shld apogeyVideoMem
  ; 10 apogeyVideoBpl = (BPL); 
  mvi a, 78
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 157
  ; 1 ((uchar*)0xEF00)
  mvi m, 153
  ; 1 ((uchar*)0xEF00)
  mvi m, 147
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  mvi m, 225
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 35
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen1 -----------------------------------------------------------------
apogeyScreen1:
  push b
  ; 3 memset((uchar*)(MEM_ADDR), 0, (FULL_HEIGHT)*(BPL)); 
  lxi h, 57808
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2340
  call memset
  ; 4 if(FILL_EOL) { 5 v = (uchar*)(MEM_ADDR)-1; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + 8; 
  lxi h, 58050
  shld apogeyVideoMem
  ; 10 apogeyVideoBpl = (BPL); 
  mvi a, 78
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 157
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 83
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  mvi m, 225
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 35
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen1b -----------------------------------------------------------------
apogeyScreen1b:
  push b
  ; 3 memset((uchar*)(MEM_ADDR), 0, (FULL_HEIGHT)*(BPL)); 
  lxi h, 57808
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2340
  call memset
  ; 4 if(FILL_EOL) { 5 v = (uchar*)(MEM_ADDR)-1; 
  lxi b, 57807
  ; 6 for(i = FULL_HEIGHT; i; --i) 
  mvi a, 30
  sta apogeyScreen1b_i
l45:
  ; convertToConfition
  lda apogeyScreen1b_i
  ora a
  jz l46
  ; 7 v += apogeyVideoBpl; *v = 0xF1; } Сложение с BC
  lhld apogeyVideoBpl
  mvi h, 0
  dad b
  mov b, h
  mov c, l
  ; 7 *v = 0xF1; } 
  mvi a, 241
  stax b
l47:
  lxi h, apogeyScreen1b_i
  dcr m
  jmp l45
l46:
  ; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + 8; 
  lxi h, 58050
  shld apogeyVideoMem
  ; 10 apogeyVideoBpl = (BPL); 
  mvi a, 78
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 157
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  mvi m, 225
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 35
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen2a -----------------------------------------------------------------
apogeyScreen2a:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 57808
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2333
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 57807
  mvi a, 3
  sta apogeyScreen2a_i
l54:
  ; convertToConfition
  lda apogeyScreen2a_i
  ora a
  jz l55
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l56:
  lxi h, apogeyScreen2a_i
  dcr m
  jmp l54
l55:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 31
  sta apogeyScreen2a_i
l58:
  ; convertToConfition
  lda apogeyScreen2a_i
  ora a
  jz l59
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 75
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l60:
  lxi h, apogeyScreen2a_i
  dcr m
  jmp l58
l59:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 60140
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 8; 
  lxi h, 57822
  shld apogeyVideoMem
  ; 11 apogeyVideoBpl = (BPL); 
  mvi a, 75
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 83
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  mvi m, 225
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 28
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen2b -----------------------------------------------------------------
apogeyScreen2b:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 55173
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2426
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 55172
  mvi a, 3
  sta apogeyScreen2b_i
l67:
  ; convertToConfition
  lda apogeyScreen2b_i
  ora a
  jz l68
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l69:
  lxi h, apogeyScreen2b_i
  dcr m
  jmp l67
l68:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 31
  sta apogeyScreen2b_i
l71:
  ; convertToConfition
  lda apogeyScreen2b_i
  ora a
  jz l72
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 78
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l73:
  lxi h, apogeyScreen2b_i
  dcr m
  jmp l71
l72:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57598
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 8; 
  lxi h, 55187
  shld apogeyVideoMem
  ; 11 apogeyVideoBpl = (BPL); 
  mvi a, 78
  sta apogeyVideoBpl
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 0
  ; 1 ((uchar*)0xEF00)
  dcr l
  mvi m, 77
  ; 1 ((uchar*)0xEF00)
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 133
  ; 1 ((uchar*)0xF000)
  mvi m, 215
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 121
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen2c -----------------------------------------------------------------
apogeyScreen2c:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 54677
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2922
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 54676
  mvi a, 3
  sta apogeyScreen2c_i
l80:
  ; convertToConfition
  lda apogeyScreen2c_i
  ora a
  jz l81
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l82:
  lxi h, apogeyScreen2c_i
  dcr m
  jmp l80
l81:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57598
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 8; 
  lxi h, 54691
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
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 149
  ; 1 ((uchar*)0xF000)
  mvi m, 213
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 105
  ; 1 ((uchar*)0xF000)
  mvi m, 75
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 1 ((uchar*)0xEF00)
  lxi h, 61185
  mvi m, 39
  ; 13 if(CHAR_GEN) asm { ei } else asm { di } 13 asm { ei } else asm { di } 13 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen3a -----------------------------------------------------------------
apogeyScreen3a:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 53758
  shld memset_1
  xra a
  sta memset_2
  lxi h, 3841
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 53757
  mvi a, 7
  sta apogeyScreen3a_i
l93:
  ; convertToConfition
  lda apogeyScreen3a_i
  ora a
  jz l94
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l95:
  lxi h, apogeyScreen3a_i
  dcr m
  jmp l93
l94:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 51
  sta apogeyScreen3a_i
l97:
  ; convertToConfition
  lda apogeyScreen3a_i
  ora a
  jz l98
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 75
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l99:
  lxi h, apogeyScreen3a_i
  dcr m
  jmp l97
l98:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57598
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 8; 
  lxi h, 53780
  shld apogeyVideoMem
  ; 11 apogeyVideoBpl = (BPL); 
  mvi a, 75
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
  mvi m, 83
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 254
  ; 1 ((uchar*)0xF000)
  mvi m, 209
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 0
  ; 1 ((uchar*)0xF000)
  mvi m, 79
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
  ; --- apogeyScreen3b -----------------------------------------------------------------
apogeyScreen3b:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 53605
  shld memset_1
  xra a
  sta memset_2
  lxi h, 3994
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 53604
  mvi a, 7
  sta apogeyScreen3b_i
l106:
  ; convertToConfition
  lda apogeyScreen3b_i
  ora a
  jz l107
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l108:
  lxi h, apogeyScreen3b_i
  dcr m
  jmp l106
l107:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 51
  sta apogeyScreen3b_i
l110:
  ; convertToConfition
  lda apogeyScreen3b_i
  ora a
  jz l111
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 78
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l112:
  lxi h, apogeyScreen3b_i
  dcr m
  jmp l110
l111:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57598
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 8; 
  lxi h, 53627
  shld apogeyVideoMem
  ; 11 apogeyVideoBpl = (BPL); 
  mvi a, 78
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
  mvi m, 101
  ; 1 ((uchar*)0xF000)
  mvi m, 209
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 153
  ; 1 ((uchar*)0xF000)
  mvi m, 79
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
l119:
  ; convertToConfition
  lda apogeyScreen3c_i
  ora a
  jz l120
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l121:
  lxi h, apogeyScreen3c_i
  dcr m
  jmp l119
l120:
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
    jmp memset_l1
memset_l2:
    pop b
  
  ret
test_1:
 .ds 1
test_i:
 .ds 1
test16_1:
 .ds 1
test16_i:
 .ds 1
test16_j:
 .ds 1
print_1:
 .ds 1
print_2:
 .ds 1
print_3:
 .ds 2
print_dest:
 .ds 2
apogeyScreen0_i:
 .ds 1
apogeyScreen0b_i:
 .ds 1
apogeyScreen1_i:
 .ds 1
apogeyScreen1b_i:
 .ds 1
apogeyScreen2a_i:
 .ds 1
apogeyScreen2b_i:
 .ds 1
apogeyScreen2c_i:
 .ds 1
apogeyScreen3a_i:
 .ds 1
apogeyScreen3b_i:
 .ds 1
apogeyScreen3c_i:
 .ds 1
apogeyVideoMem:
 .dw 58050

apogeyVideoBpl:
 .db 78

memset_1:
 .ds 2
memset_2:
 .ds 1
memset_3:
 .ds 2
string2:
 .db 128,72,69,76,76,129,79,32,87,79,132,82,76,68,32,133,33,33,33,32,136,84,72,73,83,137,32,73,83,32,140,84,69,83,84,141,58,41,58,41,0
string0:
 .db 129,72,69,76,76,79,32,87,79,82,76,68,0
string1:
 .db 132,72,69,76,76,79,32,87,79,82,76,68,0
  .end
