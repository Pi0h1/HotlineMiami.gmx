/// PEd_matrixLookAt(eye, at, up)
/**
 * @brief Builds a look-at matrix.
 * @param {vec3} eye The eye position.
 * @param {vec3} at  The look-at target position.
 * @param {vec3} up  The world's up vector.
 * @return {matrix} The look-at matrix.
 */
// Source: https://msdn.microsoft.com/en-us/library/windows/desktop/bb205342(v=vs.85).aspx
var _axisZ = PEd_vec3Normalize(PEd_vec3Subtract(argument1, argument0));
var _axisX = PEd_vec3Normalize(PEd_vec3Cross(argument2, _axisZ));
var _axisY = PEd_vec3Cross(_axisZ, _axisX);
return PEd_matrix(PEd_vec4(_axisX[0], _axisY[0], _axisZ[0], 0),
                  PEd_vec4(_axisX[1], _axisY[1], _axisZ[1], 0),
                  PEd_vec4(_axisX[2], _axisY[2], _axisZ[2], 0),
                  PEd_vec4(-PEd_vec3Dot(_axisX, argument0), -PEd_vec3Dot(_axisY, argument0), -PEd_vec3Dot(_axisZ, argument0), 1));
