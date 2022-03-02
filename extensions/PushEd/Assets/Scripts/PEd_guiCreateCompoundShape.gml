/// PEd_guiCreateCompoundShape([type])
/**
 * @brief Creates a new compound shape.
 * @param {PEdGUIShape} type The compound shape type.
 * @return {real} The id of the created compound shape.
 */
var _compoundShape;
if (argument_count == 1)
{
    _compoundShape = PEd_guiCreateShape(argument[0]);
}
else
{
    _compoundShape = PEd_guiCreateShape(PEdGUIShape.Compound);
}
_compoundShape[? "scrUpdate"] = PEd_guiCompoundShapeUpdate;
_compoundShape[? "scrCleanUp"] = PEd_guiCompoundShapeCleanUp;
ds_map_add_list(_compoundShape, "items", ds_list_create());
return _compoundShape;
