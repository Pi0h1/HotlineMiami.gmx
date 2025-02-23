function create_level() {
	my_x=2+floor(6)*32
	my_y=2+floor(6)*32
	repeat (5)
	{
	if my_x<room_width-96 
	{
	my_id=instance_create(my_x,16,wallsetter)
	my_id.my_x=0
	my_id.my_y=16
	}
	if my_y<room_height-96 
	{
	my_id=instance_create(my_x,16,wallsetter)
	my_id.my_x=16
	my_id.my_y=0
	}
	my_x+=2+floor(6)*32
	my_y+=2+floor(6)*32
	}
	my_x=2+floor(6)*32
	my_y=2+floor(6)*32
	repeat (5)
	{
	if my_x<room_width-96 
	{
	my_id=instance_create(my_x,room_height-32,wallsetter)
	my_id.my_x=0
	my_id.my_y=-16
	}
	if my_y<room_height-96 
	{
	my_id=instance_create(room_width-32,my_y,wallsetter)
	my_id.my_x=16
	my_id.my_y=0
	}
	my_x+=2+floor(6)*32
	my_y+=2+floor(6)*32
	}



}
