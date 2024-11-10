/// PEd_instanceSetScaleVec2(id, pos)
/**
 * @brief Sets the x,y scale of the instance.
 * @param {real} id  The id of the instance.
 * @param {vec2} pos The new x,y scale of the instance. 
 * @note If the instance is currently selected, this x,y scale
 *       is set to all instances in multiple selection.
 */
var _scale = argument[1];
PEd_instanceSetScaleX(argument[0], _scale[0]);
PEd_instanceSetScaleY(argument[0], _scale[1]);
