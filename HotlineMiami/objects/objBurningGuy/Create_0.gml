direction = random(360);
speed = 2;
image_speed = 0.25;
diradd = -4 + random(8);
alarm[0] = 200;
repeat(30) {
    my_id = instance_create(x, y, objFlameParticle);
    my_id.direction = random(360);
    my_id.speed = 2 + random(3);
    my_id.friction = 0.15;
}
audio_play_sound(sndMolotov, 0, false);

