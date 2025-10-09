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

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f16, index);
	buffer_write(global.tempSave[room], buffer_f32, dir);
	buffer_write(global.tempSave[room], buffer_f32, dist);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	index = buffer_read(global.tempSave[room], buffer_f16);
	dir = buffer_read(global.tempSave[room], buffer_f32);
	dist = buffer_read(global.tempSave[room], buffer_f32);
}