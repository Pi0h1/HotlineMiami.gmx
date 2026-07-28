d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0);
draw_set_color(c_black);
draw_rectangle(-1, -1, room_width + 1, 15, 0);
draw_rectangle(-1, room_height + 1, room_width + 1, room_height - 15, 0);
draw_set_color(c_white);
draw_set_font(fntDate);
