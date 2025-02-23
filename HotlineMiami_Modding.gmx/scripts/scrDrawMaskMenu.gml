if global.selectmask=0 {
var color1,color2,targety,i,amount;
with objMaskMenu {
dir+=1
draw_set_color(c_black)
draw_rectangle(-1,-1,view_wview[0]+1,blacky*2,0)
draw_rectangle(-1,view_hview[0]+1,view_wview[0]+1,view_hview[0]-blacky*2,0)
color1=merge_color(merge_color(c_orange,c_yellow,0.5+lengthdir_x(0.5,dir*1.6436)),c_red,0.25+lengthdir_y(0.25,dir*2.3234))
color2=merge_color(merge_color(c_fuchsia,c_purple,0.5+lengthdir_x(0.5,dir*2.55)),c_maroon,0.4+lengthdir_x(0.4,dir*1.567))
draw_rectangle_color(-48+maskx*4-32,-2,-48+maskx*4+32,view_hview[0]+2,color1,color2,color2,color1,0)

draw_sprite(sprPhoneLine,0,-48+maskx*4-32,0)
draw_sprite(sprPhoneLine,0,-48+maskx*4+32,0)
if on=1 {
if maskx<32 maskx+=8 else {
targety=view_hview[0]/2-select*80
masky+=((targety)-masky)*0.1
}
}
i=0
starty=0
repeat (masks) {
if select=i draw_sprite_ext(sprite_index,i,81,masky+starty+22,1.5,1.5,lengthdir_x(5,starty*1.765+dir*2),c_black,0.5) else draw_sprite_ext(sprite_index,i,80+1,masky+starty+2,1,1,0,c_black,0.5)
color=c_ltgray
if global.masks[i]=0 color=c_black
if select=i drawy=starty else draw_sprite_ext(sprite_index,i,80,masky+starty,1,1,0,color,1)
if select=i starty+=80*1.5 else starty+=80
i+=1
}
if global.masks[select]=0 color=c_black else color=c_white
draw_sprite_ext(sprite_index,select,80,masky+drawy+20,1.5,1.5,lengthdir_x(5,starty*1.765+dir*2),color,1)
if on=0 {
if masky<room_height+40 {masky+=maskspeed maskspeed+=0.5} else {
if maskx>0 maskx-=2 else {
if blacky>0 blacky-=2 else instance_destroy()
}
}
}

draw_set_blend_mode(bm_subtract)
draw_rectangle_color(-1,-1,view_wview[0]+1,maskx+random(4),c_white,c_white,c_black,c_black,0)
draw_rectangle_color(-1,view_hview[0]+1,view_wview[0]+1,view_hview[0]-maskx-random(4),c_black,c_black,c_white,c_white,0)
draw_rectangle_color(view_wview[0]-maskx*7,view_hview[0]+1,view_wview[0]+1,-2,c_black,c_white,c_white,c_black,0)
color1=merge_color(c_aqua,c_white,0.5+lengthdir_x(0.5,dir*4))
color2=merge_color(c_white,c_aqua,0.5+lengthdir_x(0.5,dir*4))
draw_set_blend_mode(bm_normal)
draw_set_font(fntMenu)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_set_color(c_black)
draw_text(150+32*9-maskx*9-1,view_hview[0]/2+12,name[select])
draw_text(150+32*9-maskx*9+1,view_hview[0]/2+12,name[select])
draw_text(150+32*9-maskx*9+2,view_hview[0]/2+12,name[select])
draw_text(150+32*9-maskx*9,view_hview[0]/2+12-1,name[select])
draw_text(150+32*9-maskx*9,view_hview[0]/2+12+1,name[select])
draw_text(150+32*9-maskx*9,view_hview[0]/2+12+2,name[select])
draw_set_color(color1)
draw_text(150+32*9-maskx*9+1,view_hview[0]/2+12+1,name[select])
draw_set_color(color2)
draw_text(150+32*9-maskx*9,view_hview[0]/2+12,name[select])
if global.masks[select]=1 {
draw_set_font(fntDescription)
draw_set_color(c_black)
draw_text(150+32*9-maskx*9+2,view_hview[0]/2+29+1,string_upper(description[select]))
draw_set_color(c_white)
draw_text(150+32*9-maskx*9+1,view_hview[0]/2+29,string_upper(description[select]))
}
}
}
