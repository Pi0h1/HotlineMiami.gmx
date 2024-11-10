/// PEd_instanceAddScaleY(id, scale)
/**
 * @brief Scales the instance on the y axis by the given value.
 * @param {real} id    The id of the instance.
 * @param {real} scale The value to scale the instance by.
 */
gml_pragma("forceinline");
PEd_instanceSetScaleY(argument0, PEd_instanceGetScaleY(argument0) + argument1);
