dir += 0.25;
color2 = c_black;
color1 = merge_color(c_black, merge_color(merge_color(c_fuchsia, c_aqua, 0.5 + lengthdir_x(0.5, dir * 3.12)), c_red, 0.125 + lengthdir_y(0.125, dir * 1.73)), 0.75 + lengthdir_y(0.25, dir * 1.73));
draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 60, __view_get( e__VW.YView, 0 ) - 60, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 60, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 60, color1, color1, color2, color2, 0);
if (global.bonustime > 0) {
    if (lastbonus <= 0) {
        if (global.alienware)
            scrAlienWareRed();
    }
    global.bonustime--;
    if (global.bonustime <= 0) {
        if (global.alienware)
            scrAlienWarePink()
    }
    draw_set_blend_mode(bm_add);
    amount = global.bonustime * 0.25;
    while (amount > 1)
        amount--;;
    if (!global.comboflash) {
        color1 = merge_color(c_red, c_black, amount);
        color2 = merge_color(c_maroon, c_black, amount);
    } else {
        color1 = merge_color(c_yellow, c_black, amount);
        color2 = merge_color(c_orange, c_black, amount);
    }
    draw_rectangle_color(__view_get( e__VW.XView, 0 ) - 60, __view_get( e__VW.YView, 0 ) - 60, __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 60, __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 60, color1, color1, color2, color2, 0);
    draw_set_blend_mode(bm_normal);
}
lastbonus = global.bonustime;

