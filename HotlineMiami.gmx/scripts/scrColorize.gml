_enable = argument0;
_colour = argument1;
_start  = argument2;
_end    = argument3;


if ( !global.camera3D )
{
    d3d_set_fog(_enable, _colour, _start, _end);
    exit;
}

if ( _enable )
{
    d3d_set_fog(_enable, _colour, _start, _end);
}
else
{
    scrCamera3D_Fog();
}
