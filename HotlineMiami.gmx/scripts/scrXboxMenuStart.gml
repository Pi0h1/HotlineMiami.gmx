if level=0 {
if select=0 {
{select=0 //level=1 
fade=1
scrInitScore()
}
}
if select=1 {
/*global.sequence=rmChapter
global.level=rmEurogamer
global.pretitle="Special Chapter"
global.title="EXPOSED"
global.sequence=rmEurogamer*/
//fade=1
//scrInitScore()
fade=1
scrInitScore()
}
if select=2 {
level=1
select=0
alt[0]="360 GAMEPAD "
if global.xbox=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="CONTROLS"
alt[2]="VOLUME"
alt[3]="ADVANCED"
//alt[3]="AlienWare "
//if global.alienware=1 alt[3]+="ON" else alt[3]+="OFF"
alt[4]="BACK"
//fade=1
//scrInitScore()
/*if global.controller=0 {
dllinit()
global.controller=1
alt[1]="PAD ON"
}
else {
dllfree()
global.controller=0
alt[1]="PAD OFF"
}*/
exit
}
//if select=2 {fade=1}
if select=3 {fade=1 file_delete(working_directory+"\skip")}
} 

if level=1 {
if select=0 {
if global.xbox=1 {
global.xbox=0
alt[0]="360 GAMEPAD "
if global.xbox=1 alt[0]+="ON" else alt[0]+="OFF"
dllfree() 
if file_exists(working_directory+"\xbox") file_delete(working_directory+"\xbox")
} else {
alt[0]="YES"
alt[1]="NO"
level=3
select=1
exit
}
}
if select=1 {
scrInitScore()
fade=1
}
if select=2 {
level=2
select=0
alt[0]="MUSIC "+string(round(global.mvol*100))+"%"
alt[1]="BACK"
exit
}
/*if select=3 {
global.alienware=!global.alienware
alt[3]="AlienWare "
if global.alienware=1 {alt[3]+="ON" scrAlienWareInit() scrAlienWarePink() file=file_text_open_write(working_directory+"\alienware") 
file_text_close(file)} else {alt[3]+="OFF" scrAlienWareFree() if file_exists(working_directory+"\alienware") file_delete(working_directory+"\alienware")
}
}*/

if select=3 {
level=4
select=0
alt[0]="SURFACES "
if global.surfaces=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="clear blood "
if global.blood=0 alt[1]+="on" else alt[1]+="off"
alt[2]="AlienWare "
if global.alienware=1 alt[2]+="ON" else alt[2]+="OFF"
alt[3]="BACK"
exit
}

if select=4 {
select=0
alt[0]="START GAME"
alt[1]="CONTINUE"
i=0 repeat (20) {if global.levels[i]=1 i+=1}
if i=20 alt[1]="CHAPTERS"
i=0
alt[2]="OPTIONS"
alt[3]="EXIT GAME"
level=0
exit
}
}

if level=2 {
if select=1 {
scrSaveVol()
level=1
select=0
alt[0]="360 GAMEPAD "
if global.xbox=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="CONTROLS"
alt[2]="VOLUME"
alt[3]="ADVANCED"
alt[4]="BACK"
exit
}
}

if level=3 {
if select=0 global.xbox=1
if select=1 global.xbox=0
alt[0]="360 GAMEPAD "
if global.xbox=1 {alt[0]+="ON" dllinit() file=file_text_open_write(working_directory+"\xbox") file_text_close(file)} else {alt[0]+="OFF" dllfree() if file_exists(working_directory+"\xbox") file_delete(working_directory+"\xbox")}
alt[1]="CONTROLS"
alt[2]="VOLUME"
alt[3]="ADVANCED"
alt[4]="BACK"
level=1
select=0
}


if level=4 {
if select=0 {
global.surfaces=!global.surfaces if global.surfaces=1 {
global.blood=1 
if file_exists(working_directory+"\surfaces") file_delete(working_directory+"\surfaces") 
if file_exists(working_directory+"\blood") file_delete(working_directory+"\blood") 
} else {
file=file_text_open_write(working_directory+"\surfaces") file_text_close(file)
file=file_text_open_write(working_directory+"\blood") file_text_close(file)
}
}

if select=1 {
global.blood=!global.blood
if global.blood=1 { 
if file_exists(working_directory+"\blood") file_delete(working_directory+"\blood") 
} else {
file=file_text_open_write(working_directory+"\blood") file_text_close(file)
}
}
if select=2 global.alienware=!global.alienware
alt[0]="SURFACES "
if global.surfaces=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="clear blood "
if global.blood=0 alt[1]+="on" else alt[1]+="off"
alt[2]="AlienWare "
if global.alienware=1 alt[2]+="ON" else alt[2]+="OFF"
alt[3]="BACK"
if select=3 {
level=1
select=0
alt[0]="360 GAMEPAD "
if global.xbox=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="CONTROLS"
alt[2]="VOLUME"
alt[3]="ADVANCED"
alt[4]="BACK"
exit
}
}
