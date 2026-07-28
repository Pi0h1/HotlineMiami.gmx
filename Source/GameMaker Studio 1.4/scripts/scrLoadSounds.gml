i=0
repeat (200)
{
if sound_exists(i) and file_exists(working_directory+"\Sounds\"+sound_get_name(i)+".wav") sound_replace(i,working_directory+"\Sounds\"+sound_get_name(i)+".wav",0,1)
i+=1
}
