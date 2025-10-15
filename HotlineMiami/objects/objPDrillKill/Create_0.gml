image_speed = 0;
bled = 0;
hurtindex = 0;
targetindex = 0;
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
ammo = 0;
audio_play_sound(sndDrill, 0, false);

DoSave = function(buf) {
	scrSaveGeneric(buf);
	buffer_write( buf, buffer_f32, bled );
	buffer_write( buf, buffer_f32, ammo );
	buffer_write( buf, buffer_f16, hurtindex );
	buffer_write( buf, buffer_f16, targetindex );

}
DoLoad = function(buf) {
	scrLoadGeneric(buf);
	bled = buffer_read(buf, buffer_f32 );
	ammo = buffer_read(buf, buffer_f32 );
	hurtindex = buffer_read(buf, buffer_f16 );
	targetindex = buffer_read(buf, buffer_f16 );
}