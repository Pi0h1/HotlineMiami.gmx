if (image_index < 12) {
    image_index += 0.25;
} else {
    myx = x + lengthdir_x(5, image_angle);
    myy = y + lengthdir_y(5, image_angle);
    my_id = instance_create(x, y - 12, objScore);
    my_id.text = "+" + string((800) + 400 * (global.factor)) + "pts";
    global.myscore += (800) + 400 * (global.factor);
    global.killscore += 800;
    global.boldscore += 400 * global.factor;
    global.combotime = 240;
    global.combo++;
    global.killx[global.kills] = x;
    global.killy[global.kills] = y;
    global.kills++;
    ds_list_add(global.bonuslist, "Mercy Kill");
    my_id = instance_create(myx, myy, objBloodPool);
    my_id = instance_create(x, y, objDeadBody);
    my_id.sprite_index = sprEFrontSnap; //Snapped
    my_id.image_index = random(4);
    my_id.image_angle = image_angle;
    global.angle = image_angle - 180;
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.reload = 30;
    if (bag)
        my_id.sprite_index = sprPWalkBag;
    with (my_id)
        move_outside_solid(global.angle, 16);
    instance_destroy();
}

if (!bled && image_index >= 6) {
    bled = 1;
    audio_play_sound(sndBonesBreak, 0, false);
}
vdist = point_distance(x, y, room_width / 2, room_height / 2);
vdir = point_direction(room_width / 2, room_height / 2, x, y);
viewspeed = point_distance(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180)) * 0.1;
viewdir = point_direction(__view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2, x + lengthdir_x(vdist * 0.2, vdir - 180), y + lengthdir_y(vdist * 0.2, vdir - 180));
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (lengthdir_x(viewspeed, viewdir)) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (lengthdir_y(viewspeed, viewdir)) );
__view_set( e__VW.Angle, 0, lengthdir_y(vdist * (1 / 160), vdir * 2) );

