#include <arDynamixel.h>

arDynamixel go(4, 57600);

void setup() {
  pinMode(13, OUTPUT);

  digitalWrite(13, HIGH);
  go.speedPacket(0xFE, 200);
  go.posPacket(0xFE, 512);
  delay(1000);
  go.speedPacket(0xFE, 200);
  go.posPacket(0xFE, 412);
  delay(1000);
}

void loop() {
  
  go.offServo(0xFE, 0);
  digitalWrite(13, LOW);
  delay(3000);
  
  go.offServo(0xFE, 1);
  digitalWrite(13, HIGH);
  delay(3000);
  
}
