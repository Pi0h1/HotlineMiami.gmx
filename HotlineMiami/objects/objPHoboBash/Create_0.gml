if (global.xbox)
    scrInitXboxButtons();
energie = 1 + floor(random(4));
image_index = 3;
image_speed = 0;
ammo = 0;
dir = 0;
bullets = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprPAttackBash);
maskindex = global.maskindex;
viewspeed = 0;
viewdir = 0;
vdist = 0;
vdir = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, energie );
	buffer_write( buf, buffer_f32, dir );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f32, bullets );
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
	bullets = buffer_read(buf, buffer_f32 );
	viewspeed = buffer_read(buf, buffer_f32);
	viewdir = buffer_read(buf, buffer_f32);
	vdist = buffer_read(buf, buffer_f32);
	vdir = buffer_read(buf, buffer_f32);
}