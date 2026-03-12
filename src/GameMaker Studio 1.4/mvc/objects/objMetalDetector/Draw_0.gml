if on=1 {sprite_index=sprMetalDetectorAlarm image_speed=0.25} else {sprite_index=sprMetalDetector image_speed=0}
draw_sprite_ext(sprite_index,image_index,x+2,y+3,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
