/// PEd_actCloseWindow()
/**
 * @brief Closes the topmost window.
 */
var _items = PEd_guiCompoundShapeGetItems(guiRoot);
var _item = _items[| ds_list_size(_items) - 1];
if (!is_undefined(_item))
{
    if (PEd_guiShapeGetType(_item) == PEdGUIShape.Window)
    {
        PEd_guiDestroyShape(_item);
    }
}
