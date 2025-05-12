if active=1 {
draw_set_blend_mode(bm_add)
image_speed=0.5
draw_circle_color(x,y,22+random(1),c_dkgray,c_black,0)
draw_set_blend_mode(bm_normal)
} else {
image_speed=0
image_index=0
}
if instance_exists(objPhoneConversation) sprite_index=sprDrawersH24PhoneOff else sprite_index=sprDrawersH24Phone
draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,image_angle,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
