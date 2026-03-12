if global.surfaces=1 {
if surface_exists(global.surf3) and surface_exists(global.surf2) {
if save=1 {
my_id=instance_create(0,0,objSurfaceReturn)
with objBloodPool {if global.surfaces addToSurface(global.surf3,0)}
my_id.sprite_index=scrSaveSurface()
my_id.image_xscale=1/3
my_id.image_yscale=1/3
}
}

if surface_exists(global.surf3) {
surface_set_target(global.surf3)
draw_clear_alpha(make_color_hsv(0,0,2),0)
surface_alpha()
surface_reset_target()
}
if surface_exists(global.surf2) {
surface_set_target(global.surf2)
draw_clear_alpha(make_color_hsv(0,0,2),0)
surface_alpha()
surface_reset_target()
}
}
