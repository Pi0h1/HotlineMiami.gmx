day = 23;
currentmonth = 3;
month[0] = "April";
month[1] = "May";
month[2] = "June";
month[3] = "July";
reload = 5;
maxreload = 5;
on = 0;
draw_set_font(fntDate);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
text = month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#Miami - Florida";
surf = surface_create(room_width * 3, room_height * 3);
surface_set_target(surf);
draw_clear_alpha(0, c_black);
draw_set_color(c_gray);
draw_text_transformed((room_width / 2) * 3 + 3, (room_height / 2) * 3 + 3, string_hash_to_newline(month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#Miami - Florida"), 3, 3, 0);
draw_set_color(c_white);
draw_text_transformed((room_width / 2) * 3, (room_height / 2) * 3, string_hash_to_newline(month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#Miami - Florida"), 3, 3, 0);
surface_reset_target();
factor = 0;
alarm[1] = 60;
i = 0;

draw_clear(c_black);
repeat(100) {
    draw_surface_ext(surf, 0, 0, 1, 1, 0, merge_color(c_black, c_white, i * (1 / 60)), 1);
    if (i < 60)
        i++;
    sleep(1000 / 60);
    screen_refresh();
}

