#include <mem.h>
#include <apogey/video.h>
#include <apogey/bios.h>

void test(uchar apogeyVideoHeight) {
  uchar i;
  for(i=0; i<apogeyVideoHeight; i++) {
    print(i,i,"\x81HELLO WORLD");
    print(64-12-i,i,"\x84HELLO WORLD");
//    print(i,i,"HELLO WORLD");
//    print(64-12-i,i,"HELLO WORLD");
  }
  getch();
}

void test16(uchar apogeyVideoHeight) {
  uchar i,j;
  for(i=0; i<apogeyVideoHeight; i++) {
    for(j=0; j<16*5; j+=40) {      
      print(j,i,"\x80HELL\x81O WO\x84RLD \x85!!! \x88THIS\x89 IS \x8CTEST\x8D:):)");
    }
  }
  getch();
}

void main() {          
  while(1) {
    apogeyScreen0(); 
    test(25);
    apogeyScreen0B(); 
    test(25);
    apogeyScreen1();
    test(25);    
    apogeyScreen1B();
    test(25);
    apogeyScreen2A();
    test(31);    
    apogeyScreen2B();
    test(31);
    apogeyScreen2C();
    test16(31);
    apogeyScreen3A();
    test(51);    
    apogeyScreen3B();
    test(51);
    apogeyScreen3C();
    test16(51);
  }

  // Показать цвет
  // Показать BPL=94
}