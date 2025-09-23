revisit = 0;
if (instance_exists(objPlayerMouseHouse)) {
    if (global.done) {
        nextroom = rmChapter;
    } else {
        nextroom = rmInterlude
        global.interlude = scrCarNextInterlude();
    }
} else nextroom = rmChapter;

