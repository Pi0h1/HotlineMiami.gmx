/// PEd_guiCompoundShapeGetItems(compoundShape)
/**
 * @brief Gets the list of items of the compound shape.
 * @param {real} compoundShape The id of the compound shape.
 * @return {real/undefiend} The list of items of the compound shape or
 *                          undefined, if the shape is not compound.
 */
gml_pragma("forceinline");
return argument0[? "items"];
