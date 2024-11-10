/// PEd_guiCreateCanvas([type])
/**
 * @brief Creates a new canvas.
 * @param {PEdGUIShape} type The canvas type.
 * @return {real} The id of the createed canvas.
 */
var _canvas;
if (argument_count == 1)
{
    _canvas = PEd_guiCreateCompoundShape(argument[0]);
}
else
{
    _canvas = PEd_guiCreateCompoundShape(PEdGUIShape.Compound);
}
PEd_guiCanvasSetSurface(_canvas, noone);
PEd_guiCanvasSetBackground(_canvas, PEdColour.WindowBackground);
_canvas[? "scrDraw"] = PEd_guiCanvasDraw;
_canvas[? "scrCleanUp"] = PEd_guiCanvasCleanUp;
return _canvas;
