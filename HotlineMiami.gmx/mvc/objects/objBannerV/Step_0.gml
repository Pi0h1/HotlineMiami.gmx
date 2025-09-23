if (!place_meeting(x, y, objPlayer) && !place_meeting(x, y, objEnemy)) {
    if (image_index < 2.85)
        image_index += 0.15;
    else {
        if (image_index > 3)
            image_index -= 0.15;
        else image_index = 3;
    }
}

