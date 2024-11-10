/// PEd_guiShowPopupMessage(text, [ms])
/**
 * @brief Shows the popup message.
 * @param {string} text The text of the popup message.
 * @param {real}   [ms] The duration of the popup message in ms.
 */
guiPopupMessage = argument[0];
guiPopupTimer = current_time;
if (argument_count > 1)
{
    guiPopupDuration = argument[1];
}
else
{
    guiPopupDuration = 2000;
}
