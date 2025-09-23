update = 0;
if (sprite_index == sprBoss2AttackCleaver) {
    sprite_index = sprBoss2Walk;
    image_speed = 0;
    attack = 0;
}

if (sprite_index == sprBoss2Throw) {
    sprite_index = sprBoss2Walk;
    image_speed = 0;
}

if (sprite_index == sprBoss2Dodge) {
    sprite_index = sprBoss2Walk;
    image_speed = 0;
}

if (update) {
    image_speed = 0;
    image_yscale = -image_yscale;
}

