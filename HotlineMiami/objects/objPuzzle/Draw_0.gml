if (instance_number(objLetterDone) == 16)
    draw_surface(surf1, 0, 0);
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
if (!global.xbox)
    draw_sprite(sprCursor, 0, mouse_x, mouse_y);
else draw_sprite(sprCursor, 0, mousex, mousey);
d3d_set_projection_ortho(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 44, 0);
draw_rectangle(0, room_height - 44, room_width, room_height, 0);

