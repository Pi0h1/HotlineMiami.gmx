if (other.object_index == objPlayerMouse || other.object_index == objPlayerMouseHouse || other.object_index == objPlayerBiker || other.object_index == objPlayerBikerHouse) {
    if (!objEffector.fade) {
        objPlayer.addx = addx * 3;
        objPlayer.addy = addy * 3;
        objPlayer.movex = movex;
        objPlayer.movey = movey;
        objPlayer.move = 1;
        objEffector.next = 1;
        objEffector.fade = 1;
        objEffector.nextroom = nextroom;
        objPlayer.persistent = 1;
        sprite = sprArrowGray;
        with (objTransitioner) {
            if (nextroom == objEffector.nextroom)
                sprite = sprArrowGray;
        }
        with (objTeleporter) {
            if (nextroom == objEffector.nextroom)
                sprite = sprArrowGray;
        }
        visible = 0;
    }
}

