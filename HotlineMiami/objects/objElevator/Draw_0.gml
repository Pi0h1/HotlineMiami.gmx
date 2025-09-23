draw_sprite_ext(sprElevatorFloor, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, c_black, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (room == rmHotelEntrance) {
    test = 1;
    if (objFatmanEating.sprite_index == sprFatmanEating || objFatmanEating.sprite_index == sprFatmanEatingGiveUp || objFatmanTelephone.sprite_index == sprFatmanTelephone || objFatmanTelephone.sprite_index == sprFatmanTelephoneGiveUp)
        test = 0;
    if (test == 0)
        exit;
}

if (!instance_exists(objEnemy) && !instance_exists(objKnockedOut) && !instance_exists(objBoss) && !instance_exists(objFiles) && !instance_exists(objBossgun) && !instance_exists(objMiscEnemy)) {
    if (!instance_exists(objPlayerCarEnter) || !global.done) {
        draw_sprite_ext(sprArrow, image_index, x + lengthdir_x(lengthdir_x(3, dir), image_angle - 90), y + lengthdir_y(lengthdir_x(3, dir), image_angle - 90), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        dir += 8;
    }
}

