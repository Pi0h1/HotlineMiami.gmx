global.levels[scrGetCurrentLevel()-1]=1
scrSaveUnlocked()
scrSaveAchievements()
if argument0=rmSequence1 text="April 3rd, 1989#Miami - Florida"
if argument0=rmSequence2 text="April 8th, 1989#Miami - Florida"
if argument0=rmSequence3 text="April 16th, 1989#Miami - Florida"
if argument0=rmSequence4 text="April 25th, 1989#Miami - Florida"
if argument0=rmSequence5 text="May 5th, 1989#Miami - Florida"
if argument0=rmSequence6 text="May 11th, 1989#Miami - Florida"
if argument0=rmSequence7 text="May 13th, 1989#Miami - Florida"
if argument0=rmSequence8 text="May 23rd, 1989#Miami - Florida"
if argument0=rmSequence9 text="May 27th, 1989#Miami - Florida"
if argument0=rmSequence10 text="May 31st, 1989#Miami - Florida"
if argument0=rmSequence11 text="June 3rd, 1989#Miami - Florida"
if argument0=rmSequence12 text="June 8th, 1989#Miami - Florida"
if argument0=rmSequence13 text="July 22nd, 1989#Miami - Florida"
if argument0=rmSequence14 text="July 23rd, 1989#Miami - Florida"
if argument0=rmHospitalTopFloor text="July 21st, 1989#Miami - Florida"
if argument0=rmMCBar text="May 13th, 1989#Miami - Florida"
if argument0=rmMCSequence2 text="May 16th, 1989#Miami - Florida"
if argument0=rmMCSequence3 text="May 23rd, 1989#Miami - Florida"
if argument0=rmMCSequence4 text="May 24th, 1989#Miami - Florida"
if room=rmMCBar nothing=1 else {
draw_set_font(fntDate)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
d3d_set_projection_ortho(0,0,view_wview[0],view_hview[0],0)
i=0
draw_clear(c_black)
repeat (100) {
draw_set_color(merge_color(c_black,c_gray,i*(1/60)))
draw_text(view_wview[0]/2+1,view_hview[0]/2+1,text)
draw_set_color(merge_color(c_black,c_white,i*(1/60)))
draw_text(view_wview[0]/2,view_hview[0]/2,text)
if i<60 i+=1
sleep(1000/60)
screen_refresh()
}
}
show_date=1
