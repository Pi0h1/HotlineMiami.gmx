/// PEd_codeProcess(code)
/**
 * @brief Process given code.
 * @param {string} code The code that should be processed.
 * @note This can only handle code like "x = 20; y = 10;"
 *       and is not supposed to serve as GML code interpreter!
 */
var i = 0;
var _code = string(argument0);
var _char = "";
var _lastChar = " ";
var _word = "";
var _isString = "";
var _isComment = "";
var _stack = ds_stack_create();

do
{
    _char = string_char_at(_code, ++i);
    
    if (_char == "/") 
    {
        // Check for comments
        if (string_char_at(_code, i + 1) == "*") 
        {
            // Block comment start
            if (_isComment == "") 
            {
                _isComment = "*";
            }
        }
        else if (string_char_at(_code, i - 1) == "*") 
        {
            // Block comment end
            if (_isComment == "*") 
            {
                _isComment = "";
            }
        }
    }
    else if (((_char == " " && _lastChar != _char)
        || _char == ""
        || _char == ";"
        || _char == "=")
        && _isComment == "") 
    {
        if (string_replace_all(_word, " ", "") != "") 
        {
            ds_stack_push(_stack, _word);
        }
        
        if (_char == "=") 
        {
            // Operator '='
            ds_stack_push(_stack, _char);
        }
        else if (_char == ";"
            || _char == "") 
        {
            // End of statement
            var _variable, _operator, _value;
            
            if (!ds_stack_empty(_stack)) 
            {
                _value = ds_stack_pop(_stack);
                
                // Cast value into a correct type
                if (!(string_char_at(_value, 1) == '"'
                    && string_char_at(_value, string_length(_value)) == '"'))
                {
                    _value = real(_value);
                }
                
                if (!ds_stack_empty(_stack)) 
                {
                    _operator = ds_stack_pop(_stack);
                    
                    if (!ds_stack_empty(_stack)) 
                    {
                        _variable = ds_stack_pop(_stack);
                        
                        // Assign variable
                        if (_operator == "=") 
                        {
                            PEd_assignVariable(_variable, _value);
                        }
                    }
                }
            }
        }
        
        _word = "";
    }
    else if (_isComment == "") 
    {
        // Concatenate word
        _word += _char;
    }

    _lastChar = _char;
}
until (_char == "");

ds_stack_destroy(_stack);
