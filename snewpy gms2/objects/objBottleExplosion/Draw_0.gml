if image_index<8 image_index+=0.3
if image_index<8 {
draw_sprite_ext(sprBottleExplode,image_index,x,y,image_xscale,image_yscale,image_angle,merge_color(c_white,c_yellow,(image_index*0.1)*(0.8+random(0.2))),1)
if image_index>=2 draw_sprite_ext(sprBottleExplodeFlame,image_index-2,x,y,image_xscale,image_yscale,image_angle,c_orange,1)
if image_index>=1 draw_sprite_ext(sprBottleExplodeFlame,image_index-1,x,y,image_xscale,image_yscale,image_angle,c_yellow,1)
draw_sprite_ext(sprBottleExplodeFlame,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}
else {
draw_sprite_ext(sprBottleExplode,8,x,y,image_xscale+0.15,image_yscale+0.15,image_angle,merge_color(c_dkgray,c_black,0.5+random(0.5)),1)
draw_sprite_ext(sprBottleExplode,8,x,y,image_xscale+0.05+random(0.05),image_yscale+0.05+random(0.05),image_angle,merge_color(c_red,c_orange,random(1)),0.5+random(0.5))
draw_sprite_ext(sprBottleExplode,8,x,y,image_xscale,image_yscale,image_angle,merge_color(c_yellow,c_orange,random(0.35)),1-random(0.2))
index+=0.25
draw_sprite_ext(sprBottleFlames,index-1,x,y,image_xscale,image_yscale,image_angle-5,c_white,0.6+lengthdir_x(0.4,index*10))
draw_sprite_ext(sprBottleFlames,index-3,x,y,image_xscale,image_yscale,image_angle+5,c_white,0.6+lengthdir_x(0.4,index*10+90))
draw_sprite_ext(sprBottleFlames,index,x,y,image_xscale,image_yscale,image_angle,c_white,0.6+lengthdir_x(0.4,index*10+180))
}

