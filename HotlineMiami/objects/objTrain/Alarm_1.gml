viewx = __view_get( e__VW.XView, 0 );
viewy = __view_get( e__VW.YView, 0 );
with (objPlayerMouseHouse) {
    my_id = instance_create(x, y, objPlayerMouse);
    my_id.sprite_index = sprite_index;
    my_id.image_index = 0;
    my_id.dir = dir;
    my_id.active = 0;
    my_id.maskon = 1;
    my_id.maskindex = global.maskindex;
    global.maskon = 1;
    instance_destroy();
}
__view_set( e__VW.XView, 0, viewx );
__view_set( e__VW.YView, 0, viewy );

