if (state < 3)
    exit;
if (sprite_index == sprBodyguardKnockedOut)
    exit;
path_end();
sprite_index = sprBodyguardKnockedOut;
speed = 1.5;
friction = 0.1;
direction = other.direction;
global.shake = 10;
audio_play_sound(sndHit, 0, false);
audio_play_sound(sndHitWall, 0, false);
repeat(6) {
    my_id = instance_create(x - 3 + random(6), y - 3 + random(6), objBloodDrop);
    my_id.direction = point_direction(x, y, my_id.x, my_id.y);
    my_id.image_xscale = 1 + random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = random(360);
    my_id.speed = 2 + random(4);
}
with (other)
    move_bounce_all(0);

