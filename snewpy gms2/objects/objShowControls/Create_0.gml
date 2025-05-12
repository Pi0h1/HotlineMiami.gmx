mapdir=0
select=0
scrFreeSurfaces()
image_speed=0.2
if global.xbox=1 scrInitXboxButtons()
scrInitControls()
x=room_width/2
y=room_height*0.57
sprite_index=sprite[0]
restart=0
dir=90
edit=0
current=0
fade=0
c_amount=0
/*repeat (5) instance_create(random(room_width),0,objHouse)

i=0
repeat (5) {
palmx[i]=(room_width/4)*i
palmindex[i]=floor(random(6))
i+=1
}*/
wait=0
global.i=0
repeat (10) {
my_id=instance_create(x,y,objPalmTree)
with my_id {repeat (global.i*45) amount*=1.01}
global.i+=1
}
alarm[0]=45
alarm[1]=90

x=room_width/2
y=room_height/2
/* */
/*  */
