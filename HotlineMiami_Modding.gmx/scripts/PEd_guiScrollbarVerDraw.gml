/// PEd_guiScrollbarVerDraw(scrollbarVer)
/**
 * @brief Draws the vertical scrollbar.
 * @param {real} scrollbarVer The id of the vertical scrollbar.
 */
if (PEd_guiScrollbarIsVisible(argument0))
{
    // Thumb
    var _x = PEd_guiShapeGetX(argument0);
    var _y = PEd_guiShapeGetY(argument0) + argument0[? "scroll"];
    var _thumbSize = argument0[? "thumbSize"];
    var _sprite = argument0[? "sprite"];
    var _spriteSize = argument0[? "spriteSize"];
    var _alpha = 0.75;
    draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, PEdColour.Scrollbar, _alpha);
    draw_sprite_stretched_ext(_sprite, 1, _x, _y + _spriteSize, PEd_guiShapeGetWidth(argument0), _thumbSize - _spriteSize * 2, PEdColour.Scrollbar, _alpha);
    draw_sprite_ext(_sprite, 2, _x, _y + _thumbSize - _spriteSize, 1, 1, 0, PEdColour.Scrollbar, _alpha);
}
