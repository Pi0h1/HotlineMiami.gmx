#define scrCamera3D
/// scrSetCamera3D(id)
if (!global.camera3D) exit;
draw_set_alpha_test(true);
var instance = argument0;
if ( !instance_exists( instance ) )
    exit;

var angle = self.angle//instance.image_angle;//temp1;
var pitch = self.pitch;

var aspect = 16/9;
var gamesurf = application_surface;
if surface_exists(gamesurf) {
    var gamesurf_w = surface_get_width(gamesurf);
    var gamesurf_h = surface_get_height(gamesurf);
    aspect = (gamesurf_w / gamesurf_h);
}

d3d_start();
if !( x == xlook && y == ylook ) // not possible
    d3d_set_projection_ext(x, y, z, xlook, ylook, zlook, 0, 0, -1, -fov, aspect, 1 / 8, 16000 + abs( z ));
//d3d_set_projection_ext(xpos, , zpos+82, xlook, ylook, zlook-26, 0, 0, -1, fov, aspect, .1, 16000);
var new_proj = matrix_get(matrix_projection);
new_proj[5] *= -1;
matrix_set(matrix_projection, new_proj);

#define scrCamera3D_End
// 3D Cursor

if ( global.camera3D && !instance_exists( objPlayerDead ) )
{
    var scale = 1;// max( 1, point_distance_3d( objCamera3D.x, objCamera3D.y, objCamera3D.z, objCamera3D.lookx, objCamera3D.looky, objCamera3D.lookz ) / 64 );
    
    var xx = objCamera3D.xlook;
    var yy = objCamera3D.ylook;
    var zz = objCamera3D.zlook;
    
    if ( false )
        zz = objCamera3D.z;
    
    if ( instance_exists( global.enemy ) )
    {
        xx = global.enemy.x;
        yy = global.enemy.y;
        zz = objCamera3D.z;
    }
    scrCamera3D_Billboard( xx, yy, zz );
    //draw_set_blend_mode( objEffector.bm_cursor );
    draw_sprite_ext( objEffector.sprite_index, objEffector.image_index, 0, 0, scale, scale, 0, objEffector.c_cursor, 1 );
    draw_set_blend_mode( bm_normal );
    
    //draw_set_font( -1 );
    //draw_set_color( c_lime );
    //draw_set_halign( fa_left );
    //draw_set_valign( fa_top );
    //draw_text( 24, 24, "test" );
    scrCamera3D_BillboardEnd();
}
d3d_end();

view_xview[0] = objCamera3D.xview;
view_yview[0] = objCamera3D.yview;
view_wview[0] = objCamera3D.wview;
view_hview[0] = objCamera3D.hview;


var xx = view_xview[0];
var yy = view_yview[0];
var _angle = view_angle[0] + 0;
d3d_set_projection( xx, yy, -16000, xx, yy, 16000, dcos( _angle ) , -dsin( _angle ), 0 );
d3d_set_projection_ortho( xx, yy, view_wview[0], view_hview[0], _angle );


#define scrCamera3D_Billboard
/// Billboard( x, y, z, upright )

objCamera3D.world_mat = matrix_get( matrix_world );

var xpos = argument[0];
var ypos = argument[1];
var zpos = argument[2];
var upright = ( ( argument_count > 3 ) && argument[3] )

d3d_set_depth( 0 );
var angle = objCamera3D.angle + 270;
var pitch = 270;
if ( !upright )
    pitch += objCamera3D.pitch;
matrix_set( matrix_world, matrix_build( xpos, ypos, zpos, pitch, 0, angle, 1, 1, 1 ) );



#define scrCamera3D_BillboardEnd
matrix_set( matrix_world, objCamera3D.world_mat );

