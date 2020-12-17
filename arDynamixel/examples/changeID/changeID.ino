#include <arDynamixel.h>

arDynamixel go(4, 57600);

void setup() {
  pinMode(13, OUTPUT);
  go.setnewId(0xFE, 1);
}

void loop() {
  
  go.setnewId(0xF0, 0x01);
  
  go.speedPacket(0x01, 200);
  go.posPacket(0x01, 512);
  digitalWrite(13, HIGH);
  delay(500);
  go.posPacket(0x01, 412);
  digitalWrite(13, LOW);
  delay(500);
  
  go.setnewId(0x01, 0x05);

  go.speedPacket(0x05, 200);
  go.posPacket(0x05, 512);
  digitalWrite(13, HIGH);
  delay(500);
  go.posPacket(0x05, 412);
  digitalWrite(13, LOW);
  delay(500);
  
  go.setnewId(0x05, 0xF0);

  go.speedPacket(0x0D, 200);
  go.posPacket(0x0D, 512);
  digitalWrite(13, HIGH);
  delay(500);
  go.posPacket(0x0D, 412);
  digitalWrite(13, LOW);
  delay(500);
  
  
}
