letter[0]=0
letter[1]=1
letter[2]=2
letter[3]=3
letter[4]=4
letter[5]=5
letter[6]=6
letter[7]=7
letter[8]=0
letter[9]=7
letter[10]=8
letter[11]=9
letter[12]=10
letter[13]=11
letter[14]=3
letter[15]=2

i=0
repeat (16) {
if global.letter[i]=1 {
my_id=instance_create(random(room_width),64+random(128),objLetter)
my_id.image_index=letter[i]
}
i+=1
}
