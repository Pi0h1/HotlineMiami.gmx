image_speed = 0;
on = 0;
global.done = 0;
alarm[0] = 2;
dir = 0;
if (global.xbox)
    scrInitXboxButtons();

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_u8, on );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	on = buffer_read( buf, buffer_u8 );
}