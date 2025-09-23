if (sprite_index == sprFatmanEatingDie) {
    if (image_index < 9)
        image_index += 0.2;
    image_speed = 0;
    exit;
}
if (!instance_exists(objPlayer))
    exit;
if (sprite_index == sprFatmanEating) {
    test = scrLook(objPlayer.x, objPlayer.y, 4);
    if (test == 0 || test == 2) {
        image_index = 0;
        image_speed = 0;
        sprite_index = sprFatmanEatingGiveUp;
    }
}

if (sprite_index == sprFatmanEatingGiveUp) {
    if (image_index < 4)
        image_index += 0.2;
}

