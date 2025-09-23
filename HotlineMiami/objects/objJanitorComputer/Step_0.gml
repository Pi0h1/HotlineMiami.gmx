if (global.xbox)
    scrXboxJanitorComputer();
if (!check)
    exit;
if (!instance_exists(objPhoneConversation)) {
    if (instance_exists(objPlayerBikerHack)) {
        with (objPlayerBikerHack) {
            instance_create(x, y, objPlayerBikerHouse);
            instance_destroy();
        }
    }
}

