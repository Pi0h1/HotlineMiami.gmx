/// PEd_cameraControl()
/**
 * @brief Handles camera controll.
 */
if (guiInputActive != noone
    || keyboard_check(vk_control)
    || keyboard_check(vk_alt)) 
{
    return 0;
}

////////////////////////////////////////////////////////////////////////////////
//
// Camera speed
//
if (keyboard_check_pressed(vk_numpad0)) 
    camSpeed = 0.5;
else if (keyboard_check_pressed(vk_numpad1)) 
    camSpeed = 1;
else if (keyboard_check_pressed(vk_numpad2)) 
    camSpeed = 4;
else if (keyboard_check_pressed(vk_numpad3)) 
    camSpeed = 6;
else if (keyboard_check_pressed(vk_numpad4)) 
    camSpeed = 8;
else if (keyboard_check_pressed(vk_numpad5)) 
    camSpeed = 10;
else if (keyboard_check_pressed(vk_numpad6)) 
    camSpeed = 12;
else if (keyboard_check_pressed(vk_numpad7)) 
    camSpeed = 14;
else if (keyboard_check_pressed(vk_numpad8)) 
    camSpeed = 16;
else if (keyboard_check_pressed(vk_numpad9)) 
    camSpeed = 18;
    
////////////////////////////////////////////////////////////////////////////////
//
// Mouselook
// 
if (mouseInViewport) 
{
    if (mouse_check_button(mb_right)) 
    {
        if (global.pedUsing3D) 
        {
            // Mouselook (3D)
            direction += (mouseLastX - windowMouseX) * mouseSens;
            camPitch += (mouseLastY - windowMouseY) * mouseSens;
            camPitch = max(-89, min(camPitch, 89));
        }
        else 
        {
            // Move camera (2D)
            view_xview[0] += (mouseLastX - windowMouseX) * viewZoom;
            view_yview[0] += (mouseLastY - windowMouseY) * viewZoom;
        }
    }
    else if (!global.pedUsing3D) 
    {
        // Zoom
        var _wheel = mouse_wheel_up() - mouse_wheel_down();
        
        if (_wheel == 0) 
            _wheel = (keyboard_check(vk_pageup) - keyboard_check(vk_pagedown)) * 0.25;
        
        if (_wheel != 0) 
        {
            var _centerX = view_xview[0] + view_wview[0] * 0.5;
            var _centerY = view_yview[0] + view_hview[0] * 0.5;
            viewZoom -= _wheel * 0.25 * max(1, keyboard_check(vk_shift) * 4);
            viewZoom = max(0.25, viewZoom);
            view_wview[0] = view_wport[0] * viewZoom;
            view_hview[0] = view_hport[0] * viewZoom;
            view_xview[0] = _centerX - view_wview[0] * 0.5;
            view_yview[0] = _centerY - view_hview[0] * 0.5;
        }
    }
}

if (global.pedUsing3D) 
{
    ////////////////////////////////////////////////////////////////////////////
    //
    // Look around with arrows
    //
    if (keyboard_check(vk_left)) 
        direction += 3;
    else if (keyboard_check(vk_right)) 
        direction -= 3;

    if (keyboard_check(vk_up)) 
        camPitch = clamp(camPitch + 3, -89, 89);
    else if (keyboard_check(vk_down)) 
        camPitch = clamp(camPitch - 3, -89, 89);
     
    ////////////////////////////////////////////////////////////////////////////
    //
    // Movement
    //
    
    //
    // Keyboard
    //
    var _move = 0;
    var _run = 1;
    
    // Run
    if (keyboard_check(vk_shift)) 
        _run = 4;
    
    var _speed = camSpeed * _run;
    
    // Move forward/backward
    if (keyboard_check(ord("W"))) 
    {
        x += lengthdir_x(_speed, direction);
        y += lengthdir_y(_speed, direction);
        _move = 1;
    }
    else if (keyboard_check(ord("S"))) 
    {
        x -= lengthdir_x(_speed, direction);
        y -= lengthdir_y(_speed, direction);
        _move = -1;
    }
    
    // Strafe left/right
    if (keyboard_check(ord("A"))) 
    {
        x += lengthdir_x(_speed, direction + 90);
        y += lengthdir_y(_speed, direction + 90);
    }
    else if (keyboard_check(ord("D"))) 
    {
        x += lengthdir_x(_speed, direction - 90);
        y += lengthdir_y(_speed, direction - 90);
    }
    
    // Move down/up
    z += _speed * (keyboard_check(ord("E")) - keyboard_check(ord("Q")));
    
    //
    // Mousewheel
    //
    if (mouseInViewport) 
    {
        var _l = camSpeed * 10;
        
        if (keyboard_check(vk_shift)) 
            _l *= 2;
        
        x += lengthdir_x(_l, direction) * (mouse_wheel_up() - mouse_wheel_down());
        y += lengthdir_y(_l, direction) * (mouse_wheel_up() - mouse_wheel_down());
        z += sin(degtorad(camPitch)) * _l * (mouse_wheel_up() - mouse_wheel_down());
    }
}
else 
{
    ////////////////////////////////////////////////////////////////////////////
    //
    // Move around with arrows
    //
    var _speed = camSpeed * 5;
    
    if (keyboard_check(vk_shift)) 
        _speed *= 4;
    
    if (keyboard_check(vk_left)) 
        view_xview[0] -= _speed;
    else if (keyboard_check(vk_right)) 
        view_xview[0] += _speed;
    
    if (keyboard_check(vk_up)) 
        view_yview[0] -= _speed;
    else if (keyboard_check(vk_down)) 
        view_yview[0] += _speed;
}
