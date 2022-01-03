if global.done=0{
draw_set_blend_mode(bm_add)
if light > 3
{
draw_circle_color(x, y, 35 + light, make_color_hsv(40, 240, 30 + light * 2), c_black, 0)
}else{
draw_circle_color(x, y, 35 + light, make_color_hsv(0, 0, 30 + light * 2), c_black, 0)
}
draw_set_blend_mode(bm_normal)
}

if reload>0 reload-=1
if light>3 light-=3
