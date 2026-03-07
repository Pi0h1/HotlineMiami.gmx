/*vcapture_frame()

Takes a snapshot of the game, and appends it into the current video file. 
This can probably be called anywhere outside a Draw event. If the window 
is minimized, out of focus or outside the desktop area, the frame appended 
will be incorrect. 
Bear in mind that this function's speed is dictated by the codec and 
compression settings used.*/
return external_call( global.fvcapture_frame);
