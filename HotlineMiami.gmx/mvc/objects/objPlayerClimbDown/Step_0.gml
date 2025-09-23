image_angle = scrRotate(image_angle, 0, 6);

if (image_angle == 0) {
    if (wait > 0) {
        wait -= 1
    } else {
        if (sprite_index == sprBoss2Walk) {
            sprite_index = sprMCClimbDown;
            image_index = 0;
            audio_play_sound(sndLadder, 0, false);
        }
        objEffector.fade = 1;
        objEffector.next = 1;
        objEffector.nextroom = rmSecretSewer;
        if (image_index < 7)
            image_index += 0.2;
    }
}

