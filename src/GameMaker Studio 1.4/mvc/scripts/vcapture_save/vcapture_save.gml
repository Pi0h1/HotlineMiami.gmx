/*vcapture_save()

Ends all video capture operations and finalises the .avi file. 
The video's filesize will not be visible until this function 
is called. Once this function has been called, vcapture_begin 
can be called again to start a new video file. If your game ends 
after calling vcapture_frame but before calling this function, 
the file will fail to save and you'll most likely be left with 
a memory leak.
*/
return external_call( global.fvcapture_save);
