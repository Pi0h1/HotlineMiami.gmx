/// PEd_end3D()
/**
 * @brief Ends 3D mode.
 */
global.pedUsing3D = false;
d3d_set_culling(false);
d3d_end();
view_xview[0] = viewLastX;
view_yview[0] = viewLastY;
