/// PEd_guiCreateDock([x, y, width, height])
/**
 * @brief Creates a new dock.
 * @param {real} [x]      The x positon to create the dock at.
 * @param {real} [y]      The y positon to create the dock at.
 * @param {real} [width]  The width of the dock.
 * @param {real} [height] The width of the dock.
 * @return {real} The id of the created dock.
 */
var _dock = PEd_guiCreateCompoundShape(PEdGUIShape.Dock);
if (argument_count == 4)
{
    PEd_guiShapeSetRectangle(_dock, argument[0], argument[1], argument[2], argument[3]);
}
PEd_guiShapeSetDepth(_dock, -16777216);
_dock[? "splitSize"] = 0.5;
_dock[? "splitType"] = PEdGUISplit.Horizontal;
_dock[? "scrUpdate"] = PEd_guiDockUpdate;
_dock[? "scrDraw"] = PEd_guiDockDraw;
_dock[? "mouseOffset"] = 0;
_dock[? "padding"] = 3;
return _dock;
