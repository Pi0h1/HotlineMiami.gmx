scrERandomInit();

image_speed = 0;
image_index = random(1000);
angle = random(360);

direction = angle;
speed = round(random(1));
if (room == rmTutorial) {
    image_index = 0;
    speed = 0;
    direction = point_direction(x, y, objPlayer.x, objPlayer.y);
}
image_speed = speed * 0.1;
alarm[0] = 60 + random(60);
energie = round(random(1));

checkreload = floor(random(30));
ammo = 24;
alert = 0;
reload = 13;
light = 0;

weaponfind = 0;
shake = 0;

///Weapons
if (object_get_parent(object_index) == objEnemyIdle)
    exit;
if (sprite_index == sprEWalkM16)
    sprite_index = choose(sprEWalkM16, sprEWalkShotgun, sprEWalkDoubleBarrel);

///Ammo
switch (sprite_index) {
    case          sprEWalkM16: ammo = 24; break;
    case      sprEWalkShotgun: ammo = 6;  break;
    case sprEWalkDoubleBarrel: ammo = 2;  break;
    case     sprEWalkSilencer: ammo = 13; break;
}
if (global.maskindex == 10)
    ammo = ceil(ammo * 1.33);

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, energie );
	buffer_write( global.tempSave[room], buffer_f32, checkreload );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, alert );
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, light );
	buffer_write( global.tempSave[room], buffer_f32, weaponfind );
	buffer_write( global.tempSave[room], buffer_f32, shake );
	buffer_write( global.tempSave[room], buffer_f32, angle );
}
DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	energie = buffer_read(global.tempSave[room], buffer_f32 );
	checkreload = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	alert = buffer_read(global.tempSave[room], buffer_f32 );
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	light = buffer_read(global.tempSave[room], buffer_f32 );
	weaponfind = buffer_read(global.tempSave[room], buffer_f32 );
	shake = buffer_read(global.tempSave[room], buffer_f32 );
	angle = buffer_read(global.tempSave[room], buffer_f32 );
}