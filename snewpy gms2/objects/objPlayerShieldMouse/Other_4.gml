if persistent=1 {
if move=1 {
move=0
x+=movex
y+=movey
xview+=movex
yview+=movey
}
camera_set_view_pos(view_camera[0], xview, yview);
alarm[0]=36
}
else {
camera_set_view_angle(view_camera[0], 1)
camera_set_view_pos(view_camera[0], x-camera_get_view_width(view_camera[0])/2, y-camera_get_view_height(view_camera[0])/2)
}
