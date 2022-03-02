/// PEd_guiCreateScrollbarHor(delegate)
/**
 * @brief Creates a new horizontal scrollbar.
 * @param {real} delegate The id of the scrollbars delegate.
 * @return {real} The id of the created scrollbar.
 */
var _scrollbarHor = PEd_guiCreateScrollbar(argument0);
var _sprite = PEd_guiSprScrollbarHor;
_scrollbarHor[? "sprite"] = _sprite;
_scrollbarHor[? "spriteSize"] = sprite_get_width(_sprite);
PEd_guiShapeSetHeight(_scrollbarHor, sprite_get_height(_sprite));
_scrollbarHor[? "scrUpdate"] = PEd_guiScrollbarHorUpdate;
_scrollbarHor[? "scrDraw"] = PEd_guiScrollbarHorDraw;
return _scrollbarHor;
