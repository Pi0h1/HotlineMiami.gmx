global.__rumble=external_define(working_directory+"\GMXInput.dll","setRumble",dll_cdecl,ty_real,3,ty_real,ty_real,ty_real)

global.__leftTrigger=external_define(working_directory+"\GMXInput.dll","leftTrigger",dll_cdecl,ty_real,1,ty_real)
global.__rightTrigger=external_define(working_directory+"\GMXInput.dll","rightTrigger",dll_cdecl,ty_real,1,ty_real)
global.__leftThumbX=external_define(working_directory+"\GMXInput.dll","leftThumbX",dll_cdecl,ty_real,1,ty_real)
global.__leftThumbY=external_define(working_directory+"\GMXInput.dll","leftThumbY",dll_cdecl,ty_real,1,ty_real)
global.__rightThumbX=external_define(working_directory+"\GMXInput.dll","rightThumbX",dll_cdecl,ty_real,1,ty_real)
global.__rightThumbY=external_define(working_directory+"\GMXInput.dll","rightThumbY",dll_cdecl,ty_real,1,ty_real)

global.__buttonState=external_define(working_directory+"\GMXInput.dll","getButtonState",dll_cdecl,ty_real,1,ty_real)
global.__checkButton=external_define(working_directory+"\GMXInput.dll","checkButton",dll_cdecl,ty_real,2,ty_real,ty_real)

global.__getState=external_define(working_directory+"\GMXInput.dll","getCtrlState",dll_cdecl,ty_real,1,ty_real)
