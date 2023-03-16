d3d_set_projection_ortho(0,0,view_wview[0],view_hview[0],0)
showammo=0
if instance_exists(objPlayer) and !instance_exists(objPhoneConversation) {
if objPlayer.sprite_index=sprPWalkM16 or objPlayer.sprite_index=sprPAttackM16 {
showammo=1
maxammo=24
} 
if objPlayer.sprite_index=sprPWalkUzi or objPlayer.sprite_index=sprPAttackUzi {
showammo=1
maxammo=30
} 
if objPlayer.sprite_index=sprPWalkScorpion or objPlayer.sprite_index=sprPAttackScorpion {
showammo=1
maxammo=20
} 
if objPlayer.sprite_index=sprPWalkMagnum or objPlayer.sprite_index=sprPAttackMagnum {
showammo=1
maxammo=6
} 
if objPlayer.sprite_index=sprPWalkSilencedUzi or objPlayer.sprite_index=sprPAttackSilencedUzi {
showammo=1
maxammo=30
} 
if objPlayer.sprite_index=sprPWalkShotgun or objPlayer.sprite_index=sprPAttackShotgun {
showammo=1
maxammo=6
} 
if objPlayer.sprite_index=sprPWalkDoubleBarrel or objPlayer.sprite_index=sprPAttackDoubleBarrel1 or objPlayer.sprite_index=sprPAttackDoubleBarrel2  {
showammo=1
maxammo=2
}
if objPlayer.sprite_index=sprPWalkSilencer or objPlayer.sprite_index=sprPAttackSilencer {
showammo=1
maxammo=13
} 
if objPlayer.sprite_index=sprPWalkMP5 or objPlayer.sprite_index=sprPAttackMP5 {
showammo=1
maxammo=32
} 
if objPlayer.sprite_index=sprPWalkMP5 or objPlayer.sprite_index=sprPAttackMP5 {
showammo=1
maxammo=32
} 
if showammo=1 ammostring=string(objPlayer.ammo)+"/"+string(maxammo)+"rnds" else ammostring="NO GUN!"
if instance_exists(objPlayerBiker) or instance_exists(objPlayerBikerHouse) {
if room=rmHideout or room=rmJanitors nothing=1 else {
if objPlayer.ammo>0 and (instance_exists(objEnemy) or instance_exists(objECrawl) or instance_exists(objBoss) or instance_exists(objKnockedOut)) {showammo=1 ammostring=string(objPlayer.ammo)+" KNIVES"} else {ammostring="NO KNIVES!" showammo=0}
}
}
}
scorestring=global.drawscore
if instance_exists(objPlayerDead) {
if room=rmSequence12b or room=rmSequence12c nothing=1 else {
ammostring=global.restartkey+" TO RESTART!" 
scorestring="YOU'RE DEAD!"
showammo=1
}
}
if showammo=1 {


draw_set_valign(fa_top)
draw_set_font(fntScore)
draw_set_color(merge_color(c_black,c_maroon,0.25+lengthdir_x(0.25,dir*4)))
draw_set_halign(fa_left)
draw_text_transformed(8+1,view_hview[0]-44+1,ammostring,1,1,0)
draw_set_halign(fa_right)
draw_text_transformed(view_hview[0]-8+1,view_hview[0]+32+1,ammostring,1,1,0)
draw_set_color(merge_color(c_white,c_red,0.25+lengthdir_x(0.25,dir*4)))
dir+=8
draw_set_halign(fa_left)
draw_text_transformed(8,view_hview[0]-44,ammostring,1,1,0)
draw_set_halign(fa_right)
draw_text_transformed(view_hview[0]-8,view_hview[0]+32,ammostring,1,1,0)
}
