/// PEd_guiDraw()
/**
 * @brief Draws GUI.
 */
colorShow = -1;
draw_clear(PEdColour.Background);
draw_set_font(PEd_fntNormal);
draw_set_colour(c_white);

var _mouseX = window_mouse_get_x();
var _mouseY = window_mouse_get_y();
var _guiWidth = window_get_width();
var _guiHeight = window_get_height();

// Draw items
var _items = PEd_guiCompoundShapeGetItems(guiRoot);
for (var i = 0; i < ds_list_size(_items); i++)
{
    var _item = _items[| i];
    if (PEd_guiShapeExists(_item))
    {
        PEd_guiDrawItem(_item);
    }
    else
    {
        ds_list_delete(_items, i--);
    }
}

// Draw hovered background
if (mouse_check_button_released(mb_left)
    && guiDnDBackground != -1)
{
    PEd_guiRequestRedrawAll(guiRoot)
    guiDnDBackground = -1;
}
 
var _bkg = max(bkgShow, guiDnDBackground);
if (_bkg != -1)
{
    var _bkgW = background_get_width(_bkg);
    var _bkgH = background_get_height(_bkg);
    var _aspect = _bkgW / _bkgH;
    var _w = 64;
    var _h = 64 / _aspect;
    var _x = min(_mouseX + 24, _guiWidth - _w - 8);
    var _y = min(_mouseY + 24, _guiHeight - _h - 8);
    
    if (_bkg == guiDnDBackground)
    {
        draw_background_stretched_ext(_bkg, _x, _y, _w, _h, c_white, 0.5);
    }
    else
    {
        PEd_guiDrawRectangle(_x - 8, _y - 8, _w + 16, _h + 16, PEdColour.WindowBorder);
        PEd_guiDrawRectangle(_x - 7, _y - 7, _w + 14, _h + 14, PEdColour.WindowBackground);
        draw_background_stretched(_bkg, _x, _y, _w, _h);
        PEd_guiDrawTextShadow(_x, _y, string(_bkgW) + "x" + string(_bkgH), PEdColour.Text, c_black);
    }
}

// Draw hovered color
if (colorShow != -1)
{
    var _bkgW = background_get_width(_bkg);
    var _bkgH = background_get_height(_bkg);
    var _aspect = _bkgW / _bkgH;
    var _w = 64;
    var _h = 64 / _aspect;
    var _x = min(_mouseX + 24, _guiWidth - _w - 8);
    var _y = min(_mouseY + 24, _guiHeight - _h - 8);
    
    PEd_guiDrawRectangle(_x - 8, _y - 8, _w + 16, _h + 16, PEdColour.WindowBorder);
    PEd_guiDrawRectangle(_x - 7, _y - 7, _w + 14, _h + 14, PEdColour.WindowBackground);
    PEd_guiDrawRectangle(_x, _y, _w, _h, colorShow);
    PEd_guiDrawTextShadow(_x, _y, colorShow, PEdColour.Text, c_black);
}

// Popup message
if (guiPopupMessage != "")
{
    if (current_time - guiPopupTimer < guiPopupDuration)
    {
        PEd_guiDrawPopupMessage(viewportX + viewportWidth, viewportY + viewportHeight, guiPopupMessage);
    }
    else
    {
        guiPopupTimer = noone;
    }
}

// Draw tooltip
if (string_length(guiTooltip) > 0)
{
    PEd_guiDrawTooltip(_mouseX + 16, _mouseY + 16, guiTooltip);
}

// Draw debug
/*PEd_guiDrawTextShadow(_mouseX + 16, _mouseY + 64,
    "hoveredShape = " + string(guiShapeHovered)
    + "#activeShape = " + string(guiShapeActive)
    + "#mousePos = " + string(PEd_vec2(guiMouseX, guiMouseY)),
    c_yellow, c_black);*/

// Set cursor
if (_mouseX > 2
    && _mouseY > 2
    && _mouseX < window_get_width() - 2
    && _mouseY < window_get_height() - 2)
{
    window_set_cursor(guiCursor);
}
guiCursor = cr_default;

mouseLastX = _mouseX;
mouseLastY = _mouseY;

// Handle destroy requests
while (!ds_stack_empty(guiDestroyStack))
{
    var _shape = ds_stack_pop(guiDestroyStack);
    if (PEd_guiShapeExists(_shape))
    {
        script_execute(_shape[? "scrCleanUp"], _shape);
        if (guiShapeActive == _shape)
        {
            guiShapeActive = noone;
        }
    }
}
