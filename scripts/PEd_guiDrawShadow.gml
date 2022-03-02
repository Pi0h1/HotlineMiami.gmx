/// PEd_guiDrawShadow(x, y, width, height, colour, alpha)
/**
 * @brief Draws shadow of given size at given position.
 * @param {real} x      The x position of the shadow.
 * @param {real} y      The y position of the shadow.
 * @param {real} width  The width of the shadow.
 * @param {real} height The height of the shadow.
 * @param {real} colour The shadow colour.
 * @param {real} alpha  The shadow alpha.
 */
var _spr = PEd_guiSprShadow;
var _sprW = sprite_get_width(_spr);
var _offset = _sprW * 0.5;
var _x = argument0 + _offset;
var _y = argument1 + _offset;
var _w = argument2 - _sprW;
var _h = argument3 - _sprW;
var _col = argument4;
var _a = argument5;

draw_sprite_ext(_spr, 0, _x - _sprW, _y - _sprW, 1, 1, 0, _col, _a);
draw_sprite_stretched_ext(_spr, 1, _x, _y - _sprW, _w, _sprW, _col, _a);
draw_sprite_ext(_spr, 0, _x + _w + _sprW, _y - _sprW, -1, 1, 0, _col, _a);
draw_sprite_stretched_ext(_spr, 2, _x - _sprW, _y, _sprW, _h, _col, _a);
draw_sprite_ext(_spr, 2, _x + _w + _sprW, _y, -1, _h / _sprW, 0, _col, _a);
draw_sprite_ext(_spr, 0, _x - _sprW, _y + _h + _sprW, 1, -1, 0, _col, _a);
draw_sprite_ext(_spr, 1, _x, _y + _h + _sprW, _w / _sprW, -1, 0, _col, _a);
draw_sprite_ext(_spr, 0, _x + _w + _sprW, _y + _h + _sprW, -1, -1, 0, _col, _a);
