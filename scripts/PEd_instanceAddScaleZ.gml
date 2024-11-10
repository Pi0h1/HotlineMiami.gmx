/// PEd_instanceAddScaleZ(id, scale)
/**
 * @brief Scales the instance on the z axis by the given value.
 * @param {real} id    The id of the instance.
 * @param {real} scale The value to scale the instance by.
 */
gml_pragma("forceinline");
PEd_instanceSetScaleZ(argument0, PEd_instanceGetScaleZ(argument0) + argument1);
