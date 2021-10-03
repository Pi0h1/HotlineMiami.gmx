if instance_exists(objPhoneConversation) {
index=objPhoneConversation.index
if blackx<45 blackx+=2.5
if blackx>15 {
if phonex<180 phonex+=10
}

phonecolor1=merge_color(c_orange,c_lime,0.5+lengthdir_x(0.25,global.dir*2))
phonecolor2=merge_color(c_maroon,c_navy,0.5+lengthdir_x(0.25,global.dir*2))
if instance_exists(objLightingEngine) {
with objLight {
if targetstrength=1 {
objEffector.phonecolor1=color
objEffector.phonecolor2=c_black
}
}
}

draw_triangle_color(view_wview[0]-phonex,0,view_wview[0],0,view_wview[0],view_hview[0],phonecolor1,phonecolor1,phonecolor2,0)
draw_triangle_color(view_wview[0]-phonex,0,view_wview[0]-phonex+70,view_hview[0],view_wview[0],view_hview[0],phonecolor1,phonecolor2,phonecolor2,0)
draw_sprite_ext(sprPhoneLine,0,view_wview[0]-phonex,0,1,2,15,c_white,1)
draw_set_color(c_black)
draw_rectangle(0,0,view_wview[0],blackx,0)
draw_rectangle(0,view_hview[0],view_wview[0],view_hview[0]-blackx*1.5,0)
draw_sprite_ext(sprite,index,view_wview[0]-phonex+128+2,view_hview[0]/2+3,image_xscale,image_yscale,lengthdir_x(4,global.dir*1.67),c_black,0.5)
draw_sprite_ext(sprite,index,view_wview[0]-phonex+128,view_hview[0]/2,image_xscale,image_yscale,lengthdir_x(4,global.dir*1.67),c_white,1)
if blackx=45 {
textcolor1=merge_color(merge_color(c_maroon,c_teal,0.5+lengthdir_x(0.5,global.dir)),c_black,objPhoneConversation.reload*0.1)
textcolor2=merge_color(merge_color(c_white,c_yellow,0.25-lengthdir_x(0.25,global.dir)),c_black,objPhoneConversation.reload*0.1)
draw_set_color(textcolor1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fntScore)
draw_text(17,view_hview[0]-57,string_upper(objPhoneConversation.line1[objPhoneConversation.current]))
draw_text(17,view_hview[0]-39,string_upper(objPhoneConversation.line2[objPhoneConversation.current]))
draw_set_color(textcolor2)
draw_text(15.5-lengthdir_x(0.5,global.dir*4),view_hview[0]-58.5-lengthdir_x(0.5,global.dir*4),string_upper(objPhoneConversation.line1[objPhoneConversation.current]))
draw_text(15.5-lengthdir_x(0.5,global.dir*4),view_hview[0]-40.5-lengthdir_x(0.5,global.dir*4),string_upper(objPhoneConversation.line2[objPhoneConversation.current]))
}
} else {
if blackx>15 {
if phonex>0 phonex-=10
if phonex>40 {
if blackx>15 blackx-=2.5
}

if phonex>0 {
phonecolor1=merge_color(c_orange,c_lime,0.5+lengthdir_x(0.25,global.dir*2))
phonecolor2=merge_color(c_maroon,c_navy,0.5+lengthdir_x(0.25,global.dir*2))
if instance_exists(objLightingEngine) {
with objLight {
if targetstrength=1 {
objEffector.phonecolor1=color
objEffector.phonecolor2=c_black
}
}
}
draw_triangle_color(view_wview[0]-phonex,0,view_wview[0],0,view_wview[0],view_hview[0],phonecolor1,phonecolor1,phonecolor2,0)
draw_triangle_color(view_wview[0]-phonex,0,view_wview[0]-phonex+70,view_hview[0],view_wview[0],view_hview[0],phonecolor1,phonecolor2,phonecolor2,0)
draw_sprite_ext(sprPhoneLine,0,view_wview[0]-phonex,0,1,2,15,c_white,1)
}
draw_set_color(c_black)
draw_rectangle(0,0,view_wview[0],blackx,0)
draw_rectangle(0,view_hview[0],view_wview[0],view_hview[0]-blackx*1.5,0)
if phonex>0 {
draw_sprite_ext(sprite,index,view_wview[0]-phonex+128+2,view_hview[0]/2+3,image_xscale,image_yscale,lengthdir_x(4,global.dir*1.67),c_black,0.5)
draw_sprite_ext(sprite,index,view_wview[0]-phonex+128,view_hview[0]/2,image_xscale,image_yscale,lengthdir_x(4,global.dir*1.67),c_white,1)
}
} 
}
