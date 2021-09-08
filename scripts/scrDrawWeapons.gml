if  sprite_index=sprPWalkUnarmed {pose_index=Pose_PlayerWalkUnarmed} if sprite_index=sprPAttackUnarmed {pose_index=sprPAttackUnarmed}

if  sprite_index=sprPWalkShotgun or
    sprite_index=wpnWalkM16 or
    sprite_index=sprPWalkDoubleBarrel
    {
    pose_index=Pose_PlayerWalkAim
    }
    
if  sprite_index=sprPWalkMP5 or
    sprite_index=sprPWalkUzi
    {
    pose_index=Pose_PlayerWalkAimGangster
    }
    
if  sprite_index=sprPWalkBat or
    sprite_index=sprPWalkPipe or
    sprite_index=sprPWalkClub or
    sprite_index=sprPWalkSword or
    sprite_index=sprPWalkPool
    {
    pose_index=Pose_PlayerWalkMelee
    }

if  sprite_index=sprPWalkKnife or
    sprite_index=sprPWalkMachete
    {
    pose_index=Pose_PlayerWalkMeleeShort
    }
