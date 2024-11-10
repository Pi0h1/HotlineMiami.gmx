/*
Enemy Shooting Script
*/
var dir = angle;
if ammo < 1 exit

// M16
if sprite_index = sprEWalkM16 or sprite_index = sprPoliceWalkM16 or sprite_index = sprSwatWalkM16 {
  if reload > 0 reload -= 1
  else {
    shake = 1
    ammo -= 1
    light = 10
    global.shake = 3
    PlaySFX(sndEM16)
    mask_index = sprWeaponMask
    reload = 5
    if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) {
      my_id = instance_create(x, y, objSmokeHit)
      my_id.image_angle = image_angle
      global.dir = angle
      with my_id {
        move_contact_solid(global.dir, 16)
      }
    } else {
      CreateBullet(objEBullet, false)
    }
    CreateShell(sprM16Shell)
    mask_index = sprMask
  }
}

// Shotgun
if sprite_index = sprEWalkShotgun or sprite_index = sprPoliceWalkShotgun {
  if reload > 0 reload -= 1
  else {
    PlaySFX(sndShotgun)
    ammo -= 1
    shake = 3
    reload = 60
    global.shake = 6
    mask_index = sprWeaponMask
    if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) {
      repeat(8) {
        my_id = instance_create(x, y, objSmokeHit)
        global.dir = angle
        with my_id move_contact_all(global.dir, 26)
      }
    } else {
      repeat(8) {
        CreateBullet(objEBullet, false)
      }
    }
    CreateShell(sprShotgunShell)
    light = 20
    mask_index = sprMask
  }
}

// Double Barrel Shotgun
if sprite_index = sprEWalkDoubleBarrel {
  if reload > 0 reload -= 1
  else {
    PlaySFX(sndShotgun)
    ammo -= 1
    shake = 3
    reload = 15
    mask_index = sprWeaponMask
    global.shake = 6
    if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) {
      repeat(16) {
        my_id = instance_create(x, y, objSmokeHit)
        global.dir = angle
        with my_id move_contact_all(global.dir, 26)
      }
    } else {
      repeat(16) {
        CreateBullet(objEBullet, false)
      }
    }
    CreateShell(sprShotgunShell)
    light = 20
    mask_index = sprMask
  }
}

// Silenced Pistol
if sprite_index = sprEWalkSilencer {
  if reload > 0 reload -= 1
  else {
    PlaySFX(sndSilencer)
    ammo -= 1
    shake = 1
    reload = 10
    global.shake = 2
    if place_meeting(x + lengthdir_x(8, angle), y + lengthdir_y(8, angle), objSolid) {
      my_id = instance_create(x, y, objSmokeHit)
      my_id.image_angle = image_angle
      global.dir = angle
      with my_id {
        move_contact_solid(global.dir, 16)
      }
    } else {
      CreateBullet(objEBullet, false)
    }
    CreateShell(sprUziShell)
    light = 12
  }
}
