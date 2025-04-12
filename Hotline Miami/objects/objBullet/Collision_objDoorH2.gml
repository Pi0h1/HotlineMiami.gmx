my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objHit)
my_id.image_angle=direction
my_id=instance_create(x+lengthdir_x(14,direction),y+lengthdir_y(14,direction),objSmokeHit)
my_id.image_angle=direction
my_id.direction=random(360)
my_id.speed=random(0.5)
instance_destroy()
if other.solid=1 exit
if abs(other.swingspeed)<8 {
other.swingspeed+=vspeed*0.2
if other.swingspeed>3.5 other.swinger=1
}
