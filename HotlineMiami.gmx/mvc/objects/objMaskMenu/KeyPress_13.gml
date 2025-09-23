if (global.xbox == 1)
    exit;
if (global.masks[select] == 0)
    exit;
if (on == 0)
    exit;
on = 0;
with (objPlayer) {
    reload = 30;
    image_index = 0;
    image_speed = 0.15;
    sprite_index = sprPMaskSlip;
}
switch (select) {
    case 0:  objPlayer.masksprite = sprRoosterMask; break;
    case 1:  objPlayer.masksprite = sprOwlMask; break;
    case 2:  objPlayer.masksprite = sprTigerMask; break;
    case 3:  objPlayer.masksprite = sprPigMask; break;
    case 4:  objPlayer.masksprite = sprHorseMask; break;
    case 5:  objPlayer.masksprite = sprRabbitMask; break;
    case 6:  objPlayer.masksprite = sprWolfMask; break;
    case 7:  objPlayer.masksprite = sprGiraffeMask; break;
    case 8:  objPlayer.masksprite = sprCollieMask; break;
    case 9:  objPlayer.masksprite = sprElephantMask; break;
    case 10: objPlayer.masksprite = sprCamelMask; break;
    case 11: objPlayer.masksprite = sprMonkeyMask; break;
    case 12: objPlayer.masksprite = sprUnicornMask; break;
    case 13: objPlayer.masksprite = sprFrogMask; break;
    case 14: objPlayer.masksprite = sprMoleMask; break;
    case 15: objPlayer.masksprite = sprFoxMask; break;
    case 16: objPlayer.masksprite = sprPantherMask; break;
    case 17: objPlayer.masksprite = sprOctopusMask; break;
    case 18: objPlayer.masksprite = sprChamelionMask; break;
    case 19: objPlayer.masksprite = sprFishMask; break;
    case 20: objPlayer.masksprite = sprBatMask; break;
    case 21: objPlayer.masksprite = sprWalrusMask; break;
    case 22: objPlayer.masksprite = sprCrocodileMask; break;
    case 23: objPlayer.masksprite = sprLocustMask; break;
    case 24: objPlayer.masksprite = sprCobraMask; break;
    case 25: objPlayer.masksprite = sprRatMask; break;
}
global.usedmask[select] = 1;
scrSaveAchievements();
global.maskindex = select;
objPlayer.maskindex = select;
if (file_exists(working_directory + "\\mask.nfo"))
    file_delete(working_directory + "\\mask.nfo");
file = file_text_open_write(working_directory + "\\mask.nfo");
file_text_write_string(file, string(select));
file_text_close(file);

