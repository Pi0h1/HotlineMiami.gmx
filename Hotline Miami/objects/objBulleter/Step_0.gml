surface_set_target(surf)
with objBloodDrop {
if speed=0 {
draw_sprite_ext(sprite_index,image_index,x*3,y*3,image_xscale*3,image_yscale*3,image_angle,image_blend,image_alpha)
instance_destroy()
}
}
with objBloodSplat {
if image_index>=2 {
draw_sprite_ext(sprite_index,image_index,x*3,y*3,image_xscale*3,image_yscale*3,image_angle,image_blend,image_alpha)
instance_destroy()
}
}
surface_reset_target()
