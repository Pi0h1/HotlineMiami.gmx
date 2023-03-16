nothing=1 if nothing=0 {
global.i=0 
surf=surface_create((room_width+32)/8,(room_height+32)/8)
repeat (8) {
surface_set_target(surf)
draw_clear(c_black)
with objWallHeavyH {
draw_sprite(sprMiniature,0,x*0.125,y*0.125)
}
with objWallHeavyV {
draw_sprite(sprMiniature,1,x*0.125,y*0.125)
}
with objWallSoftH{
if object_index=objWallSoftH draw_sprite(sprMiniature,0,x*0.125,y*0.125) else draw_sprite(sprMiniature,1,x*0.125,y*0.125)
}
with objWindowH {
if global.i<4 or global.i=7 draw_sprite(sprMiniature,8,x*0.125,y*0.125) else draw_sprite(sprMiniature,2,x*0.125,y*0.125)
}
with objWindowV {
if global.i<4 or global.i=7 draw_sprite(sprMiniature,9,x*0.125,y*0.125) else draw_sprite(sprMiniature,3,x*0.125,y*0.125)
}
with objWallBrickH {
draw_sprite(sprMiniature,8,x*0.125,y*0.125)
}
with objWallBrickV {
draw_sprite(sprMiniature,9,x*0.125,y*0.125)
}
with objWallHospitalH {
draw_sprite(sprMiniature,8,x*0.125,y*0.125)
}
with objWallHospitalV {
draw_sprite(sprMiniature,9,x*0.125,y*0.125)
}
with objGlassPanelH {
draw_sprite(sprMiniature,4,x*0.125,y*0.125)
}
with objGlassPanelV {
draw_sprite(sprMiniature,5,x*0.125,y*0.125)
}
with objDoorV {
if object_index=objDoorH draw_sprite(sprMiniature,6,x*0.125,(y+5)*0.125-1) 
if object_index=objDoorV draw_sprite(sprMiniature,7,(x+5)*0.125-1,y*0.125)
if object_index=objDoorH2 draw_sprite(sprMiniature,6,(x-32)*0.125,(y+5)*0.125-1) 
if object_index=objDoorV2 draw_sprite(sprMiniature,7,(x+5)*0.125-1,(y-32)*0.125)
}
surface_reset_target()
surface_save(surf,room_get_name(room)+string(global.i)+".bmp")
global.i+=1
}
surface_free(surf)
//room_goto_next()
}
