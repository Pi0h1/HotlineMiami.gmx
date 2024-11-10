/// PEd_assignVariable(name, value)
/**
 * @brief Sets variable of given name.
 * @param {string} name  The name of the variable.
 * @param {real}   value The value to be assigned.
 */
var _name = string(argument0);
var _value = argument1;

switch (_name) 
{
    case "alarm[0]": alarm[0] = _value; break;
    case "alarm[1]": alarm[1] = _value; break;
    case "alarm[2]": alarm[2] = _value; break;
    case "alarm[3]": alarm[3] = _value; break;
    case "alarm[4]": alarm[4] = _value; break;
    case "alarm[5]": alarm[5] = _value; break;
    case "alarm[6]": alarm[6] = _value; break;
    case "alarm[7]": alarm[7] = _value; break;
    case "alarm[8]": alarm[8] = _value; break;
    case "alarm[9]": alarm[9] = _value; break;
    case "alarm[10]": alarm[10] = _value; break;
    case "alarm[11]": alarm[11] = _value; break;

    default:
        variable_instance_set(id, _name, _value);
}
