/// PEd_objectListGetSize()
/**
 * @brief Gets the number of objects in the objects list.
 * @return {real} Number of objects in the objects list.
 */
gml_pragma("forceinline");
return ds_list_size(PEd_oEditor.pedObjectList);
