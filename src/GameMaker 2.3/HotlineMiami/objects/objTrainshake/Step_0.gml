if on=0 {
if wait>0 wait-=1 else {
audio_play_sound(sndTrain,0,false)
on=1
start_time=current_time
}
} else {
if current_time-start_time>=5000 {instance_destroy() exit}
global.shake=5
if current_time-start_time<1500 {global.shake=(current_time-start_time)*(5/1500)}
if current_time-start_time>3500 {global.shake=(2000-(current_time-start_time-3500))*(5/1500)}
}

