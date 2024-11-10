/// PEd_cameraGetTanFovY()
/**
 * @brief Gets the tangent of the editor camera FovY value.
 * @return {real} The tangent of the editor camera FovY value.
 */
gml_pragma("forceinline");
return dtan(PEd_oEditor.camFOV * 0.5);
