/// PEd_instanceGetMatrix(id)
/**
 * @brief Gets transformation matrix of the instance.
 * @param {real} id The id of the instance.
 * @return {matrix} The transformation matrix of the instance.
 */
gml_pragma("forceinline");
with (argument0)
{
    var _xPos = variable_instance_get(id, PEd_POS_X);
    var _yPos = variable_instance_get(id, PEd_POS_Y);
    var _zPos = variable_instance_get(id, PEd_POS_Z);

    var _xScale = variable_instance_get(id, PEd_SCALE_X);
    var _yScale = variable_instance_get(id, PEd_SCALE_Y);
    var _zScale = variable_instance_get(id, PEd_SCALE_Z);

    var _xRot = variable_instance_get(id, PEd_ROT_X);
    var _yRot = variable_instance_get(id, PEd_ROT_Y);
    var _zRot = variable_instance_get(id, PEd_ROT_Z);
    
    return matrix_multiply(
        matrix_multiply(
            matrix_build(0, 0, 0, 0, 0, 0, _xScale, _yScale, _zScale),
            matrix_build(0, 0, 0, _xRot, _yRot, _zRot, 1, 1, 1)),
        matrix_build(_xPos, _yPos, _zPos, 0, 0, 0, 1, 1, 1));
}
