scrMoveSolidOn();
if (image_speed < 1)
    image_speed = speed * 0.1;
if (!place_free(x, y)) {
    tempdir = direction;
    i = 1;
    while ((!place_free(x + lengthdir_x(4 + i / 20, tempdir), y + lengthdir_y(4 + i / 20, tempdir))) && i < 100) {
        tempdir += 18;
        i++;
    }
    if (i < 100)
        move_outside_solid(tempdir, 4 + i / 20);
}

scrDPatrolStep();
scrMoveSolidOff();

if (!instance_exists(objPlayer)) {
    alert = 0;
    direction = round(direction * (1 / 10)) * 10;
    exit;
}

