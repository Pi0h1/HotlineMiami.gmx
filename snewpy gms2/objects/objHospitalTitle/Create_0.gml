global.level=rmHospitalCutscene
scrFreeSurfaces()
if global.resetstory=1 {
scrResetStory()
} else {set_automatic_draw(true)}

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


hint[0]="TIP: YOU'VE DONE ENOUGH"
hint[1]="TIP: WAKE UP"
hint[2]="TIP: TIME TO LET GO"
hint[3]="TIP: DON'T DO ANYTHING RASH"
hint[4]="TIP: THINK THINGS OVER"
hint[5]="TIP: CONFESS TO THE POLICE"
hint[6]="TIP: PAY FOR YOUR CRIMES"
hint[7]="TIP: STOP BREATHING"
hint[8]="TIP: SHE'S ALREADY DEAD"
hint[9]="TIP: YOU'RE ALL ALONE NOW"
hint[10]="TIP: NO MORE PAIN"

myhint=floor(random(11))
