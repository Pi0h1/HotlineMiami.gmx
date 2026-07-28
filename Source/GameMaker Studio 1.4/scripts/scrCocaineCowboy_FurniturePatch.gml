// Fix for furniture placement in the early beta levels.
if instance_exists(objSofaH64) {
    with objSofaH64 {
        x += (sprite_get_width(sprite_index)/2);
        y += (sprite_get_height(sprite_index)/2);
    }
}

if instance_exists(objSofaH48) {
    with objSofaH48 {
        x += (sprite_get_width(sprite_index)/2);
        y += (sprite_get_height(sprite_index)/2);
    }
}

// Fix for windows
if instance_exists(objWindowH) {
    with (objWindowH) {
        // Replace the sprite.
        sprite_index = sprCowboy_WindowUp;
        if (y > room_height / 2) {sprite_index = sprCowboy_WindowDown;}
    }
}

if instance_exists(objWindowV) {
    with (objWindowV) {
        // Replace the sprite.    
        sprite_index = sprCowboy_WindowRight;
        if (x < room_width / 2) {sprite_index = sprCowboy_WindowLeft;}
    }
}
