grid_tilesize = 40; // size of the water-"tiles"
grid_offset = 0.00; // maximum grid animation offset measured in screen space (ranges 0 - 1)
grid_speed = 0.05; // speed the grid animates

// Create the variables for the water grid
grid_xsize = view_wport[0]/grid_tilesize;
grid_ysize = view_hport[0]/grid_tilesize;
xx = -1;
repeat grid_xsize + 1
begin
    xx += 1;
    yy = -1;
    repeat grid_ysize + 1
    begin
        yy += 1;
        
        grid_xtranslate[xx, yy] = random(10);
        grid_ytranslate[xx, yy] = random(10);
        
        grid_u[xx, yy] = xx/grid_xsize;
        grid_v[xx, yy] = yy/grid_ysize;
        
        // make sure the border UV's don't get an offset outside the surface area during the animation
        if xx = 0 then grid_u[xx, yy] = grid_offset;
        if yy = 0 then grid_v[xx, yy] = grid_offset;
        if xx = grid_xsize then grid_u[xx, yy] = 1-grid_offset;
        if yy = grid_ysize then grid_v[xx, yy] = 1-grid_offset;
    end;
end;
