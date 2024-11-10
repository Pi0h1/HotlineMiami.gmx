/// PEd_createBackground()
/**
 * @brief Creates a background.
 * @return {real} The id of the background.
 */
var _background = ds_map_create();
_background[? "x"] = 0;
_background[? "y"] = 0;
_background[? "foreground"] = false;
_background[? "stretch"] = 0;
_background[? "index"] = noone;
_background[? "htiled"] = false;
_background[? "vtiled"] = false;
_background[? "hspeed"] = 0;
_background[? "vspeed"] = 0;
_background[? "visible"] = false;
return _background;
