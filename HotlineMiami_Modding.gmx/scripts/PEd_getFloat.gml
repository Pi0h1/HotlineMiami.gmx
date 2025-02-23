/// PEd_getFloat(str, def)
/**
 * @brief Displays a popup message for the user to input a floating point number.
 * @param {string} str The string to show in the popup message.
 * @param {real}   def The default number in the popup message.
 * @return {real} The input number, or the default value if nothing has been entered. 
 */
gml_pragma("forceinline");
return real(get_string(argument0, string(argument1)));
