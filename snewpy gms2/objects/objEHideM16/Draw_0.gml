if image_index=0 {
draw_sprite_ext(sprEM16CourchingLegs,image_index,x,y,image_xscale,image_yscale,direction,c_black,0.5)
draw_sprite_ext(sprEM16CourchingLegs,image_index,x,y,image_xscale,image_yscale,direction,image_blend,image_alpha)
draw_sprite_ext(sprEWalkM16,image_index,x-shake+random(shake*0.5),y-shake+random(shake*0.5),image_xscale,image_yscale,direction,c_black,0.5)
draw_sprite_ext(sprEWalkM16,image_index,x-shake+random(shake*0.5),y-shake+random(shake*0.5),image_xscale,image_yscale,direction,image_blend,image_alpha)
} else {
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,direction,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,direction,image_blend,image_alpha)
}
