/// PEd_guiContentInfo(container)
/**
 * @brief Draws the content of an Info to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _text = "PushEd " + PEd_VERSION;
draw_text(8, 8, _text);
return PEd_vec2(string_width(_text) + 16, string_height(_text) + 16);
