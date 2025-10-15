image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
image_index = floor(random(3));
ammo = 0;
path = path_add();
type = choose(objEnemy, objEnemyMeleeStationary);
if (room == rmTrainstationEntrance || room == rmHighballer)
    type = objEnemyMeleeStationary;
if (room == rmHotelEntrance)
    type = choose(objEnemy);
on = 0;
alarm[1] = random(250);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, reload );
	buffer_write( buf, buffer_f32, alert );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_u8, on );
	buffer_write( buf, buffer_f32, type );
}

DoLoad = function(buf) {
	scrLoadGeneric(buf);
	reload = buffer_read(buf, buffer_f32 );
	alert = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	on = buffer_read(buf, buffer_u8 );
	type = buffer_read(buf, buffer_f32 );
}	