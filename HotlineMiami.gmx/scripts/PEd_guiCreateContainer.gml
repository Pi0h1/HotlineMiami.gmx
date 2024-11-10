/// PEd_guiCreateContainer([x, y, width, height])
/**
 * @brief Creates a new scrollable container.
 * @param {real} [x]      The x positon to create the container at.
 * @param {real} [y]      The y positon to create the container at.
 * @param {real} [width]  The width of the container.
 * @param {real} [height] The width of the container.
 * @return {real} The id of the created container.
 */
var _container = PEd_guiCreateCanvas(PEdGUIShape.Container);
if (argument_count == 4)
{
    PEd_guiShapeSetRectangle(_container, argument[0], argument[1], argument[2], argument[3]);
}
PEd_guiContainerSetContent(_container, noone);
_container[? "scrDraw"] = PEd_guiContainerDraw;
_container[? "scrUpdate"] = PEd_guiContainerUpdate;
_container[? "clickScroll"] = false;
_container[? "clickScrollMouseX"] = 0;
_container[? "clickScrollMouseY"] = 0;
ds_map_add_map(_container, "scrollbarHor", PEd_guiCreateScrollbarHor(_container));
ds_map_add_map(_container, "scrollbarVer", PEd_guiCreateScrollbarVer(_container));
return _container;
