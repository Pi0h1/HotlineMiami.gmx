dir=random(10000)
factor=0
mask=floor(random(6))
amount=180
maskamount=180
on=0
fade=0
currentmask=0
scrInitXboxButtons()
name[0]="Richard"
name[1]="Rasmus"
name[2]="Tony"
name[3]="Aubrey"
name[4]="Don Juan"
name[5]="Graham"
name[6]="Dennis"
name[7]="George"
name[8]="Ted"
name[9]="Rufus"
name[10]="Rami"
name[11]="Willem"
name[12]="Peter"
name[13]="Zack"
name[14]="Oscar"
name[15]="Rick"
name[16]="Brandon"
name[17]="Charlie"
name[18]="Louie"
name[19]="Phil"
name[20]="Nigel"
name[21]="Earl"
name[22]="Jones"
name[23]="Carl"
name[24]="Jake"
name[25]="Richter"
global.currentmask=0
if global.sequence=rmSequence1 global.currentmask=1
if global.sequence=rmSequence2 global.currentmask=2
if global.sequence=rmSequence3 global.currentmask=3
if global.sequence=rmSequence4 global.currentmask=4
if global.sequence=rmSequence5 global.currentmask=5
if global.sequence=rmSequence6 global.currentmask=6
if global.sequence=rmSequence7 global.currentmask=7
if global.sequence=rmSequence8 global.currentmask=8
if global.sequence=rmSequence9 global.currentmask=9
if global.sequence=rmSequence10 global.currentmask=10
if global.sequence=rmSequence11 global.currentmask=11
if global.sequence=rmSequence12 global.currentmask=12
if global.sequence=rmSequence13 global.currentmask=13
if global.sequence=rmSequence14 global.currentmask=14
if global.sequence=rmMCBar global.currentmask=15
if global.sequence=rmMCSequence2 global.currentmask=16
if global.sequence=rmMCSequence3 global.currentmask=17

/*if argument0=0 return 1 //metro
if argument0=1 return 2 //no talk
if argument0=2 return 3 //overdose
if argument0=3 return 4 //decadence
if argument0=4 return 5 //tension
if argument0=5 return 6 //full house
if argument0=6 return 7 //clean hit
if argument0=7 return 8 //neighbors
if argument0=8 return 9 //push it
if argument0=9 return 10 //crackdown
if argument0=10 return 11 //hot & heavy
if argument0=11 return 12 //deadline
if argument0=12 return -1 //trauma
if argument0=13 return 13 //assault
if argument0=14 return 14 //vengeance
if argument0=15 return -1 //showdown
if argument0=16 return 15 //safehouse
if argument0=17 return 16 //fun games
if argument0=18 return -1
if argument0=19 return -1*/

if global.lastgrade<7 or global.masks[global.currentmask]=1 {global.currentmask=global.newmask[0] currentmask=1} 
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()
alarm[0]=100
shine=0
/* */
/*  */
