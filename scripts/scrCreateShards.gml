repeat (24) {
my_id=instance_create(x,y+i*1.5,objShard)
my_id.speed=random(5)
my_id.direction=90+add*90-8+random(16)
i+=1
}
