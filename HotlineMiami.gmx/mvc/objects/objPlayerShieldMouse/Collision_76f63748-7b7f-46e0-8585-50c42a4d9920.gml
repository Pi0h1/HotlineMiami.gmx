with (other) {
    if (place_meeting(x, y, objSolid)) {
        move_outside_solid(direction - 180, speed * 2);
        if (!place_meeting(x, y, objPlayer))
            exit;
    }
}
global.my_id = id;
image_xscale = 1.5;
image_yscale = 1.5;
energie--;
if (energie == 0) {
    alarm[1] = 5;
}
bullets = 0;

with (objEBullet) {
    if (place_meeting(x, y, global.my_id)) {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = direction - 170 + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        instance_destroy();
        global.my_id.bullets++;
    }
}
if (shotgunned)
    exit;
if (bullets > 4) {
    shotgunned = 1;
    alarm[1] = 1;
}

if (!scrCheckHitBack(dir, other.direction)) {
    image_xscale = 1;
    image_yscale = 1;
    exit;
    /*
    my_id = instance_create(x, y, objDeadBody);
    global.dir = dir;
    with my_id move_contact_solid(global.dir - 45, 12)
    if bullets > 1 my_id.sprite_index = choose(sprEBackShotgun, sprEBackShotgun, sprEFrontShotgun)
    else my_id.sprite_index = choose(sprEBackMachinegun, sprEBackMachinegun, sprEFrontMachinegun)
    my_id.direction = other.direction
    my_id.speed = 1.5 + random(1) + bullets * 0.15
    my_id.image_angle = my_id.direction
    instance_destroy()
    my_id = instance_create(x, y, objPlayerMouse)
    my_id.ammo = ammo
    if sprite_index = sprPHumanShieldDoubleBarrel my_id.sprite = sprPWalkDoubleBarrel
    if sprite_index = sprPHumanShieldMagnum my_id.sprite = sprPWalkMagnum
    if sprite_index = sprPHumanShieldScorpion my_id.sprite = sprPWalkScorpion
    if sprite_index = sprPHumanShieldUzi my_id.sprite = sprPWalkUzi
    if sprite_index = sprPHumanShieldMP5 my_id.sprite = sprPWalkMP5
    if sprite_index = sprPHumanShieldSilencer my_id.sprite = sprPWalkSilencer
    */
}

image_xscale = 1;
image_yscale = 1;
edir = other.direction;
test = 0;
repeat(2 * bullets) {
    my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, edir), y - 3 + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.sprite_index = sprBloodSplatSmall;
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(4);
}
repeat(1 + random(bullets)) {
    my_id = instance_create(x - 3 + random(6) + lengthdir_x(8, edir), y - 3 + random(6) + lengthdir_y(8, edir), objBloodDrop);
    my_id.image_xscale = 1 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = point_direction(x + lengthdir_x(8, edir), y + lengthdir_y(8, edir), my_id.x, my_id.y);
    my_id.direction = my_id.image_angle;
    my_id.speed = 1 + random(5);
}
repeat(bullets) {
    my_id = instance_create(x - 3 + random(6) + lengthdir_x(16, edir), y - 3 + random(6) + lengthdir_y(16, edir), objBloodSmoke);
    my_id.image_xscale = 1.2 - random(0.2);
    my_id.image_yscale = my_id.image_xscale;
    my_id.image_angle = edir - 20 + random(40);
    my_id.direction = my_id.image_angle;
    my_id.speed = 2 + random(1);
    my_id.friction = 0.15;
}
if (bullets > 1 || round(random(1)) || energie < 0) {
    my_id = instance_create(x + lengthdir_x(12, dir - 45), y + lengthdir_y(12, dir - 45), objDeadBody);
    if (bullets > 1) {
        my_id.sprite_index = choose(sprEBackShotgun, sprEBackShotgun, sprEFrontShotgun);
    } else my_id.sprite_index = choose(sprEBackMachinegun, sprEBackMachinegun, sprEFrontMachinegun);
    my_id.direction = edir - 8 + random(16);
    my_id.speed = 1.5 + random(1) + bullets * 0.15;
    my_id.image_angle = my_id.direction;
    instance_destroy();

    my_id = instance_create(x, y, objPlayerDead);
    if (bullets > 1) {
        my_id.sprite_index = sprPBackShotgun;
    } else my_id.sprite_index = sprPBackMachinegun;
    my_id.image_index = 1 + floor(random(4));
    my_id.direction = edir;
    my_id.speed = 1.5 + random(1) + bullets * 0.15;
    my_id.image_angle = my_id.direction;
    my_id = instance_create(x + lengthdir_x(24, edir), y + lengthdir_y(24, edir), objMaskDrop);
    my_id.direction = edir - 40 + random(80);
    my_id.speed = 1.5 + random(1);
    instance_destroy();
}

/* */
/*  */
