/// PEd_guiScrollbarHorDraw(scrollbarHor)
/**
 * @brief Draws the horizontal scrollbar.
 * @param {real} scrollbarHor The id of the horizontal scrollbar.
 */
if (PEd_guiScrollbarIsVisible(argument0))
{ 
    // Thumb
    var _x = PEd_guiShapeGetX(argument0) + argument0[? "scroll"];
    var _y = PEd_guiShapeGetY(argument0);
    var _thumbSize = argument0[? "thumbSize"];
    var _sprite = argument0[? "sprite"];
    var _spriteSize = argument0[? "spriteSize"];
    var _alpha = 0.75;
    draw_sprite_ext(_sprite, 0, _x, _y, 1, 1, 0, PEdColour.Scrollbar, _alpha);
    draw_sprite_stretched_ext(_sprite, 1, _x + _spriteSize, _y, _thumbSize - _spriteSize * 2, PEd_guiShapeGetHeight(argument0), PEdColour.Scrollbar, _alpha);
    draw_sprite_ext(_sprite, 2, _x + _thumbSize - _spriteSize, _y, 1, 1, 0, PEdColour.Scrollbar, _alpha);
}
