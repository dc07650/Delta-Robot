#include <arDynamixel.h>

arDynamixel go(4, 57600);

void setup() {
  pinMode(13, OUTPUT);
}

void loop() {
  
  go.ledServo(0xFE, 0);
  digitalWrite(13, HIGH);
  delay(500);
  
  go.ledServo(0xFE, 1);
  digitalWrite(13, LOW);
  delay(500);
  
}
