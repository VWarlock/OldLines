#include <mem.h>
#include <apogey/video.h>
#include <apogey/bios.h>
#include "gprint.h"

void test(uchar apogeyVideoHeight) {
  uchar i;
  for(i=1; i<apogeyVideoHeight; i++) {
    print(i,i,"\x81HELLO WORLD\x84");
    print(64-16-i,i,"\x84HELLO WORLD\x81");
  }
  getch();
}

void gtest(uchar apogeyVideoHeight) {
  uchar i;
  for(i=3; i<apogeyVideoHeight; i++) {
    print(i,i,"\x81\x44\x7B\x7F\x3F\x7F\x7B\x44\x84");
    print(64-11-i,i,"\x84\x44\x7B\x7F\x3F\x7F\x7B\x44\x81");
  }
  getch();
}


void test16(uchar apogeyVideoHeight) {
  uchar i;
  for(i=1; i<apogeyVideoHeight; i++) {
    print(0,i,"\x80HELL\x81O WO\x84RLD \x85!!! \x88THIS\x89 IS \x8CTEST\x8D:):)");
    print(40,i,"\x80HELL\x81O WO\x84RLD \x85!!! \x88THIS\x89 IS \x8CTEST\x8D:):)");
  }
  getch();
}

void gtest16(uchar apogeyVideoHeight) {
  uchar i;
  for(i=3; i<apogeyVideoHeight; i++) {
    print(0,i,"\x80\x3F\x7F\x7B\x44\x81\x3F\x7F\x7B\x44\x84\x3F\x7F\x7B\x44\x85\x3F\x7F\x7B\x44\x88\x3F\x7F\x7B\x44\x89\x3F\x7F\x7B\x44\x8C\x3F\x7F\x7B\x44\x8D\x3F\x7F\x7B\x44");
    print(40,i,"\x80\x3F\x7F\x7B\x44\x81\x3F\x7F\x7B\x44\x84\x3F\x7F\x7B\x44\x85\x3F\x7F\x7B\x44\x88\x3F\x7F\x7B\x44\x89\x3F\x7F\x7B\x44\x8C\x3F\x7F\x7B\x44\x8D\x3F\x7F\x7B\x44");
  }
  getch();
}

void main() {          
  while(1) {
    apogeyScreen0(); 
    print(0,0,"SCREEN 0 64X25 50HZ SPACE ATTR");
    test(25);

    apogeyScreen0B(); 
    print(0,0,"SCREEN 0B 64X25 50HZ");
    test(25);

    apogeyScreen1();
    print(0,0,"SCREEN 1 64X25 60HZ SPACE ATTR");
    test(25);    

    apogeyScreen1B();
    print(0,0,"SCREEN 1B 64X25 60HZ");
    test(25);

    apogeyScreen2A();
    print(0,0,"SCREEN 2A 64X30 0-2 COLORS PER LINE");
    test(31);    

    apogeyScreen2B();
    print(0,0,"SCREEN 2B 64X30 0-5 COLORS PER LINE");
    test(31);

    apogeyScreen2C();
    print(0,0,"SCREEN 2C 64X30 16 COLORS");
    print(32,0,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
    test16(31);

    apogeyScreen3A();
    gprint(0, 0, "SCREEN 3A 192X104 SPC ATTR");
    gtest(51);    

    apogeyScreen3B();
    gprint(0, 0, "SCREEN 3B 192X104 0-5");
    gtest(51);

    apogeyScreen3C();
    print(32,0,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
    print(32,1,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
    print(32,2,"\x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80 \x80");
    gprint(0, 0, "3C 192X104 16");
    gtest16(51);
  }
}