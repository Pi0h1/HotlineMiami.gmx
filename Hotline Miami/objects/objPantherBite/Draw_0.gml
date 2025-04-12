if image_speed<0.15 {
if instance_exists(master) {
x=master.x+lengthdir_x(2,image_angle)
y=master.y+lengthdir_y(2,image_angle)
if master.speed=0 {if image_speed<0.15 {audio_play_sound(sndBonesBreak,0,false) audio_play_sound(sndDogRip,0,false) audio_play_sound(sndHit,0,false)} image_speed=0.15}
} else {
if image_speed<0.15 {audio_play_sound(sndBonesBreak,0,false) audio_play_sound(sndDogRip,0,false) audio_play_sound(sndHit,0,false)} image_speed=0.15
}
}

draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

