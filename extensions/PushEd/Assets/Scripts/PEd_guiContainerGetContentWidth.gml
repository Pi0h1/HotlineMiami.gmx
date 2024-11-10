/// PEd_guiContainerGetContentWidth(container)
/**
 * @brief Gets the width of the container's content.
 * @param {real} container The id of the container.
 * @return {real} The width of the container's content.
 */
gml_pragma("forceinline");
return ds_map_find_value(argument0[? "scrollbarHor"], "contentSize");
