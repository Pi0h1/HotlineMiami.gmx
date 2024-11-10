/// PEd_mouseRay3D()
/**
 * @brief Gets a ray pointing from the camera in the mouse direction.
 * @return {vec3} A ray pointing from the camera in the mouse direction.
 */
gml_pragma("forceinline");
return PEd_cameraUnprojectVec2(PEd_vec2(windowMouseX, windowMouseY));
