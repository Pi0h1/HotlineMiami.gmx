/// PEd_guiCreateShape([type])
/**
 * @brief Creates a new shape.
 * @param {PEdGUIShape} [type] The type of the shape.
 * @return {real} The id of the created shape.
 */
var _shape = ds_map_create();
if (argument_count == 1)
{   
    PEd_guiShapeSetType(_shape, argument[0]);
}
else
{
     PEd_guiShapeSetType(_shape, PEdGUIShape.Blank);
}
PEd_guiShapeSetDepth(_shape, noone);
PEd_guiShapeSetDelegate(_shape, noone);
PEd_guiShapeSetX(_shape, 0);
PEd_guiShapeSetY(_shape, 0);
PEd_guiShapeSetWidth(_shape, 1);
PEd_guiShapeSetHeight(_shape, 1);
PEd_guiShapeSetDepth(_shape, 0);
PEd_guiShapeSetRedraw(_shape, true);

_shape[? "scrUpdate"] = PEd_guiShapeUpdate;
_shape[? "scrDraw"] = noone;
_shape[? "scrCleanUp"] = PEd_guiShapeCleanUp;

return _shape;
