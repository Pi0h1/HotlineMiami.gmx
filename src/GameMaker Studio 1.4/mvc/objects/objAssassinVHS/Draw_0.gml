if !instance_exists(objPhoneConversation) and talked=1 {
with objPlayerMouseHouse {
active=1
with objVHSTake on=1
}
}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x-1,y-1,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if talked=0 {
draw_sprite_ext(sprArrow,0,x+lengthdir_x(16-lengthdir_x(3,dir),image_angle),y+lengthdir_y(16-lengthdir_x(3,dir),image_angle),1,1,image_angle-90,image_blend,image_alpha)
dir+=8
}
