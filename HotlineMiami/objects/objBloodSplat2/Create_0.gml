addspeed = 0.2 + random(0.1);
image_blend = c_red;
image_speed = 0;
image_angle = random(360);
image_xscale = 0.75 + random(0.5);
image_yscale = image_xscale;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, addspeed );
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	addspeed = buffer_read(buf, buffer_f32 );
}