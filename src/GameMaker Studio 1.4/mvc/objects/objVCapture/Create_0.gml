vcapture_init()
i=0
file="c:\\program1\\trailer"
while file_exists(file+string(i)+".avi") i+=1
file+=string(i)+".avi"
vcapture_begin(window_handle(),file,50)
sleep(2000)
