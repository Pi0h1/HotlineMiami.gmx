if keyboard_check(ord("W")) {
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
}
if keyboard_check(ord("S")){
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

	
}
if global.xbox=1 {
if checkbutton(0,getid(5)) {
if presstart=0 {
presstart=1
scrXboxMaskMenuStart()
} 
} else presstart=0


if leftthumb_y(0)>5000 {
if pressup=0 {
pressup=1
scrXboxMaskMenuUp()
}
} else pressup=0

if leftthumb_y(0)<-5000 {
if pressdown=0 {
pressdown=1
scrXboxMaskMenuDown()
}
} else pressdown=0

}
if wait>0 wait-=1
if keyboard_check_pressed(ord(global.upkey)) event_perform(ev_keypress,ord("W"))
if keyboard_check_pressed(ord(global.downkey)) event_perform(ev_keypress,ord("S"))

/*if save=1 {
save=0
amount=objEffector.amount 
objEffector.amount=0 
global.loaded=1 
global.selectmask=1
game_save(working_directory+"\tempsave.sav") 
global.loaded=0 
global.selectmask=0
objEffector.amount=amount
}

if global.selectmask=1 {
on=0
with objPlayer {
reload=30
image_index=0
image_speed=0.15
sprite_index=sprPMaskSlip
}
select=0
if file_exists(working_directory+"\mask.tmp") {
file=file_text_open_read(working_directory+"\mask.tmp")
select=file_text_read_string(file)
select=real(select)
file_text_close(file)
}
if select=0 objPlayer.masksprite=sprRoosterMask
if select=1 objPlayer.masksprite=sprOwlMask
if select=2 objPlayer.masksprite=sprTigerMask
if select=3 objPlayer.masksprite=sprPigMask
if select=4 objPlayer.masksprite=sprHorseMask
if select=5 objPlayer.masksprite=sprCobraMask
if select=6 objPlayer.masksprite=sprRabbitMask
if select=7 objPlayer.masksprite=sprWolfMask
if select=8 objPlayer.masksprite=sprGiraffeMask
if select=9 objPlayer.masksprite=sprMonkeyMask
if select=10 objPlayer.masksprite=sprLocustMask
if select=11 objPlayer.masksprite=sprElephantMask
if select=12 objPlayer.masksprite=sprCamelMask
if select=13 objPlayer.masksprite=sprFoxMask
if select=14 objPlayer.masksprite=sprPantherMask
if select=15 objPlayer.masksprite=sprWalrusMask
if select=16 objPlayer.masksprite=sprUnicornMask
global.maskindex=select
objPlayer.maskindex=select
instance_destroy()
}*/
/* */
/*  */
