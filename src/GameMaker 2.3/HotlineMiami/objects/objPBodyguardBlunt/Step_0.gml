if hurtindex=11 {
if image_index=0 {
my_id=instance_create(x,y,objPlayerMouse)
if sprite_index=sprPTrophyKill my_id.sprite_index=sprPWalkTrophy
if sprite_index=sprPBatKill my_id.sprite_index=sprPWalkBat
if sprite_index=sprPPipeKill my_id.sprite_index=sprPWalkPipe
if sprite_index=sprPClubKill my_id.sprite_index=sprPWalkClub
if sprite_index=sprPBagKill my_id.sprite_index=sprPWalkBag
if sprite_index=sprPNightStickKill my_id.sprite_index=sprPWalkNightStick
global.angle=image_angle-180
my_id.reload=10
with my_id move_outside_solid(global.angle,16)
my_id.maskon=global.maskon
my_id.maskindex=global.maskindex
my_id=instance_create(x+lengthdir_x(11,image_angle),y+lengthdir_y(11,image_angle),objBloodPool)
my_id=instance_create(x,y,objDeadBody)
if bottom=sprEBluntKill my_id.sprite_index=sprEBluntKill else my_id.sprite_index=sprPoliceBluntKill
if bottom=sprBodyguardBlunt my_id.sprite_index=sprBodyguardBlunt
my_id.image_index=12
my_id.image_angle=image_angle

instance_destroy()
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string((600)+400*(global.factor))+"pts"
global.myscore+=(600)+400*(global.factor)
global.killscore+=600
global.boldscore+=400*global.factor
global.combotime=240
global.combo+=1
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
ds_list_add(global.bonuslist,"Execution")
if global.combotime<12 global.combotime=12
}
}
