scrMainMenuReset();
alt[0]="START GAME"
alt[1]="CONTINUE"

i = 0;
repeat (20) {
    if (global.levels[i] == 1) {
        i += 1;
    }
}

if (i == 20) {
    alt[1]="CHAPTERS";
}
i = 0;

alt[2] = "LEADERBOARDS";
alt[3] = "OPTIONS";
alt[4] = "EXIT GAME";
selectionMax = 4;
