energie = 1 + floor(random(4));
if (global.maskindex == 2)
    energie = 0;
image_index = 0;
image_speed = 0;
ammo = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
dir = 0;
viewspeed = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write(buf, buffer_f32, viewspeed);
	buffer_write(buf, buffer_f32, viewdir);
	buffer_write(buf, buffer_f32, vdist);
	buffer_write(buf, buffer_f32, vdir);

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	energie = buffer_read(buf, buffer_f32 );
	dir = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	viewspeed = buffer_read(buf, buffer_f32);
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
}