if (speed <= 0) {
    if (image_index < 28)
        image_index += 0.2;
}

if (!bled && image_index > 19) {
    bled = 1;
    repeat(5) {
        my_id = instance_create(x + lengthdir_x(5, image_angle + 45), y + lengthdir_y(4, image_angle + 35), objBloodSquirt);
        my_id.image_angle = image_angle + 110 + random(70);
    }
}

