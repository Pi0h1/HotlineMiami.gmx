if (global.xbox)
    scrInitXboxButtons();
if (room == rmPhoneHomEntrance)
    sxeasy_play(working_directory + "\\Bridal.mp3");
global.barehanded = 1;
select = 0;
masks = sprite_get_number(sprite_index);
maskx = 0;
masky = room_height + 40;
dir = 0;
on = 1;
wait = 0;
maskspeed = 8;
name[0] = "Richard";
name[1] = "Rasmus";
name[2] = "Tony";
name[3] = "Aubrey";
name[4] = "Don Juan";
name[5] = "Graham";
name[6] = "Dennis";
name[7] = "George";
name[8] = "Ted";
name[9] = "Rufus";
name[10] = "Rami";
name[11] = "Willem";
name[12] = "Peter";
name[13] = "Zack";
name[14] = "Oscar";
name[15] = "Rick";
name[16] = "Brandon";
name[17] = "Charlie";
name[18] = "Louie";
name[19] = "Phil";
name[20] = "Nigel";
name[21] = "Earl";
name[22] = "Jones";
name[23] = "Carl";
name[24] = "Jake";
name[25] = "Richter";
description[0] = "";
description[1] = "An eye for secrets";
description[2] = "Fists of fury";
description[3] = "More guns";
description[4] = "Lethal doors";
description[5] = "Walk fast";
description[6] = "Start with knife";
description[7] = "Look further";
description[8] = "Dogs don't attack";
description[9] = "Survive one bullet";
description[10] = "Extra ammo";
description[11] = "Rip and steal";
description[12] = "Quiet gunshots";
description[13] = "Longer combo window";
description[14] = "Darkness";
description[15] = "Good shot";
description[16] = "Walk faster";
description[17] = "More melee weapons";
description[18] = "Hard to spot";
description[19] = "French translation";
description[20] = "Reversed controls";
description[21] = "Survive two bullets";
description[22] = "More gore";
description[23] = "Start with drill";
description[24] = "Killing throws";
description[25] = "Start with silenced uzi";

blacky = 32;
global.maskon = 0;
select = global.maskindex;
global.maskindex = 0;
i = 0;
repeat(26) {
    if (global.masks[i] == 0)
        name[i] = "Unavailable";
    i++;
}

global.selectmask = 0;
save = 1;

with (objPlayer) {
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
    camera_set_view_pos(view_camera[0], x + lengthdir_x(vdist * 0.2, vdir - 180) - camera_get_view_width(view_camera[0]) * 0.5, y + lengthdir_y(vdist * 0.2, vdir - 180) - camera_get_view_height(view_camera[0]) * 0.5);
    camera_set_view_angle(view_camera[0], lengthdir_y(vdist * (1 / 160), vdir * 2));
}
alarm[0] = 1;

addToSave();