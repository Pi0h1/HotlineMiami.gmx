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

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_u8, state);
	buffer_write(global.tempSave[room], buffer_f32, wait);
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	state = buffer_read(global.tempSave[room], buffer_u8);
	wait = buffer_read(global.tempSave[room], buffer_f32);
}
