/// PEd_guiContentColourPicker(container)
/**
 * @brief Draws the content of a Colour Picker to the container.
 * @param {real} container The id of the container.
 * @return {vec2} The content size.
 */
var _container = argument0;
var _containerWidth = PEd_guiShapeGetWidth(_container);
var _contentX = 8;
var _contentY = 4;

_container[? "colour"] = PEd_guiDrawColourMix(_contentX, _contentY, _container[? "colour"]);
_contentY += PEd_guiColourMixGetHeight() + 4;

_container[? "alpha"] = PEd_guiDrawAlphaMix(_contentX, _contentY, _container[? "alpha"]);
_contentY += PEd_guiAlphaMixGetHeight() + 4;

return PEd_vec2(_containerWidth, _contentY);
