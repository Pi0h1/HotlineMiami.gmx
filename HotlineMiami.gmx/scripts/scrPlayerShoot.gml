#define scrPlayerShoot
if ( objPlayer.sprite_index=sprPLeaveBag or sprite_index=sprPWalkBossgun or objPlayer.sprite_index=sprPMaskSlip or instance_exists(objMaskMenu) )
    exit;

sprite=mask_index

var bulletmethod = 1;
var bullet_distance = 10;

if ( reload <= 0 )
{
    // Melee Weapons
    switch ( sprite_index )
    {
        case sprPWalkUnarmed:
            scrPlayerAttackMelee( sprPAttackPunch );
            image_index = 0;
            break;
        case sprPWalkBag:
            scrPlayerAttackMelee( sprPAttackBag );
            image_index =1;
            break;
        case sprPWalkPan:
            scrPlayerAttackMelee( sprPAttackPan );
            image_index = 1;
            global.usedmelee[12] = 1;
            break;
        case sprPWalkCrowbar:
            scrPlayerAttackMelee( sprPAttackCrowbar );
            image_index = 1;
            global.usedmelee[9] = 1;
            break;
        case sprPWalkMachete:
            scrPlayerAttackMelee( sprPAttackMachete, 12 );
            image_index = 1;
            global.usedmelee[10] = 1;
            break;
        case sprPWalkPot:
            scrPlayerAttackMelee( sprPAttackPot, 25 );
            image_index = 1;
            global.usedmelee[13] = 1;
            break;
        case sprPWalkBoilingPot:
            scrPlayerAttackMelee( sprPAttackBoilingPot, 25 );
            image_index = 1;
            global.usedmelee[13] = 1;
            repeat (3+random(2))
            {
                my_id=instance_create(x+lengthdir_x(11,dir)-2+random(4),y+lengthdir_y(11,dir)-2+random(4),objPWater)
                global.mydir=dir
                with my_id move_contact_solid(global.mydir,10)
                my_id.direction=point_direction(x,y,my_id.x,my_id.y)
                my_id.speed=8
                my_id.image_angle=my_id.direction
            }
            break;
        case sprPWalkDrill:
            scrPlayerAttackMelee( sprPAttackDrill );
            image_index = 1;
            break;
        case sprPWalkTrophy:
            scrPlayerAttackMelee( sprPAttackTrophy );
            break;
    }
    // Guns
    if ammo>0
    {
        mask_index=sprBullet
        image_angle=dir
        
        switch ( sprite_index )
        {
            case sprPWalkM16: // M16
                scrPlayerAttackGun( sprPAttackM16, sndM16, 2 );
                scrHearPlayer()
                global.shake = 3;
                global.usedgun[0] = 1;
                break;
            case sprPWalkShotgun: // Shotgun
                scrPlayerAttackGun( sprPAttackShotgun, sndShotgun, 30, 6, 8 );
                scrHearPlayer()
                light = 20;
                global.shake = 5;
                global.usedgun[1] = 1;
                break;
            case sprPWalkDoubleBarrel:
                if ( ammo % 1 ) == 0 sprite_index=sprPAttackDoubleBarrel1 else sprite_index=sprPAttackDoubleBarrel2;
                scrPlayerAttackGun( sprite_index, sndDoubleBarrel, 7, 10, 16 );
                scrHearPlayer()
                light = 25;
                global.shake = 7;
                global.usedgun[2] = 1;
                break;
        }
        
        // Shotgun
        if false && sprite_index=sprPWalkShotgun
        {
            audio_play_sound(sndShotgun,0,false)
            scrHearPlayer()
            ammo-=1
            reload=30
            global.shake=5
            if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV)
            {
                my_id=instance_create(x,y,objSmokeHit)
                my_id.image_angle=image_angle
                global.dir=dir
                with my_id
                {
                    move_contact_solid(global.dir,16)
                }
                with objDoorV
                {
                    if place_meeting(x+lengthdir_x(12,global.dir-180),y+lengthdir_y(12,global.dir-180),objPlayer)
                    {
                        if object_index=objDoorV
                        {
                            if solid=0
                            {
                                if abs(swingspeed)<8 {
                                swingspeed+=lengthdir_x(16,global.dir)
                                if abs(swingspeed)>3.5 swinger=1
                                }
                                if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                            }
                        }
                        if object_index=objDoorH
                        {
                            if solid=0
                            {
                                if abs(swingspeed)<8
                                {
                                    swingspeed+=lengthdir_y(16,global.dir)
                                    if abs(swingspeed)>3.5
                                        swinger=1
                                }
                                if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                            }
                        }
                        if object_index=objDoorV2
                        {
                            if solid=0 {
                                if abs(swingspeed)<8 {
                                    swingspeed-=lengthdir_x(16,global.dir)
                                    if abs(swingspeed)>3.5 swinger=1
                                }
                                if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                            }
                        }
                        
                        if object_index=objDoorH2
                        {
                            if solid=0
                            {
                                if abs(swingspeed)<8 {
                                    swingspeed-=lengthdir_y(16,global.dir)
                                    if abs(swingspeed)>3.5 swinger=1
                                }
                                if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                            }
                        }
                    }
                }
            }
            else
            {
                if ( bulletmethod == 1 )
                {
                    scrShootBullets( x, y, dir, 6, 8 );
                }
                else
                {
                    repeat (8)
                    {
                        my_id=instance_create(x+lengthdir_x(16,dir-7),y+lengthdir_y(16,dir-7),objBullet)
                        if instance_exists(my_id)
                        {
                            my_id.direction=dir-6+random(12)
                            my_id.speed=16-random(4)
                            my_id.image_angle=my_id.direction
                        }
                    }
                }
            }
            my_id=instance_create(x+lengthdir_x(5,dir-5*left),y+lengthdir_y(5,dir-5*left),objShell)
            my_id.sprite_index=sprShotgunShell
            my_id.image_angle=dir
            my_id.direction=dir-90*left-20+random(30)
            my_id.speed=1+random(3)
            sprite_index=sprPAttackShotgun
            image_speed=0.5
            image_index=0
            light=20
            global.usedgun[1]=1
        }
        
        // DB.Shotgun
        if false && sprite_index=sprPWalkDoubleBarrel {
            audio_play_sound(sndDoubleBarrel,0,false)
            scrHearPlayer()
            ammo-=1
            reload=8
            global.shake=7
            if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
            my_id=instance_create(x,y,objSmokeHit)
            my_id.image_angle=image_angle
            global.dir=dir
            with my_id {
            move_contact_solid(global.dir,16)
            }
            
            
            
            with objDoorV {
            if place_meeting(x+lengthdir_x(12,global.dir-180),y+lengthdir_y(12,global.dir-180),objPlayer) {
            
            if object_index=objDoorV {
            if solid=0 {
            if abs(swingspeed)<8 {
            swingspeed+=lengthdir_x(16,global.dir)
            if abs(swingspeed)>3.5 swinger=1
            }
            if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
            }
            }
            
            if object_index=objDoorH {
            if solid=0 {
            if abs(swingspeed)<8 {
            swingspeed+=lengthdir_y(16,global.dir)
            if abs(swingspeed)>3.5 swinger=1
            }
            if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
            }
            }
            
            if object_index=objDoorV2 {
            if solid=0 {
            if abs(swingspeed)<8 {
            swingspeed-=lengthdir_x(16,global.dir)
            if abs(swingspeed)>3.5 swinger=1
            }
            if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
            }
            }
            
            if object_index=objDoorH2 {
            if solid=0 {
            if abs(swingspeed)<8 {
            swingspeed-=lengthdir_y(16,global.dir)
            if abs(swingspeed)>3.5 swinger=1
            }
            if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
            }
            }
            
            
            }
            }
            
            }
            else
            {
                if ( bulletmethod == 1 )
                {
                    scrShootBullets( x, y, dir, 10, 16 );
                }
                else
                {
                    repeat (16) {
                        my_id=instance_create(x+lengthdir_x(16,dir-7-3),y+lengthdir_y(16,dir-7-3),objBullet)
                        if instance_exists(my_id) {
                            my_id.direction=dir-10+random(20)
                            my_id.speed=16-random(6)
                            my_id.image_angle=my_id.direction
                        }
                    }
                }
            }
            if ( ammo % 1 ) == 0 sprite_index=sprPAttackDoubleBarrel1 else sprite_index=sprPAttackDoubleBarrel2
            image_speed=0.5
            image_index=0
            light=25
            global.usedgun[2]=1
        }
        
        // Silenced Pistol
        if sprite_index=sprPWalkSilencer {
        audio_play_sound(sndSilencer,0,false)
        ammo-=1
        reload=10
        global.shake=2
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        }
        else
        {
            if ( bulletmethod == 1 )
            {
                scrShootBullets( x, y, dir, 3 );
            }
            else
            {
                my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
                if instance_exists(my_id) {
                    my_id.direction=dir-3+random(6)
                    my_id.speed=16
                    my_id.image_angle=my_id.direction
                }
            }
        }
        my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
        my_id.sprite_index=sprUziShell
        my_id.image_angle=dir
        my_id.direction=dir-90*left-20+random(30)
        my_id.speed=1+random(3)
        sprite_index=sprPAttackSilencer
        image_speed=0.5
        image_index=0
        light=12
        global.usedgun[3]=1
        }
        
        // Uzi
        if sprite_index=sprPWalkUzi {
        audio_play_sound(sndUzi,0,false)
        scrHearPlayer()
        ammo-=1
        reload=1
        global.shake=3
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        } else {
            if ( bulletmethod == 1 )
            {
                scrShootBullets( x, y, dir, 5 );
            }
            else
            {
                my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
                if instance_exists(my_id) {
                    my_id.direction=dir-5+random(10)
                    my_id.speed=16
                    my_id.image_angle=my_id.direction
                }
            }
        }
        my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
        my_id.sprite_index=sprUziShell
        my_id.image_angle=dir
        my_id.direction=dir-90*left-20+random(30)
        my_id.speed=1+random(3)
        sprite_index=sprPAttackUzi
        image_speed=1
        image_index=0
        light=12
        global.usedgun[4]=1
        }
        // Silenced Uzi
        if sprite_index=sprPWalkSilencedUzi {
        audio_play_sound(sndSilencer,0,false)
        ammo-=1
        reload=2
        global.shake=3
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        } else {
            if ( bulletmethod == 1 )
            {
                scrShootBullets( x, y, dir, 5 );
            }
            else
            {
                my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
                if instance_exists(my_id) {
                my_id.direction=dir-5+random(10)
                my_id.speed=16
                my_id.image_angle=my_id.direction
                }
            }
        }
        my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
        my_id.sprite_index=sprUziShell
        my_id.image_angle=dir
        my_id.direction=dir-90*left-20+random(30)
        my_id.speed=1+random(3)
        sprite_index=sprPAttackSilencedUzi
        image_speed=1
        image_index=0
        light=12
        global.usedgun[8]=1
        }
        
        // MP5
        if sprite_index=sprPWalkMP5 {
        audio_play_sound(sndMP5,0,false)
        scrHearPlayer()
        ammo-=1
        reload=2
        global.shake=3
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        } else {
            if ( bulletmethod == 1 )
            {
                scrShootBullets( x, y, dir, 5 );
            }
            else
            {
                my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
                if instance_exists(my_id) {
                my_id.direction=dir-5+random(10)
                my_id.speed=16
                my_id.image_angle=my_id.direction
                }
            }
        }
        my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
        my_id.sprite_index=sprUziShell
        my_id.image_angle=dir
        my_id.direction=dir-90*left-20+random(30)
        my_id.speed=1+random(3)
        sprite_index=sprPAttackMP5
        image_speed=1
        image_index=0
        light=12
        global.usedgun[7]=1
        }
        
        if sprite_index=sprPigButcherWalkMP5 {image_index=0 sprite_index=sprPigButcherShoot}
        if sprite_index=sprPigButcherShoot {
        if image_index<2 image_index+=0.25 else {
        image_index=2
        audio_play_sound(sndMP5,0,false)
        //scrHearPlayer()
        ammo-=1
        reload=2
        global.shake=3
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        } else {
        my_id=instance_create(x+lengthdir_x(20,dir-18),y+lengthdir_y(20,dir-18),objBullet)
        if instance_exists(my_id) {
        my_id.direction=dir-5+random(10)
        my_id.speed=16
        my_id.image_angle=my_id.direction
        }
        }
        my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
        my_id.sprite_index=sprUziShell
        my_id.image_angle=dir
        my_id.direction=dir-90*left-20+random(30)
        my_id.speed=1+random(3)
        image_speed=0
        light=12
        }
        }
        
        // Magnum
        if sprite_index=sprPWalkMagnum {
        audio_play_sound(sndMagnum,0,false)
        scrHearPlayer()
        ammo-=1
        reload=8
        global.shake=4
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        } else {
            if ( bulletmethod == 1 )
            {
                scrShootBullets( x, y, dir, 0 );
            }
            else
            {
                my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
                if instance_exists(my_id) {
                my_id.direction=dir
                my_id.speed=16
                my_id.image_angle=my_id.direction
                my_id.caliber=1
            }
            }
        }
        sprite_index=sprPAttackMagnum
        image_speed=0.5
        image_index=0
        light=12
        global.usedgun[5]=1
        }
        
        // Scorpion
        if sprite_index=sprPWalkScorpion {
        audio_play_sound(sndScorpion,0,false)
        scrHearPlayer()
        ammo-=1
        reload=2
        global.shake=3
        if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV) {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id {
        move_contact_solid(global.dir,16)
        }
        } else {
            if ( bulletmethod == 1 )
            {
                scrShootBullets( x, y, dir, 3 );
            }
            else
            {
                my_id=instance_create(x+lengthdir_x(20,dir-7),y+lengthdir_y(20,dir-7),objBullet)
                if instance_exists(my_id)
                {
                    my_id.direction=dir-3+random(6)
                    my_id.speed=16
                    my_id.image_angle=my_id.direction
                }
            }
        }
        my_id=instance_create(x+lengthdir_x(16,dir-7-4*left),y+lengthdir_y(16,dir-7-4*left),objShell)
        my_id.sprite_index=sprUziShell
        my_id.image_angle=dir
        my_id.direction=dir-90*left-20+random(30)
        my_id.speed=1+random(3)
        sprite_index=sprPAttackScorpion
        image_speed=1
        image_index=0
        light=12
        global.usedgun[6]=1
        }
        scrCheckUsedGuns()
    }
    
    
    
    
    if sprite_index=sprPWalkThrow {
    my_id=instance_create(x+lengthdir_x(14,dir+left*-35),y+lengthdir_y(12,dir+left*-35),objThrowingWeapon)
    audio_play_sound(sndThrow,0,false)
    my_id.speed=12
    my_id.direction=dir-2+random(4)
    my_id.image_index=throwindex
    global.usedthrow[throwindex]=1
    reload=20
    image_speed=0.5
    image_index=1
    sprite_index=sprPAttackThrow
    left=1
    }
    
    if sprite_index=sprPWalkSword {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackSword
    image_speed=1
    image_index=0
    reload=15
    global.usedmelee[4]=1
    }
    
    
    if sprite_index=sprPWalkKnife {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackKnife
    image_speed=1
    image_index=0
    reload=10
    global.usedmelee[3]=1
    }
    
    
    
    if sprite_index=sprPWalkClub {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackClub
    image_speed=0.7
    image_index=1
    reload=19
    global.usedmelee[0]=1
    }
    
    if sprite_index=sprPWalkNightStick {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackNightStick
    image_speed=0.7
    image_index=1
    reload=15
    global.usedmelee[8]=1
    }
    
    if sprite_index=sprPWalkPipe {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackPipe
    image_speed=0.7
    image_index=1
    reload=22
    global.usedmelee[1]=1
    }
    
    if sprite_index=sprPWalkBat {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackBat
    image_speed=0.7
    image_index=1
    reload=25
    global.usedmelee[2]=1
    }
    
    if sprite_index=sprPWalkAxe {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackAxe
    image_speed=0.35
    image_index=1
    reload=30
    global.usedmelee[7]=1
    }
    
    if sprite_index=sprPWalkSledgeHammer {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackSledgeHammer
    image_speed=0.35
    image_index=1
    reload=30
    global.usedmelee[11]=1
    }
    
    if sprite_index=sprPWalkPool {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackPool
    image_speed=0.7
    image_index=1
    reload=20
    global.usedmelee[5]=1
    }
    
    if sprite_index=sprPWalkPoolBroke {
    audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
    sprite_index=sprPAttackPoolBroke
    image_speed=0.7
    image_index=1
    reload=20
    global.usedmelee[6]=1
    }
    
    
    mask_index=sprite
    image_angle=0
}
scrCheckUsedGuns()
scrCheckUsedMelee()
scrCheckUsedThrows()





#define scrPlayerAttackMelee
///scrPlayerAttackMelee( attackSprite, [reloadTime=20], [animSpeed=0.5] )

var attackSprite = argument[0];
var reloadTime = 20;
var animSpeed = 0.5;

if ( argument_count > 2 )
    reloadTime = argument[2];
if ( argument_count > 3 )
    animSpeed = argument[3];

audio_play_sound(choose(sndSwing1,sndSwing2),0,false)
sprite_index = attackSprite;
image_index = 0;
image_speed = animSpeed;
reload = reloadTime;

#define scrPlayerAttackGun
/// scrPlayerAttackGun( attackSprite, shootSound, reloadTime, bulletSpread, bulletCount )
var i = 0;
var attackSprite = argument[i++];
var shootSound = argument[i++];
var reloadTime = argument[i++];

var bulletSpread = 3;
if ( argument_count > i && ( argument[i] != undefined ) )
    bulletSpread = argument[i++];
var bulletCount = 1;
if ( argument_count > i && ( argument[i] != undefined ) )
    bulletCount = argument[i++];



var isShotgun = ( bulletCount >= 4 );
   
var lastmask = mask_index;
var lastangle = image_angle;
mask_index = sprBullet
image_angle = dir;


audio_play_sound( shootSound , 0, false );
ammo-=1
global.shake=3


reload = reloadTime;

if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV)
{
    var smoke;
    smoke = instance_create(x,y,objSmokeHit)
    smoke.image_angle=image_angle
    global.dir=dir
    with smoke 
    {
        move_contact_solid(global.dir,16)
    }
    
    if ( isShotgun ) // Shotgun, blast door open
    {
        with objDoorV
        {
            if place_meeting(x+lengthdir_x(12,global.dir-180),y+lengthdir_y(12,global.dir-180),objPlayer)
            {
                if object_index=objDoorV
                {
                    if solid=0
                    {
                        if abs(swingspeed)<8 {
                        swingspeed+=lengthdir_x(16,global.dir)
                        if abs(swingspeed)>3.5 swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
                if object_index=objDoorH
                {
                    if solid=0
                    {
                        if abs(swingspeed)<8
                        {
                            swingspeed+=lengthdir_y(16,global.dir)
                            if abs(swingspeed)>3.5
                                swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
                if object_index=objDoorV2
                {
                    if solid=0 {
                        if abs(swingspeed)<8 {
                            swingspeed-=lengthdir_x(16,global.dir)
                            if abs(swingspeed)>3.5 swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
                
                if object_index=objDoorH2
                {
                    if solid=0
                    {
                        if abs(swingspeed)<8 {
                            swingspeed-=lengthdir_y(16,global.dir)
                            if abs(swingspeed)>3.5 swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
            }
        }
    }
}
else
{
    scrShootBullets( x, y, dir, bulletSpread, bulletCount );
}


// Shell
var shell;
shell = instance_create( x + lengthdir_x( 5, dir - ( 5 * left ) ), y + lengthdir_y( 5, dir - ( 5 * left )), objShell );
shell.sprite_index=sprM16Shell
if ( isShotgun )
    shell.sprite_index = sprShotgunShell;

shell.image_angle=dir
shell.direction=dir-90*left-20+random(30)
shell.speed=1+random(3)

light=12


// Attack sprite
sprite_index = attackSprite;
image_speed = 0.5;
image_index = 0;


mask_index = lastmask;
image_angle = lastangle;



exit;
// M16 example
if sprite_index=sprPWalkM16
{
    audio_play_sound(sndM16,0,false)
    scrHearPlayer()
    ammo-=1
    reload=2
    global.shake=3
    if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV)
    {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id 
        {
            move_contact_solid(global.dir,16)
        }
    }
    else
    {
        if ( bulletmethod == 1 )
        {
            scrShootBullets( x, y, dir, 3 );
        }
        else
        {
            my_id=instance_create(x+lengthdir_x(16,dir-7),y+lengthdir_y(16,dir-7),objBullet)
            if instance_exists(my_id)
            {
                my_id.direction=dir-3+random(6)
                my_id.speed=16
                my_id.image_angle=my_id.direction
            }
        }
    }
    my_id=instance_create(x+lengthdir_x(5,dir-5*left),y+lengthdir_y(5,dir-5*left),objShell)
    my_id.sprite_index=sprM16Shell
    my_id.image_angle=dir
    my_id.direction=dir-90*left-20+random(30)
    my_id.speed=1+random(3)
    sprite_index=sprPAttackM16
    image_speed=0.5
    image_index=0
    light=12
    global.usedgun[0]=1
}

// Shotgun
if sprite_index=sprPWalkShotgun
{
    audio_play_sound(sndShotgun,0,false)
    scrHearPlayer()
    ammo-=1
    reload=30
    global.shake=5
    if place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objSolid) or place_meeting(x+lengthdir_x(12,dir),y+lengthdir_y(12,dir),objDoorV)
    {
        my_id=instance_create(x,y,objSmokeHit)
        my_id.image_angle=image_angle
        global.dir=dir
        with my_id
        {
            move_contact_solid(global.dir,16)
        }
        with objDoorV
        {
            if place_meeting(x+lengthdir_x(12,global.dir-180),y+lengthdir_y(12,global.dir-180),objPlayer)
            {
                if object_index=objDoorV
                {
                    if solid=0
                    {
                        if abs(swingspeed)<8 {
                        swingspeed+=lengthdir_x(16,global.dir)
                        if abs(swingspeed)>3.5 swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
                if object_index=objDoorH
                {
                    if solid=0
                    {
                        if abs(swingspeed)<8
                        {
                            swingspeed+=lengthdir_y(16,global.dir)
                            if abs(swingspeed)>3.5
                                swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
                if object_index=objDoorV2
                {
                    if solid=0 {
                        if abs(swingspeed)<8 {
                            swingspeed-=lengthdir_x(16,global.dir)
                            if abs(swingspeed)>3.5 swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
                
                if object_index=objDoorH2
                {
                    if solid=0
                    {
                        if abs(swingspeed)<8 {
                            swingspeed-=lengthdir_y(16,global.dir)
                            if abs(swingspeed)>3.5 swinger=1
                        }
                        if abs(swingspeed)>8 {swingspeed=sign(swingspeed)*8}
                    }
                }
            }
        }
    }
    else
    {
        if ( bulletmethod == 1 )
        {
            scrShootBullets( x, y, dir, 6, 8 );
        }
        else
        {
            repeat (8)
            {
                my_id=instance_create(x+lengthdir_x(16,dir-7),y+lengthdir_y(16,dir-7),objBullet)
                if instance_exists(my_id)
                {
                    my_id.direction=dir-6+random(12)
                    my_id.speed=16-random(4)
                    my_id.image_angle=my_id.direction
                }
            }
        }
    }
    my_id=instance_create(x+lengthdir_x(5,dir-5*left),y+lengthdir_y(5,dir-5*left),objShell)
    my_id.sprite_index=sprShotgunShell
    my_id.image_angle=dir
    my_id.direction=dir-90*left-20+random(30)
    my_id.speed=1+random(3)
    sprite_index=sprPAttackShotgun
    image_speed=0.5
    image_index=0
    light=20
    global.usedgun[1]=1
}

#define scrShootBullets
///scrShootBullets( playerx, playery, angle, spread, [count=1] )

var origin_x = argument[0];
var origin_y = argument[1];
var angle = argument[2];
var spread = argument[3];
var count = 1;
if ( argument_count > 4 )
    count = argument[4]

origin_x += lengthdir_x( 12, angle );
origin_y += lengthdir_y( 12, angle );
repeat ( count )
{
    var inst = instance_create( origin_x, origin_y ,objBullet );

    inst.direction = angle + random_range( -spread, spread );
    inst.image_angle = inst.direction;
    inst.speed = 16;
    if ( count > 1 )
    {
        var amnt = ceil(  ( count - 1 ) / 2.5 );
        inst.speed += random_range( -amnt, amnt * 0.25 );
    }
}