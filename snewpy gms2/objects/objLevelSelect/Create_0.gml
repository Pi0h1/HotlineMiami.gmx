mapdir=0
addx=0
intro=0
newsong=1
global.levels[20]=1
global.levels[21]=1
if global.xbox=1 {
scrInitXboxButtons()
}
wait=0
scrFreeSurfaces()
level[0]=sprTrainstation
level[1]=sprApartment1
level[2]=sprApartment2
level[3]=sprHouse1
level[4]=sprHouse5
level[5]=sprHouse2
level[6]=sprHotel
level[7]=sprBuilding
level[8]=sprHouse3
level[9]=sprSwatLevel
level[10]=sprHouse4
level[11]=sprOffice
level[12]=sprHospital
level[13]=sprPoliceHQ
level[14]=sprBossClub
level[15]=sprMansion
level[16]=sprNoodleShop
level[17]=sprArcade
level[18]=sprPhoneLevel
level[19]=sprBossClub2
level[20]=sprVenusLevel
level[21]=sprEurogamerLogo
title[0]="THE METRO"
title[1]="NO TALK"
title[2]="OVERDOSE"
title[3]="DECADENCE"
title[4]="TENSION"
title[5]="FULL HOUSE"
title[6]="CLEAN HIT"
title[7]="NEIGHBORS"
title[8]="PUSH IT"
title[9]="CRACKDOWN"
title[10]="HOT&HEAVY"
title[11]="DEADLINE"
title[12]="TRAUMA"
title[13]="ASSAULT"
title[14]="VENGEANCE"
title[15]="SHOWDOWN"
title[16]="SAFEHOUSE"
title[17]="FUN&GAMES"
title[18]="PRANKCALL"
title[19]="RESOLUTION"
title[20]="HIGHBALL"
title[21]="EXPOSED"
chapter[0]="PRELUDE"
chapter[1]="CHAPTER ONE"
chapter[2]="CHAPTER TWO"
chapter[3]="CHAPTER THREE"
chapter[4]="CHAPTER FOUR"
chapter[5]="CHAPTER FIVE"
chapter[6]="CHAPTER SIX"
chapter[7]="CHAPTER SEVEN"
chapter[8]="CHAPTER EIGHT"
chapter[9]="CHAPTER NINE"
chapter[10]="CHAPTER TEN"
chapter[11]="CHAPTER ELEVEN"
chapter[12]="CHAPTER TWELVE"
chapter[13]="CHAPTER THIRTEEN"
chapter[14]="CHAPTER FOURTEEN"
chapter[15]="FINAL CHAPTER"
chapter[16]="CHAPTER SIXTEEN"
chapter[17]="CHAPTER SEVENTEEN"
chapter[18]="CHAPTER EIGHTEEN"
chapter[19]="CHAPTER NINETEEN"
chapter[20]="BONUS CHAPTER"
chapter[21]="SPECIAL CHAPTER"
if global.levels[15]=1 {if file_exists(working_directory+"\\exposed.lvl") levels=21 else levels=20} else levels=15
select=0
repeats=16
myrepeats=1
x=room_width/2
y=room_height*0.53

/*i=0
repeat (12) {
global.levels[i]=1
i+=1
}*/
/*i=0
repeat (20) {
global.levels[i]=1
i+=1
}*/

i=0
repeat (20) {
if global.levels[i]=0 {if select=0 and global.levels[1]=1 select=i-1 title[i]="LOCKED"}
i+=1
}

restart=0
dir=90

fade=0
c_amount=0
/*repeat (5) instance_create(random(room_width),0,objHouse)

i=0
repeat (5) {
palmx[i]=(room_width/4)*i
palmindex[i]=floor(random(6))
i+=1
}*/

global.i=0
repeat (10) {
my_id=instance_create(x,y,objPalmTree)
with my_id {repeat (global.i*45) amount*=1.01}
global.i+=1
}
alarm[0]=45
state=0
/* */
/*  */
