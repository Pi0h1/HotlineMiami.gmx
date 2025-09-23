surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
draw_set_font(fntMenu);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(merge_color(c_white, c_black, 0.5 + lengthdir_y(0.5, pointx * 2)));
draw_text(x + 1, y - 35, string_hash_to_newline(global.pretitle));
draw_set_color(merge_color(c_white, c_black, 0.5 + lengthdir_x(0.5, pointx * 2)));
draw_text(x, y - 36, string_hash_to_newline(global.pretitle));
draw_set_font(fntChapter);
i = 0;
pointx += 3;
start_x = -string_width(string_hash_to_newline(global.title)) * 0.5;
draw_set_halign(fa_left);
repeat(string_length(global.title)) {
    str = string_copy(global.title, 1 + i, 1);
    darkcolor = merge_color(merge_color(c_teal, c_blue, random(1)), merge_color(c_teal, c_aqua, random(1)), 0.5 - lengthdir_x(0.5, start_x * 0.25 - pointx * 1.5));
    dist = round(15 - point_distance(pointx, y, x + start_x, y) * 0.1);
    if (dist < 1) {
        dist = 1;
        if (amount[i] < 1)
            amount[i] += 0.025;
    } else {
        amount[i] = 0;
        on[i] = 1;
    }
    tempdir = point_direction(pointx, y + 64, x + start_x, y);
    if (on[i]) {
        ii = 0;
        repeat dist {
            if (dist > 1)
                draw_set_color(merge_color(c_white, c_aqua, ii * (1 / 15)));
            else draw_set_color(merge_color(merge_color(c_aqua, c_teal, random(1)), darkcolor, amount[i]));
            draw_text(x + start_x + lengthdir_x(ii, tempdir), y + lengthdir_y(ii, tempdir), string_hash_to_newline(str));
            ii++;
        }
    }
    start_x += string_width(string_hash_to_newline(str));
    i++;
}
surface_alpha();
surface_reset_target();

