/// PEd_guiCanShowContextMenu()
/**
 * @brief Gets whether the context menu can be opened.
 * @return {real} True if the context menu can be opened.
 */
return (windowMouseX == guiMousePressX
    && windowMouseY == guiMousePressY
    && !keyboard_check(vk_alt));
