/// txtWarning(,x,y,string,string2, font,includeNote)
descriptionOffset = 214;
includeNote = argument5;
draw_set_font(argument4);
draw_set_color(c_black);
draw_text(argument0 + 1, argument1 + 1, argument2);
        
draw_text_color(argument0, argument1, argument2, 
merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10)), merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 90)), 
merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 180)), 
merge_color(c_white, c_yellow, 0.5 + lengthdir_x(0.5, dir * 10 + 270)), 1);

if (includeNote) {
    draw_set_color(c_black);
    draw_text(argument0+1, descriptionOffset+1, argument3);
    draw_set_color(c_white);
    draw_text(argument0, descriptionOffset, argument3);
}
