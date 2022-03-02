/// PEd_pointDistPlane(point, plane, normal)
/**
 * @brief Gets distance from the point to the plane.
 * @param {vec3} point  The point position.
 * @param {vec3} plane  The plane origin.
 * @param {vec3} normal The plane normal.
 * @return {real} The distance from the point to the plane.
 */
gml_pragma("forceinline");
return PEd_vec3Dot(PEd_vec3Subtract(argument0, argument1), argument2);
