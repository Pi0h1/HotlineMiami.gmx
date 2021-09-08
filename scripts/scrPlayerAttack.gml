if scrDontMove(){}else{ 
sprite      =   mask_index 
if reload  <=   0   {
/*                                   Melee (speed,delay)            */
if sprite_index=sprPWalkUnarmed     {if instance_exists(objEnemy){Melee (00.5 ,20 )}}
if sprite_index=sprPWalkBag         {Melee (00.5 ,20 )}
if sprite_index=sprPWalkPan         {Melee (00.5 ,20 )}
if sprite_index=sprPWalkCrowbar     {Melee (00.5 ,20 )}
if sprite_index=sprPWalkMachete     {Melee (00.5 ,12 )}
if sprite_index=sprPWalkPot         {Melee (00.5 ,25 )}
if sprite_index=sprPWalkBoilingPot  {Melee (00.5 ,25 ) scrThrowWater()}
if sprite_index=sprPWalkDrill       {Melee (00.5 ,20 )}
if sprite_index=sprPWalkTrophy      {Melee (00.5 ,20 )}
if sprite_index=sprPWalkSword       {Melee (0001 ,15 )}
if sprite_index=sprPWalkKnife       {Melee (0001 ,10 )}
if sprite_index=sprPWalkClub        {Melee (00.7 ,19 )}
if sprite_index=sprPWalkNightStick  {Melee (00.7 ,15 )}
if sprite_index=sprPWalkPipe        {Melee (00.7 ,22 )}
if sprite_index=sprPWalkBat         {Melee (00.7 ,25 )}
if sprite_index=sprPWalkAxe         {Melee (0.35 ,30 )}
if sprite_index=sprPWalkSledge      {Melee (0.35 ,30 )}
if sprite_index=sprPWalkPool        {Melee (00.7 ,20 )}
if sprite_index=sprPWalkPoolBroke   {Melee (00.7 ,20 )}
scrPlayerAttackGuns           ();
scrPlayerAttackThrowWeapons   ();
mask_index  =   sprite          ;
image_angle =   0               ;
}
}
scrCheckUsedGuns()
scrCheckUsedMelee()
scrCheckUsedThrows()


