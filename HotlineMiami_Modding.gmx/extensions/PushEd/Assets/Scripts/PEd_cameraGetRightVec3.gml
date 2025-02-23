/// PEd_cameraGetRightVec3()
/**
 * @brief Gets the right vector of the editor camera.
 * @return {vec3} The right vector of the editor camera.
 */
gml_pragma("forceinline");
return PEd_vec3(+dcos(PEd_oEditor.direction - 90),
                -dsin(PEd_oEditor.direction - 90),
                0);
