alpha=1
global.enemy=-124123
coldir=0
amount=0
fade=0
my_y=0
global.dir=0
restart=0
update=0
dir=0
ammoy=-32
next=0
showfinished=0
image_speed=0.4
action=0
wait=0
phonex=0
blackx=15
line1x=0
line2x=0
nextroom=room_next(room)
newsong=0
song=-1
index=0
show_date=0
sprite=sprPhone
if room=rmSequence1 or room=rmSequence2 or room=rmSequence3 or room=rmSequence4 or room=rmSequence5 or room=rmSequence6 or room=rmSequence7 or room=rmSequence8 or room=rmSequence9 or room=rmSequence10 or room=rmSequence11 or room=rmSequence12 or room=rmSequence14 or room=rmHospitalTopFloor or room=rmMCBar or room=rmMCSequence2 or room=rmMCSequence3 or room=rmMCSequence4 {scrShowDate(room) start=1} else start=0
if room=rmSequence13Downstairs start=1
global.loaded=0
width=display_get_width()
height=display_get_height()
global.mousex=(display_mouse_get_x()-width*0.5)*(__view_get( e__VW.WView, 0 )/width)
global.mousey=(display_mouse_get_y()-height*0.5)*(__view_get( e__VW.HView, 0 )/height)
lastbrus=0
brus=0
ammoy=-32
levelshow=240
if room=rmMansionMainHall save=1 else save=0
leveltitle=""
if instance_exists(objPlayerBiker) {
if room=rmNoodleShop leveltitle="North East 56th St"
if room=rmArcadeDownstairs leveltitle="South West 107th Place"
if room=rmPhoneHomEntranceBiker leveltitle="North West 342nd St"
if room=rmJanitors leveltitle="North 87th Place"
}
