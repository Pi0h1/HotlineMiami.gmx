if global.xbox=1 exit
if !on or wait>0 exit
wait=3
select+=1
if select>masks-1 select=0
exit
while global.masks[select]=0 {
select+=1
if select>masks-1 select=0
}

