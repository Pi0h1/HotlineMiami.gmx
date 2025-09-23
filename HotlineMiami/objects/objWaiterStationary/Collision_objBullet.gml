global.my_id = id;
image_xscale = 1.5;
image_yscale = 1.5;
bullets = 0;
energie -= 1 + other.caliber;
with (objBullet) {
    if (place_meeting(x, y, global.my_id)) {
        my_id = instance_create(x, y, objBloodSmoke);
        my_id.direction = direction - 170 + random(10);
        my_id.speed = 1;
        my_id.image_angle = my_id.direction;
        my_id.image_xscale = 0.8 + random(0.2);
        my_id.image_yscale = my_id.image_xscale;
        if (!caliber)
            instance_destroy();
        global.my_id.bullets++;
    }
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
    if (sprite_index == sprEWalkUnarmed)
        noweapon = 1;
    else noweapon = 0;
    global.punchonly = 0;
    if (noweapon)
        factor = 0.5;
    else factor = 1;
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string(((100 + bullets * 20) + 80 * factor) * global.factor) + "pts";
    global.myscore += ((100 + bullets * 20) + 80 * factor) * global.factor;
    global.killscore += (100 + bullets * 20);
    global.boldscore += 80 * factor;
    global.combo++;
    global.combotime = 240;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills++;
    global.gunkill++;
    my_id = instance_create(x, y, objDeadBody);
    if (bullets > 1)
        my_id.sprite_index = sprWaiterDeadShotgun;
    else my_id.sprite_index = sprWaiterDeadMachinegun;
    my_id.image_index = 1 + floor(random(4));
    my_id.direction = edir;
    my_id.speed = 1.5 + random(1) + bullets * 0.15;
    my_id.image_angle = my_id.direction;


    if (!noweapon) {
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.image_index = scrCurrentWeaponExt(sprite_index);
        my_id.direction = other.direction - 70 + random(40);
        my_id.speed = 2 + random(2);
        my_id.ammo = ammo;
    }
    instance_destroy();
}

