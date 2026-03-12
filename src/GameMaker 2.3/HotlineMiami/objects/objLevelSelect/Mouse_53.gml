if state=0 and select<20 {state=1 exit}
if global.levels[select]=1 fade=1 else exit
if (intro == 0) {
    switch (select) {
        case 0:     scrLoadLevel("THE METRO",   "PRELUDE",              "Paris2.mp3",       rmTrainstationEntrance,  rmSequence1);              break;
        case 1:     scrLoadLevel("NO TALK",     "FIRST CHAPTER",        "Crystals.mp3",     rmApartment1Entrance,    rmSequence2);              break;
        case 2:     scrLoadLevel("OVERDOSE",    "SECOND CHAPTER",       "Hotline.mp3",      rmApartment2Entrance,    rmSequence3);              break;
        case 3:     scrLoadLevel("DECADENCE",   "THIRD CHAPTER",        "Hydrogen.mp3",     rmHouse1Downstairs,      rmSequence4);              break;
        case 4:     scrLoadLevel("TENSION",     "FOURTH CHAPTER",       "Paris2.mp3",       rmHouse5Downstairs,      rmSequence5);              break;
        case 5:     scrLoadLevel("FULL HOUSE",  "FIFTH CHAPTER",        "Crystals.mp3",     rmHouse2Downstairs,      rmSequence6);              break;
        case 6:     scrLoadLevel("CLEAN HIT",   "SIXTH CHAPTER",        "Hotline.mp3",      rmHotelEntrance,         rmSequence7);              break;
        case 7:     scrLoadLevel("NEIGHBORS",   "SEVENTH CHAPTER",      "Hydrogen.mp3",     rmBuildingFloor1,        rmSequence8);              break;
        case 8:     scrLoadLevel("PUSH IT",     "EIGHTH CHAPTER",       "Perturbator.mp3",  rmHouse3Downstairs,      rmSequence9);              break;
        case 9:     scrLoadLevel("CRACKDOWN",   "NINTH CHAPTER",        "Crystals.mp3",     rmSwatDownstairs,        rmSequence10);             break;
        case 10:    scrLoadLevel("HOT&HEAVY",   "TENTH CHAPTER",        "Hotline.mp3",      rmHouse4Middle,          rmSequence11);             break;
        case 11:    scrLoadLevel("DEADLINE",    "ELEVENTH CHAPTER",     "Hydrogen.mp3",     rmOfficeEntrance,        rmSequence12);             break;
        case 12:    scrLoadLevel("TRAUMA",      "TWELFTH CHAPTER",      "Flatline.mp3",     rmHospitalTitle,         rmSequence12bDownstairs);  break;
        case 13:    scrLoadLevel("ASSAULT",     "THIRTEENTH CHAPTER",   "Knock.mp3",        rmPoliceHQFloor1,        rmSequence13);             break;
        case 14:    scrLoadLevel("VENGEANCE",   "FOURTEENTH CHAPTER",   "InnerAnimal.mp3",  rmBossClubFloor1,        rmSequence14);             break;
        case 15:    scrLoadLevel("SHOWDOWN",    "FINAL CHAPTER",        "TurfMain.mp3",     rmMansionEntrance,       rmChapter);                break;
        case 16:    scrLoadLevel("SAFEHOUSE",   "SIXTEENTH CHAPTER",    "ToTheTop.mp3",     rmNoodleShop,            rmMCBar);                  break;
        case 17:    scrLoadLevel("FUN&GAMES",   "SEVENTEENTH CHAPTER",  "Musikk2.mp3",      rmArcadeDownstairs,      rmMCSequence2);            break;
        case 18:    scrLoadLevel("PRANKCALL",   "EIGHTEENTH CHAPTER",   "Knock.mp3",        rmPhoneHomEntranceBiker, rmMCSequence3);            break;
        case 19:    scrLoadLevel("RESOLUTION",  "NINETEENTH CHAPTER",   "InnerAnimal.mp3",  rmJanitors,              rmMCSequence4);            break;
        case 20:    scrLoadLevel("HIGHBALL",    "BONUS CHAPTER",        "Perturbator.mp3",  rmHighballer,            rmChapter);                break;
        case 21:    scrLoadLevel("EXPOSED",     "SPECIAL CHAPTER",      "ToTheTop.mp3",     rmEurogamer,             rmChapter);                break;
        case 22:    scrLoadLevel("COWBOY",      "COCAINE",              "\\CocaineCowboy_Music\\Lady.mp3",         rmTestLevel1,            rmChapter);                break;
        default:    scrLoadLevel("ERROR",       "INVALID CHAPTER",      "Crystals.mp3",     rmApartment1Entrance,    rmSequence2);              break;
    }
} else {
    switch (select) {
        case 0:     scrLoadLevel("THE METRO",   "PRELUDE",              "SilverLights.mp3",  rmDream1,               rmSequence1);              break;
        case 1:     scrLoadLevel("NO TALK",     "FIRST CHAPTER",        "DeepCover.mp3",     rmSequence2,            rmSequence2);              break;
        case 2:     scrLoadLevel("OVERDOSE",    "SECOND CHAPTER",       "DeepCover.mp3",     rmSequence3,            rmSequence3);              break;
        case 3:     scrLoadLevel("DECADENCE",   "THIRD CHAPTER",        "DeepCover.mp3",     rmSequence4,            rmSequence4);              break;
        case 4:     scrLoadLevel("TENSION",     "FOURTH CHAPTER",       "SilverLights.mp3",  rmDream2,               rmSequence5);              break;
        case 5:     scrLoadLevel("FULL HOUSE",  "FIFTH CHAPTER",        "DeepCover.mp3",     rmSequence6,            rmSequence6);              break;
        case 6:     scrLoadLevel("CLEAN HIT",   "SIXTH CHAPTER",        "DeepCover.mp3",     rmSequence7,            rmSequence7);              break;
        case 7:     scrLoadLevel("NEIGHBORS",   "SEVENTH CHAPTER",      "DeepCover.mp3",     rmSequence8,            rmSequence8);              break;
        case 8:     scrLoadLevel("PUSH IT",     "EIGHTH CHAPTER",       "SilverLights.mp3",  rmDream3,               rmSequence9);              break;
        case 9:     scrLoadLevel("CRACKDOWN",   "NINTH CHAPTER",        "DeepCover.mp3",     rmSequence10,           rmSequence10);             break;
        case 10:    scrLoadLevel("HOT&HEAVY",   "TENTH CHAPTER",        "DeepCover.mp3",     rmSequence11,           rmSequence11);             break;
        case 11:    scrLoadLevel("DEADLINE",    "ELEVENTH CHAPTER",     "DeepCover.mp3",     rmSequence12,           rmSequence12);             break;
        case 12:    scrLoadLevel("TRAUMA",      "TWELFTH CHAPTER",      "TurfIntro.mp3",     rmSequence12bDownstairs,rmSequence12bDownstairs);  break;
        case 13:    scrLoadLevel("ASSAULT",     "THIRTEENTH CHAPTER",   "TurfIntro.mp3",     rmSequence13,           rmSequence13);             break;
        case 14:    scrLoadLevel("VENGEANCE",   "FOURTEENTH CHAPTER",   "DeepCover.mp3",     rmSequence14,           rmSequence14);             break;
        case 15:    scrLoadLevel("SHOWDOWN",    "FINAL CHAPTER",        "ToTheTop.mp3",      rmMansionEntrance,      rmChapter);                break;
        case 16:    scrLoadLevel("SAFEHOUSE",   "SIXTEENTH CHAPTER",    "ItsSafeNow.mp3",    rmRewind,               rmMCBar);                  break;
        case 17:    scrLoadLevel("FUN&GAMES",   "SEVENTEENTH CHAPTER",  "ItsSafeNow.mp3",    rmMCSequence2,          rmMCSequence2);            break;
        case 18:    scrLoadLevel("PRANKCALL",   "EIGHTEENTH CHAPTER",   "ItsSafeNow.mp3",    rmMCSequence3,          rmMCSequence3);            break;
        case 19:    scrLoadLevel("RESOLUTION",  "NINETEENTH CHAPTER",   "ItsSafeNow.mp3",    rmMCSequence4,          rmMCSequence4);            break;
        case 20:    scrLoadLevel("HIGHBALL",    "BONUS CHAPTER",        "Perturbator.mp3",   rmHighballer,           rmChapter);                break;
        case 21:    scrLoadLevel("EXPOSED",     "SPECIAL CHAPTER",      "ToTheTop.mp3",      rmEurogamer,            rmChapter);                break;
        case 22:    scrLoadLevel("COWBOY",      "COCAINE",              "\\CocaineCowboy_Music\\Lady.mp3",          rmTestLevel1,           rmChapter);                break;
        default:    scrLoadLevel("ERROR",       "INVALID CHAPTER",      "DeepCover.mp3",     rmApartment1Entrance,   rmSequence2);              break;
    }
}

if intro=1 {mylevel=global.level if select = 15 mylevel = rmChapter;}

