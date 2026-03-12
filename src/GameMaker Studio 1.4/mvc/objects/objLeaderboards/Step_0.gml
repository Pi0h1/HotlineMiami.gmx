if !surface_exists(global.surf1) {
    global.surf1 = surface_create(room_width, room_height)
    surface_set_target(global.surf1)
    draw_clear_alpha(c_black, 0)
    surface_reset_target()
}
surface_set_target(global.surf1)
draw_clear_alpha(c_black, 0)
draw_set_font(fntDetails)
i = 0 repeat(7) {
    draw_line_color(0, 12 + i * 3, room_width, 12 + i * 3, merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, dir2 * 4 + i * 35)), merge_color(c_black, c_maroon, 0.25 + lengthdir_x(0.25, dir2 * 4 + i * 35) + 180))
    i += 1
}
draw_set_valign(fa_center)
draw_set_halign(fa_center)
if gradeon = 1 {
    draw_set_color(merge_color(c_lime, c_green, 0.5 + lengthdir_x(0.5, dir2 * 10)))
    draw_text((room_width / 2) + 1, 22, string_hash_to_newline("PLAY STYLE:#" + "\"" + type + "\""))
    draw_set_color(merge_color(c_lime, c_green, 0.5 + lengthdir_x(0.5, dir2 * 10 + 180)))
    draw_text((room_width / 2), 22, string_hash_to_newline("PLAY STYLE:#" + "\"" + type + "\""))
}
draw_set_font(fntFeats)
if dir < 180 dir += 18
else {
    if current < ds_list_size(global.bonuslist) current += 1 dir = 0
}
draw_y = 220
i = current - 1
cdir += 4
times = current - 1
if times > 13 times = 13
ii = 0
repeat(times) {
    draw_set_color(merge_color(merge_color(c_white, c_aqua, 0.5 + lengthdir_x(0.5, cdir + i * 20)), c_teal, 0.5 + lengthdir_x(0.5, cdir + i * 30)))
    mystring = ds_list_find_value(global.bonuslist, i)
    draw_text((room_width - 50) - string_width(string_hash_to_newline(mystring)) * 0.5 + lengthdir_x(3, cdir + i * 40), 190 - ii * (12), string_hash_to_newline(mystring))
    i -= 1
    ii += 1
}

surface_reset_target()

