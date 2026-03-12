scrMainMenuBackgroundDraw();
scrMainMenuSurfaceDraw();

__view_set( e__VW.Angle, 0, lengthdir_y(3, dir * 3.33) );

//Transition between rooms
if (fade) {
    if (c_amount > 0) {
        c_amount -= 5;
        scrMainMenuFadingDraw(color2, color1, color1, color2);
        if (select == 0) {
            sxeasy_setVolume(c_amount * (1 / 180));
        }
    } else {
        scrMainMenuSelections();
    }
} else {
    if (c_amount < 180) {
        c_amount += 10
        scrMainMenuFadingDraw(color1, color2, color2, color1);
    }
}

scrMainMenuAspectRatio();
drawVignette();

