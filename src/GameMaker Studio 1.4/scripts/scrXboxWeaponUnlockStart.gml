if global.newguns<=0 {fade=1 exit}
if on=0 {global.newguns-=1 global.newgun[current-7]=1 on=1 scrCheckGuns()} else {if factor>=1 and shine<=0 {global.newguns-=1 {shine=1 audio_play_sound(sndSplashFace,0,false)} current+=1 global.newgun[current-7]=1 scrCheckGuns()}}
