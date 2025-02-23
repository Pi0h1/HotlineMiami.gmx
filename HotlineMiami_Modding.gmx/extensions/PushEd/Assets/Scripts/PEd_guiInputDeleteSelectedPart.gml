/// PEd_guiInputDeleteSelectedPart()
/**
 * @brief Deletes selected part of input text.
 */
var _minIndex = min(guiInputIndex[0], guiInputIndex[1]);
guiInputString = string_delete(guiInputString,
                               _minIndex,
                               abs(guiInputIndex[0] - guiInputIndex[1]));
guiInputIndex[0] = _minIndex;
guiInputIndex[1] = _minIndex;
