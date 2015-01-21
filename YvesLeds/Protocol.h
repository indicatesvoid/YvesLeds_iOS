//
//  Protocol.h
//  YvesLeds
//
//  Created by William Clark on 1/13/15.
//  Copyright (c) 2015 William Clark. All rights reserved.
//

#ifndef YvesLeds_Protocol_h
#define YvesLeds_Protocol_h

// 4 byte packet size:
//  • 1 byte opcode
//  • 3 bytes argument (e.g. R, G, B)
// may add checksum byte(s) later depending on transmission reliability
#define PACKET_SIZE 4

// must match with code on Teensy
typedef enum Opcode {
    SET_MODE = 0xFF,
    SET_MODE_PARAMETER = 0x01, // second byte will define parameter, following 1-2 bytes for value
    SET_COLOR = 0x0C,
    SET_TIME = 0x02,
} Opcode;

typedef enum Mode {
    ALL_ON = 0x00
    SCAN = 0x01,
    PULSE = 0x02
} Mode;

typedef enum Parameter {
    LENGTH = 0x01,
    SPEED = 0x02
} Parameter;

#endif
