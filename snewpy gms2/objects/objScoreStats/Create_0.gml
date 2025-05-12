if global.barehanded=1 and scrGetCurrentLevel()=5 SteamSetAchievement("ACH_THESE_ARE_MY_GUNS")
scrSaveAchievements()
scrCheckGuns()
if global.xbox=1 scrInitXboxButtons()
scrCountFlexibilityScore()
scrCountMobilityScore()
scrCheckLetters()
scrCheckUsedGuns()
scrCheckUsedMasks()
scrCheckUsedThrows()
scrCheckUsedKills()
SteamCheckFinal()
song=working_directory+"\\Daisuke.mp3"
//if global.sequence=rmSequence4 or global.sequence=rmSequence8 song=-1//working_directory+"\SilverLights.mp3"
global.myscore=0
bonus[0]=global.killscore
bonus[1]=global.boldscore
bonus[2]=global.comboscore
bonus[3]=floor((18000-global.time)*0.5)
if bonus[3]<0 bonus[3]=0
bonus[4]=global.flexibilityscore
bonus[5]=global.mobilityscore
bonus[6]=global.specialscore
i=0
fastforward=0
repeat (7) {
drawbonus[i]=0
amount[i]=0
global.myscore+=bonus[i]
i+=1
}
global.levelscore[global.currentlevel]=global.myscore
parscore="/"+string(round((scrGetMaxpoints()*(7/15))*(1/500))*500)+"pts"
type[0]="KILLINGS:"
type[1]="BOLDNESS:"
type[2]="COMBOS:"
type[3]="TIME BONUS:"
type[4]="FLEXIBILITY:"
type[5]="MOBILITY:"
type[6]="SPECIAL:"
global.totalscore+=global.myscore
global.newguns=0
allguns=0
i=0
while global.newgun[i]=1 and i<15 {
i+=1
}
if global.totalscore>(i+1)*50000 and global.totalscore-global.myscore<(i+1)*50000 global.newguns=1
i+=1
if global.totalscore>(i+1)*50000 and global.totalscore-global.myscore<(i+1)*50000 global.newguns=2 else i-=1
nextgun=(i+1)*50000
leftgun=global.totalscore
//while leftgun>50000 leftgun-=50000
i=0 
while global.newgun[i]=1 and i<16 {
i+=1
}
if i=15 and global.newguns=2 global.newguns=1
if i=16 {allguns=1 global.newguns=0}
current=0
dir=random(360)
factor=0
fade=0
c_amount=0

global.surf1=surface_create(room_width,room_height)
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()


repeat (5) instance_create(random(room_width),0,objHouseReturn)

i=0
repeat (5) {
palmx[i]=(room_width/4)*i
palmindex[i]=floor(random(6))
i+=1
}

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



/*-Combos = Combo Bonus
-Total time = Time Bonus
-Weapons used = Flexibility Bonus
-Distance between kills = Mobility Bonus
-Only melee bonus = Melee Bonus
-Shots fired during combat = Artillery Bonus
-People who see you kill someone = Boldness Bonus*/
/* */
/*  */
