start_y = 0
        txtWarning(x,y+80,text_SurfaceWarning,"",fntWarning,false)
        draw_set_font(fntMenu)
        repeat(4) {
                if i == 1 start_y += 28
                if select = i {
                        repeats = 6 + lengthdir_x(5, dir * 10)
                        repeat(repeats) {
                                draw_set_color(merge_color(c_fuchsia, c_white, ii * 0.085))
                                draw_text(x + ii, y + 56 + i * 20 + start_y, alt[i])
                                ii += 1
                        }
                } else {
                        if i = 1 and global.surfaces = 1 {
                                amount = 0.5 + lengthdir_x(0.5, dir * 10)
                                draw_set_color(merge_color(c_gray, c_dkgray, amount))
                                draw_text(x + 1, y + 56 + i * 20 + 1 + start_y, alt[i])
                                amount = 0.5 - lengthdir_x(0.5, dir * 10)
                                draw_set_color(merge_color(c_gray, c_dkgray, amount))
                                draw_text(x, y + 56 + i * 20 + start_y, alt[i])
                        } else {
                                amount = 0.5 + lengthdir_x(0.5, dir * 10)
                                draw_set_color(merge_color(c_white, c_aqua, amount))
                                draw_text(x + 1, y + 56 + i * 20 + 1 + start_y, alt[i])
                                amount = 0.5 - lengthdir_x(0.5, dir * 10)
                                draw_set_color(merge_color(c_white, c_aqua, amount))
                                draw_text(x, y + 56 + i * 20 + start_y, alt[i])
                        }
                }
                i += 1
        }
