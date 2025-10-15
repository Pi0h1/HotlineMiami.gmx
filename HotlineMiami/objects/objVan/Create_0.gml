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

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write(buf, buffer_u8, test);
	buffer_write(buf, buffer_u8, brake);
	buffer_write(buf, buffer_u8, thrown);
	buffer_write(buf, buffer_u8, state);
	buffer_write(buf, buffer_f32, reload);
	buffer_write(buf, buffer_f32, doorangle);
	buffer_write(buf, buffer_f32, doorx);
	buffer_write(buf, buffer_f32, doory);
	buffer_write(buf, buffer_f32, headdir);
	buffer_write(buf, buffer_f32, headx);
	buffer_write(buf, buffer_f32, heady);
	buffer_write(buf, buffer_f32, dir);
	buffer_write(buf, buffer_f32, dist);
	buffer_write(buf, buffer_u16, enemies);
	buffer_write(buf, buffer_u8, solid);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	test = buffer_read(buf, buffer_u8);
	brake = buffer_read(buf, buffer_u8);
	thrown = buffer_read(buf, buffer_u8);
	state = buffer_read(buf, buffer_u8);
	reload = buffer_read(buf, buffer_f32);
	doorangle = buffer_read(buf, buffer_f32);
	doorx = buffer_read(buf, buffer_f32);
	doory = buffer_read(buf, buffer_f32);
	headdir = buffer_read(buf, buffer_f32);
	headx = buffer_read(buf, buffer_f32);
	heady = buffer_read(buf, buffer_f32);
	dir = buffer_read(buf, buffer_f32);
	dist = buffer_read(buf, buffer_f32);
	enemies = buffer_read(buf, buffer_u16);
	solid = buffer_read(buf, buffer_u8);
}