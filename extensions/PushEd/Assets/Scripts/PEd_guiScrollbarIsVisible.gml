/// PEd_guiScrollbarIsVisible(scrollbar)
/**
 * @brief Finds out whether the scrollbar is visible.
 * @param {real} scrollbar The id of the scrollbar.
 * @return {bool} True if the scrollbar is visible.
 */
var _scrollbar = argument0;
var _delegate = PEd_guiShapeGetDelegate(_scrollbar);
if (_delegate[? "scrollbarHor"] == _scrollbar)
{
    if (_scrollbar[? "contentSize"] > PEd_guiShapeGetWidth(_delegate))
    {
        return true;
    }
}
if (_delegate[? "scrollbarVer"] == _scrollbar)
{
    if (_scrollbar[? "contentSize"] > PEd_guiShapeGetHeight(_delegate))
    {
        return true;
    }
}
return false;
