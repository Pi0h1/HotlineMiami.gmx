var base_wallheight = 80;

var offset = 0;
var z = 0;
var height = ( base_wallheight );

d3d_set_culling(false);
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
    case sprCorner:
        col     = objCamera3D.base_wallcolor;
        tex     = sprWallTexture;
        height  = (base_wallheight);
        break;
    // Brick
    case sprWallBrickH:
    case sprWallBrickV:
    case sprCornerBrick3D:
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
    case sprWindowRight:
    case sprWindowLeft:
    case sprWindowUp:
    case sprWindowDown:
        col     = make_colour_rgb( 127, 0, 20 );
        tex     = sprWallTextureBrick
        height  = 24;
        break;
    case sprRailH:
    case sprRailV:
        col     = make_colour_rgb( 67, 16, 16 );
        tex     = sprWallTexture;
        height = 24;
        break;
    // 
    default:
        col     = objCamera3D.base_wallcolor;
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

// DRAWING START

d3d_set_culling( true );
scrCamera3D_Fog();

switch object_index
{
    case objDoorH:
    case objDoorV:
        var len = abs( sprite_width );
        var wallangle = image_angle;
        if ( image_xscale < 0 )
            wallangle += 180;
        if ( object_index == objDoorV )
        {
            wallangle += 270;
            len = sprite_height;
            if ( image_yscale < 0 )
                wallangle += 180;
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
        var x4 = x1 - offx * 4;
        var y4 = y1 - offy * 4;
        var x3 = x2 - offx * 4;
        var y3 = y2 - offy * 4;
        d3d_draw_wall(x4,y4,z1,x3,y3,z2,texid,u,v);
        
        d3d_draw_wall(x3,y3,z1,x2,y2,z2,texid,u,v);
        d3d_draw_wall(x1,y1,z1,x4,y4,z2,texid,u,v);
        
        break;
    default:
        if (sprite_width > sprite_height)
        {
            // Horizontal Wall
            u = sprite_width / sprite_get_width(tex);
            y1 = y;
            y2 = (y1);
            var y4 = y1 + sprite_height;
            var y3 = y2 + sprite_height;  
            // N
            d3d_draw_wall(x2,y2,z1,x1,y1,z2,texid,u,v);  
            // S
            d3d_draw_wall(x1,y4,z1,x2,y3,z2,texid,u,v);
            // W
            d3d_draw_wall(x1,y1,z1,x1,y3,z2,texid,u,v);
            // E
            d3d_draw_wall(x2,y3,z1,x2,y2,z2,texid,u,v);
        
        }
        else
        {
            // Vertical Wall
            u = sprite_height / sprite_get_width(tex);
            x1 = x;
            x2 = (x1);
            var x4 = x1 + sprite_width;
            var x3 = x2 + sprite_width;    
            // W
            d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,u,v);
            // E
            d3d_draw_wall(x3,y2,z1,x4,y1,z2,texid,u,v);
            // N
            d3d_draw_wall( x4, y1, z1, x1, y1, z2, texid, u, v );
            // S
            d3d_draw_wall( x2, y2, z1, x3, y2, z2, texid, u, v );
        }
        break;
}
d3d_set_depth(z-height);
draw_set_color(c_white);
d3d_set_culling(false)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);










