image_angle -= abs(hspeed);
if (!place_free(x + hspeed * 20, y))
    hspeed = -hspeed;
if (!place_free(x, y + vspeed * 20))
    vspeed = -vspeed;

