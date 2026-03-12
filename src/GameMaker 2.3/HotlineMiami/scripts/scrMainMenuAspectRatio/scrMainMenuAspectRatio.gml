function scrMainMenuAspectRatio() {
	d3d_set_projection_ortho(0, 0, __view_get( e__VW.WView, 0 ), __view_get( e__VW.HView, 0 ), 0);
	draw_set_color(c_black);
	draw_rectangle(-1, -1, room_width + 1, 15, 0);
	draw_rectangle(-1, room_height + 1, room_width + 1, room_height - 15, 0);
	draw_set_color(c_white);
	draw_set_font(fntDate);



}
