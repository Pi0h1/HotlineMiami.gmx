/// PEd_guiShapeSetRectangle(shape, x, y, width, height)
/**
 * @brief Sets the x and y position of the shape relative to it's delegate and it's size.
 * @param {real} shape  The id of the shape.
 * @param {real} x      The new x position.
 * @param {real} y      The new y position.
 * @param {real} width  The new width.
 * @param {real} height The new height.
 */
gml_pragma("forceinline");
PEd_guiShapeSetX(argument0, argument1);
PEd_guiShapeSetY(argument0, argument2);
PEd_guiShapeSetWidth(argument0, argument3);
PEd_guiShapeSetHeight(argument0, argument4);
