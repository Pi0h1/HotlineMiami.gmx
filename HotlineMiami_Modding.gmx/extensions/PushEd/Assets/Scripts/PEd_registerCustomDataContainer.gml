/// PEd_registerCustomDataContainer(container)
/**
 * @brief Registers custom data container to the engine.
 * @param {real} container The id of the container.
 */
gml_pragma("forceinline");
ds_list_add(PEd_oEditor.customData, argument0);
ds_list_mark_as_list(PEd_oEditor.customData, ds_list_size(PEd_oEditor.customData) - 1);
