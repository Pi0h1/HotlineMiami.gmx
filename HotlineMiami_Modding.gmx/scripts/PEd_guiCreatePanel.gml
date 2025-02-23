/// PEd_guiCreatePanel(title)
/**
 * @brief Creates a new panel.
 * @param {string} title The name of the panel.
 * @return {real} The id of the created panel.
 */
var _panel = PEd_guiCreateCompoundShape(PEdGUIShape.Panel);
var _titleBar = PEd_guiCreateContainer();
var _container = PEd_guiCreateContainer();
_panel[? "titleBar"] = _titleBar;
_titleBar[? "title"] = argument0;
_titleBar[? "content"] = PEd_guiContentTitleBar;
PEd_guiCanvasSetBackground(_titleBar, PEdColour.WindowBorder);
_panel[? "container"] = _container;
PEd_guiAddItem(_panel, _titleBar);
PEd_guiAddItem(_panel, _container);
_panel[? "scrDraw"] = PEd_guiPanelDraw;
return _panel;
