global.myscore=0
drawscore=0
i=0
room_set_persistent(room,true)
room_persistent=true
scrInitPathFinding()
if room=rmSequence1 or room=rmSequence2 or room=rmSequence3 or room=rmSequence4 or room=rmSequence5 or room=rmSequence6 or room=rmSequence7 or room=rmSequence8 {if !instance_exists(objPlayer) instance_create(336,268,objPlayerMouseHouse)}
/*while file_exists("ccReplay"+room_get_name(room)+string(i)+".avi") i+=1
vcapture_begin( window_handle(), "ccReplay"+room_get_name(room)+string(i)+".avi", 30)
global.videofile="ccReplay"+room_get_name(room)+string(i)+".avi"*/
/* */
/*  */
