var base_wallheight = 80;

var offset = 0;
var z = 0;
var height = ( base_wallheight );

d3d_set_culling(true);
d3d_set_depth(-1);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5);

var tex     = sprite_index;
var texid   = -1;
var u       = 1;
var v       = 1;

var col = c_white;

switch ( sprite_index )
{
    // Door
        case sprDoorH:
        case sprDoorV:
            col     = make_colour_rgb( 98, 29, 0 );
            tex     = sprDoorTexture;
            height = 60;
            
            break;
        break;
    // Heavy
    case sprWallHeavyH:
    case sprWallHeavyV:
        col     = make_colour_rgb( 192, 192, 192 );
        tex     = sprWallTexture;
        height  = (base_wallheight);
        break;
    // Brick
    case sprWallBrickH:
    case sprWallBrickV:
        col     = make_colour_rgb( 127, 0, 20 );
        tex     = sprWallTextureBrick
        height  = (base_wallheight);
        break;
    // Soft
    case sprWallSoftH:
    case sprWallSoftV:
        tex     = sprWallTexture;
        height = base_wallheight;
        break;
    case sprGlassPanelH:
    case sprGlassPanelV:
    case sprGlassPanelBrokenH:
    case sprGlassPanelBrokenV:
        col     = make_colour_rgb( 192, 192, 192 );
        tex     = sprWallTexture;
        height  = 24;
        break;
    // 
    default:
        col     = make_colour_rgb( 192, 192, 192 );
        tex     = sprWallTexture;
        height  = (base_wallheight);
        break;
}

texid = sprite_get_texture(tex,0);
v = height/sprite_get_height(tex);
draw_set_color(col);

var x1      = x;
var y1      = y;
var z1      = (z-height);
var x2      = x + sprite_width;
var y2      = y + sprite_height;
var z2      = z;

switch object_index
{
    case objDoorH:
    case objDoorV:
        var len = sprite_width;
        var wallangle = image_angle;
        if ( object_index == objDoorV )
        {
            wallangle += 270;
            len = sprite_height;
        }
        var offx = dcos( wallangle + 90 );
        var offy = -dsin( wallangle + 90 );
        u = len / sprite_get_width(tex);
        x1 = x + ( offx * 2 );
        y1 = y + ( offy * 2 );
        x2 = x1 + lengthdir_x( len, wallangle );
        y2 = y1 + lengthdir_y( len, wallangle );
        d3d_set_depth( z2 );
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
        d3d_draw_wall(x2,y2,z1,x1,y1,z2,texid,u,v);
        x1 -= offx * 4;
        y1 -= offy * 4;
        x2 -= offx * 4;
        y2 -= offy * 4;
        d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,u,v);
        break;
    default:
        if (sprite_width > sprite_height)
        {
            // Horizontal Wall
            u = sprite_width / sprite_get_width(tex);
            y1 = y;
            y2 = (y1);
            d3d_draw_wall(x2,y2,z1,x1,y1,z2,texid,u,v);
            y1 += sprite_height;
            y2 += sprite_height;    
            d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,u,v);
        
        }
        else
        {
            // Vertical Wall
            u = sprite_height / sprite_get_width(tex);
            x1 = x;
            x2 = (x1);
            d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,u,v);
            x1 += sprite_width;
            x2 += sprite_width;    
            d3d_draw_wall(x2,y2,z1,x1,y1,z2,texid,u,v);
        }
        break;
}
d3d_set_depth(z-height);
draw_set_color(c_white);
d3d_set_culling(false)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
