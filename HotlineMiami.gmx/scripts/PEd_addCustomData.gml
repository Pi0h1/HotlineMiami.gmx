/// PEd_addCustomData(container, type, name, getter, setter)
/**
 * @brief Adds custom data to the data container.
 * @param {real}   container The id of the container.
 * @param {real}   type      The type of the custom data. See PEdDataTypes enumerator.
 * @param {string} name      The name of the custom data.
 * @param {real}   getter    The id of the script that gets the custom data. Use noone for no getter.
 * @param {real}   setter    The id of the script that sets the custom data. Use noone for no setter.
 */
gml_pragma("forceinline");
ds_list_add(argument0, argument1, argument2, argument3, argument4);
