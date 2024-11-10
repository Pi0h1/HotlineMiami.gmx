/// PEd_meshToModelD3D(mesh)
/**
 * @brief Creates a d3d_model from the mesh.
 * @param {real} mesh The id of the mesh.
 * @return {real} The id of the model on success or noone on fail.
 */
var _mesh    = argument0;
var _vertex  = _mesh[? "vertex"];
var _normal  = _mesh[? "normal"];
var _texture = _mesh[? "texture"];
var _face    = _mesh[? "face"];
var _model   = d3d_model_create();

d3d_model_primitive_begin(_model, pr_trianglelist);

var _size = ds_list_size(_face);
var i = 0;
while (i < _size)
{
    var v = _face[| i++];
    var n = _face[| i++];
    var t = _face[| i++];
    
    d3d_model_vertex_normal_texture(_model,
        _vertex[| v], _vertex[| v + 1], _vertex[| v + 2],
        _normal[| n], _normal[| n + 1], _normal[| n + 2],
        _texture[| t], _texture[| t + 1]);
}

d3d_model_primitive_end(_model);

return _model;
