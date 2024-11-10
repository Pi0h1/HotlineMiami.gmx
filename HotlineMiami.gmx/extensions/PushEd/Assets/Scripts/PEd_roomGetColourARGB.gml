/// PEd_roomGetColourARGB(room)
/**
 * @brief Gets the ARGB colour of the room.
 * @param {real} room The id of the room.
 * @return {real} The ARGB colour of the room.
 */
gml_pragma("forceinline");
return PEd_colourAlphaToArgb(argument0[? "colour"], 1);
