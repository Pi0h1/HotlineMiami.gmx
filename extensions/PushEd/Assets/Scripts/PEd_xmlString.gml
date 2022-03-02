/// PEd_xmlString(value)
/**
 * @brief Turns given value into a string. Replaces
 *        characters with their XML-safe form.
 * @param {any} value The value to be turned into a string.
 * @return {string} The resulting string.
 */
var _value = argument0;

if (is_real(_value))
{
    var _dec = PEdXml.MaximumDecimalSpaces;
    var _string = string_format(_value, -1, _dec);
    var _stringLength = string_length(_string);

    do
    {
        _string = string_format(_value, -1, --_dec);
        if (string_byte_at(_string, --_stringLength) != 48)
        {
            break;
        }
    }
    until (_dec == 0);

    return _string;
}

if (is_string(_value))
{
    _value = string_replace_all(_value, "&", "&amp;");
    _value = string_replace_all(_value, "<", "&lt;");
    _value = string_replace_all(_value, ">", "&gt;");
    _value = string_replace_all(_value, '"', "&quot;");
    _value = string_replace_all(_value, "'", "&apos;");
}

return string(_value);
