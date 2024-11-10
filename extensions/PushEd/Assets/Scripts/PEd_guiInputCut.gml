/// PEd_guiInputCut()
/**
 * @brief Cuts selected part of text in currently active input.
 */
if (guiInputIndex[0] != guiInputIndex[1]) 
{
    clipboard_set_text(string_copy(guiInputString,
                                   min(guiInputIndex[0], guiInputIndex[1]),
                                   abs(guiInputIndex[0] - guiInputIndex[1])));
    PEd_guiInputDeleteSelectedPart();
}
