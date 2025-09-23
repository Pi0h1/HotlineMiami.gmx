if (!instance_exists(objPlayer))
    exit;
index = image_index;
mask_index = sprite_index;
image_index = 0;
if (place_meeting(x, y, objPlayer)) {
    image_index = index;
    if (image_angle == 0 && objEffector.fade == 0) {
        if (objPlayer.sprite_index == sprPWalkGirlfriend) {
            // do nothing.
        } else objPlayer.sprite_index = sprPWalkUnarmed;
        if (objPlayer.y < y)
            objPlayer.y += 3;
        if (image_index < 2)
            image_index += 0.2;
        if (objPlayer.y > y - 8) {
            if (image_index <= 2)
                audio_play_sound(sndCarClose, 0, false)
            if (engine == 0 && image_index > 7) {
                engine = 1;
                if (instance_exists(objPlayerMouse))
                    SteamIncStat("Car", 1);
                audio_play_sound(sndCarEngine, 0, false);
            }
            if (image_index < 12) {
                image_index += 0.2;
            } else {
                objEffector.next = 1;
                room_persistent = 0;
                if (objEffector.fade == 0) {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                        SteamSetAchievement("ACH_BATMAN");
                }
                objEffector.fade = 1;
                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer) {
                    objEffector.nextroom = scrCarNextRoom(room);
                if (room == rmTrainstationEntrance) {
                    objEffector.newsong = 1;
                    objEffector.song = working_directory + "\\Static.mp3";
                } else {
                    objEffector.newsong = 1 objEffector.song = working_directory + "\\Miami2.mp3"
                    if (room == rmBuildingFloor1)
                        objEffector.song = working_directory + "\\Static.mp3";
                    if (room == rmPhoneHomEntranceBiker)
                        objEffector.song = working_directory + "\\ItsSafeNow.mp3";
                    }
                } else {
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    if (image_angle == 90 && !objEffector.fade) {
        if (objPlayer.sprite_index == sprPWalkGirlfriend) {
            // do nothing
        } else objPlayer.sprite_index = sprPWalkUnarmed;
        if (objPlayer.x < x)
            objPlayer.x += 3;
        if (image_index < 2)
            image_index += 0.2;
        if (objPlayer.x > x - 8) {
            if (image_index <= 2)
                audio_play_sound(sndCarClose, 0, false);
            if (engine == 0 && image_index > 7) {
                engine = 1;
                if (instance_exists(objPlayerMouse))
                    SteamIncStat("Car", 1);
                audio_play_sound(sndCarEngine, 0, false);
            }
            if (image_index < 12) {
                image_index += 0.2;
            } else {
                objEffector.next = 1;
                room_persistent = 0;
                if (objEffector.fade == 0) {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                        SteamSetAchievement("ACH_BATMAN");
                }
                objEffector.fade = 1;
                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer) {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance) {
                        objEffector.newsong = 1;
                        objEffector.song = working_directory + "\\Static.mp3";
                    } else {
                        objEffector.newsong = 1;
                        objEffector.song = working_directory + "\\Miami2.mp3";
                        if (room == rmBuildingFloor1)
                            objEffector.song = working_directory + "\\Static.mp3";
                        if (room == rmPhoneHomEntranceBiker)
                            objEffector.song = working_directory + "\\ItsSafeNow.mp3";
                    }
                } else {
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    if (image_angle == 180 && objEffector.fade == 0) {
        if (objPlayer.sprite_index == sprPWalkGirlfriend) {
            // do nothing
        } else objPlayer.sprite_index = sprPWalkUnarmed;
        if (objPlayer.y > y)
            objPlayer.y -= 3;
        if (image_index < 2)
            image_index += 0.2;
        if (objPlayer.y < y + 8) {
            if (image_index <= 2)
                audio_play_sound(sndCarClose, 0, false);
            if (engine == 0 && image_index > 7) {
                engine = 1;
                if (instance_exists(objPlayerMouse))
                    SteamIncStat("Car", 1);
                audio_play_sound(sndCarEngine, 0, false);
            }
            if (image_index < 12) {
                image_index += 0.2;
            } else {
                objEffector.next = 1;
                room_persistent = 0;
                if (objEffector.fade == 0) {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                        SteamSetAchievement("ACH_BATMAN");
                }
                objEffector.fade = 1;

                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer) {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance) {
                        objEffector.newsong = 1;
                        objEffector.song = working_directory + "\\Static.mp3";
                    } else {
                        objEffector.newsong = 1;
                        objEffector.song = working_directory + "\\Miami2.mp3";
                        if (room == rmBuildingFloor1)
                            objEffector.song = working_directory + "\\Static.mp3";
                        if (room == rmPhoneHomEntranceBiker)
                            objEffector.song = working_directory + "\\ItsSafeNow.mp3";
                    }
                } else {
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    if (image_angle == 270 && objEffector.fade == 0) {
        if (objPlayer.sprite_index == sprPWalkGirlfriend) {
            // do nothing
        } else objPlayer.sprite_index = sprPWalkUnarmed;
        if (objPlayer.x > x)
            objPlayer.x -= 3;
        if (image_index < 2)
            image_index += 0.2;
        if (objPlayer.x < x + 8) {
            if (image_index <= 2)
                audio_play_sound(sndCarClose, 0, false);
            if (engine == 0 && image_index > 7) {
                engine = 1;
                if (instance_exists(objPlayerMouse))
                    SteamIncStat("Car", 1);
                audio_play_sound(sndCarEngine, 0, false);
            }
            if (image_index < 12) {
                image_index += 0.2;
            } else {
                objEffector.next = 1;
                room_persistent = 0;
                if (objEffector.fade == 0) {
                    if (global.maskindex == 20 && room == rmApartment2Entrance)
                        SteamSetAchievement("ACH_BATMAN");
                }
                objEffector.fade = 1;

                if (instance_exists(objPlayerMouse) || room == rmHouse1Downstairs || room == rmBuildingFloor1 || room == rmPhoneHomEntranceBiker || room == rmHighballer || room == rmEurogamer) {
                    objEffector.nextroom = scrCarNextRoom(room);
                    if (room == rmTrainstationEntrance) {
                        objEffector.newsong = 1;
                        objEffector.song = working_directory + "\\Static.mp3";
                    } else {
                        objEffector.newsong = 1;
                        objEffector.song = working_directory + "\\Miami2.mp3";
                        if (room == rmBuildingFloor1)
                            objEffector.song = working_directory + "\\Static.mp3";
                        if (room == rmPhoneHomEntranceBiker)
                            objEffector.song = working_directory + "\\ItsSafeNow.mp3";
                    }
                } else {
                    objEffector.nextroom = nextroom;
                    objEffector.newsong = 1;
                    objEffector.song = scrGetSong(room);
                }
            }
        }
    }
    exit
} else image_index = index;
mask_index = sprCarMask;
if (room == rmStore1 || room == rmPizzaHut1 || room == rmVideoStore1 || room == rmBar1 || room == rmStore2 || room == rmPizzaHut2 || room == rmVideoStore2 || room == rmBar2 || room == rmStore3 || room == rmPizzaHut3 || room == rmVideoStore3 || room == rmBar3) {
    // do nothing
} else {
    if (global.done == 0) {
        mask_index = sprite_index;
        exit;
    }
    if (instance_exists(objPlayerMouse) && global.done == 0) {
        mask_index = sprite_index;
        exit;
    }
}

if (point_distance(x, y, objPlayer.x, objPlayer.y) < 80) {
    if (image_index == 0)
        audio_play_sound(sndCarOpen, 0, false);
    if (image_index < 2)
        image_index += 0.2;
} else {
    if (image_index <= 0.2 && image_index > 0)
        audio_play_sound(sndCarClose, 0, false);
    if (image_index > 0.1) {
        image_index -= 0.2;
    } else image_index = 0;
}

