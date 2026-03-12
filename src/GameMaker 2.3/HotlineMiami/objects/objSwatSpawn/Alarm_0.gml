if swats>0 {
swats-=1
my_id=instance_create(x,y,objSwat)
with my_id {move_contact_solid(180,200) x+=8 direction=270 diradd=1}
my_id=instance_create(x,y,objSwat)
with my_id {move_contact_solid(0,200) x-=8 direction=270 diradd=-1}
alarm[0]=180
}
