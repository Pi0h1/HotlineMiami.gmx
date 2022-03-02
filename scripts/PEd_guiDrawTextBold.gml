/// PEd_guiDrawTextBold(x, y, text)
/**
 * @brief Draws bold text at the given position.
 * @param {real}   x    The x position to draw the text at.
 * @param {real}   y    The y position to draw the text at.
 * @param {string} text The text to draw.
 * @note The sets the font to bold and resets it back to normal
 *       right after rendering the text.
 */
gml_pragma("forceinline");
draw_set_font(PEd_fntBold);
draw_text(argument0, argument1, argument2);
draw_set_font(PEd_fntNormal);
