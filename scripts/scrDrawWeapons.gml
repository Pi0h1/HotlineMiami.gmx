if  sprite_index=sprPWalkUnarmed {pose_index=WalkPlayerUnarmed} if sprite_index=sprPAttackUnarmed {pose_index=sprPAttackUnarmed}

if  sprite_index=wpnWalkShotgun or
    sprite_index=wpnWalkM16 or
    sprite_index=sprPWalkDoubleBarrel
    {
    pose_index=WalkPlayerAim
    }
    
if  sprite_index=sprPWalkMP5 or
    sprite_index=sprPWalkUzi
    {
    pose_index=WalkPlayerGangster
    }
    
if  sprite_index=sprPWalkBat or
    sprite_index=sprPWalkPipe or
    sprite_index=sprPWalkClub or
    sprite_index=sprPWalkSword or
    sprite_index=sprPWalkPool
    {
    pose_index=WalkPlayerMelee
    }

if  sprite_index=sprPWalkKnife or
    sprite_index=sprPWalkMachete
    {
    pose_index=WalkPlayerMeleeShort
    }
    
    
if  sprite_index=wpnAttackM16{
    pose_index=AttackPlayerAim
    }

if  sprite_index=wpnAttackShotgun{
    pose_index=AttackPlayerShotgun
    }
    
if  sprite_index=sprPAttackBat or
    sprite_index=sprPAttackPipe or
    sprite_index=sprPAttackClub or
    sprite_index=sprPAttackSword or
    sprite_index=sprPAttackPool
    {
    pose_index=AttackPlayerMelee
    }

if  sprite_index=sprPAttackMachete or
    sprite_index=sprPAttackNightStick or
    sprite_index=sprPAttackPan or
    sprite_index=sprPAttackPot
    {
    pose_index=AttackPlayerMeleeShort
    }
    
if  sprite_index=sprPAttackKnife
    {
    pose_index=AttackPlayerKnife
    }
