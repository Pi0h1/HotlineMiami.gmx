/// PEd_stringSplitOnFirst(string, delimiter)
/**
 * @brief Splits the string in two at the first occurence of the delimiter.
 * @param {string} string    The string to split.
 * @param {string} delimiter The delimiter.
 * @return {array} An array containing [firstHalf, secondHalf]. If the delimiter
 *                 is not found in the string, then firstHalf equals empty string
 *                 and secondHalf is the original string.
 */
var r;
var i = string_pos(argument1, argument0);
if (i == 0)
{
    r[1] = "";
    r[0] = argument0;
}
else
{
    r[1] = string_delete(argument0, 1, i);
    r[0] = string_copy(argument0, 1, i - 1);
}
return r;
