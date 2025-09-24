if (global.xbox)
    scrInitXboxButtons();
alpha = 1;
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
global.loaded = 0;
nextroom = room_next(room);
newsong = 0;
song = -1;
blackx = 0;
bamount = 0;
width = display_get_width();
height = display_get_height();
global.mousex = (display_mouse_get_x() - width * 0.5) * (camera_get_view_width(view_camera[0]) / width);
global.mousey = (display_mouse_get_y() - height * 0.5) * (camera_get_view_height(view_camera[0]) / height);
vlastx = camera_get_view_x(view_camera[0]);
vlasty = camera_get_view_y(view_camera[0]);
global.enemy = -1234;
leveltitle = "";
levelshow = 240;
gridon = 0;
uzisnd = 0;
// Addresses used for display when level starts
if (instance_exists(objMaskMenu)) {
    switch (global.sequence) {
        case rmSequence1: leveltitle = "Brickell Metro Station"; break;
        case rmSequence2: leveltitle = "East 7th St"; break;
        case rmSequence3: leveltitle = "North West 184th St"; break;
        case rmSequence4: leveltitle = "South West 53rd Place"; break;
        case rmSequence5: leveltitle = "North West 24th St"; break;
        case rmSequence6: leveltitle = "South West 104th St"; break;
        case rmSequence7: leveltitle = "North West 151st Place"; break;
        case rmSequence8: leveltitle = "South East 122nd St"; break;
        case rmSequence9: leveltitle = "North East 165th "; break;
        case rmSequence10: leveltitle = "North East 24th St"; break;
        case rmSequence11: leveltitle = "East 7th St"; break;
        case rmSequence12: leveltitle = "South East 24th St"; break;
        case rmSequence13: leveltitle = "West 25th St"; break;
        case rmSequence14: leveltitle = "South 86th St"; break;
    }
}
if (instance_exists(objPlayerBiker)) { // This check is actually irrelevant but okay
    switch (global.sequence) {
        case rmNoodleShop: leveltitle = "North East 56th St"; break;
        case rmArcadeDownstairs: leveltitle = "South West 107th Place"; break;
        case rmPhoneHomEntranceBiker: leveltitle = "North West 342nd St"; break;
        case rmJanitors: leveltitle = "North 87th Place"; break;
    }
}

scrLockInEffectInit();

