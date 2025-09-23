if (image_index < 2)
    image_index += addspeed;
else {
    if (!global.blood || global.surfaces)
        addToSurface(global.surf3, 0);
}

