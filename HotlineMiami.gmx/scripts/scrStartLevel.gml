/// scrStartLevel(level, room, sequence, trackname)
/*=============================================================================
    This script starts a level alongside all the parameters it needs.
    Sequence refers to the point in the campaign in which the level takes place
=================================================================================*/

var whatLevelIsThis = argument0;

global.title    =   global.levelTitle[whatLevelIsThis] // Name argument0
global.pretitle =   global.chapterTitle[whatLevelIsThis] // Chapter argument1
global.sequence =   argument2 // Sequence

// Did the player select "Start with intro?"
// if not, start the level. Otherwise start the sequence

if intro=0 { global.level=argument1 } else { global.level=argument2 } 

// Did the player select "Start with intro?"
// if not, play the level's music. Otherwise play Deep Cover

if intro=0 { song = working_directory+"\"+argument3+".mp3" } else { song = working_directory+"\DeepCover.mp3"} 

// If we're on rmInit and this script is executed, change the current room to the current level.
// This allows for quick testing.
if room=rmInit{
room=argument1
}
