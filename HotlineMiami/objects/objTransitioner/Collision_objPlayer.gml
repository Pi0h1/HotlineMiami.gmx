if (solid)
    exit;
if (other.object_index == objPlayerMouse || other.object_index == objPlayerMouseHouse || other.object_index == objPlayerBiker || other.object_index == objPlayerBikerHouse) {
    sprite = sprArrowGray;
    objPlayer.persistent = 1;
    objPlayer.addx = addx * 3;
    objPlayer.addy = addy * 3;
    objEffector.next = 1;
    objEffector.fade = 1;
    objEffector.nextroom = nextroom;
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

