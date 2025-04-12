if file_exists(working_directory+"\keyboard.dat") file_delete(working_directory+"\keyboard.dat")
file=file_text_open_write(working_directory+"\keyboard.dat")
file_text_write_string(file,global.upkey+global.leftkey+global.downkey+global.rightkey+global.restartkey)
file_text_close(file)
