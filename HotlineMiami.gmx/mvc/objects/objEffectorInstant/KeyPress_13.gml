if (!instance_exists(objEnemy) && !instance_exists(objEnemyBash) && !instance_exists(objKnockedOut)) {
    fade = 1;
    next = 1;
}
if (keyboard_check(vk_shift)) {
    fade = 1;
    next = 1;
}

