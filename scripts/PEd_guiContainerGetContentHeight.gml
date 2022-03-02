/// PEd_guiContainerGetContentHeight(container)
/**
 * @brief Gets the height of the container's content.
 * @param {real} container The id of the container.
 * @return {real} The height of the container's content.
 */
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "scrollbarVer"], "contentSize");
