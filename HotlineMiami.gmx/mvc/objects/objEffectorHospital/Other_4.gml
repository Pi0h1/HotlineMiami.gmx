global.myscore = 0;
drawscore = 0;
i = 0;
room_set_persistent(room, true);
room_persistent = true;
scrInitPathFinding();
if (room == rmSequence1 || room == rmSequence2 || room == rmSequence3 || room == rmSequence4 || room == rmSequence5 || room == rmSequence6 || room == rmSequence7 || room == rmSequence8) {
    if (!instance_exists(objPlayer))
        instance_create(336, 268, objPlayerMouseHouse);
}

