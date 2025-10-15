image_speed = 0;
wait = 5;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
my_id = instance_create(x, y, objWeaponThrow);
my_id.speed = 2.5;
my_id.direction = -45;
my_id.image_index = 17;
my_id.ammo = 0;

DoSave = function(buf) {
	buffer_write( buf, buffer_f32, wait );
	buffer_write( buf, buffer_f32, image_speed );

}
DoLoad = function(buf) {
	wait = buffer_read(buf, buffer_f32 );
	image_speed = buffer_read(buf, buffer_f32 );
}