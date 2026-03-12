exit
if sprite_index=sprWaiterWalkWine or sprite_index=sprWaiterWalkFood {
speed=choose(0,1)
direction=random(360)
image_speed=speed*0.15
alarm[0]=100+random(300)
}
