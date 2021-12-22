/*=========================================================================================================================

    This script starts a level alongside all the parameters it needs.
    
    ("name", "chapter", rmLevel, rmSequence(this is the point in the campaign the level takes place), "MusicFile");
    
    For example:
    
    scrStartLevel("THE METRO", "PRELUDE", rmTrainstationEntrance, rmSequence1, "Paris2");
    scrStartLevel("NO TALK", "FIRST CHAPTER", rmApartment1Entrance, rmSequence2, "Crystals");

=========================================================================================================================*/

global.title    =   argument0 // Name
global.pretitle =   argument1 // Chapter
global.sequence =   argument3 // Sequence

// Did the player select "Start with intro?"
// if not, start the level. Otherwise start the sequence

if intro=0 { global.level=argument2 } else { global.level=argument3 } 

// Did the player select "Start with intro?"
// if not, play the level's music. Otherwise play Deep Cover

if intro=0 { song = working_directory+"\"+argument4+".mp3" } else { song = working_directory+"\DeepCover.mp3"} 


// If we're on rmInit and this script is executed, change the current room to the current level.
// This allows for quick testing.
if room=rmInit{
room=argument2
}
