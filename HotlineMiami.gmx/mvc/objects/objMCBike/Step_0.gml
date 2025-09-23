if (global.done) {
    if (place_meeting(x + lengthdir_x(8, image_angle + 90), y + lengthdir_y(8, image_angle + 90), objPlayerBiker)) {
        if (objPlayerBiker.x > x - 6 && objPlayerBiker.x < x + 6) {
            with (objPlayerBiker)
                instance_destroy();
            sprite_index = sprMCGetOnBike;
        }
    }

    if (place_meeting(x + lengthdir_x(8, image_angle - 90), y + lengthdir_y(8, image_angle - 90), objPlayerBiker)) {
        if (objPlayerBiker.x > x - 6 && objPlayerBiker.x < x + 6) {
            with (objPlayerBiker)
                instance_destroy();
            sprite_index = sprMCGetOnBike;
            image_yscale = -1;
        }
    }
}

if (sprite_index == sprMCGetOnBike) {
    if (image_index < 15) {
        image_index += 0.15;
    } else {
        if (!objEffector.fade) {
            audio_play_sound(sndBikeStart, 0, false);
            objEffector.nextroom = scrGetRoom();
            objEffector.newsong = 1;
            objEffector.song = scrGetSong(room);
            objEffector.fade = 1;
            objEffector.next = 1;
        }
    }
}

