/*
arDynmixel.h - Library for Dynamixel Smart Servo
March 12th, 2018
Version 1.1
Made by Aqua Light (email: element7046@gmail.com)
*/

#ifndef arDynamixel_H
#define arDynamixel_H

#include "Arduino.h"
#include "..\arDynamixel\SSWHD.h"


class arDynamixel {
	
	public:
		
		arDynamixel(uint8_t, uint32_t);
		
		//Servo syncro functions
		void dynaControl(uint8_t id, int16_t angle, int16_t speed);

		//Servo control functions
		void posPacket(uint8_t id, int16_t angle);
		void speedPacket(uint8_t id,  uint16_t speed);
		void offServo(uint8_t id, uint8_t on);
		void ledServo(uint8_t id, uint8_t light);
		
		//Servo setting functions
		void setnewId (uint8_t id,  uint8_t newid);
 		
		//Servo reading functions
		virtual int traceID  (uint8_t id);
		virtual int tracePos (uint8_t id);
		virtual int traceTemp(uint8_t id);
		virtual int traceLoad (uint8_t id);
		
		
	private:
		SoftwareSerialWithHalfDuplex _debugPort;
		uint8_t Module_ID = 0;
		uint8_t Length = 0;
		uint8_t Error = 0;
		uint8_t Instruction = 0;
		uint8_t Parameter1 = 0;
		uint8_t Parameter2 = 0;
		uint8_t Parameter3 = 0;
		uint8_t CheckSum = 0;
		uint8_t Address = 0;
		uint8_t rLength = 0;
		
		int _speed = 0;
};

#ifdef int
#undef int
#undef char
#undef long
#undef byte
#undef float
#undef abs
#undef round
#endif
#endif
