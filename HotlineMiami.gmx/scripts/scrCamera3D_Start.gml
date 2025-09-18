/// scrSetCamera3D(id)
if (!global.camera3D) exit;
draw_set_alpha_test(true);
var instance = argument0;
var angle = 180 + self.angle//instance.image_angle;//temp1;
/*
if  (instance.object_index == objPlayerMouse) {
    angle = 180 + point_direction(objPlayer.x,objPlayer.y,objEffector.x,objEffector.y)//instance.dir;
}*/
var xpos = instance.x;
var ypos = instance.y;
var zpos = 0;
var xlook = instance.x;
var ylook = instance.y;
var zlook = instance.depth;
var distance = 128-20;
    zpos-=distance;
    distance2 = (distance*.75)-55-11-3-5+temp2
    ypos+=lengthdir_y(distance2,angle); //distance*.75;
    xpos+=lengthdir_x(distance2,angle); //
var fov = -(64);
var aspect = 16/9;
var gamesurf = application_surface;
if surface_exists(gamesurf) {
    var gamesurf_w = surface_get_width(gamesurf);
    var gamesurf_h = surface_get_height(gamesurf);
    aspect = (gamesurf_w / gamesurf_h);
}

d3d_start();
//d3d_set_projection_ext(xpos, ypos, zpos, xlook, ylook, zlook, 0, 0, -1, fov, aspect, .1, 16000);
d3d_set_projection_ext(xpos, ypos, zpos+82, xlook, ylook, zlook-26, 0, 0, -1, fov, aspect, .1, 16000);
var new_proj = matrix_get(matrix_projection);
new_proj[5] *= -1;
matrix_set(matrix_projection, new_proj);
