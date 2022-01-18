showammo = 0
if instance_exists(objPlayer) {
    if objPlayer.sprite_index = wpnWalkM16 or objPlayer.sprite_index = wpnAttackM16 {
        showammo = 1
        maxammo = 24
    }
    if objPlayer.sprite_index = sprPWalkUzi or objPlayer.sprite_index = sprPAttackUzi {
        showammo = 1
        maxammo = 30
    }
    if objPlayer.sprite_index = sprPWalkScorpion or objPlayer.sprite_index = sprPAttackScorpion {
        showammo = 1
        maxammo = 20
    }
    if objPlayer.sprite_index = sprPWalkMagnum or objPlayer.sprite_index = sprPAttackMagnum {
        showammo = 1
        maxammo = 6
    }
    if objPlayer.sprite_index = sprPWalkSilencedUzi or objPlayer.sprite_index = sprPAttackSilencedUzi {
        showammo = 1
        maxammo = 30
    }
    if objPlayer.sprite_index = wpnWalkShotgun or objPlayer.sprite_index = wpnAttackShotgun {
        showammo = 1
        maxammo = 6
    }
    if objPlayer.sprite_index = sprPWalkDoubleBarrel or objPlayer.sprite_index = sprPAttackDoubleBarrel1 or objPlayer.sprite_index = sprPAttackDoubleBarrel2 {
        showammo = 1
        maxammo = 2
    }
    if objPlayer.sprite_index = sprPWalkSilencer or objPlayer.sprite_index = sprPAttackSilencer {
        showammo = 1
        maxammo = 13
    }
    if objPlayer.sprite_index = sprPWalkMP5 or objPlayer.sprite_index = sprPAttackMP5 {
        showammo = 1
        maxammo = 32
    }
    if showammo = 1 {
        ammostring = string(objPlayer.ammo) + "/" + string(maxammo) + "rnds"
        if ammoy < 16 ammoy += 4
        else ammoy = 20
    } else {
        ammostring = "NO GUN!"
        if instance_number(objEnemy) + instance_number(objKnockedOut) > 0 {
            if ammoy > -32 ammoy -= 1
        }
    }

    if instance_exists(objPlayerBiker) or instance_exists(objPlayerBikerHouse) {
        if objPlayer.ammo > 0 {
            showammo = 1 ammostring = string(objPlayer.ammo) + " KNIVES"
            if ammoy < 16 ammoy += 4
            else ammoy = 20
        } else {
            ammostring = "NO KNIVES!"
            if instance_number(objEnemy) + instance_number(objKnockedOut) > 0 {
                if ammoy > -32 ammoy -= 1
            }
        }
    }

    if global.done {
        if showfinished > 0 showfinished -= 1
        else showfinished = 240
        if showfinished < 121 scorestring = "YOU GOT " + string(global.drawscore) + "pts"
        else scorestring = "CHAPTER DONE!"
        ammostring = "GO TO CAR!"
        if instance_exists(objPlayerBiker) or instance_exists(objPlayerBikerHouse) ammostring = "GO TO BIKE"
        if ammoy < 20 ammoy += 1
        else ammoy = 20
    }
} else {
    if instance_exists(objDeadBody) {
    if objDeadBody.isPlayer = true {
        scorestring = "YOU'RE DEAD!"
        ammostring = "PRESS " + global.restartkey + " TO RESTART"
        if ammoy < 20 ammoy += 1
        else ammoy = 20
        }
    }
}
