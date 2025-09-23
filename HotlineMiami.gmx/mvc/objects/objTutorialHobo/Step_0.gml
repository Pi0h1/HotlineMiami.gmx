if (instance_exists(objPhoneConversation)) {
    image_speed = 0.1;
} else {
    image_speed = 0;
    image_index = 0;
}

if (!instance_exists(objPlayer))
    exit;
image_angle = scrRotate(image_angle, point_direction(x, y, objPlayer.x, objPlayer.y), 5);

if (state == 0) {
    if (wait > 0)
        wait--;
    else {
        with (objPlayerMouse) {
            my_id = instance_create(x, y, objPlayerMouseHouse);
            my_id.active = 0;
            my_id.dir = dir;
            my_id.legindex = legindex;
            my_id.image_index = image_index;
            my_id.direction = 90;
            my_id.legdir = 90;
            my_id.maskon = 1;
            my_id.maskindex = global.maskindex;
            instance_destroy();
        }
        scrGetMessage(state);
        state = 1;
        exit;
    }
}

if (state == 1) {
    if (!instance_exists(objPhoneConversation)) {
        with (objPlayerMouseHouse) {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.dir = dir;
            my_id.legindex = legindex;
            my_id.image_index = image_index;
            my_id.direction = 90;
            my_id.legdir = 90;
            my_id.maskon = 1;
            my_id.maskindex = global.maskindex;
            instance_destroy();
        }
        state = 2;
        wait = 30;
        exit;
    }
}

if (state == 2) {
    if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEnemyBash) + instance_number(objEnemyHeadKick) + instance_number(objPAttackThroat) < 3) {
        if (wait > 0)
            wait--;
        else {
            with (objPlayerMouse) {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.active = 0;
                my_id.dir = dir;
                my_id.legindex = legindex;
                my_id.sprite_index = sprite_index;
                my_id.image_index = image_index;
                my_id.direction = 90;
                my_id.legdir = 90;
                my_id.maskon = 1;
                my_id.maskindex = global.maskindex;
                instance_destroy();
            }
            scrGetMessage(state);
            state = 3;
            with (objLight) {
                if (color == c_red)
                    targetstrength = 1;
            }
            exit;
        }
    }
}

if (state == 3) {
    if (!instance_exists(objPhoneConversation)) {
        with (objLight) {
            if (color == c_red)
                targetstrength = 0.8;
        }
        with (objPlayerMouseHouse) {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.dir = dir;
            my_id.legindex = legindex;
            my_id.sprite_index = sprite_index;
            my_id.image_index = image_index;
            my_id.direction = 90;
            my_id.legdir = 90;
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            instance_destroy();
        }
        with (objDoorV) {
            if (x > objTutorialHobo.x && object_index == objDoorV)
                solid = 0;
        }
        state = 4;
        wait = 30;
        exit;
    }
}

if (state == 4) {
    if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEnemyBash) + instance_number(objEnemyHeadKick) + instance_number(objPBluntKill) + instance_number(objPAttackThroat) < 2) {
        if (wait > 0)
            wait--;
        else {
            with (objPlayerMouse) {
                my_id = instance_create(x, y, objPlayerMouseHouse);
                my_id.active = 0;
                my_id.dir = dir;
                my_id.legindex = legindex;
                my_id.sprite_index = sprite_index;
                my_id.image_index = image_index;
                my_id.direction = 90;
                my_id.legdir = 90;
                my_id.maskon = 1;
                my_id.maskindex = maskindex;
                instance_destroy();
            }
            scrGetMessage(state);
            state = 5;
            with (objLight) {
                if (color == c_aqua)
                    targetstrength = 1;
            }
            exit;
        }
    }
}

if (state == 5) {
    if (!instance_exists(objPhoneConversation)) {
        with (objLight) {
            if (color == c_aqua)
                targetstrength = 0.8;
        }
        with (objPlayerMouseHouse) {
            my_id = instance_create(x, y, objPlayerMouse);
            my_id.dir = dir;
            my_id.legindex = legindex;
            my_id.sprite_index = sprite_index;
            my_id.image_index = image_index;
            my_id.direction = 90;
            my_id.legdir = 90;
            my_id.maskon = 1;
            my_id.maskindex = maskindex;
            instance_destroy();
        }
        with (objDoorV) {
            if (x < objTutorialHobo.x)
                solid = 0;
        }
        state = 6;
        exit;
    }
}

if (state == 6) {
    if (objPlayer.sprite_index == sprPWalkShotgun) {
        with (objLight) {
            if (color == c_yellow)
                targetstrength = 1;
        }
    }
    with (objDoorH)
        solid = 0;
    if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEnemyBash) + instance_number(objPBluntKill) + instance_number(objPAttackThroat) == 0) {
        state = 7;
        exit;
    }
}

if (state == 7) {
    with (objLight) {
        if (image_blend == c_yellow)
            targetstrength = 0.8;
    }
    with (objPlayerMouse) {
        my_id = instance_create(x, y, objPlayerMouseHouse);
        my_id.active = 0;
        my_id.dir = dir;
        my_id.legindex = legindex;
        my_id.sprite_index = sprite_index;
        my_id.image_index = image_index;
        my_id.direction = 90;
        my_id.legdir = 90;
        my_id.maskon = 1;
        my_id.maskindex = maskindex;
        instance_destroy();
    }
    scrGetMessage(state);
    state = 8;
    exit;
}

if (state == 8) {
    if (!instance_exists(objPhoneConversation)) {
        objEffector.fade = 1;
        objEffector.nextroom = rmPart;
        objEffector.next = 1;
        objEffector.newsong = 0;
        global.nextlevel = rmDream1;
        global.sequence = rmSequence1;
    }
}

