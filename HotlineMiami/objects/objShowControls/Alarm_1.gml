with (other) {
with (objWeapon)
    instance_destroy();
with (objWeaponThrow)
    instance_destroy();
with (objKnockedOut) instance_destroy();

if (move[select] == "Pick Up") {
    if (sprite_index == sprPWalkUnarmed) {
        sprite_index = sprPWalkBat;
    } else {
        sprite_index = sprPWalkUnarmed;
        my_id = instance_create(x + 16, y + 16, objWeapon);
        my_id.image_index = 4;
        my_id.visible = 0;
        my_id.angle = 0;
    }
}

if (move[select] == "Interact") {
    if (sprite_index == sprPWalkUnarmed) {
        sprite_index = sprPTakePhone;
        with (objAnsweringMachine)
            sprite_index = sprDrawersH24PhoneOff;
        image_index = 0;
    } else {
        sprite_index = sprPWalkUnarmed;
        with (objAnsweringMachine)
            sprite_index = sprDrawersH24Phone;
    }
}

if (move[select] == "Throw Weapon") {
    if (sprite_index == sprPWalkKnife) {
        sprite_index = sprPWalkUnarmed;
        my_id = instance_create(x + 16, y, objWeaponThrow);
        my_id.speed = 9;
        my_id.image_index = 5;
        my_id.visible = 0;
        my_id.angle = 0;
    } else {
        sprite_index = sprPWalkKnife;
    }
}

if (move[select] == "Human Shield") {
    if (sprite_index = sprPWalkDoubleBarrel) {
        sprite_index = sprPHumanShieldDoubleBarrel;
    } else {
        sprite_index = sprPWalkDoubleBarrel;
        my_id = instance_create(x, y, objKnockedOut);
        my_id.visible = 0;
        my_id.angle = 0;
    }
}

if (move[select] == "Drop Weapon") {
    if (sprite_index == sprPWalkBat) {
        sprite_index = sprPWalkUnarmed;
        my_id = instance_create(x, y, objWeaponThrow);
        my_id.image_index = 4;
        my_id.direction = -70;
        my_id.speed = 2;
        my_id.visible = 0;
        my_id.angle = 0;
        my_id.ammo = 0;
    } else {
        sprite_index = sprPWalkBat;
    }
}

if (move[select] == "Finish Enemy") {
    if (sprite_index == sprPWalkUnarmed) {
        sprite_index = sprPAttackBash;
    } else {
        sprite_index = sprPWalkUnarmed;
        my_id = instance_create(x, y, objKnockedOut);
        my_id.visible = 0;
        my_id.angle = 0;
    }
}

alarm[1] = 90;

}
