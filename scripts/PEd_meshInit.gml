/// PEd_meshInit()
/**
 * @brief Initializes mesh functionality.
 */
// Create default vertex buffer format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_textcoord();
global.pedVBufferFormat = vertex_format_end();
