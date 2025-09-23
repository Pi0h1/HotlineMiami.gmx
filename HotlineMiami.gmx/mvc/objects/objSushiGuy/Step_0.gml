if (instance_number(objEnemy) + instance_number(objKnockedOut) == 0) {
    with (objDoorV)
        solid = 0;
}
if (!instance_exists(objPlayer))
    exit;
if (on == 0)
    exit;
if (objPlayer.x > 456 && objPlayer.y > 352) {
    if (sprite_index == sprSushiGuyShake) {
        sprite_index = sprSushiGuy;
        image_index = 0;
        image_speed = 0;
    }
    if (image_index < 3)
        image_index += 0.2;
    if (!instance_exists(objPlayerBikerHouse)) {
        with (objPlayerBiker) {
            instance_create(x, y, objPlayerBikerHouse);
            with (objEffector)
                instance_destroy();
            my_id = instance_create(x, y, objEffectorHouse);
            my_id.leveltitle = "";
            my_id.blackx = 0;
            my_id.amount = 180;
            instance_destroy();
        }
    }
    direction = scrRotate(direction, point_direction(x, y, objPlayer.x, objPlayer.y), 10);
}

if (place_meeting(x, y, objPlayerBikerHouse)) {
    my_id = instance_create((objPlayerBiker.x + x) * 0.5, (objPlayerBiker.y + y) * 0.5, objBikerSushi);
    my_id.image_angle = point_direction(objPlayerBiker.x, objPlayerBiker.y, x, y);
    with (objPlayerBiker)
        instance_destroy();
    instance_destroy();
}

