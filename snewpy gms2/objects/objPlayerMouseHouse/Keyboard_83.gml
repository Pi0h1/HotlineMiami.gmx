exit
if persistent=1 and objEffector.fade=1 exit
if instance_exists(objPhoneConversation) exit
if active=0 exit
scrMoveSolidOn()
if place_free(x,y+3) {y+=3-keyboard_check_direct(vk_shift)} else {
if place_free(x-6,y+3) x-=3-keyboard_check_direct(vk_shift) else {
if place_free(x+6,y+3) x+=3-keyboard_check_direct(vk_shift)
}
}
if image_speed=0 image_index+=0.15-keyboard_check_direct(vk_shift)*0.05
legdir=270 
if keyboard_check(ord("A")) legdir=225
if keyboard_check(ord("D")) legdir=315
legindex+=0.4-keyboard_check_direct(vk_shift)-keyboard_check_direct(vk_shift)*0.15
scrMoveSolidOff()