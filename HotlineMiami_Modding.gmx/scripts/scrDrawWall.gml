var drawx=x,drawy=y,width=sprite_get_width(sprite_index),height=sprite_get_height(sprite_index)

if image_xscale!=1 {
repeat floor(image_xscale) {

if object_index=objRailV {
draw_sprite_ext(sprite_index,image_index,drawx+3,drawy+3+8,1,1,sprite_angle+90,c_black,0.5)
}

draw_sprite_ext(sprite_index,image_index,drawx,drawy+8,1,1,sprite_angle+90,c_white,image_alpha)
drawx+=width
}
} else if image_yscale!=1 {
repeat floor(image_yscale) {

if object_index=objRailV {
draw_sprite_ext(sprite_index,image_index,drawx+3,drawy+3,1,1,sprite_angle,c_black,0.5)
}

draw_sprite_ext(sprite_index,image_index,drawx,drawy,1,1,sprite_angle,c_white,image_alpha)
drawy+=height
}
} else {
draw_self()
}

draw_sprite_ext(corner_index,0,x,y,1,1,0,image_blend,image_alpha)

if image_yscale>image_xscale
{
draw_sprite_ext(corner_index,0,x,y+(8*image_yscale)-8,1,1,0,image_blend,image_alpha)
}

if image_xscale>image_yscale
{
draw_sprite_ext(corner_index,0,x+(8*image_xscale)-8,y,1,1,0,image_blend,image_alpha)
}
