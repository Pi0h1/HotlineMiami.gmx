letter=-1
//text[0]="PART ONE"
//text[1]="PHONECALLS"
texts=1

i=0
repeat (15)
{
amount[i]=0
i+=1
}
amount[0]=10
dir=random(10000)
current=0
factor=1



i=0
repeat (30) {
size[i]=1+random(2)
myx[i]=random(room_width)
myy[i]=random(room_height)
mydir[i]=random(360)
myspeed[i]=1+random(2)
diradd[i]=-4+random(8)
i+=1
}

fade=0
c_amount=0
