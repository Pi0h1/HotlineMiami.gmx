if (global.xbox) {
    if (checkbutton(0, getid(5))) {
        if (presstart == 0) {
            presstart = 1;
            scrXboxMaskMenuStart();
        }
    } else presstart = 0;

    if (leftthumb_y(0) > 5000) {
        if (pressup == 0) {
            pressup = 1;
            scrXboxMaskMenuUp();
        }
    } else pressup = 0;

    if (leftthumb_y(0) < -5000) {
        if (pressdown == 0) {
            pressdown = 1;
            scrXboxMaskMenuDown();
        }
    } else pressdown = 0;

}
if (wait > 0)
    wait--;
if (keyboard_check_pressed(ord(global.upkey)))
    event_perform(ev_keypress, ord("W"));
if (keyboard_check_pressed(ord(global.downkey)))
    event_perform(ev_keypress, ord("S"));

