i=0
show_message('exporting to '+working_directory)
repeat (3000)
{
ii=0
if sprite_exists(i) {
repeat (sprite_get_number(i)) {
sprite_save(i,ii,working_directory+'\hlm_GFX\'+sprite_get_name(i)+'_'+string(ii)+'.bmp')
ii+=1
}
}
i+=1
}
