if gettrigger_r()>20 {
scrXboxPlayerShoot()
} else pressrtrig=0

if gettrigger_l()>50 {
if pressltrig=0 {
pressltrig=1
scrPlayerPickUp()
}
} else {pressltrig=0 release=0}

if checkbutton(0,getid(10)) {
if pressrb=0 {
pressrb=1
scrPlayerPickUp()
}
} else pressrb=0

if checkbutton(0,getid(11)) {
if pressa=0 {
pressa=1
scrKillShield()
}
} else pressa=0

if checkbutton(0,getid(8)) {
if pressrstick=0 {
pressrstick=1
scrXboxPlayerLockOn()
}
} else pressrstick=0
