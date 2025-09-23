if (on) {
    if (factor < 1)
        factor += 0.0125;
} else {
    if (factor > 0.05)
        factor -= 0.05;
    else factor = 0;
}
surface_set_target(surf);
draw_set_alpha(1 - random(0.9 * factor));
draw_set_color(merge_color(c_black, merge_color(c_dkgray, c_black, 0.7 + random(0.3)), factor));
draw_rectangle(0, 0, room_width * 3, room_height * 3, 0);
draw_set_color(merge_color(c_gray, merge_color(c_black, c_ltgray, random(1)), factor));
draw_set_font(fntDate);
addx = ((-1 + random(2)) * factor);
addy = ((-1 + random(2)) * factor);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed((room_width / 2) * 3 + 3 + addx, (room_height / 2) * 3 + 3 + addy, string_hash_to_newline(month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#Miami - Florida"), 3 - random(addx * 0.2), 3 - random(addy * 0.4), 0);
if (!on)
    draw_set_color(c_white);
else draw_set_color(merge_color(c_ltgray, c_white, random(1)));
draw_text_transformed((room_width / 2) * 3 + addy, (room_height / 2) * 3 + addy, string_hash_to_newline(month[currentmonth] + " " + string(day) + scrNth(string(day)) + ", 1989#Miami - Florida"), 3 - random(addx * 0.2), 3 - random(addy * 0.4), 0);


if (on) {
    if (reload > 0)
        reload--;
    else {
        if (maxreload > 1)
            maxreload -= 0.15;
        reload = ceil(maxreload);
        if (day == 13 && currentmonth == 1) {
            // do nothing
        } else {
            if (day > 1)
                day--;
            else {
                if (currentmonth > 1) {
                    day = 31;
                    currentmonth--;
                }
            }
        }
    }
}
surface_reset_target();

