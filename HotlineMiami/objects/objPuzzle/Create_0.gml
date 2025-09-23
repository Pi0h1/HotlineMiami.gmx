if (global.xbox)
    scrInitXboxButtons();

my_id = instance_create(30, 118, objLetterSocket) my_id.target = 0;
my_id = instance_create(54, 118, objLetterSocket) my_id.target = 1;
my_id = instance_create(76, 118, objLetterSocket) my_id.target = 2;
my_id = instance_create(98, 118, objLetterSocket) my_id.target = 3;
my_id = instance_create(122, 118, objLetterSocket) my_id.target = 4;
my_id = instance_create(144, 118, objLetterSocket) my_id.target = 5;
my_id = instance_create(166, 118, objLetterSocket) my_id.target = 6;
my_id = instance_create(188, 118, objLetterSocket) my_id.target = 7;
my_id = instance_create(212, 118, objLetterSocket) my_id.target = 0;
my_id = instance_create(234, 118, objLetterSocket) my_id.target = 7;
my_id = instance_create(258, 118, objLetterSocket) my_id.target = 8;
my_id = instance_create(280, 118, objLetterSocket) my_id.target = 9;
my_id = instance_create(302, 118, objLetterSocket) my_id.target = 10;
my_id = instance_create(326, 118, objLetterSocket) my_id.target = 11;
my_id = instance_create(348, 118, objLetterSocket) my_id.target = 3;
my_id = instance_create(370, 118, objLetterSocket) my_id.target = 2;
if (!global.puzzledone)
    scrCreateLetters();
else alarm[0] = 30;
surf1 = surface_create(room_width, room_height);
surface_set_target(surf1);
draw_clear_alpha(c_black, 0);
surface_reset_target();
dir = 0;
off = 0;
factor = 0;
currentletter = 0;

mousex = 200;
mousey = 127;

