/// PEd_meshCreate()
/**
 * @brief Creates an empty mesh.
 * @return {real} The id of the created mesh.
 */
var _mesh = ds_map_create();
ds_map_add_list(_mesh, "vertex", ds_list_create());
ds_map_add_list(_mesh, "normal", ds_list_create());
ds_map_add_list(_mesh, "texture", ds_list_create());
ds_map_add_list(_mesh, "face", ds_list_create());
return _mesh;
