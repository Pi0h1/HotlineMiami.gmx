draw_set_blend_mode(bm_subtract);
my_x = random(32);
my_y = random(32);
draw_sprite_tiled(sprScanlines,0,my_x,my_y);
draw_set_blend_mode(bm_normal);
