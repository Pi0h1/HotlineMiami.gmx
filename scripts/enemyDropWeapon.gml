if sprite_index=sprPWalkUnarmed 
or sprite_index=sprPAttackUnarmed
or object_index=objPlayerBiker
or sprite_index=sprPWalkBag
or sprite_index=sprPAttackBag
or sprite_index=sprPBagKill 
or sprite_index=sprPAttackBash
or sprite_index=sprEWalkUnarmed
or sprite_index=sprPoliceWalkUnarmed
or sprite_index=sprEGiveUp
or object_index=objDogPatrol
or object_index=objKnockedOut
or object_index=objEnemyFat
or object_index=objESubwayStatic
or object_get_parent(object_index)=npcJacket
or (instance_exists(objPAttackThroat) and global.maskindex = 11)
or object_get_parent(object_index)=objExecution {
    noweapon=1 
}
else { 
    noweapon=0;
}

if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.direction=other.direction-70+random(40)
my_id.speed=2+random(2)
my_id.ammo=ammo
}
