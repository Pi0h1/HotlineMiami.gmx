if (!instance_exists(objMaskMenu)) {
    // Oscar's Darken Room Effect
    if (global.maskindex == 14)
        bamount = 1;
}
scrSaveBonusList();
i = 0;
room_set_persistent(room, true);
room_persistent = true;
if (!global.paused) {
    scrInitPathFinding();
    if (!instance_exists(objMaskMenu))
        scrCheckpoint();
} else global.paused = 0;

