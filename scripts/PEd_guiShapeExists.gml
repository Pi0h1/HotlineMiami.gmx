/// PEd_guiShapeExists(shape)
/**
 * @brief Finds out whether the shape exists.
 * @param {real} shape The id of the shape.
 * @return {bool} True if the shape does exist.
 */
if (!is_real(argument0))
{
    return false;
}
return ds_exists(argument0, ds_type_map);
