/// PEd_instanceSetPosVec2(id, pos, [updatePivot])
/**
 * @brief Sets the x,y position of the instance.
 * @param {real} id            The id of the instance.
 * @param {vec2} pos           The new x,y position of the instance. 
 * @param {bool} [updatePivot] If the instance is currently selected and this
 *                             is set to false, then the pivot will not be updated
 *                             to it's position (on the x,y axis). By default this is
 *                             set to true.
 */
var _pos = argument[1];
var _update = true;
if (argument_count > 2)
{
    _update = argument[2];
}
PEd_instanceSetPosX(argument[0], _pos[0], _update);
PEd_instanceSetPosY(argument[0], _pos[1], _update);
