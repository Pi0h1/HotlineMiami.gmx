function scrPlayerDropShield() {
	switch (sprite_index) {
	    case sprShieldSnapUzi:
	    case sprShieldSnapMP5:
	    case sprShieldSnapDoubleBarrel:
	    case sprShieldSnapSilencer:
	    case sprShieldSnapScorpion:
	    case sprShieldSnapMagnum:
    
	    exit;
	}
	if (reset)
	    exit;
    
	if (energie < 8) {
	    my_id = instance_create(x, y, objDeadBody)
	    my_id.sprite_index = sprEBackMachinegun;
	    my_id.image_index = floor(random(4));
	    global.dir = dir;
	    with (my_id)
	        move_contact_solid(global.dir - 45, 12);
	    my_id.direction = dir;
	    my_id.speed = 2 + random(1);
	    my_id.image_angle = my_id.direction;
	    my_id.type = objEnemy;
	    my_id = instance_create(x, y, objPlayerMouse);
	    my_id.ammo = ammo;
	    my_id.release = 1;
	    instance_destroy();
	} else {
	    switch (sprite_index) {
	        case sprPHumanShieldDoubleBarrel: sprite_index = sprShieldSnapDoubleBarrel; break;
	        case sprPHumanShieldMagnum: sprite_index = sprShieldSnapMagnum; break;
	        case sprPHumanShieldScorpion: sprite_index = sprShieldSnapScorpion; break;
	        case sprPHumanShieldUzi: sprite_index = sprShieldSnapUzi; break;
	        case sprPHumanShieldMP5: sprite_index = sprShieldSnapMP5; break;
	        case sprPHumanShieldSilencer: sprite_index = sprShieldSnapSilencer; break;
	    }
	    image_speed = 0.2
	    image_index = 0
	}



}
