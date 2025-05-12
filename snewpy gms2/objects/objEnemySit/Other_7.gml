x+=lengthdir_x(16,direction)
y+=lengthdir_y(16,direction)
my_id=instance_create(x,y,type)
my_id.alert=1
my_id.checkreload=15
if global.enemy=id global.enemy=my_id

//show_message(string(direction))
scrMoveSolidOn()
//with my_id move_outside_solid(global.dir,32)
scrMoveSolidOff()
instance_destroy()
