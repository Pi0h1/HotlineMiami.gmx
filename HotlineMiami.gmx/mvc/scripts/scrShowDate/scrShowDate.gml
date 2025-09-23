global.levels[scrGetCurrentLevel() - 1] = 1;
scrSaveUnlocked();
scrSaveAchievements();

switch (argument0) {
    case rmSequence1: text = "April 3rd, 1989#Miami - Florida"; break;
    case rmSequence2: text = "April 8th, 1989#Miami - Florida"; break;
    case rmSequence3: text = "April 16th, 1989#Miami - Florida"; break;
    case rmSequence4: text = "April 25th, 1989#Miami - Florida"; break;
    
    case rmSequence5: text = "May 5th, 1989#Miami - Florida"; break;
    case rmSequence6: text = "May 11th, 1989#Miami - Florida"; break;
    case rmSequence7: text = "May 13th, 1989#Miami - Florida"; break;
    case rmSequence8: text = "May 23rd, 1989#Miami - Florida"; break;
    case rmSequence9: text = "May 27th, 1989#Miami - Florida"; break;
    case rmSequence10: text = "May 31st, 1989#Miami - Florida"; break;
    
    case rmSequence11: text = "June 3rd, 1989#Miami - Florida"; break;
    case rmSequence12: text = "June 8th, 1989#Miami - Florida"; break;
    
    case rmHospitalTopFloor: text = "July 21st, 1989#Miami - Florida"; break;
    case rmSequence13: text = "July 22nd, 1989#Miami - Florida"; break;
    case rmSequence14: text = "July 23rd, 1989#Miami - Florida"; break;
    
    case rmMCBar: text = "May 13th, 1989#Miami - Florida"; break;
    case rmMCSequence2: text = "May 16th, 1989#Miami - Florida"; break;
    case rmMCSequence3: text = "May 23rd, 1989#Miami - Florida"; break;
    case rmMCSequence4: text = "May 24th, 1989#Miami - Florida"; break;
}
if (room == rmMCBar) {
    // do nothing
} else {
    draw_set_font(fntDate);
    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
    i = 0;
    draw_clear(c_black);
    repeat(100) {
        draw_set_color(merge_color(c_black, c_gray, i * (1 / 60)));
        draw_text(__view_get( e__VW.WView, 0 ) / 2 + 1, __view_get( e__VW.HView, 0 ) / 2 + 1, string_hash_to_newline(text));
        draw_set_color(merge_color(c_black, c_white, i * (1 / 60)));
        draw_text(__view_get( e__VW.WView, 0 ) / 2, __view_get( e__VW.HView, 0 ) / 2, string_hash_to_newline(text));
        if (i < 60)
            i++;
//        sleep(1000 / 60);
        screen_refresh();
    }
}
show_date = 1;
