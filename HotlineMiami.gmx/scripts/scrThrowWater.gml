/// scrThrowWater(speed)
var dropletAmount   = 3 + random(2);

repeat (dropletAmount) {    
    var waterX = x + lengthdir_x(11,dir)-2+random(4);
    var waterY = y + lengthdir_x(11,dir)-2+random(4);
    
    my_id = instance_create(waterX,waterY, objPWater);
    global.mydir = dir;
    with my_id move_contact_solid(global.mydir,10);
    my_id.direction = point_direction(x,y,my_id.x,my_id.y);
    my_id.speed = argument0;
    my_id.image_angle = my_id.direction;
    }
