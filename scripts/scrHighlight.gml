var arrow_index=0;

if argument0="LEFT"{
draw_sprite_ext(sprArrow,arrow_index,x-12+lengthdir_x(3,objBackgroundColor.dir*32),y+16,1,1,90,c_white,1);
} else {
draw_sprite_ext(sprArrow,arrow_index,x+12+lengthdir_x(3,objBackgroundColor.dir*32),y+16,1,1,-90,c_white,1);
}

arrow_index+=0.5
