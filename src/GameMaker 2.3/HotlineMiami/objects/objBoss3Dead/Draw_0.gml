if sprite_index=sprBoss3Burning {
draw_sprite_ext(sprBoss3Ash,image_index,x,y,image_xscale,image_yscale,direction,c_white,1)
}

draw_sprite_ext(sprite_index,image_index,x+1,y+1,image_xscale,image_yscale,direction,c_black,0.5)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,direction,image_blend,image_alpha)

if sprite_index=sprBoss3Bash {
if round(image_index)=0 addx=8
if round(image_index)==1 addx=7
if round(image_index)=2 addx=6
if round(image_index)>=3 addx=6
draw_sprite_ext(sprMasks,global.maskindex,x,y-addx,1,1,90,c_white,1)
}

if sprite_index=sprBoss3BreakArm {
if image_index<9 draw_sprite_ext(sprMasks,global.maskindex,x+16,y-9,1,1,90,c_white,1) else draw_sprite_ext(sprMasks,global.maskindex,x+17,y-9,1,1,90,c_white,1)
}
if sprite_index=sprBoss3Dead {
draw_sprite_ext(sprPlayerLighter,index,x+18,y-18,1,1,325,c_white,image_alpha)
draw_sprite_ext(sprMasks,global.maskindex,x+18,y-18,1,1,235,c_white,1)
}


