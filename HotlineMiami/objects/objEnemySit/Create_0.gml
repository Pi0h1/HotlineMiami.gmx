image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
image_index = floor(random(3));
ammo = 0;
path = path_add();
type = choose(objEnemy, objEnemyMeleeStationary);
if (room == rmTrainstationEntrance || room == rmBossClubFloor1)
    type = objEnemyMeleeStationary;
if (room == rmHotelEntrance)
    type = choose(objEnemy);
on = 0;

DoSave = function() {
	scrSaveGeneric(global.tempSave[room]);
	buffer_write( global.tempSave[room], buffer_f32, reload );
	buffer_write( global.tempSave[room], buffer_f32, alert );
	buffer_write( global.tempSave[room], buffer_f32, ammo );
	buffer_write( global.tempSave[room], buffer_f32, on );
	buffer_write( global.tempSave[room], buffer_f32, type );
}

DoLoad = function() {
	scrLoadGeneric(global.tempSave[room]);
	reload = buffer_read(global.tempSave[room], buffer_f32 );
	alert = buffer_read(global.tempSave[room], buffer_f32 );
	ammo = buffer_read(global.tempSave[room], buffer_f32 );
	on = buffer_read(global.tempSave[room], buffer_f32 );
	type = buffer_read(global.tempSave[room], buffer_f32 );
}	