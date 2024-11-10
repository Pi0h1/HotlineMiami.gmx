/// PEd_xmlWrite(rootElement)
/**
 * @brief Writes the tree of elements into a string.
 * @param {real} rootElement The root element of the tree.
 * @return {string} The string.
 */
var _element = argument[0];
var _name = PEd_xmlGetElementName(_element);
var _numberOfAttributes = PEd_xmlGetNumberOfElementAttributes(_element);
var _numberOfChildElements = PEd_xmlGetNumberOfChildElements(_element);
var _value = PEd_xmlGetElementValue(_element);
var _indent = 0;

if (argument_count == 2)
{
    _indent = argument[1];
}

var _spaces = string_repeat(" ", _indent * 2);

//
// Open element
//
var _string = _spaces + "<" + _name;

// Attributes
var _attribute = PEd_xmlFindFirstElementAttribute(_element);

repeat (_numberOfAttributes)
{
    _string += " " + string(_attribute) + '="'
               + PEd_xmlString(PEd_xmlGetElementAttribute(_element, _attribute))
               + '"';
    _attribute = PEd_xmlFindNextElementAttribute(_element, _attribute);
}

if (_numberOfChildElements == 0
    && is_undefined(_value))
{
    _string += "/";
}

_string += ">";

if (_numberOfChildElements != 0
    || is_undefined(_value))
{
    _string += chr(10);
}

//
// Children
//
for (var i = 0; i < _numberOfChildElements; i++)
{
    var _childElement = PEd_xmlGetChildElement(_element, i);
    _string += PEd_xmlWrite(_childElement, _indent + 1);
}

//
// Close element
//
if (_numberOfChildElements != 0)
{
    _string += _spaces + "</" + PEd_xmlGetElementName(_element) + ">" + chr(10);
}
else if (!is_undefined(_value))
{
    _string += PEd_xmlString(_value);
    _string += "</" + PEd_xmlGetElementName(_element) + ">" + chr(10);
}

return _string;
