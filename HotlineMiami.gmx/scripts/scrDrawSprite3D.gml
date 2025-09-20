///scrDrawSprite3D( x, y, z, spriteIndex, [imageIndex=0], [angle=0] [xScale=1], [yScale=xScale] )

var i = 0;

var xPos = argument[i++];
var yPos = argument[i++];
var zPos = argument[i++];
var spriteIndex = argument[i++];
//
var imageIndex = 0;
if ( argument_count > i && ( argument[i] != undefined ) ) imageIndex = argument[i++];
//
var angle = 0;
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

var spritename = sprite_get_name( spriteIndex );
var sprite3D = -1;

sprite3D = asset_get_index( spritename + "_3D0" );
if ( sprite_exists( sprite3D ) )
{
    draw3D = true;
    scrCamera3D_Billboard( xPos, yPos, zPos, undefined, 270 );
    draw_sprite_ext( sprite3D, imageIndex, 0, 0, xScale, yScale, 0, color, alpha );
    scrCamera3D_BillboardEnd();
    exit;
}
    

if ( sprite_exists( sprite3D ) )
{
    draw3D = true;
}
if ( !draw3D )
{
    draw_sprite_ext( spriteIndex, imageIndex, xPos, yPos, xScale, yScale, angle, color, alpha );
    exit;
}



