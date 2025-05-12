if global.xbox=1 scrInitXboxButtons()
title=""
band[0]="SUN ARAW"
band[1]="COCONUTS"
band[2]="M.O.O.N."
band[3]="JASPER BYRNE"
band[4]="EL HUERVO"
band[5]="PERTURBATOR"
band[6]="SCATTLE"
band[7]="ELIOTT BERLIN"
band[8]="& EIRIK SUHRKE"

dir=0
if surface_exists(global.surf1) surface_free(global.surf1)
global.surf1=surface_create(room_width,room_height)
surface_set_target(global.surf1)
draw_clear_alpha(c_black,0)
surface_reset_target()
i=-30
current=0
addx=0
blackx=30
fade=0
c_amount=0
