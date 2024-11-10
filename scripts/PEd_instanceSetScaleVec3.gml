/// PEd_instanceSetScaleVec3(id, pos)
/**
 * @brief Sets the x,y,z scale of the instance.
 * @param {real} id  The id of the instance.
 * @param {vec3} pos The new x,y,z scale of the instance. 
 * @note If the instance is currently selected, this x,y,z scale
 *       is set to all instances in multiple selection.
 */
var _scale = argument[1];
PEd_instanceSetScaleX(argument[0], _scale[0]);
PEd_instanceSetScaleY(argument[0], _scale[1]);
PEd_instanceSetScaleZ(argument[0], _scale[2]);
