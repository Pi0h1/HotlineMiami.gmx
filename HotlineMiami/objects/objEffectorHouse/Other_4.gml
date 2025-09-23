global.myscore = 0;
drawscore = 0;
i = 0;
room_set_persistent(room, true);
room_persistent = true;
global.paused = 0;
if (room == rmTutorial)
    scrInitPathFinding();

// swap to a switch statement
if (room == rmSequence1 || room == rmSequence2 || room == rmSequence3 || room == rmSequence4 || room == rmSequence5 || room == rmSequence6 || room == rmSequence7 || room == rmSequence8 || room == rmSequence9) {
    if (!instance_exists(objPlayer))
        instance_create(336, 268, objPlayerMouseHouse);
}

