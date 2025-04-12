if !surface_exists(global.surf1) {
global.surf1=surface_create(432,288)
surface_set_target(global.surf1)
draw_clear(c_white)
surface_reset_target()
}

surface_set_target(global.surf1)

draw_clear(make_color_hsv(155,5-random(5),250+random(5)))
draw_set_blend_mode(bm_subtract)
with objLight {
draw_circle_color(x-camera_get_view_x(view_camera[0])+16,y-camera_get_view_y(view_camera[0])+16,radius*(1+random(0.1)),merge_color(c_black,color,strength*(0.9+random(0.1))),c_black,0)
}
with objPlayer {
draw_circle_color(x-camera_get_view_x(view_camera[0])+16,y-camera_get_view_y(view_camera[0])+16,32+random(4),c_gray,c_black,0)
}
with objEnemy {
draw_circle_color(x-camera_get_view_x(view_camera[0])+16,y-camera_get_view_y(view_camera[0])+16,32+random(4),c_gray,c_black,0)
}
with objTutorialHobo {
draw_circle_color(x-camera_get_view_x(view_camera[0])+16,y-camera_get_view_y(view_camera[0])+16,32+random(4),c_gray,c_black,0)
}


draw_set_blend_mode(bm_add)
i=0
repeat (29) {
draw_circle_color(my_x[i],my_y[i],size[i]+random(0.5),c_white,c_black,0)
my_x[i]+=lengthdir_x(myspeed[i],mydir[i])
my_y[i]+=lengthdir_y(myspeed[i],mydir[i])
mydir[i]+=diradd[i]
if round(random(30))=2 diradd[i]=-4+random(8)
if my_x[i]<-16 my_x[i]+=432
if my_y[i]<-16 my_y[i]+=288
if my_y[i]>272 my_y[i]-=288
if my_x[i]>416 my_x[i]-=432
i+=1
}
draw_set_blend_mode(bm_normal)
surface_reset_target()
