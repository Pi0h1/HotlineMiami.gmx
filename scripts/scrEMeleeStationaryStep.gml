angle=direction

if sprite_index=sprEWalkUnarmed {                                                       // If the enemy is unarmed...
scrGoGetWeapon()                                                                            // have him search for a weapon.
}                                                                                   
else{                                                                                   // The enemy is armed? well then...
if alert=0 {                                                                            // If the alert state is equal to 0...
    if instance_exists(objPlayer) scrMeleeSearch(objPlayer.x,objPlayer.y,4)                 // If the player exists, go search for him.
    
    if (alertwait > -1) {
        alertwait--; 
        if (alertwait == 0) 
            {
            path_end(); 
            alert = 1;
            }
        }
    
    if scrIsSearching(sprite_index)  {speed=0 image_speed=0.15 exit}                        // If the enemy is searching, mstop moving and set the searching animation speed.
    if scrEnemyIsAttacking(sprite_index) {image_speed=1}                                    // If the enemy is attacking, set the animation speed.
    if point_distance(x,y,startx,starty)>4 scrReturn(path)                                  // If the enemy is 4 pixels away from his spawn poisition, go back to it.
}
if !instance_exists(objPlayer) {alert=0 scrMoveSolidOff() exit}
if alert<2 and alert>0{                                                                 // If alert is in a stage between 0 and 2...
    scrAttack(objPlayer.x,objPlayer.y,10,4)                                                 // Attack the player.
    if reload>0 reload-=1 else {                                                            // If the enemy is allowed to attack (he's not waiting for the cool down to go)... 
        if point_distance(x,y,objPlayer.x,objPlayer.y)<18 {                                     // And the player is at a distance of less than 18 pixels... Attack him!
            PlaySFX(choose(sndSwing1,sndSwing2))                                                    // Play sound effect.
            if scrIsSearching(sprite_index) sprite_index=scrStopSearch(sprite_index)                // If the enemy is currently searching, stop searching, because the player is right in front of you.
            sprite_index=scrGetAttack(sprite_index)                                                 // Set current sprite to the attack sprite.
            image_index=1                                                                           // Set beginning frame of animation.
            image_speed=1                                                                           // Set animation speed.
            reload=30                                                                               // Set weapon delay.
        }
    }
}
if alert=2 {scrChase(path,objPlayer.x,objPlayer.y) alert=3}                             // If alert is equal to 2, start chasing the player and set the alert state to 3.
if alert=3 {scrMeleeChaseSearch(objPlayer.x,objPlayer.y,4)}                             // If alert is equal to 3, start searching for the player.
}
scrMoveSolidOff()                                                                       // ???

if speed>0 image_speed=speed*0.1                                                        // Set speed of the walking sprite.
if path_index>=0 image_speed=path_speed*0.1                                             // Set image_speed to the speed walking the current path.
