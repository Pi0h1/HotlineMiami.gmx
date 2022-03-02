/// PEd_guiScrollbarHorUpdate(scrollbarHor)
/**
 * @brief Updates the horizontal scrollbar.
 * @param {real} scrollbarHor The id of the horizontal scrollbar.
 */
var _scrollbar = argument0;
_scrollbar[? "size"] = PEd_guiShapeGetWidth(_scrollbar);

if (keyboard_check(vk_control))
{
    PEd_guiScrollbarUpdate(_scrollbar);
}
else
{
    PEd_guiShapeUpdate(_scrollbar);
}

// Start scrolling with mouse click
// TODO: Fix scrollbars so that the commented code works
if (guiShapeHovered == _scrollbar
    && mouse_check_button_pressed(mb_left))
{
    var _x = _scrollbar[? "scroll"];
    
    if (guiShapeHovered == _scrollbar
        && guiMouseX > _x
        && guiMouseX < _x + _scrollbar[? "thumbSize"])
    {
        //_scrollbar[? "mouseOffset"] = _x - guiMouseX;
        _scrollbar[? "mouseOffset"] = windowMouseX;
        guiShapeActive = _scrollbar;
    }
}

// Stop scrolling
if (mouse_check_button_released(mb_left)
    && guiShapeActive == _scrollbar)
{
    guiShapeActive = noone;
}

// Handle scrolling
if (PEd_guiScrollbarIsVisible(_scrollbar))
{   
    var _scroll = _scrollbar[? "scroll"];
    if (guiShapeActive == _scrollbar)
    {
        //_scroll = guiMouseX + _scrollbar[? "mouseOffset"];
        _scroll += windowMouseX - _scrollbar[? "mouseOffset"];
        _scrollbar[? "mouseOffset"] = windowMouseX;
    }
    _scroll = clamp(_scroll, 0, PEd_guiShapeGetWidth(_scrollbar) - _scrollbar[? "thumbSize"]);
    _scrollbar[? "scroll"] = _scroll;
}
