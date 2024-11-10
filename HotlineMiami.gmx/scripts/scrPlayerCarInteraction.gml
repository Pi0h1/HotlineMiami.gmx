image_index=index
if objEffector.fade=0 {
    //  Pull player towards car
    with objPlayer
    {
    sprite_index=sprPWalkUnarmed
        x += lengthdir_x(pspd,point_direction(x,y,other.x,other.y))
        y += lengthdir_y(pspd,point_direction(x,y,other.x,other.y))
        if pspd>0{pspd-=0.2}
        if pspd<0{pspd=0}
        active=0
    }
    
    if  objPlayer.x=objPlayerCar.x and 
        objPlayer.y=objPlayerCar.y{
        }
    //  Play Car Close SFX
    if image_index<=2 {PlaySFX(sndCarClose)}
    //  Play Car Engine SFX
    if engine=0 and image_index>7 {engine=1 PlaySFX(sndCarEngine)}
    //  Animation
    if image_index < 12 image_index += 0.2 else {
        scrEndLevel();
    }
}
