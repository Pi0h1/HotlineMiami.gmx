draw_clear(c_black);
screen_refresh();
surface_free(global.surf2);
global.surf2 = surface_create(view_get_wport(0), view_get_hport(0));
surface_set_target(global.surf2);
draw_clear_alpha(make_color_hsv(0, 0, 2), 0);
surface_alpha();
surface_reset_target();

save = 0;
global.draw = true;
dizziness = 0.1;
myx1 = 0;
myy1 = 0;
myx2 = 0;
myy2 = 0;
h1 = 0;
h2 = 155;
dir = random(10000);
noiseindex = 0;

