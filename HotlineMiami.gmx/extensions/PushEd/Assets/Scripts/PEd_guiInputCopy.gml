/// PEd_guiInputCopy()
/**
 * @brief Copies selected part of text of currently active input
 *        to the clipboard.
 */
if (guiInputIndex[0] != guiInputIndex[1]) 
{
    clipboard_set_text(string_copy(guiInputString,
                                   min(guiInputIndex[0], guiInputIndex[1]),
                                   abs(guiInputIndex[0] - guiInputIndex[1])));
}
