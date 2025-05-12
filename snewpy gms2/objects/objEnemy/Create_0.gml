scrERandomInit()

image_speed=0
image_index=random(1000)
angle=random(360)

direction=angle
speed=round(random(1))
if room=rmTutorial {image_index=0 speed=0 direction=point_direction(x,y,objPlayer.x,objPlayer.y)}
image_speed=speed*0.1
alarm[0]=60+random(60)
energie=round(random(1))

checkreload=floor(random(30))
ammo=24
alert=0
reload=13
light=0

weaponfind=0 
shake=0

///Weapons
if object_get_parent(object_index)=objEnemyIdle exit
if sprite_index=sprEWalkM16 sprite_index=choose(sprEWalkM16,sprEWalkShotgun,sprEWalkDoubleBarrel)

///Ammo
if sprite_index=sprEWalkM16 ammo=24
if sprite_index=sprEWalkShotgun ammo=6
if sprite_index=sprEWalkDoubleBarrel ammo=2
if sprite_index=sprEWalkSilencer ammo=13
if global.maskindex=10 ammo=ceil(ammo*1.33)

DoSave = function() {
	buffer_write(global.tempSave, buffer_u32, sprite_index);
	buffer_write(global.tempSave, buffer_f32, image_index);
	buffer_write(global.tempSave, buffer_u32, image_blend);
	buffer_write(global.tempSave, buffer_f32, image_angle);
	buffer_write(global.tempSave, buffer_f32, image_xscale);
	buffer_write(global.tempSave, buffer_f32, image_yscale);
	buffer_write(global.tempSave, buffer_f32, direction);
	buffer_write(global.tempSave, buffer_f32, speed);

	buffer_write(global.tempSave, buffer_f32, startx);
	buffer_write(global.tempSave, buffer_f32, starty);
	buffer_write(global.tempSave, buffer_f32, ammo);
	buffer_write(global.tempSave, buffer_f32, energie);
}

DoLoad = function() {
	sprite_index = buffer_read(global.tempSave, buffer_u32);	
	image_index = buffer_read(global.tempSave, buffer_f32);
	image_blend = buffer_read(global.tempSave, buffer_u32);
	image_angle = buffer_read(global.tempSave, buffer_f32);
	image_xscale = buffer_read(global.tempSave, buffer_f32);
	image_yscale = buffer_read(global.tempSave, buffer_f32);
	direction = buffer_read(global.tempSave, buffer_f32);
	speed = buffer_read(global.tempSave, buffer_f32);
	
	startx = buffer_read(global.tempSave, buffer_f32);
	starty = buffer_read(global.tempSave, buffer_f32);
	ammo = buffer_read(global.tempSave, buffer_f32);
	energie = buffer_read(global.tempSave, buffer_f32);
}