with (objPlayerMouse) {
    my_id = instance_create(x, y, objPlayerMouseHouse);
    my_id.active = 0;
    my_id.sprite_index = sprite_index;
    my_id.ammo = ammo;
    global.maskon = 1;
    my_id.maskon = 1;
    instance_destroy();
}

friction = 0.5;
image_speed = 0;
state = 0;
wait = 100;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, state);
	buffer_write(buf, buffer_f32, wait);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	state = buffer_read(buf, buffer_u8);
	wait = buffer_read(buf, buffer_f32);
}
