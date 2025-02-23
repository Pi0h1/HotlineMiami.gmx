if restart=0
{
if alpha>0 
{
alpha-=0.01
draw_set_alpha(alpha)
draw_set_color(c_black)
draw_rectangle(0,0,640,480,0)
draw_set_alpha(1)
}
}
if restart=1
{
if alpha<1 alpha+=0.01 else {/*surface_free(blood_draw.blood_surface)*/ game_restart()}
draw_set_alpha(alpha)
draw_set_color(c_black)
draw_rectangle(0,0,640,480,0)
draw_set_alpha(1)
}

/* */
/*  */
