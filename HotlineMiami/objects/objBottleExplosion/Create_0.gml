image_speed = 0;
index = 0;
image_angle = random(360);
dir = 0;
dist = 0;

repeat(30) {
    my_id = instance_create(x, y, objFlameParticle);
    my_id.direction = random(360);
    my_id.speed = 2 + random(3);
    my_id.friction = 0.15;
}

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_f16, index);
	buffer_write(buf, buffer_f32, dir);
	buffer_write(buf, buffer_f32, dist);
}
DoLoad = function () {
	scrLoadGeneric(buf);
	index = buffer_read(buf, buffer_f16);
	dir = buffer_read(buf, buffer_f32);
	dist = buffer_read(buf, buffer_f32);
}