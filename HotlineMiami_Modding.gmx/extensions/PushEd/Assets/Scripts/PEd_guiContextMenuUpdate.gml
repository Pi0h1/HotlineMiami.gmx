/// PEd_guiContextMenuUpdate(contextMenu)
/**
 * @brief Updates the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
PEd_guiContainerUpdate(_contextMenu);

// Clamp position
PEd_guiShapeSetPosition(_contextMenu,
    min(PEd_guiShapeGetX(_contextMenu), windowWidth - PEd_guiShapeGetWidth(_contextMenu)),
    min(PEd_guiShapeGetY(_contextMenu), windowHeight - PEd_guiShapeGetHeight(_contextMenu)));
