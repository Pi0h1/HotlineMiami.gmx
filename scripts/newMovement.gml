var dest_xsp = 0;
var dest_ysp = 0;

gamepad = -1;
var gpstate = gamepad_is_connected( 0 );
if ( gpstate )
{
    gamepad = 0;
}

if ( gamepad < 0 ) || ( moveleft ) || ( moveright ) || ( moveup ) || ( movedown )
{
    var xmove = ( moveright - moveleft ) * moveScale;
    var ymove =  ( movedown - moveup ) * moveScale;
}
else
{
    var xmove = ( gamepad_axis_value( gamepad, gp_axislh ) ) * moveScale;
    var ymove =  ( gamepad_axis_value( gamepad, gp_axislv ) ) * moveScale;
}

var axisdir = point_direction( 0, 0, xmove, ymove );
var axisspd = min( 1, point_distance( 0, 0, xmove, ymove ) * 1.1 );

if ( moveleft ) && ( moveright )
{
    dest_xsp = myxspeed;
}
if ( moveup ) && ( movedown )
{
    dest_ysp = myyspeed;
}

if ( axisspd > ( 5 / 100 ) )
{
    dest_xsp = dcos( axisdir ) * ( myspeed * axisspd );
    dest_ysp = -dsin( axisdir ) * ( myspeed * axisspd );
}

if ( myxspeed != dest_xsp ) || ( myyspeed != dest_ysp )
{
    var inc = acceleration * delta;
    var dest_dis = point_distance( xsp, ysp, dest_xsp, dest_ysp );
    if ( dest_dis < inc )
    {
        myxspeed = dest_xsp;
        myyspeed = dest_ysp;
    }
    else
    {
        myxspeed += inc * dcos( axisdir );
        myyspeed -= inc * dsin( axisdir );
    }
}
