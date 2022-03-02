/// PEd_guiAddKeyboardShortcut(shape, keyboardShortcut)
/**
 * @brief Adds keyboard shortcut to the shape.
 * @pram {real} shape             The id of the shape to add the keyboard shortcut to.
 * @param {real} keyboardShortcut The id of the keyboard shortcut.
 */
var _shape = argument0;
if (is_undefined(_shape[? "keyboardShortcuts"]))
{
    ds_map_add_list(_shape, "keyboardShortcuts", ds_list_create());
}
PEd_dsListAddMap(_shape[? "keyboardShortcuts"], argument1);
