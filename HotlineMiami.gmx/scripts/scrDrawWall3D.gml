var offset = 0;
var z = 0;
var height = (64+offset);

d3d_set_culling(true);

d3d_set_depth(-2);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_black,0.5);
d3d_set_depth(z-height);

var tex     = sprite_index;
var texid   = -1;
var u       = 1;
var v       = 1;

var col = c_white;

if (object_index == objWallBrickH || object_index == objWallBrickV) {
    col     = make_colour_rgb(127,0,20);
    tex     = sprWallTextureBrick
    height  = (64);
} else {
    col     = make_colour_rgb(192,192,192);
    tex     = sprWallTexture;
    height  = (64);
}

var x1      = x;
var y1      = y;
var z1      = (z-height);
var x2      = x;
var y2      = y;
var z2      = z;

texid = sprite_get_texture(tex,0);

v = height/sprite_get_height(tex);
draw_set_color(col);

if (sprite_width > sprite_height) {
    // Horizontal Wall
    u = sprite_width /sprite_get_width(tex);
    x2 = (x+sprite_width);
    y1 = y;
    y2 = (y1);
    d3d_draw_wall(x2,y1,z1,x1,y2,z2,texid,u,v);
    
    y1 += sprite_height;
    y2 += sprite_height;    
    d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,u,v);

} else {
    // Vertical Wall
    u = sprite_height /sprite_get_width(tex);
    x1 = x;
    x2 = (x1);
    y2 = y+(sprite_height);
    d3d_draw_wall(x1,y1,z1,x2,y2,z2,texid,u,v);
    
    x1 += sprite_width;
    x2 += sprite_width;    
    d3d_draw_wall(x1,y2,z1,x2,y1,z2,texid,u,v);
}

draw_set_color(c_white);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
d3d_set_culling(false)
