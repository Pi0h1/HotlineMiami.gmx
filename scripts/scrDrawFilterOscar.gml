if global.maskindex=14 and global.maskon=1 {
draw_set_blend_mode(bm_subtract)
draw_circle_color(view_wview[0]/2,view_hview[0]/2,240+random(24)+24,merge_color(c_black,merge_color(c_white,c_aqua,0.6+lengthdir_x(0.4,global.dir*4)),bamount),merge_color(c_black,c_white,bamount),0)
draw_set_blend_mode(bm_normal)
if bamount<1 bamount+=0.05
}
