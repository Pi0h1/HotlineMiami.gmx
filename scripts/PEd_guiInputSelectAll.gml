/// PEd_guiInputSelectAll()
/**
 * @brief Selects all text in currently active input.
 */
var _strlen = string_length(guiInputString);
guiInputIndex[0] = 1;
guiInputIndex[1] = _strlen + 1;
