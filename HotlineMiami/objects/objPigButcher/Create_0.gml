if (room == rmTutorial) {
    global.maskindex = 3;
    global.maskon = 1;
    global.done = 1;
}
global.pigkill = 0;
image_speed = 0;
dir = 0;
movex = 0;
movey = 0;
move = 0;
viewspeed = 0;
myxspeed = 0;
myyspeed = 0;
myspeed = 0;
reload = 20;
light = 0;
legdir = 0;
legindex = 0;
left = 1;
ammo = 0;
energie = round(random(1));
throwreload = 0;
scrInitThrowPos();
scrInitMaskPos();
scrUpdateMaskPos(sprite_index);
last_sprite = sprite_index;
throwindex = 0;
masksprite = -1;
maskindex = global.maskindex;
maskon = global.maskon;
release = 0;
shieldwait = 0;
aim = 0;
global.enemy = -1234;
if !(variable_local_exists("clear"))
    clear = 0;
if !(place_free(x, y)) {
    x = global.executionx;
    y = global.executiony;
}

