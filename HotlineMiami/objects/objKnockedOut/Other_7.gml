if (type == objEnemyMelee)
    type = objEnemy; //Patrol
if (type == objEnemyMeleeStationary)
    type = objEnemy;
if (type == objEnemyIdlePee)
    type = objEnemy;
if (type == objEnemyIdleSmoke)
    type = objEnemy;
if (type == objPoliceMelee || type == objPoliceStationary || type == objPolicePatrol || type == objPoliceMeleeStationary)
    type = objPolice;
my_id = instance_create(x, y, type);
if (scrIsPolice(my_id.object_index))
    my_id.sprite_index = sprPoliceWalkUnarmed;
else my_id.sprite_index = sprEWalkUnarmed;
my_id.angle = image_angle - 180;
my_id.startx = startx;
my_id.starty = starty;
with (my_id) {
    if (!place_free(x, y)) {
        x = startx;
        y = starty;
    }
}
instance_destroy();

