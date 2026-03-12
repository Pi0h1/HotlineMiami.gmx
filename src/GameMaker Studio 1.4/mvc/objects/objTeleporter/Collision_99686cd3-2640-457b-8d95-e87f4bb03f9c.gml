/*if !instance_exists(objESubwayStatic) {
if instance_number(objEnemy)+instance_number(objKnockedOut)>0 exit
}*/
if other.object_index=objPlayerMouse or other.object_index=objPlayerMouseHouse or other.object_index=objPlayerBiker or other.object_index=objPlayerBikerHouse {
if objEffector.fade=0 {
objPlayer.addx=addx*3
objPlayer.addy=addy*3
objPlayer.movex=movex
objPlayer.movey=movey
objPlayer.move=1
objEffector.next=1
objEffector.fade=1
objEffector.nextroom=nextroom
objPlayer.persistent=1
sprite=sprArrowGray
with objTransitioner {
if nextroom=objEffector.nextroom sprite=sprArrowGray
}
with objTeleporter {
if nextroom=objEffector.nextroom sprite=sprArrowGray
}
visible=0
}
}
/* */
/*  */
