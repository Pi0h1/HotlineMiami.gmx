if (instance_exists(objLevelComplete)) {
    instance_destroy();
    exit;
}
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
i = 0;
factor = 0.5 - lengthdir_x(0.5, dir2);
if (dir2 < 360)
    dir2 += 5;
else instance_destroy();
draw_set_font(fntCheckpoint);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
start_x = camera_get_view_width(view_camera[0]) / 2 - string_width(string_hash_to_newline(text)) * 0.5;
repeat(string_length(text)) {
    letter = string_copy(text, 1 + i, 1);
    ii = 0;
    draw_set_color(c_black);
    if (dir2 > 180)
        draw_set_alpha(0.5 - lengthdir_x(0.5, dir2));
    draw_text_transformed(start_x, camera_get_view_height(view_camera[0]) * 0.5 - ii * 0.35 - 1, string_hash_to_newline(letter), 1, 1, 0);
    draw_text_transformed(start_x, camera_get_view_height(view_camera[0]) * 0.5 - ii * 0.35 + 1, string_hash_to_newline(letter), 1, 1, 0);
    draw_text_transformed(start_x + 1, camera_get_view_height(view_camera[0]) * 0.5 - ii * 0.35, string_hash_to_newline(letter), 1, 1, 0);
    draw_text_transformed(start_x - 1, camera_get_view_height(view_camera[0]) * 0.5 - ii * 0.35, string_hash_to_newline(letter), 1, 1, 0);
    draw_set_alpha(1);
    repeat(5 + lengthdir_x(4, dir + i * 60)) * factor {
        draw_set_color(merge_color(c_maroon, c_yellow, ii * 0.1));
        draw_text_transformed(start_x, camera_get_view_height(view_camera[0]) * 0.5 - ii * 0.35, string_hash_to_newline(letter), 1, 1, 0);
        ii++;
    }
    start_x += string_width(string_hash_to_newline(letter));
    i++;
}
dir += 8;

