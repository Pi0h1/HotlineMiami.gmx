if (!visible)
    exit;
if (wait > 0) {
    wait--;
    exit;
}
if (on == 1) {
    if (image_index < 12)
        image_index += 0.5;
    else {
        if (spawned < 2) {
            with (objTrain)
                solid = 0;
            my_id = instance_create(x - 20, y, objEnemyMelee);
            spawned = 2;
            scrInitPathFinding();
        }
        if (wait2 > 0)
            wait2--;
        else on = 2;
    }
}
if (on == 2) {
    if (image_index > 0)
        image_index -= 0.5;
}

