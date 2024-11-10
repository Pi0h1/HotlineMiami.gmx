/// PEd_createViewport(visible, x, y, width, height, borderH, borderV, speedH, speedV, object)
/**
 * @brief Creates a new viewport.
 * @param {bool} visible True to make the viewport visible.
 * @param {real} x       The x position of the viewport.
 * @param {real} y       The y position of the viewport.
 * @param {real} width   The width of the viewport.
 * @param {real} height  The height of the viewport.
 * @param {real} borderH The size of the horizontal border of the viewport.
 * @param {real} borderV The size of the vertical border of the viewport.
 * @param {real} speedH  The horizontal speed of the viewport.
 * @param {real} speedV  The vertical speed of the viewport.
 * @param {real} object  The object that the viewport will follow. Use noone for none.
 * @return {real} The id of the viewport.
 */
var _viewport = ds_map_create();
_viewport[? "visible"] = argument0;
_viewport[? "x"] = argument1;
_viewport[? "y"] = argument2;
_viewport[? "width"] = argument3;
_viewport[? "height"] = argument4;
_viewport[? "portX"] = argument1;
_viewport[? "portY"] = argument2;
_viewport[? "portWidth"] = argument3;
_viewport[? "portHeight"] = argument4;
_viewport[? "borderHor"] = argument5;
_viewport[? "borderVer"] = argument6;
_viewport[? "speedHor"] = argument7;
_viewport[? "speedVer"] = argument8;
_viewport[? "object"] = argument9;
return _viewport;
