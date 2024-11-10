/// PEd_guiToolbarButtonUpdate(toolbarButton)
/**
 * @brief Updates the toolbar button.
 * @param {real} toolbarButton The id of the toolbar button.
 */
PEd_guiShapeUpdate(argument0);

if (PEd_guiShapeIsHovered(argument0)
    && mouse_check_button_pressed(mb_left))
{
    var _scrAction = argument0[? "scrAction"];
    if (_scrAction != noone)
    {
        script_execute(_scrAction);
    }
}
