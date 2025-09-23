if (global.done) {
    if (place_meeting(x - 8, y, objPlayerBiker)) {
        with (objPlayerBiker)
            instance_destroy();
        instance_create(x, y, objBikerClimbUp);
    }
    if (place_meeting(x - 8, y, objPlayerMouseHouse)) {
        with (objPlayerMouseHouse)
            instance_destroy();
        instance_create(x, y, objPlayerClimbUp);
    }
}

