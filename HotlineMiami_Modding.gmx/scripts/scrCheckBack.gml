face_dir=argument0-180
point_dir=argument1
if face_dir<0 face_dir+=360
check=0
if face_dir<90 {
if point_dir>face_dir+90 and point_dir-360<face_dir-90 check=1
} else {
if face_dir>270 {
if point_dir<face_dir-90 and point_dir+360>face_dir+90 check=1
} else {
if point_dir<face_dir-90 or point_dir>face_dir+90 check=1
}
}

return check
