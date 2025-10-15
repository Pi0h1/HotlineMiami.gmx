image_speed = 0.3 + random(0.2);
image_xscale = 1 + random(1);
image_yscale = 1 + random(1);
image_angle = random(360);
sprite_index = choose(sprFlameBig, sprFlameSmall1, sprFlameSmall2);
images = sprite_get_number(sprite_index);

DoSave = function(buf) {
	scrSaveGeneric(buf);	
	buffer_write(buf, buffer_u16, images);
}
DoLoad = function(buf) {
	scrLoadGeneric(buf);	
	images = buffer_read(buf, buffer_u16);
}