if (instance_exists(objPlayer)) {
    if (point_distance(x, y + 32, objPlayer.x, objPlayer.y) < 80) {
        if (place_meeting(x, y, objPlayer))
            exit;
        if (image_index < 9)
            image_index += 0.5;
        if (place_meeting(x, y, objPlayer))
            image_index -= 0.5;
    } else {
        if (image_index > 0)
            image_index -= 0.5;
    }
}

