if (point_distance(x, y, objPlayer.x, objPlayer.y) < 56 && objPlayer.x > 192) {
    if (sprite_index == sprPoliceReading) {
        sprite_index = sprPolicePoint;
        image_index = 0;
        objPlayer.active = 0;
        if (!global.talked) {
            scrGetMessage(1);
            global.talked = 1;
            global.doctor = id;
        }
    }
}

if (sprite_index == sprPoliceReading) {
    if (on) {
        if (image_index < 3)
            image_index += 0.25;
    } else {
        if (image_index > 0)
            image_index -= 0.25;
    }
    if (image_index < 3)
        exit;
}
angle = direction;
if (point_distance(x, y, objPlayer.x, objPlayer.y) > 200)
    test = 1;
else {
    test = scrLook(objPlayer.x, objPlayer.y, 4);
}
if (test = 0 || test == 2) {
    speed = 0;

    if (sprite_index == sprPoliceReading) {
        sprite_index = sprPolicePoint;
        image_index = 0;
        objPlayer.active = 0;
        if (!global.talked) {
            scrGetMessage(1);
            global.talked = 1;
            global.doctor = id;
        }
    } else {
        direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
        if (image_index < 6)
            image_index += 0.15;
    }
}

if (sprite_index == sprPolicePoint) {
    if (!instance_exists(objPhoneConversation)) {
        objEffector.fade = 1;
    }
}

