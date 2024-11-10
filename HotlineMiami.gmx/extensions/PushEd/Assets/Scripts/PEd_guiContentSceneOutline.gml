/// PEd_guiContentSceneOutline(container)
/**
 * @brief Draws the content of a Scene Outline to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _contentX = 8;
var _contentY = 0;
var _room = PEd_getCurrentRoom();

var _selectedObj = selectedObjects[| 0];
if (is_undefined(_selectedObj))
{
    _selectedObj = 0;
}

for (var j = 0; j < ds_list_size(pedRoomList); j++)
{
    var _room = pedRoomList[| j];
    var _roomId = PEd_roomGetId(_room);
    
    if (PEd_guiDrawListItem(PEd_roomGetName(_room) + " : room", _contentX, _contentY, (_selectedObj == _roomId), false, (pedRoomCurrent == j)))
    {
        PEd_selectObject(_roomId, true);
        pedRoomCurrent = j;
        PEd_guiRequestRedrawAll(guiRoot)
    }
    _contentY += guiLineHeight;
    
    if (editMode == PEdEditModes.Object)
    {
        var _instances = PEd_roomGetInstances(_room);
        for (var i = 0; i < ds_list_size(_instances); i++) 
        {
            var _id = _instances[| i];
            var _name = string(_id) + " : " + PEd_instanceGetObjectName(_id) + " : " + PEd_instanceGetName(_id);
            var _visible = _id.visible;
            
            if (sceneOutlineFilter == ""
                || string_pos(string_lower(sceneOutlineFilter), string_lower(_name)) != 0) 
            {
                var _pos = ds_list_find_index(selectedObjects, _id);
                var _item = PEd_guiDrawListItemEye(_name, _contentX, _contentY, _selectedObj == _id || _pos != -1, !_visible);
                if (_item > 0) 
                {
                    // Hide instance
                    if (_item == 2)
                    {
                        _id.visible = !_id.visible;
                        if (!_id.visible)
                        {
                            PEd_deselectObject(_id);
                        }
                    }
                    else if (_item == 1
                        && _id.visible)
                    {
                        // Jump on objects position if selected
                        if (_selectedObj == _id
                            || _pos != -1) 
                        {
                            if (!keyboard_check(vk_control)) 
                            {
                                x = PEd_instanceGetPosX(_id) + 16;
                                y = PEd_instanceGetPosY(_id) + 16;
                                if (global.pedUsing3D) 
                                {
                                    z = PEd_instanceGetPosZ(_id) + 8;
                                }
                                else 
                                {
                                    view_xview[0] = PEd_instanceGetPosX(_id) - view_wview[0] * 0.5;
                                    view_yview[0] = PEd_instanceGetPosY(_id) - view_hview[0] * 0.5;
                                }
                                direction = 135;
                                camPitch = -16;
                            }
                        }
                        
                        // Remove rooms from selection
                        for (var k = ds_list_size(selectedObjects) - 1; k >= 0; k--)
                        {
                            if (selectedObjects[| k] < 0)
                            {
                                ds_list_delete(selectedObjects, k);
                                ds_list_delete(selectedObjectsData, k);
                            }
                        }
                        
                        // Select
                        PEd_selectObject(_id);
                        _selectedObj = selectedObjects[| 0];
                        if (is_undefined(_selectedObj))
                        {
                            _selectedObj = 0;
                        }
                    }
                }
                _contentY += guiLineHeight;
            }
        }
    } // objects
    else if (editMode == PEdEditModes.Tile)
    {
        for (var i = 0; i < ds_list_size(tileLayers); i++) 
        {
            var _layerDepth = ds_list_find_value(tileLayers, i);
            var _layerVisible = ds_list_find_value(tileVisible, i);
            if (PEd_guiDrawListItem("depth " + string(_layerDepth), _contentX, _contentY, tileLayerSelected == i, 0)) 
            {
                tileLayerSelected = i;
                tileDepth = _layerDepth;
            }
            
            // Change depth
            if (PEd_guiDrawSpriteClickable(PEd_guiSprMisc, 4, _containerWidth - 60, _contentY)
                && show_question("Do you really want to change layer depth?")) 
            {
                var _layerDepthNew = round(PEd_getFloat("New depth:", string(_layerDepth)));
                if (_layerDepth != _layerDepthNew) 
                {
                    var _pos = ds_list_find_index(tileLayers, _layerDepthNew);
                    if (_pos == -1) 
                    {
                        ds_list_replace(tileLayers, i, _layerDepthNew);
                        tileDepth = _layerDepthNew;
                        tile_layer_depth(_layerDepth, _layerDepthNew);
                    }
                    else if (show_question("Layer with given depth already exists, do you want to merge them? (This can't be taken back)"))
                    { 
                        ds_list_delete(tileLayers, i);
                        ds_list_delete(tileVisible, i);
                        tile_layer_depth(_layerDepth, _layerDepthNew);
                        tileDepth = _layerDepthNew;
                        tileLayerSelected = _pos-1;
                    }
                }
            }
            
            // Delete
            if (PEd_guiDrawSpriteClickable(PEd_guiSprMisc, 2, _containerWidth - 40, _contentY)
                && show_question("Do you really want to delete this layer (" + string(_layerDepth) + ")?")) 
            {
                ds_list_delete(tileLayers, i);
                ds_list_delete(tileVisible, i);
                
                var _tiles = tile_get_ids_at_depth(_layerDepth);
                for (var j = array_length_1d(_tiles) - 1; j >= 0; j--)
                {
                    PEd_tileDelete(_tiles[j]);
                }
                
                tile_layer_delete(_layerDepth);
                tileLayerSelected = 0;
                
                var _selectedObject = selectedObjects[| 0];
                if (!is_undefined(_selectedObject)
                    && !tile_exists(_selectedObject))
                {
                    ds_list_delete(selectedObjects, 0);
                    ds_list_delete(selectedObjectsData, 0);
                }
            }
            
            // Show/hide
            if (PEd_guiDrawSpriteClickable(PEd_guiSprMisc, 1, _containerWidth - 20, _contentY, lerp(PEdColour.Disabled, c_white, _layerVisible))) 
            {
                ds_list_replace(tileVisible, i, !_layerVisible);
                if (!_layerVisible) 
                {
                    tile_layer_show(_layerDepth);
                }
                else 
                {
                    tile_layer_hide(_layerDepth);
    
                    var _selectedObject = selectedObjects[| 0];
                    if (!is_undefined(_selectedObject)
                        && !tile_exists(_selectedObject))
                    {
                        ds_list_delete(selectedObjects, 0);
                        ds_list_delete(selectedObjectsData, 0);
                    }
                }
            }
            _contentY += guiLineHeight;
        
            // Draw layer tiles
            var _tiles = tile_get_ids_at_depth(_layerDepth);
            for (var t = 0; t < array_length_1d(_tiles); t++) 
            {
                var _id = _tiles[t];
                if (!tile_exists(_id))
                {
                    continue;
                }
                
                var _name = "tile : " + string(_id);
                var _visible = tile_get_visible(_id);
                
                if (sceneOutlineFilter == ""
                    || string_pos(string_lower(sceneOutlineFilter), string_lower(_name)) != 0) 
                {
                    var _pos = ds_list_find_index(selectedObjects, _id);
                    var _item = PEd_guiDrawListItemEye(_name, _contentX, _contentY, _selectedObj == _id || _pos != -1, !_visible);
                    if (_item > 0) 
                    {
                        // Hide tile
                        if (_item == 2)
                        {
                            tile_set_visible(_id, !_visible);
                            if (!_visible)
                            {
                                PEd_deselectObject(_id);
                            }
                        }
                        else if (_item == 1
                            && _visible)
                        {
                            // Jump on objects position if selected
                            if (_selectedObj == _id
                                || _pos != -1) 
                            {
                                if (!keyboard_check(vk_control)) 
                                {
                                    x = tile_get_x(_id) + 16;
                                    y = tile_get_y(_id) + 16;
                                    view_xview[0] = tile_get_x(_id) - view_wview[0] * 0.5;
                                    view_yview[0] = tile_get_y(_id) - view_hview[0] * 0.5;
                                }
                            }
                            
                            // Remove rooms from selection
                            for (var k = ds_list_size(selectedObjects) - 1; k >= 0; k--)
                            {
                                if (selectedObjects[| k] < 0)
                                {
                                    ds_list_delete(selectedObjects, k);
                                    ds_list_delete(selectedObjectsData, k);
                                }
                            }
                            
                            // Select
                            PEd_selectObject(_id);
                            _selectedObj = selectedObjects[| 0];
                            if (is_undefined(_selectedObj))
                            {
                                _selectedObj = 0;
                            }
                            else
                            {
                                tileLayerSelected = i;
                                tileDepth = _layerDepth;
                            }
                        }
                    }
                    _contentY += guiLineHeight;
                }
            }
        }
    } // tiles
} // rooms

return PEd_vec2(_containerWidth, _contentY);
