if global.drawscore < global.myscore update = 1
else update = 0
if global.drawscore < global.myscore - 1000 global.drawscore += 500
else {
    if global.drawscore < global.myscore - 200 global.drawscore += 100
    else {
        if global.drawscore < global.myscore - 20 global.drawscore += 20
        else {
            if global.drawscore < global.myscore global.drawscore += 1
        }
    }
}
if instance_number(objEnemy) + instance_number(objEnemyBash) = 0 update = 1
if !instance_exists(objPlayer) update = 1
scorestring = string(global.drawscore) + "pts"
