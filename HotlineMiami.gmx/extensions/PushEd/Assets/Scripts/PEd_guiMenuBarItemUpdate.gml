/// PEd_guiMenuBarItemUpdate(menuBarItem)
/**
 * @brief Updates the menu bar item.
 * @param {real} menuBarItem The id of the menu bar item.
 */
var _item = argument0;
PEd_guiShapeUpdate(_item);

var _index = _item[? "index"];
var _scrContextMenu = _item[? "scrContextMenu"];
if (_scrContextMenu != noone
    && PEd_guiShapeIsHovered(_item))
{
    var _delegate = PEd_guiShapeGetDelegate(_item);
    var _current = _delegate[? "current"];
    
    if (mouse_check_button_pressed(mb_left))
    {
        if (_current == noone)
        {
            // Enable opening the context menus for the menu bar
            _delegate[? "current"] = _index;
        }
        else
        {
            // Close context menu
            _delegate[? "current"] = noone;
            PEd_guiDestroyShape(guiContextMenu);
        }
    }
    
    // Open the context menu for this item
    if (_delegate[? "current"] != noone)
    {
        _delegate[? "current"] = _index;
        if (_current != _index)
        {
            var _contextMenu = PEd_guiCreateContextMenu();
            script_execute(_scrContextMenu, _contextMenu);
            PEd_guiShowContextMenu(_contextMenu,
                PEd_guiShapeGetX(_item),
                PEd_guiShapeGetY(_delegate) + PEd_guiShapeGetHeight(_delegate) + 1);
        }
    }
}
