if gettrigger_l()>100 {
if pressltrig=0 {
pressltrig=1
if visible=0 or reload>0 exit
with objPlayer {
sprite_index=sprPWalkUnarmed
global.done=1
}
with objPlayerPants instance_destroy()
instance_destroy()
objEffector.brus=10
with objBackgroundColorClear instance_destroy()
instance_create(x,y,objBackgroundColor)
}
} else pressltrig=0
