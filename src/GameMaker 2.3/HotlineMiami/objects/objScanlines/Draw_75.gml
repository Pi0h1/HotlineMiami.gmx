display_set_gui_size(gui_w, gui_h);
draw_set_blend_mode(bm_subtract);
my_x = random(32);
my_y = random(32);
draw_sprite_tiled(sprite_index,0,my_x,my_y);
draw_set_blend_mode(bm_normal);

