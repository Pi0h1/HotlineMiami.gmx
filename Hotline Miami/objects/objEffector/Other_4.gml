if !instance_exists(objMaskMenu) {if global.maskindex=14 bamount=1}
scrSaveBonusList()
i=0
room_set_persistent(room,true)
room_persistent=true
if global.paused=0 {scrInitPathFinding() if !instance_exists(objMaskMenu) scrCheckpoint()} else global.paused=0
/*while file_exists("ccReplay"+room_get_name(room)+string(i)+".avi") i+=1
vcapture_begin( window_handle(), "ccReplay"+room_get_name(room)+string(i)+".avi", 30)
global.videofile="ccReplay"+room_get_name(room)+string(i)+".avi"
/* */
/*  */
