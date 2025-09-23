if (!on)
    on = 1;
else {
    if (maskamount == 0) {
        if (currentmask < global.newmasks) {
            global.currentmask = global.newmask[currentmask];
            currentmask++;
            shine = 1;
        } else {
            scrCheckMasks();
            fade = 1;
        }
    }
}
