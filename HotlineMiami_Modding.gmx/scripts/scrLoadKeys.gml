var keys;
if file_exists(working_directory+"\keyboard.dat") {
file=file_text_open_read(working_directory+"\keyboard.dat")
keys=file_text_read_string(file)
i=0 
repeat (5) {
if i=0 global.upkey=string_copy(keys,i+1,1)
if i=1 global.leftkey=string_copy(keys,i+1,1)
if i=2 global.downkey=string_copy(keys,i+1,1)
if i=3 global.rightkey=string_copy(keys,i+1,1)
if i=4 global.restartkey=string_copy(keys,i+1,1)
i+=1
}
file_text_close(file)
}
