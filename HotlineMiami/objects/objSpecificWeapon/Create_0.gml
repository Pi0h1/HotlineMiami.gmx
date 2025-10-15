// Actually use this for a specific weapon.
// You must input the amount of ammo you want in its creaation code in the room editor!
image_angle = random(360);
ammo = 0;
switch (image_index) {
    case  0: ammo = 24; break;
    case  1: ammo =  6; break;
    case  6: ammo =  2; break;
    case  7: ammo = 13; break;
    case  9: ammo = 30; break;
    case 10: ammo =  6; break;
    case 11: ammo = 20; break;
    case 12: ammo = 32; break;
}
image_speed = 0;
dir = random(360);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, ammo );
	
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	ammo = buffer_read(buf, buffer_f32 );
}