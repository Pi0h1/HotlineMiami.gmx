if (sprite_index == sprBoss4Reload1 || sprite_index == sprBoss4Shoot1) {
    sprite_index = sprBoss4Hit1;
    image_index = 0;
    image_angle = 0;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat(5) {
        my_id = instance_create(x - 12, y, objBloodDrop);
        my_id.direction = other.direction - 20 + random(40);
        my_id.speed = 2 + random(2);
        my_id.image_xscale = 1 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
    }
    with (other)
        instance_destroy();

    my_id = instance_create(x - 12, y, objSpecificWeapon);
    my_id.direction = 160 + random(40);
    my_id.speed = 1.5;
    my_id.friction = 0.1;
    my_id.image_index = 12;
    my_id.ammo = 0;
    exit;
}

if (sprite_index == sprBoss4Reload2 || sprite_index == sprBoss4Shoot2) {
    sprite_index = sprBoss4Hit2;
    image_index = 0;
    image_angle = 0;
    audio_play_sound(choose(sndCut1, sndCut2), 0, false);
    repeat(5) {
        my_id = instance_create(x + 12, y, objBloodDrop);
        my_id.direction = other.direction - 20 + random(40);
        my_id.speed = 2 + random(2);
        my_id.image_xscale = 1 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
    }
    my_id = instance_create(x + 12, y, objSpecificWeapon);
    my_id.direction = -20 + random(40);
    my_id.speed = 1.5;
    my_id.friction = 0.1;
    my_id.image_index = 12;
    my_id.ammo = 0;
    with (other)
        instance_destroy();
    exit;
}

