if (global.godmode == 1) exit

var dieFromBlunt        = false;
var dieFromCut          = false;
var dieFromElectricity  = false;

global.shake = 10;

with objPlayer {
instance_destroy();
pdir=point_direction(global.my_id.x,global.my_id.y,x,y)

if global.my_id.sprite_index!=sprPInspectorAttack {
createBlood(pdir)
}

switch (global.my_id.sprite_index){
    case sprEAttackKnife:       dieFromCut = true; break;
    case sprPantherHitback:     dieFromCut = true; break;
    case sprBodyguardAttack:    dieFromCut = true; break;
    case sprBoss2AttackCleaver: dieFromCut = true; break;
    case sprPInspectorAttack:   dieFromElectricity = true; break;
    default: dieFromBlunt = true;
}

if (dieFromCut) {
    PlaySFX(sndHit)
    PlaySFX("Light Cut");
    createDeadBody(true,1.5,sprPBackCut,pdir)
}

if (dieFromElectricity) {
    createDeadBody(true,1.5,sprPBackElectrified,pdir);
}

if (dieFromBlunt) {
    PlaySFX(sndHit)
    PlaySFX("Blunt")
    createDeadBody(true,1.5,sprPBackBlunt,pdir)
}

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
