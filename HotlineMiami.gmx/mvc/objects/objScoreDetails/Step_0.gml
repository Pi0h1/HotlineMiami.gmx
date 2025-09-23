if (global.xbox) {
    if (checkbutton(0, getid(5))) {
        if (!presstart) {
            presstart = 1;
            scrXboxScoreDetailsStart();
        }
    } else presstart = 0;
}

SteamRunCallbacks();
if (!surface_exists(global.surf1)) {
    global.surf1 = surface_create(room_width, room_height);
    surface_set_target(global.surf1);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
surface_set_target(global.surf1);
draw_clear_alpha(c_black, 0);
draw_set_font(fntDetails);
i = 0;
repeat(7) {
    draw_line_color(0, 12 + i * 3, room_width, 12 + i * 3, merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, dir2 * 4 + i * 35)), merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, dir2 * 4 + i * 35) + 180));
    i++;
}
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_set_color(merge_color(c_dkgray, c_gray, 0.5 + lengthdir_x(0.5, dir2 * 10)));
draw_text(12, 22, string_hash_to_newline("LEVEL: " + "\"" + level + "\"" + "#TIME: " + string(floor(time / 60)) + "s"));
draw_set_color(merge_color(c_dkgray, c_gray, 0.5 + lengthdir_x(0.5, dir2 * 10 + 180)));
draw_text(11, 22, string_hash_to_newline("LEVEL: " + "\"" + level + "\"" + "#TIME: " + string(floor(time / 60)) + "s"));



draw_set_halign(fa_right);
draw_set_color(merge_color(c_yellow, c_olive, 0.5 + lengthdir_x(0.5, dir2 * 10 + 180)));
draw_text(room_width - 11, 22, string_hash_to_newline("HIGHSCORE: " + string(highscore) + "#SCORE: " + string(myscore)));
draw_set_color(merge_color(c_yellow, c_orange, 0.5 + lengthdir_x(0.5, dir2 * 10)));
draw_text(room_width - 12, 22, string_hash_to_newline("HIGHSCORE: " + string(highscore) + "#SCORE: " + string(myscore)));

draw_set_halign(fa_center);
if (gradeon) {
    draw_set_color(merge_color(c_lime, c_green, 0.5 + lengthdir_x(0.5, dir2 * 10)));
    draw_text((room_width / 2) + 1, 22, string_hash_to_newline("PLAY STYLE:#" + "\"" + type + "\""));
    draw_set_color(merge_color(c_lime, c_green, 0.5 + lengthdir_x(0.5, dir2 * 10 + 180)));
    draw_text((room_width / 2), 22, string_hash_to_newline("PLAY STYLE:#" + "\"" + type + "\""));
}
draw_set_font(fntFeats);
if (dir < 180)
    dir += 18;
else {
    if (current < ds_list_size(global.bonuslist))
        current++;
    dir = 0;
}
draw_y = 220;
i = current - 1;
cdir += 4;
times = current - 1;
if (times > 13)
    times = 13;
ii = 0;
repeat(times) {
    draw_set_color(merge_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, cdir + i * 20)), c_teal, 0.5 + lengthdir_x(0.5, cdir + i * 30)));
    mystring = ds_list_find_value(global.bonuslist, i);
    draw_text((room_width - 50) - string_width(string_hash_to_newline(mystring)) * 0.5 + lengthdir_x(3, cdir + i * 40), 190 - ii * (12), string_hash_to_newline(mystring));
    i--;
    ii++;
}
if (current < ds_list_size(global.bonuslist)) {
    times = 1 + abs(lengthdir_y(19, dir));
    mystring = ds_list_find_value(global.bonuslist, current);
    i = 0;
    draw_set_font(fntChapter);
    repeat(times) {
        draw_set_color(merge_color(merge_color(c_olive, c_orange, 0.5 + lengthdir_x(0.5, cdir * 3)), merge_color(c_yellow, c_white, 0.75 + lengthdir_x(0.25, cdir * 2)), 1 * (times / 20)));
        draw_text_transformed((room_width - 50) - string_width(string_hash_to_newline(mystring)) * 0.325, 210 + i * 0.1, string_hash_to_newline(mystring), 0.65 + i * 0.005, 1 + i * 0.025, 0);
        i++;
    }
} else {
    if (gradex < (room_width - 120))
        gradex += 10;
    else {
        if (!gradeon) {
            gradeon = 1;
            if (grade == "A+")
                SteamSetAchievement("ACH_ACED_IT");
            scrCheckGrades();
            alpha = 1;
        }
    }
    draw_set_font(fntGrading);
    mystring = "GRADE:";
    draw_set_color(merge_color(c_yellow, c_white, 0.5 + lengthdir_x(0.5, cdir * 3)));
    draw_text_transformed(gradex - string_width(string_hash_to_newline(mystring)) * 0.5, 215, string_hash_to_newline(mystring), 1, 1, 0);
    if (gradeon) {
        draw_set_font(fntGrade);
        amount = -1 + lengthdir_x(2, cdir);
        if (amount < 0)
            amount = 0;
        draw_set_color(merge_color(c_red, c_white, amount));
        draw_set_halign(fa_left);
        draw_text_transformed((room_width - 110), 210, string_hash_to_newline(grade), 0.95 + amount * 0.05, 0.9 + amount * 0.1, 0);
    }
}
surface_reset_target();

