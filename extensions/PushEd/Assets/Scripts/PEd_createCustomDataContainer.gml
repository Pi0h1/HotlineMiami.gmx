/// PEd_createCustomDataContainer(name)
/**
 * @brief Creates a container for a custom data.
 * @param {string} name The name of the container.
 * @return {real} The id of the container.
 */
var _container = ds_list_create();
ds_list_add(_container, argument0, true); // name, expanded
return _container;
