with objAnsweringMachine instance_destroy()
with objWeapon instance_destroy()
with objWeaponThrow instance_destroy()
with objKnockedOut instance_destroy()
if fade=1 exit
if select<14 select+=1 else select=0

sprite_index=sprite[select]

if move[select]="Interact" {
my_id=instance_create(x+32,y,objAnsweringMachine)
my_id.image_angle=-90
my_id.visible=0
my_id.angle=0
}

if move[select]="Pick Up" {
my_id=instance_create(x+16,y+16,objWeapon)
my_id.image_index=4
my_id.visible=0
my_id.angle=0
}
