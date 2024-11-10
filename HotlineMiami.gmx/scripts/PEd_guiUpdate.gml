/// PEd_guiUpdate()
/**
 * @brief Updates GUI.
 */
guiTooltip = "";
guiMouseX = window_mouse_get_x();
guiMouseY = window_mouse_get_y();
PEd_guiShapeSetSize(guiRoot, windowWidth, windowHeight);

// Find hovered shape
var _lastHoveredShape = guiShapeHovered;
if (!PEd_guiShapeExists(_lastHoveredShape))
{
    _lastHoveredShape = noone;
}
guiShapeHovered = PEd_guiFindShape(PEd_guiCompoundShapeGetItems(guiRoot), guiMouseX, guiMouseY);

// Redraw last hovered shape
if (PEd_guiShapeExists(_lastHoveredShape)
    && guiShapeHovered != _lastHoveredShape)
{
    PEd_guiRequestRedraw(_lastHoveredShape);
}

// Reset active shape if it does not exist
if (!PEd_guiShapeExists(guiShapeActive))
{
    guiShapeActive = noone;
}

// Reset selected shape if it does not exist
if (!PEd_guiShapeExists(guiShapeSelected))
{
    guiShapeSelected = noone;
}

// Redraw active shape and push mouse coordinates
if (PEd_guiShapeExists(guiShapeActive))
{
    PEd_guiRequestRedraw(guiShapeActive);
    PEd_guiPushMouseCoordinates(guiShapeActive);
}
else if (PEd_guiShapeExists(guiShapeHovered))
{
    PEd_guiPushMouseCoordinates(guiShapeHovered);   
}

////////////////////////////////////////////////////////////////////////////////
// Handle keyboard shortcuts
if (keyboard_check_pressed(vk_anykey))
{
    PEd_guiLogKey(keyboard_key);
}

if (mouse_check_button_pressed(mb_any))
{
    PEd_guiLogKey(mouse_button);
}

//var _text = "";
for (var i = ds_list_size(guiKeyLog) - 1; i >= 0; i--)
{
    var _isMouseButton = (guiKeyLog[| i] == mb_left
                          || guiKeyLog[| i] == mb_right
                          || guiKeyLog[| i] == mb_middle);
    if ((!_isMouseButton && !keyboard_check(guiKeyLog[| i]))
        || (_isMouseButton && !mouse_check_button(guiKeyLog[| i])))
    {
        ds_list_delete(guiKeyLog, i);
        continue;
    }
    //_text = string(guiKeyLog[| i]) + ", " + _text;
}
//show_debug_message(_text);

// Global
var _shortcuts = guiRoot[? "keyboardShortcuts"];
if (!is_undefined(_shortcuts))
{
    for (var i = ds_list_size(_shortcuts) - 1; i >= 0; i--)
    {
        PEd_guiKeyboardShortcutUpdate(_shortcuts[| i]);
    }
}

// Selected shape
if (PEd_guiShapeExists(guiShapeSelected))
{
    var _shortcuts = guiShapeSelected[? "keyboardShortcuts"];
    if (!is_undefined(_shortcuts))
    {
        for (var i = ds_list_size(_shortcuts) - 1; i >= 0; i--)
        {
            PEd_guiKeyboardShortcutUpdate(_shortcuts[| i]);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
// Update input
if (guiInputActive != noone) 
{
    var _delegate = PEd_guiDecodeID(guiInputActive);
    PEd_guiRequestRedraw(_delegate);
    
    var _inputStringLength = string_length(guiInputString);
    
    // Multitype
    guiInputMultitype = false;
    
    if (keyboard_check_pressed(vk_anykey)) 
    {
        guiInputMultitype = true;
        guiInputTimer = current_time;
    }
    
    if (current_time > guiInputTimer + 300) 
    {
        guiInputMultitype = true;
    }
    
    // Type
    var _keyboardStringLength = string_length(keyboard_string);
    
    if (_keyboardStringLength > 0) 
    {
        // Delete selected part
        if (guiInputIndex[0] != guiInputIndex[1]) 
        {
            PEd_guiInputDeleteSelectedPart();
        }
        
        // Insert string
        guiInputString = string_insert(keyboard_string, guiInputString, guiInputIndex[0]);
        guiInputIndex[0] += _keyboardStringLength;
        guiInputIndex[1] = guiInputIndex[0];
        keyboard_string = "";
    }
    
    // Backspace
    if (keyboard_check(vk_backspace) && guiInputMultitype) 
    {
        if (guiInputIndex[0] == guiInputIndex[1]) 
        {
            guiInputString = string_delete(guiInputString, guiInputIndex[0] - 1, 1);
            guiInputIndex[0] = max(guiInputIndex[0] - 1, 1);
            guiInputIndex[1] = guiInputIndex[0];
        }
        else 
        {
            PEd_guiInputDeleteSelectedPart();
        }
    }
    else if (keyboard_check(vk_delete) && guiInputMultitype) 
    {
        // Delete
        if (guiInputIndex[0] != guiInputIndex[1]) 
        {
            PEd_guiInputDeleteSelectedPart();
        }
        else 
        {
            guiInputString = string_delete(guiInputString, guiInputIndex[0], 1);
        }
    }
    
    // Save string length
    var _inputStringLength = string_length(guiInputString);
    
    // Control
    if (keyboard_check(vk_control)) 
    {
        if (keyboard_check_pressed(ord("A"))) 
        {
            PEd_guiInputSelectAll();
        }
        else if (keyboard_check_pressed(ord("D"))) 
        {
            PEd_guiInputDelete();
        }
        else if (keyboard_check_pressed(ord("X"))) 
        {
            PEd_guiInputCut();
        }
        else if (keyboard_check_pressed(ord("C"))) 
        {
            PEd_guiInputCopy();
        }
        else if (keyboard_check_pressed(ord("V"))) 
        {
            PEd_guiInputPaste();
            _inputStringLength = string_length(guiInputString);
        }
    }
    
    // Arrows
    if (keyboard_check(vk_left) && guiInputMultitype) 
    {
        guiInputIndex[1] = max(guiInputIndex[1] - 1, 1);
        
        if (!keyboard_check(vk_shift)) 
        {
            guiInputIndex[0] = guiInputIndex[1];
        }
    }
    else if (keyboard_check(vk_right) && guiInputMultitype) 
    {
        guiInputIndex[1] = min(guiInputIndex[1] + 1, _inputStringLength + 1);
        
        if (!keyboard_check(vk_shift)) 
        {
            guiInputIndex[0] = guiInputIndex[1];
        }
    }
    
    // Home/end
    if (keyboard_check_pressed(vk_home)) 
    {
        guiInputIndex[1] = 1;
        
        if (!keyboard_check(vk_shift)) 
        {
            guiInputIndex[0] = guiInputIndex[1];
        }
    }
    else if (keyboard_check_pressed(vk_end)) 
    {
        guiInputIndex[1] = _inputStringLength + 1;
        
        if (!keyboard_check(vk_shift)) 
        {
            guiInputIndex[0] = guiInputIndex[1];
        }
    }
}
