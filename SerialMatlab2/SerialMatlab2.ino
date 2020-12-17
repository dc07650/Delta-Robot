#include <arDynamixel.h>

#define pi 3.141592
#define DEBUG false

arDynamixel go(4, 57600);

void motorControl(int alpha, int beta, int gamma);
double alpha, beta, gamma;
double old_alpha, old_beta, old_gamma;

String inString = "";

int pos = 45;

void setup() {
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  delay(1000);

  go.speedPacket(0xFE, 200);
  go.posPacket(0xFE, pos * (256 / 75) + 512);
  delay(1000);

  Serial.begin(9600);
  Serial.println('a');
  char a = 'b';
  while (a != 'a')
  {
    a = Serial.read();
  }

}

char letter, dump;

void loop() {
  // Read serial input:
  while (Serial.available() > 0)
  {
    alpha = Serial.parseFloat();
    beta = Serial.parseFloat();
    gamma = Serial.parseFloat();
    Serial.print(alpha);
    Serial.print("  ");
    Serial.print(beta);
    Serial.print("  ");
    Serial.print(gamma);
    Serial.print("  ");
    letter = Serial.read();
    dump = Serial.read();
    Serial.println(letter);
    switch (letter)
    {
      case 'w':
        go.offServo(0xFE, 1);
        motorControl(alpha * (256 / 75) + 512, beta * (256 / 75) + 512, gamma * (256 / 75) + 512);
        break;
      case 'q':
        go.offServo(0xFE, 0);
        break;
        
      default:
        for ( int i = 0; i < 4; i++) {
          dump = Serial.read();
        }
        
    }
    Serial.flush();
  }
  
}

void motorControl(int alpha, int beta, int gamma)
{
  //if (alpha != old_alpha) {
    go.posPacket(0x01, alpha);
    old_alpha = alpha;
  //}
  //if (beta != old_beta) {
    go.posPacket(0x02, beta);
    old_beta = beta;
  //}
  //if (gamma != old_gamma) {
    go.posPacket(0x03, gamma);
    old_gamma = gamma;
  //}
}
