/// PEd_roomGetBackground(room, ind)
/**
 * @brief Gets the background with given index of the room.
 * @param {real} room The id of the room.
 * @param {real} ind  The background index (0...7).
 * @return {real} The id of the background.
 */
gml_pragma("forceinline");
return ds_list_find_value(argument0[? "backgrounds"], argument1);
