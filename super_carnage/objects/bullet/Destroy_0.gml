sound_play(wall_hit)
my_hit=instance_create(x,y,flash)
my_hit.direction=direction
with my_hit move_contact_solid(direction,16)

