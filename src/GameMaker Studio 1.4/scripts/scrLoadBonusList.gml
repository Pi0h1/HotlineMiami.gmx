//show_message("Bonuslist Loaded!")
ds_list_clear(global.bonuslist)
file=file_text_open_read("stats.sav")
i=0
while !file_text_eof(file) {
ds_list_add(global.bonuslist,file_text_read_string(file))
file_text_readln(file)
i+=1
}
file_text_close(file)
