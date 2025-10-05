image_speed = 0;
engine = 0;
visited = 0;
index = image_index;
if (sprite_index == sprCarThrashed) {
    my_id = instance_create(x, y, objCarBottom);
    my_id.image_angle = image_angle;
}
instance_deactivate_object(objSwat);
revisit = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, index);
	buffer_write(global.tempSave[room], buffer_f16, engine);
	buffer_write(global.tempSave[room], buffer_f16, visited);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	index = buffer_read(global.tempSave[room], buffer_f32);
	engine = buffer_read(global.tempSave[room], buffer_f16);
	visited = buffer_read(global.tempSave[room], buffer_f16);
}