/// PEd_guiViewportDraw(viewport)
/**
 * @brief Draws the viewport.
 * @param {real} viewport The id of the viewport.
 */
var _viewport = argument0;
var _viewportX = PEd_guiShapeGetX(_viewport);
var _viewportY = PEd_guiShapeGetY(_viewport);
var _viewportW = PEd_guiShapeGetWidth(_viewport);
var _viewportH = PEd_guiShapeGetHeight(_viewport);

////////////////////////////////////////////////////////////////////////////////
//
// Draw title bar
//
var _titleBar = PEd_guiViewportGetTitleBar(_viewport);
PEd_guiShapeSetWidth(_titleBar, _viewportW);
PEd_guiDrawItem(_titleBar, 0, 0);
var _titleBarHeight = clamp(PEd_guiContainerGetContentHeight(_titleBar), 1, _viewportH - 1);
PEd_guiShapeSetHeight(_titleBar, _titleBarHeight);

// Draw border
_viewportY += _titleBarHeight;
_viewportH = max(_viewportH - _titleBarHeight, 2);

var _selectedShape = PEd_guiGetSelectedShape();
var _colourBorder = PEdColour.WindowBorder;
if (_selectedShape == _viewport
    || PEd_guiShapeDelegatesRecursive(_viewport, _selectedShape))
{
    _colourBorder = PEdColour.Active;
}
PEd_guiDrawRectangle(_viewportX, _viewportY, _viewportW, _viewportH, _colourBorder);

_viewportX += 1;
_viewportW = max(_viewportW - 2, 1);
_viewportH -= 1;

// Save viewport position
var _pos = d3d_transform_vertex(_viewportX, _viewportY, 0);
viewportX = _pos[0];
viewportY = _pos[1];
viewportWidth = max(_viewportW, 1);
viewportHeight = max(_viewportH, 1);

////////////////////////////////////////////////////////////////////////////////
//
// Draw viewport
//
if (global.pedUsing3D) 
{
    draw_surface(application_surface, _viewportX, _viewportY);
}
else 
{
    draw_surface_part(application_surface, 0, 0, 
                      min(_viewportW, surface_get_width(application_surface)), 
                      min(_viewportH, surface_get_height(application_surface)), 
                      _viewportX, _viewportY);
}

////////////////////////////////////////////////////////////////////////////////
//
// Draw instance highlight
//
var _size = ds_list_size(selectedObjects);
if (_size > 0
    && surface_exists(surInstSelect)) 
{
    shader_set(PEd_shOutline);
    shader_set_uniform_f(shader_get_uniform(PEd_shOutline, "uTexel"),
                         1 / _viewportW, 1 / _viewportH);
    draw_surface(surInstSelect, _viewportX, _viewportY);
    shader_reset();
}

////////////////////////////////////////////////////////////////////////////////
//
// Debug
//
if (debugShow)
{
    var _x = _viewportX;
    var _y = _viewportY;
    
    if (global.pedUsing3D) 
    {
        PEd_guiDrawTextShadow(_x, _y,
                           "Res = " + string(viewportWidth) + " x " + string(viewportHeight)
                           + "#CamPos = " + string(x) + " " + string(y) + " " + string(z)
                           + " Dir = " + string(direction) + " " + string(camPitch)
                           + "#Fov = " + string(camFOV)
                           + " ClipNear = " + string(camClipNear) + " ClipFar = " + string(camClipFar),
                           c_silver,
                           c_black);
        _y += guiFontHeight * 3;
    }
    else 
    {
        PEd_guiDrawTextShadow(_x, _y,
                           "Res = " + string(viewportWidth) + " x " + string(viewportHeight)
                           + "#ViewPos = " + string(view_xview[0]) + " " + string(view_yview[0])
                           + "#Zoom = " + string(1 / viewZoom),
                           c_silver,
                           c_black);
        _y += guiFontHeight * 3;
    }
    
    // FPS
    PEd_guiDrawTextShadow(_x, _y,
                       "Fps = " + string(fps) + " (" + string(fps_real) + ")",
                       merge_colour(c_maroon, c_green, fps / room_speed),
                       c_black);
    _y += guiFontHeight;
    
    // Scene details
    PEd_guiDrawTextShadow(_x, _y,
                       "Inst = " + string(instance_count),
                       c_silver,
                       c_black);
    _y += guiFontHeight;
}
