/// PEd_guiKeyboardShortcutToString(keyboardShortcut)
/**
 * @brief Converts the keyboard shortcut into a human readable string.
 * @param {real} keyboardShortcut The id of the keyboard shortcut.
 * @return {string} The keyboard shortcut converted into a human readable string. 
 */
var _shortcut = argument0;
var _keys = _shortcut[? "keys"];
var _string = "";
var _size = ds_list_size(_keys);
for (var i = 0; i < _size - 1; i++)
{
    _string += PEd_keyToString(_keys[| i]) + "+";
}
if (_size >= 1)
{
    _string += PEd_keyToString(_keys[| _size - 1]);
}
return _string;
