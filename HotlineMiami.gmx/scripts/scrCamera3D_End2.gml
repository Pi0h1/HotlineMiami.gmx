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
