/// PEd_guiKeyboardShorcutAddKey(keyboardShortcut, key)
/**
 * @brief Adds key to the keyboard shortcut.
 * @param {real} keyboardShortcut The id of the keyboard shortcut.
 * @param {real} key              The key.
 */
gml_pragma("forceinline");
ds_list_add(argument0[? "keys"], argument1);
