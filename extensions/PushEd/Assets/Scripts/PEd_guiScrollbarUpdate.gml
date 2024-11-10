/// PEd_guiScrollbarUpdate(scrollbar)
/**
 * @brief Updates the scrollbar.
 * @param {real} scrollbar The id of the scrollbar.
 */
var _scrollbar = argument0;
PEd_guiShapeUpdate(_scrollbar);
PEd_guiScrollbarCalcJumpAndThumbSize(_scrollbar);

var _delegate = PEd_guiShapeGetDelegate(_scrollbar);

if (PEd_guiShapeIsHovered(_scrollbar)
    || (PEd_guiShapeExists(_delegate)
        && (PEd_guiShapeIsHovered(_delegate)
            || PEd_guiShapeDelegatesRecursive(_delegate, guiShapeHovered))))
{
    var _wheel = (mouse_wheel_down() - mouse_wheel_up()) * 2 * guiFontHeight / _scrollbar[? "scrollJump"];
    if (_wheel != 0)
    {
        _scrollbar[? "scroll"] = clamp(_scrollbar[? "scroll"] + _wheel, 0, _scrollbar[? "size"] - _scrollbar[? "thumbSize"]);
        PEd_guiRequestRedraw(_scrollbar);
    }
}
