image_speed = 0.5;
image_blend = merge_color(c_white, c_yellow, random(1));
passed = 0;
caliber = 0;
global.noguns = 0;
startx = x;
starty = y;
swat = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, passed );
	buffer_write( buf, buffer_f32, caliber );
	buffer_write( buf, buffer_f32, startx );
	buffer_write( buf, buffer_f32, starty );
	buffer_write( buf, buffer_f32, swat );
	
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	passed = buffer_read(buf, buffer_f32 );
	caliber = buffer_read(buf, buffer_f32 );
	startx = buffer_read(buf, buffer_f32 );
	starty = buffer_read(buf, buffer_f32 );
	swat = buffer_read(buf, buffer_f32 );
}