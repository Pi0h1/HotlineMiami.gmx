if scrIsSearching(sprite_index)
{
    sprite_index = scrStopSearch(sprite_index);
}

alert = 1;

if (point_distance(x, y, argument0, argument1) > 80)
{
    motion_add(point_direction(x, y, argument0, argument1), 0.25*delta);
    if (speed > (3*delta))
    {
        speed = (3*delta);
    }
    angle = point_direction(x, y, argument0, argument1);
}
else
{
    if speed > 0 speed -= 0.25 * delta;
    angle = scrRotate(angle, point_direction(x, y, argument0, argument1), 10);
    direction = angle;
}

if (reload > 0)
{
    reload -= 1;
}
else
{
    scrEnemyShoot();
}

checkreload = 0;
scrChargeSearch(argument0, argument1, argument3);
nothing = argument2;
