image_index = speed * 2;
if (speed <= 0) {
    my_id = instance_create(x, y, objBloodSplat);
    my_id.image_xscale = image_xscale;
    my_id.image_yscale = image_yscale;
    instance_destroy();
}

