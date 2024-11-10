/// PEd_instanceAddScaleX(id, scale)
/**
 * @brief Scales the instance on the x axis by the given value.
 * @param {real} id    The id of the instance.
 * @param {real} scale The value to scale the instance by.
 */
gml_pragma("forceinline");
PEd_instanceSetScaleX(argument0, PEd_instanceGetScaleX(argument0) + argument1);
