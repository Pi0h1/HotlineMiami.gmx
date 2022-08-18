/// scrInitSequence(chapter, level)
//if global.resetstory exit

var whatLevelIsThis = argument0;

global.done     = 0;
global.phone    = 0;
global.package  = 0;
global.revisit  = 0;

global.level    = argument1;
global.pretitle = global.chapterTitle[whatLevelIsThis];
global.title    = global.levelTitle[whatLevelIsThis];

if room = rmSequence12b {
    global.sequence = rmSequence12;
} else {
    global.sequence = room_get_name(room);
}
