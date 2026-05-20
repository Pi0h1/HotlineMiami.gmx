function reEnableArrows() {
	switch (room) {
		case rmBuildingFloor1: {if isAllEnemiesDead {global.done1 = 1; if global.done2 = 0 {with objTeleporter {if nextroom=room_previous(room) sprite=sprArrowGray}} else {with objTeleporter {if nextroom=room_previous(room) sprite=sprGoArrow}}}} break;
		case rmBuildingFloor2: {if isAllEnemiesDead {global.done2 = 1; if global.done3 = 0 {with objTeleporter {if nextroom=room_previous(room) sprite=sprArrowGray}} else {with objTeleporter {if nextroom=room_previous(room) sprite=sprGoArrow}}}} break;
		case rmBuildingFloor3: {if isAllEnemiesDead {global.done3 = 1; if global.done4 = 0 {with objTeleporter {if nextroom=room_previous(room) sprite=sprArrowGray}} else {with objTeleporter {if nextroom=room_previous(room) sprite=sprGoArrow}}}} break;
	}
}

function setLevelComplete() {
	instance_create(x,y,objLevelComplete);
	global.done = 1;
}

function setLevelComplete_Showdown(){
	if !instance_exists(objBoss) {
	with objDoorH {if solid=1 solid=0}
	with objBossPhone {if on=0 {on=1 audio_play_sound(sndPhoneCall,0,true)}}
	if !instance_exists(objBossgun) and objBossPhone.talked=1 {{instance_create(x,y,objLevelComplete) global.done=1}}
	}
}

function scrCheckMissionComplete() {
	isPlayerExists			= (instance_exists(objPlayer));
	isAllEnemiesDead		= (instance_number(objEnemy) + instance_number(objKnockedOut) + instance_number(objEHideM16) <= 0);
	isBulletFree			= (instance_number(objEBullet) <= 0);
	isWinCondition			= (isPlayerExists && isBulletFree && (global.done <= 0) && isAllEnemiesDead);
	// Special conditions
	isDumpsterFull			= (instance_exists(objDumpster) && objDumpster.on);
	isFatmanDead			= (instance_exists(objFatmanShit) && (objFatmanShit.sprite_index == sprFatmanShitDie || objFatmanShit.sprite_index == sprFatmanShitDecapitated));
	isFloorsCleared			= (global.done1 + global.done2 + global.done3 + global.done4);
	isPickedUpCaseFile		= (instance_number(objFiles) <=0);
	
	switch (room) {
		case rmAlley:				if (isWinCondition	&& isDumpsterFull)		{setLevelComplete();}												break;
	    case rmApartment1Upstairs:	if (isWinCondition)							{setLevelComplete();}												break;
	    case rmApartment2Upstairs:	if (isWinCondition)							{setLevelComplete();}												break;
	    case rmHouse1Upstairs:		if (isWinCondition)							{setLevelComplete();}												break;
	    case rmHouse2Upstairs:		if (isWinCondition)							{setLevelComplete();}												break;
	    case rmHouse3Upstairs:		if (isWinCondition && isFloorsCleared == 3)	{setLevelComplete();}												break;
	    case rmHouse3Downstairs:	if (isWinCondition && isFloorsCleared == 3)	{setLevelComplete();}												break;
	    case rmHouse3Basement:		if (isWinCondition && isFloorsCleared == 3)	{setLevelComplete();}												break;
		case rmOfficeEntrance:		if (isWinCondition && isFloorsCleared == 3)	{setLevelComplete();}												break;
	    case rmOfficeFloor2:		if (isWinCondition && isFloorsCleared == 3)	{setLevelComplete();}												break;
	    case rmOfficeFloor3:		if (isWinCondition && isFloorsCleared == 3)	{setLevelComplete();}												break;
	    case rmHouse4Left:			if (isWinCondition && isFloorsCleared == 4)	{setLevelComplete();}												break;
	    case rmHouse4Middle:		if (isWinCondition && isFloorsCleared == 4)	{setLevelComplete();}												break;
	    case rmHouse4Right:			if (isWinCondition && isFloorsCleared == 4)	{setLevelComplete();}												break;
	    case rmHouse4Upstairs:		if (isWinCondition && isFloorsCleared == 4)	{setLevelComplete();}												break;
	    case rmHouse5Upstairs:		if (isWinCondition)							{setLevelComplete();}												break;
		case rmHotelSuite:			if (isWinCondition && isFatmanDead)			{setLevelComplete();}												break;
		case rmPoliceHQFloor3:		if (isWinCondition && isPickedUpCaseFile)	{setLevelComplete();}												break;
		case rmMansionMainHall:		if (isWinCondition)							{setLevelComplete_Showdown();}										break;
		case rmHighballer:			if (isWinCondition)							{setLevelComplete();}												break;
	    case rmEurogamer:			if (isWinCondition)							{setLevelComplete();}												break;
	    case rmArcadeUpstairs:		if (isWinCondition)							{setLevelComplete();}												break;
		case rmBuildingFloor1:		reEnableArrows();	if isFloorsCleared == 4 {if (isBulletFree && global.done <= 0) {global.done = 1;}}			break;
		case rmBuildingFloor2:		reEnableArrows();	if isFloorsCleared == 4 {if (isBulletFree && global.done <= 0) {global.done = 1;}}			break;
		case rmBuildingFloor3:		reEnableArrows();	if isFloorsCleared == 4 {if (isBulletFree && global.done <= 0) {global.done = 1;}}			break;
		case rmBuildingFloor4:		if (isWinCondition) {global.done4 = 1}																			break;
		default:					/*Do nothing*/																									break;
	}
}
