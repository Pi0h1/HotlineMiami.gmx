function vcapture_init() {
	global.fvcapture_begin = external_define( "vcapture.dll", "vcapture_begin", dll_cdecl, ty_real, 3, ty_real, ty_string, ty_real);
	global.fvcapture_frame = external_define( "vcapture.dll", "vcapture_frame", dll_cdecl, ty_real, 0);
	global.fvcapture_save  = external_define( "vcapture.dll", "vcapture_save",  dll_cdecl, ty_real, 0);



}
