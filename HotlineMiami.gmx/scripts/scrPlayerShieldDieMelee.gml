if global.godmode=1 exit
with objPlayer {
    image_xscale=1
    image_yscale=1
    edir=point_direction(global.my_id.x,global.my_id.y,x,y)
    createBlood(edir);
    if 3>1 or round(random(1)) or energie<0 {
        createDeadBody(false,1.5,sprEBackShieldSnap,edir-8+random(16))
        createDeadBody(true,1.5,sprPBackCut,edir)
        instance_destroy()
    }
}
