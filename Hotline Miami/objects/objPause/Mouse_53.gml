if global.xbox=1 exit
if state=0 {
if select=0 {
if fade=0 {
global.paused=1
if blacky>=1 on=0
}
} 
if select=1 {on=2 state=1}
if select=2 {game_load("restart.dat")}
if select=3 {if on=1 fade=1}
}

