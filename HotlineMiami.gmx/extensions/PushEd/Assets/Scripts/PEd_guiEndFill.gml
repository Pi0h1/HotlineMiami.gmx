/// PEd_guiEndFill(canvas)
/**
 * @brief Finishes drawing into the canvas and resets the render target.
 * @param {canvas} The id of the canvas.
 */
if (guiShapeFilling == argument0)
{
    var _scrollX = 0;
    var _scrollY = 0;
    var _scrollbarVer = argument0[? "scrollbarVer"];
    var _scrollbarHor = argument0[? "scrollbarHor"];
    var _drawVer = false;
    var _drawHor = false;
    
    if (!is_undefined(_scrollbarVer))
    {
        _drawVer = PEd_guiScrollbarIsVisible(_scrollbarVer);
        _scrollY = PEd_guiScrollbarGetScroll(_scrollbarVer) * _drawVer;
    }
    if (!is_undefined(_scrollbarHor))
    {
        _drawHor = PEd_guiScrollbarIsVisible(_scrollbarHor);
        _scrollX = PEd_guiScrollbarGetScroll(_scrollbarHor) * _drawHor;
    }
    
    if (!is_undefined(_scrollbarVer))
    {
        var _height = PEd_guiShapeGetHeight(argument0) - _drawHor * PEd_guiShapeGetHeight(_scrollbarHor);
        PEd_guiShapeSetHeight(_scrollbarVer, _height);
        _scrollbarVer[? "size"] = _height;
        PEd_guiScrollbarCalcJumpAndThumbSize(_scrollbarVer);
        
        if (_drawVer)
        {
            PEd_guiDrawItem(_scrollbarVer, _scrollX + PEd_guiShapeGetWidth(argument0) - PEd_guiShapeGetWidth(_scrollbarVer), _scrollY);
        }
    }
        
    if (!is_undefined(_scrollbarHor))
    {
        var _width = PEd_guiShapeGetWidth(argument0) - _drawVer * PEd_guiShapeGetWidth(_scrollbarVer);
        PEd_guiShapeSetWidth(_scrollbarHor, _width);
        _scrollbarHor[? "size"] = _width;
        PEd_guiScrollbarCalcJumpAndThumbSize(_scrollbarHor);
        
        if (_drawHor)
        {
            PEd_guiDrawItem(_scrollbarHor, _scrollX, _scrollY + PEd_guiShapeGetHeight(argument0) - PEd_guiShapeGetHeight(_scrollbarHor));
        }
    }
    
    PEd_guiMatrixRestore();
    surface_reset_target();
    guiShapeFilling = noone;
}
