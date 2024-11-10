/// PEd_selectObject(id, [forceSingleSelect], [keepMultipleSelection])
/**
 * @brief Handles (multi)selecting and instances and tiles.
 * @param {real} id                      The id of the instance or tile to select/add to selection/deselect.
 * @param {bool} [forceSingleSelect]     True to force selecting single object.
 * @param {bool} [keepMultipleSelection] If true then keeps multiple selection.
 */
var _id = argument[0];
var _key = vk_control;

var _forceSingleSelect = false;
if (argument_count > 1)
{
    _forceSingleSelect = argument[1];
}

if (editMode == PEdEditModes.Tile)
{
    _key = vk_shift;
}

var _keepMultipleSelection = false;
if (argument_count > 2)
{
    _keepMultipleSelection = argument[2];
}

// FIXME
if (_keepMultipleSelection)
{
    if (_id != 0
        && ds_list_find_index(selectedObjects, _id) != -1)
    {
        exit;
    }
    else
    {
        if (keyboard_check(_key))
        {
            // Multiple selection
            if (_id != 0)
            {
                var _pos = PEd_dsListInsertUnique(selectedObjects, _id, 0);
                if (_pos != -1)
                {
                    ds_list_delete(selectedObjects, _pos);
                }
            }
        }
        else
        {
            // Select single
            ds_list_clear(selectedObjects);
            if (_id != 0)
            {
                ds_list_insert(selectedObjects, 0, _id);
            }
        }
    }
}
else if (!_forceSingleSelect
    && keyboard_check(_key))
{
    // Multiple selection
    if (_id != 0)
    {
        var _pos = PEd_dsListInsertUnique(selectedObjects, _id, 0);
        if (_pos != -1)
        {
            ds_list_delete(selectedObjects, _pos);
        }
    }
}
else
{
    // Select single
    ds_list_clear(selectedObjects);
    if (_id != 0)
    {
        ds_list_insert(selectedObjects, 0, _id);
    }
}

// Debug
/*var _txt = "";
for (var i = 0; i < ds_list_size(selectedObjects); i++)
{
    _txt += string(selectedObjects[| i]) + ", ";
}
show_debug_message(_txt);*/

PEd_savePivotOffsets();

// Load custom data
ds_list_clear(customData);
var _selectedObj = PEd_getSelectedObject();
if (_selectedObj > 0)
{
    switch (editMode)
    {
        case PEdEditModes.Object:
            PEd_getCustomData(_selectedObj);
            break;
            
        case PEdEditModes.Tile:
            PEd_getTileCustomData();
            break;
    }
}
else if (_selectedObj < 0)
{
    PEd_getRoomCustomData();
}

// Close colour pickers
if (PEd_guiShapeExists(guiColourPickerObject))
{
    PEd_guiDestroyShape(guiColourPickerObject);
    guiColourPickerObject = noone;
}

if (PEd_guiShapeExists(guiColourPickerRoom))
{
    PEd_guiDestroyShape(guiColourPickerRoom);
    guiColourPickerRoom = noone;
}
