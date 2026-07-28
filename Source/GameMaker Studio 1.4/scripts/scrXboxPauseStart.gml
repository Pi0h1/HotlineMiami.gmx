if state=0 {
if select=0 {
if fade=0 {
global.paused=1
if blacky>=1 on=0
}
} 
if select=1 {on=2 state=1}
if select=2 {if on=1 fade=1}
}
