image_speed = 0;
image_index = 0;
reload = floor(random(10));
alert = 0;
image_index = floor(random(3));
ammo = 0;
path = path_add();
type = choose(objEnemy, objEnemyMeleeStationary);
if (room == rmTrainstationEntrance || room == rmBossClubFloor1)
    type = objEnemyMeleeStationary;
if (room == rmHotelEntrance)
    type = choose(objEnemy);
on = 0;

