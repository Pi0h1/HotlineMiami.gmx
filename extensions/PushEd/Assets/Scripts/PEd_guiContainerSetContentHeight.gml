/// PEd_guiContainerSetContentHeight(container, contentHeight)
/**
 * @brief Sets height of the content of the given
 *        container to the given value.
 * @param {real} container     The id of the container.
 * @param {real} contentHeight The new height of the container's content.
 */
gml_pragma("forceinline");
ds_map_set(argument0[? "scrollbarVer"], "contentSize", max(1, argument1));
