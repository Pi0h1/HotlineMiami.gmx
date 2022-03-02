/// PEd_guiCreateKeyboardShortcut(action)
/**
 * @brief Creates a new keyboard shortcut.
 * @param {real} action The script that will be executed with the keyboard shortcut.
 * @return {real} The id of the created keyboard shortcut.
 */
var _shortcut = ds_map_create();
ds_map_add_list(_shortcut, "keys", ds_list_create());
_shortcut[? "scrAction"] = argument0;
return _shortcut;
