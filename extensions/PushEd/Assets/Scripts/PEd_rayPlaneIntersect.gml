/// PEd_rayPlaneIntersect(origin, direction, plane, normal)
/**
 * @brief Gets the interestion point of the ray and the plane.
 * @param {vec3} origin    The origin of the ray.
 * @param {vec3} direction The direction of the ray.
 * @param {vec3} plane     A point on the plane.
 * @param {vec3} normal    The normal vector of the plane.
 * @return {vec3} The intersection of the ray and the plane.
 */
var t = -((PEd_vec3Dot(PEd_vec3Subtract(argument0, argument2), argument3)) / PEd_vec3Dot(argument1, argument3));
return PEd_vec3Add(argument0, PEd_vec3Scale(argument1, t));
