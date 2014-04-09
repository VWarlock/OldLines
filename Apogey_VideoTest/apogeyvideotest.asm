  .include "stdlib8080.inc"
test:
  sta test_1
  ; 8 for(i=1; i<apogeyVideoHeight; i++) {
  mvi a, 1
  sta test_i
l0:
  lxi h, test_1
  lda test_i
  cmp m
  jnc l1
  ; 9 print(i,i,"\x81HELLO WORLD\x84");
  sta print_1
  lda test_i
  sta print_2
  lxi h, string0
  call print
  ; 10 print(64-16-i,i,"\x84HELLO WORLD\x81");Арифметика 3/4
  lxi h, test_i
  mvi a, 48
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
  ; 12 getch();
  jmp 63491
gtest:
  sta gtest_1
  ; 17 for(i=3; i<apogeyVideoHeight; i++) {
  mvi a, 3
  sta gtest_i
l3:
  lxi h, gtest_1
  lda gtest_i
  cmp m
  jnc l4
  ; 18 print(i,i,"\x81\x44\x7B\x7F\x3F\x7F\x7B\x44\x84");
  sta print_1
  lda gtest_i
  sta print_2
  lxi h, string2
  call print
  ; 19 print(64-11-i,i,"\x84\x44\x7B\x7F\x3F\x7F\x7B\x44\x81");Арифметика 3/4
  lxi h, gtest_i
  mvi a, 53
  sub m
  sta print_1
  mov a, m
  sta print_2
  lxi h, string3
  call print
l5:
  lxi h, gtest_i
  mov a, m
  inr m
  jmp l3
l4:
  ; 21 getch();
  jmp 63491
test16:
  sta test16_1
  ; 27 for(i=1; i<apogeyVideoHeight; i++) {
  mvi a, 1
  sta test16_i
l6:
  lxi h, test16_1
  lda test16_i
  cmp m
  jnc l7
  ; 28 print(0,i,"\x80HELL\x81O WO\x84RLD \x85!!! \x88THIS\x89 IS \x8CTEST\x8D:):)");
  xra a
  sta print_1
  lda test16_i
  sta print_2
  lxi h, string4
  call print
  ; 29 print(40,i,"\x80HELL\x81O WO\x84RLD \x85!!! \x88THIS\x89 IS \x8CTEST\x8D:):)");
  mvi a, 40
  sta print_1
  lda test16_i
  sta print_2
  lxi h, string4
  call print
l8:
  lxi h, test16_i
  mov a, m
  inr m
  jmp l6
l7:
  ; 31 getch();
  jmp 63491
gtest16:
  sta gtest16_1
  ; 36 for(i=3; i<apogeyVideoHeight; i++) {
  mvi a, 3
  sta gtest16_i
l9:
  lxi h, gtest16_1
  lda gtest16_i
  cmp m
  jnc l10
  ; 37 print(0,i,"\x80\x3F\x7F\x7B\x44\x81\x3F\x7F\x7B\x44\x84\x3F\x7F\x7B\x44\x85\x3F\x7F\x7B\x44\x88\x3F\x7F\x7B\x44\x89\x3F\x7F\x7B\x44\x8C\x3F\x7F\x7B\x44\x8D\x3F\x7F\x7B\x44");
  xra a
  sta print_1
  lda gtest16_i
  sta print_2
  lxi h, string5
  call print
  ; 38 print(40,i,"\x80\x3F\x7F\x7B\x44\x81\x3F\x7F\x7B\x44\x84\x3F\x7F\x7B\x44\x85\x3F\x7F\x7B\x44\x88\x3F\x7F\x7B\x44\x89\x3F\x7F\x7B\x44\x8C\x3F\x7F\x7B\x44\x8D\x3F\x7F\x7B\x44");
  mvi a, 40
  sta print_1
  lda gtest16_i
  sta print_2
  lxi h, string5
  call print
l11:
  lxi h, gtest16_i
  mov a, m
  inr m
  jmp l9
l10:
  ; 40 getch();
  jmp 63491
main:
l12:
  ; 45 apogeyScreen0(); 
  call apogeyScreen0
  ; 46 print(0,0,"SCREEN 0 64X25 50HZ SPACE ATTR");
  xra a
  sta print_1
  sta print_2
  lxi h, string6
  call print
  ; 47 test(25);
  mvi a, 25
  call test
  ; 49 apogeyScreen0B(); 
  call apogeyScreen0b
  ; 50 print(0,0,"SCREEN 0B 64X25 50HZ");
  xra a
  sta print_1
  sta print_2
  lxi h, string7
  call print
  ; 51 test(25);
  mvi a, 25
  call test
  ; 53 apogeyScreen1();
  call apogeyScreen1
  ; 54 print(0,0,"SCREEN 1 64X25 60HZ SPACE ATTR");
  xra a
  sta print_1
  sta print_2
  lxi h, string8
  call print
  ; 55 test(25);    
  mvi a, 25
  call test
  ; 57 apogeyScreen1B();
  call apogeyScreen1b
  ; 58 print(0,0,"SCREEN 1B 64X25 60HZ");
  xra a
  sta print_1
  sta print_2
  lxi h, string9
  call print
  ; 59 test(25);
  mvi a, 25
  call test
  ; 61 apogeyScreen2A();
  call apogeyScreen2a
  ; 62 print(0,0,"SCREEN 2A 64X30 0-2 COLORS PER LINE");
  xra a
  sta print_1
  sta print_2
  lxi h, string10
  call print
  ; 63 test(31);    
  mvi a, 31
  call test
  ; 65 apogeyScreen2B();
  call apogeyScreen2b
  ; 66 print(0,0,"SCREEN 2B 64X30 0-5 COLORS PER LINE");
  xra a
  sta print_1
  sta print_2
  lxi h, string11
  call print
  ; 67 test(31);
  mvi a, 31
  call test
  ; 69 apogeyScreen2C();
  call apogeyScreen2c
  ; 70 print(0,0,"SCREEN 2C 64X30 16 COLORS");
  xra a
  sta print_1
  sta print_2
  lxi h, string12
  call print
  ; 71 print(32,0,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
  mvi a, 32
  sta print_1
  xra a
  sta print_2
  lxi h, string13
  call print
  ; 72 test16(31);
  mvi a, 31
  call test16
  ; 74 apogeyScreen3A();
  call apogeyScreen3a
  ; 75 gprint(0, 0, "SCREEN 3A 192X104 SPC ATTR");
  xra a
  sta gprint_1
  sta gprint_2
  lxi h, string14
  call gprint
  ; 76 gtest(51);    
  mvi a, 51
  call gtest
  ; 78 apogeyScreen3B();
  call apogeyScreen3b
  ; 79 gprint(0, 0, "SCREEN 3B 192X104 0-5");
  xra a
  sta gprint_1
  sta gprint_2
  lxi h, string15
  call gprint
  ; 80 gtest(51);
  mvi a, 51
  call gtest
  ; 82 apogeyScreen3C();
  call apogeyScreen3c
  ; 83 print(32,0,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
  mvi a, 32
  sta print_1
  xra a
  sta print_2
  lxi h, string13
  call print
  ; 84 print(32,1,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
  mvi a, 32
  sta print_1
  mvi a, 1
  sta print_2
  lxi h, string13
  call print
  ; 85 print(32,2,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
  mvi a, 32
  sta print_1
  mvi a, 2
  sta print_2
  lxi h, string13
  call print
  ; 86 gprint(0, 0, "3C 192X104 16");
  xra a
  sta gprint_1
  sta gprint_2
  lxi h, string16
  call gprint
  ; 87 gtest16(51);
  mvi a, 51
  call gtest16
  jmp l12
l13:
  ret
  ; --- gchar -----------------------------------------------------------------
gchar:
  push b
  sta gchar_2
  ; 11 if(c>='0' && c<='9') s = font    + 6 * (c - '0'); else
  cpi 48
  jc l14
  cpi 57
  jz l15
  jnc l14
l15:
  ; 11 s = font    + 6 * (c - '0'); elseАрифметика 4/3
  lda gchar_2
  sui 48
  mvi d, 6
  call op_mul
  ; Сложение
  lxi d, font
  dad d
  mov b, h
  mov c, l
  jmp l16
l14:
  ; 12 if(c>='A' && c<='Z') s = fontEng + 6 * (c - 'A'); else
  lda gchar_2
  cpi 65
  jc l17
  cpi 90
  jz l18
  jnc l17
l18:
  ; 12 s = fontEng + 6 * (c - 'A'); elseАрифметика 4/3
  lda gchar_2
  sui 65
  mvi d, 6
  call op_mul
  ; Сложение
  lxi d, fontEng
  dad d
  mov b, h
  mov c, l
  jmp l19
l17:
  ; 13 if(c>='`' && c<='~') s = font2   + 6 * (c - '`'); else s = fontSpace;
  lda gchar_2
  cpi 96
  jc l20
  cpi 126
  jz l21
  jnc l20
l21:
  ; 13 s = font2   + 6 * (c - '`'); else s = fontSpace;Арифметика 4/3
  lda gchar_2
  sui 96
  mvi d, 6
  call op_mul
  ; Сложение
  lxi d, font2
  dad d
  mov b, h
  mov c, l
  jmp l22
l20:
  ; 13 s = fontSpace;
  lxi b, fontSpace
l22:
l19:
l16:
  ; 15 *d = *s; ++d; ++s;
  ldax b
  lhld gchar_1
  mov m, a
  ; 15 ++d; ++s;
  lhld gchar_1
  inx h
  shld gchar_1
  ; 15 ++s;
  inx b
  ; 16 *d = *s; ++s; d += apogeyVideoBpl - 1;
  ldax b
  mov m, a
  ; 16 ++s; d += apogeyVideoBpl - 1;
  inx b
  ; 16 d += apogeyVideoBpl - 1;
  lda apogeyVideoBpl
  dcr a
  ; Сложение
  mov e, a
  mvi d, 0
  lhld gchar_1
  dad d
  shld gchar_1
  ; 17 *d = *s; ++d; ++s;
  ldax b
  mov m, a
  ; 17 ++d; ++s;
  lhld gchar_1
  inx h
  shld gchar_1
  ; 17 ++s;
  inx b
  ; 18 *d = *s; ++s; d += apogeyVideoBpl - 1;
  ldax b
  mov m, a
  ; 18 ++s; d += apogeyVideoBpl - 1;
  inx b
  ; 18 d += apogeyVideoBpl - 1;
  lda apogeyVideoBpl
  dcr a
  ; Сложение
  mov e, a
  lhld gchar_1
  dad d
  shld gchar_1
  ; 19 *d = *s; ++d; ++s;
  ldax b
  mov m, a
  ; 19 ++d; ++s;
  lhld gchar_1
  inx h
  shld gchar_1
  ; 19 ++s;
  inx b
  ; 20 *d = *s;
  ldax b
  mov m, a
  pop b
  ret
  ; --- gprint -----------------------------------------------------------------
gprint:
  shld gprint_3
  ; 24 (uchar*)apogeyVideoMem + x + y*apogeyVideoBpl;<a>Сложение
  lhld apogeyVideoMem
  xchg
  lhld gprint_1
  mvi h, 0
  dad d
  push h
  lxi h, apogeyVideoBpl
  mov d, m
  lda gprint_2
  call op_mul
  ; Сложение
  pop d
  dad d
  shld gprint_a
  ; 25 for(;*text; ++text, a+=2)
l23:
  ; convertToConfition
  lhld gprint_3
  xra a
  ora m
  jz l24
  ; 26 gchar(a, *text);
  lhld gprint_a
  shld gchar_1
  lhld gprint_3
  mov a, m
  call gchar
l25:
  lhld gprint_3
  inx h
  shld gprint_3
  ; Сложение с константой 2
  lhld gprint_a
  inx h
  inx h
  shld gprint_a
  jmp l23
l24:
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
l26:
  ; convertToConfition
  lhld print_3
  xra a
  ora m
  jz l27
  ; 6 *dest = *text;
  mov a, m
  lhld print_dest
  mov m, a
l28:
  lhld print_3
  inx h
  shld print_3
  lhld print_dest
  inx h
  shld print_dest
  jmp l26
l27:
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
  ; 4 if(FILL_EOL) { 5 v = (uchar*)(MEM_ADDR)-1; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + ((HIDDEN_ATTRIB) ? 9 : 8); 
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
  mvi m, 29
  ; 1 ((uchar*)0xEF00)
  mvi m, 153
  ; 1 ((uchar*)0xEF00)
  mvi m, 211
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l41:
  lda 61185
  ani 32
  jnz l42
  jmp l41
l42:
  ; 8 while((VG75[1] & 0x20) == 0); 
l43:
  lda 61185
  ani 32
  jnz l44
  jmp l43
l44:
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
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
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
l48:
  ; convertToConfition
  lda apogeyScreen0b_i
  ora a
  jz l49
  ; 7 v += apogeyVideoBpl; *v = 0xF1; } Сложение с BC
  lhld apogeyVideoBpl
  mvi h, 0
  dad b
  mov b, h
  mov c, l
  ; 7 *v = 0xF1; } 
  mvi a, 241
  stax b
l50:
  lxi h, apogeyScreen0b_i
  dcr m
  jmp l48
l49:
  ; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + ((HIDDEN_ATTRIB) ? 9 : 8); 
  lxi h, 58051
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
  mvi m, 29
  ; 1 ((uchar*)0xEF00)
  mvi m, 153
  ; 1 ((uchar*)0xEF00)
  mvi m, 147
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l59:
  lda 61185
  ani 32
  jnz l60
  jmp l59
l60:
  ; 8 while((VG75[1] & 0x20) == 0); 
l61:
  lda 61185
  ani 32
  jnz l62
  jmp l61
l62:
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
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
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
  ; 4 if(FILL_EOL) { 5 v = (uchar*)(MEM_ADDR)-1; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + ((HIDDEN_ATTRIB) ? 9 : 8); 
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
  mvi m, 93
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 83
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l77:
  lda 61185
  ani 32
  jnz l78
  jmp l77
l78:
  ; 8 while((VG75[1] & 0x20) == 0); 
l79:
  lda 61185
  ani 32
  jnz l80
  jmp l79
l80:
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
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
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
l84:
  ; convertToConfition
  lda apogeyScreen1b_i
  ora a
  jz l85
  ; 7 v += apogeyVideoBpl; *v = 0xF1; } Сложение с BC
  lhld apogeyVideoBpl
  mvi h, 0
  dad b
  mov b, h
  mov c, l
  ; 7 *v = 0xF1; } 
  mvi a, 241
  stax b
l86:
  lxi h, apogeyScreen1b_i
  dcr m
  jmp l84
l85:
  ; 9 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*(BPL) + ((HIDDEN_ATTRIB) ? 9 : 8); 
  lxi h, 58051
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
  mvi m, 93
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l95:
  lda 61185
  ani 32
  jnz l96
  jmp l95
l96:
  ; 8 while((VG75[1] & 0x20) == 0); 
l97:
  lda 61185
  ani 32
  jnz l98
  jmp l97
l98:
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
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
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
l101:
  ; convertToConfition
  lda apogeyScreen2a_i
  ora a
  jz l102
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l103:
  lxi h, apogeyScreen2a_i
  dcr m
  jmp l101
l102:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 31
  sta apogeyScreen2a_i
l105:
  ; convertToConfition
  lda apogeyScreen2a_i
  ora a
  jz l106
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 75
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l107:
  lxi h, apogeyScreen2a_i
  dcr m
  jmp l105
l106:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 60140
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 9; 
  lxi h, 57823
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
  mvi m, 100
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 83
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l114:
  lda 61185
  ani 32
  jnz l115
  jmp l114
l115:
  ; 8 while((VG75[1] & 0x20) == 0); 
l116:
  lda 61185
  ani 32
  jnz l117
  jmp l116
l117:
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
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen2b -----------------------------------------------------------------
apogeyScreen2b:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 54918
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2426
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 54917
  mvi a, 3
  sta apogeyScreen2b_i
l120:
  ; convertToConfition
  lda apogeyScreen2b_i
  ora a
  jz l121
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l122:
  lxi h, apogeyScreen2b_i
  dcr m
  jmp l120
l121:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 31
  sta apogeyScreen2b_i
l124:
  ; convertToConfition
  lda apogeyScreen2b_i
  ora a
  jz l125
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 78
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l126:
  lxi h, apogeyScreen2b_i
  dcr m
  jmp l124
l125:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57343
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 9; 
  lxi h, 54933
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
  mvi m, 100
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l133:
  lda 61185
  ani 32
  jnz l134
  jmp l133
l134:
  ; 8 while((VG75[1] & 0x20) == 0); 
l135:
  lda 61185
  ani 32
  jnz l136
  jmp l135
l136:
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 134
  ; 1 ((uchar*)0xF000)
  mvi m, 214
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 121
  ; 1 ((uchar*)0xF000)
  mvi m, 73
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen2c -----------------------------------------------------------------
apogeyScreen2c:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 54422
  shld memset_1
  xra a
  sta memset_2
  lxi h, 2922
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 54421
  mvi a, 3
  sta apogeyScreen2c_i
l139:
  ; convertToConfition
  lda apogeyScreen2c_i
  ora a
  jz l140
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l141:
  lxi h, apogeyScreen2c_i
  dcr m
  jmp l139
l140:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57343
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 9; 
  lxi h, 54437
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
  mvi m, 100
  ; 1 ((uchar*)0xEF00)
  mvi m, 119
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l152:
  lda 61185
  ani 32
  jnz l153
  jmp l152
l153:
  ; 8 while((VG75[1] & 0x20) == 0); 
l154:
  lda 61185
  ani 32
  jnz l155
  jmp l154
l155:
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 150
  ; 1 ((uchar*)0xF000)
  mvi m, 212
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 105
  ; 1 ((uchar*)0xF000)
  mvi m, 75
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 15 asm { di } 
 di 
  pop b
  ret
  ; --- apogeyScreen3a -----------------------------------------------------------------
apogeyScreen3a:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 53503
  shld memset_1
  xra a
  sta memset_2
  lxi h, 3841
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 53502
  mvi a, 7
  sta apogeyScreen3a_i
l158:
  ; convertToConfition
  lda apogeyScreen3a_i
  ora a
  jz l159
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l160:
  lxi h, apogeyScreen3a_i
  dcr m
  jmp l158
l159:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 51
  sta apogeyScreen3a_i
l162:
  ; convertToConfition
  lda apogeyScreen3a_i
  ora a
  jz l163
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 75
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l164:
  lxi h, apogeyScreen3a_i
  dcr m
  jmp l162
l163:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57343
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 9; 
  lxi h, 53526
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
  mvi m, 127
  ; 1 ((uchar*)0xEF00)
  mvi m, 51
  ; 1 ((uchar*)0xEF00)
  mvi m, 83
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l171:
  lda 61185
  ani 32
  jnz l172
  jmp l171
l172:
  ; 8 while((VG75[1] & 0x20) == 0); 
l173:
  lda 61185
  ani 32
  jnz l174
  jmp l173
l174:
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 255
  ; 1 ((uchar*)0xF000)
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 0
  ; 1 ((uchar*)0xF000)
  mvi m, 79
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 
 ei 
  ; 15 asm { di } 
  pop b
  ret
  ; --- apogeyScreen3b -----------------------------------------------------------------
apogeyScreen3b:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 53350
  shld memset_1
  xra a
  sta memset_2
  lxi h, 3994
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 53349
  mvi a, 7
  sta apogeyScreen3b_i
l177:
  ; convertToConfition
  lda apogeyScreen3b_i
  ora a
  jz l178
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l179:
  lxi h, apogeyScreen3b_i
  dcr m
  jmp l177
l178:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 
  mvi a, 51
  sta apogeyScreen3b_i
l181:
  ; convertToConfition
  lda apogeyScreen3b_i
  ora a
  jz l182
  ; 8 v += (BPL), *v = 0xF1; Сложение с BC
  lxi h, 78
  dad b
  mov b, h
  mov c, l
  mvi a, 241
  stax b
l183:
  lxi h, apogeyScreen3b_i
  dcr m
  jmp l181
l182:
  ; 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57343
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 9; 
  lxi h, 53373
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
  mvi m, 127
  ; 1 ((uchar*)0xEF00)
  mvi m, 51
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l190:
  lda 61185
  ani 32
  jnz l191
  jmp l190
l191:
  ; 8 while((VG75[1] & 0x20) == 0); 
l192:
  lda 61185
  ani 32
  jnz l193
  jmp l192
l193:
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 102
  ; 1 ((uchar*)0xF000)
  mvi m, 208
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 153
  ; 1 ((uchar*)0xF000)
  mvi m, 79
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 
 ei 
  ; 15 asm { di } 
  pop b
  ret
  ; --- apogeyScreen3c -----------------------------------------------------------------
apogeyScreen3c:
  push b
  ; 3 memset((uchar*)MEM_ADDR, 0, (HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+2); 
  lxi h, 52534
  shld memset_1
  xra a
  sta memset_2
  lxi h, 4810
  call memset
  ; 4 for(v=(uchar*)(MEM_ADDR)-1, i=TOP_INVISIBLE; i; --i) 
  lxi b, 52533
  mvi a, 7
  sta apogeyScreen3c_i
l196:
  ; convertToConfition
  lda apogeyScreen3c_i
  ora a
  jz l197
  ; 5 v+=2, *v = 0xF1; Сложение BC с константой 2
  inx b
  inx b
  mvi a, 241
  stax b
l198:
  lxi h, apogeyScreen3c_i
  dcr m
  jmp l196
l197:
  ; 6 if(FILL_EOL) 7 for(i = HEIGHT; i; --i) 9 ((uchar*)MEM_ADDR)[(HEIGHT)*(BPL)+(TOP_INVISIBLE)*2+1] = 0xFF; 
  lxi h, 57343
  mvi m, 255
  ; 10 apogeyVideoMem = (uchar*)(MEM_ADDR) + (TOP_INVISIBLE)*2 + 9; 
  lxi h, 52557
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
  mvi m, 127
  ; 1 ((uchar*)0xEF00)
  mvi m, 51
  ; 1 ((uchar*)0xEF00)
  mvi m, 19
  ; 1 ((uchar*)0xEF00)
  inr l
  mvi m, 35
  ; 7 while((VG75[1] & 0x20) == 0); 
l209:
  lda 61185
  ani 32
  jnz l210
  jmp l209
l210:
  ; 8 while((VG75[1] & 0x20) == 0); 
l211:
  lda 61185
  ani 32
  jnz l212
  jmp l211
l212:
  ; 1 ((uchar*)0xF000)
  lxi h, 61448
  mvi m, 128
  ; 1 ((uchar*)0xF000)
  mvi l, 4
  mvi m, 54
  ; 1 ((uchar*)0xF000)
  mvi m, 205
  ; 1 ((uchar*)0xF000)
  inr l
  mvi m, 201
  ; 1 ((uchar*)0xF000)
  mvi m, 82
  ; 1 ((uchar*)0xF000)
  mvi l, 8
  mvi m, 164
  ; 15 if(CHAR_GEN) asm { ei } else asm { di } 15 asm { ei } else asm { di } 
 ei 
  ; 15 asm { di } 
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
gtest_1:
 .ds 1
gtest_i:
 .ds 1
test16_1:
 .ds 1
test16_i:
 .ds 1
gtest16_1:
 .ds 1
gtest16_i:
 .ds 1
gchar_1:
 .ds 2
gchar_2:
 .ds 1
gprint_1:
 .ds 1
gprint_2:
 .ds 1
gprint_3:
 .ds 2
gprint_a:
 .ds 2
fontSpace:
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0
 .db 0

 .ds 10
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
string16:
 .db 51,67,32,49,57,50,88,49,48,52,32,49,54,0
string6:
 .db 83,67,82,69,69,78,32,48,32,54,52,88,50,53,32,53,48,72,90,32,83,80,65,67,69,32,65,84,84,82,0
string7:
 .db 83,67,82,69,69,78,32,48,66,32,54,52,88,50,53,32,53,48,72,90,0
string8:
 .db 83,67,82,69,69,78,32,49,32,54,52,88,50,53,32,54,48,72,90,32,83,80,65,67,69,32,65,84,84,82,0
string9:
 .db 83,67,82,69,69,78,32,49,66,32,54,52,88,50,53,32,54,48,72,90,0
string10:
 .db 83,67,82,69,69,78,32,50,65,32,54,52,88,51,48,32,48,45,50,32,67,79,76,79,82,83,32,80,69,82,32,76,73,78,69,0
string11:
 .db 83,67,82,69,69,78,32,50,66,32,54,52,88,51,48,32,48,45,53,32,67,79,76,79,82,83,32,80,69,82,32,76,73,78,69,0
string12:
 .db 83,67,82,69,69,78,32,50,67,32,54,52,88,51,48,32,49,54,32,67,79,76,79,82,83,0
string14:
 .db 83,67,82,69,69,78,32,51,65,32,49,57,50,88,49,48,52,32,83,80,67,32,65,84,84,82,0
string15:
 .db 83,67,82,69,69,78,32,51,66,32,49,57,50,88,49,48,52,32,48,45,53,0
string13:
 .db 128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,32,128,0
string5:
 .db 128,63,127,123,68,129,63,127,123,68,132,63,127,123,68,133,63,127,123,68,136,63,127,123,68,137,63,127,123,68,140,63,127,123,68,141,63,127,123,68,0
string4:
 .db 128,72,69,76,76,129,79,32,87,79,132,82,76,68,32,133,33,33,33,32,136,84,72,73,83,137,32,73,83,32,140,84,69,83,84,141,58,41,58,41,0
string2:
 .db 129,68,123,127,63,127,123,68,132,0
string0:
 .db 129,72,69,76,76,79,32,87,79,82,76,68,132,0
string3:
 .db 132,68,123,127,63,127,123,68,129,0
string1:
 .db 132,72,69,76,76,79,32,87,79,82,76,68,129,0
  .end
