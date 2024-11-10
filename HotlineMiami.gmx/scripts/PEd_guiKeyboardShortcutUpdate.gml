/// PEd_guiKeyboardShortcutUpdate(keyboardShortcut)
/**
 * @brief Updates the keyboard shortcut.
 * @param {real} keyboardShortcut The id of the keyboard shortcut.
 */
var _shortcut = argument0;
var _action = _shortcut[? "scrAction"];
if (_action == noone
    || guiInputActive != noone)
{
    exit;
}

var _keys = _shortcut[? "keys"];
var _size = ds_list_size(_keys);

if (_size != ds_list_size(guiKeyLog))
{
    exit;
}

for (var i = _size - 1; i >= 0; i--)
{
    if (guiKeyLog[| i] != _keys[| i])
    {
        exit;
    }
}

ds_list_delete(guiKeyLog, _size - 1);
script_execute(_action);
