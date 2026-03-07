if !on exit
select-=1
if select<0 select=masks-1
exit
while global.masks[select]=0 {
select-=1
if select<0 select=masks-1
}
