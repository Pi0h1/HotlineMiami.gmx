if sprite_index=sprPWalkThrow {
my_id=instance_create(x+lengthdir_x(14,dir+left*-35),y+lengthdir_y(12,dir+left*-35),objThrowingWeapon)
PlaySFX(sndThrow)
my_id.speed=12
my_id.direction=dir-2+random(4)
my_id.image_index=throwindex
global.usedthrow[throwindex]=1
reload=20
image_speed=0.5
image_index=1
sprite_index=sprPAttackThrow
left=1
}
