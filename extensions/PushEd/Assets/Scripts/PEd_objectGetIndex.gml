/// PEd_objectGetIndex(name)
/**
 * @brief Finds the object's index in the list of objects.
 * @param {string} name The object name.
 * @return {real} The object's index in the list of objects or -1
 *                if the object was not found.
 */
gml_pragma("forceinline");
return ds_list_find_index(PEd_oEditor.pedObjectList, argument0);
