/// PEd_meshLoadFromObj(file)
/**
 * @brief Loads a 3D model data into a ds_map from the *.obj file.
 * @param {string} file The path to the file.
 * @return {real} The id of the mesh on success or noone on fail.
 */
var _file = file_text_open_read(argument0);
if (_file == -1)
    return noone;

// Create mesh structure
var _mesh    = PEd_meshCreate();
var _vertex  = _mesh[? "vertex"];
var _normal  = _mesh[? "normal"];
var _texture = _mesh[? "texture"];
var _face    = _mesh[? "face"];

// Laod mesh data
while (!file_text_eof(_file))
{
    var _line  = file_text_read_string(_file);          // Read line
    var _split = PEd_stringSplitOnFirst(_line, " ");    // Read first word
    _line = _split[1];                                  // Delete the word from the line
    var _id = _split[0];                                // Identifier
    
    switch (_id)
    {
        // Vertex
        case "v":
            _split = PEd_stringSplitOnFirst(_line, " "); 
            ds_list_add(_vertex, real(_split[0]));
            
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            ds_list_add(_vertex, real(_split[0]));
            
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            ds_list_add(_vertex, real(_split[0]));
            break;
        
        // Vertex normal
        case "vn":
            _split = PEd_stringSplitOnFirst(_line, " "); 
            ds_list_add(_normal, real(_split[0]));
            
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            ds_list_add(_normal, real(_split[0]));
            
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            ds_list_add(_normal, real(_split[0]));
            break;
        
        // Vertex texture coordinate
        case "vt":
            _split = PEd_stringSplitOnFirst(_line, " "); 
            ds_list_add(_texture, real(_split[0]));
            
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            ds_list_add(_texture, real(_split[0]));
            break;
        
        // Face
        case "f":
            var _f; _f[2] = "";
            _split = PEd_stringSplitOnFirst(_line, " "); 
            _f[0] = _split[0];
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            _f[1] = _split[0];
            _split = PEd_stringSplitOnFirst(_split[1], " "); 
            _f[2] = _split[0];
            
            for (var i = 0; i < 3; i++)
            {
                _split = PEd_stringSplitOnFirst(_f[i], "/");
                var v = (real(_split[0]) - 1) * 3;
                _split = PEd_stringSplitOnFirst(_split[1], "/");
                var t = (real(_split[0]) - 1) * 2;
                _split = PEd_stringSplitOnFirst(_split[1], "/");
                var n = (real(_split[0]) - 1) * 3;
                    
                ds_list_add(_face, v, n, t);
            }
            break;
    }
    
    file_text_readln(_file);
}
file_text_close(_file);

return _mesh;
