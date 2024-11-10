/// PEd_guiShapeIsHovered(shape)
/**
 * @brief Gets whether the shape is hovered.
 * @param {real} shape The id of the shape.
 * @return {bool} True if the shape is hovered.
 */
gml_pragma("forceinline");
return (guiShapeHovered == argument0
        && (!PEd_guiShapeExists(guiShapeActive)
            || guiShapeActive == argument0));
