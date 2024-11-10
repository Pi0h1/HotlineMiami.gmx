/// PEd_instanceCopy(id)
/**
 * @brief Creates a copy of the instance.
 * @param {real} id The id of the instance to make a copy of.
 * @return {real} The id of the created copy.
 */
with (argument0) 
{
    var _i = instance_copy(false);
    PEd_instanceSetPosX(_i, PEd_oPivot.x);
    PEd_instanceSetPosY(_i, PEd_oPivot.y);
    PEd_instanceSetPosZ(_i, PEd_oPivot.z);
    PEd_instanceSetCode(_i, PEd_instanceGetCode(id));
    PEd_instanceSetObjectName(_i, PEd_instanceGetObjectName(id));
    PEd_instanceSetName(_i, PEd_instanceGenerateName(_i));
    PEd_instanceSetCode(_i, PEd_instanceGetCode(_i));
    return _i;
}
