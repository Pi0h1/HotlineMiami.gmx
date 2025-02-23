/// PEd_matrixPrint(matrix)
/**
 * @brief Prints matrix to the debug console.
 * @param {matrix} matrix The matrix to print.
 */
var m = argument0;
var i = 0;
repeat (4) 
{
    var t = "";
    repeat (4) 
    {
        t += string(m[i++]) + "    ";
    }
    show_debug_message(t);   
}
