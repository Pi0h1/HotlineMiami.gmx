/// PEd_meshToVBuffer(mesh)
/**
 * @brief Creates a vertex buffer from the mesh.
 * @param {real} mesh The id of the mesh.
 * @return {real} The id of the vertex buffer on success or noone on fail.
 */
var _mesh    = argument0;
var _vertex  = _mesh[? "vertex"];
var _normal  = _mesh[? "normal"];
var _texture = _mesh[? "texture"];
var _face    = _mesh[? "face"];
var _vBuffer = vertex_create_buffer();

vertex_begin(_vBuffer, global.pedVBufferFormat);

var _size = ds_list_size(_face);
var i = 0;
while (i < _size)
{
    var v = _face[| i++];
    vertex_position_3d(_vBuffer, _vertex[| v], _vertex[| v + 1], _vertex[| v + 2]);
    
    var n = _face[| i++];
    vertex_normal(_vBuffer, _normal[| n], _normal[| n + 1], _normal[| n + 2]);
    
    var t = _face[| i++];
    vertex_texcoord(_vBuffer, _texture[| t], _texture[| t + 1]);
}

vertex_end(_vBuffer);
vertex_freeze(_vBuffer);

return _vBuffer;
