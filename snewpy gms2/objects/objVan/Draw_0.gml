doorx=lengthdir_x(45.65,image_angle+331.2)
doory=lengthdir_y(45.65,image_angle+331.2)
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,image_blend,image_alpha)
if sprite_index=sprVanTop or sprite_index=sprVanDoorsOpen {
draw_sprite_ext(sprVanDoor,0,x+doorx,y+doory,1,1,image_angle+doorangle,c_white,1)
if doorangle<90 doorangle+=3
}
if sprite_index=sprVanDoorsOpen {
if image_index>20 and image_index<48 {
if instance_exists(objPlayer) headdir=scrRotate(headdir,point_direction(x,y,objPlayer.x,objPlayer.y),6)
headx=lengthdir_x(30.2,325.8+image_angle)
heady=lengthdir_y(30.2,325.8+image_angle)
draw_sprite_ext(sprBoss3Head,0,x+headx,y+heady,1,1,headdir+image_angle,c_white,1)
}
}
