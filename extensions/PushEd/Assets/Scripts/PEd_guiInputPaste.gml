/// PEd_guiInputPaste()
/**
 * @brief Pastes text from the clipboard to currently active input.
 */
if (clipboard_has_text()) 
{
    // Delete selected part
    if (guiInputIndex[0] != guiInputIndex[1])
    {
        PEd_guiInputDeleteSelectedPart();
    }
        
    // Insert string
    guiInputString = string_insert(clipboard_get_text(),
                                   guiInputString,
                                   guiInputIndex[0]);
    guiInputIndex[0] += string_length(clipboard_get_text());
    guiInputIndex[1] = guiInputIndex[0];
}
