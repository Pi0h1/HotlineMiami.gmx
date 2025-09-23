if (instance_exists(global.enemy)) {
    global.enemy = -1234;
    exit;
}

global.enemy = scrInstanceNearestExt(global.mousex, global.mousey, objEnemy, objEnemyIdle, objEHideM16, objBoss, objPanther, objMiscEnemy);
if (!instance_exists(global.enemy))
    global.enemy = -1234;
