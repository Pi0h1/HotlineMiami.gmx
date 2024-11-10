/// PEd_start3D()
/**
 * @brief Starts 3D mode.
 */
viewLastX = view_xview[0];
viewLastY = view_yview[0];
global.pedUsing3D = true;
d3d_start();
d3d_set_culling(true);
d3d_set_hidden(true);
d3d_set_lighting(global.pedLighting);
draw_set_color(c_white);
