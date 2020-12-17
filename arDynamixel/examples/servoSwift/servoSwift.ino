#include <arDynamixel.h>

arDynamixel go(4, 57600);

int pos = 512;

void setup() {

  go.speedPacket(0xFE, 200);
  go.posPacket(0xFE, pos);
  
}

void loop() {

  while(pos<1023){
    go.posPacket(0xFE, pos);
    pos++;
    delay(2);
  }

  delay(100);
  
  while(pos>0){
    go.posPacket(0xFE, pos);
    pos--;
    delay(2);
  }

  delay(100);
  
}
