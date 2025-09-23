alpha = 1;
global.enemy = -124123;
coldir = 0;
amount = 0;
fade = 0;
my_y = 0;
global.dir = 0;
restart = 0;
update = 0;
dir = 0;
ammoy = -32;
next = 0;
showfinished = 0;
image_speed = 0.4;
action = 0;
wait = 0;
phonex = 0;
blackx = 15;
line1x = 0;
line2x = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
index = 0;
show_date = 0;
sprite = sprPhone;

// change to a switch statement later
if (room == rmSequence1 || room == rmSequence2 || room == rmSequence3 || room == rmSequence4 || room == rmSequence5 || room == rmSequence6 || room == rmSequence7 || room == rmSequence8 || room == rmSequence9 || room == rmSequence10 || room == rmSequence11 || room == rmSequence12 || room == rmSequence14 || room == rmHospitalTopFloor || room == rmMCBar || room == rmMCSequence2 || room == rmMCSequence3 || room == rmMCSequence4) {
    scrShowDate(room);
    start = 1;
} else start = 0;
if (room == rmSequence13Downstairs)
    start = 1;
global.loaded = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - width * 0.5) * (__view_get( e__VW.WView, 0 ) / width);
global.mousey = (display_mouse_get_y() - height * 0.5) * (__view_get( e__VW.HView, 0 ) / height);
lastbrus = 0;
brus = 0;
ammoy = -32;
levelshow = 240;
if (room == rmMansionMainHall)
    save = 1;
else save = 0;
leveltitle = "";
if (instance_exists(objPlayerBiker)) {
    switch (room) {
        case rmNoodleShop: leveltitle = "North East 56th St"; break;
        case rmArcadeDownstairs: leveltitle = "South West 107th Place"; break;
        case rmPhoneHomEntranceBiker: leveltitle = "North West 342nd St"; break;
        case rmJanitors: leveltitle = "North 87th Place"; break;
    }
}
scrLockInEffectInit();

