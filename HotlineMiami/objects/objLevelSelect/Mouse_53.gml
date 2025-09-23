if (state == 0 && select < 20) {
    state = 1;
    exit;
}
if (global.levels[select] == 1)
    fade = 1;
else exit;

if (!intro) {
    if (select == 0) {
        global.sequence = rmSequence1;
        global.level = rmTrainstationEntrance;
        global.pretitle = "PRELUDE";
        global.title = "THE METRO";
        song = working_directory + "\\Paris2.mp3";
    }
    if (select == 1) {
        global.sequence = rmSequence2;
        global.level = rmApartment1Entrance;
        global.pretitle = "FIRST CHAPTER";
        global.title = "NO TALK";
        song = working_directory + "\\Crystals.mp3";
    }
    if (select == 2) {
        global.sequence = rmSequence3;
        global.level = rmApartment2Entrance;
        global.pretitle = "SECOND CHAPTER";
        global.title = "OVERDOSE";
        song = working_directory + "\\Hotline.mp3";
    }
    if (select == 3) {
        global.sequence = rmSequence4;
        global.level = rmHouse1Downstairs;
        global.pretitle = "THIRD CHAPTER";
        global.title = "DECADENCE";
        song = working_directory + "\\Hydrogen.mp3";
    }
    if (select == 4) {
        global.sequence = rmSequence5;
        global.level = rmHouse5Downstairs;
        global.pretitle = "FOURTH CHAPTER";
        global.title = "TENSION";
        song = working_directory + "\\Paris2.mp3";
    }
    if (select == 5) {
        global.sequence = rmSequence6;
        global.level = rmHouse2Downstairs;
        global.pretitle = "FIFTH CHAPTER";
        global.title = "FULL HOUSE";
        song = working_directory + "\\Crystals.mp3";
    }

    if (select == 6) {
        global.sequence = rmSequence7;
        global.level = rmHotelEntrance;
        global.pretitle = "SIXTH CHAPTER";
        global.title = "CLEAN HIT";
        song = working_directory + "\\Hotline.mp3";
    }

    if (select == 7) {
        global.sequence = rmSequence8;
        global.level = rmBuildingFloor1;
        global.pretitle = "SEVENTH CHAPTER";
        global.title = "NEIGHBORS";
        song = working_directory + "\\Hydrogen.mp3";
    }

    if (select == 8) {
        global.sequence = rmSequence9;
        global.level = rmHouse3Downstairs;
        global.pretitle = "EIGHTH CHAPTER";
        global.title = "PUSH IT";
        song = working_directory + "\\Perturbator.mp3";
    }

    if (select == 9) {
        global.sequence = rmSequence10;
        global.level = rmSwatDownstairs;
        global.pretitle = "NINTH CHAPTER";
        global.title = "CRACKDOWN";
        song = working_directory + "\\Crystals.mp3";
    }

    if (select == 10) {
        global.sequence = rmSequence11;
        global.level = rmHouse4Middle;
        global.pretitle = "TENTH CHAPTER";
        global.title = "HOT&HEAVY";
        song = working_directory + "\\Hotline.mp3";
    }
    if (select == 11) {
        global.sequence = rmSequence12;
        global.level = rmOfficeEntrance;
        global.pretitle = "ELEVENTH CHAPTER";
        global.title = "DEADLINE";
        song = working_directory + "\\Hydrogen.mp3";
    }
    if (select == 12) {
        global.sequence = rmSequence12bDownstairs;
        global.level = rmHospitalTitle;
        global.pretitle = "TWELFTH CHAPTER";
        global.title = "TRAUMA";
        song = working_directory + "\\Flatline.mp3";
    }
    if (select == 13) {
        global.sequence = rmSequence13;
        global.level = rmPoliceHQFloor1;
        global.pretitle = "THIRTEENTH CHAPTER";
        global.title = "ASSAULT";
        song = working_directory + "\\Knock.mp3";
    }
    if (select == 14) {
        global.sequence = rmSequence14;
        global.level = rmBossClubFloor1;
        global.pretitle = "FOURTEENTH CHAPTER";
        global.title = "VENGEANCE";
        song = working_directory + "\\InnerAnimal.mp3";
    }
    if (select == 15) {
        global.sequence = rmChapter;
        global.level = rmMansionEntrance;
        global.pretitle = "FINAL CHAPTER";
        global.title = "SHOWDOWN";
        song = working_directory + "\\TurfMain.mp3";
    }
    if (select == 16) {
        global.sequence = rmMCBar;
        global.level = rmNoodleShop;
        global.pretitle = "SIXTEENTH CHAPTER";
        global.title = "SAFEHOUSE";
        song = working_directory + "\\ToTheTop.mp3";
    }
    if (select == 17) {
        global.sequence = rmMCSequence2;
        global.level = rmArcadeDownstairs;
        global.pretitle = "SEVENTEENTH CHAPTER";
        global.title = "FUN&GAMES";
        song = working_directory + "\\Musikk2.mp3";
    }
    if (select == 18) {
        global.sequence = rmMCSequence3;
        global.level = rmPhoneHomEntranceBiker;
        global.pretitle = "EIGHTEENTH CHAPTER";
        global.title = "PRANKCALL";
        song = working_directory + "\\Knock.mp3";
    }
    if (select == 19) {
        global.sequence = rmMCSequence4;
        global.level = rmJanitors;
        global.pretitle = "NINETEENTH CHAPTER";
        global.title = "RESOLUTION";
        song = working_directory + "\\InnerAnimal.mp3";
    }
    if (select == 20) {
        global.sequence = rmChapter;
        global.level = rmHighballer;
        global.pretitle = "BONUS CHAPTER";
        global.title = "HIGHBALL";
        song = working_directory + "\\Perturbator.mp3";
    }
    if (select == 21) {
        global.sequence = rmChapter;
        global.level = rmEurogamer;
        global.pretitle = "SPECIAL CHAPTER";
        global.title = "EXPOSED";
        song = working_directory + "\\ToTheTop.mp3";
    }
} else {
    if (select == 0) {
        global.sequence = rmSequence1;
        global.level = rmSequence1;
        global.pretitle = "PRELUDE";
        global.title = "THE METRO";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 1) {
        global.sequence = rmSequence2;
        global.level = rmSequence2;
        global.pretitle = "FIRST CHAPTER";
        global.title = "NO TALK";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 2) {
        global.sequence = rmSequence3;
        global.level = rmSequence3;
        global.pretitle = "SECOND CHAPTER";
        global.title = "OVERDOSE";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 3) {
        global.sequence = rmSequence4;
        global.level = rmSequence4;
        global.pretitle = "THIRD CHAPTER";
        global.title = "DECADENCE";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 4) {
        global.sequence = rmSequence5;
        global.level = rmSequence5;
        global.pretitle = "FOURTH CHAPTER";
        global.title = "TENSION";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 5) {
        global.sequence = rmSequence6;
        global.level = rmSequence6;
        global.pretitle = "FIFTH CHAPTER";
        global.title = "FULL HOUSE";
        song = working_directory + "\\DeepCover.mp3";
    }

    if (select == 6) {
        global.sequence = rmSequence7;
        global.level = rmSequence7;
        global.pretitle = "SIXTH CHAPTER";
        global.title = "CLEAN HIT";
        song = working_directory + "\\DeepCover.mp3";
    }

    if (select == 7) {
        global.sequence = rmSequence8;
        global.level = rmSequence8;
        global.pretitle = "SEVENTH CHAPTER";
        global.title = "NEIGHBORS";
        song = working_directory + "\\DeepCover.mp3";
    }

    if (select == 8) {
        global.sequence = rmSequence9;
        global.level = rmSequence9;
        global.pretitle = "EIGHTH CHAPTER";
        global.title = "PUSH IT";
        song = working_directory + "\\DeepCover.mp3";
    }

    if (select == 9) {
        global.sequence = rmSequence10;
        global.level = rmSequence10;
        global.pretitle = "NINTH CHAPTER";
        global.title = "CRACKDOWN";
        song = working_directory + "\\DeepCover.mp3";
    }

    if (select == 10) {
        global.sequence = rmSequence11;
        global.level = rmSequence11;
        global.pretitle = "TENTH CHAPTER";
        global.title = "HOT&HEAVY";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 11) {
        global.sequence = rmSequence12;
        global.level = rmSequence12;
        global.pretitle = "ELEVENTH CHAPTER";
        global.title = "DEADLINE";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 12) {
        global.sequence = rmSequence12bDownstairs;
        global.level = rmHospitalCutscene;
        global.pretitle = "TWELFTH CHAPTER";
        global.title = "TRAUMA";
        song = working_directory + "\\Flatline.mp3";
    }
    if (select == 13) {
        global.sequence = rmSequence13Downstairs;
        global.level = rmSequence13Downstairs;
        global.pretitle = "THIRTEENTH CHAPTER";
        global.title = "ASSAULT";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 14) {
        global.sequence = rmSequence14;
        global.level = rmSequence14;
        global.pretitle = "FOURTEENTH CHAPTER";
        global.title = "VENGEANCE";
        song = working_directory + "\\DeepCover.mp3";
    }
    if (select == 15) {
        global.sequence = rmChapter;
        global.level = rmMansionEntrance;
        global.pretitle = "FIFTEENTH CHAPTER";
        global.title = "SHOWDOWN";
        song = working_directory + "\\TurfMain.mp3";
    }
    if (select == 16) {
        global.sequence = rmMCBar;
        global.level = rmRewind;
        global.pretitle = "SIXTEENTH CHAPTER";
        global.title = "SAFEHOUSE";
        newsong = 0;
        song = working_directory + "\\ToTheTop.mp3";
    }
    if (select == 17) {
        global.sequence = rmMCSequence2;
        global.level = rmMCSequence2;
        global.pretitle = "SEVENTEENTH CHAPTER";
        global.title = "FUN&GAMES";
        song = working_directory + "\\ItsSafeNow.mp3";
    }
    if (select == 18) {
        global.sequence = rmMCSequence3;
        global.level = rmMCSequence3;
        global.pretitle = "EIGHTEENTH CHAPTER";
        global.title = "PRANKCALL";
        song = working_directory + "\\ItsSafeNow.mp3";
    }
    if (select == 19) {
        global.sequence = rmMCSequence4;
        global.level = rmMCSequence4;
        global.pretitle = "NINETEENTH CHAPTER";
        global.title = "RESOLUTION";
        song = working_directory + "\\ItsSafeNow.mp3";
    }
    if (select == 20) {
        global.sequence = rmChapter;
        global.level = rmHighballer;
        global.pretitle = "BONUS CHAPTER";
        global.title = "HIGHBALL";
        song = working_directory + "\\Perturbator.mp3";
    }
    if (select == 21) {
        global.sequence = rmChapter;
        global.level = rmEurogamer;
        global.pretitle = "SPECIAL CHAPTER";
        global.title = "EXPOSED";
        song = working_directory + "\\ToTheTop.mp3";
    }
}

if (intro) {
    mylevel = global.level;
    if (select == 15)
        mylevel = rmChapter;
}

