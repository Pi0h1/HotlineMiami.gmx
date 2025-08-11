if (gettrigger_r() > 50) {
    scrXboxBikerAttack();
} else pressrtrig = 0;

if (gettrigger_l() > 50) {
    scrXboxBikerKnife();
} else pressltrig = 0;

if (checkbutton(0, getid(11))) {
    if (!pressa) {
        pressa = 1;
        scrMCKill();
    }
} else pressa = 0;

if (checkbutton(0, getid(8))) {
    if (!pressrstick) {
        pressrstick = 1;
        scrXboxPlayerLockOn();
    }
} else pressrstick = 0;
