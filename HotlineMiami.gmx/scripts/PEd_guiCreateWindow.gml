/// PEd_guiCreateWindow(title)
/**
 * @brief Creates a new window.
 * @param {string} title The window title.
 * @return {real} The id of the created window.
 */
var _window = PEd_guiCreateCompoundShape(PEdGUIShape.Window);
var _titleBar = PEd_guiCreateContainer();
var _container = PEd_guiCreateContainer();
_window[? "titleBar"] = _titleBar;
_titleBar[? "title"] = argument0;
_titleBar[? "content"] = PEd_guiContentTitleBarWindow;
PEd_guiCanvasSetBackground(_titleBar, PEdColour.WindowBorder);
_window[? "container"] = _container;
PEd_guiAddItem(_window, _titleBar);
PEd_guiAddItem(_window, _container);
_window[? "scrUpdate"] = PEd_guiWindowUpdate;
_window[? "scrDraw"] = PEd_guiWindowDraw;
_window[? "resize"] = PEdGUIResize.None;
_window[? "drag"] = false;
_window[? "mouseOffsetX"] = 0;
_window[? "mouseOffsetY"] = 0;
_window[? "border"] = 4;
PEd_guiShapeSetSize(_window, 300, 200);
PEd_guiShapeSetDepth(_window, 16777216);
return _window;
