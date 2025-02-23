/// PEd_xmlRead(fileName)
/**
 * @brief Reads the XML formatted file and stores
 *        the contained data into a tree of elements.
 * @param {string} fileName The name of the XML formatted file.
 * @return {real} The root element of the tree on success or noone on fail.
 */
var _file = file_bin_open(argument0, 0);

if (_file == -1)
    return noone;

var _filePos = 0;
var _fileSize = file_bin_size(_file);
var _byte = PEdXml.Space;
var _lastByte;
var _isSeparator = true;
var _token = "";
var _isString = false;
var _attributeName = "";
var _root = noone;
var _element = noone;
var _lastElement = noone;
var _parentElement = noone;
var _isClosing = false;
var _isComment = false;

do
{
    //
    // Read byte from file
    //
    _lastByte = _byte;
    _byte = file_bin_read_byte(_file);
        
    //
    // Process byte
    //
    _isSeparator = true;
    
    switch (_byte)
    {
        // Start of new element
        case PEdXml.Lt:
            if (_element != noone)
            {
                if (_root != noone)
                {
                    PEd_xmlDestroyElement(_root);
                }
                show_debug_message("ERROR: Unexpected symbol '<' at " + string(_filePos) + "!");
                return noone;
            }
            
            // Set element value
            while (string_byte_at(_token, 1) == 32)
            {
                _token = string_delete(_token, 1, 1);
            }
            
            if (_token != ""
                && _parentElement != noone
                && PEd_xmlGetNumberOfChildElements(_parentElement) == 0)
            {
                PEd_xmlSetElementValue(_parentElement, PEd_xmlParse(_token));
            }
        
            _element = PEd_xmlCreateElement();
            break;
            
        // End of element
        case PEdXml.Gt:
            if (_element == noone)
            {
                if (_root != noone)
                {
                    PEd_xmlDestroyElement(_root);
                }
                show_debug_message("ERROR: Unexpected symbol '>' at " + string(_filePos) + "!");
                return noone;
            }
            
            _lastElement = _element;
            
            if (_root == noone && !_isComment)
            {
                _root = _element;
            }
            
            if (_isComment)
            {
                _lastElement = noone;
                ds_map_destroy(_element);
                _isComment = false;
            }
            else if (_lastByte == PEdXml.Slash)
            {
                // Self-closing element
                if (_parentElement != noone)
                {
                    PEd_xmlAddChildElement(_parentElement, _element);
                }
            }
            else if (_isClosing)
            {
                // If the element is not self-closing and it does not
                // have a value defined, then set its value to an empty string.
                if (is_undefined(PEd_xmlGetElementValue(_parentElement))
                    && PEd_xmlGetNumberOfChildElements(_parentElement) == 0)
                {
                    PEd_xmlSetElementValue(_parentElement, "");
                }
                _parentElement = PEd_xmlGetElementParent(_parentElement);
                _lastElement = noone;
                ds_map_destroy(_element);
                _isClosing = false;
            }
            else
            {
                if (_parentElement != noone)
                {
                    PEd_xmlAddChildElement(_parentElement, _element);
                }
                _parentElement = _element;
            }
            _element = noone;
            _elementName = "";
            break;
            
        // Closing element
        case PEdXml.Slash:
            if (_isString || _element == noone)
            {
                _isSeparator = false;    
            }
            else if (_lastByte == PEdXml.Lt)
            {
                _isClosing = true;
            }
            break;
    
        // Attribute
        case PEdXml.Equal:
            if (!_isString)
            {
                if (_token != "")
                {
                    _attributeName = _token;
                }
            }
            else
            {
                _isSeparator = false;
            }
            break;
            
        // Start/end of string
        case PEdXml.Sq:
        case PEdXml.Dq:
            if (_isString == _byte)
            {
                _isString = false;
                // Store attribute
                if (_attributeName != "")
                {
                    if (_element != noone)
                    {
                        PEd_xmlSetElementAttribute(_element, _attributeName, PEd_xmlParse(_token));
                    }
                    _attributeName = "";
                }
            }
            else if (!_isString)
            {
                _isString = _byte;
            }
            break;
            
        // Treat as comments
        case PEdXml.Qm:
        case PEdXml.Em:
            if (_lastByte == PEdXml.Lt)
            {
                _isComment = true;
            }
            break;
        
        default:
            // Whitespace
            if (!_isString && _element != noone
                && ((_byte > PEdXml.Null && _byte <= PEdXml.Cr)
                || _byte == PEdXml.Space))
            {
                // ...
            }
            else
            {
                _isSeparator = false;
            }
            break;
    }
    
    //
    // Process tokens
    //
    if (_isSeparator)
    {
        // End of token
        if (_token != "")
        { 
            // Set element name
            if (_element != noone
                && PEd_xmlGetElementName(_element) == "")
            {
                PEd_xmlSetElementName(_element, _token);
            }
            else if (_lastElement != noone
                     && PEd_xmlGetElementName(_lastElement) == "")
            {
                PEd_xmlSetElementName(_lastElement, _token);
            }            
            _token = "";
        }
    }
    else
    {
        // Build token
        if (_byte > PEdXml.Null && _byte <= PEdXml.Cr)
        {
            _byte = PEdXml.Space; // Replace new lines, tabs, etc. with spaces
        }
        _token += chr(_byte);
    }     
}
until (++_filePos == _fileSize);

file_bin_close(_file);

return _root;
