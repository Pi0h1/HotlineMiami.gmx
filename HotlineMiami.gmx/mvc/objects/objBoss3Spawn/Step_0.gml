if (global.done) {
    if (objPlayer.y < 288) {
        instance_destroy();
        instance_create(352, -160, objVan);
    }
}

