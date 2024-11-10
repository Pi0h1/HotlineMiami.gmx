//{{NO_DEPENDENCIES}}
// Microsoft Visual C++ generated include file.
// Used by window_resize_fix.rc

// Next default values for new objects
// 
#ifdef APSTUDIO_INVOKED
#ifndef APSTUDIO_READONLY_SYMBOLS
#define _APS_NEXT_RESOURCE_VALUE        101
#define _APS_NEXT_COMMAND_VALUE         40001
#define _APS_NEXT_CONTROL_VALUE         1001
#define _APS_NEXT_SYMED_VALUE           101
#endif
#endif
// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#ifdef _WINDOWS
	#include "targetver.h"
	
	#define WIN32_LEAN_AND_MEAN // Exclude rarely-used stuff from Windows headers
	#include <windows.h>
#endif

#define _trace // requires user32.lib;Kernel32.lib

#ifdef _trace
#ifdef _WINDOWS
void trace(const char* format, ...);
#else
#define trace(...) { printf("[window_resize_fix:%d] ", __LINE__); printf(__VA_ARGS__); printf("\n"); fflush(stdout); }
#endif
#endif

#if defined(_WINDOWS)
#define dllx extern "C" __declspec(dllexport)
#elif defined(GNUC)
#define dllx extern "C" __attribute__ ((visibility("default"))) 
#else
#define dllx extern "C"
#endif

#include <stdint.h>
typedef uint8_t byte;
typedef bool(GR_D3D_Reset_t)();

// TODO: reference additional headers your program requires here#pragma once

// Including SDKDDKVer.h defines the highest available Windows platform.

// If you wish to build your application for a previous Windows platform, include WinSDKVer.h and
// set the _WIN32_WINNT macro to the platform you wish to support before including SDKDDKVer.h.

#include <SDKDDKVer.h>
#pragma once
#include "stdafx.h"
uint32_t x86size(const byte* pc);
namespace MemTools {
	inline const void* readPtr(const byte* at) {
		return (const void*)*(uint32_t*)at;
	}
	const void* readLEPtr(const void* at);
	const void* readLERPtr(const void* at, const void* anchor);
	inline const void* readRCall(const byte* start) {
		return readLERPtr(start + 1, start + 5);
	}
}
enum x86op {
	x86_rcall = 0xE8,
	x86_rjmp = 0xE9,
	x86_break = 0xCC,
	x86_return = 0xC3,
};
inline bool x86_is_eof(const byte op) {
	return op == x86_break;
}
inline bool x86_is_call(const byte op) {
	return op == x86_rcall || op == x86_rjmp;
}
const byte* x86_find_call_pos(const byte* start, size_t max, const void* call);
const void* x86_find_call_after(const byte* start, size_t max, const void* call);
const void* x86_find_call_before(const byte* start, size_t max, const void* call);
const void* x86_find_call_with_count(const byte* start, size_t max, int count);
const void* x86_find_first_call(const byte* start, size_t max);
const void* x86_find_last_call(const byte* start, size_t max);
int x86_count_call(const byte* start, size_t max, const void* call);
#define x86_stepover(p) {\
	auto n = x86size(p);\
	if (n == 0) return x86_dunno;\
	p += n;\
}
#define x86_dunno std::string("Can't parse instruction (see output)")// stdafx.cpp : source file that includes just the standard includes
// window_resize_fix.pch will be the pre-compiled header
// stdafx.obj will contain the pre-compiled type information

#include "stdafx.h"
#include <strsafe.h>

#if _WINDOWS
// http://computer-programming-forum.com/7-vc.net/07649664cea3e3d7.htm
extern "C" int _fltused = 0;
#endif

// TODO: reference any additional headers you need in STDAFX.H
// and not in this file
#ifdef _trace
#ifdef _WINDOWS
// https://yal.cc/printf-without-standard-library/
void trace(const char* pszFormat, ...) {
	char buf[1025];
	va_list argList;
	va_start(argList, pszFormat);
	wvsprintfA(buf, pszFormat, argList);
	va_end(argList);
	DWORD done;
	auto len = strlen(buf);
	buf[len] = '\n';
	buf[++len] = 0;
	WriteFile(GetStdHandle(STD_OUTPUT_HANDLE), buf, len, &done, NULL);
}
#endif
#endif
/// @author YellowAfterlife

#include "stdafx.h"
#include "x86size.h"

bool isGMS2;

struct GMLClosure {
	int __unknown[26];
	const byte* impl;
};

#if 0
struct GMLVar {
	union {
		int32_t vInt32;
		int64_t vInt64;
		double vReal;
	};
	int32_t flags = 0;
	int32_t type;
};
#define __GMLFuncArgs__ GMLVar& result, void* self, void* other, int argc, GMLVar* argv
#define __GMLFuncRest__ result, self, other, argc, argv
typedef void(GmlFunc)(__GMLFuncArgs__);

GmlFunc* f_draw_enable_drawevent = nullptr;
void draw_enable_drawevent(bool enable) {
	if (!f_draw_enable_drawevent) return;
	GMLVar result, arg;
	result.type = 0;
	result.vReal = 0;
	arg.type = 0;
	arg.vReal = enable ? 1 : 0;
	f_draw_enable_drawevent(result, nullptr, nullptr, 1, &arg);
}
#endif

int32_t* g_doReset = 0;

GR_D3D_Reset_t* GR_D3D_Reset = nullptr;
dllx double window_resize_fix_reset() {
	if (GR_D3D_Reset) {
		GR_D3D_Reset();
		return true;
	} else return false;
}

void window_command_proc_init(HWND hwnd);

dllx double window_resize_fix_init_raw(
	GMLClosure* _window_set_fullscreen,
	GMLClosure* _display_set_size,
	void* _hwnd,
	double v2
) {
	isGMS2 = v2 > 1.5;
	if (g_doReset != nullptr) return true;
	if (_window_set_fullscreen == nullptr) return false;
	//f_draw_enable_drawevent = (GmlFunc*)_draw_enable_drawevent->impl;
	auto _ptr = _window_set_fullscreen->impl;
	auto impl = (const byte*)x86_find_last_call(_ptr, 128);
	auto at = impl;
	auto lastAt = at;
	while (at < impl + 128) {
		if (x86_is_eof(*at)) break;
		if (*at == x86_return) break;
		lastAt = at;
		auto atn = x86size(at);
		if (atn == 0) return false;
		at += atn;
	}
	g_doReset = (int32_t*)MemTools::readLEPtr(lastAt + 2);
	trace("Reset counter located at %llx", (int64_t)g_doReset);
	//
	GR_D3D_Reset = (GR_D3D_Reset_t*)x86_find_last_call(_display_set_size->impl, 256);
	trace("D3D reset located at %llx", (int64_t)GR_D3D_Reset);
	//
	window_command_proc_init((HWND)_hwnd);
	return true;
}#include "stdafx.h"
extern int32_t* g_doReset;
extern GR_D3D_Reset_t* GR_D3D_Reset;
extern bool isGMS2;

#define RECTW(r) (r.right - r.left)
#define RECTH(r) (r.bottom - r.top)
#define RECTP(r) r.left, r.top, r.right - r.left, r.bottom - r.top

void draw_enable_drawevent(bool enable);

///
enum class window_resize_fix_mode {
	copy,
	stretch_aspect,
	stretch_full,
};
struct {
	bool enable = true;
	window_resize_fix_mode mode = window_resize_fix_mode::stretch_aspect;
	double width = 4;
	double height = 3;
	HBRUSH background = NULL;
} config;

struct {
	HBITMAP bitmap = NULL;
	bool sizing = false;
	HDC bitHDC = NULL;
	RECT bitRect{};
	bool justResized = false;
} static state;

WNDPROC window_command_proc_base = nullptr;
LRESULT window_command_proc_hook(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam) {
	//printf("msg=%d\n", msg); fflush(stdout);
	if (config.background == NULL) {
		config.background = CreateSolidBrush(RGB(0, 0, 0));
	}
	switch (msg) {
		case WM_SIZING: {
			if (!state.sizing && config.enable) {
				static HDC screen = nullptr;
				if (!screen) {
					screen = GetDC(NULL);
					state.bitHDC = CreateCompatibleDC(screen);
				}
				if (state.bitmap != NULL) {
					DeleteObject(state.bitmap);
					state.bitmap = NULL;
				}
				GetClientRect(hwnd, &state.bitRect);
				if (config.mode == window_resize_fix_mode::stretch_aspect) {
					auto wndW = RECTW(state.bitRect);
					auto wndH = RECTH(state.bitRect);
					auto scrW = config.width;
					auto scrH = config.height;
					auto scale = min((double)wndW / scrW, (double)wndH / scrH);
					auto dstW = (int)(scrW * scale);
					auto dstH = (int)(scrH * scale);
					auto dstX = (wndW - dstW) / 2;
					auto dstY = (wndH - dstH) / 2;
					state.bitRect.left += dstX;
					state.bitRect.top += dstY;
					state.bitRect.right = state.bitRect.left + dstW;
					state.bitRect.bottom = state.bitRect.top + dstH;

					//trace("wnd=(%d, %d) scr=(%d, %d)", wndW, wndH, (int)scrW, (int)scrH);
					//trace("dst=(%d, %d, %d, %d)", dstX, dstY, dstW, dstH)
					//trace("state.bitRect=(%d, %d, %d, %d)", RECTP(state.bitRect));
				}
				state.bitmap = CreateCompatibleBitmap(screen, RECTW(state.bitRect), RECTH(state.bitRect));
				SelectObject(state.bitHDC, state.bitmap);
				FillRect(state.bitHDC, &state.bitRect, config.background);
				//PrintWindow(hwnd, lastBitHDC, 0);
				POINT windowPos{ 0, 0 };
				ClientToScreen(hwnd, &windowPos);
				BitBlt(state.bitHDC, 0, 0, RECTW(state.bitRect), RECTH(state.bitRect),
					screen, windowPos.x + state.bitRect.left, windowPos.y + state.bitRect.top, SRCCOPY);
				//
				state.bitRect.right -= state.bitRect.left;
				state.bitRect.bottom -= state.bitRect.top;
				state.bitRect.left = 0;
				state.bitRect.top = 0;
				state.sizing = true;
				//trace("resize start");
			}
			break;
		};
		case WM_EXITSIZEMOVE: {
			state.sizing = false;
			state.justResized = true;
			if (isGMS2 && config.enable) GR_D3D_Reset();
			//draw_enable_drawevent(false);
			//trace("resize end");
			break;
		};
		case WM_ERASEBKGND: {
			if (config.enable && state.sizing && state.bitmap) {
				RECT cr; GetClientRect(hwnd, &cr);
				if (0) trace("resize draw %d,%d %d;%d %d,%d %d;%d",
					cr.left, cr.top, RECTW(cr), RECTH(cr),
					state.bitRect.left, state.bitRect.top, RECTW(state.bitRect), RECTH(state.bitRect));
				auto hdc = (HDC)wParam;
				auto mode = config.mode;
				auto crW = RECTW(cr);
				auto crH = RECTH(cr);
				auto scrW = RECTW(state.bitRect);
				auto scrH = RECTH(state.bitRect);
				auto scrX = state.bitRect.left;
				auto scrY = state.bitRect.top;
				FillRect(hdc, &cr, config.background);
				if (mode == window_resize_fix_mode::stretch_aspect) {
					auto scale = min((double)crW / scrW, (double)crH / scrH);
					auto dstW = (int)(scale * scrW);
					auto dstH = (int)(scale * scrH);
					auto dstX = (crW - dstW) / 2;
					auto dstY = (crH - dstH) / 2;
					if (0) trace("src=(%d, %d, %d, %d) cr=(%d, %d) dst=(%d, %d, %d, %d)",
						scrX, scrY, scrW, scrH, crW, crH,
						dstX, dstY, dstW, dstH);

					StretchBlt(hdc, dstX, dstY, dstW, dstH,
						state.bitHDC, scrX, scrY, scrW, scrH,
						SRCCOPY);
				} else if (mode == window_resize_fix_mode::stretch_full) {
					StretchBlt(hdc, 0, 0, crW, crH,
						state.bitHDC, scrX, scrY, scrW, scrH,
						SRCCOPY);
				} else {
					BitBlt(hdc, 0, 0, scrW, scrH, state.bitHDC, scrX, scrY, SRCCOPY);
				}
				return TRUE;
			}
			/*
			HDC hdc = (HDC)wParam;
			static HBRUSH background = CreateSolidBrush(RGB(80, 80, 80));
			RECT cr; GetClientRect(hwnd, &cr);
			SelectObject(hdc, background);
			FillRect(hdc, &cr, background);
			return TRUE;
			//*/
			break;
		};
	}
	auto result = CallWindowProc(window_command_proc_base, hwnd, msg, wParam, lParam);
	if (msg == WM_EXITSIZEMOVE && config.enable) {
		//trace("Resize end");
		if (*g_doReset > 1) *g_doReset = 1;
	}
	return result;
}

void window_command_proc_init(HWND hwnd) {
	window_command_proc_base = (WNDPROC)SetWindowLongPtr(hwnd, GWL_WNDPROC, (LONG_PTR)window_command_proc_hook);
}

/// ->bool
dllx double window_resize_fix_get_just_resized() {
	auto result = state.justResized;
	state.justResized = false;
	return result;
}

/// ->bool
dllx double window_resize_fix_get_enabled() {
	return config.enable && g_doReset != nullptr;
}

/// (enable:bool)
dllx double window_resize_fix_set_enabled(double enable) {
	config.enable = enable > 0.5;
	return 1;
}

/// (width:number, height:number)
dllx double window_resize_fix_set_aspect_ratio(double width, double height) {
	config.width = width;
	config.height = height;
	return 1;
}

///
dllx double window_resize_fix_set_mode(double mode) {
	config.mode = (window_resize_fix_mode)(int)mode;
	return 1;
}#include "x86size.h"
namespace MemTools {
	const void* readLEPtr(const void* at) {
		byte* ptr = 0;
		for (int i = 0; i < 4; i++) {
			ptr += (uint32_t)(*((const byte*)at + i)) << (i * 8);
		}
		return ptr;
	}
	const void* readLERPtr(const void* at, const void* anchor) {
		byte* ptr = 0;
		for (int i = 0; i < 4; i++) {
			ptr += (uint32_t)(*((const byte*)at + i)) << (i * 8);
		}
		return (const byte*)anchor + (int32_t)ptr;
	}
}

const void* x86_find_call_after(const byte* start, size_t max, const void* call) {
	auto p = start;
	auto till = p + max;
	auto next = false;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) {
			auto fn = MemTools::readRCall(p);
			if (next) {
				if (fn != call) return fn;
			} else {
				if (fn == call) next = true;
			}
		}
		auto n = x86size(p);
		if (n) p += n; else return nullptr;
	}
	return nullptr;
}

const byte* x86_find_call_pos(const byte* start, size_t max, const void* call) {
	auto p = start;
	auto till = p + max;
	auto next = false;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) {
			auto fn = MemTools::readRCall(p);
			if (fn == call) return p;
		}
		auto n = x86size(p);
		if (n) p += n; else return nullptr;
	}
	return nullptr;
}

int x86_count_call(const byte* start, size_t max, const void* call) {
	auto p = start;
	auto till = p + max;
	auto next = false;
	int found = 0;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) {
			auto fn = MemTools::readRCall(p);
			if (fn == call) found++;
		}
		auto n = x86size(p);
		if (n) p += n; else return found;
	}
	return found;
}

const void* x86_find_call_with_count(const byte* start, size_t max, int count) {
	auto p = start;
	auto till = p + max;
	auto next = false;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) {
			auto fn = MemTools::readRCall(p);
			auto p1 = p;
			auto found = 0;
			while (p1 < till) {
				if (x86_is_eof(*p1)) break;
				if (x86_is_call(*p)) {
					if (MemTools::readRCall(p1) == fn) found++;
				}
				auto n1 = x86size(p1);
				if (n1) p1 += n1; else break;
			}
			if (found == count) return fn;
		}
		auto n = x86size(p);
		if (n) p += n; else return nullptr;
	}
	return nullptr;
}

const void* x86_find_call_before(const byte* start, size_t max, const void* call) {
	auto p = start;
	auto till = p + max;
	const void* last = nullptr;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) {
			auto fn = MemTools::readRCall(p);
			if (fn == call) return last;
			last = fn;
		}
		auto n = x86size(p);
		if (n) p += n; else return nullptr;
	}
	return nullptr;
}

const void* x86_find_first_call(const byte* start, size_t max) {
	auto p = start;
	auto till = p + max;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) return MemTools::readRCall(p);
		auto n = x86size(p);
		if (n) p += n; else return nullptr;
	}
	return nullptr;
}

const void* x86_find_last_call(const byte* start, size_t max) {
	auto p = start;
	auto till = p + max;
	const void* last = nullptr;
	while (p < till) {
		if (x86_is_eof(*p)) break;
		if (x86_is_call(*p)) {
			last = MemTools::readRCall(p);
		}
		auto n = x86size(p);
		if (n) p += n; else return nullptr;
	}
	return last;
}

/* (C) Copyright 2012-2014 Semantic Designs, Inc.
   You may freely use this code provided you retain this copyright message
*/
uint32_t x86size(const byte* pc)
{ // returns length of instruction at PC
	uint32_t length = 0;
	uint32_t opcode, opcode2;
	uint32_t modrm;
	uint32_t sib;
	const byte* p = pc;

	while (true)
	{  // scan across prefix bytes
		opcode = *p++;
		switch (opcode)
		{
			case 0x64: case 0x65: // FS: GS: prefixes
			case 0x36: // SS: prefix
			case 0x66: case 0x67: // operand size overrides
			case 0xF0: case 0xF2: // LOCK, REPNE prefixes
				length++;
				break;
			case 0x2E: // CS: prefix, used as HNT prefix on jumps
			case 0x3E: // DS: prefix, used as HT prefix on jumps
				length++;
				// goto process relative jmp // tighter check possible here
				break;
			default:
				goto process_instruction_body;
		}
	}

	process_instruction_body:
	switch (opcode) // switch on main opcode
	{
		// ONE byte OPCODE, move to next opcode without remark
		case 0x27: case 0x2F:
		case 0x37: case 0x3F:
		case 0x40: case 0x41: case 0x42: case 0x43: case 0x44: case 0x45: case 0x46: case 0x47:
		case 0x48: case 0x49: case 0x4A: case 0x4B: case 0x4C: case 0x4D: case 0x4E: case 0x4F:
		case 0x50: case 0x51: case 0x52: case 0x53: case 0x54: case 0x55: case 0x56: case 0x57:
		case 0x58: case 0x59: case 0x5A: case 0x5B: case 0x5C: case 0x5D: case 0x5E: case 0x5F:
		case 0x90: // nop
		case 0x91: case 0x92: case 0x93: case 0x94: case 0x95: case 0x96: case 0x97: // xchg
		case 0x98: case 0x99:
		case 0x9C: case 0x9D: case 0x9E: case 0x9F:
		case 0xA4: case 0xA5: case 0xA6: case 0xA7: case 0xAA: case 0xAB: // string operators
		case 0xAC: case 0xAD: case 0xAE: case 0xAF:
			/* case 0xC3: // RET handled elsewhere */
		case 0xC9:
		case 0xCC: // int3
		case 0xF5: case 0xF8: case 0xF9: case 0xFC: case 0xFD:
		case 0xA8: // +y: test
		case 0x06: // +y: push ES
			return length + 1; // include opcode

		case 0xC3: // RET
			return length + 1; // +y: we don't strictly care, we stop at 0xCC?
			if (*p++ != 0xCC)
				return length + 1;
			if (*p++ != 0xCC)
				return length + 2;
			if (*p++ == 0xCC
				&& *p++ == 0xCC)
				return length + 5;
			goto error;

			// TWO byte INSTRUCTION
		case 0x04: case 0x0C: case 0x14: case 0x1C: case 0x24: case 0x2C: case 0x34: case 0x3C:
		case 0x6A:
		case 0xB0: case 0xB1: case 0xB2: case 0xB3: case 0xB4: case 0xB5: case 0xB6: case 0xB7:
		case 0xC2:
		case 0xD8: // +y: Is FCOMP always 2 bytes?
			return length + 2;

			// TWO byte RELATIVE BRANCH
		case 0x70: case 0x71: case 0x72: case 0x73: case 0x74: case 0x75: case 0x76: case 0x77:
		case 0x78: case 0x79: case 0x7A: case 0x7B: case 0x7C: case 0x7D: case 0x7E: case 0x7F:
		case 0xE0: case 0xE1: case 0xE2: case 0xE3: case 0xEB:
			return length + 2;

			// THREE byte INSTRUCTION (NONE!)

		// FIVE byte INSTRUCTION:
		case 0x05: case 0x0D: case 0x15: case 0x1D:
		case 0x25: case 0x2D: case 0x35: case 0x3D:
		case 0x68:
		case 0xA9:
		case 0xB8: case 0xB9: case 0xBA: case 0xBB: case 0xBC: case 0xBD: case 0xBE: case 0xBF:
			return length + 5;

			// FIVE byte RELATIVE CALL
		case 0xE8:
			return length + 5;

			// FIVE byte RELATIVE BRANCH
		case 0xE9:
			if (p[4] == 0xCC)
				return length + 6; // <jmp near ptr ...  int 3>
			return length + 5; // plain <jmp near ptr>

		  // FIVE byte DIRECT ADDRESS
		case 0xA1: case 0xA2: case 0xA3: // MOV AL,AX,EAX moffset...
		case 0xA0: // +y: boy, more MOV!
			return length + 5;
			break;

			// ModR/M with no immediate operand
		case 0x00: case 0x01: case 0x02: case 0x03: case 0x08: case 0x09: case 0x0A: case 0x0B:
		case 0x10: case 0x11: case 0x12: case 0x13: case 0x18: case 0x19: case 0x1A: case 0x1B:
		case 0x20: case 0x21: case 0x22: case 0x23: case 0x28: case 0x29: case 0x2A: case 0x2B:
		case 0x30: case 0x31: case 0x32: case 0x33: case 0x38: case 0x39: case 0x3A: case 0x3B:
		case 0x84: case 0x85: case 0x86: case 0x87: case 0x88: case 0x89: case 0x8A: case 0x8B: case 0x8D: case 0x8F:
		case 0xD1: case 0xD2: case 0xD3:
		case 0xFE: case 0xFF: // misinterprets JMP far and CALL far, not worth fixing
			length++; // count opcode
			goto modrm;

			// ModR/M with immediate 8 bit value
		case 0x80: case 0x82: case 0x83:
		case 0xC0: case 0xC1:
		case 0xC6:  // with r=0?
		case 0x6B: // +y: imul
			length += 2; // count opcode and immediate byte
			goto modrm;

			// ModR/M with immediate 32 bit value
		case 0x81:
		case 0xC7:  // with r=0?
		case 0x69: // +y: other imul
			length += 5; // count opcode and immediate byte
			goto modrm;

		case 0x9B: // FSTSW AX = 9B DF E0
			if (*p++ == 0xDF)
			{
				if (*p++ == 0xE0)
					return length + 3;
				trace("InstructionLength: Unimplemented 0x9B tertiary opcode %2x at %x", *p, (uint32_t)p);
				goto error;
			} else {
				trace("InstructionLength: Unimplemented 0x9B secondary opcode %2x at %x", *p, (uint32_t)p);
				goto error;
			}

		case 0xD9: // various FP instructions
			modrm = *p++;
			length++; //  account for FP prefix
			switch (modrm)
			{
				case 0xC9: case 0xD0:
				case 0xE0: case 0xE1: case 0xE4: case 0xE5:
				case 0xE8: case 0xE9: case 0xEA: case 0xEB: case 0xEC: case 0xED: case 0xEE:
				case 0xF8: case 0xF9: case 0xFA: case 0xFB: case 0xFC: case 0xFD: case 0xFE: case 0xFF:
					return length + 1;
				default:  // r bits matter if not one of the above specific opcodes
					switch ((modrm & 0x38) >> 3)
					{
						case 0: goto modrm_fetched;  // fld
						case 1: return length + 1; // fxch
						case 2: goto modrm_fetched; // fst
						case 3: goto modrm_fetched; // fstp
						case 4: goto modrm_fetched; // fldenv
						case 5: goto modrm_fetched; // fldcw
						case 6: goto modrm_fetched; // fnstenv
						case 7: goto modrm_fetched; // fnstcw
					}
					goto error; // unrecognized 2nd byte
			}

		case 0xDB: // various FP instructions
			modrm = *p++;
			length++; //  account for FP prefix
			switch (modrm)
			{
				case 0xE3:
					return length + 1;
				default:  // r bits matter if not one of the above specific opcodes
					#if 1 // +y: if this was 0-ed, does that mean it's bad?
					switch ((modrm & 0x38) >> 3)
					{
						case 0: goto modrm_fetched;  // fld
						case 1: return length + 1; // fxch
						case 2: goto modrm_fetched; // fst
						case 3: goto modrm_fetched; // fstp
						case 4: goto modrm_fetched; // fldenv
						case 5: goto modrm_fetched; // fldcw
						case 6: goto modrm_fetched; // fnstenv
						case 7: goto modrm_fetched; // fnstcw
					}
					#endif
					goto error; // unrecognized 2nd byte
			}

		case 0xDC: { // +y: FMUL,FADD
			length++;
			goto modrm;
		};

		case 0xDD: // various FP instructions
			modrm = *p++;
			length++; //  account for FP prefix
			switch (modrm)
			{
				case 0xE1: case 0xE9:
					return length + 1;
				default:  // r bits matter if not one of the above specific opcodes
					switch ((modrm & 0x38) >> 3)
					{
						case 0: goto modrm_fetched;  // fld
				  // case 1: return length+1; // fisttp
						case 2: goto modrm_fetched; // fst
						case 3: goto modrm_fetched; // fstp
						case 4: return length + 1; // frstor
						case 5: return length + 1; // fucomp
						case 6: goto modrm_fetched; // fnsav
						case 7: goto modrm_fetched; // fnstsw
					}
					goto error; // unrecognized 2nd byte
			}

		case 0xF3: {// funny prefix REPE
			opcode2 = *p++;  // get second opcode byte
			switch (opcode2)
			{
				case 0x90: // == PAUSE
				case 0xA4: case 0xA5: case 0xA6: case 0xA7: case 0xAA: case 0xAB: // string operators
					return length + 2;
				case 0xC3: // (REP) RET
					if (*p++ != 0xCC)
						return length + 2; // only (REP) RET
					if (*p++ != 0xCC)
						goto error;
					if (*p++ == 0xCC)
						return length + 5; // (REP) RET CLONE IS LONG JUMP RELATIVE
					goto error;
				case 0x66: // operand size override (32->16 bits)
					if (*p++ == 0xA5) // "rep movsw"
						return length + 3;
					goto error;
				case 0x0F: // +y:
					opcode2 = *p++;
					switch (opcode2) {
						case 0xE6: // CVTDQ2PD
							length += 3;
							goto modrm;
						case 0x10: // MOVSS
							length += 3;
							goto modrm;
						case 0x11: // /r MOVSS xmm2/m32, xmm1
							length += 3;
							goto modrm;
						case 0x58: // ADDSS
							length += 3;
							goto modrm;
						case 0x5C: // F3 0F 5C /r SUBSS xmm1, xmm2/m32
							length += 3;
							goto modrm;
						default:
							trace("InstructionLength: Unimplemented 0xF3 0x0F tetriary opcode in clone %2x at %x", opcode2, (uint32_t)(p - 2));
							goto error;
					}
				default:
					trace("InstructionLength: Unimplemented 0xF3 secondary opcode in clone %2x at %x", opcode2, (uint32_t)(p - 1));
					goto error;
			}
		}
		case 0xF6: {// funny subblock of opcodes
			modrm = *p++;
			if ((modrm & 0x20) == 0)
				length++; // 8 bit immediate operand
			goto modrm_fetched;
		}
		case 0xF7: {// funny subblock of opcodes
			modrm = *p++;
			if ((modrm & 0x30) == 0)
				length += 4; // 32 bit immediate operand
			goto modrm_fetched;
		}
		case 0x0F: {// Intel's special prefix opcode
			length += 2; // add one for special prefix, and one for following opcode
			opcode2 = *p++;
			switch (opcode2)
			{
				case 0x31: // RDTSC
					return length;

					// CMOVxx
				case 0x40: case 0x41: case 0x42: case 0x43: case 0x44: case 0x45: case 0x46: case 0x47:
				case 0x48: case 0x49: case 0x4A: case 0x4B: case 0x4C: case 0x4D: case 0x4E: case 0x4F:
					goto modrm;

					// JC relative 32 bits
				case 0x80: case 0x81: case 0x82: case 0x83: case 0x84: case 0x85: case 0x86: case 0x87:
				case 0x88: case 0x89: case 0x8A: case 0x8B: case 0x8C: case 0x8D: case 0x8E: case 0x8F:
					return length + 4; // account for subopcode and displacement

			// SETxx rm32
				case 0x90: case 0x91: case 0x92: case 0x93: case 0x94: case 0x95: case 0x96: case 0x97:
				case 0x98: case 0x99: case 0x9A: case 0x9B: case 0x9C: case 0x9D: case 0x9E: case 0x9F:
					goto modrm;

				case 0xA2: // CPUID
					return length + 2;

				case 0xAE: // LFENCE, SFENCE, MFENCE
					opcode2 = *p++;
					switch (opcode2)
					{
						case 0xE8: // LFENCE
						case 0xF0: // MFENCE
						case 0xF8: // SFENCE
							return length + 1;
						default:
							trace("InstructionLength: Unimplemented 0x0F, 0xAE tertiary opcode in clone  %2x at %x", opcode2, (uint32_t)(p - 1));
							goto error;
					}

				case 0xAF: // imul
				case 0xB0: // cmpxchg 8 bits
					goto error;

				case 0xB1: // cmpxchg 32 bits
				case 0xB6: case 0xB7: // movzx
				case 0xBC: /* bsf */ case 0xBD: // bsr
				// case 0xBE: case 0xBF: // movsx 
				case 0xC1: // xadd
				case 0xC7: // cmpxchg8b
					// +y:
				case 0x57: // xorps
				case 0x11: // movsd
				case 0x2A: // cvtsi2sd
				case 0x10: // whatever this was
				case 0x1F: // a fancy NOP?
				case 0xBE: // movsx
				case 0x6E: // movd
				case 0x2C: // CVTTSD2SI
				case 0x2E: // ucomisd
				case 0x2F: // comisd
				case 0x5C: // subsd
				case 0x58: // addsd
				case 0x59: // mulsd
					goto modrm;
				default:
					trace("InstructionLength: Unimplemented 0x0F secondary opcode in clone %2x at %x", opcode2, (uint32_t)(p - 1));
					goto error;
			} // switch
		}
				 // ALL THE THE REST OF THE INSTRUCTIONS; these are instructions that runtime system shouldn't ever use
		default:
			/* case 0x26: case 0x36: // ES: SS: prefixes
			   case 0x9A:
			   case 0xC8: case 0xCA: case 0xCB: case 0xCD: case 0xCE: case 0xCF:
			   case 0xD6: case 0xD7:
			   case 0xE4: case 0xE5: case 0xE6: case 0xE7: case 0xEA: case 0xEB: case 0xEC: case 0xED: case 0xEF:
			   case 0xF4: case 0xFA: case 0xFB:
				*/
			trace("InstructionLength: Unexpected opcode %2x", opcode);
			goto error;
	}

	modrm:
	modrm = *p++;
	modrm_fetched:
	if (modrm >= 0xC0)
		return length + 1;  // account for modrm opcode
	else
	{  /* memory access */
		if ((modrm & 0x7) == 0x04)
		{ /* instruction with SIB byte */
			length++; // account for SIB byte
			sib = *p++; // fetch the sib byte
			if ((sib & 0x7) == 0x05)
			{
				if ((modrm & 0xC0) == 0x40)
					return length + 1 + 1; // account for MOD + byte displacment
				else return length + 1 + 4; // account for MOD + dword displacement
			}
		}
		switch (modrm & 0xC0)
		{
			case 0x0:
				if ((modrm & 0x07) == 0x05)
					return length + 5; // 4 byte displacement
				else return length + 1; // zero length offset
			case 0x80:
				return length + 5;  // 4 byte offset
			default:
				return length + 2;  // one byte offset
		}
	}

	error:
	trace("InstructionLength: unhandled opcode at %8x with opcode %2x", (uint32_t)pc, opcode);
	return 0; // can't actually execute this
}