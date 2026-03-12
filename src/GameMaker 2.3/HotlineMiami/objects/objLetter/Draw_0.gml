if y<64 y=64
if y>192 y=192
draw_sprite(sprite_index,image_index,x+addx,y)
if abs(addx)>0 addx=addx*0.8
