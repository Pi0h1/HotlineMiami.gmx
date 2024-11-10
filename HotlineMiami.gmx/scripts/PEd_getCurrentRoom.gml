/// PEd_getCurrentRoom()
/**
 * @brief Gets the id of the currently selected room.
 * @return {real} The id of the currently selected room.
 */
gml_pragma("forceinline");
return PEd_oEditor.pedRoomList[| PEd_oEditor.pedRoomCurrent];
