if (room == rmSequence13) {
    with (objPlayerMouseHouse) {
        if (place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objLaundryBasket)) {
            if (objLaundryBasket.clothes) {
                objLaundryBasket.clothes = 0;
                with (objPlayerPants)
                    visible = 1;
                with (objPlayerJacket)
                    visible = 1;
                mouse_clear(mb_left);
            }
        }
    }
}

