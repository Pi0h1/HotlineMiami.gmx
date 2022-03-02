/// PEd_cameraUnprojectVec2(vector)
/**
 * @brief Unprojects the point on screen from screen space to a direction in world space.
 * @return {vec3} A vector pointing from the camera in point direction.
 */
var _vec = argument0;
var _d = PEd_cameraGetDirVec3();
var _u = PEd_cameraGetUpVec3();
var _v = PEd_cameraGetRightVec3();
var _tFov = PEd_cameraGetTanFovY();
_u = PEd_vec3Scale(_u, _tFov);
var _width = PEd_oEditor.viewportWidth;
var _height = PEd_oEditor.viewportHeight;
var _aspect = _width / _height;
_v = PEd_vec3Scale(_v, _tFov * _aspect);
var _screenX = _vec[0] - PEd_oEditor.viewportX;
var _screenY = _vec[1] - PEd_oEditor.viewportY;
var _ray = PEd_vec3Add(_d, PEd_vec3Add(PEd_vec3Scale(_u, 1 - 2 * _screenY / _height),
                                       PEd_vec3Scale(_v, 2 * _screenX / _width - 1)));
return PEd_vec3Normalize(_ray);
