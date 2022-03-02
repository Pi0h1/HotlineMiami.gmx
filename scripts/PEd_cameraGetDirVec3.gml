/// PEd_cameraGetDirVec3()
/**
 * @brief Gets the direction vector of the editor camera.
 * @return {vec3} The direction vector of the editor camera.
 */
var _camDir   = PEd_oEditor.direction
var _camPitch = PEd_oEditor.camPitch;
var _cosPitch = dcos(_camPitch);
return PEd_vec3(+dcos(_camDir) * _cosPitch,
                -dsin(_camDir) * _cosPitch,
                +dsin(_camPitch));
