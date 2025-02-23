/// PEd_guiScrollbarCalcJumpAndThumbSize(scrollbar)
/**
 * @brief Calculates the jump value and thumb size of the scrollbar.
 * @param {real} scrollbar The id of the scrollbar.
 */
var _size = argument0[? "size"];
var _contentSize = argument0[? "contentSize"];
var _minThumbSize = argument0[? "minThumbSize"];

var _viewableRatio = _size / _contentSize;
var _scrollBarArea = _size;
var _thumbSize = max(_minThumbSize, _scrollBarArea * _viewableRatio);
argument0[? "thumbSize"] = _thumbSize;

var _scrollTrackSpace = _contentSize - _size;
var _scrollThumbSpace = _size - _thumbSize;
argument0[? "scrollJump"] = _scrollTrackSpace / _scrollThumbSpace;
