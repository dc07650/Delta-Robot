#include <arDynamixel.h>

arDynamixel go(4, 57600);

int rec[4];

void setup() {
  Serial.begin(9600);

  go.setnewId(0xFE, 0x01);
  go.ledServo(0x01, 1);
  delay(100);
  go.ledServo(0x01, 0);
}

void loop() {

  rec[0] = go.traceID(1);
  rec[1] = go.tracePos(1);
  rec[2] = go.traceTemp(1);
  rec[3] = go.traceLoad(1);
  Serial.print("ID: ");
  Serial.print(rec[0]);
  Serial.print(" Pos: ");
  Serial.print(rec[1]);
  Serial.print(" Temp: ");
  Serial.print(rec[2]);
  Serial.print(" Load: ");
  Serial.print(rec[3]);
  Serial.println(" "); 
  
}
