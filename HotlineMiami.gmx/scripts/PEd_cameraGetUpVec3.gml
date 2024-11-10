/// PEd_cameraGetUpVec3()
/**
 * @brief Gets the up vector of the editor camera.
 * @return {vec3} The up vector of the editor camera.
 */
var _dir   = PEd_cameraGetDirVec3();
var _right = PEd_cameraGetRightVec3();
return PEd_vec3Normalize(PEd_vec3Cross(_dir, _right));
