current=0

dir=random(360)
factor=0
fade=0
c_amount=0

if global.revisit=0 {
repeat (5) instance_create(random(room_width),0,objHouse)
} else {
repeat (5) instance_create(random(room_width),0,objHouseReturn)
}

i=0
repeat (5) {
palmx[i]=(room_width/4)*i
palmindex[i]=floor(random(6))
i+=1
}

wait=240

//if global.sequence=rmSequence12bDownstairs song=working_directory+"\Static.mp3" else song=working_directory+"\Daisuke.mp3"
