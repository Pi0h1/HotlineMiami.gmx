/// PEd_actClearRoom()
/**
 * @brief Creates a new room.
 */
view_xview[0] = 0;
view_yview[0] = 0;
x = -16;
y = 4;
z = 4;
direction = 0;
camPitch = 0;
viewZoom = 1;
viewLastX = 0;
viewLastY = 0;
editMode = PEdEditModes.Object;
editTool = PEdTools.Move;
editNow = PEdTools.None;
editFloor = true;
PEd_oPivot.x = 0;
PEd_oPivot.y = 0;
PEd_oPivot.z = 0;
 
// Reset tile editor
ds_list_clear(tileLayers);
ds_list_clear(tileVisible);
tileLayerSelected = 0;
ds_list_add(tileLayers, tileDepth);
ds_list_add(tileVisible, true);

// Deselect instances
ds_list_clear(selectedObjects);
ds_list_clear(selectedObjectsData);

// Destroy all rooms
for (var i = ds_list_size(pedRoomList) - 1; i >= 0; i--)
{
    PEd_roomDestroy(pedRoomList[| i]);
    ds_list_delete(pedRoomList, i);
}

// Add new empty room
pedRoomCurrent = 0;
ds_list_add(pedRoomList, PEd_createRoom("room", 512, 512));

// Redraw all
PEd_guiRequestRedrawAll(guiRoot)

// Message
PEd_guiShowPopupMessage("Created a new empty room.");
