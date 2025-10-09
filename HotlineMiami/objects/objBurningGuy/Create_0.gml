direction = random(360);
speed = 2;
image_speed = 0.25;
diradd = -4 + random(8);
alarm[0] = 200;
repeat(30) {
    my_id = instance_create(x, y, objFlameParticle);
    my_id.direction = random(360);
    my_id.speed = 2 + random(3);
    my_id.friction = 0.15;
}
audio_play_sound(sndMolotov, 0, false);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_f32, alarm[0]);
	buffer_write(global.tempSave[room], buffer_f32, index);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	alarm[0] = buffer_read(global.tempSave[room], buffer_f32);
	index = buffer_read(global.tempSave[room], buffer_f32);
}