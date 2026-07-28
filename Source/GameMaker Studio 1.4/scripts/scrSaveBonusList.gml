//show_message("Bonuslist Saved")
if file_exists("stats.sav") file_delete("stats.sav")
file=file_text_open_write("stats.sav")
i=0
repeat ds_list_size(global.bonuslist) {
file_text_write_string(file,ds_list_find_value(global.bonuslist,i))
file_text_writeln(file)
i+=1
}
file_text_close(file)
