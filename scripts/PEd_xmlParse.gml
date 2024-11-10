/// PEd_xmlParse(string)
/**
 * @brief Parses value from the string.
 * @param {string} string The string to parse.
 * @return {real/string} A real value or a string, where XML character entities are
 *                       replaced with their original form.
 */
var _string = argument0;

//
// Clear whitespace, replace character entities
//
while (string_byte_at(_string, 1) == 32)
{
    _string = string_delete(_string, 1, 1);
}

_string = string_replace_all(_string, "&lt;", "<");
_string = string_replace_all(_string, "&gt;", ">");
_string = string_replace_all(_string, "&quot;", '"');
_string = string_replace_all(_string, "&apos;", "'");
_string = string_replace_all(_string, "&amp;", "&");

var _stringLength = string_length(_string);

//
// Parse real
//
var _a;
_a[1] = "";
_a[0] = "0";

var _j = 0;
var _s = 1;
var _char = "";

for (var i = 1; i <= _stringLength; i++)
{
    _char = string_char_at(_string, i);
    
    if (_char == string_digits(_char))
    {
        _a[_j] += _char;
    }
    else if (_char == '+'
             && _a[0] == "0"
             && _j == 0)
    {
        // Do nothing...
    }
    else if (_char == '-'
             && _a[0] == "0"
             && _j == 0)
    {
        _s = -_s;
    }
    else if (_char == '.'
             && _j == 0)
    {
        _j++;
    }
    else if (_char != "")
    {
        return _string; // String does not represent a real value...
    }
}

return (_s * abs(real(_a[0]) + real(_a[1]) / power(10, string_length(_a[1]))));
