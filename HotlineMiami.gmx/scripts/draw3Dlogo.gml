if coldir > 90 {
        i = 0
        times = lengthdir_x(40, dir * 12)
        if times < 1 times = 1
        repeat(1 + (coldir - 90) * 0.4) {
                //Colours of the text.
                color2 = merge_color(c_fuchsia, color, i * 0.025)
                color9 = merge_color(c_red, c_white, i * 0.025)
                //Draws 3D Logo.
                draw_sprite_ext(sprTitle, 0, lengthdir_x(i * 0.25, dir * 4 + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, dir * 4 + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color2, 1)
                if i < times draw_sprite_ext(sprTitle, 1, lengthdir_x(i * 0.25, dir * 4 + 180) + x + lengthdir_x(i * 0.5, dir * 4), lengthdir_y(i * 0.25, dir * 4 + 180) + y + lengthdir_y(i * 0.5, dir * 4), 1, 1, lengthdir_y(5, dir * 4), color9, 1)
                i += 1
        }
} else {
        draw_sprite_ext(sprTitle, 0, x, y, 1, 1, lengthdir_y(5, dir * 4), c_fuchsia, 1)
}
