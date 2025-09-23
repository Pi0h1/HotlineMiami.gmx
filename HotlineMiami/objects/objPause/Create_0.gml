if (global.xbox)
    scrInitXboxButtons();
sprw = sprite_get_width(global.sprite);
sprh = sprite_get_height(global.sprite);
sprx = room_width / sprw;
spry = room_height / sprh;
blur = 0;
on = 1;
dir = 0;
blacky = 0;
target_blur = 1;
textdir1 = 0;
textdir2 = 0;
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
surface_alpha();
surface_reset_target();
test = 1;
i = 0;
repeat(16) {
    if (global.letter[i] == 1)
        test = 0;
    i++;
}
choice[0] = "Resume";
choice[1] = "Puzzle";
choice[2] = "Restart";
choice[3] = "Quit";
select = 0;
fade = 0;
c_amount = 180;
state = 0;
wait = 0;
width = display_get_width();
lowres = (1200 / 900) * (1 / 3);

