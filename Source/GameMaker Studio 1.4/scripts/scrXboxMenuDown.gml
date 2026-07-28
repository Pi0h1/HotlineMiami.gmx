if fade=1 or wait>0 exit
wait=3
repeats=0
if level=0 {
if select<3 select+=1 else select=0
}
if level=1 {
if select<4 select+=1 else select=0
}
if level=2 {
if select<1 select+=1 else select=0
}
if level=4 {
if select<3 select+=1 else select=0
if select=1 and global.surfaces=1 select=2
}
