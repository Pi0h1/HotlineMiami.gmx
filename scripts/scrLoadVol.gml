if file_exists(working_directory+"\volume.dat") {
file=file_text_open_read(working_directory+"\volume.dat")
global.mvol=real(file_text_read_string(file))*0.01
file_text_readln(file)
global.svol=real(file_text_read_string(file))*0.01
file_text_close(file)
}
