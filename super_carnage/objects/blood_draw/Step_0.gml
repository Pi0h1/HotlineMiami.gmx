if instance_exists(blood_small)
{
with blood_small
{
surface_set_target(blood_draw.blood_surface)
draw_my_sprite()
surface_reset_target()
instance_destroy()
}
}

if instance_exists(blood_splat)
{
with blood_splat
{
surface_set_target(blood_draw.blood_surface)
draw_my_sprite()
surface_reset_target()
instance_destroy()
}
}

if instance_exists(soot)
{
with soot
{
surface_set_target(blood_draw.blood_surface)
draw_my_sprite()
surface_reset_target()
instance_destroy()
}
}

if instance_exists(cartridge)
{
with cartridge
{
if speed=0
{
surface_set_target(blood_draw.blood_surface)
draw_my_sprite()
surface_reset_target()
instance_destroy()
}
}
}

if instance_exists(flesh)
{
with flesh
{
if speed=0
{
surface_set_target(blood_draw.blood_surface)
draw_my_sprite()
surface_reset_target()
instance_destroy()
}
}
}

if instance_exists(brains)
{
with brains
{
if speed=0
{
surface_set_target(blood_draw.blood_surface)
draw_my_sprite()
surface_reset_target()
instance_destroy()
}
}
}
