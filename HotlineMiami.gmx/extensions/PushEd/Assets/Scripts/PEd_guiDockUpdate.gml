/// PEd_guiDockUpdate(dock)
/**
 * @brief Updates the dock.
 * @param {real} dock The id of the dock.
 */
var _dock = argument0;
PEd_guiCompoundShapeUpdate(_dock);

// Start resizing
if (!PEd_guiShapeExists(guiShapeActive)
    && PEd_guiShapeIsHovered(_dock))
{
    var _x = PEd_guiShapeGetX(_dock);
    var _y = PEd_guiShapeGetY(_dock);
    var _width = PEd_guiShapeGetWidth(_dock);
    var _height = PEd_guiShapeGetHeight(_dock);
    var _splitType = _dock[? "splitType"];
    var _splitSize = _dock[? "splitSize"];
    var _padding = _dock[? "padding"];
    var _middle;
    
    if (_splitType == PEdGUISplit.Horizontal)
    {
        _middle = round(_width * _splitSize);
        
        // Horizontally
        if (guiMouseX >= _middle - _padding
            && guiMouseX < _middle + _padding)
        {
            guiCursor = cr_size_we;
            if (mouse_check_button_pressed(mb_left))
            {
                guiShapeActive = _dock;
                _dock[? "mouseOffset"] = _middle - guiMouseX;
            }
        }
    }
    else
    {
        _middle = round(_height * _splitSize);
        
        // Vertically
        if (guiMouseY >= _middle - _padding
            && guiMouseY < _middle + _padding)
        {
            guiCursor = cr_size_ns;
            if (mouse_check_button_pressed(mb_left))
            {
                guiShapeActive = _dock;
                _dock[? "mouseOffset"] = _middle - guiMouseY;
            }
        }
    }
}

// Resize
if (guiShapeActive == _dock)
{
    if (mouse_check_button(mb_left))
    {
        if (_dock[? "splitType"] == PEdGUISplit.Horizontal)
        {
            _dock[? "splitSize"] = (guiMouseX + _dock[? "mouseOffset"]) / PEd_guiShapeGetWidth(_dock);
            guiCursor = cr_size_we;
        }
        else
        {
            _dock[? "splitSize"] = (guiMouseY + _dock[? "mouseOffset"]) / PEd_guiShapeGetHeight(_dock);
            guiCursor = cr_size_ns;
        }
        _dock[? "splitSize"] = clamp(_dock[? "splitSize"], 0.1, 0.9);
    }
    else
    {
        guiShapeActive = noone;
    }
}
