//1. all guns
//2. all melee
//3. all masks
//4. all ground kills
//

i=0
repeat (26) {
global.usedmask[i]=0
i+=1
}
i=0
repeat (9) {
global.usedgun[i]=0
i+=1
}
i=0
repeat (14) {
global.usedmelee[i]=0
i+=1
}
i=0
repeat (7) {
global.usedthrow[i]=0
i+=1
}
i=0
repeat (21) {
global.usedkill[i]=0
i+=1
}

if !file_exists(working_directory+"\achievements.dat") {
file=file_text_open_write(working_directory+"\achievements.dat")
repeat (26) file_text_write_string(file,"0")
file_text_writeln(file)
repeat (9) file_text_write_string(file,"0")
file_text_writeln(file)
repeat (14) file_text_write_string(file,"0")
file_text_writeln(file)
repeat (7) file_text_write_string(file,"0")
file_text_writeln(file)
repeat (21) file_text_write_string(file,"0")
file_text_close(file) 
} else {
file=file_text_open_read(working_directory+"\achievements.dat")
masks=file_text_read_string(file)
i=0
repeat (string_length(masks)) {
global.usedmask[i]=real(string_copy(masks,i+1,1))
i+=1
}
file_text_readln(file)
guns=file_text_read_string(file)
i=0
repeat (string_length(guns)) {
global.usedgun[i]=real(string_copy(guns,i+1,1))
i+=1
}
file_text_readln(file)
melee=file_text_read_string(file)
i=0
repeat (string_length(melee)) {
global.usedmelee[i]=real(string_copy(melee,i+1,1))
i+=1
}
file_text_readln(file)
throws=file_text_read_string(file)
i=0
repeat (string_length(throws)) {
global.usedthrow[i]=real(string_copy(throws,i+1,1))
i+=1
}
file_text_readln(file)
kills=file_text_read_string(file)
i=0
repeat (string_length(kills)) {
global.usedkill[i]=real(string_copy(kills,i+1,1))
i+=1
}
file_text_close(file)
}
