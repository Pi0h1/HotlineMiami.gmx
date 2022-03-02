/// PEd_cameraScreenToPlaneXY(x, y, z)
/**
 * @brief Converts the given screen coordinates to the space coordinates lying on the xy-plane at given height.
 * @param {real} x The x position on the screen.
 * @param {real} y The y position on the screen.
 * @param {real} z The target z position in the space.
 */
gml_pragma("forceinline");
return PEd_rayPlaneIntersect(PEd_cameraGetPosVec3(),
                             PEd_cameraUnprojectVec2(PEd_vec2(argument0, argument1)),
                             PEd_vec3(0, 0, argument2),
                             PEd_vec3(0, 0, 1));
