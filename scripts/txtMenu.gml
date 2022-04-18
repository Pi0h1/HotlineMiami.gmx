/// txtMenu(x,y,string,hoverOption)
var colorSelect1 = c_fuchsia;
var colorSelect2 = c_white;

var colorOption1 = c_white;
var colorOption2 = c_aqua;

var optionString = argument2;
var hoverOption = argument3;
var amount = 0;

if (hoverOption){
    draw_set_color(merge_color(colorSelect1, colorSelect2, ii * 0.085))
    draw_text(argument0 + ii,argument1,argument2)
    ii += 1
} else {
    // Background
    amount = 0.5 + lengthdir_x(0.5, dir * 10)
    draw_set_color(merge_color(colorOption1, colorOption2, amount))
    draw_text(argument0 + 1, argument1 + 1, argument2)
    // Front
    amount = 0.5 - lengthdir_x(0.5, dir * 10)
    draw_set_color(merge_color(colorOption1, colorOption2, amount))
    draw_text(argument0, argument1, argument2)

}
