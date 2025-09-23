if (!place_meeting(x, y, objPlayerCarEnter)) {
    my_id = instance_create(x, y, objPVomit);
    my_id.image_angle = dir;
    instance_destroy();
}


