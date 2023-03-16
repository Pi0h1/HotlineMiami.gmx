if !on exit
select+=1
if select>masks-1 select=0
exit
while global.masks[select]=0 {
select+=1
if select>masks-1 select=0
}
