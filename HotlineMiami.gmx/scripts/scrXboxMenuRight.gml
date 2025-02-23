if fade=1 or wait>0 exit
wait=2
repeats=0

if level=2 {
if select=0 {if global.mvol<1 global.mvol+=0.01 sxeasy_setVolume(1)}
}
