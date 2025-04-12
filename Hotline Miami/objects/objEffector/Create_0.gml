if global.xbox=1 scrInitXboxButtons()
alpha=1
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
global.loaded=0
nextroom=room_next(room)
newsong=0
song=-1
blackx=0
bamount=0
width=display_get_width()
height=display_get_height()
global.mousex=(display_mouse_get_x()-width*0.5)*(__view_get( e__VW.WView, 0 )/width)
global.mousey=(display_mouse_get_y()-height*0.5)*(__view_get( e__VW.HView, 0 )/height)
vlastx=camera_get_view_x(view_camera[0])
vlasty=camera_get_view_y(view_camera[0])
global.enemy=-1234
leveltitle=""
levelshow=240
gridon=0
uzisnd=0
if instance_exists(objMaskMenu) {
if global.sequence=rmSequence1 leveltitle="Brickell Metro Station"
if global.sequence=rmSequence2 leveltitle="East 7th St"
if global.sequence=rmSequence3 leveltitle="North West 184th St"
if global.sequence=rmSequence4 leveltitle="South West 53rd Place"
if global.sequence=rmSequence5 leveltitle="North West 24th St"
if global.sequence=rmSequence6 leveltitle="South West 104th St"
if global.sequence=rmSequence7 leveltitle="North West 151st Place"
if global.sequence=rmSequence8 leveltitle="South East 122nd St"
if global.sequence=rmSequence9 leveltitle="North East 165th "
if global.sequence=rmSequence10 leveltitle="North East 24th St"
if global.sequence=rmSequence11 leveltitle="East 7th St"
if global.sequence=rmSequence12 leveltitle="South East 24th St"
if global.sequence=rmSequence13 leveltitle="West 25th St"
if global.sequence=rmSequence14 leveltitle="South 86th St"
}
if instance_exists(objPlayerBiker) {
if room=rmNoodleShop leveltitle="North East 56th St"
if room=rmArcadeDownstairs leveltitle="South West 107th Place"
if room=rmPhoneHomEntranceBiker leveltitle="North West 342nd St"
if room=rmJanitors leveltitle="North 87th Place"
}
