scrFreeSurfaces()
if global.resetstory=1 {
scrResetStory()
} else {set_automatic_draw(true)}
global.levels[scrGetCurrentLevel()-1]=1
scrSaveUnlocked()
alarm[0]=300
pointx=-192
i=0
repeat (string_length(global.title)) {
amount[i]=1
on[i]=0
i+=1
}
dir=90

fade=0
c_amount=0
repeat (5) instance_create(random(room_width),0,objHouse)

i=0
repeat (5) {
palmx[i]=(room_width/4)*i
palmindex[i]=floor(random(6))
i+=1
}


hint[0]="TIP: MELEE WEAPONS ARE SILENT"
hint[1]="TIP: GUNS ATTRACT ATTENTION"
hint[2]="TIP: YOU CAN THROW WEAPONS"
hint[3]="TIP: DON'T BE AFRAID OF DYING"
hint[4]="TIP: RECKLESSNESS IS REWARDED"
hint[5]="TIP: ENEMIES ARE PREDICTABLE"
hint[6]="TIP: USE DOORS STRATEGICALLY"
hint[7]="TIP: VARIATION IS REWARDING"
hint[8]="TIP: HIGH SCORES UNLOCK MASKS"
hint[9]="TIP: FOLLOW THE RED ARROWS"
hint[10]="TIP: PAY ATTENTION TO DETAILS"
hint[11]="TIP: BE FAST AND EFFICIENT"
hint[12]="TIP: YOU CAN SHOOT THROUGH SOME WALLS"
hint[13]="TIP: FINISH OFF FALLEN ENEMIES"

myhint=floor(random(14))
