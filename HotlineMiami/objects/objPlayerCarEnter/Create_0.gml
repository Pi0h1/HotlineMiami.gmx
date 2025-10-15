image_speed = 0;
engine = 0;
visited = 0;
index = image_index;
if (sprite_index == sprCarThrashed) {
    my_id = instance_create(x, y, objCarBottom);
    my_id.image_angle = image_angle;
}
// this may be here for a purpose?
//instance_deactivate_object(objSwat);
revisit = 0;

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f32, index);
	buffer_write(buf, buffer_f16, engine);
	buffer_write(buf, buffer_f16, visited);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	index = buffer_read(buf, buffer_f32);
	engine = buffer_read(buf, buffer_f16);
	visited = buffer_read(buf, buffer_f16);
}