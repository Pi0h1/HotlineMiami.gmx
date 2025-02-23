/// PEd_guiContainerUpdate(container)
/**
 * @brief Updates the container.
 * @param {real} container The id of the container.
 */
var _container = argument0;
var _scrollbarHor = _container[? "scrollbarHor"];
var _scrollbarVer = _container[? "scrollbarVer"];
PEd_guiCompoundShapeUpdate(_container);

// Click scroll
if (mouse_check_button_pressed(mb_middle)
    && PEd_guiShapeIsHovered(_container)
    && !PEd_guiShapeExists(guiShapeActive))
{
    _container[? "clickScroll"] = true;
    _container[? "clickScrollMouseX"] = windowMouseX;
    _container[? "clickScrollMouseY"] = windowMouseY;
    guiShapeActive = _container;
}

if (guiShapeActive == _container
    && _container[? "clickScroll"])
{
    _scrollbarHor[? "scroll"] += (windowMouseX - _container[? "clickScrollMouseX"])
                                / _scrollbarHor[? "scrollJump"] * 0.1;
    _scrollbarVer[? "scroll"] += (windowMouseY - _container[? "clickScrollMouseY"])
                                / _scrollbarVer[? "scrollJump"] * 0.1;
                                
    _scrollbarHor[? "scroll"] = clamp(_scrollbarHor[? "scroll"], 0, _scrollbarHor[? "size"] - _scrollbarHor[? "thumbSize"]);
    _scrollbarVer[? "scroll"] = clamp(_scrollbarVer[? "scroll"], 0, _scrollbarVer[? "size"] - _scrollbarVer[? "thumbSize"]);
                                
    if (!mouse_check_button(mb_middle))
    {
        _container[? "clickScroll"] = false;
        guiShapeActive = noone;
    }
    guiCursor = cr_drag;
}
