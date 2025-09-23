i = 0;
repeat(16) {
    my_id = instance_create(other.x + 3, other.y + i * 2, choose(objDebris, objDoorDebris));
    if (other.x < x)
        my_id.direction = point_direction(other.x + 8, other.y + 16, my_id.x, my_id.y);
    else my_id.direction = point_direction(other.x - 8, other.y + 16, my_id.x, my_id.y);
    my_id.speed = random(4);
    i++;
}
instance_create(other.x, other.y, objGlassPanelDestroyedV);
with (other)
    instance_destroy();
if (global.shake < 8)
    global.shake = 8;

