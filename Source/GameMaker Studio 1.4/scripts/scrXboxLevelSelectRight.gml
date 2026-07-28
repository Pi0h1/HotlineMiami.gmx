if fade=1 exit
if state=1 {intro=!intro exit}
mapdir=180
if select<levels select+=1 else select=0
repeats=8
if select=0 repeats=16
if select=8 repeats=16
myrepeats=0

sprite_index=level[select]
