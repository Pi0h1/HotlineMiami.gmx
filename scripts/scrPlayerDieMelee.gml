if global.godmode=1 exit
global.shake=10
with objPlayer {
instance_destroy();

pdir=point_direction(global.my_id.x,global.my_id.y,x,y)
if global.my_id.sprite_index=sprPInspectorAttack nothing=1 else {
createBlood(pdir)
}

if global.my_id.sprite_index=sprEAttackClub 
or global.my_id.sprite_index=sprPAttackClub 
or global.my_id.sprite_index=sprPWalkClub
or global.my_id.sprite_index=sprPoliceAttackNightStick 
or global.my_id.sprite_index=sprHoboAttack 
or global.my_id.sprite_index=sprEAttackBat
or global.my_id.sprite_index=sprEAttackPipe
{PlaySFX(sndHit) createDeadBody(true,1.5,sprPBackBlunt,pdir)} 

if global.my_id.sprite_index=sprEAttackKnife 
or global.my_id.sprite_index=sprPantherHitback 
or global.my_id.sprite_index=sprBodyguardAttack 
or global.my_id.sprite_index=sprBoss2AttackCleaver 
or global.my_id.sprite_index=sprCleaver
{PlaySFX(sndHit) createDeadBody(true,1.5,sprPBackCut,pdir) PlaySFX("Light Cut")}

if global.my_id.sprite_index=sprEFatAttack 
or global.my_id.sprite_index=sprBoss1Attack
{PlaySFX(sndHit) createDeadBody(true,1.5,sprPBackBlunt,pdir) PlaySFX("Blunt")}

if global.my_id.sprite_index=sprPInspectorAttack
{createDeadBody(true,1.5,sprPBackElectrified,pdir)}

if global.my_id.sprite_index=sprEAttackClub
or global.my_id.sprite_index=sprHoboAttack
or global.my_id.sprite_index=sprEAttackBat
or global.my_id.sprite_index=sprEAttackPipe
or global.my_id.sprite_index=sprEFatAttack
or global.my_id.sprite_index=sprBoss1Attack
{PlaySFX(sndHit) createDeadBody(true,1.5,sprPBackBlunt,pdir)}

if object_index=objPlayerShieldMouse {
my_id=instance_create(x+lengthdir_x(7,dir-45),y+lengthdir_y(7,dir-45),objKnockedOut)
my_id.direction=pdir-20
my_id.speed=1.5+random(1)
my_id.image_angle=my_id.direction
my_id.angle=my_id.image_angle
}

if object_get_parent(object_index)=objExecution {
my_id=instance_create(x,y,objKnockedOut)
my_id.angle=image_angle
my_id.type=objEnemy
}

}
