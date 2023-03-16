if fade=1 exit
if level=0 {
file_delete(working_directory+"\skip") 
fade=1
select=3
}
if level=1 {
select=0
alt[0]="START GAME"
alt[1]="CONTINUE"
i=0 repeat (20) {if global.levels[i]=1 i+=1}
if i=20 alt[1]="CHAPTERS"
i=0
alt[2]="OPTIONS"
alt[3]="EXIT GAME"
level=0
}

if level=2 or level=3 {
alt[0]="360 PAD "
if global.xbox=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="CONTROLS"
alt[2]="VOLUME"
alt[3]="ADVANCED"
alt[4]="BACK"
select=0
level=1
}

if level=4 {
alt[0]="360 PAD "
if global.xbox=1 alt[0]+="ON" else alt[0]+="OFF"
alt[1]="CONTROLS"
alt[2]="VOLUME"
alt[3]="ADVANCED"
alt[4]="BACK"
select=0
level=1
}
