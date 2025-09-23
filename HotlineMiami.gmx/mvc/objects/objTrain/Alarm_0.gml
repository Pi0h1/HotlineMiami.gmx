if (objPlayer.persistent) {
    alarm[0] = 2;
    exit;
}
viewx = __view_get( e__VW.XView, 0 );
viewy = __view_get( e__VW.YView, 0 );
with (objPlayerMouse) {
    my_id = instance_create(x, y, objPlayerMouseHouse);
    my_id.sprite_index = sprPWalkBag;
    my_id.image_index = 0;
    my_id.dir = dir;
    my_id.active = 0;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    instance_destroy();
}
__view_set( e__VW.XView, 0, viewx );
__view_set( e__VW.YView, 0, viewy );
alarm[1] = 100;

