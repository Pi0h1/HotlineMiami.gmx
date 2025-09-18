#define scrCamera3D
/// scrSetCamera3D(id)
if (!global.camera3D) exit;
draw_set_alpha_test(true);
var instance = argument0;
var angle = self.angle//instance.image_angle;//temp1;
var pitch = self.pitch;
/*
if  (instance.object_index == objPlayerMouse) {
    angle = 180 + point_direction(objPlayer.x,objPlayer.y,objEffector.x,objEffector.y)//instance.dir;
}*/
var xpos = instance.x;
var ypos = instance.y;
var zpos = eye_height;
var xlook = instance.x;
var ylook = instance.y;
var zlook = instance.depth;

var distance = 256;


if ( object_is_ancestor( instance.object_index, objCamera3DTarget ) )
{
    zpos = instance.z;
    angle = instance.angle;
    pitch = clamp( instance.pitch, -89.995, 89.995 );
    
    var dcos_angle = dcos( angle );
    var dsin_angle = dsin( angle );
    var dcos_pitch = dcos( pitch );
    var dsin_pitch = dsin( pitch );
    zlook = zpos;
    
    xlook += ( distance * dcos_angle * dcos_pitch );
    ylook += ( distance * -dsin_angle * dcos_pitch );
    zlook += ( distance * dsin_pitch );
    
}
else if ( true )
{
    // First person
    pitch = clamp( pitch, -89.995, 89.995 );
    var dcos_angle = dcos( angle );
    var dsin_angle = dsin( angle );
    var dcos_pitch = dcos( pitch );
    var dsin_pitch = dsin( pitch );
    
    zpos = -eye_height; // eye height
    zlook = zpos;
    
    xlook += ( distance * dcos_angle * dcos_pitch );
    ylook += ( distance * -dsin_angle * dcos_pitch );
    zlook += ( distance * dsin_pitch );
    
}
else
{
    var distance = 128-20;
    zpos-=distance;
    distance2 = (distance*.75)-55-11-3-5+temp2
    ypos-=lengthdir_y(distance2,angle); //distance*.75;
    xpos-=lengthdir_x(distance2,angle); //
}
var fov = -(64);
var aspect = 16/9;
var gamesurf = application_surface;
if surface_exists(gamesurf) {
    var gamesurf_w = surface_get_width(gamesurf);
    var gamesurf_h = surface_get_height(gamesurf);
    aspect = (gamesurf_w / gamesurf_h);
}

d3d_start();
if !( xpos == xlook && ypos == ylook ) // not possible
    d3d_set_projection_ext(xpos, ypos, zpos, xlook, ylook, zlook, 0, 0, -1, fov, aspect, .1, 16000);
//d3d_set_projection_ext(xpos, ypos, zpos+82, xlook, ylook, zlook-26, 0, 0, -1, fov, aspect, .1, 16000);
var new_proj = matrix_get(matrix_projection);
new_proj[5] *= -1;
matrix_set(matrix_projection, new_proj);

#define scrCamera3D_End
view_xview[0] = objCamera3D.xview;
view_yview[0] = objCamera3D.yview;
view_wview[0] = objCamera3D.wview;
view_hview[0] = objCamera3D.hview;

d3d_end();

var xx = view_xview[0];
var yy = view_yview[0];
var _angle = view_angle[0] + 0;
d3d_set_projection( xx, yy, -16000, xx, yy, 16000, dcos( _angle ) , -dsin( _angle ), 0 );
d3d_set_projection_ortho( xx, yy, view_wview[0], view_hview[0], _angle );

