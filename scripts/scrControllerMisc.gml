if checkbutton(0,getid(6)) {
with objEffector {
fade=1
restart=1
}
}
if checkbutton(0,getid(5)) {
if instance_number(objEnemy)+instance_number(objKnockedOut)=0 {objEffector.fade=1 if room=room_last objEffector.restart=1 else objEffector.next=1}
}
