/// PEd_instanceGetObjectName(id)
/**
 * @brief Gets the object name of the instance.
 * @param {real} id The id of the instance.
 * @return {string} Object name of the instance.
 * @note When the room is saved, this name is used as object name.
 */
gml_pragma("forceinline");
return argument0.pedObjectName;
