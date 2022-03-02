/// PEd_guiCreateScrollbarVer(delegate)
/**
 * @brief Creates a new horizontal scrollbar.
 * @param {real} delegate The id of the scrollbars delegate.
 * @return {real} The id of the created scrollbar.
 */
var _scrollbarVer = PEd_guiCreateScrollbar(argument0);
var _sprite = PEd_guiSprScrollbarVer;
_scrollbarVer[? "sprite"] = _sprite;
_scrollbarVer[? "spriteSize"] = sprite_get_height(_sprite);
PEd_guiShapeSetWidth(_scrollbarVer, sprite_get_width(_sprite));
_scrollbarVer[? "scrUpdate"] = PEd_guiScrollbarVerUpdate;
_scrollbarVer[? "scrDraw"] = PEd_guiScrollbarVerDraw;
return _scrollbarVer;
