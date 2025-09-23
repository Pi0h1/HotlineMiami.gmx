if (global.xbox == 1) 
    exit;
// Time required for the button to be held before being picked up
if (release < 20) {
    scrPlayerPickUp();
    release = 0;
}

