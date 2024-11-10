/// PEd_guiShowContextMenu(contextMenu, [x, y])
/**
 * @brief Shows the context menu.
 * @param {real} contextMenu The id of the context menu to show.
 * @param {real} [x]         The x position to show the context menu at.
 * @param {real} [y]         The y position to show the context menu at.
 * @note If the position coordinates are not specified, then the current
 *       window mouse position is used.
 */
if (guiContextMenu)
{
    PEd_guiDestroyShape(guiContextMenu);
}
guiContextMenu = argument[0];
if (argument_count > 1)
{
    PEd_guiShapeSetPosition(guiContextMenu, argument[1], argument[2]);
}
else
{
    PEd_guiShapeSetPosition(guiContextMenu, windowMouseX, windowMouseY);
}
PEd_guiAddItem(guiRoot, guiContextMenu);
