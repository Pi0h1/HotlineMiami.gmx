/// createDeadBody(isPlayer,travelDistance,sprite_index,direction)
scrIdleGetEnemy();

var travelDistance = argument1;
var deathSprite = argument2;
var deathFrame = floor(random(sprite_get_number(deathSprite)));

deadBody = instance_create(x, y, objDeadBody);

if instance_exists(deadBody) {
    deadBody.image_index = deathFrame
    deadBody.isPlayer = argument0
    deadBody.sprite_index = deathSprite
    deadBody.direction = argument3
    deadBody.image_angle = deadBody.direction
    if travelDistance > 0 {deadBody.speed = travelDistance + random(1)}
    deadBody.image_angle = deadBody.direction
    
    // Biker
    if argument0=true 
        {
        if object_index=objPlayerBiker or object_index=objMCChopKill or object_index=objMCKnifeKill or object_index=objMCStompKill or object_index=objPlayerBikerHouse {
        if deadBody.sprite_index=sprPBackBlunt  deadBody.sprite_index=sprBikerBackBlunt
        if deadBody.sprite_index=sprPFrontBlunt deadBody.sprite_index=sprBikerFrontBlunt
        if deadBody.sprite_index=sprPBackCut    deadBody.sprite_index=sprBikerBackCut
            helmet=instance_create(x+lengthdir_x(24,argument3),y+lengthdir_y(24,argument3),objMCHelmet)
            helmet.direction=argument3-40+random(80)
            helmet.speed=1.5+random(1)
        }
        else {
            mask=instance_create(x+lengthdir_x(24,argument3),y+lengthdir_y(24,argument3),objMaskDrop)
            mask.direction=argument3-40+random(80)
            mask.speed=argument1+random(1)
        }
    }
    
    // Randomization
    if deathSprite = sprEBackBlunt deathSprite = choose(sprEBackBlunt, sprEFrontBlunt)
    if deathSprite = sprEBackShotgun and round(random(24))=5 {deathSprite=sprEBackShotgunVomit deadBody.image_index=0}
    if deathSprite = sprEBackShotgun and round(random(24))=2 {deathSprite=sprEBackHeadJerk deadBody.image_index=0}
    if deadBody.sprite_index=sprEBackMachinegun and round(random(24))=2 {deathSprite=sprEBackHeadshot deadBody.image_index=0 deadBody.speed=0 deadBody.image_angle-=180
    createBlood(argument3)
    scrGoreShot(x,y,other.direction-180,other.x,other.y,1)
    } else {if deadBody.sprite_index=sprEBackMachinegun or deadBody.sprite_index=sprEFrontMachinegun scrGoreShot(x,y,other.direction-180,other.x,other.y,0)}
    // Wall Death
    if deathSprite = sprEDeadWall{
    deadBody.image_yscale = objPlayer.left
    }
    // Execution - Throat Rip
    if deathSprite = sprEBackThroat {
    deadBody.image_speed = 0.15
    }
    // Execution - Blunt
    if deathSprite = sprEBluntKill{
    deadBody.image_index = 11
    }
    // Execution - Knife
    if deathSprite = sprEMafiaDieKnife {
    deadBody.image_index = 7
    }
    // Execution - Head Stomp
    if deathSprite = sprEHeadStomp {
    deadBody.image_index = 11
    }
    // Execution - Drill
    if deathSprite = sprEMafiaDieDrill {
    deadBody.image_index = 18
    }
    // Execution - Chop Kill
    if deathSprite = sprEChopKill {
    deadBody.image_index = 11
    }
    // Execution - Boiling
    if deathSprite = sprEDeadBoiling {
    deadBody.image_index=0
    deadBody.image_speed=0.15
    }
    // Execution - Pool Cue
    if deathSprite = sprEPoolKill {
    deadBody.image_index = 3
    }
    // Execution - Pool Cue (Broken)
    if deathSprite = sprEBrokenPoolKill{
    deadBody.image_index=15
    }
    // Execution - Axe
    if deathSprite = sprEAxeKill {
    deadBody.image_index = 3
    }
    // Execution - Sword
    if deathSprite = sprESwordKill {
    deadBody.image_index = 3
    }
    // Execution - Scissor
    if deathSprite = sprEBackScissor{
    deadBody.image_speed = 0.2
    }
    // Execution - Brick
    if deathSprite = sprEBrickKill {
    deadBody.image_index = 15
    }
    // Execution - Snap
    if deathSprite = sprEMafiaDieNeckBreak{
    deadBody.image_index = 12
    }
    // Execution - Biker Boss Fight
    if deathSprite = sprBoss2Clubbed {
    deadBody.image_index = 3
    }
    // Execution - Hobo Boss Fight
    if deathSprite = sprHoboGround {
    deadBody.image_index = 3
    }
    // Execution - Bodyguard Boss Fight
    if deathSprite = sprBodyguardBlunt {
    deadBody.image_index = 12
    }
    // Crawling
    if deathSprite = sprEBackBlunt and round(random(11)) = 2 {
      crawl=instance_create(x, y, objEnemyCrawl)
      crawl.direction = -argument3
      crawl.image_angle = direction
      with deadBody instance_destroy()
    }
    // Skull Cracked
    if deathSprite = sprEBackBlunt and round(random(24)) = 2 {
      deathSprite = sprEBackCracked
      deadBody.image_index = 0
    }
    // Electrified
    if deathSprite = sprPBackElectrified {
    deadBody.image_speed=0.25
    }
    // Jones Gore
    if (deathFrame == sprEBackCut){
        if (deathFrame == 3 or deathFrame == 1)                         {scrGoreCut(x, y, argument3 - 180, 1)}
        else scrGoreCut(x, y, argument3 - 180, 0)
    }
    if (deathSprite == sprEBackBlunt) {
        if (deathFrame == 6 or deathFrame = 12 or deathFrame = 14)      {scrGoreBash(x, y, argument3 - 180, 1, 1)}
        else scrGoreBash(x, y, argument3 - 180, 0, 0)
    }
    if (deathSprite == sprEFrontBlunt) {
        if (deathFrame == 6 or deathFrame == 7 or deathFrame == 8)      {scrGoreBash(x, y, argument3 - 180, 1, 1)}
        else scrGoreBash(x, y, argument3 - 180, 0, 0)
    }
    if (deathSprite == sprPoliceBackBlunt) {
        if (deathFrame == 6 or deathFrame == 12 or deathFrame == 14)   {scrGoreBash(x, y, argument3 - 180, 1, 1)}
        else scrGoreBash(x, y, argument3 - 180, 0, 0)
    }
    if (deathSprite == sprPoliceFrontBlunt) {
        if (deathFrame == 6 or deathFrame == 7 or deathFrame == 8)      {scrGoreBash(x, y, argument3 - 180, 1, 1)}
        else scrGoreBash(x, y, argument3 - 180, 0, 0)
    }
    
    if (deathSprite == sprEBackShotgun) {
    if (deathFrame == 0) scrGoreShotgun(x,y,other.direction-180,0,0,0,0,0,1)
    if (deathFrame == 1) scrGoreShotgun(x,y,other.direction-180,0,0,0,0,0,1)
    if (deathFrame == 2) scrGoreShotgun(x,y,other.direction-180,1,x+lengthdir_x(18,deadBody.direction+20*deadBody.image_yscale),y+lengthdir_y(18,deadBody.direction+20*deadBody.image_yscale),deadBody.direction-90*deadBody.image_yscale,0,0)
    if (deathFrame == 3) scrGoreShotgun(x,y,other.direction-180,1,x+lengthdir_x(23,deadBody.direction),y+lengthdir_y(23,deadBody.direction),deadBody.direction,1,0)
    }
    if (deathSprite == sprEFrontShotgun) {
    if (deathFrame == 0) scrGoreShotgun(x,y,other.direction-180,0,0,0,0,0,0)
    if (deathFrame == 1) scrGoreShotgun(x,y,other.direction-180,0,0,0,0,0,1)
    if (deathFrame == 2) scrGoreShotgun(x,y,other.direction-180,0,0,0,0,0,0)
    if (deathFrame == 3) scrGoreShotgun(x,y,other.direction-180,1,x+lengthdir_x(23,deadBody.direction),y+lengthdir_y(23,deadBody.direction),deadBody.direction,1,0)
    }

    // Slashed
    if argument2 = sprEBackSlashed {
        if deathFrame = 1 scrGoreCut(x, y, argument3 - 180, 1) else scrGoreCut(x, y, argument3 - 180, 0)
        if deathFrame = 0 {
            part = instance_create(deadBody.x + lengthdir_x(22, argument3), deadBody.y + lengthdir_y(18, argument3), objBodyPart)
            part.image_angle = argument3 - 10 + random(20)
            part.direction = part.image_angle
            part.speed = 3 + random(1)
        }
        if deathFrame = 1 {
            part = instance_create(deadBody.x + lengthdir_x(12, argument3), deadBody.y + lengthdir_y(8, argument3), objBodyPart)
            part.image_angle = argument3 - 10 + random(20)
            part.direction = part.image_angle
            part.speed = 3 + random(1)
            part.image_index = 1
            part.image_yscale = deadBody.image_yscale
        }
        if deathFrame = 2 {
            part = instance_create(deadBody.x + lengthdir_x(16, argument3), deadBody.y + lengthdir_y(12, argument3), objBodyPart)
            part.image_angle = argument3 - 10 + random(20)
            part.direction = part.image_angle
            part.speed = 3 + random(1)
            part.image_index = 2
            part.image_yscale = deadBody.image_yscale
        }
    }

    //global.dir=dir
    //with my_id move_contact_solid(global.dir-45,12)

    if scrIsPolice(object_index) {
        //deadBody.sprite_index=sprPoliceBackBlunt
        hat = instance_create(x, y, objPoliceHat)
        hat.direction = random(360) // pdir - 10 + random(20)
        hat.speed = 1 + random(2)
    }
    
    if deathSprite = sprPInspectorDead {
        hat = instance_create(x,y,objPoliceHat)
        hat.direction=direction
        hat.sprite_index=sprInspectorHat
        hat.speed= 1 + random(2)
    }

    if argument2 = sprEmployeeDead {
        if deadBody.image_index < 3 {
            piece = instance_create(deadBody.x, deadBody.y, objBodyPart)
            piece.speed = deadBody.speed + 1
            piece.direction = deadBody.direction - 10 + random(20)
            piece.sprite_index = sprEmployeeDeadPiece
            piece.image_yscale = deadBody.image_yscale
            piece.image_index = deadBody.image_index
        }
    }
}
enemyDropWeapon();
