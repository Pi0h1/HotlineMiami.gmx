/// PEd_matrixPerspectiveFov(fov, aspectRatio, zNear, zFar)
/**
 * @brief Builds a perspective projective matrix based on the field of view.
 * @param {real} fov         The field of view, in degrees.
 * @param {real} aspectRatio The aspect ratio (screenWidth / screenHeight).
 * @param {real} zNear       The z-value of the near view-plane.
 * @param {real} zFar        The z-value of the far view-plane.
 * @return {matrix} The perspective projection matrix.
 */
// Source: https://msdn.microsoft.com/en-us/library/windows/desktop/bb205350(v=vs.85).aspx
var _cotHalfFov = 1 / dtan(argument0 * 0.5);
var _zRange = argument3 - argument2;
return PEd_matrix(PEd_vec4(_cotHalfFov / argument1, 0, 0, 0),
                  PEd_vec4(0, _cotHalfFov, 0, 0),
                  PEd_vec4(0, 0, argument3 / _zRange, 1),
                  PEd_vec4(0, 0, -argument2 * argument3 / _zRange, 0));
