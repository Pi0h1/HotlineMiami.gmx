/// PEd_guiContextMenuDraw(contextMenu)
/**
 * @brief Draws the context menu.
 * @param {real} contextMenu The id of the context menu.
 */
var _contextMenu = argument0;
if (PEd_guiBeginFill(_contextMenu))
{
    var _contextMenuItems = PEd_guiCompoundShapeGetItems(_contextMenu);
    var _x = 0;
    var _y = 4;
    var _width = 1;
    
    // Draw items
    var _size = ds_list_size(_contextMenuItems);
    for (var i = 0; i < _size; i++)
    {
        var _item = _contextMenuItems[| i];
        PEd_guiDrawItem(_item, 0, _y);
        _width = max(_width, PEd_guiShapeGetWidth(_item));
        _y += PEd_guiShapeGetHeight(_item);
    }
    
    // Set context menu size
    var _contextMenuWidth = clamp(_width, 200, windowWidth);
    var _contextMenuHeight = min(_y + 4, windowHeight);
    PEd_guiShapeSetWidth(_contextMenu, _contextMenuWidth);
    PEd_guiShapeSetHeight(_contextMenu, _contextMenuHeight);
    PEd_guiContainerSetContentWidth(_contextMenu, _contextMenuWidth);
    PEd_guiContainerSetContentHeight(_contextMenu, _contextMenuHeight);
    PEd_guiEndFill(_contextMenu);
}

// Draw context menu
var _surface = PEd_guiCanvasGetSurface(_contextMenu);
if (surface_exists(_surface))
{
    var _x = PEd_guiShapeGetX(_contextMenu);
    var _y = PEd_guiShapeGetY(_contextMenu);
    var _width = surface_get_width(_surface);
    var _height = surface_get_height(_surface);
    if (_width > 1
         && _height > 1)
    {
        //PEd_guiDrawShadow(_x, _y, _width, _height, PEdColour.Shadow, PEdColour.ShadowAlpha);
        PEd_guiDrawRectangle(_x - 1, _y - 1, _width + 2, _height + 2, PEdColour.WindowBorder, 1);
    }
}
PEd_guiCanvasDraw(_contextMenu);
