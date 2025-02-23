/// PEd_guiContainerDraw(container)
/**
 * @brief Draws the container.
 * @param {real} container The id of the container.
 */
// Draw items
if (PEd_guiBeginFill(argument0))
{
    var _size = PEd_vec2(0.1, 0.1);
    var _content = argument0[? "content"];
    if (_content != noone)
    {
        _size = script_execute(_content, argument0);
    }
    
    PEd_guiContainerSetContentWidth(argument0, _size[0]);
    PEd_guiContainerSetContentHeight(argument0, _size[1]);
    PEd_guiEndFill(argument0);
}

// Draw container
PEd_guiCanvasDraw(argument0);
