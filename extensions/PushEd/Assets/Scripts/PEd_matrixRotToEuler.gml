/// PEd_matrixRotToEuler(rotationMatrix)
/**
 * @brief Gets euler angles from a YXZ rotation matrix.
 * @param {matrix} rotationMatrix The YXZ rotation matrix.
 * @return {vec3} vec3(Rx, Ry, Rz).
 */
// Source: https://www.geometrictools.com/Documentation/EulerAngles.pdf
var _mat = argument0;
var _thetaX, _thetaY, _thetaZ;

if (_mat[6] < 1)
{
    if (_mat[6] > -1)
    {
        _thetaX = arcsin(-_mat[6]);
        _thetaY = arctan2(_mat[2], _mat[10]);
        _thetaZ = arctan2(_mat[4], _mat[5]);
    }
    else
    {
        _thetaX = pi * 0.5;
        _thetaY = -arctan2(-_mat[1], _mat[0]);
        _thetaZ = 0;
    }
}
else
{
    _thetaX = -pi * 0.5;
    _thetaY = arctan2(-_mat[1], _mat[0]);
    _thetaZ = 0;
}

return PEd_vec3(radtodeg(_thetaX) mod 360,
                radtodeg(_thetaY) mod 360,
                radtodeg(_thetaZ) mod 360);
