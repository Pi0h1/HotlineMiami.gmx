if global.xbox=1 exit
if !on or wait>0 exit
wait=3
select-=1
if select<0 select=masks-1
exit
while global.masks[select]=0 {
select-=1
if select<0 select=masks-1
}

