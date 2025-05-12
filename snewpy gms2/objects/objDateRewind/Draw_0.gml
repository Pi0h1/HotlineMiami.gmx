if on=0 draw_surface_ext(surf,0,0,1/3,1/3,0,c_white,1) else {
splits=3+round(random(10))
i=1
split_y1[0]=0
split_y2[0]=room_height*0.45
repeat (splits-2) {
split_y1[i]=split_y2[i-1]
split_y2[i]=split_y1[i]+random(8)
i+=1
}
split_y1[i]=split_y2[i-1]
split_y2[i]=room_height
i=0
repeat (splits) {
draw_surface_part_ext(surf,0,split_y1[i]*3,room_width*3,(split_y2[i]*3)-split_y1[i]*3,-1+random(2),split_y1[i],1/3,1/3,c_white,1)
texture_set_interpolation(true)
draw_surface_part_ext(surf,0,split_y1[i]*3,room_width*3,(split_y2[i]*3)-split_y1[i]*3,-1+random(2),split_y1[i],1/3,1/3,c_white,random(0.3*factor))
texture_set_interpolation(false)
i+=1
}
}

if factor>0 {
y1=room_height*0.35+random(6)-(30-factor*30)
y2=room_height*0.65-random(6)+(30-factor*30)
repeat (40) {
draw_sprite_ext(sprMagnetic,random(100),random(room_width),y1,1,1,0,merge_color(c_black,c_white,random(1)),(0.5+random(0.5))*factor)
draw_sprite_ext(sprMagnetic,random(100),random(room_width),y2,1,1,0,merge_color(c_black,c_white,random(1)),(0.5+random(0.5))*factor)
}
}
