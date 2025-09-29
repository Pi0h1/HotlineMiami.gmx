///scrDrawSprite3D( x, y, z, spriteIndex, [imageIndex=0], [angle=0], [xScale=1], [yScale=xScale] )

var i = 0;

var xPos = argument[i++];
var yPos = argument[i++];
var zPos = argument[i++];
var spriteIndex = argument[i++];
//
var imageIndex = 0;
if ( argument_count > i && ( argument[i] != undefined ) ) imageIndex = argument[i++];
//
var angle = undefined;
if ( argument_count > i && ( argument[i] != undefined ) ) angle = argument[i++];
//
var xScale = 1;
if ( argument_count > i && ( argument[i] != undefined ) ) xScale = argument[i++];
//
var yScale = xScale;
if ( argument_count > i && ( argument[i] != undefined ) ) yScale = argument[i++];
//
var zScale = max( abs( xScale ), abs( yScale ) );
//
var color = c_white;
if ( argument_count > i && ( argument[i] != undefined ) ) color = argument[i++];
//
var alpha = 1;
if ( argument_count > i && ( argument[i] != undefined ) ) alpha = argument[i++];

alpha = true;

var draw3D = false;

if ( xScale == 0 )
|| ( yScale == 0 )
|| ( zScale == 0 )
|| ( alpha <= 0 )
    exit;
if ( global.camera3D && instance_exists( objCamera3D ) )
{
    var spritename = sprite_get_name( spriteIndex );
    var sprite3D = -1;
    //
    var angnum = 0;
    sprite3D = asset_get_index( spritename + "_3D0" );
    if ( !sprite_exists( sprite3D ) )
    {
        sprite3D = asset_get_index( spritename + "_3D1" );
        var ang = angle_difference( objCamera3D.angle + 180, angle );
        angnum = 1 + floor( ( ( 360 - ( ( 360 + ( ang - ( 45 / 2 )) ) % 360 ) ) / 360 ) * 8 );
        var _spr = asset_get_index( spritename + "_3D" + string( angnum ) );
        if ( sprite_exists( _spr ) )
            sprite3D = _spr;
        else
        {
            if ( angnum == 6 )
                angnum = 4;
            else if( angnum == 7 )
                angnum = 3;
            else if ( angnum == 8 )
                angnum = 2;
            _spr = asset_get_index( spritename + "_3D" + string( angnum ) );
            if ( sprite_exists( _spr ) )
            {
                sprite3D = _spr;
                xScale *= -1;
            }   
        }
    }
    
    if ( sprite_exists( sprite3D ) )
    {
        draw3D = true;
        scrCamera3D_Billboard( xPos, yPos, zPos, undefined, 270 );
        draw_sprite_ext( sprite3D, imageIndex, 0, 0, xScale, yScale, 0, color, alpha );
        // 
        draw_set_color( c_lime );
        draw_set_font( -1 );
        draw_set_halign( fa_left );
        draw_set_valign( fa_top );
        draw_text( 12, 8, angnum );
        // 
        scrCamera3D_BillboardEnd();
        return true;
    }
}
if ( !draw3D )
{
    draw_sprite_ext( spriteIndex, imageIndex, xPos, yPos, xScale, yScale, angle, color, alpha );
    return false;
}

return false;
