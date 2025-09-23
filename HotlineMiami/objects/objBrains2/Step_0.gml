dist -= speed;
if (dist <= 0) {
    if (speed > 0) {
        my_id = instance_create(x, y, objBloodDrop2);
        my_id.direction = direction;
        speed = 0;
        image_speed = 0;
        my_id.speed = 0.1;
    } else {
        if (wait > 0)
            wait--;
        else {
            if (!instance_exists(objBloodPool)) {
                if (!global.blood || global.surfaces)
                    addToSurface(global.surf2, 1);
            }
        }
    }
}

