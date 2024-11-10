/// bulletCollision(machine gun death sprite, shotgun death sprite)
if place_meeting(x,y,objEBullet){
    if global.godmode = 1 exit
    global.shake = 10
    
    with other {
    if place_meeting(x,y,objSolid) {
    move_outside_solid(direction-180,speed*2) 
    if !place_meeting(x,y,objPlayer) exit
    }
    }
    global.my_id=id
    image_xscale=1.5
    image_yscale=1.5
    bullets=0
    energie-=1
    with objEBullet {
    if place_meeting(x,y,global.my_id) {
    my_id=instance_create(x,y,objBloodSmoke)
    my_id.direction=direction-170+random(10)
    my_id.speed=1
    my_id.image_angle=my_id.direction
    my_id.image_xscale=0.8+random(0.2)
    my_id.image_yscale=my_id.image_xscale
    instance_destroy()
    global.my_id.bullets+=1
    }
    }
    image_xscale=1
    image_yscale=1
    edir=other.direction
    test=0
    repeat (2*bullets) {
    my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
    my_id.image_xscale=1-random(0.2)
    my_id.image_yscale=my_id.image_xscale
    my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
    my_id.sprite_index=sprBloodSplatSmall
    my_id.direction=my_id.image_angle
    my_id.speed=2+random(4)
    }
    repeat (1+random(bullets)) {
    my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
    my_id.image_xscale=1-random(0.2)
    my_id.image_yscale=my_id.image_xscale
    my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
    my_id.direction=my_id.image_angle
    my_id.speed=1+random(5)
    }
    repeat (bullets) {
    my_id=instance_create(x-3+random(6)+lengthdir_x(16,edir),y-3+random(6)+lengthdir_y(16,edir),objBloodSmoke)
    my_id.image_xscale=1.2-random(0.2)
    my_id.image_yscale=my_id.image_xscale
    my_id.image_angle=edir-20+random(40)
    my_id.direction=my_id.image_angle
    my_id.speed=2+random(1)
    my_id.friction=0.15
    }
    if bullets>1 or round(random(1)) or energie<0 {
    if bullets>1 createDeadBody(true,1.5+bullets*0.15,argument1,edir) else createDeadBody(true,1.5+bullets*0.15,argument0,edir)
    instance_destroy()
    }
}
