global.title    =   argument0
global.pretitle =   argument1
global.sequence =   argument3
if intro=0 { global.level=argument2 } else { global.level=argument3 }
if intro=0 { song = working_directory+"\"+argument4+".mp3" } else { song = working_directory+"\DeepCover.mp3"}

if room=rmInit{
room=argument2
}
