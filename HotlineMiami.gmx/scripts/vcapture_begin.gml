/*vcapture_begin( window_handle, filename, fps)

Deletes any file currently occupying filename, creates an avi file in its place a
nd prepares it for recording. The DLL can only record into one file at a time. 
Pass window_handle() as the first argument, and the video's playback FPS as the third.
When this function is called, the game will pause and the user will be presented with 
a dialog to select a codec with which the video will be compressed. For some codecs, 
compression settings can be modified within the dialog. Only codecs installed on the 
host system will be displayed.
If the user selects Cancel on the dialog, this function returns false (and the 
following functions will cause your game to hang). Otherwise, the function will return true.
*/

return external_call( global.fvcapture_begin, argument0, argument1, argument2);
