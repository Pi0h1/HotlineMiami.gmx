// This script details all of the requirements needed for a level to be considered "complete".
// These requirements typically involve checks to make sure that each floor or the final floor is cleared of enemies.
if (instance_exists(objPlayer)) {
    if (room == rmApartment1Upstairs) {
        if (!instance_exists(objEnemy)) {
            if (!instance_exists(objKnockedOut) && !instance_exists(objEHideM16)) {
                if (global.done == 0 && instance_number(objEBullet) == 0) {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }

    if (room == rmAlley) {
        if (objDumpster.on) {
            if (!instance_exists(objEnemy)) {
                if (global.done == 0 && instance_number(objEBullet) == 0) {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }

    if (room == rmHighballer) {
        if (!instance_exists(objEnemy)) {
            if (!instance_exists(objKnockedOut) and!instance_exists(objEHideM16)) {
                if (!instance_exists(objEnemy)) {
                    if (global.done == 0 && instance_number(objEBullet) == 0) {
                        instance_create(x, y, objLevelComplete);
                        global.done = 1;
                    }
                }
            }
        }
    }

    if (room == rmEurogamer) {
        if (!instance_exists(objEnemy)) {
            if (!instance_exists(objKnockedOut) and!instance_exists(objEHideM16)) {
                if (!instance_exists(objEnemy)) {
                    if (global.done == 0 && instance_number(objEBullet) == 0) {
                        instance_create(x, y, objLevelComplete);
                        global.done = 1;
                    }
                }
            }
        }
    }


    if (room == rmArcadeUpstairs) {
        if (!instance_exists(objEnemy)) {
            if (!instance_exists(objKnockedOut) and!instance_exists(objEHideM16)) {
                if (global.done == 0 && instance_number(objEBullet) == 0) {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }

    if (room == rmApartment2Upstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }


    if (room == rmHouse1Upstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) = 0) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHotelSuite) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) = 0) {
            if (objFatmanShit.sprite_index == sprFatmanShitDie || objFatmanShit.sprite_index == sprFatmanShitDecapitated) {
                if (global.done == 0 && instance_number(objEBullet) == 0) {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1;
                }
            }
        }
    }

    if (room == rmMansionMainHall) {
        if (!instance_exists(objBoss)) {
            with (objDoorH) {
                if (solid)
                    solid = 0;
            }
            with (objBossPhone) {
                if (!on) {
                    on = 1;
                    audio_play_sound(sndPhoneCall, 0, true);
                }
            }
            if (!instance_exists(objBossgun) && objBossPhone.talked) {
                    instance_create(x, y, objLevelComplete);
                    global.done = 1
            }
        }
    }

    if (room == rmHouse2Upstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) = 0) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }


    if (room == rmHouse5Upstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) = 0) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHouse3Upstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done3 = 1;
        if (global.done1 + global.done2 + global.done3 == 3) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHouse3Downstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done2 = 1;
        if (global.done1 + global.done2 + global.done3 == 3) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
    if (room == rmHouse3Basement) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done1 = 1;
        if (global.done1 + global.done2 + global.done3 == 3) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }


    if (room == rmBuildingFloor1) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0) {
            global.done1 = 1;
            if (!global.done2) {
                with (objTeleporter) {
                    if (nextroom = room_previous(room))
                        sprite = sprArrowGray;
                }
            } else {
                with (objTeleporter) {
                    if (nextroom == room_previous(room))
                        sprite = sprGoArrow;
                }
            }
        }
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (!global.done && instance_number(objEBullet) == 0)
                global.done = 1;
        }
    }

    if (room == rmBuildingFloor2) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0) {
            global.done2 = 1;
            if (!global.done3) {
                with (objTeleporter) {
                    if (nextroom == room_previous(room))
                        sprite = sprArrowGray;
                }
            } else {
                with (objTeleporter) {
                    if (nextroom == room_previous(room))
                        sprite = sprGoArrow;
                }
            }
        }
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (!global.done && instance_number(objEBullet) == 0)
                global.done = 1;
        }
    }
    if (room == rmBuildingFloor3) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0) {
            global.done3 = 1;
            if (!global.done4) {
                with (objTeleporter) {
                    if (nextroom == room_previous(room))
                        sprite = sprArrowGray;
                }
            } else {
                with (objTeleporter) {
                    if (nextroom == room_previous(room))
                        sprite = sprGoArrow;
                }
            }
        }
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (global.done = 0 && instance_number(objEBullet) == 0)
                global.done = 1;
        }
    }
    if (room == rmBuildingFloor4) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done4 = 1;
    }


    if (room == rmOfficeEntrance) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done1 = 1;
        if (global.done1 + global.done2 + global.done3 == 3) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmOfficeFloor2) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done2 = 1;
        if (global.done1 + global.done2 + global.done3 == 3) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmOfficeFloor3) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done3 = 1;
        if (global.done1 + global.done2 + global.done3 == 3) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHouse4Middle) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done1 = 1;
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHouse4Left) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done2 = 1;
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHouse4Right) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done3 = 1
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmHouse4Upstairs) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) == 0)
            global.done4 = 1
        if (global.done1 + global.done2 + global.done3 + global.done4 == 4) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }

    if (room == rmPoliceHQFloor3) {
        if (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objFiles) == 0) {
            if (global.done == 0 && instance_number(objEBullet) == 0) {
                instance_create(x, y, objLevelComplete);
                global.done = 1;
            }
        }
    }
}
