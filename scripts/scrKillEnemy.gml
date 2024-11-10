with objEnemy {
    if place_meeting(x, y, objPlayer) or place_meeting(x + global.spacex, y + global.spacey, objPlayer) {
        mask_index = sprWeaponMask;
        if scrCollisionLineExt(x, y, objPlayer.lastx, objPlayer.lasty, 4, objSolid, objDoorV, objWallSoft) or object_index = objEnemyFat or object_index = objInspector nothing = 1
        else {
            mask_index = sprMask;
            global.shake = 7;
            my_id = instance_create(x, y - 12, objScore)
            if object_get_parent(object_index) = objEnemyIdle {
                if room = rmTrainstationEntrance sprite_index = sprEWalkKnife
                else sprite_index = choose(sprEWalkShotgun, sprEWalkM16)
            }
            if sprite_index = sprEWalkUnarmed or sprite_index = sprPoliceWalkUnarmed {
                my_id.text = "+" + string((100) + 100 * global.factor) + "pts";
                global.myscore += (100) + 100 * global.factor;
                global.boldscore = 100 * global.factor;
                global.killscore += 100;
                global.combo += 1;
                global.combotime = 240;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills += 1;
            } else {
                my_id.text = "+" + string((200) + 200 * global.factor) + "pts";
                global.myscore += (200) + 200 * global.factor;
                global.killscore += 200;
                global.boldscore += 200 * global.factor;
                global.combo += 1;
                global.combotime = 240;
                global.killx[global.kills] = x;
                global.killy[global.kills] = y;
                global.kills += 1;
                if global.bonustime < 12 + global.factor * 4 global.bonustime = 12 + global.factor * 4;
                if global.factor = 2 ds_list_add(global.bonuslist, "Exposure");
                if global.factor = 3 ds_list_add(global.bonuslist, "Double Exposure");
                if global.factor = 4 ds_list_add(global.bonuslist, "Triple Exposure");
                if global.factor > 4 ds_list_add(global.bonuslist, "Severe Exposure");
            }
            edir = point_direction(objPlayer.lastx, objPlayer.lasty, x, y);
            createBlood(edir);

            if objPlayer.sprite_index = sprPAttackClub or
            objPlayer.sprite_index = wpnAttackBat or
            objPlayer.sprite_index = sprPAttackCrowbar or
            objPlayer.sprite_index = sprPAttackPan or
            objPlayer.sprite_index = sprPAttackPot or
            objPlayer.sprite_index = sprPAttackSledge or
            objPlayer.sprite_index = sprPAttackPipe or
            objPlayer.sprite_index = sprPAttackPool or
            objPlayer.sprite_index = sprPAttackNightStick or
            objPlayer.sprite_index = sprPAttackUnarmed {
                if objPlayer.sprite_index = sprPAttackPool {
                    objPlayer.sprite_index = sprPWalkPoolBroke
                }
                PlaySFX("Blunt")
                if object_index = objDogPatrol {
                    createDeadBody(false, 1.5, sprDogDeadBlunt, edir)
                } else {
                    if scrIsPolice(object_index) {
                        createDeadBody(false, 1.5, sprPoliceBackBlunt, edir)
                    } else {
                        /*Enemy_Mafia*/
                        createDeadBody(false, 1.5, sprEBackBlunt, edir)
                    }
                }
            }

            if objPlayer.sprite_index = sprPAttackKnife {
                PlaySFX("Light Cut")
                if object_index = objDogPatrol {
                    createDeadBody(false, 2, sprDogDeadCut, edir)
                } else {
                    createDeadBody(false, 2, sprEBackCut, edir)
                }
            }

            if objPlayer.sprite_index = sprPAttackPoolBroke {
                if object_index = objDogPatrol {
                    createDeadBody(false, 1.5, sprDogDeadBlunt, edir)
                } else {
                    objPlayer.sprite_index = sprPWalkUnarmed objPlayer.image_speed = 0
                    createDeadBody(false, 2, sprEDeadBackPool, edir)
                }
                PlaySFX("Light Cut")
            }

            if objPlayer.sprite_index = sprPAttackSword or
            objPlayer.sprite_index = sprPAttackAxe or
            objPlayer.sprite_index = sprPAttackMachete {
                if object_index = objDogPatrol {
                    createDeadBody(false, 1.5, sprDogDeadCut, edir)
                } else {
                    createDeadBody(false, 0, sprEBackSlashed, edir)
                }
                PlaySFX("Cut")
            }
            instance_destroy()
        }
    }
}
