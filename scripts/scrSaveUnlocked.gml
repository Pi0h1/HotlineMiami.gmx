//show_message(room_get_name(global.sequence))
file_delete(working_directory+"\saves.dat")
file=file_text_open_write(working_directory+"\saves.dat")
i=0
test=""
repeat (26) {
test+=string(global.masks[i])
i+=1
}
file_text_write_string(file,test)
file_text_writeln(file)

i=0
test=""
repeat (20) {
test+=string(global.levels[i])
i+=1
}

file_text_write_string(file,test)
file_text_writeln(file)

i=0
test=""
repeat (16) {
test+=string(global.newgun[i])
i+=1
}

file_text_write_string(file,test)
file_text_writeln(file)

i=0
test=""
repeat (16) {
test+=string(global.letter[i])
i+=1
}
file_text_write_string(file,test)
file_text_writeln(file)
file_text_write_string(file,string(global.totalscore))
i=0
repeat (20) {
file_text_writeln(file)
file_text_write_string(file,string(global.grade[i]))
i+=1
}
i=0
repeat (20) {
file_text_writeln(file)
file_text_write_string(file,string(global.highscore[i]))
i+=1
}
file_text_writeln(file)
file_text_write_string(file,string(global.puzzledone))
file_text_close(file)
