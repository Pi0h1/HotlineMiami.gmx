switch (argument0) {
    case sprPAttackKnife       : return true ; break;
    case wpnAttackBat          : return true ; break;
    case sprPAttackCrowbar     : return true ; break;
    case sprPAttackPan         : return true ; break;
    // case sprPAttackBag         : return true ; break;
    case sprPAttackPot         : return true ; break;
    case sprPAttackBoilingPot  : return true ; break;
    case sprPAttackMachete     : return true ; break;
    case sprPAttackSledge      : return true ; break;
    case sprPAttackNightStick  : return true ; break;
    case sprPAttackPipe        : return true ; break;
    case sprPAttackClub        : return true ; break;
    case sprPAttackSword       : return true ; break;
    case sprPAttackAxe         : return true ; break;
    case sprPAttackPool        : return true ; break;
    case sprPAttackPoolBroke   : return true ; break;
    case sprPAttackUnarmed     : if global.maskindex=2 return true ; break;
    default: return false;
}
