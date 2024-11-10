global.masks[0]=1
i=1 
repeat (25){
global.masks[i]=0
i+=1
}
i=1
global.levels[0]=1
repeat (20) {
global.levels[i]=0
i+=1
}
i=0
repeat (17) {
global.newgun[i]=0
i+=1
}
i=0
repeat (16) {
global.letter[i]=0
i+=1
}
i=0
repeat (20) {
global.grade[i]=0
i+=1
}
i=0
repeat (20) {
global.highscore[i]=0
i+=1
}

global.totalscore=0
global.puzzledone=0

if file_exists(working_directory+"\saves.dat") {
file=file_text_open_read(working_directory+"\saves.dat")
masks=file_text_read_string(file)
i=0
repeat (string_length(masks)) {
global.masks[i]=real(string_copy(masks,i+1,1))
i+=1
}
file_text_readln(file)
levels=file_text_read_string(file)
i=0
repeat (string_length(levels)) {
global.levels[i]=real(string_copy(levels,i+1,1))
i+=1
}
file_text_readln(file)
newguns=file_text_read_string(file)
i=0
repeat (string_length(newguns)) {
global.newgun[i]=real(string_copy(newguns,i+1,1))
i+=1
}
file_text_readln(file)
letters=file_text_read_string(file)
i=0
repeat (string_length(letters)) {
global.letter[i]=real(string_copy(letters,i+1,1))
i+=1
}
file_text_readln(file)
global.totalscore=real(file_text_read_string(file))
i=0
repeat (20) {
file_text_readln(file)
global.grade[i]=real(file_text_read_string(file))
i+=1
}
i=0
repeat (20) {
file_text_readln(file)
global.highscore[i]=real(file_text_read_string(file))
i+=1
}
file_text_readln(file)
global.puzzledone=real(file_text_read_string(file))
file_text_close(file)
} else {
file=file_text_open_write(working_directory+"\saves.dat")
file_text_write_string(file,"10000000000000000000000000")
file_text_writeln(file)
file_text_write_string(file,"10000000000000000000")
file_text_writeln(file)
file_text_write_string(file,"0000000000000000")
file_text_writeln(file)
file_text_write_string(file,"0000000000000000")
file_text_writeln(file)
file_text_write_string(file,"0")
repeat (20) {
file_text_writeln(file)
file_text_write_string(file,"0")
}
repeat (20) {
file_text_writeln(file)
file_text_write_string(file,"0")
}
file_text_writeln(file)
file_text_write_string(file,"0")
file_text_close(file)
}
