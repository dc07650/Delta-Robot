/*
arDynmixel.h - Library for LSM-micro Servo
February 28th, 2018
Version 1.0
Made by Aqua Light (email: element7046@gmail.com)
*/

#include "Arduino.h"
#include "arDynamixel.h"
#include "..\arDynamixel\SSWHD.h"


arDynamixel::arDynamixel(uint8_t data, uint32_t sSpe)
	: _debugPort(data, data, false, false)
{
		_debugPort.begin(sSpe);
};

//Servo syncro functions
void arDynamixel::dynaControl(uint8_t id, int16_t angle, int16_t speed) {

	uint8_t Module_ID = id;
	uint8_t Length = 0x09;
	uint8_t Instruction = 0x83;
	uint8_t Address = 0x1E; //Starting with the position address to the speed address
	uint8_t Read_Length = 0x04;
	uint8_t CheckSum = ~(0xFE + Length + Instruction + Address + Read_Length + Module_ID + angle + (angle >> 8) + speed + (speed >>8) );

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(0xFE); //Broadcast ID
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(Read_Length);
	_debugPort.write(Module_ID);
	_debugPort.write(angle);
	_debugPort.write(angle >> 8);
	_debugPort.write(speed);
	_debugPort.write(speed>> 8);
	_debugPort.write(CheckSum);
	delay(2);
}


//Servo control functions

void arDynamixel::posPacket(uint8_t id, int16_t angle) {

	uint8_t Module_ID = id;
	uint8_t Length = 0x05;
	uint8_t Instruction = 0x03;
	uint8_t Address = 0x1E;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + angle + (angle >> 8));

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(angle);
	_debugPort.write(angle >> 8);
	_debugPort.write(CheckSum);
	delay(2);

}

void arDynamixel::speedPacket(uint8_t id, uint16_t speed) {

	uint8_t Module_ID = id;
	uint8_t Length = 0x05;
	uint8_t Instruction = 0x03;
	uint8_t Address = 0x20;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + speed + (speed >> 8));

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(speed);
	_debugPort.write(speed >> 8);
	_debugPort.write(CheckSum);
	delay(2);

}

void arDynamixel::offServo(uint8_t id, uint8_t on) {

	uint8_t Module_ID = id;
	uint8_t Length = 0x05;
	uint8_t Instruction = 0x03;
	uint8_t Address = 0x18;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + on + (on >> 8));

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(on);
	_debugPort.write(on >> 8);
	_debugPort.write(CheckSum);
	delay(2);

}

void arDynamixel::ledServo(uint8_t id, uint8_t light) {

	uint8_t Module_ID = id;
	uint8_t Length = 0x05;
	uint8_t Instruction = 0x03;
	uint8_t Address = 0x19;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + light + (light >> 8));

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(light);
	_debugPort.write(light >> 8);
	_debugPort.write(CheckSum);
	delay(2);

}

//Servo setting functions

void arDynamixel::setnewId(uint8_t id, uint8_t newid) {

	uint8_t Module_ID = id;
	uint8_t Length = 0x04;
	uint8_t Instruction = 0x03;
	uint8_t Address = 0x03;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + newid);

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(newid);
	_debugPort.write(CheckSum);
	delay(2);

}

//Servo reading functions

int arDynamixel::traceID(uint8_t id) {
	int16_t idData = 0;
	int16_t recP[8] = {};

	uint8_t Module_ID = id;
	uint8_t Length = 0x04;
	uint8_t Instruction = 0x02;
	uint8_t Address = 0x03;
	uint8_t rLength = 0x01;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + rLength);

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(rLength);
	_debugPort.write(CheckSum);
	delay(2);

	for (int i = 0; i < 8; i++) {
		while (_debugPort.available() < 0) {}
		recP[i] = int(_debugPort.read());
	}

	if (recP[0] == 0xFF && recP[1] == 0xFF && recP[2] == Module_ID) {
		idData = (recP[5]);
	}

	return idData;

}

int arDynamixel::tracePos(uint8_t id) {
	int16_t posData = 0;
	int16_t recP[8] = {};

	uint8_t Module_ID = id;
	uint8_t Length = 0x04;
	uint8_t Instruction = 0x02;
	uint8_t Address = 0x24;
	uint8_t rLength = 0x02;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + rLength);

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(rLength);
	_debugPort.write(CheckSum);
	delay(2);

	for (int i = 0; i < 8; i++) {
		while (_debugPort.available() < 0) {}
		recP[i] = int(_debugPort.read());
	}

	if (recP[0] == 0xFF && recP[1] == 0xFF && recP[2] == Module_ID) {
		posData = int(recP[5]) + int(recP[6] << 8);
	}

	return posData;

}

int arDynamixel::traceTemp(uint8_t id) {
	int16_t tempData = 0;
	int16_t recP[8] = {};

	uint8_t Module_ID = id;
	uint8_t Length = 0x04;
	uint8_t Instruction = 0x02;
	uint8_t Address = 0x2B;
	uint8_t rLength = 0x01;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + rLength);

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(rLength);
	_debugPort.write(CheckSum);
	delay(2);

	for (int i = 0; i < 8; i++) {
		while (_debugPort.available() < 0) {}
		recP[i] = int(_debugPort.read());
	}

	if (recP[0] == 0xFF && recP[1] == 0xFF && recP[2] == Module_ID) {
		tempData = (recP[5]);
	}

	return tempData;

}

int arDynamixel::traceLoad(uint8_t id) {
	int16_t loadData = 0;
	int16_t alp = 0;
	int16_t bet = 0;
	int16_t del = 0;

	int16_t recP[8] = {};

	uint8_t Module_ID = id;
	uint8_t Length = 0x04;
	uint8_t Instruction = 0x02;
	uint8_t Address = 0x28;
	uint8_t rLength = 0x02;
	uint8_t CheckSum = ~(Module_ID + Length + Instruction + Address + rLength);

	_debugPort.write(0xFF);
	_debugPort.write(0xFF);
	_debugPort.write(Module_ID);
	_debugPort.write(Length);
	_debugPort.write(Instruction);
	_debugPort.write(Address);
	_debugPort.write(rLength);
	_debugPort.write(CheckSum);
	delay(2);

	for (int i = 0; i < 8; i++) {
		while (_debugPort.available() < 0) {}
		recP[i] = int(_debugPort.read());
	}

	if (recP[0] == 0xFF && recP[1] == 0xFF && recP[2] == Module_ID) {
		bet = int(recP[5]) + int(((recP[6] & 3)) << 8);
	}
	
	del = bet;

	alp = recP[6] >> 2;

	if (alp == 0) {  //Load value changed depending on the direction data bit
			del = bet*(-1);
	}
		

	loadData = del;

	for (int j = 0; j<8; j++) { //reinitialize buffer
		recP[j] = 0;
	}

	return loadData;

}


