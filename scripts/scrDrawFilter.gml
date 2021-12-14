if (global.devmode == true) exit
/*draw_set_blend_mode(bm_subtract)
my_y=random(32)
draw_sprite_tiled(sprScanlines,0,0,my_y)*/
draw_set_blend_mode(bm_subtract)
draw_circle_color(view_wview[0]/2,view_hview[0]/2,240+random(24)+48,c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0)
draw_set_blend_mode(bm_normal)
