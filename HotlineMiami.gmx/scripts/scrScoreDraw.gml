d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0)
if global.combo > 0 {
    if global.maskindex = 13 minus = 0.6
    else minus = 1
    if global.combotime > 0 and global.gunkill < 2 global.combotime -= minus
    else {
        if combo > 1 {
            global.myscore += (100 + global.combo * 125) * global.combo
            global.comboscore += (100 + global.combo * 125) * global.combo
        }
        global.combo = 0
    }
} else global.combotime = 0
if global.drawscore < global.myscore update = 1
else update = 0
if global.drawscore < global.myscore - 1000 global.drawscore += 200
else {
    if global.drawscore < global.myscore - 200 global.drawscore += 50
    else {
        if global.drawscore < global.myscore - 25 global.drawscore += 5
        else {
            if global.drawscore < global.myscore global.drawscore += 1
        }
    }
}
if instance_number(objEnemy) + instance_number(objEnemyBash) = 0 update = 1
if !instance_exists(objPlayer) update = 1
scorestring = string(global.drawscore) + "pts"
color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3))
color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3))
dir += 1 + update * 7
global.dir += 1

draw_set_halign(fa_center)
draw_set_valign(fa_center)
showammo = 0
if instance_exists(objPlayer) {
    if objPlayer.sprite_index = sprPWalkM16 or objPlayer.sprite_index = sprPAttackM16 {
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
    if objPlayer.sprite_index = sprPWalkShotgun or objPlayer.sprite_index = sprPAttackShotgun {
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
    if instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEnemyBash) = 0 {
        if showfinished > 0 showfinished -= 1
        else showfinished = 240
        if showfinished < 121 scorestring = "YOU GOT " + string(global.drawscore) + "pts"
        else scorestring = "LEVEL COMPLETE!"
        ammostring = "ENTER TO PROCEED!"
        if ammoy < 20 ammoy += 1
        else ammoy = 20
    }
} else {
    scorestring = "YOU'RE DEAD!"
    ammostring = "R TO RESTART!"
    if ammoy < 20 ammoy += 1
    else ammoy = 20
}
if update = 0 draw_set_font(fntScore)
else draw_set_font(fntScoreUpdate)
draw_set_color(c_black)
draw_rectangle(view_wview[0] - 18 - string_width(scorestring) - 6, 8, view_wview[0], 32, 0)
draw_set_font(fntScore)
draw_rectangle(0, view_hview[0] - ammoy - 11, 18 + string_width(ammostring) + 6, view_hview[0] - ammoy + 11, 0)
if update = 0 draw_set_font(fntScore)
else draw_set_font(fntScoreUpdate)
draw_set_color(color1)
draw_text_transformed(view_wview[0] - 18 - string_width(scorestring) * 0.5 + lengthdir_x(1, dir), 20 + lengthdir_y(1, dir), scorestring, 1, 1, lengthdir_x(2, dir * 1.34))
draw_set_font(fntScore)
if ammoy > -32 draw_text_transformed(18 + string_width(ammostring) * 0.5 + lengthdir_x(1, dir), view_hview[0] - ammoy + lengthdir_y(1, dir), ammostring, 1, 1, lengthdir_x(2, dir * 1.34))
draw_set_color(color2)
if ammoy > -32 draw_text_transformed(18 + string_width(ammostring) * 0.5 + lengthdir_x(1, dir - 180), view_hview[0] - ammoy + lengthdir_y(1, dir - 180), ammostring, 1, 1, lengthdir_x(2, dir * 1.34 - 10))
if update = 0 draw_set_font(fntScore)
else {
    draw_set_color(c_white) draw_set_font(fntScoreUpdate)
}
draw_text_transformed(view_wview[0] - 18 - string_width(scorestring) * 0.5 + lengthdir_x(1, dir - 180), 20 + lengthdir_y(1, dir - 180), scorestring, 1, 1, lengthdir_x(2, dir * 1.34 - 10))
