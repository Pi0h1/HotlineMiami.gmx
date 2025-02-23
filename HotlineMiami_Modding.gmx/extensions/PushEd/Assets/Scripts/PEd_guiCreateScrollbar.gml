/// PEd_guiCreateScrollbar(delegate)
/**
 * @brief Creates a new scrollbar.
 * @param {real} delegate The id of the scrollbars delegate.
 * @return {real} The id of the created scrollbar.
 */
var _scrollbar = PEd_guiCreateShape(PEdGUIShape.Scrollbar);
PEd_guiShapeSetDelegate(_scrollbar, argument0);
PEd_guiShapeSetDepth(_scrollbar, 16777216);
_scrollbar[? "sprite"] = noone;
_scrollbar[? "spriteSize"] = 1;
_scrollbar[? "contentSize"] = 0.1;
_scrollbar[? "scrUpdate"] = PEd_guiScrollbarUpdate;
_scrollbar[? "size"] = 1;
_scrollbar[? "scroll"] = 0;
_scrollbar[? "scrollJump"] = 1;
_scrollbar[? "mouseOffset"] = 0;
_scrollbar[? "minThumbSize"] = 12;
_scrollbar[? "thumbSize"] = _scrollbar[? "minThumbSize"];
return _scrollbar;
