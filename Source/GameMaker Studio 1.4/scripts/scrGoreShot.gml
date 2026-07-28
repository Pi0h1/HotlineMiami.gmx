if global.maskindex=22 {
repeat (18) {
tempid=instance_create(argument0,argument1,objBloodDrop2)
tempid.speed=2+random(1)
tempid.direction=random(360)
tempid.image_angle=tempid.direction
}

repeat (6) {
tempid=instance_create(argument0-2+random(4),argument1-2+random(4),objBloodSmoke2)
tempid.speed=2+random(1)
tempid.direction=point_direction(argument0,argument1,tempid.x,tempid.y)
tempid.image_angle=tempid.direction
}

tempid=instance_create(argument3,argument4,objBulletHit)
tempid.image_angle=argument2

repeat (12) {
tempid=instance_create(argument0-1+random(2),argument1-1+random(2),objBloodHit)
tempid.speed=1+random(2)
tempid.friction=0.2
tempid.direction=argument2-45+random(90)
tempid.image_angle=tempid.direction
}

repeat (2+round(random(2))) {
instance_create(argument0-7+random(14),argument1-7+random(14),objBloodSplat2)
}


if argument5 {
repeat (6) {
tempid=instance_create(argument0-2+random(4),argument1-2+random(4),objBrains2)
tempid.speed=2+random(1)
tempid.direction=point_direction(argument0,argument1,tempid.x,tempid.y)
tempid.image_angle=tempid.direction
}
repeat (5) {
tempid=instance_create(argument0-2+random(4),argument1-2+random(4),objSkinPiece2)
tempid.speed=2+random(1)
tempid.direction=point_direction(argument0,argument1,tempid.x,tempid.y)
tempid.image_angle=tempid.direction
}
}
}
