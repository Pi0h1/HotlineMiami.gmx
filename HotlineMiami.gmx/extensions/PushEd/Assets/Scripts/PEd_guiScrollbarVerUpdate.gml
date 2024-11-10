/// PEd_guiScrollbarVerUpdate(scrollbarVer)
/**
 * @brief Updates the vertical scrollbar.
 * @param {real} scrollbarVer The id of the vertical scrollbar.
 */
var _scrollbar = argument0;

_scrollbar[? "size"] = PEd_guiShapeGetHeight(_scrollbar);
if (!keyboard_check(vk_control))
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
    var _y = _scrollbar[? "scroll"];
    
    if (guiShapeHovered == _scrollbar
        && guiMouseY > _y
        && guiMouseY < _y + _scrollbar[? "thumbSize"])
    {
        //_scrollbar[? "mouseOffset"] = _y - guiMouseY;
        _scrollbar[? "mouseOffset"] = windowMouseY;
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
        //_scroll = guiMouseY + _scrollbar[? "mouseOffset"];
        _scroll += windowMouseY - _scrollbar[? "mouseOffset"];
        _scrollbar[? "mouseOffset"] = windowMouseY;
    }
    _scroll = clamp(_scroll, 0, PEd_guiShapeGetHeight(_scrollbar) - _scrollbar[? "thumbSize"]);
    _scrollbar[? "scroll"] = _scroll;
}
