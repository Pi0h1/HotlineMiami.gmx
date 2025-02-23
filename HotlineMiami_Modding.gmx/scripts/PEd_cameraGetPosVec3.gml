/// PEd_cameraGetPosVec3()
/**
 * @brief Gets the position of the editor camera.
 * @return {vec3} The position of the editor camera.
 */
gml_pragma("forceinline");
return PEd_vec3(PEd_oEditor.x, PEd_oEditor.y, PEd_oEditor.z);
