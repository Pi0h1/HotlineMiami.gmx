/// PEd_roomGetViewport(room, ind)
/**
 * @brief Gets the viewport with given index of the room.
 * @param {real} room The id of the room.
 * @param {real} ind  The viewport index (0...7).
 * @return {real} The id of the viewport.
 */
gml_pragma("forceinline");
return ds_list_find_value(argument0[? "viewports"], argument1);
