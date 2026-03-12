if image_index=1 {
my_id=instance_create(x,y,objBrokenBottle)
audio_play_sound(sndGlass1,0,false)
instance_destroy()
exit
}
bounce=1
move_bounce_all(0)
speed*=0.3
audio_play_sound(sndHitWall,0,false)

