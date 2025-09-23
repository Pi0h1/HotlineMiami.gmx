image_speed = 0.15;
alarm[0] = 1 + random(200);
tile_layer_hide(1001);

if (round(random(2)) <= 1) {
    // do nothing
} else {
    with (objETauntBat)
        instance_destroy();
    with (objETauntChain)
        instance_destroy();
    with (objETauntPipe)
        instance_destroy();
    with (objETauntSmoke)
        instance_destroy();
    tile_layer_hide(1003);
    instance_destroy();
}

