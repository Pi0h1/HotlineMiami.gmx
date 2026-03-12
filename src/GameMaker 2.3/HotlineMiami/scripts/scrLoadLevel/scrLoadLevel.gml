/// @description  scrLoadLevel("NAME", "CHAPTER", "Song.mp3", rmFirstFloor, rmSequence2)
/// @param "NAME"
/// @param  "CHAPTER"
/// @param  "Song.mp3"
/// @param  rmFirstFloor
/// @param  rmSequence2
function scrLoadLevel(argument0, argument1, argument2, argument3, argument4) {
	// Example loadLevel("NO TALK", "FIRST CHAPTER", "Crystals.mp3", rmApartment1Entrance, rmSequence2)
	_title      = argument0;
	_preTitle   = argument1;
	_song       = working_directory+"\\"+argument2;
	_startArea  = argument3;
	_sequence   = argument4;
    
	global.title    = _title;
	global.pretitle = _preTitle;
	song            = _song
	global.level    = _startArea;
	global.sequence = _sequence;



}
