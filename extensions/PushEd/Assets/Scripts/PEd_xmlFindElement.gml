/// PEd_xmlFindElement(rootElement, name)
/**
 * @brief Finds the first element with given name
 *        in the given tree of elements.
 * @param {real}   rootElement The root element of the tree.
 * @param {string} name        The name of the element to be found.
 * @return {real} The id of the found element or noone,
 *                if no such element has been found.
 */
var _element = argument0;
var _name = argument1;

if (PEd_xmlGetElementName(_element) == _name)
{
    return _element;
}

var _numOfChildElements = PEd_xmlGetNumberOfChildElements(_element);
for (var i = 0; i < _numOfChildElements; i++)
{
    var _foundElement = PEd_xmlFindElement(PEd_xmlGetChildElement(_element, i), _name);
    if (_foundElement != noone)
    {
        return _foundElement;
    }
}

return noone;
