scrEMeleeStationaryInit()
image_speed=0
image_index=random(1000)
image_speed=0
energie=round(random(1))
direction=random(360)
my_path=path_add()
path_set_kind(my_path,1)
path_set_precision(my_path,2)
checkreload=floor(random(30))
ammo=24
alert=0
reload=0
light=0
start_x=x
start_y=y
weaponfind=0
lastsprite=sprite_index
DoSave = function() {
	buffer_write(global.tempSave, buffer_u32, sprite_index);
	buffer_write(global.tempSave, buffer_f32, image_index);
	buffer_write(global.tempSave, buffer_u32, image_blend);
	buffer_write(global.tempSave, buffer_f32, image_angle);
	buffer_write(global.tempSave, buffer_f32, image_xscale);
	buffer_write(global.tempSave, buffer_f32, image_yscale);
	buffer_write(global.tempSave, buffer_f32, direction);
	buffer_write(global.tempSave, buffer_f32, speed);

	buffer_write(global.tempSave, buffer_f32, startx);
	buffer_write(global.tempSave, buffer_f32, starty);
	buffer_write(global.tempSave, buffer_f32, ammo);
	buffer_write(global.tempSave, buffer_f32, energie);
}

DoLoad = function() {
	sprite_index = buffer_read(global.tempSave, buffer_u32);	
	image_index = buffer_read(global.tempSave, buffer_f32);
	image_blend = buffer_read(global.tempSave, buffer_u32);
	image_angle = buffer_read(global.tempSave, buffer_f32);
	image_xscale = buffer_read(global.tempSave, buffer_f32);
	image_yscale = buffer_read(global.tempSave, buffer_f32);
	direction = buffer_read(global.tempSave, buffer_f32);
	speed = buffer_read(global.tempSave, buffer_f32);
	
	startx = buffer_read(global.tempSave, buffer_f32);
	starty = buffer_read(global.tempSave, buffer_f32);
	ammo = buffer_read(global.tempSave, buffer_f32);
	energie = buffer_read(global.tempSave, buffer_f32);
}