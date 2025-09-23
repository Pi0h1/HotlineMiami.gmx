if (global.xbox)
    exit;
if (instance_exists(objPlayer)) {
    // do nothing
} else {
    scrSaveAchievements();
    fade = 1;
    next = 0;
}

