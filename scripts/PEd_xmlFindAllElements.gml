/// PEd_xmlFindAllElements(rootElement, name)
/**
 * @brief Finds all elements with given name in the given tree of elements.
 * @param {real}   rootElement The root element of the tree.
 * @param {string} name        The name of elements to be found.
 * @return {real} A ds_list containing all found elements.
 */
var _element = argument[0];
var _name = argument[1];
var _list = noone;

if (argument_count == 2)
{
    _list = ds_list_create();
}
else
{
    _list = argument[2];
}

if (PEd_xmlGetElementName(_element) == _name)
{
    ds_list_add(_list, _element);
}

var _numOfChildElements = PEd_xmlGetNumberOfChildElements(_element);
for (var i = 0; i < _numOfChildElements; i++)
{
    PEd_xmlFindAllElements(PEd_xmlGetChildElement(_element, i), _name, _list);
}

return _list;
