/// Shoot(sound, speed, delay, screenshake, silenced?, go through enemies?, type)

sprite_index    =   asset_get_index(string_replace(sprite_get_name(sprite_index),"Walk","Attack"));

/*  The attack sprites always have the exact same name as the walk sprites but
    with the verb attack instead of walk. 
    
    So instead of manually setting each attack sprite for each corresponding walk sprite; 
    just grab the name of the current walk sprite and look for the attack animation by
    replacing the word "walk" for "attack" in the current sprite_index.

*///======================================================================================///*

image_index     =   0;              // Start the animation at frame 0

image_speed     =   argument1;      // Speed for the animation will play at

reload          =   argument2;      // Delay when using the weapon

global.shake    =   argument3;      // Screenshake

ammo            -=  1;              // Remove ammo

light           =   12;             // Make the player light up when firing

silenced        =   argument4;      // Sets whether the gun is silenced or not

PlaySFX(argument0);                 // Plays sound effect 

CreateBullet(objBullet,argument5);  // Creates bullet

CreateShell(argument6);             // Creates shell

if silenced=false {scrHearPlayer()} // The gun isn't silenced? alert the enemies


