dist-=speed
if dist<=0 {
speed=0
instance_create(x,y,objWaterPuddle)
repeat (4) instance_create(x,y,objSteam)
instance_destroy()
}
if round(random(6))=2 instance_create(x,y,objSteam)
