/// PEd_keyToString(key)
/**
 * @brief Gets the name of the key as a string.
 * @param {real} key The key to get the name of.
 * @return {string} The name of the key.
 */
// TODO: Convert keys to string
switch (argument0)
{
    case mb_left:           return "LMB";
    case mb_right:          return "RMB";
    case mb_middle:         return "MMB";
    case vk_alt:            return "Alt";
    case vk_backspace:      return "Backspace";
    case vk_control:        return "Ctrl";
    case vk_decimal:        return ",";
    case vk_delete:         return "Del";
    case vk_divide:         return "/";
    case vk_down:           return "Down";
    case vk_end:            return "End";
    case vk_escape:         return "Esc";
    case vk_f10:            return "F10";
    case vk_f11:            return "F11";
    case vk_f12:            return "F12";
    case vk_f1:             return "F1";
    case vk_f2:             return "F2";
    case vk_f3:             return "F3";
    case vk_f4:             return "F4";
    case vk_f5:             return "F5";
    case vk_f6:             return "F6";
    case vk_f7:             return "F7";
    case vk_f8:             return "F8";
    case vk_f9:             return "F9";
    case vk_home:           return "Home";
    case vk_insert:         return "Ins";
    case vk_lalt:           return "Alt";
    case vk_lcontrol:       return "Control";
    case vk_left:           return "Left";
    case vk_lshift:         return "Shift";
    case vk_multiply:       return  "*";
    case vk_numpad0:        return "Num0";
    case vk_numpad1:        return "Num1";
    case vk_numpad2:        return "Num2";
    case vk_numpad3:        return "Num3";
    case vk_numpad4:        return "Num4";
    case vk_numpad5:        return "Num5";
    case vk_numpad6:        return "Num6";
    case vk_numpad7:        return "Num7";
    case vk_numpad8:        return "Num8";
    case vk_numpad9:        return "Num9";
    case vk_pagedown:       return "PageDown";
    case vk_pageup:         return "PageUp";
    case vk_pause:          return "Pause";
    case vk_printscreen:    return "PrtScr";
    case vk_ralt:           return "Alt";
    case vk_rcontrol:       return "Control";
    case vk_rshift:         return "Shift";
    case vk_shift:          return "Shift";
    case vk_space:          return "Space";
    case vk_subtract:       return "-";
    case vk_tab:            return "Tab";
    case vk_up:             return "Up";
    
    default:                return chr(argument0);
}
