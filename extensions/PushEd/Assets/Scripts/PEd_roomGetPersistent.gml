/// PEd_roomGetPersistent(room)
/**
 * @brief Gets the persistence setting of the room.
 * @param {real} room The id of the room.
 * @return {bool} True if the room is persistent.
 */
gml_pragma("forceinline");
return argument0[? "persistent"];
