if global.xbox = 1 
    {
    scrXboxPlayerMouse()
    }

if sprite_index = sprPWalkBoilingPot 
    {
    if round(random(5)) = 2 
    instance_create(x + lengthdir_x(11, dir - 33 * left), y + lengthdir_y(11, dir - 33 * left), objSteam)
    }

if sprite_index = sprPigButcherShoot 
    {
    if !mouse_check_button(mb_left) 
        {
            if image_index > 0.2 {image_index -= 0.2}
            else 
                {
                image_index = 0 sprite_index = sprPigButcherWalkMP5
                }
        }
    }
    
if room = rmTrainstationDownstairs or room = rmPoliceHQFloor3 or instance_exists(objVan) or room = rmPhoneHomUpstairs
    {
    clear = 1
    }

if instance_number(objEnemy)+instance_number(objKnockedOut)+instance_number(objECrawl)+instance_number(objMiscEnemy)+instance_number(objBoss)+instance_number(objEHideM16)+instance_number(objEBullet)=0 
    {
    test = 1
    
    if room=rmHotelEntrance 
        {
        if objFatmanEating.sprite_index=sprFatmanEating or objFatmanEating.sprite_index=sprFatmanEatingGiveUp or objFatmanTelephone.sprite_index=sprFatmanTelephone or objFatmanTelephone.sprite_index=sprFatmanTelephoneGiveUp 
            {
            test = 0
            }
        }
    if room = rmHotelSuite 
        {
        if objFatmanShit.sprite_index = sprFatmanShit or objFatmanShit.sprite_index = sprFatmanShitGiveUp  test = 0
        }
    if test = 1 
        {
        if clear = 0 and global.done = 0 
            {
            clear = 1
            my_id = instance_create(x,y,objCheckpoint)
            my_id.text = "STAGE CLEAR"
            }
        }
    } else clear = 0

if global.xbox = 0 
    {
    aimfar = keyboard_check_direct(vk_shift)
    } else 
        {
        aimfar = checkbutton(0,getid(9))
        }

global.test = 0

with objWeapon 
    {
    if point_distance(x, y, objPlayer.x, objPlayer.y) < 32 
        {
        global.test = 2
        }
    }

if place_meeting(x,y,objKnockedOut) global.test = 1
objEffector.action = global.test
if throwreload > 0 throwreload -= 1

if aimfar 
    {
    if global.maskindex = 7 factor = 2 else factor = 1
    if global.xbox=1 
        {
        viewx = objPlayer.x + rightthumb_x(0) * 0.0045
        viewy = objPlayer.y - rightthumb_y(0) * 0.003
        } else 
            {
            viewx = objPlayer.x + ((display_mouse_get_x() - display_get_width() * 0.5) * (camera_get_view_width(view_camera[0])/display_get_width()))*factor
            viewy = objPlayer.y + ((display_mouse_get_y() - display_get_height() * 0.5) * (camera_get_view_height(view_camera[0])/display_get_height()))*factor
            }
    viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,viewx,viewy)*0.1
    viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,viewx,viewy)
    camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
    vdist=point_distance(x,y,room_width/2,room_height/2)
    vdir=point_direction(room_width/2,room_height/2,x,y)
    camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
    } else 
        {
        viewspeed=point_distance(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(24,dir),y+lengthdir_y(24,dir))*0.1
        viewdir=point_direction(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2,x+lengthdir_x(24,dir),y+lengthdir_y(24,dir))
        
        camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + (lengthdir_x(viewspeed,viewdir)), camera_get_view_y(view_camera[0]) + (lengthdir_y(viewspeed,viewdir)))
        
        vdist=point_distance(x,y,room_width/2,room_height/2)
        vdir=point_direction(room_width/2,room_height/2,x,y)
        camera_set_view_angle(view_camera[0], lengthdir_y(vdist*(1/160),vdir*2))
        }

xview=camera_get_view_x(view_camera[0])
yview=camera_get_view_y(view_camera[0])

if persistent = 1 and objEffector.fade = 1 
    {
    if place_free(x + addx, y) x += addx
    if place_free(x, y + addy) y += addy
    if image_speed = 0 image_index += 0.15
    legindex += 0.4
    exit 
    }
scrPlayerMoveKeyboard()

if (sprite_index=sprPAttackKnife or sprite_index=sprPAttackBat or sprite_index=sprPAttackCrowbar or sprite_index=sprPAttackPan or sprite_index=sprPAttackPot or sprite_index=sprPAttackMachete or sprite_index=sprPAttackSledgeHammer or sprite_index=sprPigButcherAttack or sprite_index=sprPAttackNightStick or sprite_index=sprPAttackPipe or sprite_index=sprPAttackClub or sprite_index=sprPAttackSword or sprite_index=sprPAttackAxe or sprite_index=sprPAttackPool or sprite_index=sprPAttackPoolBroke) or (global.maskindex=2 and sprite_index=sprPAttackPunch) {
lastx=x
lasty=y
global.spacex=lengthdir_x(12,dir)
global.spacey=lengthdir_y(12,dir)
x+=global.spacex
y+=global.spacey
global.my_id=id
with objGlassPanelH {
if place_meeting(x,y,global.my_id) {
SteamIncStat("Windows",1)
if global.my_id.lasty<y+2 {
add=-1
} else {
add=1
}
i=0
repeat (24) {
my_id=instance_create(x+i*1.5,y,objShard)
my_id.speed=random(5)
my_id.direction=add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelHBroken)
global.shake=4
instance_destroy()
if !audio_is_playing(sndGlass1) and !audio_is_playing(sndGlass2) {
audio_play_sound(choose(sndGlass1,sndGlass2),0,false)
}
}
}

with objGlassPanelV {
if place_meeting(x,y,global.my_id) {
SteamIncStat("Windows",1)
if global.my_id.lastx<x+2 {
add=-1
} else {
add=1
}
i=0
repeat (24) {
my_id=instance_create(x,y+i*1.5,objShard)
my_id.speed=random(5)
my_id.direction=90+add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelVBroken)
global.shake=4
instance_destroy()
if !audio_is_playing(sndGlass1) and !audio_is_playing(sndGlass2) {
audio_play_sound(choose(sndGlass1,sndGlass2),0,false)
}
}
}

x+=lengthdir_x(12,dir)
y+=lengthdir_y(12,dir)


with objEnemy {
if place_meeting(x,y,objPlayer) or place_meeting(x+global.spacex,y+global.spacey,objPlayer) {
mask_index=sprWeaponMask 
if scrCollisionLineExt(x,y,objPlayer.lastx,objPlayer.lasty,4,objSolid,objDoorV,objWallSoftH) or object_index=objEnemyFat or object_index=objInspector nothing=1 else {//{mask_index=sprMask objPlayer.x=objPlayer.lastx objPlayer.y=objPlayer.lasty exit}
mask_index=sprMask
global.shake=7
my_id=instance_create(x,y-12,objScore)
if object_get_parent(object_index)=objEnemyIdle {
if room=rmTrainstationEntrance sprite_index=sprEWalkKnife else sprite_index=choose(sprEWalkShotgun,sprEWalkM16)
}
if sprite_index=sprEWalkUnarmed or sprite_index=sprPoliceWalkUnarmed {
my_id.text="+"+string((100)+100*global.factor)+"pts" 
global.myscore+=(100)+100*global.factor
global.boldscore=100*global.factor
global.killscore+=100
global.combo+=1
global.combotime=240
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
} else {
my_id.text="+"+string((200)+200*global.factor)+"pts"
global.myscore+=(200)+200*global.factor
global.killscore+=200
global.boldscore+=200*global.factor
global.combo+=1
global.combotime=240
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
if global.bonustime<12+global.factor*4 global.bonustime=12+global.factor*4
if global.factor=2 ds_list_add(global.bonuslist,"Exposure")
if global.factor=3 ds_list_add(global.bonuslist,"Double Exposure")
if global.factor=4 ds_list_add(global.bonuslist,"Triple Exposure")
if global.factor>4 ds_list_add(global.bonuslist,"Severe Exposure")
}
edir=point_direction(objPlayer.lastx,objPlayer.lasty,x,y)
repeat (8) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.sprite_index=sprBloodSplatSmall
my_id.direction=my_id.image_angle
my_id.speed=2+random(4)
}
repeat (2+random(3)) {
my_id=instance_create(x-3+random(6)+lengthdir_x(8,edir),y-3+random(6)+lengthdir_y(8,edir),objBloodDrop)
my_id.image_xscale=1-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=point_direction(x+lengthdir_x(8,edir),y+lengthdir_y(8,edir),my_id.x,my_id.y)
my_id.direction=my_id.image_angle
my_id.speed=1+random(5)
}
repeat (4) {
my_id=instance_create(x-3+random(6)+lengthdir_x(16,edir),y-3+random(6)+lengthdir_y(16,edir),objBloodSmoke)
my_id.image_xscale=1.2-random(0.2)
my_id.image_yscale=my_id.image_xscale
my_id.image_angle=edir-20+random(40)
my_id.direction=my_id.image_angle
my_id.speed=2+random(1)
my_id.friction=0.15
}
my_id=instance_create(x,y,objDeadBody)
if object_index=objDogPatrol {
SteamIncStat("Dogs",1)
if objPlayer.sprite_index=sprPAttackClub or objPlayer.sprite_index=sprPAttackBat or objPlayer.sprite_index=sprPAttackCrowbar or objPlayer.sprite_index=sprPAttackPan or objPlayer.sprite_index=sprPAttackPot or objPlayer.sprite_index=sprPAttackSledgeHammer or objPlayer.sprite_index=sprPigButcherAttack or objPlayer.sprite_index=sprPAttackPipe or objPlayer.sprite_index=sprPAttackPool or objPlayer.sprite_index=sprPAttackPunch {audio_play_sound(sndHit,0,false) audio_play_sound(sndPunch,0,false) my_id.sprite_index=sprDogDeadBlunt my_id.image_index=3+floor(random(3))} else {my_id.sprite_index=sprDogDeadCut audio_play_sound(choose(sndCut1,sndCut2),0,false) my_id.image_index=4+floor(random(3))}
} else {
if objPlayer.sprite_index=sprPAttackClub or objPlayer.sprite_index=sprPAttackBat or objPlayer.sprite_index=sprPAttackCrowbar or objPlayer.sprite_index=sprPigButcherAttack or objPlayer.sprite_index=sprPAttackPan or objPlayer.sprite_index=sprPAttackPot or objPlayer.sprite_index=sprPAttackSledgeHammer or objPlayer.sprite_index=sprPAttackPipe or objPlayer.sprite_index=sprPAttackPool or objPlayer.sprite_index=sprPAttackPunch {audio_play_sound(sndHit,0,false) audio_play_sound(sndPunch,0,false) my_id.sprite_index=choose(sprEBackBlunt,sprEBackBlunt,sprEFrontBlunt) my_id.image_index=4+floor(random(11)) if objPlayer.sprite_index=sprPAttackPool objPlayer.sprite_index=sprPWalkPoolBroke} 
if scrIsPolice(object_index) and (objPlayer.sprite_index=sprPAttackPunch or objPlayer.sprite_index=sprPAttackNightStick) {
my_id1=instance_create(x,y,objPoliceHat)
my_id1.direction=edir-10+random(20)
my_id1.speed=1+random(2)
audio_play_sound(sndHit,0,false) my_id.sprite_index=choose(sprPoliceBackBlunt,sprPoliceBackBlunt,sprPoliceFrontBlunt) my_id.image_index=floor(random(13))
if my_id.sprite_index=sprPoliceBackBlunt {
if my_id.image_index=2 or my_id.image_index=6 scrGoreBash(x,y,edir-180,1,1) else scrGoreBash(x,y,edir-180,0,0)
}
if my_id.sprite_index=sprPoliceFrontBlunt {
if my_id.image_index=2 or my_id.image_index=3 or my_id.image_index=4 scrGoreBash(x,y,edir-180,1,1) else scrGoreBash(x,y,edir-180,0,0)
}

}
if my_id.sprite_index=sprEBackBlunt {
if my_id.image_index=6 or my_id.image_index=12  or my_id.image_index=14 scrGoreBash(x,y,edir-180,1,1) else scrGoreBash(x,y,edir-180,0,0)
}
if my_id.sprite_index=sprEFrontBlunt {
if my_id.image_index=6 or my_id.image_index=7  or my_id.image_index=8 scrGoreBash(x,y,edir-180,1,1) else scrGoreBash(x,y,edir-180,0,0)
}
if objPlayer.sprite_index=sprPAttackKnife {my_id.sprite_index=sprEBackCut audio_play_sound(choose(sndCut1,sndCut2),0,false) my_id.image_index=2+floor(random(3)) if my_id.image_index=3 or my_id.image_index=4 scrGoreCut(x,y,edir-180,1) else scrGoreCut(x,y,edir-180,0)}
if objPlayer.sprite_index=sprPAttackPoolBroke {my_id.sprite_index=choose(sprEDeadBackPool,sprEDeadBackPool,sprEDeadFrontPool) audio_play_sound(choose(sndCut1,sndCut2),0,false) my_id.image_index=random(2) objPlayer.sprite_index=sprPWalkUnarmed objPlayer.image_speed=0}
if objPlayer.sprite_index=sprPAttackSword or objPlayer.sprite_index=sprPAttackAxe or objPlayer.sprite_index=sprPAttackMachete {
my_id.sprite_index=sprEBackSlashed 
audio_play_sound(choose(sndCut1,sndCut2),0,false) 
audio_play_sound(sndHit,0,false) 

my_id.image_index=floor(random(4))
if my_id.image_index=1 scrGoreCut(x,y,edir-180,1) else scrGoreCut(x,y,edir-180,0)
if my_id.image_index=0 {
part=instance_create(my_id.x+lengthdir_x(22,edir),my_id.y+lengthdir_y(18,edir),objBodyPart)
part.image_angle=edir-10+random(20)
part.direction=part.image_angle
part.speed=3+random(1)
}
if my_id.image_index=1 {
part=instance_create(my_id.x+lengthdir_x(12,edir),my_id.y+lengthdir_y(8,edir),objBodyPart)
part.image_angle=edir-10+random(20)
part.direction=part.image_angle
part.speed=3+random(1)
part.image_index=1
part.image_yscale=my_id.image_yscale
}
if my_id.image_index=2 {
part=instance_create(my_id.x+lengthdir_x(16,edir),my_id.y+lengthdir_y(12,edir),objBodyPart)
part.image_angle=edir-10+random(20)
part.direction=part.image_angle
part.speed=3+random(1)
part.image_index=2
part.image_yscale=my_id.image_yscale
}
}
}
my_id.direction=edir
my_id.speed=1.5+random(1)
my_id.image_angle=my_id.direction
if global.pigkill=1 my_id.sprite_index=sprOscarDead
global.pigkill=0
if my_id.sprite_index=sprEBackBlunt and round(random(11))=2 {
with my_id {
my_id=instance_create(x,y,objECrawl)
my_id.direction=direction
my_id.image_angle=direction
global.test=0
with my_id {if !place_free(x,y) {global.test=1 instance_destroy()}}
if global.test=0 instance_destroy()
}
}

if instance_exists(my_id) {
if my_id.sprite_index=sprEBackBlunt and round(random(24))=2 {
my_id.sprite_index=sprEBackCracked
my_id.image_index=0
}
}

if sprite_index=sprEWalkUnarmed or sprite_index=sprPoliceWalkUnarmed or sprite_index=sprEGiveUp or object_index=objDogPatrol noweapon=1 else noweapon=0
scrIdleGetEnemy()
if noweapon=0 {
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=other.direction-70+random(40)
my_id.speed=2+random(2)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.ammo=ammo
}
instance_destroy()
}
}
}
x=lastx
y=lasty
}



if sprite_index=sprPAttackPunch or sprite_index=sprPAttackBag or sprite_index=sprPAttackDrill {
lastx=x
lasty=y
global.spacex=lengthdir_x(12,dir)
global.spacey=lengthdir_y(12,dir)
x+=global.spacex
y+=global.spacey


global.my_id=id
with objGlassPanelH {
if place_meeting(x,y,global.my_id) {
SteamIncStat("Windows",1)
if global.my_id.lasty<y+2 {
add=-1
} else {
add=1
}
i=0
repeat (24) {
my_id=instance_create(x+i*1.5,y,objShard)
my_id.speed=random(5)
my_id.direction=add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelHBroken)
global.shake=2
instance_destroy()
if !audio_is_playing(sndGlass1) and !audio_is_playing(sndGlass2) {
audio_play_sound(choose(sndGlass1,sndGlass2),0,false)
}
}
}

with objGlassPanelV {
if place_meeting(x,y,global.my_id) {
SteamIncStat("Windows",1)
if global.my_id.lastx<x+2 {
add=-1
} else {
add=1
}
i=0
repeat (24) {
my_id=instance_create(x,y+i*1.5,objShard)
my_id.speed=random(5)
my_id.direction=90+add*90-8+random(16)
i+=1
}
instance_create(x,y,objGlassPanelVBroken)
global.shake=2
instance_destroy()
if !audio_is_playing(sndGlass1) and !audio_is_playing(sndGlass2) {
audio_play_sound(choose(sndGlass1,sndGlass2),0,false)
}
}
}

x+=lengthdir_x(12,dir)
y+=lengthdir_y(12,dir)

with objEnemy {
if scrCantGetHit(object_index) valid=0 else valid=1
if (place_meeting(x,y,objPlayer) or place_meeting(x+global.spacex,y+global.spacey,objPlayer)) and valid=1 {
mask_index=sprWeaponMask 
if scrCollisionLineExt(x,y,objPlayer.lastx,objPlayer.lasty,4,objSolid,objDoorV,objWallSoftH) {scrMoveSolidOff() mask_index=sprMask objPlayer.x=objPlayer.lastx objPlayer.y=objPlayer.lasty exit}
mask_index=sprMask
edir=point_direction(objPlayer.lastx,objPlayer.lasty,x,y)
audio_play_sound(sndDoorHit,0,false)
global.shake=3
my_id=instance_create(x,y,objKnockedOut)
my_id.type=object_index
if scrIsPolice(object_index) my_id.sprite_index=sprPoliceGetUp
my_id.direction=edir-10+random(20)
my_id.angle=my_id.direction
with my_id move_outside_solid(angle-180,16)
my_id.speed=3
scrIdleGetEnemy()
if sprite_index=sprEWalkUnarmed or sprite_index=sprPoliceWalkUnarmed noweapon=1 else noweapon=0
if noweapon=0 {
global.test=0
with objEnemy if alert=1 global.test+=1
my_id=instance_create(x,y-12,objScore)
my_id.text="+"+string(200+400*global.factor)+"pts"
global.myscore+=200+400*global.factor
global.boldscore+=200+400*global.factor
global.combotime+=100
global.killx[global.kills]=x
global.killy[global.kills]=y
global.kills+=1
my_id=instance_create(x,y,objWeaponThrow)
my_id.direction=direction-70+random(40)
my_id.image_index=scrCurrentWeaponExt(sprite_index)
my_id.speed=2+random(2)
my_id.ammo=ammo
}
instance_destroy()
}
}
x=lastx
y=lasty
}
/*
if (room != lastroom) {
	scrSaveGame();
	lastroom = room;
}
*/