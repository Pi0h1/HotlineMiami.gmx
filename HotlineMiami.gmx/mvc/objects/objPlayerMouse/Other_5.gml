// Force player and camera to move when transitioning
if (persistent) {
    if (move == 1) {
        move = 0;
        x += movex;
        y += movey;
        xview += movex;
        yview += movey;
    }
}

