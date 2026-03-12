switch (room) {
    case rmDennatonSplash:
        _x = __view_get( e__VW.WView, 0 );
        _y = __view_get( e__VW.HView, 0 );
        _r = (room_width*0.60)+random(24);
    break;
    default:
        _x = __view_get( e__VW.WView, 0 )/2;
        _y = __view_get( e__VW.HView, 0 )/2;
        _r = (__view_get( e__VW.WView, 0 )*0.60)+random(24);
    break;
}

draw_set_blend_mode(bm_subtract);
draw_circle_color(_x,_y,_r,c_black,merge_color(c_navy,c_aqua,0.25+random(0.25)),0);
draw_set_blend_mode(bm_normal);
