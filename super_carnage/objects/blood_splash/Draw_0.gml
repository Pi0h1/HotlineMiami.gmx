if time>0 time-=1 else
{
if image_alpha>0 image_alpha-=0.01 else instance_destroy()
}
i=0
repeat number
{
draw_sprite_index_angle(blood_spr,blood_index[i],blood_angle[i])
i+=1
}
