if global.xbox=1 {
if checkbutton(0,getid(5)) or checkbutton(0,getid(11)) {
if presstart=0 {
presstart=1
scrXboxEndingDialogue1Start()
} 
} else presstart=0

if leftthumb_y(0)>5000 {
if pressup=0 {
pressup=1
scrXboxEndingDialogue1Up()
}
} else pressup=0

if leftthumb_y(0)<-5000 {
if pressdown=0 {
pressdown=1
scrXboxEndingDialogue1Down()
}
} else pressdown=0

}

if stop=1 {
if blackx>15 {blackx-=2.5} else 
{objEffector.blackx=blackx with objPlayerBiker {my_id=instance_create(x,y,objPlayerBiker) my_id.sprite_index=sprBoss2Walk instance_destroy()} global.done=1 instance_create(x,y,objLevelComplete)  instance_destroy()}
}
