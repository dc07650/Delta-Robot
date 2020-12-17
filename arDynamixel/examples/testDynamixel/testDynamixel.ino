#include <arDynamixel.h>


int dat[4];

arDynamixel recall(4, 57600);


void setup() {
  Serial.begin(9600);
  recall.ledServo(0xFE, 0);
  recall.speedPacket(0xFE, 200);
  recall.posPacket(0xFE, 512);
  delay(1000);
  recall.ledServo(0xFE, 1);
  recall.speedPacket(0xFE, 200);
  recall.posPacket(0xFE, 412);
  delay(1000);
  recall.ledServo(0xFE, 0);
  recall.speedPacket(0xFE, 200);
  recall.posPacket(0xFE, 512);
  delay(1000);
  recall.setnewId(0xFE, 0x01);
  
  recall.ledServo(0xFE, 1);
  recall.speedPacket(0xFE, 200);
  recall.posPacket(0xFE, 412);
  delay(1000);
  recall.offServo(0xFE, 0);
}
void loop() {
  dat[0] = recall.traceID(1);
  dat[1] = recall.tracePos(1);
  dat[2] = recall.traceTemp(1);
  dat[3] = recall.traceLoad(1);
  for(int i = 0; i< 4; i++){
    Serial.print(dat[i]);
    Serial.print("\t");
  }
  Serial.println("");
  delay(10);
}


