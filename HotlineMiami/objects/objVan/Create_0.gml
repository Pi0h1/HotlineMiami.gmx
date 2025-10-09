global.done = 0;
state = 0;
image_speed = 0;
vspeed = 12;
with (objDoorH)
    image_angle = 0;
with (objDoorH2)
    image_angle = 0;
image_angle = 270;
image_yscale = 2;
dir = 0;
dist = 0;
audio_play_sound(sndCarThrottle, 0, false);
brake = 0;
sxeasy_play(working_directory + "\\Release.mp3");
doorangle = 0;
doorx = 0;
doory = 0;
reload = 0;
enemies = 5;
headdir = 90;
headx = 0;
heady = 0;
molotovs = 2;
with (objEffector) {
    viewx = camera_get_view_x(view_camera[0]);
    viewy = camera_get_view_y(view_camera[0]);
    instance_create(x, y, objEffectorHouse);
    camera_set_view_pos(view_camera[0], viewx, viewy);
    instance_destroy();
}

test = objPlayer.persistent;
objPlayer.persistent = 0;
thrown = 0;
//global.loaded = 1;
objEffectorHouse.amount = 0;
//checkpoint_save(working_directory + "\\tempsave.sav");
//global.loaded = 0;
objEffectorHouse.amount = 180;
objPlayer.persistent = test;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write(global.tempSave[room], buffer_u8, test);
	buffer_write(global.tempSave[room], buffer_u8, brake);
	buffer_write(global.tempSave[room], buffer_u8, thrown);
	buffer_write(global.tempSave[room], buffer_u8, state);
	buffer_write(global.tempSave[room], buffer_f32, reload);
	buffer_write(global.tempSave[room], buffer_f32, doorangle);
	buffer_write(global.tempSave[room], buffer_f32, doorx);
	buffer_write(global.tempSave[room], buffer_f32, doory);
	buffer_write(global.tempSave[room], buffer_f32, headdir);
	buffer_write(global.tempSave[room], buffer_f32, headx);
	buffer_write(global.tempSave[room], buffer_f32, heady);
	buffer_write(global.tempSave[room], buffer_f32, dir);
	buffer_write(global.tempSave[room], buffer_f32, dist);
	buffer_write(global.tempSave[room], buffer_u16, enemies);
	buffer_write(global.tempSave[room], buffer_u8, solid);
}
DoLoad = function () {
	scrLoadGeneric(global.tempSave[room]);
	test = buffer_read(global.tempSave[room], buffer_u8);
	brake = buffer_read(global.tempSave[room], buffer_u8);
	thrown = buffer_read(global.tempSave[room], buffer_u8);
	state = buffer_read(global.tempSave[room], buffer_u8);
	reload = buffer_read(global.tempSave[room], buffer_f32);
	doorangle = buffer_read(global.tempSave[room], buffer_f32);
	doorx = buffer_read(global.tempSave[room], buffer_f32);
	doory = buffer_read(global.tempSave[room], buffer_f32);
	headdir = buffer_read(global.tempSave[room], buffer_f32);
	headx = buffer_read(global.tempSave[room], buffer_f32);
	heady = buffer_read(global.tempSave[room], buffer_f32);
	dir = buffer_read(global.tempSave[room], buffer_f32);
	dist = buffer_read(global.tempSave[room], buffer_f32);
	enemies = buffer_read(global.tempSave[room], buffer_u16);
	solid = buffer_read(global.tempSave[room], buffer_u8);
}