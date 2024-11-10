/// PEd_instanceGetColourARGB(id)
/**
 * @brief Gets the instance ARGB color.
 * @param {real} id The id of the instance.
 * @return {real} The ARGB color.
 */
return PEd_colourAlphaToArgb(
    variable_instance_get(argument0, PEd_COLOUR),
    variable_instance_get(argument0, PEd_ALPHA));
