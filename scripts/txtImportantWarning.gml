/// txtImportantWarning(x,y,string)

// Back
amount = 0.5 + lengthdir_x(0.5, dir * 10)
draw_set_color(merge_color(c_white, c_aqua, amount))       
draw_text(argument0 + 1, argument1, argument2)

//Front
amount = 0.5 - lengthdir_x(0.5, dir * 10)
draw_set_color(merge_color(c_white, c_aqua, amount))
draw_text(argument0, argument1, argument2)
