d3d_set_projection_ortho(0, 0, view_wview[0], view_hview[0], 0)
color1 = merge_color(c_maroon, merge_color(c_aqua, c_fuchsia, 0.5 - lengthdir_x(0.5, dir * 2.32)), 0.75 + lengthdir_x(0.25, dir * 3))
color2 = merge_color(merge_color(c_aqua, c_fuchsia, 0.5 + lengthdir_x(0.5, dir * 2.32)), c_white, 0.5 + lengthdir_x(0.5, dir * 3))

dir += 1 + update * 7
global.dir += 1

scrDrawCombo    ();
scrDrawScore    ();
scrDrawAmmo     ();
scrDrawTutorial ();

draw_set_halign(fa_center)
draw_set_valign(fa_center)

//  -     TUTORIAL   -     //
if finish = 1 {
    draw_set_font(fntScore)
    //  rectangle   //    
    draw_rectangle_colour(
        view_wview[0] / 2 - string_width(finishstring) * 0.375 - 3, view_hview[0] - 22, view_wview[0] / 2 + string_width(finishstring) * 0.375 + 3, view_hview[0] + 3,
        c_black,c_black,c_black,c_black,0
    )
    //  shadow      //
    draw_text_transformed_colour(
        view_wview[0] / 2 + lengthdir_x(0.5, dir), view_hview[0] - 11 + lengthdir_x(0.5, dir), finishstring, 0.75, 0.75, lengthdir_x(2, dir * 1.34 + 90),
        color1,color1,color1,color1,1
    )
    //  front      //
    draw_text_transformed_colour(
        view_wview[0] / 2 + lengthdir_x(0.5, dir - 180), view_hview[0] - 11 + lengthdir_x(0.5, dir - 180), finishstring, 0.75, 0.75, lengthdir_x(2, dir * 1.34 + 100),
        color2,color2,color2,color2,1
    )
}

//  -     AMMO      -     //
draw_set_font(fntScore)
    //  rectangle   //
draw_rectangle_colour(
    0, view_hview[0] - ammoy - 11, 18 + string_width(ammostring) + 6, view_hview[0] - ammoy + 11,
    c_black,c_black,c_black,c_black,0
)
    //  shadow      //
if ammoy > -32 draw_text_transformed_colour(
    18 + string_width(ammostring) * 0.5 + lengthdir_x(1, dir), view_hview[0] - ammoy + lengthdir_y(1, dir), ammostring, 1, 1, lengthdir_x(2, dir * 1.34),
    color1,color1,color1,color1,1
)
    //  front      //
if ammoy > -32 draw_text_transformed_colour(
    18 + string_width(ammostring) * 0.5 + lengthdir_x(1, dir - 180),view_hview[0] - ammoy + lengthdir_y(1, dir - 180), ammostring, 1, 1, lengthdir_x(2, dir * 1.34 - 10),
    color2,color2,color2,color2,1
)

//   -    SCORE      -    //
if update = 0 draw_set_font(fntScore) else {draw_set_color(c_white) draw_set_font(fntScoreUpdate)}
    //  rectangle   //
draw_rectangle_colour(
    view_wview[0]-18-string_width(scorestring)-6,8,view_wview[0],32,
    c_black,c_black,c_black,c_black,0
)
    //  shadow      //
draw_text_transformed_colour(
    view_wview[0] - 18 - string_width(scorestring) * 0.5 + lengthdir_x(1, dir), 20 + lengthdir_y(1, dir), scorestring, 1, 1, lengthdir_x(2, dir * 1.34),
    color1,color1,color1,color1,1
)
    //  front      //
draw_text_transformed_colour(
    view_wview[0] - 18 - string_width(scorestring) * 0.5 + lengthdir_x(1, dir - 180), 20 + lengthdir_y(1, dir - 180), scorestring, 1, 1, lengthdir_x(2, dir * 1.34 - 10),
    color2,color2,color2,color2,1
)

if global.devmode=1 {
  scrDevTxt(32,16,"Developer mode on")
  scrDevTxt(32,32,string(fps)+"fps") 
}
