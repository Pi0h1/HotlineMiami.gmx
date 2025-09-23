if (other.object_index == objWallSoftH || other.object_index == objWallSoftV) {
    if (solid) {
        x += hspeed;
        y += vspeed;
    }
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objHit);
    my_id.image_angle = direction;
    my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objSmokeHit);
    my_id.image_angle = direction;
    my_id.direction = random(360);
    my_id.speed = random(0.5);

    repeat(4) {
        my_id = instance_create(x + lengthdir_x(14, direction), y + lengthdir_y(14, direction), objDebris);
        my_id.direction = random(360);
        my_id.speed = random(4);
    }
    if (!passed) {
        passed = 1;
        dirx = x - lengthdir_x(16, direction);
        diry = y - lengthdir_y(16, direction);
    }
    exit;
}

if (other.object_index == objGlassPanelH) {
    SteamIncStat("Windows", 1);
    if (vspeed > 0) {
        other.add = -1;
    } else {
        other.add = 1;
    }
    with (other) {
        i = 0;
        repeat(24) {
            my_id = instance_create(x + i * 1.5, y, objShard);
            my_id.speed = random(5);
            my_id.direction = add * 90 - 8 + random(16);
            i++;
        }
        instance_create(x, y, objGlassPanelHBroken);
        instance_destroy();
        if (!audio_is_playing(sndGlass1) && !audio_is_playing(sndGlass2)) {
            audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        }
    }
    exit;
}

if (other.object_index == objGlassPanelV) {
    SteamIncStat("Windows", 1);
    if (hspeed > 0) {
        other.add = -1;
    } else {
        other.add = 1;
    }
    with (other) {
        i = 0;
        repeat(24) {
            my_id = instance_create(x, y + i * 1.5, objShard);
            my_id.speed = random(5);
            my_id.direction = 90 + add * 90 - 8 + random(16);
            i++;
        }
        instance_create(x, y, objGlassPanelVBroken);
        instance_destroy();
        if (!audio_is_playing(sndGlass1) && !audio_is_playing(sndGlass2)) {
            audio_play_sound(choose(sndGlass1, sndGlass2), 0, false);
        }
    }
    exit;
}

