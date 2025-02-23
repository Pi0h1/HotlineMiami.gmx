/// PEd_guiCreateViewport()
/**
 * @brief Creates a new viewport.
 * @return {real} The id of the created viewport.
 */
var _viewport = PEd_guiCreateCompoundShape(PEdGUIShape.Viewport);
_viewport[? "scrUpdate"] = PEd_guiViewportUpdate;
_viewport[? "scrDraw"] = PEd_guiViewportDraw;

var _titleBar = PEd_guiCreateContainer();
_viewport[? "titleBar"] = _titleBar;
_titleBar[? "title"] = "Viewport";
_titleBar[? "content"] = PEd_guiContentTitleBar;
PEd_guiCanvasSetBackground(_titleBar, PEdColour.WindowBorder);
PEd_guiAddItem(_viewport, _titleBar);

return _viewport;
