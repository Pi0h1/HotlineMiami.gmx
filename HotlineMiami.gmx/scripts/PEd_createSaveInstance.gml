/// PEd_createSaveInstance(instance)
/**
 * @brief Stores the instance data into a ds_map.
 * @param {real} instance The id of the instance.
 * @return {real} The ds_map.
 */
PEd_instanceAutocompleteCode(argument0);
var _saveInstance = ds_map_create();
_saveInstance[? "object"] = PEd_instanceGetObjectName(argument0);
_saveInstance[? "name"] = PEd_instanceGetName(argument0);
_saveInstance[? "x"] = PEd_instanceGetPosX(argument0);
_saveInstance[? "y"] = PEd_instanceGetPosY(argument0);
_saveInstance[? "scaleX"] = PEd_instanceGetScaleX(argument0);
_saveInstance[? "scaleY"] = PEd_instanceGetScaleY(argument0);
_saveInstance[? "rotation"] = PEd_instanceGetRotZ(argument0);
_saveInstance[? "colour"] = PEd_instanceGetColour(argument0);
_saveInstance[? "alpha"] = PEd_instanceGetAlpha(argument0);
_saveInstance[? "code"] = PEd_instanceGetCode(argument0);
_saveInstance[? "visible"] = argument0.visible;
return _saveInstance;
