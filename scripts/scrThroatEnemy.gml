if sprite_index = sprPWalkBag or sprite_index = sprPAttackBag nothing = 1
else {
  global.test = 0
  if place_meeting(x + lengthdir_x(12, dir), y + lengthdir_y(12, dir), objEnemy) {
    with objEnemy {
      if object_index = objDogPatrol or object_index = objEnemyFat or scrIsPolice(object_index) or global.test > 0 nothing = 1
      else {
        if place_meeting(x - lengthdir_x(12, objPlayer.dir), y - lengthdir_y(12, objPlayer.dir), objPlayer) {
          my_id = instance_create(objPlayer.x + lengthdir_x(7, objPlayer.dir), objPlayer.y + lengthdir_y(7, objPlayer.dir), objPKillThroat)
          my_id.maskindex = objPlayer.maskindex
          my_id.maskon = 1
          my_id.image_angle = objPlayer.dir
          instance_destroy()
          PlaySFX(sndThrow)
          PlaySFX(sndHitWall)
          global.test = 1
          enemyDropWeapon();
          if global.maskindex = 11 {
            if scrCurrentWeaponExt(sprite_index) > 0 global.gun = scrIndexToWeapon(scrCurrentWeaponExt(sprite_index))
            else global.gun = sprPWalkUnarmed
          }
        }
      }
    }
    if global.test = 1 {
      if sprite_index = sprPWalkUnarmed nothing = 1
      else {
        my_id = instance_create(objPlayer.x + lengthdir_x(8, objPlayer.dir + 90), objPlayer.y + lengthdir_y(8, objPlayer.dir + 90), objWeaponThrow)
        my_id.image_index = lastweapon
        my_id.direction = dir + 70 + random(40)
        my_id.speed = (1 + random(2))* delta
        my_id.ammo = lastammo
      }
      global.test = 3
      instance_destroy()
      exit
    }
  }
}
