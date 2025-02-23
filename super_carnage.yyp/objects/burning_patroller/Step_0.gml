if place_free(x+lengthdir_x(2,direction),y) x+=lengthdir_x(2,direction)
if place_free(x,y+lengthdir_y(2,direction)) y+=lengthdir_y(2,direction)
if !place_free(x+lengthdir_x(20,direction),y+lengthdir_y(20,direction)) or !place_free(x+lengthdir_x(8,direction),y+lengthdir_y(8,direction)) direction+=10*dir_change
my_angle=direction
if round(random(3))=1 instance_create(x-12+random(24),y-12+random(24),smoke2)
if life>0 life-=1 else instance_destroy()
