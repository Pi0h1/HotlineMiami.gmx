room_persistent=0
objEffector.next=1 
objEffector.fade=1 
if instance_exists(objPlayerJacket) or 
room=rmHouse1Downstairs or
room=rmBuildingFloor1 or 
room=rmPhoneHomEntranceBiker or 
room=rmHighballer or 
room=rmEurogamer{
objEffector.nextroom=scrCarNextRoom(room) 
if room=rmTrainstationEntrance {
    objEffector.newsong=1 objEffector.song=working_directory+"\Static.mp3"
    } else {
    objEffector.newsong=1 objEffector.song=working_directory+"\Miami2.mp3" 
    if room=rmBuildingFloor1 objEffector.song=working_directory+"\Static.mp3" 
    if room=rmPhoneHomEntranceBiker objEffector.song=working_directory+"\ItsSafeNow.mp3"
    }
    } else {
    objEffector.nextroom=nextroom objEffector.newsong=1 objEffector.song=scrGetSong(room)
}
