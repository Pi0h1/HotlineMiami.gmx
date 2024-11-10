finish = 0
if room = rmTrainstationEntrance or room = rmTrainstationDownstairs or room = rmAlley {
    if instance_exists(objPlayer) {
        finish = 1
        finishstring = "[SHIFT] TO AIM"
        if instance_exists(objWeapon) {
            finishstring = "[RIGHT MOUSE] TO TAKE WEAPON"
        }
        if objPlayer.sprite_index = sprPWalkUnarmed or objPlayer.sprite_index = sprPAttackUnarmed nothing = 1
        else {
            if room = rmTrainstationDownstairs {
                finishstring = "[RIGHT MOUSE] TO THROW WEAPON"
            } else {
                finishstring = "[SHIFT] TO AIM"
            }
        }
        if instance_exists(objKnockedOut) or instance_exists(objHoboKnockedOut) {
            finishstring = "[SPACE] FOR GROUND KILLS"
        }
    } if !instance_exists(objPlayer) or global.done = 1 finish = 0
}
