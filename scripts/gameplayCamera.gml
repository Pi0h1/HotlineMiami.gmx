if isLookingFuther {

    if global.maskindex = 7 {factor = 2} // George Mask multiplier
    else {factor = 1;} // regular
  
    viewx = objPlayer.x + ((display_mouse_get_x() - display_get_width() * 0.5) * (view_wview[0] / display_get_width())) * factor;
    viewy = objPlayer.y + ((display_mouse_get_y() - display_get_height() * 0.5) * (view_hview[0] / display_get_height())) * factor;
    viewspeed = point_distance(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, viewx, viewy) * 0.1;
    viewdir = point_direction(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, viewx, viewy);
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);
  
  if global.devmode = 0 {
    view_angle[0] = lengthdir_y(vdist * (1 / 160), vdir * 2);
  }
  
} else {
    
    // Normal gameplay view
    viewspeed = point_distance(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir)) * 0.1;
    viewdir = point_direction(view_xview[0] + view_wview[0] / 2, view_yview[0] + view_hview[0] / 2, x + lengthdir_x(24, dir), y + lengthdir_y(24, dir));
    view_xview[0] += lengthdir_x(viewspeed, viewdir);
    view_yview[0] += lengthdir_y(viewspeed, viewdir);
    vdist = point_distance(x, y, room_width / 2, room_height / 2);
    vdir = point_direction(room_width / 2, room_height / 2, x, y);

    if global.devmode = 0 {
        view_angle[0] = lengthdir_y(vdist * (1 / 160), vdir * 2);
    }  
}

xview = view_xview[0];
yview = view_yview[0];

if persistent = 1 and objEffector.fade = 1 {
  if place_free(x + addx, y) x += addx;
  if place_free(x, y + addy) y += addy;
  if image_speed = 0 image_index += 0.15;
  legindex += 0.4;
  exit
}
