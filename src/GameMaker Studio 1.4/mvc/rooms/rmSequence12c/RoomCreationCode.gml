if global.resetstory exit
global.done=0
global.phone=0
global.package=0
my_id=instance_create(global.playerx,global.playery+80,objPlayerDead)
my_id.sprite_index=sprPBackMachinegun
my_id.image_angle=global.playerangle
my_id.image_index=4
objEffectorHouse.brus=15