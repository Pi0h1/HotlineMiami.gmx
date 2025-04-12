//1. all guns
//2. all melee
//3. all masks
//4. all ground kills
//

if file_exists(working_directory+"\achievements.dat") file_delete(working_directory+"\achievements.dat") 

file=file_text_open_write(working_directory+"\achievements.dat")
i=0
repeat (26) {
file_text_write_string(file,string(global.usedmask[i]))
i+=1
}
file_text_writeln(file)
i=0
repeat (9) {
file_text_write_string(file,string(global.usedgun[i]))
i+=1
}
file_text_writeln(file)
i=0
repeat (14) {
file_text_write_string(file,string(global.usedmelee[i]))
i+=1
}
file_text_writeln(file)
i=0
repeat (7) {
file_text_write_string(file,string(global.usedthrow[i]))
i+=1
}
file_text_writeln(file)
i=0
repeat (21) {
file_text_write_string(file,string(global.usedkill[i]))
i+=1
}
file_text_close(file)
