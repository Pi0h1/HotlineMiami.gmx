////// Returns the bitmask of a button as word
// Argument0: keyId
//      DPad Up = 1
//      DPad Down = 2
//      DPad Left = 3
//      DPad Right = 4
//      Start = 5
//      Back = 6
//      Left Thumbstick = 7
//      Right Thumbstick = 8
//      Left Shoulder = 9
//      Right Shoulder = 10
//      A = 11
//      B = 12
//      X = 13
//      Y = 14

switch(argument0)
{
    case 1: return 1;
    case 2: return 2;
    case 3: return 4;
    case 4: return 8;
    case 5: return 16;
    case 6: return 32;
    case 7: return 64;
    case 8: return 128;
    case 9: return 256;
    case 10: return 512;
    case 11: return 4096;
    case 12: return 8192;
    case 13: return 16384;
    case 14: return 32768;
}

// WORD wButtons
//
//#define XINPUT_GAMEPAD_DPAD_UP 0x00000001
//#define XINPUT_GAMEPAD_DPAD_DOWN 0x00000002
//#define XINPUT_GAMEPAD_DPAD_LEFT 0x00000004
//#define XINPUT_GAMEPAD_DPAD_RIGHT 0x00000008
//#define XINPUT_GAMEPAD_START 0x00000010
//#define XINPUT_GAMEPAD_BACK 0x00000020
//#define XINPUT_GAMEPAD_LEFT_THUMB 0x00000040
//#define XINPUT_GAMEPAD_RIGHT_THUMB 0x00000080
//#define XINPUT_GAMEPAD_LEFT_SHOULDER 0x0100
//#define XINPUT_GAMEPAD_RIGHT_SHOULDER 0x0200
//#define XINPUT_GAMEPAD_A 0x1000
//#define XINPUT_GAMEPAD_B 0x2000
//#define XINPUT_GAMEPAD_X 0x4000
//#define XINPUT_GAMEPAD_Y 0x8000
