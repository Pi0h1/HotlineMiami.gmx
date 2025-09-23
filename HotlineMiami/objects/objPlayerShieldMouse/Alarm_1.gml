my_id = instance_create(x, y, objDeadBody);
global.dir = dir;
with (my_id)
    move_contact_solid(global.dir - 45, 12);
if (shotgunned) {
    my_id.sprite_index = choose(sprEBackShotgun, sprEBackShotgun, sprEFrontShotgun);
    my_id.image_index = floor(random(2));
} else {
    my_id.sprite_index = choose(sprEBackMachinegun, sprEBackMachinegun, sprEFrontMachinegun);
    my_id.image_index = floor(random(3));
}
my_id.direction = dir - 180;
my_id.speed = random(1) + bullets * 0.15;
my_id.image_angle = my_id.direction;
instance_destroy();
my_id = instance_create(x, y, objPlayerMouse);
my_id.ammo = ammo;
switch (sprite_index) {
    case sprPHumanShieldDoubleBarrel: my_id.sprite = sprPWalkDoubleBarrel; break;
    case sprPHumanShieldMagnum: my_id.sprite = sprPWalkMagnum; break;
    case sprPHumanShieldScorpion: my_id.sprite = sprPWalkScorpion; break;
    case sprPHumanShieldUzi: my_id.sprite = sprPWalkUzi; break;
    case sprPHumanShieldMP5: my_id.sprite = sprPWalkMP5; break;
    case sprPHumanShieldSilencer: my_id.sprite = sprPWalkSilencer; break;
    default: my_id.sprite = sprPWalkUnarmed;
}

