if other.object_index=objEnemyFat exit
with other {
my_id=instance_create(x,y,objBurningGuy)
my_id.direction=direction
instance_destroy()
}
