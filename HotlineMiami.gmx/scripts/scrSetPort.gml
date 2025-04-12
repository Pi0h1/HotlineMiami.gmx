i=0
width=display_get_width()
if width<1200 {
repeat (300) {
if room_exists(i) {
room_set_view(i,0,1,0,0,399,255,0,0,900,576,0,0,0,0,-1)
}
room_set_view(rmDennatonSplash,0,1,0,0,199,127,0,0,900,576,0,0,0,0,-1)
room_set_view(rmBikeEnding,0,1,0,0,399,139,0,0,900,315,0,0,0,0,-1)
room_set_view(rmBikeEnding,1,1,0,140,399,86,0,315,900,261,0,0,0,0,-1)
/*view0 w399 h139 wp1200 hp420
view1 x0 y420 w399 h115 wp1200 hp348
view1 x0 y315 w399 h115 wp1200 hp348*/
i+=1
}
}
