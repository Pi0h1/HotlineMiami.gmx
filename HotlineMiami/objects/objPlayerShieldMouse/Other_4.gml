if (persistent) {
    if (move) {
        move = 0;
        x += movex;
        y += movey;
        xview += movex;
        yview += movey;
    }
    __view_set( e__VW.XView, 0, xview );
    __view_set( e__VW.YView, 0, yview );
    alarm[0] = 36;
} else {
    __view_set( e__VW.Angle, 0, 1 );
    __view_set( e__VW.XView, 0, x - __view_get( e__VW.WView, 0 ) / 2 );
    __view_set( e__VW.YView, 0, y - __view_get( e__VW.HView, 0 ) / 2 );
}

