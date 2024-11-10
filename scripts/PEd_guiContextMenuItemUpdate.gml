/// PEd_guiContextMenuItemUpdate(contextMenuItem)
/**
 * @brief Updates the context menu item.
 * @param {real} contextMenuItem The id of the context menu item.
 */
var _item = argument0;
PEd_guiShapeUpdate(_item);

if (mouse_check_button_pressed(mb_left)
    && PEd_guiShapeIsHovered(_item))
{
    var _scrAction = _item[? "scrAction"];
    if (_scrAction != noone)
    {
        script_execute(_scrAction);
        PEd_guiDestroyShape(PEd_guiShapeGetDelegate(_item));
        guiContextMenu = noone;
    }
}
