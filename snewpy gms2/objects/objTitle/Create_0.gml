//disable for steam version
//global.steamon=0

//Initialize Xbox Controls
global.xbox=0
scrInitXboxButtons()
if file_exists(working_directory+"\\xbox") {
global.xbox=1
dllinit()
}

//Loads Volume.
global.mvol=1
global.svol=1
scrLoadVol()

//Used for general Commands
wait=0

//Colors for Alienware systems.
global.alienware=0
if file_exists(working_directory+"\\alienware") {
global.alienware=1
scrAlienWareInit()
scrAlienWarePink()
} else global.alienware=0

//Loads Keys
global.controllertype=1
global.upkey="W"
global.downkey="S"
global.leftkey="A"
global.rightkey="D"
global.restartkey="R"
//scrLoadKeys()

//Loads saved Masks
global.maskload=0

//Determinated variable used for switching colours
coldir=0

//Sets the default x,y cordenates
x=room_width/2
y=room_height/3-12
dir=random(10000)
repeats=1

//Introduces Globa Variable ''Shake''
global.shake=0
//Alt is an array wich contains the options in the main menu

//Start Game
alt[0]="START GAME"
scrLoadUnlocked()

//Will be ''Continue'' if the has not been completed: otherwise, level select
alt[1]="CONTINUE"
i=0 repeat (20) {if global.levels[i]=1 i+=1}
if i=20 alt[1]="CHAPTERS"
i=0

//Options Screen
alt[2]="OPTIONS"

//Exit game
alt[3]="EXIT GAME"


global.bonuslist=ds_list_create()
global.bonustime=0
global.newmasks=0

//Modifies this to be whats on screen once ''start game'' is selected
nextlevel=rmTutorial
level=0
select=0
rdir=0
global.paused=0
global.surf1=surface_create(room_width,room_height+64)
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_alpha()
surface_reset_target()
global.surf2=surface_create(640*3,480*3)
surface_set_target(global.surf2)
draw_clear_alpha(c_black,0)
surface_alpha()
surface_reset_target()
global.surf3=surface_create(640*3,480*3)
surface_set_target(global.surf3)
draw_clear_alpha(c_black,0)
surface_alpha()
surface_reset_target()
c_amount=0
fade=0
volume=1
presstart=0
pressup=0
pressdown=0
global.controller=0
pindex=0
alarm[0]=45
global.talked=1
global.i=0

//Generates ten palm trees.
repeat (10) {
my_id=instance_create(x,y,objPalmTree)
with my_id {repeat (global.i*45) amount*=1.01}
global.i+=1
}



global.surfaces=1
global.blood=1
if file_exists(working_directory+"\\blood") global.blood=0
if file_exists(working_directory+"\\surfaces") global.surfaces=0



global.surfacesprites=0
global.resetstory=0
global.comboflash=0
global.parttitle[0]="PART ONE."
global.parttitle[1]="PHONECALLS."
global.nextlevel=rmTutorial
global.sequence=rmSequence1
global.revisit=0
global.maskon=1
global.maskindex=0
global.tempSave = buffer_create(1024, buffer_grow, 2);
quit=0
scrLoadAchievements()
scrCheckLetters()
scrCheckGuns()
scrCheckMasks()


