if global.combo > 0 {
    if global.combotime > 120 global.combotime = 120
    if global.combotime > 0 {
        global.combotime -= 1
        if global.maskindex = 13 global.combotime += 0.25
    } else {
        if global.combo > 1 {
            global.myscore += (300 + global.combo * 125) * global.combo
            global.comboscore += (300 + global.combo * 125) * global.combo
            if instance_exists(objPlayer) {
                my_id = instance_create(objPlayer.x, objPlayer.y - 32, objScore)
                my_id.text = string(global.combo) + "x combo#+" + string((100 + global.combo * 125) * global.combo)
                if global.combo >= 4 SteamSetAchievement("ACH_COMBO_BEGINNER")
                if global.combo >= 6 SteamSetAchievement("ACH_COMBO_INTERMEDIATE")
                if global.combo >= 8 SteamSetAchievement("ACH_COMBO_PRO")
                if global.combo >= 10 SteamSetAchievement("ACH_COMBO_MASTER")
                if global.combo >= 12 SteamSetAchievement("ACH_COMBO_KING")
                global.comboflash = 1
                ds_list_add(global.bonuslist, string(global.combo) + "x combo")
                if global.bonustime < 10 + global.combo * 5 global.bonustime = 10 + global.combo * 5
            }
        }
        global.combo = 0
    }
} else global.combotime = 0
