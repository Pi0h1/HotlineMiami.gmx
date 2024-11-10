/// PEd_guiScrollbarGetScroll(scrollbar)
/**
 * @brief Gets the scroll of the given scrollbar.
 * @param {real} scrollbar The id of the scrollbar.
 * @return {real} The content scroll.
 */
gml_pragma("forceinline");
return round(argument0[? "scroll"] * argument0[? "scrollJump"]);
