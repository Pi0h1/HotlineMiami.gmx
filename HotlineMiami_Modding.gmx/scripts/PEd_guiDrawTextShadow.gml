/// PEd_guiDrawTextShadow(x, y, text, colourText, colourShadow)
/**
 * @brief Draws text with shadow at the given position.
 * @param {real}   x            The x position to draw the text at.
 * @param {real}   y            The y position to draw the text at.
 * @param {string} text         The text to draw.
 * @param {real}   colourText   The colour of the text.
 * @param {real}   colourShadow The colour of the shadow.
 */
gml_pragma("forceinline");
draw_text_colour(argument0 + 1, argument1 + 1, argument2, argument4, argument4, argument4, argument4, 1);
draw_text_colour(argument0, argument1, argument2, argument3, argument3, argument3, argument3, 1);
