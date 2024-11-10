/// PEd_removeFromStr(startStr, endStr, string)
/**
 * @brief Removes part beginning with startStr and
 *        ending with endStr from the string.
 * @param {string} startStr The start of the part to remove.
 * @param {string} endStr   The end of the part to remove.
 * @param {string} string   The string to remove the part from.
 * @return {string} The string with the given part removed.
 */
var txt = argument2;
var s = string_pos(argument0, txt);
var e = string_pos(argument1, txt);
return string_delete(txt, s, e - s + string_length(argument1));
